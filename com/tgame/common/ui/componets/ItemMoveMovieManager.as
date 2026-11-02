package com.tgame.common.ui.componets
{
   import com.fireice.util.Tools;
   import flash.display.DisplayObject;
   import gs.TweenMax;
   
   public class ItemMoveMovieManager
   {
      
      public function ItemMoveMovieManager()
      {
         super();
      }
      
      public static function move(param1:DisplayObject, param2:int, param3:int, param4:int, param5:int, param6:int = 1000, param7:int = 2000, param8:int = 0) : void
      {
         var onCom:Function = null;
         var onCom1:Function = null;
         var obj:DisplayObject = param1;
         var startX:int = param2;
         var startY:int = param3;
         var endX:int = param4;
         var endY:int = param5;
         var moveTime:int = param6;
         var disappearTime:int = param7;
         var delayTime:int = param8;
         onCom = function():void
         {
            TweenMax.to(obj,disappearTime,{
               "alpha":0,
               "onComplete":onCom1
            });
         };
         onCom1 = function():void
         {
            if(Boolean(obj) && Boolean(obj.parent))
            {
               obj.parent.removeChild(obj);
               obj = null;
            }
         };
         Tools.currentStage.addChild(obj);
         obj.x = startX;
         obj.y = startY;
         TweenMax.to(obj,moveTime,{
            "x":endX,
            "y":endY,
            "delay":delayTime,
            "onComplete":onCom
         });
      }
   }
}

