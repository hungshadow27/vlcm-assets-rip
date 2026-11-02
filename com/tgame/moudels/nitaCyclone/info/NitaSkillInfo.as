package com.tgame.moudels.nitaCyclone.info
{
   import com.tgame.common.vo.item.Skill;
   import flash.utils.IDataInput;
   
   public class NitaSkillInfo
   {
      
      public var curtNitaID:uint;
      
      public var skillList:Array = [];
      
      public function NitaSkillInfo(param1:IDataInput)
      {
         var _loc2_:int = 0;
         var _loc3_:uint = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Skill = null;
         super();
         if(param1)
         {
            this.curtNitaID = param1.readByte();
            _loc2_ = param1.readByte();
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = param1.readInt();
               _loc5_ = param1.readByte();
               _loc6_ = new Skill(_loc4_);
               _loc6_.isDanTian = 1;
               _loc6_.level = 1;
               _loc6_.isLearn = _loc5_;
               this.skillList.push(_loc6_);
               _loc3_++;
            }
         }
      }
   }
}

