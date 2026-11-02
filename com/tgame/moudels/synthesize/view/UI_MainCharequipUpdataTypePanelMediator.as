package com.tgame.moudels.synthesize.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.synthesize.model.Synthesize_MsgSendProxy;
   import com.tgame.shell.view.components.MenghuanShuxingKa;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_MainCharequipUpdataTypePanelMediator extends Mediator
   {
      
      public static const NAME:String = "UI_MainCharequipUpdataTypePanelMediator";
      
      private var equip:Goods;
      
      private var loaderBuff:LoadBuffer;
      
      private var _sendMsg:Synthesize_MsgSendProxy;
      
      public function UI_MainCharequipUpdataTypePanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get panel() : MenghuanShuxingKa
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.equipUpdataTypePanel);
         }
         return viewComponent as MenghuanShuxingKa;
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
      }
      
      public function setData(param1:int, param2:int, param3:String) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
         {
            return;
         }
         if(param1 == 0)
         {
            return;
         }
         this.panel.getEquip();
         this.equip = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param2);
         this.panel.setEquip(this.equip);
         var _loc4_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.MENGHUAN_CODE);
         var _loc5_:uint = uint(_loc4_.count);
         _loc4_.count = 1;
         this.panel.setCailiao(_loc4_,LanResManager.getLanCommonTextWords("梦幻属性卡1张"),_loc5_ > 0 ? true : false,100);
         this.panel.setShuxing(param3);
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(MenghuanShuxingKa,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,addPanelToStage);
            panel.addEventListener(MenghuanShuxingKa.UI_FUJIASHUXINGCHONGZHI_CHONGZHI_CLICK,mainCharEquipPuddingHandle);
            panel.addEventListener(MenghuanShuxingKa.UI_FUJIASHUXINGCHONGZHI_GETEQUIPBTN_CLICK,mainCharEquipPuddingHandle);
            panel.addEventListener(MenghuanShuxingKa.UI_FUJIASHUXINGCHONGZHI_SETEQUIPBTN_CLICK,mainCharEquipPuddingHandle);
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MenghuanShuxingKa,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,addPanelToStage);
            panel.removeEventListener(MenghuanShuxingKa.UI_FUJIASHUXINGCHONGZHI_CHONGZHI_CLICK,mainCharEquipPuddingHandle);
            panel.removeEventListener(MenghuanShuxingKa.UI_FUJIASHUXINGCHONGZHI_GETEQUIPBTN_CLICK,mainCharEquipPuddingHandle);
            panel.removeEventListener(MenghuanShuxingKa.UI_FUJIASHUXINGCHONGZHI_SETEQUIPBTN_CLICK,mainCharEquipPuddingHandle);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function addPanelToStage(param1:Event) : void
      {
         this.openBackpack();
         var _loc2_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.MENGHUAN_CODE);
         var _loc3_:uint = uint(_loc2_.count);
         _loc2_.count = 1;
         this.panel.setCailiao(_loc2_,LanResManager.getLanCommonTextWords("梦幻属性卡1张"),_loc3_ > 0 ? true : false,100);
      }
      
      private function panelClose(param1:* = null) : void
      {
         this.panel.getEquip();
         this.equip = null;
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.resumMouseStatus();
      }
      
      private function mainCharEquipPuddingHandle(param1:Event = null) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:int = 0;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case MenghuanShuxingKa.UI_FUJIASHUXINGCHONGZHI_CHONGZHI_CLICK:
               _loc3_ = _loc2_.data as int;
               if(_loc3_ == 0)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请选择一条您希望提升至梦幻满值的属性"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请选择一条您希望提升至梦幻满值的属性"),false);
                  return;
               }
               this.addLoadBuffer();
               SynthesizeMsg.EquipUpdataTypeBarMsg = LanResManager.getLanCommonTextWords("附加属性重置中");
               this.sendMsg.send_50185({
                  "updataTypeNum":_loc3_,
                  "index":this.equip.position
               });
               break;
            case MenghuanShuxingKa.UI_FUJIASHUXINGCHONGZHI_GETEQUIPBTN_CLICK:
               this.equip = null;
               this.panel.getEquip();
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.resumMouseStatus();
               break;
            case MenghuanShuxingKa.UI_FUJIASHUXINGCHONGZHI_SETEQUIPBTN_CLICK:
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
         }
      }
      
      private function itemToPanel(param1:ItemFace, param2:Goods = null) : void
      {
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
            if(param2.res.kind == GoodsKind.K2 && param2.quality < 4)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("只有紫装才能使用梦幻属性卡重置"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("只有紫装才能使用梦幻属性卡重置"),false);
               return;
            }
            if(param2.res.kind != GoodsKind.K2)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
               return;
            }
            this.equip = param2;
            this.sendMsg.send_50175({
               "index":this.equip.position,
               "id":this.equip.id
            });
            PipeManager.sendMsg(PipeConstants.USE_BAG,0);
            this.mouseToNormal();
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
      
      private function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         this.loaderBuff = LoadBuffer.show(this.panel);
      }
      
      public function removeLoaderBuff() : void
      {
         if(this.loaderBuff)
         {
            this.loaderBuff.close();
         }
         this.loaderBuff = null;
      }
      
      private function get sendMsg() : Synthesize_MsgSendProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(Synthesize_MsgSendProxy.NAME) as Synthesize_MsgSendProxy;
         }
         return this._sendMsg;
      }
   }
}

