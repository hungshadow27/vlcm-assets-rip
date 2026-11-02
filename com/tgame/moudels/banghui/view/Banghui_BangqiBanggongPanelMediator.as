package com.tgame.moudels.banghui.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.BangzhongZhiwu;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.banghui.Banghui_ApplicationFacade;
   import com.tgame.moudels.banghui.model.Banghui_MsgSenderProxy;
   import com.tgame.shell.view.components.PartyContributePanel;
   import com.tgame.shell.view.components.party.Party_contribute_tokenPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Banghui_BangqiBanggongPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Banghui_BangqiBanggongPanelMediator";
      
      private var _pageCount:int = 10;
      
      private var _currentPage:int = 1;
      
      private var _maxPage:int = 1;
      
      private var _gongxianLingpaiPanel:Party_contribute_tokenPanel;
      
      private var _gongxianLingpaiArr:Array = [];
      
      private var _senderProxy:Banghui_MsgSenderProxy;
      
      public function Banghui_BangqiBanggongPanelMediator()
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
         return [Banghui_ApplicationFacade.BANGQI_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Banghui_ApplicationFacade.BANGQI_CHANGED:
               this.f5();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(PartyContributePanel,function():void
         {
            GameInstance.uiInstance.bangqiBanggongPanel.addEventListener(Event.ADDED_TO_STAGE,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.addEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_PARTYLIST_SHOW_QUALIFICATION,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.addEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_CONTRIBUTE_COPPER_BTN_CLICK,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.addEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_CONTRIBUTE_TOKEN_BTN_CLICK,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.addEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_DUIHUANBANGPAIKUOZHANFU_OK,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.addEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_CONTRIBUTE_TOKEN_PUT,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.addEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_CONTRIBUTE_TOKEN_OK,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.addEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_TOKEN_DRAG_ENTER,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.addEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_TOKEN_CLICK,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.addEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_CONTRIBUTE_COPPER_OK,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(PartyContributePanel,function():void
         {
            GameInstance.uiInstance.bangqiBanggongPanel.removeEventListener(Event.ADDED_TO_STAGE,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.removeEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_PARTYLIST_SHOW_QUALIFICATION,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.removeEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_CONTRIBUTE_COPPER_BTN_CLICK,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.removeEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_CONTRIBUTE_TOKEN_BTN_CLICK,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.removeEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_DUIHUANBANGPAIKUOZHANFU_OK,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.removeEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_CONTRIBUTE_TOKEN_PUT,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.removeEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_CONTRIBUTE_TOKEN_OK,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.removeEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_TOKEN_DRAG_ENTER,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.removeEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_TOKEN_CLICK,uiHandle);
            GameInstance.uiInstance.bangqiBanggongPanel.removeEventListener(PartyContributePanel.UI_PARTYFLAGPANEL_CONTRIBUTE_COPPER_OK,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var data:Object = null;
         var arr:Array = null;
         var condition:int = 0;
         var tempCurrentPage:int = 0;
         var itemFace:ItemFace = null;
         var index:int = 0;
         var sendArr:Array = null;
         var goods:Goods = null;
         var e:Event = param1;
         var player:Player = GameInstance.mainCharData;
         var banghuiInfo:BanghuiInfo = player.banghuiInfo;
         var type:String = e.type;
         if(e is BaseEvent)
         {
            data = (e as BaseEvent).data;
         }
         switch(type)
         {
            case Event.ADDED_TO_STAGE:
               this.senderProxy.send_51079();
               break;
            case PartyContributePanel.UI_PARTYFLAGPANEL_PARTYLIST_SHOW_QUALIFICATION:
               arr = data as Array;
               this._pageCount = arr[0];
               condition = int(arr[1]);
               if(condition == 0)
               {
                  tempCurrentPage = 1;
               }
               else if(condition == 1)
               {
                  tempCurrentPage = this._currentPage - 1;
                  if(tempCurrentPage <= 0)
                  {
                     tempCurrentPage = 1;
                  }
               }
               else if(condition == 2)
               {
                  tempCurrentPage = this._currentPage + 1;
                  if(tempCurrentPage >= this._maxPage)
                  {
                     tempCurrentPage = this._maxPage;
                  }
               }
               else if(condition == 3)
               {
                  tempCurrentPage = this._maxPage;
               }
               this.senderProxy.send_51081([this._pageCount,tempCurrentPage]);
               break;
            case PartyContributePanel.UI_PARTYFLAGPANEL_CONTRIBUTE_COPPER_BTN_CLICK:
               GameInstance.uiInstance.bangqiBanggongPanel.showContributeCopperPanel(GameInstance.mainCharData.moneyInfo.copper);
               break;
            case PartyContributePanel.UI_PARTYFLAGPANEL_CONTRIBUTE_TOKEN_BTN_CLICK:
               if(!Fun.isVisible(GameInstance.uiInstance._backpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               }
               this._gongxianLingpaiPanel = GameInstance.uiInstance.bangqiBanggongPanel.showContributeTokenPanel();
               ResizeManager.showDoublePanel(this._gongxianLingpaiPanel,GameInstance.uiInstance.backpack);
               this._gongxianLingpaiPanel.addEventListener(Event.REMOVED_FROM_STAGE,function close1(param1:Event):void
               {
                  _gongxianLingpaiPanel.removeEventListener(Event.REMOVED_FROM_STAGE,close1);
                  ResizeManager.hideDoublePanel();
                  _gongxianLingpaiArr.length = 0;
                  _gongxianLingpaiPanel.setItem(_gongxianLingpaiArr);
                  resumMouseStatus();
               });
               GameInstance.uiInstance.backpack.addEventListener(Event.REMOVED_FROM_STAGE,function close2(param1:Event):void
               {
                  GameInstance.uiInstance.backpack.removeEventListener(Event.REMOVED_FROM_STAGE,close2);
                  ResizeManager.hideDoublePanel();
               });
               break;
            case PartyContributePanel.UI_PARTYFLAGPANEL_CONTRIBUTE_TOKEN_PUT:
               this.changeMouseStatus();
               break;
            case PartyContributePanel.UI_PARTYFLAGPANEL_CONTRIBUTE_TOKEN_OK:
               if(this._gongxianLingpaiArr.length > 0)
               {
                  sendArr = [];
                  for each(goods in this._gongxianLingpaiArr)
                  {
                     sendArr.push([goods.position,goods.id,goods.count]);
                  }
                  this.senderProxy.send_51093(sendArr);
               }
               break;
            case PartyContributePanel.UI_PARTYFLAGPANEL_TOKEN_DRAG_ENTER:
               break;
            case PartyContributePanel.UI_PARTYFLAGPANEL_TOKEN_CLICK:
               itemFace = data as ItemFace;
               index = this._gongxianLingpaiArr.indexOf(itemFace.getItem());
               if(index != -1)
               {
                  this._gongxianLingpaiArr.splice(index,1);
               }
               if(this._gongxianLingpaiPanel != null)
               {
                  this._gongxianLingpaiPanel.setItem(this._gongxianLingpaiArr);
               }
               break;
            case PartyContributePanel.UI_PARTYFLAGPANEL_CONTRIBUTE_COPPER_OK:
               this.senderProxy.send_51091(data);
               break;
            case PartyContributePanel.UI_PARTYFLAGPANEL_DUIHUANBANGPAIKUOZHANFU_OK:
               this.senderProxy.send_51217();
         }
      }
      
      public function f5() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._bangqiBanggongPanel))
         {
            this.senderProxy.send_51081([this._pageCount,this._currentPage]);
         }
      }
      
      private function changeMouseStatus() : void
      {
         TCursorManager.chickItemToPanelFun = function(param1:ItemFace):void
         {
            var _loc2_:Goods = null;
            var _loc3_:int = 0;
            if(_gongxianLingpaiArr.length < 6)
            {
               _loc2_ = param1.getItem() as Goods;
               if(_loc2_.id == SpecialGoodsID.LING_BANGZHU || _loc2_.id == SpecialGoodsID.LING_QINGLONG || _loc2_.id == SpecialGoodsID.LING_BAIHU || _loc2_.id == SpecialGoodsID.LING_ZHUQUE || _loc2_.id == SpecialGoodsID.LING_XUANWUG)
               {
                  _loc3_ = _gongxianLingpaiArr.indexOf(_loc2_);
                  if(_loc3_ == -1)
                  {
                     _gongxianLingpaiArr.push(_loc2_);
                  }
                  if(_gongxianLingpaiPanel != null)
                  {
                     _gongxianLingpaiPanel.setItem(_gongxianLingpaiArr);
                  }
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该道具不是令牌"),false);
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该道具不是令牌"),false);
               }
            }
            else
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"同时最多贡献6组令牌"),false);
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"同时最多贡献6组令牌"),false);
            }
         };
         TCursorManager.showCursor(TCursorManager.CURSOR_XUANZELINGPAI,true);
         TCursorManager.seleteItemOnOtherPanel();
         TCursorManager.lockOnMouseStatus();
      }
      
      private function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
         }
      }
      
      public function receive_bangqiInfoBanggongjilu(param1:int, param2:int, param3:int, param4:Number, param5:int, param6:int, param7:int, param8:int, param9:int, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:int, param16:Array, param17:Number) : void
      {
         var _loc19_:Array = null;
         var _loc20_:Goods = null;
         var _loc21_:Goods = null;
         var _loc22_:Goods = null;
         var _loc23_:Goods = null;
         var _loc24_:Goods = null;
         var _loc25_:int = 0;
         var _loc26_:String = null;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:Number = NaN;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:int = 0;
         var _loc37_:XML = null;
         if(this._pageCount != param1)
         {
            return;
         }
         this._currentPage = param2;
         this._maxPage = param3;
         var _loc18_:XML = <list/>;
         for each(_loc19_ in param16)
         {
            _loc25_ = int(_loc19_[0]);
            _loc26_ = _loc19_[1];
            _loc27_ = int(_loc19_[2]);
            _loc28_ = int(_loc19_[3]);
            _loc29_ = int(_loc19_[4]);
            _loc30_ = Number(_loc19_[5]);
            _loc31_ = int(_loc19_[6]);
            _loc32_ = int(_loc19_[7]);
            _loc33_ = int(_loc19_[8]);
            _loc34_ = int(_loc19_[9]);
            _loc35_ = int(_loc19_[10]);
            _loc36_ = int(_loc19_[11]);
            _loc37_ = <node label={_loc26_} id={_loc25_} lv={_loc27_} zhiwu={BangzhongZhiwu.getNameByValue(_loc28_)} isLine={_loc29_} bangzhuling={_loc31_} bangzhulingIsTop={_loc31_ == param11 ? 1 : 0} qinglong={_loc32_} qinglongIsTop={_loc32_ == param12 ? 1 : 0} baihu={_loc33_} banghuIsTop={_loc33_ == param13 ? 1 : 0} zhuque={_loc34_} zhuqueIsTop={_loc34_ == param14 ? 1 : 0} xuanwu={_loc35_} xuanwuIsTop={_loc35_ == param15 ? 1 : 0} copper={_loc30_} copperIsTop={_loc30_ == param10 ? 1 : 0} lisi={_loc36_}/>;
            _loc18_.appendChild(_loc37_);
         }
         GameInstance.uiInstance.bangqiBanggongPanel.setListData(_loc18_,this._maxPage,this._currentPage);
         _loc20_ = new Goods(SpecialGoodsID.LING_BANGZHU);
         _loc20_.count = param5;
         _loc21_ = new Goods(SpecialGoodsID.LING_QINGLONG);
         _loc21_.count = param6;
         _loc22_ = new Goods(SpecialGoodsID.LING_BAIHU);
         _loc22_.count = param7;
         _loc23_ = new Goods(SpecialGoodsID.LING_ZHUQUE);
         _loc23_.count = param8;
         _loc24_ = new Goods(SpecialGoodsID.LING_XUANWUG);
         _loc24_.count = param9;
         GameInstance.uiInstance.bangqiBanggongPanel.setPartyContribute([_loc20_,_loc21_,_loc22_,_loc23_,_loc24_],param4);
         GameInstance.uiInstance.bangqiBanggongPanel.setContribute(param17);
      }
      
      public function requestPanel() : void
      {
         this.senderProxy.send_51081([this._pageCount,this._currentPage]);
      }
   }
}

