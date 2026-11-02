package com.tgame.common.ui.componets.rollText
{
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import gs.TweenLite;
   
   public class RollText
   {
      
      private static var _parent:DisplayObjectContainer;
      
      private static var _container:Sprite;
      
      private static var _callBack:Function;
      
      private static var MAX_WIDTH:Number = 200;
      
      private static var MARGIN:Number = 10;
      
      private static var SPEED:Number = 1;
      
      private static var MAX_CHILD:Number = 10;
      
      private static var _noticeArr:Array = [];
      
      private static var _isRunning:Boolean = false;
      
      private static var _hasInit:Boolean = false;
      
      public function RollText()
      {
         super();
         throw new Error("静态类");
      }
      
      public static function init(param1:DisplayObjectContainer, param2:Number, param3:Number = 0, param4:Number = 5, param5:Number = 1, param6:Number = 10, param7:Function = null) : void
      {
         _parent = param1;
         MAX_WIDTH = param2;
         MARGIN = param4;
         SPEED = param5;
         MAX_CHILD = param6;
         _callBack = param7;
         if(_container != null)
         {
            TweenLite.killTweensOf(_container);
            if(Boolean(_container) && Boolean(_container.parent))
            {
               _container.parent.removeChild(_container);
               _container = null;
            }
         }
         _container = new Sprite();
         _container.mouseEnabled = false;
         _container.mouseChildren = false;
         _container.x = MAX_WIDTH;
         _container.y = param3;
         _parent.addChild(_container);
         _hasInit = true;
      }
      
      public static function hasInit() : Boolean
      {
         return _hasInit;
      }
      
      public static function resetMaxWidth(param1:Number) : void
      {
         MAX_WIDTH = param1;
      }
      
      public static function pushText(param1:String, param2:int = 1) : void
      {
         if(!_hasInit)
         {
            return;
         }
         _noticeArr[_noticeArr.length] = new RollTextFace(param1,param2);
         if(!_isRunning)
         {
            go();
         }
      }
      
      private static function go() : void
      {
         var oldNum:int;
         var oldWidth:int;
         var oldX:int;
         var toX:Number = NaN;
         var dur:Number = NaN;
         var lastRemoveChild:DisplayObject = null;
         var num:Number = NaN;
         var i:int = 0;
         if(_noticeArr.length == 0)
         {
            toX = -_container.width;
            dur = Math.abs(_container.x - toX) * 0.01 / SPEED;
            TweenLite.to(_container,dur,{
               "x":toX,
               "ease":function(param1:Number, param2:Number, param3:Number, param4:Number):Number
               {
                  return param3 * param1 / param4 + param2;
               },
               "onComplete":onAllComplete
            });
            _isRunning = false;
            return;
         }
         TweenLite.killTweensOf(_container);
         _isRunning = true;
         if(_container.numChildren > MAX_CHILD)
         {
            do
            {
               lastRemoveChild = _container.removeChildAt(0);
            }
            while(_container.numChildren > MAX_CHILD);
            _container.x += lastRemoveChild.x + lastRemoveChild.width + MARGIN;
            num = _container.numChildren;
            i = 0;
            while(i < num)
            {
               _container.getChildAt(i).x = _container.getChildAt(i).x - (lastRemoveChild.x + lastRemoveChild.width + MARGIN);
               i++;
            }
         }
         oldNum = _container.numChildren;
         oldWidth = _container.width;
         oldX = _container.x;
         addShowObj(oldWidth > 0 ? MAX_WIDTH - oldX + MARGIN : 0);
         if(_container.numChildren > oldNum)
         {
            toX = _container.x - (_container.width - oldWidth);
            dur = Math.abs(_container.x - toX) * 0.01 / SPEED;
            TweenLite.to(_container,dur,{
               "x":toX,
               "ease":function(param1:Number, param2:Number, param3:Number, param4:Number):Number
               {
                  return param3 * param1 / param4 + param2;
               },
               "onComplete":go
            });
         }
         else
         {
            go();
         }
      }
      
      private static function onAllComplete() : void
      {
         Fun.clearChildren(_container);
         _container.x = MAX_WIDTH;
         if(_callBack != null)
         {
            _callBack();
         }
      }
      
      private static function addShowObj(param1:Number) : void
      {
         var _loc2_:RollTextFace = null;
         var _loc3_:RollTextFace = null;
         if(!_noticeArr || _noticeArr.length == 0)
         {
            return;
         }
         for each(_loc2_ in _noticeArr)
         {
            if(_loc2_.showCount >= _loc2_.maxShowCount)
            {
               _noticeArr.splice(_noticeArr.indexOf(_loc2_),1);
            }
            else
            {
               ++_loc2_.showCount;
               if(_container.numChildren == 0)
               {
                  _loc2_.x = param1;
               }
               else
               {
                  _loc3_ = _container.getChildAt(_container.numChildren - 1) as RollTextFace;
                  if(MAX_WIDTH - _container.x >= _loc3_.x + _loc3_.width + MARGIN)
                  {
                     _loc2_.x = MAX_WIDTH - _container.x;
                  }
                  else
                  {
                     _loc2_.x = _loc3_.x + _loc3_.width + MARGIN;
                  }
               }
               _container.addChild(_loc2_);
               if(_container.width - param1 >= MAX_WIDTH)
               {
                  return;
               }
            }
         }
         if(_container.width - param1 < MAX_WIDTH && _noticeArr.length > 0)
         {
            addShowObj(_container.width + MARGIN);
         }
      }
   }
}

