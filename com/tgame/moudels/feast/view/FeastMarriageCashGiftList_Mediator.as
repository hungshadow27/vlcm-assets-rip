package com.tgame.moudels.feast.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.feast.model.Feast_MsgSenderProxy;
   import com.tgame.shell.view.components.MarriageCashGiftListPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class FeastMarriageCashGiftList_Mediator extends Mediator
   {
      
      public static const NAME:String = "FeastMarriageCashGiftList_Mediator";
      
      private var _currentPage:int = 1;
      
      private var _tatolPage:int = 1;
      
      private var _selectUserObj:Object;
      
      private var _selectUserID:int = 0;
      
      private var _selectEvt:MouseEvent;
      
      private var _menu:Menu;
      
      private var _menuItem:Array = [LanResManager.getLanCommonTextWords("查看"),LanResManager.getLanCommonTextWords("密聊"),LanResManager.getLanCommonTextWords("加友"),LanResManager.getLanCommonTextWords("赠花"),LanResManager.getLanCommonTextWords("交易"),LanResManager.getLanCommonTextWords("帮邀"),LanResManager.getLanCommonTextWords("看摊")];
      
      private var _msgSenderProxy:Feast_MsgSenderProxy;
      
      public function FeastMarriageCashGiftList_Mediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Feast_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Feast_MsgSenderProxy.NAME) as Feast_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get marriageCashGiftListPanel() : MarriageCashGiftListPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.marriageCashGiftListPanel);
         }
         return viewComponent as MarriageCashGiftListPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(MarriageCashGiftListPanel,function():void
         {
            marriageCashGiftListPanel.addEventListener(Event.ADDED_TO_STAGE,initEventsListener);
            marriageCashGiftListPanel.addEventListener(MarriageCashGiftListPanel.UI_MARRIAGE_CASH_GIFT_LIST_PAGE,initEventsListener);
            marriageCashGiftListPanel.addEventListener(MarriageCashGiftListPanel.UI_MARRIAGE_CASH_GIFT_LIST_SHOW_MENU,initEventsListener);
            marriageCashGiftListPanel.addEventListener(MarriageCashGiftListPanel.UI_MARRIAGE_CASH_GIFT_LIST_GET,initEventsListener);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MarriageCashGiftListPanel,function():void
         {
            marriageCashGiftListPanel.removeEventListener(Event.ADDED_TO_STAGE,initEventsListener);
            marriageCashGiftListPanel.removeEventListener(MarriageCashGiftListPanel.UI_MARRIAGE_CASH_GIFT_LIST_PAGE,initEventsListener);
            marriageCashGiftListPanel.removeEventListener(MarriageCashGiftListPanel.UI_MARRIAGE_CASH_GIFT_LIST_SHOW_MENU,initEventsListener);
            marriageCashGiftListPanel.removeEventListener(MarriageCashGiftListPanel.UI_MARRIAGE_CASH_GIFT_LIST_GET,initEventsListener);
         });
      }
      
      private function initEventsListener(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:Object = null;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this._currentPage = 1;
               this._tatolPage = 1;
               this.marriageCashGiftListPanel.setData(<list/>,this._currentPage,this._tatolPage);
               this.marriageCashGiftListPanel.setName("");
               this.marriageCashGiftListPanel.setPlayCount(0);
               this.marriageCashGiftListPanel.setGiftCount(0);
               this.marriageCashGiftListPanel.setSurplus(0);
               this.msgSenderProxy.send_52251(this._currentPage);
               break;
            case MarriageCashGiftListPanel.UI_MARRIAGE_CASH_GIFT_LIST_PAGE:
               _loc2_ = param1 as BaseEvent;
               ZLog.add("0上一页 1下一页：" + _loc2_.data);
               if(_loc2_.data == 0)
               {
                  if(this._currentPage > 1)
                  {
                     --this._currentPage;
                     this.msgSenderProxy.send_52251(this._currentPage);
                  }
               }
               else if(this._currentPage < this._tatolPage)
               {
                  ++this._currentPage;
                  this.msgSenderProxy.send_52251(this._currentPage);
               }
               break;
            case MarriageCashGiftListPanel.UI_MARRIAGE_CASH_GIFT_LIST_SHOW_MENU:
               _loc2_ = param1 as BaseEvent;
               _loc3_ = _loc2_.data;
               this._selectUserObj = _loc3_[0] as Object;
               this._selectUserID = this._selectUserObj.id;
               this._selectEvt = _loc3_[1] as MouseEvent;
               if(this._menu != null)
               {
                  this._menu.removeEventListener(Menu.MENUITEM_CLICK,this.onItemMenuClick);
                  this._menu.destroy();
               }
               this._menu = Menu.addMenuItem(this._menuItem,this._selectEvt);
               this._menu.addEventListener(Menu.MENUITEM_CLICK,this.onItemMenuClick);
               break;
            case MarriageCashGiftListPanel.UI_MARRIAGE_CASH_GIFT_LIST_GET:
               PipeManager.sendMsg(PipeConstants.SHOW_MARRIAGE_CASH_GIFT_LIS_PLANE);
               this.msgSenderProxy.send_52259();
         }
      }
      
      public function onItemMenuClick(param1:BaseEvent) : void
      {
         if(this._selectUserID <= 0)
         {
            return;
         }
         if(this._selectUserObj == null || this._selectUserObj.label == "")
         {
            return;
         }
         var _loc2_:String = param1.data.toString();
         switch(_loc2_)
         {
            case LanResManager.getLanCommonTextWords("查看"):
               GameInstance.lookPlayerID = this._selectUserID;
               if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               break;
            case LanResManager.getLanCommonTextWords("密聊"):
               GameInstance.uiInstance.mainUI.setPrivateChat(this._selectUserObj.label);
               break;
            case LanResManager.getLanCommonTextWords("加友"):
               PipeManager.sendMsg(PipeConstants.SEND_ADD_FRIEND,this._selectUserID);
               break;
            case LanResManager.getLanCommonTextWords("赠花"):
               if(!Fun.isVisible(GameInstance.uiInstance._backpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_SEND_FLOWER_PANEL,[this._selectUserID,this._selectUserObj.label,this._selectUserObj.lv]);
               break;
            case LanResManager.getLanCommonTextWords("交易"):
               PipeManager.sendMsg(PipeConstants.START_TRADE,this._selectUserID);
               break;
            case LanResManager.getLanCommonTextWords("帮邀"):
               PipeManager.sendMsg(PipeConstants.SEND_BANGYAO,this._selectUserID);
               break;
            case LanResManager.getLanCommonTextWords("看摊"):
               PipeManager.sendMsg(PipeConstants.LOOK_OTHERCHAR_SHOP_PANEL,this._selectUserID);
         }
      }
      
      public function updateHongbaoList(param1:int, param2:int, param3:Array, param4:String, param5:int, param6:Number, param7:Number, param8:int) : void
      {
         var _loc12_:Object = null;
         var _loc13_:XML = null;
         if(param1 != this._currentPage)
         {
            return;
         }
         this._tatolPage = param2;
         var _loc9_:XML = <list/>;
         var _loc10_:int = int(param3.length);
         var _loc11_:int = 0;
         while(_loc11_ < _loc10_)
         {
            _loc12_ = param3[_loc11_];
            _loc13_ = <node label={_loc12_.userName} id={_loc12_.userID} lv={_loc12_.lv} count={_loc12_.copper} isLine={_loc12_.isLine}/>;
            _loc9_.appendChild(_loc13_);
            _loc11_++;
         }
         this.marriageCashGiftListPanel.setData(_loc9_,this._currentPage,this._tatolPage);
         this.marriageCashGiftListPanel.setName(param4);
         this.marriageCashGiftListPanel.setPlayCount(param5);
         this.marriageCashGiftListPanel.setGiftCount(param6);
         this.marriageCashGiftListPanel.setSurplus(param7);
      }
   }
}

