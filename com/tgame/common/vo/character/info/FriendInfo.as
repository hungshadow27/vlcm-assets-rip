package com.tgame.common.vo.character.info
{
   import com.tgame.common.vo.character.PurePlayer;
   
   public class FriendInfo
   {
      
      public static const minHateValue:int = -100000;
      
      public var friends:Array = [];
      
      public var friendsReady:Boolean = false;
      
      public var tempFriends:Array = [];
      
      public var enemies:Array = [];
      
      public var blacklist:Array = [];
      
      public var shiTulist:Array = [];
      
      public var myFace:String;
      
      public var myFaceText:String;
      
      public var myWife:PurePlayer;
      
      public function FriendInfo()
      {
         super();
      }
      
      public function updateFriends(param1:int, param2:int = -1, param3:int = -1, param4:int = -1) : void
      {
         var _loc5_:PurePlayer = this.getFriendByID(param1);
         if(_loc5_)
         {
            if(param2 != -1)
            {
               _loc5_.favor = param2;
            }
            if(param4 != -1)
            {
               _loc5_.specialAct = param4;
            }
            if(param3 != -1)
            {
               if(_loc5_.lineserver != param3)
               {
                  if(param3 <= 0)
                  {
                     _loc5_.specialAct = 0;
                  }
               }
               _loc5_.lineserver = param3;
            }
            this.friends.sortOn(["favor","lineserver"],[Array.NUMERIC | Array.DESCENDING,Array.NUMERIC | Array.DESCENDING]);
         }
      }
      
      public function insertFriends(param1:PurePlayer) : void
      {
         var _loc2_:PurePlayer = this.getFriendByID(param1.id);
         if(_loc2_)
         {
            _loc2_ = param1;
         }
         else
         {
            this.friends.push(param1);
         }
         this.friends.sortOn(["favor","lineserver"],[Array.NUMERIC | Array.DESCENDING,Array.NUMERIC | Array.DESCENDING]);
      }
      
      public function removeFriends(param1:PurePlayer) : void
      {
         var _loc3_:int = 0;
         var _loc2_:PurePlayer = this.getFriendByID(param1.id);
         if(_loc2_)
         {
            _loc3_ = this.friends.indexOf(_loc2_);
            this.friends.splice(_loc3_,1);
         }
         else
         {
            this.friends.push(param1);
         }
      }
      
      public function getFriendByID(param1:int) : PurePlayer
      {
         var _loc2_:PurePlayer = null;
         for each(_loc2_ in this.friends)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function updateTemps(param1:int, param2:int = -1, param3:int = -1, param4:int = -1) : void
      {
         var _loc5_:PurePlayer = this.getTempByID(param1);
         if(_loc5_)
         {
            if(param2 != -1)
            {
               _loc5_.favor = param2;
            }
            if(param3 != -1)
            {
               _loc5_.lineserver = param3;
            }
            if(param4 != -1)
            {
               _loc5_.specialAct = param4;
            }
            if(param3 == 0)
            {
               _loc5_.specialAct = 0;
            }
            this.push2top(this.tempFriends,_loc5_);
         }
      }
      
      public function insertTemps(param1:PurePlayer) : void
      {
         var _loc2_:PurePlayer = this.getTempByID(param1.id);
         if(_loc2_)
         {
            _loc2_ = param1;
            this.push2top(this.tempFriends,_loc2_);
         }
         else
         {
            this.tempFriends.splice(0,0,param1);
            if(this.tempFriends.length > 30)
            {
               this.tempFriends.pop();
            }
         }
      }
      
      private function push2top(param1:Array, param2:Object) : void
      {
         var _loc3_:int = param1.indexOf(param2);
         if(_loc3_ != -1)
         {
            param1.splice(_loc3_,1);
            param1.splice(0,0,param2);
         }
      }
      
      public function removeTemps(param1:PurePlayer) : void
      {
         var _loc3_:int = 0;
         var _loc2_:PurePlayer = this.getTempByID(param1.id);
         if(_loc2_)
         {
            _loc3_ = this.tempFriends.indexOf(_loc2_);
            this.tempFriends.splice(_loc3_,1);
         }
         else
         {
            this.tempFriends.push(param1);
         }
      }
      
      public function getTempByID(param1:int) : PurePlayer
      {
         var _loc2_:PurePlayer = null;
         for each(_loc2_ in this.tempFriends)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function updateEnemies(param1:int, param2:int = -100000, param3:int = -1, param4:int = -1) : void
      {
         var _loc5_:PurePlayer = this.getEnemiesByID(param1);
         if(_loc5_)
         {
            if(param2 != -100000)
            {
               _loc5_.hate = param2;
            }
            if(param3 != -1)
            {
               _loc5_.lineserver = param3;
            }
            if(param4 != -1)
            {
               _loc5_.specialAct = param4;
            }
            this.enemies.sortOn(["lineserver","hate"],[Array.NUMERIC | Array.DESCENDING,Array.NUMERIC | Array.DESCENDING]);
         }
      }
      
      public function insertEnemies(param1:PurePlayer) : void
      {
         var _loc2_:PurePlayer = this.getEnemiesByID(param1.id);
         if(_loc2_)
         {
            _loc2_ = param1;
         }
         else
         {
            this.enemies.push(param1);
         }
         this.enemies.sortOn(["hate","lineserver"],[Array.NUMERIC | Array.DESCENDING,Array.NUMERIC | Array.DESCENDING]);
      }
      
      public function removeEnemies(param1:PurePlayer) : void
      {
         var _loc3_:int = 0;
         var _loc2_:PurePlayer = this.getEnemiesByID(param1.id);
         if(_loc2_)
         {
            _loc3_ = this.enemies.indexOf(_loc2_);
            this.enemies.splice(_loc3_,1);
         }
         else
         {
            this.enemies.push(param1);
         }
      }
      
      public function getEnemiesByID(param1:int) : PurePlayer
      {
         var _loc2_:PurePlayer = null;
         for each(_loc2_ in this.enemies)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function updateBlacklist(param1:int, param2:int = -1, param3:int = -1) : void
      {
         var _loc4_:PurePlayer = this.getBlackByID(param1);
         if(_loc4_)
         {
            if(param2 != -1)
            {
               _loc4_.lineserver = param2;
            }
            if(param3 != -1)
            {
               _loc4_.specialAct = param3;
            }
            this.blacklist.sortOn("lineserver",Array.NUMERIC | Array.DESCENDING);
         }
      }
      
      public function insertBlacklist(param1:PurePlayer) : void
      {
         var _loc2_:PurePlayer = this.getBlackByID(param1.id);
         if(_loc2_)
         {
            _loc2_ = param1;
         }
         else
         {
            this.blacklist.push(param1);
         }
         this.blacklist.sortOn("lineserver",Array.NUMERIC | Array.DESCENDING);
      }
      
      public function removeBlacklist(param1:PurePlayer) : void
      {
         var _loc3_:int = 0;
         var _loc2_:PurePlayer = this.getBlackByID(param1.id);
         if(_loc2_)
         {
            _loc3_ = this.blacklist.indexOf(_loc2_);
            this.blacklist.splice(_loc3_,1);
         }
         else
         {
            this.blacklist.push(param1);
         }
      }
      
      public function getBlackByID(param1:int) : PurePlayer
      {
         var _loc2_:PurePlayer = null;
         for each(_loc2_ in this.blacklist)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function updateShiTulist(param1:int, param2:int = -1, param3:int = -1) : void
      {
         var _loc4_:Object = this.getShiTuByID(param1);
         if(_loc4_)
         {
            if(param2 != -1)
            {
               _loc4_.lineserver = param2;
            }
            if(param3 != -1)
            {
               _loc4_.specialAct = param3;
            }
         }
      }
      
      public function insertShiTulist(param1:Object) : void
      {
         var _loc2_:Object = this.getShiTuByID(param1.id);
         if(_loc2_)
         {
            _loc2_ = param1;
         }
         else
         {
            this.shiTulist.push(param1);
         }
      }
      
      public function removeShiTulist(param1:Object) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Object = this.getShiTuByID(param1.id);
         if(_loc2_)
         {
            _loc3_ = this.shiTulist.indexOf(_loc2_);
            this.shiTulist.splice(_loc3_,1);
         }
         else
         {
            this.shiTulist.push(param1);
         }
      }
      
      public function getShiTuByID(param1:int) : Object
      {
         var _loc2_:Object = null;
         for each(_loc2_ in this.shiTulist)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}

