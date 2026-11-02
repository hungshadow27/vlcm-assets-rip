package com.tgame.moudels.chiBang.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.chiBang.ChiBang_ApplicationFacade;
   import com.tgame.moudels.chiBang.model.ChiBang_MsgSenderProxy;
   import com.tgame.shell.view.components.attribute.YuLingHeChengPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YuLingHeCheng_mediator extends Mediator
   {
      
      public static var loaderBuff:LoadBuffer;
      
      public static const NAME:String = "YuLingHeCheng_mediator";
      
      public var goods:Goods;
      
      private var isHeBing:Boolean;
      
      private var zhenQi:int;
      
      public var lv:int;
      
      private var _msgSenderProxy:ChiBang_MsgSenderProxy;
      
      public function YuLingHeCheng_mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get panel() : YuLingHeChengPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.yuLingHeChengPanel);
         }
         return viewComponent as YuLingHeChengPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ChiBang_ApplicationFacade.SHOW_YULING_HECHENG_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ChiBang_ApplicationFacade.SHOW_YULING_HECHENG_PANEL:
               this.showPanel();
         }
      }
      
      private function get msgSenderProxy() : ChiBang_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(ChiBang_MsgSenderProxy.NAME) as ChiBang_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YuLingHeChengPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,panelHandle);
            panel.addEventListener(YuLingHeChengPanel.YULING_HECHENG_QUCHU_CLICK,panelHandle);
            panel.addEventListener(YuLingHeChengPanel.YULING_HECHENG_FANGRU_CLICK,panelHandle);
            panel.addEventListener(YuLingHeChengPanel.YULING_HECHENG_CLICK,panelHandle);
            panel.addEventListener(YuLingHeChengPanel.YULING_HECHENG_HEBING_CLICK,panelHandle);
            panel.addEventListener(FCloseEvent.CLOSE,panelClose);
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YuLingHeChengPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,panelHandle);
            panel.removeEventListener(YuLingHeChengPanel.YULING_HECHENG_QUCHU_CLICK,panelHandle);
            panel.removeEventListener(YuLingHeChengPanel.YULING_HECHENG_FANGRU_CLICK,panelHandle);
            panel.removeEventListener(YuLingHeChengPanel.YULING_HECHENG_CLICK,panelHandle);
            panel.removeEventListener(YuLingHeChengPanel.YULING_HECHENG_HEBING_CLICK,panelHandle);
            panel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function panelHandle(param1:Event = null) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               if(!Fun.isVisible(GameInstance.uiInstance._backpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               }
               ResizeManager.showDoublePanel(this.panel,GameInstance.uiInstance.backpack);
               break;
            case YuLingHeChengPanel.YULING_HECHENG_FANGRU_CLICK:
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.panel.setResult([]);
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case YuLingHeChengPanel.YULING_HECHENG_QUCHU_CLICK:
               this.replay();
               this.panel.setStone();
               this.panel.setResult([]);
               this.panel.setData(0,0);
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.resumMouseStatus();
               break;
            case YuLingHeChengPanel.YULING_HECHENG_HEBING_CLICK:
               this.isHeBing = _loc2_.data as Boolean;
               if(!this.goods)
               {
                  return;
               }
               this.msgSenderProxy.send_61731([this.goods.position,this.goods.id,this.isHeBing]);
               break;
            case YuLingHeChengPanel.YULING_HECHENG_CLICK:
               if(this.goods == null)
               {
                  return;
               }
               this.panel.setResult([]);
               this.addLoadBuffer();
               this.msgSenderProxy.send_61733([this.goods.position,this.goods.id,this.isHeBing]);
               SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanCommonTextWords("羽灵合成中");
         }
      }
      
      public function showPanel() : void
      {
         this.panel.x = (GameConfig.sceneWidth - this.panel.width) / 2;
         this.panel.y = (GameConfig.sceneHeight - this.panel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.panel);
      }
      
      private function itemToPanel(param1:ItemFace, param2:Goods = null) : void
      {
         var _loc3_:Object = {};
         var _loc4_:Boolean = true;
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
         }
         this.goods = param2;
         PipeManager.sendMsg(PipeConstants.USE_BAG,0);
         this.msgSenderProxy.send_61731([param2.position,param2.id,0]);
         this.mouseToNormal();
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
      
      public function setPanel(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:Goods = null;
         this.zhenQi = param2;
         this.lv = param3;
         this.panel.setStone(this.goods,new Goods(param4));
         this.panel.setData(param2,param3);
         if(this.goods.bind)
         {
            _loc5_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.goods.id,true,true,2);
         }
         else
         {
            _loc5_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.goods.id,true,true,1);
         }
         var _loc6_:String = this.goods.bind == 0 ? LanResManager.getLanCommonTextWords("背包中同类型的绑定羽灵同时参与合成") : LanResManager.getLanCommonTextWords("背包中同类型的非绑定羽灵同时参与合成");
         this.panel.setBingStone(_loc5_,_loc6_,this.goods.bind == 0 ? true : false);
      }
      
      public function upDataItem(param1:int, param2:Array = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Goods = null;
         if(param1 == 0)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_EQUIP_STRONG_FA);
         }
         if(param1 == 1)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_HECHENG_SU);
         }
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.removeLoaderBuff();
         if(!Fun.isVisible(GameInstance.uiInstance.yuLingHeChengPanel))
         {
            this.panelClose();
            return;
         }
         if(param2 != null)
         {
            _loc3_ = int(param2[param2.length - 1]);
            param2.splice(param2.length - 1,1);
            this.panel.setResult(param2);
            _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(_loc3_);
            if((Boolean(_loc4_)) && _loc4_.count > 0)
            {
               _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(_loc3_);
               this.itemToPanel(null,_loc4_);
            }
            else
            {
               this.goods = null;
               this.panel.setStone();
            }
         }
      }
      
      private function panelClose(param1:* = null, param2:Boolean = false) : void
      {
         this.replay();
         this.panel.setData(0,0);
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.resumMouseStatus();
         this.removeLoaderBuff();
      }
      
      private function replay() : void
      {
         this.goods = null;
         this.panel.setStone();
         this.panel.setBingStone(null,"",true);
         this.lv = 0;
         this.zhenQi = 0;
      }
      
      public function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         loaderBuff = LoadBuffer.show(GameInstance.uiInstance.yuLingHeChengPanel);
      }
      
      public function removeLoaderBuff() : void
      {
         if(loaderBuff)
         {
            loaderBuff.close();
         }
         loaderBuff = null;
      }
   }
}

