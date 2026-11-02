package com.tgame.manager
{
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Buff;
   import com.zcp.engine.SceneCharacter;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class CustomFaceManager
   {
      
      private static const BUFF_CONTAINER_NAME:String = "BUFF_CONTAINER_NAME";
      
      private static const BUFF_CONTAINER_POS:Point = new Point(0,-20);
      
      private static const BUFF_ICO_SPACE:Number = 2;
      
      private static const BUFF_FACE_WIDTH:Number = 20;
      
      private static const BUFF_FACE_HEIGHT:Number = 20;
      
      public function CustomFaceManager()
      {
         super();
      }
      
      public static function getBuffFace(param1:SceneCharacter, param2:int) : ItemFace
      {
         var _loc4_:ItemFace = null;
         if(param1 == null || !param1.usable || !param1.useContainer)
         {
            return null;
         }
         var _loc3_:Sprite = param1.getCustomFaceByName(BUFF_CONTAINER_NAME) as Sprite;
         if(_loc3_ != null)
         {
            return _loc3_.getChildByName(param2.toString()) as ItemFace;
         }
         return null;
      }
      
      public static function addBuffFace(param1:SceneCharacter, param2:Buff) : void
      {
         var _loc3_:Sprite = null;
         var _loc4_:ItemFace = null;
         if(param1 == null || !param1.usable)
         {
            return;
         }
         if(param1.useContainer)
         {
            _loc3_ = param1.getCustomFaceByName(BUFF_CONTAINER_NAME) as Sprite;
         }
         if(_loc3_ == null)
         {
            _loc3_ = new Sprite();
            _loc3_.name = BUFF_CONTAINER_NAME;
            _loc3_.y = BUFF_CONTAINER_POS.y;
            param1.addCustomFace(_loc3_);
         }
         _loc4_ = new ItemFace(param2,BUFF_FACE_WIDTH,BUFF_FACE_HEIGHT);
         _loc4_.name = param2.id.toString();
         _loc4_.x = _loc3_.numChildren * (BUFF_FACE_WIDTH + BUFF_ICO_SPACE);
         _loc4_.y = -BUFF_FACE_HEIGHT / 2;
         _loc3_.addChild(_loc4_);
         var _loc5_:Number = _loc3_.numChildren * (BUFF_FACE_WIDTH + BUFF_ICO_SPACE) - BUFF_ICO_SPACE;
         _loc3_.x = BUFF_CONTAINER_POS.x - _loc5_ / 2;
      }
      
      public static function removeBuffFace(param1:SceneCharacter, param2:int) : void
      {
         var _loc4_:ItemFace = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         if(param1 == null || !param1.usable || !param1.useContainer)
         {
            return;
         }
         var _loc3_:Sprite = param1.getCustomFaceByName(BUFF_CONTAINER_NAME) as Sprite;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.getChildByName(param2.toString()) as ItemFace;
            if(_loc4_ != null)
            {
               _loc3_.removeChild(_loc4_);
               _loc5_ = _loc3_.numChildren;
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  _loc4_ = _loc3_.getChildAt(_loc6_) as ItemFace;
                  _loc4_.x = _loc6_ * (BUFF_FACE_WIDTH + BUFF_ICO_SPACE);
                  _loc6_++;
               }
               _loc7_ = _loc3_.numChildren * (BUFF_FACE_WIDTH + BUFF_ICO_SPACE) - BUFF_ICO_SPACE;
               _loc3_.x = BUFF_CONTAINER_POS.x - _loc7_ / 2;
            }
         }
      }
      
      public static function removeAllBuffFace(param1:SceneCharacter) : void
      {
         if(param1 == null || !param1.usable || !param1.useContainer)
         {
            return;
         }
         var _loc2_:Sprite = param1.getCustomFaceByName(BUFF_CONTAINER_NAME) as Sprite;
         if(_loc2_ != null)
         {
            while(_loc2_.numChildren > 0)
            {
               _loc2_.removeChildAt(0);
            }
         }
      }
   }
}

