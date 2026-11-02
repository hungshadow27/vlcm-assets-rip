package com.zcp.engine.helper
{
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.avatar.AvatarPart;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.engine.vo.avatar.AvatarPlayCondition;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class SimpleAvatarSynthesizer
   {
      
      public function SimpleAvatarSynthesizer()
      {
         super();
      }
      
      public static function synthesisSimpleAvatar(param1:*, param2:Function, param3:Array, param4:int = 1, param5:String = "stand", param6:int = 0, param7:Number = 512, param8:Number = 512) : void
      {
         var totalNum:int = 0;
         var loadedNum:int = 0;
         var sc:SceneCharacter = null;
         var apd:AvatarParamData = null;
         var onAvatarPartAdd:Function = null;
         var $id:* = param1;
         var $callBack:Function = param2;
         var $apdArr:Array = param3;
         var $frame:int = param4;
         var $charStatus:String = param5;
         var $charLogicAngle:int = param6;
         var $maxBDWidth:Number = param7;
         var $maxBDHeight:Number = param8;
         onAvatarPartAdd = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
         {
            var _loc3_:BitmapData = null;
            var _loc4_:Rectangle = null;
            var _loc5_:BitmapData = null;
            ++loadedNum;
            if(loadedNum <= totalNum)
            {
               _loc3_ = new BitmapData($maxBDWidth,$maxBDHeight,true,0);
               sc.playTo($charStatus,$charLogicAngle,-1,new AvatarPlayCondition(true));
               sc.runAvatar($frame);
               sc.drawAvatar(_loc3_);
               _loc4_ = _loc3_.getColorBoundsRect(4278190080,0,false);
               _loc4_.x = 0;
               _loc4_.width = $maxBDWidth;
               if(_loc4_.width > 0 && _loc4_.height > 0)
               {
                  _loc5_ = new BitmapData(_loc4_.width,_loc4_.height,true,0);
                  _loc5_.copyPixels(_loc3_,_loc4_,new Point(0,0),null,null,true);
               }
               $callBack($id,_loc5_);
            }
            if(loadedNum == totalNum)
            {
               SceneCharacter.recycleSceneCharacter(sc);
            }
         };
         $frame = Math.max($frame - 1,0);
         totalNum = int($apdArr.length);
         loadedNum = 0;
         sc = SceneCharacter.createSceneCharacter(SceneCharacterType.PLAYER,null);
         for each(apd in $apdArr)
         {
            apd = apd.clone();
            apd.playCallBack = null;
            apd.useType = 0;
            apd.clearSameType = false;
            apd.extendCallBack(null,null,null,null,onAvatarPartAdd);
            sc.loadAvatarPart(apd);
         }
      }
   }
}

