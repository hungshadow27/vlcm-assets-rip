package com.tgame.shell.view.components.utils
{
   import com.tgame.common.GameInstance;
   import com.tgame.shell.view.components.utils.tooltip.DefaultTooltip;
   import com.zcp.common.log.ZLog;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class TipManager
   {
      
      private static var _defaultTooltip:DefaultTooltip;
      
      private static var _currenctTooltip:ITooltip;
      
      private static var _tipsObjDic:Dictionary = new Dictionary();
      
      public function TipManager()
      {
         super();
      }
      
      public static function showTip(param1:String, param2:Class = null) : void
      {
         if(!param2)
         {
            currenctTooltip = defaultTooltip;
         }
         else
         {
            currenctTooltip = new param2();
         }
         currenctTooltip.htmlText = param1;
         var _loc3_:Point = getPos();
         currenctTooltip.x = _loc3_.x;
         currenctTooltip.y = _loc3_.y;
         var _loc4_:Stage = GameInstance.stage;
         _loc4_.addChild(child);
         child.addEventListener(Event.ENTER_FRAME,onMove);
      }
      
      public static function showTipChild(param1:ITooltip) : void
      {
         currenctTooltip = param1;
         var _loc2_:Stage = GameInstance.stage;
         var _loc3_:Point = getPos();
         currenctTooltip.x = _loc3_.x;
         currenctTooltip.y = _loc3_.y;
         _loc2_.addChild(child);
         child.addEventListener(Event.ENTER_FRAME,onMove);
      }
      
      public static function hideTip() : void
      {
         if(!currenctTooltip || !child.stage)
         {
            return;
         }
         child.parent.removeChild(child);
         child.removeEventListener(Event.ENTER_FRAME,onMove);
      }
      
      private static function onMove(param1:Event) : void
      {
         var _loc2_:Point = getPos();
         currenctTooltip.x += (_loc2_.x - currenctTooltip.x) / 5;
         currenctTooltip.y += (_loc2_.y - currenctTooltip.y) / 5;
         var _loc3_:Stage = GameInstance.stage;
         currenctTooltip.x = Math.max(0,currenctTooltip.x);
         currenctTooltip.y = Math.max(0,currenctTooltip.y);
         currenctTooltip.x = Math.min(_loc3_.stageWidth - currenctTooltip.width,currenctTooltip.x);
         currenctTooltip.y = Math.min(_loc3_.stageHeight - currenctTooltip.height,currenctTooltip.y);
      }
      
      private static function getPos() : Point
      {
         var _loc1_:Stage = GameInstance.stage;
         var _loc2_:Number = _loc1_.mouseX + 15;
         if(currenctTooltip.width + _loc2_ > _loc1_.stageWidth)
         {
            _loc2_ = _loc1_.mouseX - currenctTooltip.width - 15;
         }
         var _loc3_:Number = _loc1_.mouseY + 25;
         if(currenctTooltip.height + _loc3_ > _loc1_.stageHeight)
         {
            _loc3_ = _loc1_.mouseY - currenctTooltip.height - 15;
         }
         return new Point(_loc2_,_loc3_);
      }
      
      private static function get child() : DisplayObject
      {
         if(!currenctTooltip)
         {
            return null;
         }
         return currenctTooltip as DisplayObject;
      }
      
      private static function get defaultTooltip() : DefaultTooltip
      {
         if(!_defaultTooltip)
         {
            _defaultTooltip = new DefaultTooltip();
         }
         return _defaultTooltip;
      }
      
      public static function get currenctTooltip() : ITooltip
      {
         return _currenctTooltip;
      }
      
      public static function set currenctTooltip(param1:ITooltip) : void
      {
         var _loc2_:DisplayObjectContainer = null;
         _currenctTooltip = param1;
         if(_currenctTooltip is DisplayObjectContainer)
         {
            _loc2_ = _currenctTooltip as DisplayObjectContainer;
            _loc2_.mouseChildren = _loc2_.mouseEnabled = false;
         }
      }
      
      public static function regObj2HasTips(param1:DisplayObject, param2:*, param3:Boolean = false, param4:Function = null) : void
      {
         if(param2 == "..remove..")
         {
            if(_tipsObjDic[param1])
            {
               hideTip();
               remove(null,param1 as DisplayObject);
            }
            return;
         }
         if(_tipsObjDic.hasOwnProperty(param1))
         {
            return;
         }
         _tipsObjDic[param1] = {
            "value":param2,
            "dispose":param3,
            "callBack":param4
         };
         param1.addEventListener(MouseEvent.MOUSE_OVER,onOver);
         param1.addEventListener(MouseEvent.ROLL_OUT,onOut);
         if(param3)
         {
            param1.addEventListener(Event.REMOVED_FROM_STAGE,remove);
         }
      }
      
      private static function remove(param1:Event, param2:DisplayObject = null) : void
      {
         var _loc3_:DisplayObject = param1 ? param1.target as DisplayObject : param2;
         var _loc4_:Object = _tipsObjDic[_loc3_];
         if(_loc4_)
         {
            _loc3_.removeEventListener(MouseEvent.MOUSE_OVER,onOver);
            _loc3_.removeEventListener(MouseEvent.ROLL_OUT,onOut);
            _loc3_.removeEventListener(Event.REMOVED_FROM_STAGE,remove);
            delete _tipsObjDic[_loc3_];
         }
      }
      
      private static function onOut(param1:Event) : void
      {
         hideTip();
      }
      
      private static function onOver(param1:Event) : void
      {
         var _loc7_:* = undefined;
         hideTip();
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         var _loc3_:DisplayObject = param1.currentTarget as DisplayObject;
         var _loc4_:Object = _tipsObjDic[_loc2_] || _tipsObjDic[_loc3_];
         if(!_loc4_)
         {
            ZLog.add(_loc2_ + ":没有注册，不会显示Tips!!!!!!");
            return;
         }
         var _loc5_:Function = _loc4_.callBack;
         var _loc6_:* = _loc4_.value;
         if(_loc5_ != null)
         {
            _loc7_ = _loc5_(_loc2_);
            overShowTip(_loc7_);
         }
         else
         {
            overShowTip(_loc6_);
         }
      }
      
      private static function overShowTip(param1:*) : void
      {
         if(param1 is ITooltip)
         {
            showTipChild(param1);
         }
         else if(param1 is String)
         {
            showTip(String(param1));
         }
      }
   }
}

