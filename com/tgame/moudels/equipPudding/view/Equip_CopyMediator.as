package com.tgame.moudels.equipPudding.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.equipPudding.EquipPudding_ApplicationFacade;
   import com.tgame.moudels.equipPudding.model.EquipPudding_MsgSendProxy;
   import com.tgame.shell.view.components.equippudding.EquipCopyPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Equip_CopyMediator extends Mediator
   {
      
      public static const NAME:String = "Equip_CopyMediator";
      
      private var _msgSenderProxy:EquipPudding_MsgSendProxy;
      
      public var equip:Goods;
      
      public var copyType:int;
      
      private var equipCopyPanel:EquipCopyPanel;
      
      public function Equip_CopyMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : EquipPudding_MsgSendProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(EquipPudding_MsgSendProxy.NAME) as EquipPudding_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [EquipPudding_ApplicationFacade.SHOW_ZHUNAGBEICOPE_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case EquipPudding_ApplicationFacade.SHOW_ZHUNAGBEICOPE_PANEL:
               this.copyType = _loc2_ as int;
               this.msgSenderProxy.send_57151(this.copyType);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(EquipCopyPanel,function():void
         {
            equipCopyPanel.addEventListener(EquipCopyPanel.UI_FUZHIZHUANGBEICLICK,equipCopyHandel);
            equipCopyPanel.addEventListener(EquipCopyPanel.UI_FANGRUZHUANGBEICLICK,equipCopyHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(EquipCopyPanel,function():void
         {
            equipCopyPanel.removeEventListener(EquipCopyPanel.UI_FUZHIZHUANGBEICLICK,equipCopyHandel);
            equipCopyPanel.removeEventListener(EquipCopyPanel.UI_FANGRUZHUANGBEICLICK,equipCopyHandel);
         });
      }
      
      private function equipCopyHandel(param1:Event) : void
      {
         var _loc2_:String = param1.type;
         var _loc3_:Object = (param1 as BaseEvent).data;
         switch(_loc2_)
         {
            case EquipCopyPanel.UI_FUZHIZHUANGBEICLICK:
               if(this.equip != null)
               {
                  this.msgSenderProxy.send_57155([this.copyType,this.equip.position]);
               }
               break;
            case EquipCopyPanel.UI_FANGRUZHUANGBEICLICK:
               if(_loc3_ == 2)
               {
                  this.equipCopyPanel.setGoods();
                  this.resumMouseStatus();
                  return;
               }
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
         }
      }
      
      private function itemToPanel(param1:ItemFace, param2:Goods = null) : void
      {
         var _loc3_:Object = {};
         if(!param2)
         {
            param2 = param1.getBaseItem() as Goods;
         }
         if(param2)
         {
            if(!ItemPositionRange.inBag(param2.position))
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               return;
            }
            if(param2.res.kind != GoodsKind.K2)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
               return;
            }
            this.msgSenderProxy.send_57153(param2.position);
         }
         this.equip = param2;
         this.mouseToNormal();
      }
      
      private function changeMouseStatus() : void
      {
         TCursorManager.showCursor(TCursorManager.CURSOR_SHOUXING,true);
         TCursorManager.seleteItemOnOtherPanel();
         TCursorManager.lockOnMouseStatus();
         GameInstance.uiInstance.backpack.functionBtnEnalbe = false;
      }
      
      private function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
            GameInstance.uiInstance.backpack.functionBtnEnalbe = true;
         }
      }
      
      private function mouseToNormal() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = function a(param1:*):void
            {
            };
            TCursorManager.mouseToNormal();
         }
      }
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.equipCopyPanel,GameInstance.uiInstance.backpack);
      }
      
      public function setResult(param1:int, param2:int) : void
      {
         var _loc3_:Goods = null;
         if(param1 == 1)
         {
            this.equipCopyPanel.bofangYanhua();
            _loc3_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param2);
            this.equipCopyPanel.setGoods2(_loc3_);
         }
      }
      
      public function setGoods(param1:int, param2:int) : void
      {
         var _loc3_:Goods = new Goods(param1);
         _loc3_.roleID = GameInstance.mainChar.id;
         _loc3_.position = this.equip.position;
         var _loc4_:Goods = new Goods(param2);
         _loc4_.roleID = GameInstance.mainChar.id;
         _loc4_.position = this.equip.position;
         this.equipCopyPanel.setGoods(_loc3_,_loc4_);
      }
      
      public function setNeedGoods(param1:int) : void
      {
         if(this.equipCopyPanel == null)
         {
            this.equipCopyPanel = new EquipCopyPanel();
            UIEventsRegisterManager.registerUI(this.equipCopyPanel,EquipCopyPanel);
         }
         if(!Fun.isVisible(this.equipCopyPanel))
         {
            this.equipCopyPanel.x = GameInstance.stage.stageWidth / 2 - this.equipCopyPanel.width / 2;
            this.equipCopyPanel.y = GameInstance.stage.stageHeight / 2 - this.equipCopyPanel.height / 2;
            GameInstance.uiInstance.uiContainer.addChild(this.equipCopyPanel);
         }
         var _loc2_:Goods = new Goods(param1);
         this.equipCopyPanel.setNeedGoods(_loc2_);
         this.equipCopyPanel.setTextByType(this.copyType);
      }
      
      public function setGoods1(param1:int) : void
      {
         var _loc2_:Goods = new Goods(param1);
         _loc2_.roleID = GameInstance.mainChar.id;
         _loc2_.position = this.equip.position;
         this.equipCopyPanel.setGoods1(_loc2_);
      }
      
      public function setGoods2(param1:int, param2:int) : void
      {
         var _loc3_:Goods = new Goods(param1);
         _loc3_.roleID = GameInstance.mainChar.id;
         _loc3_.position = param2;
         this.equipCopyPanel.setGoods2(_loc3_);
      }
   }
}

