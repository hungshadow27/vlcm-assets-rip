package com.zcp.manager
{
   import com.zcp.common.drag.DragType;
   import com.zcp.common.drag.vo.DragData;
   import com.zcp.common.handler.helper.HandlerHelper;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import gs.TweenMax;
   
   public class DragManager
   {
      
      private static var _stage:Stage;
      
      private static var _dragArr:Array = [];
      
      private static var TEvent:Class = MouseEvent;
      
      public function DragManager()
      {
         super();
         throw new Event("静态类");
      }
      
      public static function addDrag(param1:DragData) : void
      {
         var _loc2_:DragData = null;
         var _loc3_:Point = null;
         if(!param1)
         {
            return;
         }
         if(!param1.isValid())
         {
            return;
         }
         if(param1.touchRect)
         {
            _loc3_ = param1.dobj.globalToLocal(param1.dobj.parent.localToGlobal(param1.guiderStartPoint));
            if(!param1.touchRect.containsPoint(_loc3_))
            {
               return;
            }
         }
         for each(_loc2_ in _dragArr)
         {
            if(_loc2_.equal(param1))
            {
               return;
            }
            if(_loc2_.guiderID == param1.guiderID)
            {
               removeDrag(_loc2_);
               break;
            }
         }
         if(param1.face != param1.dobj)
         {
            param1.dobj.parent.addChild(param1.face);
            if(param1.type == DragType.DROP)
            {
               param1.dobj.visible = false;
            }
         }
         param1.dobj.mouseEnabled = false;
         _dragArr[_dragArr.length] = param1;
         ZLog.add("DragManager::addDrag()::_dragArr.length:" + _dragArr.length);
         if(_dragArr.length == 1)
         {
            _stage = param1.stage;
            EventManager.addEvent(Event.ENTER_FRAME,update,_stage);
            EventManager.addEvent(TEvent.MOUSE_UP,mouseUpHandle,_stage,false,0,true);
         }
      }
      
      public static function removeDragByGuiderID(param1:int) : DragData
      {
         var _loc2_:DragData = null;
         for each(_loc2_ in _dragArr)
         {
            if(_loc2_.guiderID == param1)
            {
               removeDrag(_loc2_);
               return _loc2_;
            }
         }
         return null;
      }
      
      public static function removeDrag(param1:DragData) : void
      {
         if(!param1)
         {
            return;
         }
         if(param1.type == DragType.DROP)
         {
            doTween(param1);
         }
         param1.face.alpha = param1.dobjStartAlpha;
         var _loc2_:int = _dragArr.indexOf(param1);
         if(_loc2_ != -1)
         {
            _dragArr.splice(_loc2_,1);
            ZLog.add("DragManager::removeDrag()::_dragArr.length:" + _dragArr.length);
         }
      }
      
      public static function removeAllDrags() : void
      {
         var _loc1_:DragData = null;
         for each(_loc1_ in _dragArr)
         {
            if(_loc1_.type == DragType.DROP)
            {
               doTween(_loc1_);
            }
            _loc1_.face.alpha = _loc1_.dobjStartAlpha;
         }
         _dragArr = [];
         ZLog.add("DragManager::removeAllDrags()::_dragArr.length:0");
      }
      
      private static function update(param1:Event) : void
      {
         var _loc2_:Point = null;
         var _loc3_:DragData = null;
         for each(_loc3_ in _dragArr)
         {
            if(Fun.isParentChild(_loc3_.stage,_loc3_.dobj))
            {
               if(_loc3_.guiderID == -1)
               {
                  _loc2_ = _loc3_.dobj.parent.globalToLocal(new Point(_loc3_.stage.mouseX,_loc3_.stage.mouseY));
               }
               if(_loc2_)
               {
                  if(Point.distance(_loc2_,_loc3_.guiderStartPoint) > _loc3_.criticalDis)
                  {
                     _loc3_.canMove = true;
                  }
                  if(_loc3_.canMove)
                  {
                     setPos(_loc3_.face,_loc2_,_loc3_);
                     _loc3_.face.alpha = _loc3_.alpha;
                  }
               }
            }
            else
            {
               removeDrag(_loc3_);
            }
         }
         if(_dragArr.length == 0)
         {
            EventManager.removeEvent(Event.ENTER_FRAME,update,_stage);
            EventManager.removeEvent(TEvent.MOUSE_UP,mouseUpHandle,_stage,false);
         }
      }
      
      private static function setPos(param1:DisplayObject, param2:Point, param3:DragData) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(!param1 || !param3)
         {
            return;
         }
         _loc4_ = param3.dobjStartPoint.x + (param2.x - param3.guiderStartPoint.x);
         _loc5_ = param3.dobjStartPoint.y + (param2.y - param3.guiderStartPoint.y);
         if(param3.xyRect)
         {
            if(_loc4_ < param3.xyRect.x)
            {
               _loc4_ = param3.xyRect.x;
            }
            if(_loc4_ > param3.xyRect.x + param3.xyRect.width)
            {
               _loc4_ = param3.xyRect.x + param3.xyRect.width;
            }
            if(_loc5_ < param3.xyRect.y)
            {
               _loc5_ = param3.xyRect.y;
            }
            if(_loc5_ > param3.xyRect.y + param3.xyRect.height)
            {
               _loc5_ = param3.xyRect.y + param3.xyRect.height;
            }
         }
         param1.x = _loc4_;
         param1.y = _loc5_;
      }
      
      private static function mouseUpHandle(param1:* = null) : void
      {
         var stageXY:Point;
         var dropToTarget:InteractiveObject = null;
         var arr:Array = null;
         var iObj:InteractiveObject = null;
         var item:DisplayObject = null;
         var e:* = param1;
         var eID:int = e is MouseEvent ? -1 : int(e.ID);
         var dragData:DragData = DragManager.removeDragByGuiderID(eID);
         if(!dragData)
         {
            return;
         }
         stageXY = new Point(e.stageX,e.stageY);
         if(dragData.type == DragType.DRAG)
         {
            if(dragData.face != dragData.dobj && Boolean(dragData.face.parent))
            {
               dragData.face.parent.removeChild(dragData.face);
            }
            if(dragData.canMove)
            {
               setPos(dragData.dobj,dragData.dobj.parent.globalToLocal(stageXY),dragData);
            }
            dragData.dobj.mouseEnabled = true;
         }
         else if(dragData.type == DragType.DROP)
         {
            arr = dragData.stage.getObjectsUnderPoint(stageXY);
            for each(item in arr)
            {
               iObj = item as InteractiveObject;
               if(Boolean(iObj) && iObj.mouseEnabled)
               {
                  dropToTarget = iObj;
                  break;
               }
            }
            if(Boolean(dropToTarget) && dropToTarget.hasOwnProperty("dropIn"))
            {
               try
               {
                  (dropToTarget as Object).dropIn(dragData.data);
                  TweenMax.killTweensOf(dragData.face,true);
               }
               catch(e:Error)
               {
               }
            }
         }
         if(dragData.onComplete != null)
         {
            HandlerHelper.execute(dragData.onComplete,dragData.onCompleteParameters);
         }
      }
      
      private static function doTween(param1:DragData, param2:Number = 0.2) : void
      {
         var $dragData:DragData = param1;
         var $duration:Number = param2;
         if(!$dragData)
         {
            return;
         }
         if(!$dragData.isValid())
         {
            return;
         }
         if($dragData.type != DragType.DROP)
         {
            return;
         }
         try
         {
            TweenMax.to($dragData.face,$duration,{
               "x":$dragData.dobjStartPoint.x,
               "y":$dragData.dobjStartPoint.y,
               "onComplete":tweenComplete,
               "onCompleteParams":[$dragData]
            });
         }
         catch(e:Error)
         {
            $dragData.face.x = $dragData.dobjStartPoint.x;
            $dragData.face.y = $dragData.dobjStartPoint.y;
            tweenComplete($dragData);
         }
      }
      
      private static function tweenComplete(param1:DragData) : void
      {
         if(!param1)
         {
            return;
         }
         if(!param1.isValid())
         {
            return;
         }
         if(param1.type != DragType.DROP)
         {
            return;
         }
         if(param1.face != param1.dobj && Boolean(param1.face.parent))
         {
            param1.face.parent.removeChild(param1.face);
         }
         param1.dobj.x = param1.dobjStartPoint.x;
         param1.dobj.y = param1.dobjStartPoint.y;
         param1.dobj.alpha = param1.dobjStartAlpha;
         param1.dobj.mouseEnabled = true;
         param1.dobj.visible = true;
      }
   }
}

