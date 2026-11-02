package com.tgame.common.vo.character.info
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.character.PurePlayer;
   
   public class TeamInfo
   {
      
      public var teamID:int = -1;
      
      public var teamDeclare:String = "";
      
      public var teamLevel:int;
      
      public var teamCount:int;
      
      public var teamLeaderID:int;
      
      public var teamLeaderName:String = "";
      
      public var teamMap:int;
      
      public var mapPopulation:int;
      
      public var teamPlayers:Array = [];
      
      public var teamPlayerBuff:Array = [];
      
      public var tempPlayerXYObj:Object;
      
      public var enableTeamInvite:Boolean = true;
      
      public var enableMemberJoin:Boolean = true;
      
      public var enableTeamPanel:Boolean = true;
      
      public var currPlayersPage:int = 1;
      
      public var maxPlayersPage:int = 1;
      
      public var nearbyPlayersCount:int;
      
      public var nearbyPlayers:Array = [];
      
      public var duiWuId:int = 0;
      
      public var currTeamsPage:int = 1;
      
      public var maxTeamsPage:int = 1;
      
      public var nearbyTeamsCount:int;
      
      public var nearbyTeams:Array = [];
      
      public var zhenfaList:Array = new Array();
      
      public var zhenfaID:int;
      
      public function TeamInfo()
      {
         super();
         this.reset();
      }
      
      public static function get zhenfaStaticList() : Array
      {
         return [LanResManager.getLanCommonTextWords("无阵法"),LanResManager.getLanCommonTextWords("两仪阵"),LanResManager.getLanCommonTextWords("三才阵"),LanResManager.getLanCommonTextWords("虎翼阵"),LanResManager.getLanCommonTextWords("太乙阵"),LanResManager.getLanCommonTextWords("锋矢阵"),LanResManager.getLanCommonTextWords("流云阵"),LanResManager.getLanCommonTextWords("天罡北斗阵"),LanResManager.getLanCommonTextWords("伏羲八卦阵")];
      }
      
      public function clearNearbyPlayers() : void
      {
         if(this.nearbyPlayers)
         {
            this.nearbyPlayers.splice(0,this.nearbyPlayers.length);
         }
      }
      
      public function clearNearbyTeams() : void
      {
         if(this.nearbyTeams)
         {
            this.nearbyTeams.splice(0,this.nearbyTeams.length);
         }
      }
      
      public function setTeamSettings(param1:int, param2:int) : void
      {
         switch(param1)
         {
            case 1:
               this.enableTeamInvite = Boolean(param2);
               break;
            case 2:
               this.enableMemberJoin = Boolean(param2);
               break;
            case 3:
               this.enableTeamPanel = Boolean(param2);
         }
      }
      
      public function get zhenfaName() : String
      {
         return zhenfaStaticList[this.zhenfaID];
      }
      
      public function clearMyTeamPlayers() : void
      {
         if(this.teamPlayers)
         {
            this.teamPlayers.splice(0,this.teamPlayers.length);
         }
         if(this.teamPlayerBuff)
         {
            this.teamPlayerBuff.splice(0,this.teamPlayers.length);
         }
      }
      
      public function removeTeamPlayer(param1:int) : String
      {
         var _loc2_:String = null;
         var _loc3_:PurePlayer = null;
         var _loc4_:int = 0;
         if(this.teamPlayers)
         {
            _loc3_ = this.getPlayerByID(param1);
            if(_loc3_)
            {
               _loc2_ = _loc3_.name;
               _loc4_ = this.teamPlayers.indexOf(_loc3_);
               this.teamPlayers.splice(_loc4_,1);
            }
         }
         this.teamCount = this.teamPlayers.length;
         return _loc2_;
      }
      
      public function getTeamMemberIDArray() : Array
      {
         var _loc2_:PurePlayer = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.teamPlayers)
         {
            _loc1_.push(_loc2_.id);
         }
         return _loc1_;
      }
      
      public function getPlayerByID(param1:int) : PurePlayer
      {
         var _loc3_:PurePlayer = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.teamPlayers.length)
         {
            _loc3_ = this.teamPlayers[_loc2_] as PurePlayer;
            if(_loc3_.id == param1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function isFull() : Boolean
      {
         if(this.teamCount == 7)
         {
            return true;
         }
         return false;
      }
      
      public function setNewTeamLeader(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:PurePlayer = null;
         if(this.teamPlayers)
         {
            _loc2_ = 0;
            while(_loc2_ < this.teamPlayers.length)
            {
               _loc3_ = this.teamPlayers[_loc2_] as PurePlayer;
               if(_loc3_.id == param1)
               {
                  this.teamLeaderID = param1;
                  this.teamLeaderName = _loc3_.name;
                  return;
               }
               _loc2_++;
            }
         }
      }
      
      public function setTeamMemberOnline(param1:int, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc4_:PurePlayer = null;
         if(this.teamPlayers)
         {
            _loc3_ = 0;
            while(_loc3_ < this.teamPlayers.length)
            {
               _loc4_ = this.teamPlayers[_loc3_] as PurePlayer;
               if(_loc4_.id == param1)
               {
                  _loc4_.lineserver = param2 as int;
                  return;
               }
               _loc3_++;
            }
         }
      }
      
      public function setTeamMemberHPMP(param1:int, param2:int = -1, param3:Number = -1, param4:Number = -1, param5:Number = -1, param6:Number = -1) : void
      {
         var _loc7_:int = 0;
         var _loc8_:PurePlayer = null;
         if(this.teamPlayers)
         {
            _loc7_ = 0;
            while(_loc7_ < this.teamPlayers.length)
            {
               _loc8_ = this.teamPlayers[_loc7_] as PurePlayer;
               if(_loc8_.id == param1)
               {
                  if(param3 > -1 && param4 > -1)
                  {
                     _loc8_.attributeInfo.hpNow = param3;
                     _loc8_.attributeInfo.hpMax = param4;
                  }
                  if(param5 > -1 && param6 > -1)
                  {
                     _loc8_.attributeInfo.mpNow = param5;
                     _loc8_.attributeInfo.mpMax = param6;
                  }
                  if(param2 > -1)
                  {
                     _loc8_.attributeInfo.lv = param2;
                  }
                  return;
               }
               _loc7_++;
            }
         }
      }
      
      public function reset() : void
      {
         this.teamID = -1;
         this.teamDeclare = "";
         this.teamLevel = 0;
         this.teamCount = 0;
         this.teamLeaderID = -1;
         this.teamLeaderName = "";
         this.teamMap = -1;
         this.mapPopulation = 0;
         this.zhenfaID = 0;
         this.duiWuId = 0;
         this.clearMyTeamPlayers();
      }
   }
}

