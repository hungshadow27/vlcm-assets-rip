package com.zcp.engine.vo.avatar
{
   public class AvatarPlayCallBack
   {
      
      public var onPlayBeforeStart:Function;
      
      public var onPlayStart:Function;
      
      public var onPlayUpdate:Function;
      
      public var onPlayComplete:Function;
      
      public var onAdd:Function;
      
      public var onRemove:Function;
      
      public function AvatarPlayCallBack()
      {
         super();
      }
      
      public function clone() : AvatarPlayCallBack
      {
         var _loc1_:AvatarPlayCallBack = new AvatarPlayCallBack();
         _loc1_.onPlayBeforeStart = this.onPlayBeforeStart;
         _loc1_.onPlayStart = this.onPlayStart;
         _loc1_.onPlayUpdate = this.onPlayUpdate;
         _loc1_.onPlayComplete = this.onPlayComplete;
         _loc1_.onAdd = this.onAdd;
         _loc1_.onRemove = this.onRemove;
         return _loc1_;
      }
   }
}

