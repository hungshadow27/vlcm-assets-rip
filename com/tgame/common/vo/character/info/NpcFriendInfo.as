package com.tgame.common.vo.character.info
{
   import com.tgame.common.staticdata.MountFightStatus;
   import com.tgame.common.vo.character.PureNpcFriend;
   
   public class NpcFriendInfo
   {
      
      public var npcFriendArr:Array = [];
      
      public var currentFightNpcFriendID:int = -1;
      
      public function NpcFriendInfo()
      {
         super();
      }
      
      public function get currentFightNpcFriend() : PureNpcFriend
      {
         if(this.currentFightNpcFriendID == -1)
         {
            return null;
         }
         return this.getNpcFriend(this.currentFightNpcFriendID);
      }
      
      public function init(param1:Array) : void
      {
         var _loc3_:PureNpcFriend = null;
         var _loc2_:int = -1;
         for each(_loc3_ in param1)
         {
            if(_loc3_.fightStatus == MountFightStatus.SHOW)
            {
               _loc2_ = _loc3_.id;
            }
         }
         this.currentFightNpcFriendID = _loc2_;
         this.npcFriendArr = param1;
      }
      
      public function setNpcFriendFightStatus(param1:int, param2:int) : void
      {
         var _loc3_:PureNpcFriend = null;
         if(param2 == MountFightStatus.REST)
         {
            _loc3_ = this.getNpcFriend(param1);
            if(_loc3_ != null)
            {
               _loc3_.fightStatus = param2;
            }
            if(this.currentFightNpcFriendID == param1)
            {
               this.currentFightNpcFriendID = -1;
            }
            return;
         }
         if(param2 == MountFightStatus.SHOW)
         {
            for each(_loc3_ in this.npcFriendArr)
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
            this.currentFightNpcFriendID = param1;
         }
      }
      
      public function hasNpcFriend(param1:int) : Boolean
      {
         return this.getNpcFriend(param1) != null;
      }
      
      public function getNpcFriend(param1:int) : PureNpcFriend
      {
         var _loc2_:PureNpcFriend = null;
         for each(_loc2_ in this.npcFriendArr)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getNpcFriendsNum() : int
      {
         return this.npcFriendArr.length;
      }
      
      public function getNpcFriendArrByMID(param1:int, param2:Boolean = false) : Array
      {
         var _loc4_:PureNpcFriend = null;
         var _loc3_:Array = [];
         for each(_loc4_ in this.npcFriendArr)
         {
            if(_loc4_.res.id_kind == param1 && (!param2 || _loc4_.fightStatus == MountFightStatus.REST))
            {
               _loc3_.push(_loc4_);
            }
         }
         return _loc3_;
      }
      
      public function getNpcFriendNumByMID(param1:int, param2:Boolean = false) : int
      {
         var _loc4_:PureNpcFriend = null;
         var _loc3_:int = 0;
         for each(_loc4_ in this.npcFriendArr)
         {
            if(_loc4_.res.id_kind == param1 && (!param2 || _loc4_.fightStatus == MountFightStatus.REST))
            {
               _loc3_ += 1;
            }
         }
         return _loc3_;
      }
   }
}

