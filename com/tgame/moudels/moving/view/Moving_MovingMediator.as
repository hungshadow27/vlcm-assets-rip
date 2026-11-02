package com.tgame.moudels.moving.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.moving.model.Moving_MsgSendProxy;
   import com.tgame.shell.view.components.activityTemp.ConeyGirlPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Moving_MovingMediator extends Mediator
   {
      
      public static const NAME:String = "Moving_MovingMediator";
      
      private var selectPanel:int = 0;
      
      private const maxID:int = 1110;
      
      private const minID:int = 1104;
      
      private var goodsArr:Array = [];
      
      private var _msgSenderProxy:Moving_MsgSendProxy;
      
      public function Moving_MovingMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get coneyGirlPanel() : ConeyGirlPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.coneyGirlPanel);
         }
         return viewComponent as ConeyGirlPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
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
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ConeyGirlPanel,function():void
         {
            coneyGirlPanel.addEventListener(ConeyGirlPanel.UI_CONEYGIRLPANEL_SHOW_EQUIP,mainCharEquipPuddingHandle);
            coneyGirlPanel.addEventListener(ConeyGirlPanel.UI_CONEYGIRLPANEL_SHOW_POINT,mainCharEquipPuddingHandle);
            coneyGirlPanel.addEventListener(ConeyGirlPanel.UI_CONEYGIRLPANEL_EQUIP_PUT,mainCharEquipPuddingHandle);
            coneyGirlPanel.addEventListener(ConeyGirlPanel.UI_CONEYGIRLPANEL_EQUIP_ITEM_CLICK,mainCharEquipPuddingHandle);
            coneyGirlPanel.addEventListener(ConeyGirlPanel.UI_CONEYGIRLPANEL_EQUIP_START,mainCharEquipPuddingHandle);
            coneyGirlPanel.addEventListener(ConeyGirlPanel.UI_CONEYGIRLPANEL_POINT_PUT,mainCharEquipPuddingHandle);
            coneyGirlPanel.addEventListener(ConeyGirlPanel.UI_CONEYGIRLPANEL_POINT_ITEM_CLICK,mainCharEquipPuddingHandle);
            coneyGirlPanel.addEventListener(ConeyGirlPanel.UI_CONEYGIRLPANEL_POINT_START,mainCharEquipPuddingHandle);
            coneyGirlPanel.addEventListener(FCloseEvent.CLOSE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ConeyGirlPanel,function():void
         {
            coneyGirlPanel.removeEventListener(ConeyGirlPanel.UI_CONEYGIRLPANEL_SHOW_EQUIP,mainCharEquipPuddingHandle);
            coneyGirlPanel.removeEventListener(ConeyGirlPanel.UI_CONEYGIRLPANEL_SHOW_POINT,mainCharEquipPuddingHandle);
            coneyGirlPanel.removeEventListener(ConeyGirlPanel.UI_CONEYGIRLPANEL_EQUIP_PUT,mainCharEquipPuddingHandle);
            coneyGirlPanel.removeEventListener(ConeyGirlPanel.UI_CONEYGIRLPANEL_EQUIP_ITEM_CLICK,mainCharEquipPuddingHandle);
            coneyGirlPanel.removeEventListener(ConeyGirlPanel.UI_CONEYGIRLPANEL_EQUIP_START,mainCharEquipPuddingHandle);
            coneyGirlPanel.removeEventListener(ConeyGirlPanel.UI_CONEYGIRLPANEL_POINT_PUT,mainCharEquipPuddingHandle);
            coneyGirlPanel.removeEventListener(ConeyGirlPanel.UI_CONEYGIRLPANEL_POINT_ITEM_CLICK,mainCharEquipPuddingHandle);
            coneyGirlPanel.removeEventListener(ConeyGirlPanel.UI_CONEYGIRLPANEL_POINT_START,mainCharEquipPuddingHandle);
            coneyGirlPanel.removeEventListener(FCloseEvent.CLOSE,panelClose);
         });
      }
      
      private function panelClose(param1:FCloseEvent = null) : void
      {
         this.goodsArr = [];
         this.selectPanel = 0;
         this.resumMouseStatus();
         this.coneyGirlPanel.setPointConvert_item([],0);
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
      }
      
      private function mainCharEquipPuddingHandle(param1:Event = null) : void
      {
         var _loc3_:Goods = null;
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.showBackpack();
               break;
            case ConeyGirlPanel.UI_CONEYGIRLPANEL_SHOW_EQUIP:
               this.panelClose();
               this.coneyGirlPanel.showEquip();
               this.selectPanel = 0;
               break;
            case ConeyGirlPanel.UI_CONEYGIRLPANEL_SHOW_POINT:
               this.panelClose();
               this.coneyGirlPanel.showPoint();
               this.selectPanel = 1;
               break;
            case ConeyGirlPanel.UI_CONEYGIRLPANEL_EQUIP_PUT:
               this.showBackpack();
               PipeManager.sendMsg(PipeConstants.USE_BAG,0);
               this.changeMouseStatus();
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               break;
            case ConeyGirlPanel.UI_CONEYGIRLPANEL_EQUIP_ITEM_CLICK:
               _loc3_ = _loc2_.data as Goods;
               this.removePanelItem(_loc3_);
               break;
            case ConeyGirlPanel.UI_CONEYGIRLPANEL_EQUIP_START:
               this.sendToSever();
               break;
            case ConeyGirlPanel.UI_CONEYGIRLPANEL_POINT_PUT:
               this.showBackpack();
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.changeMouseStatus();
               PipeManager.sendMsg(PipeConstants.USE_BAG,0);
               break;
            case ConeyGirlPanel.UI_CONEYGIRLPANEL_POINT_ITEM_CLICK:
               _loc3_ = _loc2_.data as Goods;
               this.removePanelItem(_loc3_);
               break;
            case ConeyGirlPanel.UI_CONEYGIRLPANEL_POINT_START:
               this.sendToSever();
         }
      }
      
      private function removePanelItem(param1:Goods) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.goodsArr.length)
         {
            if(param1 == this.goodsArr[_loc2_])
            {
               this.goodsArr.splice(_loc2_,1);
            }
            _loc2_++;
         }
         var _loc3_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.goodsArr.length)
         {
            _loc3_ += this.goodsArr[_loc2_].count * 100;
            _loc2_++;
         }
         this.coneyGirlPanel.setPointConvert_item(this.goodsArr,_loc3_);
      }
      
      private function sendToSever() : void
      {
         if(this.goodsArr.length == 0)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"));
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"));
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:Object = {};
         _loc2_.type = this.selectPanel;
         _loc2_.itmeArr = this.goodsArr;
         this.msgSenderProxy.send_52051(_loc2_);
         var _loc3_:int = this.selectPanel;
         this.panelClose();
         this.selectPanel = _loc3_;
      }
      
      private function showBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.coneyGirlPanel,GameInstance.uiInstance.backpack);
      }
      
      private function changeMouseStatus() : void
      {
         TCursorManager.showCursor(TCursorManager.CURSOR_SHOUXING,true);
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
      
      private function itemToPanel(param1:ItemFace) : void
      {
         var _loc2_:Goods = param1.getBaseItem() as Goods;
         if(_loc2_.id < this.minID || _loc2_.id > this.maxID)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该物品不能添加"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该物品不能添加"),false);
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.goodsArr.length)
         {
            if(_loc2_.position == this.goodsArr[_loc3_].position)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该物品已添加"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该物品已添加"),false);
               return;
            }
            _loc3_++;
         }
         this.goodsArr.push(_loc2_);
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < this.goodsArr.length)
         {
            _loc4_ += this.goodsArr[_loc5_].count * 100;
            _loc5_++;
         }
         this.coneyGirlPanel.setPointConvert_item(this.goodsArr,_loc4_);
      }
      
      private function get msgSenderProxy() : Moving_MsgSendProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(Moving_MsgSendProxy.NAME) as Moving_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
   }
}

