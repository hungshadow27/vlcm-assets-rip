package com.tgame.moudels.orangeEquip.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.orangeEquip.OrangeEquip_ApplicationFacade;
   import com.tgame.moudels.orangeEquip.model.OrangeEquip_MsgSenderProxy;
   import com.tgame.shell.view.components.ChuanShuoZhuangBeiDaZaoPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class OrangeEquip_Mediator extends Mediator
   {
      
      public static const NAME:String = "OrangeEquip_Mediator";
      
      private var equip:Goods;
      
      private var panelType:String = "";
      
      private var loaderBuff:LoadBuffer;
      
      private var _senderProxy:OrangeEquip_MsgSenderProxy;
      
      public function OrangeEquip_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get panel() : ChuanShuoZhuangBeiDaZaoPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.chuanShuoZhuangBeiDaZaoPanel);
         }
         return viewComponent as ChuanShuoZhuangBeiDaZaoPanel;
      }
      
      private function get senderProxy() : OrangeEquip_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(OrangeEquip_MsgSenderProxy.NAME) as OrangeEquip_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [OrangeEquip_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:Goods = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case OrangeEquip_ApplicationFacade.GOODS_CHANGED:
               if(this.panelType == ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANGDAZAO_SHOW)
               {
                  _loc6_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.CHUANSHUO_ZHUANGBEI_DAZAO_SHI,true,true);
                  this.panel.seChengDaZaoInnateAttributeEnergyExpendItem(_loc6_.count > 0 ? false : true,_loc6_);
               }
               if(this.panelType == ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANGSHUXING_RESTE_SHOW)
               {
                  _loc6_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.CHUANSHUO_JINGLIANSHI,true,true);
                  this.panel.setChengResetInnateAttributeEnergyExpendItem(_loc6_.count > 0 ? false : true,_loc6_);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function equipUpDataCommplete(param1:int) : void
      {
         this.removeLoaderBuff();
         if(param1 < 0 || this.panelType == "")
         {
            return;
         }
         this.equip = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param1);
         this.panel.setChengDaZaoEquip(this.equip);
      }
      
      public function equipChangeCommplete(param1:int) : void
      {
         this.removeLoaderBuff();
         if(param1 < 0 || this.panelType == "")
         {
            return;
         }
         this.equip = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param1);
         this.panel.setChengShuXingResetEquip(this.equip);
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ChuanShuoZhuangBeiDaZaoPanel,function():void
         {
            panel.addEventListener(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANGDAZAO_SHOW,uiHandle);
            panel.addEventListener(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_SETEQUIPBTN_CLICK,uiHandle);
            panel.addEventListener(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_GETEQUIPBTN_CLICK,uiHandle);
            panel.addEventListener(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_STARTBTN_CLICK,uiHandle);
            panel.addEventListener(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANGSHUXING_RESTE_SHOW,uiHandle);
            panel.addEventListener(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_SHUXING_RESET_SETEQUIPBTN_CLICK,uiHandle);
            panel.addEventListener(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_SHUXING_RESET_GETEQUIPBTN_CLICK,uiHandle);
            panel.addEventListener(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_SHUXING_RESET_STARTBTN_CLICK,uiHandle);
            panel.addEventListener(FCloseEvent.CLOSE,panelClose);
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ChuanShuoZhuangBeiDaZaoPanel,function():void
         {
            panel.removeEventListener(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANGDAZAO_SHOW,uiHandle);
            panel.removeEventListener(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_SETEQUIPBTN_CLICK,uiHandle);
            panel.removeEventListener(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_GETEQUIPBTN_CLICK,uiHandle);
            panel.removeEventListener(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_STARTBTN_CLICK,uiHandle);
            panel.removeEventListener(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANGSHUXING_RESTE_SHOW,uiHandle);
            panel.removeEventListener(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_SHUXING_RESET_SETEQUIPBTN_CLICK,uiHandle);
            panel.removeEventListener(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_SHUXING_RESET_GETEQUIPBTN_CLICK,uiHandle);
            panel.removeEventListener(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_SHUXING_RESET_STARTBTN_CLICK,uiHandle);
            panel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function panelClose(param1:* = null, param2:Boolean = true) : void
      {
         this.equip = null;
         this.panel.getChengShuXingResetEquip();
         this.panel.getChengDaZaoEquip();
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.resumMouseStatus();
         if(param2)
         {
            this.panelType = "";
         }
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc4_:Goods = null;
         var _loc2_:String = param1.type;
         var _loc3_:Object = (param1 as BaseEvent).data;
         switch(_loc2_)
         {
            case ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANGDAZAO_SHOW:
               this.panelClose();
               this.panelType = ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANGDAZAO_SHOW;
               this.panel.showChengZhuangDaZaoPanel(true);
               _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.CHUANSHUO_ZHUANGBEI_DAZAO_SHI,true,true);
               this.panel.seChengDaZaoInnateAttributeEnergyExpendItem(_loc4_.count > 0 ? false : true,_loc4_);
               break;
            case ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANGSHUXING_RESTE_SHOW:
               this.panelClose();
               this.panelType = ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANGSHUXING_RESTE_SHOW;
               this.panel.showChengZhuangShuXingResetPanel(true);
               _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.CHUANSHUO_JINGLIANSHI,true,true);
               this.panel.setChengResetInnateAttributeEnergyExpendItem(_loc4_.count > 0 ? false : true,_loc4_);
               break;
            case ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_SETEQUIPBTN_CLICK:
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_GETEQUIPBTN_CLICK:
               this.panelClose(null,false);
               this.panel.getChengDaZaoEquip();
               break;
            case ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_STARTBTN_CLICK:
               if(this.equip)
               {
                  this.senderProxy.send_53029({"index":this.equip.position});
                  this.addLoadBuffer();
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               }
               break;
            case ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_SHUXING_RESET_SETEQUIPBTN_CLICK:
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_SHUXING_RESET_GETEQUIPBTN_CLICK:
               this.panelClose(null,false);
               this.panel.getChengShuXingResetEquip();
               break;
            case ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_SHUXING_RESET_STARTBTN_CLICK:
               if(this.equip)
               {
                  this.senderProxy.send_53521({"index":this.equip.position});
                  this.addLoadBuffer();
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               }
         }
      }
      
      private function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         this.loaderBuff = LoadBuffer.show(GameInstance.uiInstance.chuanShuoZhuangBeiDaZaoPanel);
      }
      
      private function removeLoaderBuff() : void
      {
         if(this.loaderBuff)
         {
            this.loaderBuff.close();
         }
         this.loaderBuff = null;
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
         }
         this.equip = param2;
         this.mouseToNormal();
         if(this.panelType == ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANGDAZAO_SHOW)
         {
            this.panel.setChengDaZaoEquip(this.equip);
         }
         if(this.panelType == ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANGSHUXING_RESTE_SHOW)
         {
            this.panel.setChengShuXingResetEquip(this.equip);
         }
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
         ResizeManager.showDoublePanel(this.panel,GameInstance.uiInstance.backpack);
      }
   }
}

