package com.tgame.moudels.team.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SettingKey;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.TeamInfo;
   import com.tgame.manager.ConfirmManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.team.Team_ApplicationFacade;
   import com.tgame.moudels.team.model.Team_MsgSenderProxy;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.TeamPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Team_Mediator extends Mediator
   {
      
      public static const NAME:String = "Team_Mediator";
      
      private var _msgSenderProxy:Team_MsgSenderProxy;
      
      private var searchIndex:int = 1;
      
      private var isSearchEnd:Boolean = false;
      
      private var searchKeyword:String = "";
      
      public function Team_Mediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Team_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Team_MsgSenderProxy.NAME) as Team_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get teamPanel() : TeamPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.teamPanel);
         }
         return viewComponent as TeamPanel;
      }
      
      private function get mainUI() : MainUI
      {
         return GameInstance.uiInstance.mainUI;
      }
      
      private function get myTeam() : TeamInfo
      {
         return GameInstance.mainCharData.teamInfo;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Team_ApplicationFacade.SEND_TEAM_INVITE,Team_ApplicationFacade.SET_TEAM_PARMS,Team_ApplicationFacade.KUAFU_STATUS];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Team_ApplicationFacade.SEND_TEAM_INVITE:
               this.trySend10181(0,_loc2_ as int);
               break;
            case Team_ApplicationFacade.SET_TEAM_PARMS:
               _loc3_ = _loc2_ as Array;
               this.setTeamParms(_loc3_[0],_loc3_[1],true);
               break;
            case Team_ApplicationFacade.KUAFU_STATUS:
               this.updateTeamPanelState();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         EventDispatchCenter.getInstance().addEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_ORDERBTN_CLICK,this.teamPanelHandel);
         EventDispatchCenter.getInstance().addEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_ORDER_USE,this.teamPanelHandel);
         UIEventsRegisterManager.addUIRegisterEvent(MainUI,function():void
         {
            mainUI.addEventListener(MainUI.MAINUI_TEAMMEMBERLIST_MOUSEOVER,teamPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MainUI,function():void
         {
            mainUI.removeEventListener(MainUI.MAINUI_TEAMMEMBERLIST_MOUSEOVER,teamPanelHandel);
         });
         UIEventsRegisterManager.addUIRegisterEvent(TeamPanel,function():void
         {
            teamPanel.addEventListener(Event.ADDED_TO_STAGE,onShowTeamPanel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_SHOW,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_MENU_CLICK,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_CREATETAMEBTN_CLICK,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_LEAVETEAMBTN_CLICK,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_ADDMEMBERBTN_CLICK,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_ADDMEMBERBTN_MEMBER,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_APPOINTLEADERBTN_CLICK,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_DISEMPLOYTEAMBTN_CLICK,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_LOOKINFOBTN_CLICK,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_MODIFT_DECLARE,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_SHOW_PREREQUISITE_CHANGE,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_OTHERTEAM_SHOW,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_OTHERTEAM_GET_PAGE,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_OTHERTEAM_GET_OTHERTEAM_MEMBERLIST,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_OTHERTEAM_REFRESH_LIST,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_OTHERTEAM_ADD_TEAM,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_SHOW,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_GET_PAGE,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_REFRESH_LIST,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_INVITE_TEAM,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_SEARCH_PLAYER,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_SEARCH_PLAYER,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_GET_PREPAGE,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_GET_NEXTPAGE,teamPanelHandel);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_4LINGZHENG_CLICK,teamPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TeamPanel,function():void
         {
            teamPanel.removeEventListener(Event.ADDED_TO_STAGE,onShowTeamPanel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_SHOW,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_MENU_CLICK,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_CREATETAMEBTN_CLICK,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_LEAVETEAMBTN_CLICK,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_ADDMEMBERBTN_CLICK,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_ADDMEMBERBTN_MEMBER,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_APPOINTLEADERBTN_CLICK,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_DISEMPLOYTEAMBTN_CLICK,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_LOOKINFOBTN_CLICK,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_MODIFT_DECLARE,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_SHOW_PREREQUISITE_CHANGE,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_OTHERTEAM_SHOW,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_OTHERTEAM_GET_PAGE,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_OTHERTEAM_GET_OTHERTEAM_MEMBERLIST,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_OTHERTEAM_REFRESH_LIST,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_OTHERTEAM_ADD_TEAM,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_SHOW,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_GET_PAGE,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_REFRESH_LIST,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_INVITE_TEAM,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_SEARCH_PLAYER,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_SEARCH_PLAYER,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_GET_PREPAGE,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_GET_NEXTPAGE,teamPanelHandel);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYTEAM_4LINGZHENG_CLICK,teamPanelHandel);
         });
      }
      
      public function updateSearchPanel(param1:Array, param2:int) : void
      {
         var _loc4_:PurePlayer = null;
         var _loc6_:XML = null;
         this.searchIndex = param2;
         if(param1.length < 5)
         {
            this.isSearchEnd = true;
         }
         else
         {
            this.isSearchEnd = false;
         }
         var _loc3_:XML = <list/>;
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc4_ = param1[_loc5_] as PurePlayer;
            _loc6_ = <node label="id" number={LanResManager.getLanCommonTextWords("序号")} playerName={LanResManager.getLanCommonTextWords("名字")} level={LanResManager.getLanCommonTextWords("等级")} party={LanResManager.getLanCommonTextWords("门派")}/>;
            _loc6_.@label = _loc4_.id;
            _loc6_.@number = _loc5_;
            _loc6_.@playerName = _loc4_.name;
            _loc6_.@level = _loc4_.attributeInfo.lv;
            _loc6_.@party = _loc4_.attributeInfo.getPartyName();
            _loc3_.appendChild(_loc6_);
            _loc5_++;
         }
         this.teamPanel.setSearchResult(_loc3_,this.searchIndex);
      }
      
      private function teamPanelHandel(param1:Event) : void
      {
         var _loc5_:BaseEvent = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:String = null;
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:SceneCharacter = GameInstance.mainChar;
         var _loc4_:String = param1.type;
         _loc5_ = param1 as BaseEvent;
         var _loc6_:int = 0;
         switch(_loc4_)
         {
            case TeamPanel.UI_TEAMPANEL_MYTEAM_SEARCH_PLAYER:
               this.searchKeyword = _loc5_.data as String;
               this.msgSenderProxy.send_10225(this.searchIndex,this.searchKeyword);
               break;
            case TeamPanel.UI_TEAMPANEL_MYTEAM_GET_PREPAGE:
               --this.searchIndex;
               if(this.searchIndex < 1)
               {
                  this.searchIndex = 1;
               }
               this.msgSenderProxy.send_10225(this.searchIndex,this.searchKeyword);
               break;
            case TeamPanel.UI_TEAMPANEL_MYTEAM_GET_NEXTPAGE:
               if(!this.isSearchEnd)
               {
                  ++this.searchIndex;
                  this.msgSenderProxy.send_10225(this.searchIndex,this.searchKeyword);
               }
               break;
            case MainUI.MAINUI_TEAMMEMBERLIST_MOUSEOVER:
               this.msgSenderProxy.send_10211();
               break;
            case TeamPanel.UI_TEAMPANEL_MYTEAM_SHOW:
               this.teamPanel.showMyTeam();
               this.msgSenderProxy.send_10211();
               break;
            case TeamPanel.UI_TEAMPANEL_MYTEAM_CREATETAMEBTN_CLICK:
               this.msgSenderProxy.send_10197();
               break;
            case TeamPanel.UI_TEAMPANEL_MYTEAM_LEAVETEAMBTN_CLICK:
               this.trySend10199();
               break;
            case TeamPanel.UI_TEAMPANEL_MYTEAM_ADDMEMBERBTN_CLICK:
               if(!this.myTeam.isFull())
               {
                  this.teamPanel.showSearchPanel();
               }
               else
               {
                  FAlert.show("<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"对不起，您的队伍已经满员") + "</font></textformat>");
               }
               break;
            case TeamPanel.UI_TEAMPANEL_MYTEAM_ADDMEMBERBTN_MEMBER:
               this.trySend10181(1,-1,_loc5_.data as String);
               break;
            case TeamPanel.UI_TEAMPANEL_MYTEAM_APPOINTLEADERBTN_CLICK:
               this.trySend10201(_loc5_.data as int);
               break;
            case TeamPanel.UI_TEAMPANEL_MYTEAM_DISEMPLOYTEAMBTN_CLICK:
               _loc7_ = _loc5_.data as int;
               if(_loc7_ == GameInstance.mainCharData.teamInfo.teamLeaderID)
               {
                  FAlert.show("<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("对不起，您不能踢出自己") + "</font></textformat>");
               }
               else
               {
                  this.trySend10217(_loc7_);
               }
               break;
            case TeamPanel.UI_TEAMPANEL_MYTEAM_LOOKINFOBTN_CLICK:
               _loc8_ = _loc5_.data as int;
               if(_loc8_ == _loc3_.id)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               else
               {
                  GameInstance.lookPlayerID = _loc5_.data as int;
                  if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
                  }
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               break;
            case TeamPanel.UI_TEAMPANEL_MYTEAM_MODIFT_DECLARE:
               this.msgSenderProxy.send_10195(_loc5_.data as String);
               break;
            case TeamPanel.UI_TEAMPANEL_MYTEAM_SHOW_PREREQUISITE_CHANGE:
               if(_loc5_.data as int == 3)
               {
                  PipeManager.sendMsg(PipeConstants.SETTING_DATA,[SettingKey.K5,_loc5_.action != "yes"]);
               }
               else
               {
                  this.setTeamParms(_loc5_.data as int,_loc5_.action == "yes" ? 1 : 0,false);
               }
               break;
            case TeamPanel.UI_TEAMPANEL_OTHERTEAM_SHOW:
               this.teamPanel.showOtherTeam();
               this.msgSenderProxy.send_10215(this.myTeam.currTeamsPage);
               break;
            case TeamPanel.UI_TEAMPANEL_OTHERTEAM_GET_PAGE:
               _loc9_ = _loc5_.data as int;
               if(_loc9_ == 2)
               {
                  --this.myTeam.currTeamsPage;
               }
               if(_loc9_ == 3)
               {
                  ++this.myTeam.currTeamsPage;
               }
               if(_loc9_ == 4)
               {
                  this.myTeam.currTeamsPage = this.myTeam.maxTeamsPage;
               }
               this.msgSenderProxy.send_10215(this.myTeam.currTeamsPage);
               break;
            case TeamPanel.UI_TEAMPANEL_OTHERTEAM_GET_OTHERTEAM_MEMBERLIST:
               this.msgSenderProxy.send_10209(_loc5_.data as int);
               break;
            case TeamPanel.UI_TEAMPANEL_OTHERTEAM_REFRESH_LIST:
               this.msgSenderProxy.send_10215(this.myTeam.currTeamsPage);
               break;
            case TeamPanel.UI_TEAMPANEL_OTHERTEAM_ADD_TEAM:
               this.msgSenderProxy.send_10187(_loc5_.data as int);
               break;
            case TeamPanel.UI_TEAMPANEL_OTHERPLAYER_SHOW:
               this.teamPanel.showOtherPlayer();
               this.msgSenderProxy.send_10213(this.myTeam.currPlayersPage);
               break;
            case TeamPanel.UI_TEAMPANEL_OTHERPLAYER_GET_PAGE:
               _loc10_ = _loc5_.data as int;
               if(_loc10_ == 1)
               {
                  this.myTeam.currPlayersPage = 1;
               }
               if(_loc10_ == 2)
               {
                  --this.myTeam.currPlayersPage;
               }
               if(_loc10_ == 3)
               {
                  ++this.myTeam.currPlayersPage;
               }
               if(_loc10_ == 4)
               {
                  this.myTeam.currPlayersPage = this.myTeam.maxPlayersPage;
               }
               this.msgSenderProxy.send_10213(this.myTeam.currPlayersPage);
               break;
            case TeamPanel.UI_TEAMPANEL_OTHERPLAYER_SEARCH_PLAYER:
               this.msgSenderProxy.send_10213(this.myTeam.currPlayersPage,_loc5_.action);
               break;
            case TeamPanel.UI_TEAMPANEL_OTHERPLAYER_REFRESH_LIST:
               this.msgSenderProxy.send_10213(this.myTeam.currPlayersPage);
               break;
            case TeamPanel.UI_TEAMPANEL_OTHERPLAYER_INVITE_TEAM:
               this.trySend10181(0,_loc5_.data as int);
               break;
            case TeamPanel.UI_TEAMPANEL_MYTEAM_ORDERBTN_CLICK:
               this.msgSenderProxy.send_10251();
               break;
            case TeamPanel.UI_TEAMPANEL_MYTEAM_ORDER_USE:
               this.msgSenderProxy.send_10255(_loc5_.data as int);
               break;
            case TeamPanel.UI_TEAMPANEL_OTHERPLAYER_MENU_CLICK:
               _loc11_ = _loc5_.data as Array;
               _loc12_ = int(_loc11_[0]);
               _loc13_ = int(_loc11_[1]);
               _loc14_ = _loc11_[2];
               switch(_loc12_)
               {
                  case 1:
                     GameInstance.uiInstance.mainUI.setPrivateChat(_loc14_);
                     break;
                  case 2:
                     GameInstance.lookPlayerID = _loc13_;
                     if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
                     {
                        PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
                     }
                     PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
                     break;
                  case 3:
                     PipeManager.sendMsg(PipeConstants.SEND_ADD_FRIEND,_loc13_);
                     break;
                  case 4:
                     PipeManager.sendMsg(PipeConstants.START_TRADE,_loc13_);
                     break;
                  case 5:
                     PipeManager.sendMsg(PipeConstants.SEND_TEAM_INVITE,_loc13_);
                     break;
                  case 6:
                     PipeManager.sendMsg(PipeConstants.SEND_BANGYAO,_loc13_);
                     break;
                  case 7:
                     PipeManager.sendMsg(PipeConstants.LOOK_OTHERCHAR_SHOP_PANEL,_loc13_);
                     break;
                  case 8:
                     PipeManager.sendMsg(PipeConstants.SHOW_SEND_FLOWER_PANEL,[_loc13_,_loc14_,"100"]);
                     break;
                  case 9:
                     GameInstance.readyJieHunID = _loc13_;
                     PipeManager.sendMsg(PipeConstants.SEND_QIUHUN);
               }
               break;
            case TeamPanel.UI_TEAMPANEL_MYTEAM_4LINGZHENG_CLICK:
               if(GameInstance.mainCharData.attributeInfo.lv < 70)
               {
                  NoticeManager.notify(NoticeManager.FOOT,"人物等级未达到70级");
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"人物等级未达到70级");
               }
               else
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_SILINGZHEN_PANEL);
               }
         }
      }
      
      private function trySend10181(param1:int = 0, param2:int = -1, param3:String = "") : void
      {
         var $type:int = param1;
         var $id:int = param2;
         var $name:String = param3;
         if(ReloginManager.isKuafu3v3Baominging)
         {
            ConfirmManager.confirmBreak3v3Baoming(function():void
            {
               msgSenderProxy.send_10181($type,$id,$name);
            },null);
         }
         else
         {
            this.msgSenderProxy.send_10181($type,$id,$name);
         }
      }
      
      private function trySend10199() : void
      {
         if(ReloginManager.isKuafu3v3Baominging)
         {
            ConfirmManager.confirmBreak3v3Baoming(function():void
            {
               msgSenderProxy.send_10199();
            },null);
         }
         else
         {
            this.msgSenderProxy.send_10199();
         }
      }
      
      private function trySend10201(param1:int) : void
      {
         var $newLeaderID:int = param1;
         if(ReloginManager.isKuafu3v3Baominging)
         {
            ConfirmManager.confirmBreak3v3Baoming(function():void
            {
               msgSenderProxy.send_10201($newLeaderID);
            },null);
         }
         else
         {
            this.msgSenderProxy.send_10201($newLeaderID);
         }
      }
      
      private function trySend10217(param1:int) : void
      {
         var $tiID:int = param1;
         if(ReloginManager.isKuafu3v3Baominging)
         {
            ConfirmManager.confirmBreak3v3Baoming(function():void
            {
               msgSenderProxy.send_10217($tiID);
            },null);
         }
         else
         {
            this.msgSenderProxy.send_10217($tiID);
         }
      }
      
      private function setTeamParms(param1:int, param2:int, param3:Boolean = false) : void
      {
         this.msgSenderProxy.send_10193(param1,param2);
         if(param3)
         {
            if(param1 == 1)
            {
               this.myTeam.enableTeamInvite = param2 == 1;
            }
            else if(param1 == 2)
            {
               this.myTeam.enableMemberJoin = param2 == 1;
            }
            else if(param1 == 3)
            {
               this.myTeam.enableTeamPanel = param2 == 1;
            }
            this.teamPanel.setMyTeamShowPrerequisite(this.myTeam.enableTeamInvite,this.myTeam.enableMemberJoin,this.myTeam.enableTeamPanel);
         }
      }
      
      public function updateZhanfaPanel() : void
      {
         this.teamPanel.showOrderPanel(this.myTeam.zhenfaList);
      }
      
      public function refreshMyTeamMember() : void
      {
         var _loc5_:PurePlayer = null;
         var _loc6_:Object = null;
         var _loc1_:SceneCharacter = GameInstance.mainChar;
         var _loc2_:Array = new Array();
         var _loc3_:Array = new Array();
         if(_loc1_.id == this.myTeam.teamLeaderID)
         {
            this.mainUI.isLeader = true;
         }
         else
         {
            this.mainUI.isLeader = false;
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.myTeam.teamCount)
         {
            _loc5_ = this.myTeam.teamPlayers[_loc4_] as PurePlayer;
            _loc6_ = new Object();
            _loc6_.id = _loc5_.id;
            _loc6_.charName = _loc5_.name;
            _loc6_.headRes = _loc5_.attributeInfo.headImg;
            _loc6_.leader = this.myTeam.teamLeaderID == _loc5_.id ? LanResManager.getLanCommonTextWords("队长") : "";
            _loc6_.level = _loc5_.attributeInfo.lv;
            _loc6_.party = _loc5_.attributeInfo.getPartyName();
            _loc6_.setup = _loc5_.banghuiInfo.banghuiName.length > 0 ? _loc5_.banghuiInfo.banghuiName : "";
            _loc6_.mapName = _loc5_.map;
            _loc6_.xy = _loc5_.mx + "," + _loc5_.my;
            _loc6_.isSame = _loc5_.isSameMap;
            _loc6_.zhiYe = _loc5_.zhiYe;
            if(_loc5_.id != _loc1_.id)
            {
               _loc6_.playerName = _loc5_.name;
               _loc6_.hp = Number(_loc5_.attributeInfo.hpNow);
               _loc6_.hpMax = Number(_loc5_.attributeInfo.hpMax);
               _loc6_.mp = _loc5_.attributeInfo.mpNow;
               _loc6_.mpMax = _loc5_.attributeInfo.mpMax;
               _loc3_.push(_loc6_);
            }
            _loc2_.push(_loc6_);
            _loc4_++;
         }
         this.teamPanel.setMyTeamMember(_loc2_);
         this.mainUI.setTeamMemberList(_loc3_,this.myTeam.zhenfaName,this.myTeam.duiWuId);
         if(this.myTeam.enableTeamPanel)
         {
            this.mainUI.teamMemberListIsShow(_loc3_.length > 0);
         }
         else
         {
            this.mainUI.teamMemberListIsShow(false);
         }
      }
      
      public function updateTeamHPMP() : void
      {
         var _loc4_:PurePlayer = null;
         var _loc5_:Object = null;
         var _loc1_:SceneCharacter = GameInstance.mainChar;
         var _loc2_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < this.myTeam.teamCount)
         {
            _loc4_ = this.myTeam.teamPlayers[_loc3_] as PurePlayer;
            _loc5_ = new Object();
            if(_loc4_.id != _loc1_.id)
            {
               _loc5_.id = _loc4_.id;
               _loc5_.leader = this.myTeam.teamLeaderID == _loc4_.id ? LanResManager.getLanCommonTextWords("队长") : "";
               _loc5_.headRes = _loc4_.attributeInfo.headImg;
               _loc5_.level = _loc4_.attributeInfo.lv;
               _loc5_.playerName = _loc4_.name;
               _loc5_.hp = Number(_loc4_.attributeInfo.hpNow);
               _loc5_.hpMax = Number(_loc4_.attributeInfo.hpMax);
               _loc5_.mp = _loc4_.attributeInfo.mpNow;
               _loc5_.mpMax = _loc4_.attributeInfo.mpMax;
               _loc5_.isSame = _loc4_.isSameMap;
               _loc5_.zhiYe = _loc4_.zhiYe;
               _loc2_.push(_loc5_);
            }
            _loc3_++;
         }
         this.mainUI.setTeamMemberList(_loc2_,this.myTeam.zhenfaName,this.myTeam.duiWuId);
      }
      
      public function updateTeamPanelState() : void
      {
         var _loc1_:SceneCharacter = GameInstance.mainChar;
         if(this.myTeam.teamID == -1)
         {
            this.teamPanel.setBtnState(0);
         }
         else if(this.myTeam.teamLeaderID == _loc1_.id)
         {
            this.teamPanel.setBtnState(1);
         }
         else
         {
            this.teamPanel.setBtnState(2);
         }
         this.teamPanel.setOrderName(this.myTeam.zhenfaName);
         this.teamPanel.setMyTeamDeclare(this.myTeam.teamDeclare);
         this.refreshMyTeamMember();
         this.teamPanel.setMyTeamShowPrerequisite(this.myTeam.enableTeamInvite,this.myTeam.enableMemberJoin,this.myTeam.enableTeamPanel);
      }
      
      public function updateOtherTeams() : void
      {
         var _loc3_:XML = null;
         var _loc4_:TeamInfo = null;
         var _loc1_:XML = <list/>;
         var _loc2_:int = 0;
         while(_loc2_ < this.myTeam.nearbyTeamsCount)
         {
            _loc3_ = <node label="id" declare={LanResManager.getLanCommonTextWords("宣言")} leader={LanResManager.getLanCommonTextWords("队长名字")} level={LanResManager.getLanCommonTextWords("队伍等级")} count={LanResManager.getLanCommonTextWords("人数")} order={LanResManager.getLanCommonTextWords("阵法名字")}/>;
            _loc4_ = this.myTeam.nearbyTeams[_loc2_] as TeamInfo;
            _loc3_.@label = _loc4_.teamID;
            _loc3_.@declare = _loc4_.teamDeclare;
            _loc3_.@leader = _loc4_.teamLeaderName;
            _loc3_.@level = _loc4_.teamLevel;
            _loc3_.@count = _loc4_.teamCount;
            _loc3_.@order = _loc4_.zhenfaName;
            _loc1_.appendChild(_loc3_);
            _loc2_++;
         }
         this.teamPanel.setOtherTeamList(_loc1_,this.myTeam.maxTeamsPage,this.myTeam.currTeamsPage,this.myTeam.currTeamsPage == 1,this.myTeam.currTeamsPage == this.myTeam.maxTeamsPage);
      }
      
      public function updateCurrTeam(param1:TeamInfo) : void
      {
         var _loc4_:XML = null;
         var _loc5_:PurePlayer = null;
         var _loc2_:XML = <list/>;
         var _loc3_:int = 0;
         while(_loc3_ < param1.teamPlayers.length)
         {
            _loc4_ = <node label="id" memberName={LanResManager.getLanCommonTextWords("成员名字")} level={LanResManager.getLanCommonTextWords("等级")} party={LanResManager.getLanCommonTextWords("门派")}/>;
            _loc5_ = param1.teamPlayers[_loc3_] as PurePlayer;
            _loc4_.@label = _loc5_.id;
            _loc4_.@memberName = _loc5_.name;
            _loc4_.@level = _loc5_.attributeInfo.lv;
            _loc4_.@party = _loc5_.attributeInfo.getPartyName();
            _loc2_.appendChild(_loc4_);
            _loc3_++;
         }
         this.teamPanel.setOtherTeamMemberList(_loc2_);
      }
      
      public function updateOtherPlayers() : void
      {
         var _loc3_:XML = null;
         var _loc4_:PurePlayer = null;
         var _loc1_:XML = <list/>;
         var _loc2_:int = 0;
         while(_loc2_ < this.myTeam.nearbyPlayersCount)
         {
            _loc3_ = <node label="id" playerName="玩家名字" level="等级" party="门派" setup="帮派" title="称号" mateid="配偶id" mate="配偶名字" mateIsLine="0不在线|1在线"/>;
            _loc4_ = this.myTeam.nearbyPlayers[_loc2_] as PurePlayer;
            _loc3_.@label = _loc4_.id;
            _loc3_.@playerName = _loc4_.name;
            _loc3_.@level = _loc4_.attributeInfo.lv;
            _loc3_.@party = _loc4_.attributeInfo.getPartyName();
            _loc3_.@setup = _loc4_.banghuiInfo.banghuiName;
            _loc3_.@title = _loc4_.achieveInfo.getCurrentTitle();
            _loc3_.@mateid = _loc4_.spouseData.peiouID;
            _loc3_.@mate = _loc4_.spouseData.name;
            _loc3_.@mateIsLine = _loc4_.spouseData.isOnline;
            _loc1_.appendChild(_loc3_);
            _loc2_++;
         }
         this.teamPanel.setOtherPlayerList(_loc1_,this.myTeam.maxPlayersPage,this.myTeam.currPlayersPage,this.myTeam.currPlayersPage == 1,this.myTeam.currPlayersPage == this.myTeam.maxPlayersPage);
      }
      
      private function onShowTeamPanel(param1:Event) : void
      {
      }
      
      public function showInviteTips(param1:int, param2:String, param3:int) : void
      {
         var $id:int = param1;
         var $name:String = param2;
         var $lv:int = param3;
         this.mainUI.showICOTip(MainUI.TYPE_TEAM_TIP,function():void
         {
            FAlert.okLabel = LanResManager.getLanCommonTextWords("同意");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("拒绝");
            FAlert.show("<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家名") + "：" + $name + "  <br>" + LanResManager.getLanCommonTextWords("等级") + "：" + $lv + "<br>" + LanResManager.getLanTextWords(Team_Mediator,"邀请你加入队伍") + "</font></textformat>","",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  msgSenderProxy.send_10185(1,$id);
               }
               else
               {
                  msgSenderProxy.send_10185(0,$id);
               }
            },false);
         });
      }
      
      public function showJoinTips(param1:int, param2:String, param3:int) : void
      {
         var $id:int = param1;
         var $name:String = param2;
         var $lv:int = param3;
         this.mainUI.showICOTip(MainUI.TYPE_TEAM_TIP,function():void
         {
            FAlert.okLabel = LanResManager.getLanCommonTextWords("同意");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("拒绝");
            FAlert.show("<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家名") + "：" + $name + "  <br>" + LanResManager.getLanCommonTextWords("等级") + "：" + $lv + "<br>" + LanResManager.getLanTextWords(Team_Mediator,"申请加入您的队伍") + "</font></textformat>","",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  msgSenderProxy.send_10191(1,$id);
               }
               else
               {
                  msgSenderProxy.send_10191(0,$id);
               }
            },false);
         });
      }
      
      public function showUpgradeLeaderTips(param1:int, param2:String) : void
      {
         var $id:int = param1;
         var $name:String = param2;
         this.mainUI.showICOTip(MainUI.TYPE_TEAM_TIP,function():void
         {
            FAlert.okLabel = LanResManager.getLanCommonTextWords("同意");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("拒绝");
            FAlert.show("<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家名") + "：" + $name + "  <br>" + "<br>" + LanResManager.getLanTextWords(Team_Mediator,"希望提升您为本队队长") + "</font></textformat>","",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  msgSenderProxy.send_10205(1,$id);
               }
               else
               {
                  msgSenderProxy.send_10205(0,$id);
               }
            },false);
         });
      }
   }
}

