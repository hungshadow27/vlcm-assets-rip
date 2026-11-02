package com.tgame.common.vo.character.info
{
   import com.tgame.common.staticdata.GirlFightStatus;
   import com.tgame.common.vo.character.PureGirl;
   
   public class GirlInfo
   {
      
      public var girlArr:Array = [];
      
      public var selectedGirlID:int = -1;
      
      public var currentFightGirlID:int = -1;
      
      public function GirlInfo()
      {
         super();
      }
      
      public function get selectedGirl() : PureGirl
      {
         if(this.selectedGirlID == -1)
         {
            return null;
         }
         return this.getGirl(this.selectedGirlID);
      }
      
      public function get currentFightGirl() : PureGirl
      {
         if(this.currentFightGirlID == -1)
         {
            return null;
         }
         return this.getGirl(this.currentFightGirlID);
      }
      
      public function init(param1:Array) : void
      {
         var _loc4_:PureGirl = null;
         var _loc2_:int = -1;
         var _loc3_:int = -1;
         for each(_loc4_ in param1)
         {
            if(_loc4_.id == this.selectedGirlID)
            {
               _loc2_ = _loc4_.id;
            }
            if(_loc4_.fightStatus == GirlFightStatus.SHOW)
            {
               _loc3_ = _loc4_.id;
            }
         }
         this.selectedGirlID = _loc2_;
         this.currentFightGirlID = _loc3_;
         this.girlArr = param1;
      }
      
      public function setGirlFightStatus(param1:int, param2:int) : void
      {
         var _loc3_:PureGirl = null;
         if(param2 == GirlFightStatus.REST)
         {
            _loc3_ = this.getGirl(param1);
            if(_loc3_ != null)
            {
               _loc3_.fightStatus = param2;
            }
            if(this.currentFightGirlID == param1)
            {
               this.currentFightGirlID = -1;
            }
            return;
         }
         if(param2 == GirlFightStatus.SHOW)
         {
            for each(_loc3_ in this.girlArr)
            {
               if(_loc3_.id == param1)
               {
                  _loc3_.fightStatus = param2;
               }
               else if(_loc3_.fightStatus == param2)
               {
                  _loc3_.fightStatus = GirlFightStatus.REST;
               }
            }
            this.currentFightGirlID = param1;
         }
      }
      
      public function getGirl(param1:int) : PureGirl
      {
         var _loc2_:PureGirl = null;
         for each(_loc2_ in this.girlArr)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function hasShowGirl() : Boolean
      {
         var _loc1_:PureGirl = null;
         for each(_loc1_ in this.girlArr)
         {
            if(_loc1_.fightStatus == GirlFightStatus.SHOW)
            {
               return true;
            }
         }
         return false;
      }
   }
}

