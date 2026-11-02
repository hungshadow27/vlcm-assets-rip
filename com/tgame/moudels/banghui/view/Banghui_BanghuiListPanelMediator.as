package com.tgame.moudels.banghui.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.banghui.model.Banghui_MsgSenderProxy;
   import com.tgame.shell.view.components.PartyListPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Banghui_BanghuiListPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Banghui_BanghuiListPanelMediator";
      
      private var _pageCount:int = 10;
      
      private var _showCondition:int = 0;
      
      private var _currentPage:int = 1;
      
      private var _maxPage:int = 1;
      
      private var _selectBanghuiID:int = 0;
      
      private var _selectBangzhuID:int = 0;
      
      private var _selectBangzhu_isOnline:int = 0;
      
      private var _menu:Menu;
      
      private var _menuItem:Array = [LanResManager.getLanTextWords(this,"查看帮主"),LanResManager.getLanTextWords(this,"查看帮会"),LanResManager.getLanTextWords(this,"加为好友"),LanResManager.getLanTextWords(this,"申请入帮")];
      
      private var _senderProxy:Banghui_MsgSenderProxy;
      
      public function Banghui_BanghuiListPanelMediator()
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
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(PartyListPanel,function():void
         {
            GameInstance.uiInstance.banghuiListPanel.addEventListener(PartyListPanel.UI_PARTYPANEL_PARTYLIST_SHOW_QUALIFICATION,uiHandle);
            GameInstance.uiInstance.banghuiListPanel.addEventListener(PartyListPanel.UI_PARTYPANEL_PARTYLIST_ISAUTO_ACCEPT_INVITE,uiHandle);
            GameInstance.uiInstance.banghuiListPanel.addEventListener(PartyListPanel.UI_PARTYPANEL_PARTYLIST_CREATE_PARTY,uiHandle);
            GameInstance.uiInstance.banghuiListPanel.addEventListener(PartyListPanel.UI_PARTYPANEL_PARTYLIST_PARTY_APPLICATION,uiHandle);
            GameInstance.uiInstance.banghuiListPanel.addEventListener(PartyListPanel.UI_PARTYPANEL_PARTY_XIANGYANG_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiListPanel.addEventListener(PartyListPanel.UI_PARTYPANEL_PARTYLIST_SHOW_MENU,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(PartyListPanel,function():void
         {
            GameInstance.uiInstance.banghuiListPanel.removeEventListener(PartyListPanel.UI_PARTYPANEL_PARTYLIST_SHOW_QUALIFICATION,uiHandle);
            GameInstance.uiInstance.banghuiListPanel.removeEventListener(PartyListPanel.UI_PARTYPANEL_PARTYLIST_ISAUTO_ACCEPT_INVITE,uiHandle);
            GameInstance.uiInstance.banghuiListPanel.removeEventListener(PartyListPanel.UI_PARTYPANEL_PARTYLIST_CREATE_PARTY,uiHandle);
            GameInstance.uiInstance.banghuiListPanel.removeEventListener(PartyListPanel.UI_PARTYPANEL_PARTYLIST_PARTY_APPLICATION,uiHandle);
            GameInstance.uiInstance.banghuiListPanel.removeEventListener(PartyListPanel.UI_PARTYPANEL_PARTY_XIANGYANG_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiListPanel.removeEventListener(PartyListPanel.UI_PARTYPANEL_PARTYLIST_SHOW_MENU,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc5_:Object = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:MouseEvent = null;
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:BanghuiInfo = _loc2_.banghuiInfo;
         var _loc4_:String = param1.type;
         _loc5_ = (param1 as BaseEvent).data;
         switch(_loc4_)
         {
            case PartyListPanel.UI_PARTYPANEL_PARTYLIST_SHOW_QUALIFICATION:
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
               this.senderProxy.send_51031([this._showCondition,this._pageCount,_loc8_]);
               break;
            case PartyListPanel.UI_PARTYPANEL_PARTYLIST_ISAUTO_ACCEPT_INVITE:
               _loc9_ = _loc5_ as Boolean ? 1 : 0;
               this.senderProxy.send_51065(_loc9_);
               break;
            case PartyListPanel.UI_PARTYPANEL_PARTYLIST_CREATE_PARTY:
               if(GameInstance.mainCharData.banghuiInfo.banghuiId <= 0)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_CREAT_PANEL);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您已经在帮会内"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已经在帮会内"));
               }
               break;
            case PartyListPanel.UI_PARTYPANEL_PARTYLIST_PARTY_APPLICATION:
               _loc10_ = _loc5_ as int;
               if(GameInstance.mainCharData.banghuiInfo.banghuiId <= 0)
               {
                  this.senderProxy.send_51039(_loc10_);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您已经在帮会内，不能申请入帮"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已经在帮会内，不能申请入帮"));
               }
               break;
            case PartyListPanel.UI_PARTYPANEL_PARTY_XIANGYANG_SHOW:
               PipeManager.sendMsg(PipeConstants.SHOW_GONGCHENG_XIANGYANGGUISHU_PANEL);
               break;
            case PartyListPanel.UI_PARTYPANEL_PARTYLIST_SHOW_MENU:
               this._selectBanghuiID = int(_loc5_[0].id);
               this._selectBangzhuID = int(_loc5_[0].bangzhuID);
               this._selectBangzhu_isOnline = int(_loc5_[0].isLine);
               _loc11_ = _loc5_[1] as MouseEvent;
               if(this._menu != null)
               {
                  this._menu.removeEventListener(Menu.MENUITEM_CLICK,this.onItemMenuClick);
                  this._menu.destroy();
               }
               this._menu = Menu.addMenuItem(this._menuItem,_loc11_);
               this._menu.addEventListener(Menu.MENUITEM_CLICK,this.onItemMenuClick);
         }
      }
      
      public function onItemMenuClick(param1:BaseEvent) : void
      {
         var _loc2_:String = param1.data.toString();
         switch(_loc2_)
         {
            case LanResManager.getLanTextWords(this,"查看帮主"):
               if(this._selectBangzhu_isOnline == 1)
               {
                  GameInstance.lookPlayerID = this._selectBangzhuID;
                  if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
                  }
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该玩家当前不在线"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该玩家当前不在线"));
               }
               break;
            case LanResManager.getLanTextWords(this,"查看帮会"):
               GameInstance.lookBanghuiID = this._selectBanghuiID;
               if(Fun.isVisible(GameInstance.uiInstance._banghuiInfoPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_INFO_PANEL);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_INFO_PANEL);
               break;
            case LanResManager.getLanTextWords(this,"加为好友"):
               PipeManager.sendMsg(PipeConstants.SEND_ADD_FRIEND,this._selectBangzhuID);
               break;
            case LanResManager.getLanTextWords(this,"申请入帮"):
               if(GameInstance.mainCharData.banghuiInfo.banghuiId <= 0)
               {
                  this.senderProxy.send_51039(this._selectBanghuiID);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您已经在帮会内，不能申请入帮"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已经在帮会内，不能申请入帮"));
               }
         }
      }
      
      public function receive_banghuiList(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:Array) : void
      {
         var _loc12_:Array = null;
         var _loc13_:int = 0;
         var _loc14_:String = null;
         var _loc15_:String = null;
         var _loc16_:String = null;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:String = null;
         var _loc25_:int = 0;
         var _loc26_:String = null;
         var _loc27_:XML = null;
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
         var _loc11_:XML = <list/>;
         for each(_loc12_ in param10)
         {
            _loc13_ = int(_loc12_[0]);
            _loc14_ = _loc12_[1];
            _loc15_ = _loc12_[2];
            _loc16_ = _loc12_[3];
            _loc17_ = int(_loc12_[4]);
            _loc18_ = int(_loc12_[5]);
            _loc19_ = int(_loc12_[6]);
            _loc20_ = int(_loc12_[7]);
            _loc21_ = int(_loc12_[8]);
            _loc22_ = int(_loc12_[9]);
            _loc23_ = int(_loc12_[10]);
            _loc24_ = _loc12_[11];
            _loc25_ = int(_loc12_[12]);
            _loc26_ = PartyType.getName(_loc18_);
            _loc27_ = <node label={_loc14_} id={_loc13_} bangzhu={_loc16_} bangzhuID={_loc15_} isLine={_loc19_} setup={_loc26_} setupID={_loc18_} memberTotal={_loc20_} memberMax={_loc21_} memberTotalIsTop={_loc20_ == param6 ? 1 : 0} levelTotal={_loc22_} levelTotalIsTop={_loc22_ == param7 ? 1 : 0} flagLevel={_loc23_} flagName={_loc24_} flagLevelIsTop={_loc23_ == param8 ? 1 : 0} bossTotal={_loc25_} bossTotalIsTop={_loc25_ == param9 ? 1 : 0}/>;
            _loc11_.appendChild(_loc27_);
         }
         GameInstance.uiInstance.banghuiListPanel.setDataProvider(_loc11_,this._maxPage,this._currentPage);
      }
   }
}

