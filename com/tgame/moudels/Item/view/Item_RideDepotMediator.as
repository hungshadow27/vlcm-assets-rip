package com.tgame.moudels.Item.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.moudels.Item.model.Item_TipProxy;
   import com.tgame.shell.view.components.RideDepotPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_RideDepotMediator extends Mediator
   {
      
      public static const NAME:String = "Item_RideDepotMediator";
      
      private var _itemTipProxy:Item_TipProxy;
      
      private var _rideAttrPanel:Item_RideAttrMediator;
      
      private var _sender:Item_MsgSenderProxy;
      
      public function Item_RideDepotMediator()
      {
         super(NAME);
      }
      
      public function get itemTipProxy() : Item_TipProxy
      {
         if(this._itemTipProxy == null)
         {
            this._itemTipProxy = facade.retrieveProxy(Item_TipProxy.NAME) as Item_TipProxy;
         }
         return this._itemTipProxy;
      }
      
      public function get sender() : Item_MsgSenderProxy
      {
         if(this._sender == null)
         {
            this._sender = facade.retrieveProxy(Item_MsgSenderProxy.NAME) as Item_MsgSenderProxy;
         }
         return this._sender;
      }
      
      protected function get rideDepotPanel() : RideDepotPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.rideDepotPanel);
         }
         return viewComponent as RideDepotPanel;
      }
      
      private function get rideAttrPanel() : Item_RideAttrMediator
      {
         if(this._rideAttrPanel == null)
         {
            this._rideAttrPanel = facade.retrieveMediator(Item_RideAttrMediator.NAME) as Item_RideAttrMediator;
         }
         return this._rideAttrPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Item_ApplicationFacade.UPDATE_MOUNT_BAG,Item_ApplicationFacade.UPDATE_MOUNT_DEPOT,Item_ApplicationFacade.ADD_AND_UPDATE_MOUNT_BAG];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Item_ApplicationFacade.UPDATE_MOUNT_BAG:
               this.onClickRideBag(null);
               break;
            case Item_ApplicationFacade.UPDATE_MOUNT_DEPOT:
               this.showMountDepotList();
               break;
            case Item_ApplicationFacade.ADD_AND_UPDATE_MOUNT_BAG:
               this.updateMountDepotSlot();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(RideDepotPanel,function():void
         {
            rideDepotPanel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            rideDepotPanel.addEventListener(RideDepotPanel.UI_RIDEDEPOT_RIDELISTBTN_CLICK,onClickRideBag);
            rideDepotPanel.addEventListener(RideDepotPanel.UI_RIDEDEPOT_ADDSLOT_CLICK,onAddSlotClick);
            rideDepotPanel.addEventListener(RideDepotPanel.UI_RIDEDEPOT_ADDSLOT,onClickAddSlotOK);
            rideDepotPanel.addEventListener(RideDepotPanel.UI_RIDEDEPOT_SAVEBTN_CLICK,onSaveMountClick);
            rideDepotPanel.addEventListener(RideDepotPanel.UI_RIDEDEPOT_GETBTN_CLICK,onGetMountClick);
            rideDepotPanel.addEventListener(RideDepotPanel.UI_RIDEDEPOT_LOOKBTN_CLICK,onClickRideDetail);
            rideDepotPanel.addEventListener(RideDepotPanel.UI_RIDEDEPOT_DEPOTBTN_CLICK,onClickShowDepot);
         });
         UIEventsRegisterManager.addUIRemovedEvent(RideDepotPanel,function():void
         {
            rideDepotPanel.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            rideDepotPanel.removeEventListener(RideDepotPanel.UI_RIDEDEPOT_RIDELISTBTN_CLICK,onClickRideBag);
            rideDepotPanel.removeEventListener(RideDepotPanel.UI_RIDEDEPOT_ADDSLOT_CLICK,onAddSlotClick);
            rideDepotPanel.removeEventListener(RideDepotPanel.UI_RIDEDEPOT_ADDSLOT,onClickAddSlotOK);
            rideDepotPanel.removeEventListener(RideDepotPanel.UI_RIDEDEPOT_SAVEBTN_CLICK,onSaveMountClick);
            rideDepotPanel.removeEventListener(RideDepotPanel.UI_RIDEDEPOT_GETBTN_CLICK,onGetMountClick);
            rideDepotPanel.removeEventListener(RideDepotPanel.UI_RIDEDEPOT_LOOKBTN_CLICK,onClickRideDetail);
            rideDepotPanel.removeEventListener(RideDepotPanel.UI_RIDEDEPOT_DEPOTBTN_CLICK,onClickShowDepot);
         });
      }
      
      private function onClickRideDetail(param1:BaseEvent) : void
      {
         var _loc2_:int = Number(param1.data);
         this.rideAttrPanel.show(GameInstance.mainChar.id,_loc2_);
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.showMountDepotList();
         if(Fun.isVisible(GameInstance.uiInstance._depot))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
         }
         ResizeManager.showDoublePanel(this.rideDepotPanel,GameInstance.uiInstance.backpack);
      }
      
      private function onClickShowDepot(param1:BaseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_RIDE_DEPOT_PANEL);
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         if(!Fun.isVisible(GameInstance.uiInstance._depot))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
         }
         ResizeManager.showDoublePanel(GameInstance.uiInstance.depot,GameInstance.uiInstance.backpack);
      }
      
      private function onGetMountClick(param1:BaseEvent) : void
      {
         var _loc2_:int = Number(param1.data);
         this.sender.send_11197([_loc2_,2]);
      }
      
      private function onSaveMountClick(param1:BaseEvent) : void
      {
         var _loc2_:int = Number(param1.data);
         this.sender.send_11197([_loc2_,3]);
      }
      
      private function onAddSlotClick(param1:BaseEvent) : void
      {
         var _loc3_:Goods = null;
         var _loc2_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(1013,true);
         if(_loc2_ < GameInstance.mainCharData.mountInfo.mountDepotSlot + 1)
         {
            _loc3_ = new Goods(SpecialGoodsID.KUOZHANFU);
            _loc3_.count = _loc2_;
            this.rideDepotPanel.showAddSlot(GameInstance.mainCharData.mountInfo.mountDepotSlot + 1,_loc3_,false);
         }
         else
         {
            _loc3_ = new Goods(SpecialGoodsID.KUOZHANFU);
            _loc3_.count = _loc2_;
            this.rideDepotPanel.showAddSlot(GameInstance.mainCharData.mountInfo.mountDepotSlot + 1,_loc3_);
         }
      }
      
      private function onClickAddSlotOK(param1:BaseEvent) : void
      {
         this.sender.send_50049();
      }
      
      private function onClickRideBag(param1:BaseEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:XML = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:PureMount = null;
         var _loc7_:XML = null;
         if(GameInstance.uiInstance._rideDepotPanel != null)
         {
            _loc2_ = GameInstance.mainCharData.mountInfo.mountArr;
            _loc3_ = <list/>;
            _loc5_ = int(_loc2_.length);
            _loc4_ = 0;
            while(_loc4_ < _loc5_)
            {
               _loc6_ = _loc2_[_loc4_];
               _loc7_ = <node/>;
               _loc7_.@label = _loc6_.id;
               _loc7_.@rideName = _loc6_.name;
               _loc7_.@level = _loc6_.mountAttributeInfo.lv;
               _loc7_.@quality = _loc6_.mountAttributeInfo.quality;
               if(_loc6_.fightStatus == 0)
               {
                  _loc7_.@state = LanResManager.getLanCommonTextWords("休息");
               }
               else if(_loc6_.fightStatus == 1)
               {
                  _loc7_.@state = LanResManager.getLanCommonTextWords("骑乘");
               }
               else if(_loc6_.fightStatus == 2)
               {
                  _loc7_.@state = LanResManager.getLanCommonTextWords("展示");
               }
               _loc3_.appendChild(_loc7_);
               _loc4_++;
            }
            this.rideDepotPanel.showRideListPanel(_loc3_);
         }
      }
      
      public function showMountDepotList() : void
      {
         var _loc3_:int = 0;
         var _loc5_:XML = null;
         var _loc7_:PureMount = null;
         if(GameInstance.uiInstance._rideDepotPanel == null)
         {
            return;
         }
         if(!Fun.isVisible(GameInstance.uiInstance._rideDepotPanel))
         {
            return;
         }
         var _loc1_:Array = GameInstance.mainCharData.mountInfo.mountDepotArray;
         var _loc2_:XML = <list/>;
         var _loc4_:int = int(_loc1_.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc7_ = _loc1_[_loc3_];
            _loc5_ = <node/>;
            _loc5_.@label = _loc7_.id;
            _loc5_.@rideName = _loc7_.name;
            _loc5_.@level = _loc7_.mountAttributeInfo.lv;
            _loc5_.@quality = _loc7_.mountAttributeInfo.quality;
            if(_loc7_.fightStatus == 0)
            {
               _loc5_.@state = LanResManager.getLanCommonTextWords("休息");
            }
            else if(_loc7_.fightStatus == 1)
            {
               _loc5_.@state = LanResManager.getLanCommonTextWords("骑乘");
            }
            else if(_loc7_.fightStatus == 2)
            {
               _loc5_.@state = LanResManager.getLanCommonTextWords("展示");
            }
            _loc2_.appendChild(_loc5_);
            _loc3_++;
         }
         var _loc6_:int = GameInstance.mainCharData.mountInfo.mountDepotSlot - _loc4_;
         _loc3_ = 0;
         while(_loc3_ < _loc6_)
         {
            _loc5_ = <node/>;
            _loc5_.@label = "0";
            _loc2_.appendChild(_loc5_);
            _loc3_++;
         }
         _loc5_ = <node/>;
         _loc5_.@label = "-1";
         _loc2_.appendChild(_loc5_);
         this.rideDepotPanel.setRideList(_loc2_);
         this.rideDepotPanel.setCount(_loc4_,GameInstance.mainCharData.mountInfo.mountDepotSlot);
      }
      
      public function updateMountDepotSlot() : void
      {
         ++GameInstance.mainCharData.mountInfo.mountDepotSlot;
         this.showMountDepotList();
      }
   }
}

