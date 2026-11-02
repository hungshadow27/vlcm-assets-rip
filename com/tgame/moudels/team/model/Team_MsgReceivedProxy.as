package com.tgame.moudels.team.model
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.instance.InstanceRes;
   import com.tgame.common.res.instance.InstanceResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.map.MapRes;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.common.vo.character.info.TeamInfo;
   import com.tgame.manager.HeadFaceManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.moudels.login.view.*;
   import com.tgame.moudels.team.view.Team_GumuMishi_Mediator;
   import com.tgame.moudels.team.view.Team_Instance_Mediator;
   import com.tgame.moudels.team.view.Team_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Team_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Team_MsgReceivedProxy";
      
      private var _msgSenderProxy:Team_MsgSenderProxy;
      
      private var _teamMediator:Team_Mediator;
      
      private var _instanceMediator:Team_Instance_Mediator;
      
      private var _tgmMediator:Team_GumuMishi_Mediator;
      
      public function Team_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get msgSenderProxy() : Team_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Team_MsgSenderProxy.NAME) as Team_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function get teamMediator() : Team_Mediator
      {
         if(!this._teamMediator)
         {
            this._teamMediator = facade.retrieveMediator(Team_Mediator.NAME) as Team_Mediator;
         }
         return this._teamMediator;
      }
      
      private function get instanceMediator() : Team_Instance_Mediator
      {
         if(!this._instanceMediator)
         {
            this._instanceMediator = facade.retrieveMediator(Team_Instance_Mediator.NAME) as Team_Instance_Mediator;
         }
         return this._instanceMediator;
      }
      
      private function get tgmMediator() : Team_GumuMishi_Mediator
      {
         if(!this._tgmMediator)
         {
            this._tgmMediator = facade.retrieveMediator(Team_GumuMishi_Mediator.NAME) as Team_GumuMishi_Mediator;
         }
         return this._tgmMediator;
      }
      
      private function get myTeam() : TeamInfo
      {
         return GameInstance.mainCharData.teamInfo;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([10208,10210,10212,10214,10216,10182,10184,10186,10188,10190,10192,10194,10196,10198,10200,10202,10204,10206,10218,10220,10222,10224,10228,10234,10236,10238,10244,10252,10256,10258,10254,10246,10712,10704,10706,10708,10710,10714,10724,10726,10728,10730,10226],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([10208,10210,10212,10214,10216,10182,10184,10186,10188,10190,10192,10194,10196,10198,10200,10202,10204,10206,10218,10220,10222,10224,10228,10234,10236,10238,10244,10252,10256,10258,10254,10246,10724,10726,10728,10730,10226],NAME);
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
         }
         else
         {
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_10226(param1:ByteArray) : void
      {
         var _loc7_:PurePlayer = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readShort();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:Array = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = new PurePlayer();
            _loc7_.id = _loc2_.readInt();
            _loc7_.name = _loc2_.readUTF();
            _loc7_.attributeInfo.lv = _loc2_.readShort();
            _loc7_.attributeInfo.partyID = _loc2_.readByte();
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         this.teamMediator.updateSearchPanel(_loc5_,_loc3_);
      }
      
      public function received_10208(param1:ByteArray) : void
      {
         var _loc5_:PurePlayer = null;
         var _loc6_:AttributeInfo = null;
         var _loc7_:BanghuiInfo = null;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         ZLog.add("10208：收到组队详细信息");
         var _loc2_:ByteArray = param1;
         this.myTeam.teamID = _loc2_.readInt();
         this.myTeam.teamDeclare = _loc2_.readUTF();
         this.myTeam.teamCount = _loc2_.readByte();
         this.myTeam.clearMyTeamPlayers();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < this.myTeam.teamCount)
         {
            _loc5_ = new PurePlayer();
            _loc5_.id = _loc2_.readInt();
            if(_loc4_ == 0)
            {
               this.myTeam.teamLeaderID = _loc5_.id;
            }
            _loc5_.name = _loc2_.readUTF();
            _loc6_ = _loc5_.attributeInfo;
            _loc7_ = _loc5_.banghuiInfo;
            _loc6_.lv = _loc2_.readShort();
            _loc6_.partyID = _loc2_.readByte();
            _loc6_.headImg = HeadResChange.headResChangeToString(_loc2_.readByte());
            _loc7_.banghuiName = _loc2_.readUTF();
            _loc6_.hpNow = _loc2_.readDouble();
            _loc6_.hpMax = _loc2_.readDouble();
            _loc6_.mpNow = _loc2_.readDouble();
            _loc6_.mpMax = _loc2_.readDouble();
            _loc8_ = _loc2_.readInt();
            _loc5_.zhiYe = _loc2_.readByte();
            _loc9_ = GameConfig.wantEnterMapRes.id;
            _loc5_.isSameMap = _loc8_ == _loc9_ ? true : false;
            this.myTeam.teamPlayers.push(_loc5_);
            _loc3_.push(_loc5_.id);
            _loc4_++;
         }
         this.myTeam.duiWuId = _loc2_.readByte();
         this.teamMediator.updateTeamPanelState();
         HeadFaceManager.updatePlayersName(_loc3_);
      }
      
      public function received_10246(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:PurePlayer = null;
         var _loc7_:Boolean = false;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         ZLog.add("10246：收到队员坐标信息 ");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_.readInt();
            _loc6_ = this.myTeam.getPlayerByID(_loc5_);
            _loc7_ = _loc2_.readBoolean();
            _loc8_ = _loc2_.readUTF();
            _loc9_ = _loc2_.readShort();
            _loc10_ = _loc2_.readShort();
            if(_loc6_)
            {
               _loc6_.isSameMap = _loc7_;
               _loc6_.map = _loc8_;
               _loc6_.mx = _loc9_;
               _loc6_.my = _loc10_;
            }
            _loc4_++;
         }
         this.teamMediator.updateTeamPanelState();
      }
      
      public function received_10212(param1:ByteArray) : void
      {
         ZLog.add("10212：收到组队面板信息");
         var _loc2_:ByteArray = param1;
         this.myTeam.teamID = _loc2_.readInt();
         this.myTeam.teamDeclare = _loc2_.readUTF();
         this.myTeam.enableTeamInvite = Boolean(_loc2_.readByte());
         this.myTeam.enableMemberJoin = Boolean(_loc2_.readByte());
         this.myTeam.enableTeamPanel = Boolean(_loc2_.readByte());
         this.teamMediator.updateTeamPanelState();
      }
      
      public function received_10214(param1:ByteArray) : void
      {
         var _loc4_:PurePlayer = null;
         var _loc5_:int = 0;
         ZLog.add("10214：收到 附近玩家信息 ");
         var _loc2_:ByteArray = param1;
         this.myTeam.currPlayersPage = _loc2_.readShort();
         this.myTeam.maxPlayersPage = _loc2_.readShort();
         this.myTeam.nearbyPlayersCount = _loc2_.readByte();
         this.myTeam.clearNearbyPlayers();
         var _loc3_:int = 0;
         while(_loc3_ < this.myTeam.nearbyPlayersCount)
         {
            _loc4_ = new PurePlayer();
            _loc4_.id = _loc2_.readInt();
            _loc4_.name = _loc2_.readUTF();
            _loc4_.attributeInfo.lv = _loc2_.readShort();
            _loc4_.attributeInfo.partyID = _loc2_.readByte();
            _loc4_.banghuiInfo.banghuiName = _loc2_.readUTF();
            _loc5_ = _loc2_.readByte();
            if(_loc5_)
            {
               _loc4_.spouseData.peiouID = _loc2_.readInt();
               _loc4_.spouseData.name = _loc2_.readUTF();
               _loc4_.spouseData.isOnline = _loc2_.readByte();
            }
            this.myTeam.nearbyPlayers.push(_loc4_);
            _loc3_++;
         }
         this.teamMediator.updateOtherPlayers();
      }
      
      public function received_10216(param1:ByteArray) : void
      {
         var _loc4_:TeamInfo = null;
         ZLog.add("10216：收到 附近队伍列表 ");
         var _loc2_:ByteArray = param1;
         this.myTeam.currTeamsPage = _loc2_.readShort();
         this.myTeam.maxTeamsPage = _loc2_.readShort();
         this.myTeam.nearbyTeamsCount = _loc2_.readByte();
         this.myTeam.clearNearbyTeams();
         var _loc3_:int = 0;
         while(_loc3_ < this.myTeam.nearbyTeamsCount)
         {
            _loc4_ = new TeamInfo();
            _loc4_.teamID = _loc2_.readInt();
            _loc4_.teamLeaderID = _loc2_.readInt();
            _loc4_.teamLeaderName = _loc2_.readUTF();
            _loc4_.teamLevel = _loc2_.readShort();
            _loc4_.teamCount = _loc2_.readByte();
            _loc4_.zhenfaID = _loc2_.readByte();
            _loc4_.teamDeclare = _loc2_.readUTF();
            this.myTeam.nearbyTeams.push(_loc4_);
            _loc3_++;
         }
         this.teamMediator.updateOtherTeams();
      }
      
      public function received_10210(param1:ByteArray) : void
      {
         var _loc5_:PurePlayer = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:TeamInfo = new TeamInfo();
         _loc3_.teamID = _loc2_.readInt();
         _loc3_.teamCount = _loc2_.readByte();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.teamCount)
         {
            _loc5_ = new PurePlayer();
            _loc5_.id = _loc2_.readInt();
            _loc5_.name = _loc2_.readUTF();
            _loc5_.attributeInfo.lv = _loc2_.readShort();
            _loc5_.attributeInfo.partyID = _loc2_.readByte();
            _loc3_.teamPlayers.push(_loc5_);
            _loc4_++;
         }
         this.teamMediator.updateCurrTeam(_loc3_);
      }
      
      public function received_10182(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte());
         ZLog.add("10182：收到邀请组队的结果: " + _loc3_);
         if(_loc3_)
         {
            NoticeManager.notify(3,LanResManager.getLanCommonTextWords("邀请组队成功"));
         }
         else
         {
            NoticeManager.notify(3,LanResManager.getLanCommonTextWords("邀请组队被拒绝"));
         }
      }
      
      public function received_10184(param1:ByteArray) : void
      {
         ZLog.add("10184：收到邀请组队的请求  ");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:String = _loc2_.readUTF();
         var _loc5_:int = _loc2_.readShort();
         this.teamMediator.showInviteTips(_loc3_,_loc4_,_loc5_);
      }
      
      public function received_10186(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         ZLog.add("10186：收到邀请组队的结果 ");
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte());
         if(!_loc3_)
         {
            _loc4_ = NetWorkManager.readGILMsg(_loc2_);
            NoticeManager.notify(3,LanResManager.getLanTextWords(this,"加入队伍失败",[_loc4_]));
         }
         else
         {
            ZLog.add("10186：收到邀请组队成功");
         }
      }
      
      public function received_10188(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte());
         ZLog.add("10188：收到 申请加入队伍的回应 " + _loc3_);
         if(!_loc3_)
         {
            _loc4_ = NetWorkManager.readGILMsg(_loc2_);
            NoticeManager.notify(3,LanResManager.getLanTextWords(this,"申请加入队伍失败",[_loc4_]));
         }
      }
      
      public function received_10190(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:String = _loc2_.readUTF();
         var _loc5_:int = _loc2_.readShort();
         ZLog.add("10190：收到 申请加入队伍的请求 " + _loc4_);
         this.teamMediator.showJoinTips(_loc3_,_loc4_,_loc5_);
      }
      
      public function received_10192(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte());
         ZLog.add("10192：服务器给队长返回同意申请结果 " + _loc3_);
         if(!_loc3_)
         {
            _loc4_ = NetWorkManager.readGILMsg(_loc2_);
            NoticeManager.notify(3,LanResManager.getLanCommonTextWords("组队失败") + "：" + _loc4_);
         }
         else
         {
            NoticeManager.notify(3,LanResManager.getLanCommonTextWords("组队成功"));
         }
      }
      
      public function received_10194(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte());
         ZLog.add("10194： 收到 组队参数设置结果 " + _loc3_);
         if(_loc3_)
         {
            _loc4_ = _loc2_.readByte();
            _loc5_ = _loc2_.readByte();
            this.myTeam.setTeamSettings(_loc4_,_loc5_);
            this.teamMediator.updateTeamPanelState();
         }
         else
         {
            ZLog.add("10194：组队参数设置失败： " + _loc3_);
         }
      }
      
      public function received_10196(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte());
         ZLog.add("10196：  收到 修改队伍宣言结果  " + _loc3_);
         if(_loc3_)
         {
            this.myTeam.teamDeclare = _loc2_.readUTF();
            this.teamMediator.updateTeamPanelState();
            NoticeManager.notify(3,LanResManager.getLanCommonTextWords("修改队伍宣言成功"));
         }
         else
         {
            _loc4_ = NetWorkManager.readGILMsg(_loc2_);
            NoticeManager.notify(3,LanResManager.getLanCommonTextWords("修改队伍宣言失败") + ": " + _loc4_);
            this.teamMediator.updateTeamPanelState();
         }
      }
      
      public function received_10198(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte());
         ZLog.add("10198：  收到 创建队伍结果  " + _loc3_);
         if(_loc3_)
         {
            NoticeManager.notify(3,LanResManager.getLanCommonTextWords("创建队伍成功"));
         }
         else
         {
            _loc4_ = NetWorkManager.readGILMsg(_loc2_);
            NoticeManager.notify(3,LanResManager.getLanCommonTextWords("创建队伍失败") + ": " + _loc4_);
         }
      }
      
      public function received_10200(param1:ByteArray) : void
      {
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte());
         ZLog.add("10200：  收到 是否离开队伍成功 " + _loc3_);
         if(_loc3_)
         {
            _loc4_ = this.myTeam.getTeamMemberIDArray();
            this.myTeam.reset();
            HeadFaceManager.updatePlayersName(_loc4_);
            this.teamMediator.updateTeamPanelState();
            NoticeManager.notify(3,LanResManager.getLanCommonTextWords("离开队伍成功"));
         }
         else
         {
            _loc5_ = _loc2_.readUTF();
            NoticeManager.notify(3,LanResManager.getLanCommonTextWords("离开队伍失败") + ": " + _loc5_);
         }
      }
      
      public function received_10202(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte());
         ZLog.add("10202： 收到 队长是否更换成功  " + _loc3_);
         if(_loc3_)
         {
            NoticeManager.notify(3,LanResManager.getLanCommonTextWords("更换队长成功"));
         }
         else
         {
            _loc4_ = _loc2_.readUTF();
            NoticeManager.notify(3,LanResManager.getLanCommonTextWords("更换队长失败") + ": " + _loc4_);
         }
      }
      
      public function received_10204(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:String = _loc2_.readUTF();
         ZLog.add("10204：收到  升级为队长消息  " + _loc4_);
         this.teamMediator.showUpgradeLeaderTips(_loc3_,_loc4_);
      }
      
      public function received_10206(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte());
         ZLog.add("10206： 收到 升级队长是否成功  " + _loc3_);
         if(_loc3_)
         {
            NoticeManager.notify(3,LanResManager.getLanCommonTextWords("升级队长成功"));
         }
         else
         {
            _loc4_ = _loc2_.readUTF();
            NoticeManager.notify(3,LanResManager.getLanCommonTextWords("升级队长失败") + ": " + _loc4_);
         }
      }
      
      public function received_10218(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte());
         ZLog.add("10218： 收到 踢掉玩家是否成功  " + _loc3_);
         if(_loc3_)
         {
            NoticeManager.notify(3,LanResManager.getLanCommonTextWords("踢掉玩家成功"));
         }
         else
         {
            _loc4_ = _loc2_.readUTF();
            NoticeManager.notify(3,LanResManager.getLanCommonTextWords("踢掉玩家失败") + ": " + _loc4_);
         }
      }
      
      public function received_10220(param1:ByteArray) : void
      {
         var _loc2_:Array = this.myTeam.getTeamMemberIDArray();
         this.myTeam.reset();
         HeadFaceManager.updatePlayersName(_loc2_);
         this.teamMediator.updateTeamPanelState();
         NoticeManager.notify(1,LanResManager.getLanCommonTextWords("你已被队长踢出队伍") + "! ");
      }
      
      public function received_10222(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         ZLog.add("10222： 收到 玩家离队信息  " + _loc3_);
         var _loc4_:String = this.myTeam.removeTeamPlayer(_loc3_);
         if(_loc4_ != null)
         {
            this.teamMediator.updateTeamPanelState();
            HeadFaceManager.updatePlayersName([_loc3_]);
            NoticeManager.notify(3,_loc4_ + LanResManager.getLanCommonTextWords("离开队伍"));
            GameInstance.uiInstance.mainUI.receiveMessage(3,"",-100,"",-1,_loc4_ + " " + LanResManager.getLanCommonTextWords("离开队伍"));
         }
      }
      
      public function received_10224(param1:ByteArray) : void
      {
         var _loc5_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:PurePlayer = this.myTeam.getPlayerByID(_loc3_);
         if(_loc4_ != null)
         {
            _loc5_ = _loc4_.name;
            NoticeManager.notify(3,_loc5_ + LanResManager.getLanCommonTextWords("已被任命为新队长"));
            GameInstance.uiInstance.mainUI.receiveMessage(3,"",-100,"",-1,_loc5_ + LanResManager.getLanCommonTextWords("已被任命为新队长"));
            ZLog.add("10224： 收到  广播新队长  " + _loc3_);
            this.myTeam.setNewTeamLeader(_loc3_);
            this.teamMediator.updateTeamPanelState();
         }
      }
      
      public function received_10228(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:String = NetWorkManager.readGILMsg(_loc2_);
         NoticeManager.notify(3,LanResManager.getLanCommonTextWords("队伍") + ": " + _loc3_);
         GameInstance.uiInstance.mainUI.receiveMessage(3,"",-100,"",-1,_loc3_);
      }
      
      public function received_10234(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:Number = _loc2_.readDouble();
         var _loc5_:Number = _loc2_.readDouble();
         this.myTeam.setTeamMemberHPMP(_loc3_,-1,_loc4_,_loc5_);
         this.teamMediator.updateTeamHPMP();
      }
      
      public function received_10236(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:Number = _loc2_.readDouble();
         var _loc5_:Number = _loc2_.readDouble();
         this.myTeam.setTeamMemberHPMP(_loc3_,-1,-1,-1,_loc4_,_loc5_);
         this.teamMediator.updateTeamHPMP();
      }
      
      public function received_10238(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:Number = _loc2_.readDouble();
         var _loc6_:Number = _loc2_.readDouble();
         var _loc7_:Number = _loc2_.readDouble();
         var _loc8_:Number = _loc2_.readDouble();
         this.myTeam.setTeamMemberHPMP(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
         this.teamMediator.updateTeamHPMP();
      }
      
      public function received_10244(param1:ByteArray) : void
      {
         var _loc7_:PurePlayer = null;
         var _loc8_:int = 0;
         ZLog.add("10244： 收到  定时向客户端发送同地图队伍玩家位置  ");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = param1.readByte();
         this.myTeam.tempPlayerXYObj = {};
         var _loc4_:Array = this.myTeam.teamPlayers;
         var _loc5_:int = 0;
         var _loc6_:int = int(_loc4_.length);
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc4_[_loc5_];
            if(_loc7_.id == GameInstance.mainChar.id)
            {
               _loc7_.isSameMap = true;
            }
            else
            {
               _loc7_.isSameMap = false;
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc8_ = param1.readInt();
            this.myTeam.tempPlayerXYObj[_loc8_] = {};
            this.myTeam.tempPlayerXYObj[_loc8_].x = _loc2_.readShort() * 25;
            this.myTeam.tempPlayerXYObj[_loc8_].y = _loc2_.readShort() * 25;
            _loc7_ = this.getPlayer(_loc8_);
            if(_loc7_)
            {
               _loc7_.isSameMap = true;
            }
            _loc5_++;
         }
         this.teamMediator.updateTeamPanelState();
      }
      
      private function getPlayer(param1:int) : PurePlayer
      {
         var _loc5_:PurePlayer = null;
         var _loc2_:Array = this.myTeam.teamPlayers;
         var _loc3_:int = 0;
         var _loc4_:int = int(_loc2_.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc2_[_loc3_];
            if(_loc5_.id == param1)
            {
               return _loc5_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function received_10252(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         ZLog.add("10252： 收到 阵法列表  count=" + _loc3_);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_.readShort();
            _loc6_ = _loc2_.readBoolean();
            if((_loc6_) && _loc5_ > 0 && _loc5_ < 9)
            {
               this.myTeam.zhenfaList.push(_loc5_);
            }
            _loc4_++;
         }
         this.teamMediator.updateZhanfaPanel();
      }
      
      public function received_10256(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readShort();
         var _loc4_:String = TeamInfo.zhenfaStaticList[_loc3_];
         this.myTeam.zhenfaID = _loc3_;
         this.teamMediator.updateTeamPanelState();
         NoticeManager.notify(3,_loc4_ + " " + LanResManager.getLanCommonTextWords("阵法已经生效"));
      }
      
      public function received_10258(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readShort();
         var _loc4_:String = TeamInfo.zhenfaStaticList[_loc3_];
         NoticeManager.notify(3,_loc4_ + " " + LanResManager.getLanCommonTextWords("阵法已经失效"));
      }
      
      public function received_10254(param1:ByteArray) : void
      {
         this.myTeam.zhenfaID = param1.readByte();
         if(this.myTeam.zhenfaID > 0)
         {
            NoticeManager.notify(3,LanResManager.getLanTextWords(this,"阵法开启成功",[this.myTeam.zhenfaName]));
         }
         else
         {
            this.myTeam.zhenfaID = 0;
            NoticeManager.notify(3,LanResManager.getLanTextWords(this,"阵法自动失效"));
         }
         this.teamMediator.updateTeamPanelState();
         this.teamMediator.updateTeamHPMP();
      }
      
      public function received_10712(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:InstanceRes = null;
         var _loc16_:Object = null;
         var _loc17_:Array = null;
         var _loc18_:int = 0;
         var _loc19_:Object = null;
         var _loc20_:int = 0;
         ZLog.add("10712： 收到今日进入副本次数");
         var _loc3_:int = param1.readShort();
         var _loc4_:Array = [];
         var _loc15_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc5_ = param1.readInt();
            _loc6_ = param1.readInt();
            _loc7_ = param1.readShort();
            _loc8_ = param1.readShort();
            _loc9_ = param1.readShort();
            _loc10_ = param1.readShort();
            _loc11_ = param1.readByte();
            _loc18_ = param1.readShort();
            _loc14_ = InstanceResManager.getInstanceRes(_loc5_);
            _loc16_ = new Object();
            _loc15_.push(_loc16_);
            _loc16_.id = _loc14_.instance_model_id;
            _loc16_.mapID = _loc6_;
            _loc16_.enterCount = _loc7_;
            _loc16_.totalCount = _loc8_;
            _loc16_.fubenLin = _loc9_;
            _loc16_.name = _loc14_.instance_name;
            _loc16_.grade = _loc14_.level_lower_limit;
            _loc16_.team = _loc14_.showMenPai();
            _loc16_.degree = _loc7_ + "/" + _loc8_ + LanResManager.getLanCommonTextWords("次");
            _loc16_.hortatory = _loc14_.rewardgrade;
            _loc16_.say = _loc14_.descpt;
            _loc16_.fubenLinCount = _loc10_;
            _loc16_.isFubenLinEnter = _loc11_;
            _loc17_ = [];
            _loc20_ = 0;
            _loc20_ = 0;
            while(_loc20_ < _loc18_)
            {
               _loc12_ = param1.readInt();
               _loc13_ = param1.readInt();
               _loc19_ = new Object();
               _loc19_.jiangliID = _loc12_;
               _loc19_.jiangliCount = _loc13_;
               _loc17_.push(_loc19_);
               _loc20_++;
            }
            _loc16_.jiangliArr = _loc17_;
            if(_loc14_.enable == 0 || GameInstance.mainCharData.attributeInfo.lv < _loc14_.level_lower_limit || _loc14_.level_high_limit != 0 && GameInstance.mainCharData.attributeInfo.lv > _loc14_.level_high_limit || _loc7_ == _loc8_)
            {
               _loc16_.enter = false;
            }
            else
            {
               _loc16_.enter = true;
            }
            _loc2_++;
         }
         this.instanceMediator.showInstanceList(_loc15_);
      }
      
      private function getInstanceCount(param1:int, param2:int, param3:Array) : int
      {
         var _loc4_:int = 0;
         var _loc5_:int = int(param3.length);
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            if(param1 == param3[_loc4_][0])
            {
               return param3[_loc4_][1];
            }
            _loc4_++;
         }
         return 0;
      }
      
      public function received_10704(param1:ByteArray) : void
      {
         ZLog.add("10704： 收到队伍满足传送条件向队友发送副本传送邀请");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         this.instanceMediator.showTeamInstance(_loc2_,_loc3_);
      }
      
      public function received_10706(param1:ByteArray) : void
      {
         ZLog.add("10706： 收到广播队友进入副本情况");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         this.instanceMediator.updateTeamStatus(_loc2_,_loc3_);
      }
      
      public function received_10708(param1:ByteArray) : void
      {
         ZLog.add("10708： 收到验证通过准备到计时进入副本");
         var _loc2_:int = param1.readInt();
         this.instanceMediator.readyEnter(_loc2_);
         if(Fun.isVisible(GameInstance.uiInstance._yitiantulongPanel))
         {
            GameInstance.uiInstance._yitiantulongPanel.onClose();
            GameInstance.uiInstance._yitiantulongPanel.setClose();
         }
      }
      
      public function received_10710(param1:ByteArray) : void
      {
         ZLog.add("10710： 收到进入副本行动中断失败");
         var _loc2_:String = NetWorkManager.readGILMsg(param1);
         this.instanceMediator.failure(_loc2_);
      }
      
      public function received_10714(param1:ByteArray) : void
      {
         ZLog.add("10714： 收到单人进入副本");
         this.instanceMediator.singleEnter();
      }
      
      public function received_10724(param1:ByteArray) : void
      {
         ZLog.add("10724： 单人进入副本开始倒计时");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         this.instanceMediator.startTimer(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
      }
      
      public function received_10726(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         ZLog.add("10726： 副本通关成功");
         var _loc2_:int = param1.readShort();
         var _loc6_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInt();
            _loc5_ = param1.readInt();
            _loc6_.push([_loc4_,_loc5_]);
            _loc3_++;
         }
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readByte();
         this.instanceMediator.missionOK(_loc6_,_loc7_,_loc8_);
      }
      
      public function received_10728(param1:ByteArray) : void
      {
         ZLog.add("10728： 领取成功");
         this.instanceMediator.pickOK();
      }
      
      public function received_10730(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         var _loc11_:Object = null;
         var _loc12_:MapRes = null;
         ZLog.add("10730：收到密室传送列表 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         _loc10_ = 0;
         while(_loc10_ < _loc4_)
         {
            _loc6_ = param1.readInt();
            _loc7_ = param1.readInt();
            _loc8_ = param1.readInt();
            _loc9_ = param1.readUTF();
            _loc11_ = new Object();
            _loc11_.id = _loc6_;
            _loc12_ = MapTransManager.getMapRes(_loc6_);
            _loc11_.name = _loc12_.name;
            _loc11_.grade = _loc7_ + LanResManager.getLanCommonTextWords("级") + "-" + _loc8_ + LanResManager.getLanCommonTextWords("级");
            _loc11_.say = _loc9_;
            _loc5_.push(_loc11_);
            _loc10_++;
         }
         this.tgmMediator.showInstanceList(_loc5_);
      }
   }
}

