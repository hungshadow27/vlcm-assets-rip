package com.tgame.moudels.banghui.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.BangzhongZhiwu;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.banghui.Banghui_ApplicationFacade;
   import com.tgame.moudels.banghui.model.Banghui_MsgSenderProxy;
   import com.tgame.shell.view.components.Party_memberManagePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.TimerManager;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Banghui_BanghuiMemberListPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Banghui_BanghuiMemberListPanelMediator";
      
      private var _pageCount:int = 10;
      
      private var _showCondition:int = 2;
      
      private var _currentPage:int = 1;
      
      private var _maxPage:int = 1;
      
      private var _selectUserObj:Object;
      
      private var _selectUserID:int = 0;
      
      private var _selectEvt:MouseEvent;
      
      private var _menu:Menu;
      
      private var _menuItem:Array = [LanResManager.getLanTextWords(this,"查看资料"),LanResManager.getLanTextWords(this,"加为好友"),LanResManager.getLanTextWords(this,"更改职务"),LanResManager.getLanTextWords(this,"更改称号")];
      
      private var _menuItem2:Array = [LanResManager.getLanTextWords(this,"禅让帮主"),LanResManager.getLanTextWords(this,"任命副帮主"),LanResManager.getLanTextWords(this,"任命大长老"),LanResManager.getLanTextWords(this,"任命大师兄"),LanResManager.getLanTextWords(this,"任命大师姐"),LanResManager.getLanTextWords(this,"任命帮众")];
      
      private var _selectKey:String = "";
      
      private var _select_currentPage:int = 1;
      
      private var _senderProxy:Banghui_MsgSenderProxy;
      
      public function Banghui_BanghuiMemberListPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : Banghui_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Banghui_MsgSenderProxy.NAME) as Banghui_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Banghui_ApplicationFacade.SEND_BANGYAO];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Banghui_ApplicationFacade.SEND_BANGYAO:
               _loc3_ = _loc2_ as int;
               if(GameInstance.mainCharData.banghuiInfo.banghuiId > 0)
               {
                  this.senderProxy.send_51043(_loc3_);
               }
               else
               {
                  this.senderProxy.send_51077(_loc3_);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(Party_memberManagePanel,function():void
         {
            GameInstance.uiInstance.banghuiMemberListPanel.addEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_SHOW_QUALIFICATION,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.addEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_SHOW_MENU,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.addEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_ISAUTO_ACCEPT_INVITE,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.addEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_ADD_MEMBER,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.addEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_REMOVE_MEMBER,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.addEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_DISBAND_PARTY,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.addEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_EXIT_PARTY,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.addEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_INVITE_JOIN_PARTY,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.addEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_SEARCH,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.addEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_PRE_PAGE,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.addEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_NEXT_PAGE,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(Party_memberManagePanel,function():void
         {
            GameInstance.uiInstance.banghuiMemberListPanel.removeEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_SHOW_QUALIFICATION,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.removeEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_SHOW_MENU,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.removeEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_ISAUTO_ACCEPT_INVITE,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.removeEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_ADD_MEMBER,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.removeEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_REMOVE_MEMBER,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.removeEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_DISBAND_PARTY,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.removeEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_EXIT_PARTY,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.removeEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_INVITE_JOIN_PARTY,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.removeEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_SEARCH,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.removeEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_PRE_PAGE,uiHandle);
            GameInstance.uiInstance.banghuiMemberListPanel.removeEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_NEXT_PAGE,uiHandle);
         });
         EventDispatchCenter.getInstance().addEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_PLAYER_CHATTRIBUTE_LOOK,this.uiHandle);
         EventDispatchCenter.getInstance().addEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_CHANGE_CHENGHAO,this.uiHandle);
         EventDispatchCenter.getInstance().addEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_JOIN_ISOK,this.uiHandle);
         EventDispatchCenter.getInstance().addEventListener(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_APPLICATION_ISOK,this.uiHandle);
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc5_:Object = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:BanghuiInfo = _loc2_.banghuiInfo;
         var _loc4_:String = param1.type;
         _loc5_ = (param1 as BaseEvent).data;
         switch(_loc4_)
         {
            case Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_SHOW_QUALIFICATION:
               _loc6_ = _loc5_ as Array;
               this._pageCount = _loc6_[0];
               this._showCondition = _loc6_[1];
               _loc7_ = int(_loc6_[2]);
               if(_loc7_ == 0)
               {
                  _loc8_ = 1;
               }
               else if(_loc7_ == 1)
               {
                  _loc8_ = this._currentPage - 1;
                  if(_loc8_ <= 0)
                  {
                     _loc8_ = 1;
                  }
               }
               else if(_loc7_ == 2)
               {
                  _loc8_ = this._currentPage + 1;
                  if(_loc8_ >= this._maxPage)
                  {
                     _loc8_ = this._maxPage;
                  }
               }
               else if(_loc7_ == 3)
               {
                  _loc8_ = this._maxPage;
               }
               this.senderProxy.send_51035([this._showCondition,this._pageCount,_loc8_]);
               break;
            case Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_ISAUTO_ACCEPT_INVITE:
               _loc9_ = _loc5_ as Boolean ? 1 : 0;
               this.senderProxy.send_51067(_loc9_);
               break;
            case Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_ADD_MEMBER:
               this._select_currentPage = 1;
               GameInstance.uiInstance.banghuiMemberListPanel.showSearchPlayerPanel();
               break;
            case Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_REMOVE_MEMBER:
               _loc10_ = _loc5_ as int;
               this.senderProxy.send_51049(_loc10_);
               break;
            case Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_DISBAND_PARTY:
               this.senderProxy.send_51053();
               break;
            case Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_EXIT_PARTY:
               this.senderProxy.send_51057();
               break;
            case Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_CHANGE_CHENGHAO:
               _loc6_ = _loc5_ as Array;
               this.senderProxy.send_51061(_loc6_);
               break;
            case Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_PLAYER_CHATTRIBUTE_LOOK:
               _loc10_ = _loc5_ as int;
               GameInstance.lookPlayerID = _loc10_;
               if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               break;
            case Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_APPLICATION_ISOK:
               _loc6_ = _loc5_ as Array;
               _loc6_ = [_loc6_[0],_loc6_[1] ? 1 : 0];
               this.senderProxy.send_51041(_loc6_);
               break;
            case Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_JOIN_ISOK:
               _loc6_ = _loc5_ as Array;
               _loc6_ = [_loc6_[0],_loc6_[2] ? 1 : 0];
               this.senderProxy.send_51045(_loc6_);
               break;
            case Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_INVITE_JOIN_PARTY:
               _loc10_ = _loc5_ as int;
               this.senderProxy.send_51043(_loc10_);
               break;
            case Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_SEARCH:
               _loc11_ = _loc5_ as String;
               this._selectKey = _loc11_;
               this.senderProxy.send_51047([this._selectKey,1]);
               break;
            case Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_PRE_PAGE:
               _loc8_ = this._select_currentPage - 1;
               if(_loc8_ <= 0)
               {
                  _loc8_ = 1;
               }
               this.senderProxy.send_51047([this._selectKey,_loc8_]);
               break;
            case Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_NEXT_PAGE:
               _loc8_ = this._select_currentPage + 1;
               this.senderProxy.send_51047([this._selectKey,_loc8_]);
               break;
            case Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_SHOW_MENU:
               this._selectUserObj = _loc5_[0] as Object;
               this._selectUserID = this._selectUserObj.id;
               this._selectEvt = _loc5_[1] as MouseEvent;
               if(this._menu != null)
               {
                  this._menu.removeEventListener(Menu.MENUITEM_CLICK,this.onItemMenuClick);
                  this._menu.destroy();
               }
               this._menu = Menu.addMenuItem(this._menuItem,this._selectEvt);
               this._menu.addEventListener(Menu.MENUITEM_CLICK,this.onItemMenuClick);
         }
      }
      
      public function f5() : void
      {
         this.senderProxy.send_51035([this._showCondition,this._pageCount,this._currentPage]);
      }
      
      public function onItemMenuClick(param1:BaseEvent) : void
      {
         var userID:int = 0;
         var msg:String = null;
         var e:BaseEvent = param1;
         var btnName:String = e.data.toString();
         switch(btnName)
         {
            case LanResManager.getLanTextWords(this,"查看资料"):
               GameInstance.lookPlayerID = this._selectUserID;
               if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               break;
            case LanResManager.getLanTextWords(this,"加为好友"):
               PipeManager.sendMsg(PipeConstants.SEND_ADD_FRIEND,this._selectUserID);
               break;
            case LanResManager.getLanTextWords(this,"更改职务"):
               if(GameInstance.mainCharData.banghuiInfo.zhiwu == BangzhongZhiwu.ZW1)
               {
                  if(this._menu != null)
                  {
                     this._menu.removeEventListener(Menu.MENUITEM_CLICK,this.onItemMenuClick);
                     this._menu.destroy();
                  }
                  TimerManager.createTimer(200,1,function fun():void
                  {
                     _menu = Menu.addMenuItem(_menuItem2,_selectEvt);
                     _menu.addEventListener(Menu.MENUITEM_CLICK,onItemMenuClick);
                  });
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"只有帮主有权限更改职务"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"只有帮主有权限更改职务"));
               }
               break;
            case LanResManager.getLanTextWords(this,"更改称号"):
               if(GameInstance.mainCharData.banghuiInfo.zhiwu != BangzhongZhiwu.ZW0)
               {
                  GameInstance.uiInstance.banghuiMemberListPanel.showChangeChengHaoPanel(this._selectUserID,this._selectUserObj.nickName,this._selectUserObj.head,this._selectUserObj.label,this._selectUserObj.lv,GameInstance.mainCharData.banghuiInfo.banghuiName,this._selectUserObj.setup);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您的权限不足"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您的权限不足"));
               }
               break;
            case LanResManager.getLanTextWords(this,"禅让帮主"):
               userID = this._selectUserID;
               msg = LanResManager.getLanTextWords(this,"确认将帮主禅让给",[this._selectUserObj.nickName]);
               FAlert.show(msg,"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     senderProxy.send_51059([userID,BangzhongZhiwu.ZW1]);
                  }
               },true);
               break;
            case LanResManager.getLanTextWords(this,"任命副帮主"):
               this.senderProxy.send_51059([this._selectUserID,BangzhongZhiwu.ZW2]);
               break;
            case LanResManager.getLanTextWords(this,"任命大长老"):
               this.senderProxy.send_51059([this._selectUserID,BangzhongZhiwu.ZW3]);
               break;
            case LanResManager.getLanTextWords(this,"任命大师兄"):
               this.senderProxy.send_51059([this._selectUserID,BangzhongZhiwu.ZW4]);
               break;
            case LanResManager.getLanTextWords(this,"任命大师姐"):
               this.senderProxy.send_51059([this._selectUserID,BangzhongZhiwu.ZW5]);
               break;
            case LanResManager.getLanTextWords(this,"任命帮众"):
               this.senderProxy.send_51059([this._selectUserID,BangzhongZhiwu.ZW0]);
         }
      }
      
      public function receive_banghuiMemberList(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Number, param7:int, param8:int, param9:int, param10:int, param11:Array, param12:int) : void
      {
         var _loc14_:Array = null;
         var _loc15_:int = 0;
         var _loc16_:String = null;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:String = null;
         var _loc23_:Number = NaN;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:String = null;
         var _loc29_:String = null;
         var _loc30_:String = null;
         var _loc31_:XML = null;
         if(this._showCondition != param1)
         {
            return;
         }
         if(this._pageCount != param2)
         {
            return;
         }
         this._currentPage = param3;
         this._maxPage = param4;
         var _loc13_:XML = <list/>;
         for each(_loc14_ in param11)
         {
            _loc15_ = int(_loc14_[0]);
            _loc16_ = _loc14_[1];
            _loc17_ = int(_loc14_[2]);
            _loc18_ = int(_loc14_[3]);
            _loc19_ = int(_loc14_[4]);
            _loc20_ = int(_loc14_[5]);
            _loc21_ = int(_loc14_[6]);
            _loc22_ = _loc14_[7];
            _loc23_ = Number(_loc14_[8]);
            _loc24_ = int(_loc14_[9]);
            _loc25_ = int(_loc14_[10]);
            _loc26_ = int(_loc14_[11]);
            _loc27_ = int(_loc14_[12]);
            _loc28_ = PartyType.getName(_loc19_);
            _loc29_ = BangzhongZhiwu.getNameByValue(_loc21_);
            _loc30_ = HeadResChange.headResChangeToString(_loc18_);
            _loc31_ = <node label={_loc16_} id={_loc15_} isLine={_loc20_} head={_loc30_} setup={_loc28_} setupID={_loc19_} lv={_loc17_} lvIsTop={_loc17_ == param5 ? 1 : 0} job={_loc29_} jobID={_loc21_} nickName={_loc22_} kungfuLv={_loc23_} kungfuLvIsTop={_loc23_ == param6 ? 1 : 0} jingmaiLv={_loc24_} jingmaiLvIsTop={_loc24_ == param7 ? 1 : 0} chengjiuLv={_loc25_} chengjiuLvIsTop={_loc25_ == param8 ? 1 : 0} shengwang={_loc26_} shengwangIsTop={_loc26_ == param9 ? 1 : 0} boss={_loc27_} bossIsTop={_loc27_ == param10 ? 1 : 0}/>;
            _loc13_.appendChild(_loc31_);
         }
         GameInstance.uiInstance.banghuiMemberListPanel.setDataProvider(_loc13_,this._maxPage,this._currentPage);
         GameInstance.uiInstance.banghuiMemberListPanel.checkBox.selectState = param12 == 1;
         if(GameInstance.mainCharData.banghuiInfo.zhiwu == BangzhongZhiwu.ZW1)
         {
            GameInstance.uiInstance.banghuiMemberListPanel.checkBox.enabled = true;
         }
         else
         {
            GameInstance.uiInstance.banghuiMemberListPanel.checkBox.enabled = false;
         }
      }
      
      public function showApplicationPanel(param1:int, param2:String, param3:String, param4:String, param5:String, param6:String) : void
      {
         GameInstance.uiInstance.banghuiMemberListPanel.showApplicationPanel(param1,param2,param3,param4,param5,param6);
      }
      
      public function showInvitePanel(param1:int, param2:int, param3:String, param4:String, param5:String, param6:String, param7:String) : void
      {
         GameInstance.uiInstance.banghuiMemberListPanel.showInvitePanel(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setSearchPanelList(param1:String, param2:int, param3:Array) : void
      {
         var _loc5_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         var _loc13_:XML = null;
         if(this._selectKey != param1)
         {
            return;
         }
         this._select_currentPage = param2;
         var _loc4_:XML = <list/>;
         var _loc6_:* = 1;
         for each(_loc5_ in param3)
         {
            _loc7_ = int(_loc5_[0]);
            _loc8_ = _loc5_[1];
            _loc9_ = int(_loc5_[2]);
            _loc10_ = int(_loc5_[3]);
            _loc11_ = PartyType.getName(_loc10_);
            _loc12_ = this._select_currentPage * 5 + _loc6_++;
            _loc13_ = <node label={_loc7_} number={_loc12_} playerName={_loc8_} level={_loc9_} party={_loc11_}/>;
            _loc4_.appendChild(_loc13_);
         }
         GameInstance.uiInstance.banghuiMemberListPanel.setSearchPanelList(_loc4_,this._select_currentPage);
      }
   }
}

