package com.zcp.engine.helper
{
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.tagger.AttackFace;
   import com.zcp.engine.graphics.tagger.HeadFace;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import gs.TweenLite;
   
   public class TaggerHelper
   {
      
      private static var xDis:Number = 100;
      
      private static var yDis:Number = 70;
      
      private static var xyDis:Number = (xDis + yDis) / 2 * Math.cos(Math.PI / 4);
      
      private static var YDis:Number = 20;
      
      private static var duration:Number = 1.2;
      
      public function TaggerHelper()
      {
         super();
      }
      
      public static function showHeadFace(param1:SceneCharacter, param2:String = "", param3:uint = 16777215, param4:String = "", param5:DisplayObject = null, param6:DisplayObject = null, param7:Boolean = false, param8:DisplayObject = null, param9:DisplayObject = null, param10:Vector.<DisplayObject> = null) : void
      {
         var _loc11_:HeadFace = null;
         if(!param1.usable)
         {
            return;
         }
         param1.enableContainer(param1.scene.sceneHeadLayer);
         if(param1.headFace == null)
         {
            _loc11_ = HeadFace.createHeadFace(param2,param3,param4,param5,param6,param7,param8,param9,param10);
            param1.headFace = _loc11_;
            param1.showContainer.headFace = _loc11_;
            if(param1.scene.isAlwaysShowChar(param1) || param1.scene.getCharHeadVisible(param1.type))
            {
               param1.showContainer.showHeadFaceContainer();
            }
            else
            {
               param1.showContainer.hideHeadFaceContainer();
            }
         }
         else
         {
            _loc11_ = param1.headFace;
            _loc11_.reSet([param2,param3,param4,param5,param6,param7,param8,param9,param10]);
         }
         _loc11_.x = 0;
         var _loc12_:Rectangle = param1.mouseRect;
         _loc11_.y = _loc12_ != null ? _loc12_.y - param1.piexl_y - HeadFace.HEADFACE_SPACE : HeadFace.DEFAULT_HEADFACE_Y;
      }
      
      private static function myEaseOut(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 6) : Number
      {
         return param3 * ((param1 = param1 / param4 - 1) * param1 * ((param5 + 1) * param1 + param5) + 1) + param2;
      }
      
      public static function showAttackFace(param1:SceneCharacter, param2:String = "", param3:Number = 0, param4:String = "", param5:uint = 0, param6:uint = 0) : void
      {
         var mouseRect:Rectangle;
         var from:Point;
         var to:Point;
         var dir:int;
         var attackFace:AttackFace = null;
         var onComplete:Function = null;
         var $sc:SceneCharacter = param1;
         var $attackType:String = param2;
         var $attackValue:Number = param3;
         var $selfText:String = param4;
         var $selfFontSize:uint = param5;
         var $selfFontColor:uint = param6;
         onComplete = function():void
         {
            if(attackFace.parent)
            {
               attackFace.parent.removeChild(attackFace);
            }
            AttackFace.recycleAttackFace(attackFace);
         };
         if(!$sc.usable)
         {
            return;
         }
         if(!$sc.avatar.visible)
         {
            return;
         }
         $sc.enableContainer($sc.scene.sceneHeadLayer);
         attackFace = AttackFace.createAttackFace($attackType,$attackValue,$selfText,$selfFontSize,$selfFontColor);
         mouseRect = $sc.mouseRect;
         from = new Point(0,mouseRect != null ? mouseRect.y - $sc.piexl_y + YDis : -40 + YDis);
         to = from.clone();
         dir = attackFace.dir;
         if(dir == 2)
         {
            to.x = from.x - xDis;
         }
         else if(dir == 3)
         {
            to.x = from.x - xyDis;
            to.y = from.y - xyDis;
         }
         else if(dir == 6)
         {
            to.x = from.x + xDis;
         }
         else
         {
            to.y = from.y - yDis;
         }
         attackFace.x = from.x;
         attackFace.y = from.y;
         $sc.showContainer.showAttackFaceContainer();
         $sc.showContainer.attackFaceContainer.addChild(attackFace);
         TweenLite.to(attackFace,duration,{
            "x":to.x,
            "y":to.y,
            "onComplete":onComplete,
            "ease":myEaseOut
         });
      }
      
      public static function getCustomFaceByName(param1:SceneCharacter, param2:String) : DisplayObject
      {
         if(!param1.usable || !param1.useContainer)
         {
            return null;
         }
         return param1.showContainer.customFaceContainer.getChildByName(param2);
      }
      
      public static function addCustomFace(param1:SceneCharacter, param2:DisplayObject) : void
      {
         if(!param1.usable)
         {
            return;
         }
         param1.enableContainer(param1.scene.sceneHeadLayer);
         if(param1.avatar.visible)
         {
            param1.showContainer.showCustomFaceContainer();
         }
         else
         {
            param1.showContainer.hideCustomFaceContainer();
         }
         param1.showContainer.customFaceContainer.addChild(param2);
      }
      
      public static function removeCustomFace(param1:SceneCharacter, param2:DisplayObject) : void
      {
         if(!param1.usable || !param1.useContainer)
         {
            return;
         }
         if(param2.parent)
         {
            param2.parent.removeChild(param2);
         }
      }
      
      public static function removeCustomFaceByName(param1:SceneCharacter, param2:String) : void
      {
         if(!param1.usable || !param1.useContainer)
         {
            return;
         }
         var _loc3_:DisplayObject = param1.showContainer.customFaceContainer.getChildByName(param2);
         if(_loc3_ != null)
         {
            param1.showContainer.customFaceContainer.removeChild(_loc3_);
         }
      }
   }
}

