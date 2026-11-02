package com.tgame.common.vo.character.info
{
   import com.tgame.common.staticdata.MountFightStatus;
   import com.tgame.common.vo.character.PureMount;
   
   public class MountInfo
   {
      
      public var mountDepotSlot:int;
      
      public var mountArr:Array = [];
      
      public var dianFengMountArr:Array = [];
      
      public var mountDepotArray:Array = [];
      
      public var mountShopArray:Array = [];
      
      public var selectedMountID:int = -1;
      
      public var currentMountID:int = -1;
      
      public var currentFightMountID:int = -1;
      
      public function MountInfo()
      {
         super();
      }
      
      public function get selectedMount() : PureMount
      {
         if(this.selectedMountID == -1)
         {
            return null;
         }
         return this.getMount(this.selectedMountID);
      }
      
      public function get currentMount() : PureMount
      {
         if(this.currentMountID == -1)
         {
            return null;
         }
         return this.getMount(this.currentMountID);
      }
      
      public function get currentFightMount() : PureMount
      {
         if(this.currentFightMountID == -1)
         {
            return null;
         }
         return this.getMount(this.currentFightMountID);
      }
      
      public function init(param1:Array) : void
      {
         var _loc5_:PureMount = null;
         var _loc2_:int = -1;
         var _loc3_:int = -1;
         var _loc4_:int = -1;
         for each(_loc5_ in param1)
         {
            if(_loc5_.id == this.selectedMountID)
            {
               _loc2_ = _loc5_.id;
            }
            if(_loc5_.fightStatus == MountFightStatus.RIDE)
            {
               _loc3_ = _loc5_.id;
            }
            else if(_loc5_.fightStatus == MountFightStatus.SHOW)
            {
               _loc4_ = _loc5_.id;
            }
         }
         for each(_loc5_ in this.dianFengMountArr)
         {
            if(_loc5_.fightStatus == MountFightStatus.RIDE)
            {
               _loc3_ = _loc5_.id;
            }
            else if(_loc5_.fightStatus == MountFightStatus.SHOW)
            {
               _loc4_ = _loc5_.id;
            }
         }
         this.selectedMountID = _loc2_;
         this.currentMountID = _loc3_;
         this.currentFightMountID = _loc4_;
         this.mountArr = param1;
      }
      
      public function initDepot(param1:Array) : void
      {
         this.mountDepotArray = param1;
      }
      
      public function initShop(param1:Array) : void
      {
         this.mountShopArray = param1;
      }
      
      public function setMountFightStatus(param1:int, param2:int) : void
      {
         var _loc3_:PureMount = null;
         if(param2 == MountFightStatus.REST)
         {
            _loc3_ = this.getMount(param1);
            if(_loc3_ != null)
            {
               _loc3_.fightStatus = param2;
            }
            if(this.currentMountID == param1)
            {
               this.currentMountID = -1;
            }
            if(this.currentFightMountID == param1)
            {
               this.currentFightMountID = -1;
            }
            return;
         }
         if(param2 == MountFightStatus.RIDE)
         {
            for each(_loc3_ in this.mountArr)
            {
               if(_loc3_.id == param1)
               {
                  _loc3_.fightStatus = param2;
               }
               else if(_loc3_.fightStatus == param2)
               {
                  _loc3_.fightStatus = MountFightStatus.REST;
               }
            }
            this.currentMountID = param1;
            if(this.currentFightMountID == param1)
            {
               this.currentFightMountID = -1;
            }
         }
         else if(param2 == MountFightStatus.SHOW)
         {
            for each(_loc3_ in this.mountArr)
            {
               if(_loc3_.id == param1)
               {
                  _loc3_.fightStatus = param2;
               }
               else if(_loc3_.fightStatus == param2)
               {
                  _loc3_.fightStatus = MountFightStatus.REST;
               }
            }
            if(this.currentMountID == param1)
            {
               this.currentMountID = -1;
            }
            this.currentFightMountID = param1;
         }
      }
      
      public function hasMount(param1:int) : Boolean
      {
         return this.getMount(param1) != null;
      }
      
      public function getMount(param1:int) : PureMount
      {
         var _loc2_:PureMount = null;
         for each(_loc2_ in this.mountArr)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         for each(_loc2_ in this.dianFengMountArr)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getMountsNum() : int
      {
         return this.mountArr.length;
      }
      
      public function getMountArrByMID(param1:int, param2:Boolean = false) : Array
      {
         var _loc4_:PureMount = null;
         var _loc3_:Array = [];
         for each(_loc4_ in this.mountArr)
         {
            if(_loc4_.res.id_kind == param1 && (!param2 || _loc4_.fightStatus == MountFightStatus.REST))
            {
               _loc3_.push(_loc4_);
            }
         }
         return _loc3_;
      }
      
      public function getMountNumByMID(param1:int, param2:Boolean = false) : int
      {
         var _loc4_:PureMount = null;
         var _loc3_:int = 0;
         for each(_loc4_ in this.mountArr)
         {
            if(_loc4_.res.id_kind == param1 && (!param2 || _loc4_.fightStatus == MountFightStatus.REST))
            {
               _loc3_ += 1;
            }
         }
         return _loc3_;
      }
      
      public function hasRestMount() : Boolean
      {
         var _loc1_:PureMount = null;
         for each(_loc1_ in this.mountArr)
         {
            if(_loc1_.fightStatus == MountFightStatus.REST)
            {
               return true;
            }
         }
         return false;
      }
   }
}

