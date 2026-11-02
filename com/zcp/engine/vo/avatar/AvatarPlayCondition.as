package com.zcp.engine.vo.avatar
{
   public class AvatarPlayCondition
   {
      
      public var playAtBegin:Boolean;
      
      public var stayAtEnd:Boolean;
      
      public var showEnd:Boolean;
      
      public var showXunhuan:Boolean;
      
      public var standStatus:String;
      
      public var attackStatus:String;
      
      public var mount_attackStatus:String;
      
      public function AvatarPlayCondition(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false)
      {
         super();
         this.playAtBegin = param1;
         this.stayAtEnd = param2;
         this.showEnd = param3;
         this.showXunhuan = param4;
      }
      
      public function clone() : AvatarPlayCondition
      {
         var _loc1_:AvatarPlayCondition = new AvatarPlayCondition(this.playAtBegin,this.stayAtEnd,this.showEnd,this.showXunhuan);
         _loc1_.standStatus = this.standStatus;
         _loc1_.attackStatus = this.attackStatus;
         _loc1_.mount_attackStatus = this.mount_attackStatus;
         return _loc1_;
      }
   }
}

