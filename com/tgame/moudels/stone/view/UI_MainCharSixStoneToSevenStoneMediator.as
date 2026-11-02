package com.tgame.moudels.stone.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
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
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.stone.Stone_ApplicationFacade;
   import com.tgame.moudels.stone.model.Stone_MsgSendProxy;
   import com.tgame.shell.view.components.TopStonePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_MainCharSixStoneToSevenStoneMediator extends Mediator
   {
      
      public static const NAME:String = "UI_MainCharSixStoneToSevenStoneMediator";
      
      private var stone:Goods;
      
      private var nextLVStone:Goods;
      
      private var loaderBuff:LoadBuffer;
      
      private var _sendMsg:Stone_MsgSendProxy;
      
      public function UI_MainCharSixStoneToSevenStoneMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get panel() : TopStonePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.sixStoneToSevenStonePanel);
         }
         return viewComponent as TopStonePanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Stone_ApplicationFacade.ITEM_SWAP_OR_MOVE,Stone_ApplicationFacade.SIX_STONE_TO_SEVEN_STONE_PROBABILITY];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Stone_ApplicationFacade.ITEM_SWAP_OR_MOVE:
               break;
            case Stone_ApplicationFacade.SIX_STONE_TO_SEVEN_STONE_PROBABILITY:
               if(_loc2_.nextStoneID == 0)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入6品宝石"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入6品宝石"),false);
                  this.stone = null;
                  this.panel.setStone(null,null);
                  TCursorManager.chickItemToPanelFun = this.itemToPanel;
                  this.openBackpack();
                  this.changeMouseStatus();
                  return;
               }
               this.nextLVStone = new Goods(_loc2_.nextStoneID);
               this.panel.setStone(this.stone,this.nextLVStone);
               this.panel.setCailiao(_loc2_.zhenQi,_loc2_.gaiLv,LanResManager.getLanCommonTextWords("使用纯净碧玺") + _loc2_.caiLiaoNum + LanResManager.getLanCommonTextWords("颗"));
         }
      }
      
      public function upDataItem(param1:Boolean) : void
      {
         var _loc2_:Timer = new Timer(300,1);
         _loc2_.start();
         _loc2_.addEventListener(TimerEvent.TIMER,this.timerComplete);
         if(param1 == 0)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_EQUIP_STRONG_FA);
         }
         if(param1 == 1)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_HECHENG_SU);
            this.stone = null;
            this.nextLVStone = null;
            this.panel.setStone(null,null);
            this.panel.setItem(null);
            this.panel.setCailiao(0,0,"");
            this.panel.setItem(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.CHUN_JING_BI_XI));
         }
      }
      
      private function timerComplete(param1:TimerEvent) : void
      {
         this.removeLoaderBuff();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TopStonePanel,function():void
         {
            panel.addEventListener(TopStonePanel.TOPSTONEPANEL_STONE_GET,panelHandle);
            panel.addEventListener(TopStonePanel.TOPSTONEPANEL_STONE_PUT,panelHandle);
            panel.addEventListener(TopStonePanel.TOPSTONEPANEL_STONE_STRAT,panelHandle);
            panel.addEventListener(Event.ADDED_TO_STAGE,panelOpen);
            panel.addEventListener(FCloseEvent.CLOSE,panelClose);
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TopStonePanel,function():void
         {
            panel.removeEventListener(TopStonePanel.TOPSTONEPANEL_STONE_GET,panelHandle);
            panel.removeEventListener(TopStonePanel.TOPSTONEPANEL_STONE_PUT,panelHandle);
            panel.removeEventListener(TopStonePanel.TOPSTONEPANEL_STONE_STRAT,panelHandle);
            panel.removeEventListener(Event.ADDED_TO_STAGE,panelOpen);
            panel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function panelOpen(param1:Event = null) : void
      {
         this.panel.setItem(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.CHUN_JING_BI_XI));
      }
      
      private function panelClose(param1:* = null) : void
      {
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         ResizeManager.hideDoublePanel();
         this.resumMouseStatus();
         this.stone = null;
         this.nextLVStone = null;
         this.panel.setItem(null);
         this.panel.setStone(null,null);
         this.panel.setCailiao(0,0,"");
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         var _loc3_:Object = {};
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.openBackpack();
               break;
            case TopStonePanel.TOPSTONEPANEL_STONE_STRAT:
               if(!this.stone)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入6品宝石"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入6品宝石"),false);
                  return;
               }
               if(!this.nextLVStone)
               {
                  return;
               }
               this.sendMsg.send_50199({"XY":this.stone.position});
               this.addLoadBuffer();
               SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanCommonTextWords("新宝石合成中");
               break;
            case TopStonePanel.TOPSTONEPANEL_STONE_GET:
               this.stone = null;
               this.nextLVStone = null;
               this.panel.setStone(null,null);
               this.panel.setCailiao(0,0,"");
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.resumMouseStatus();
               break;
            case TopStonePanel.TOPSTONEPANEL_STONE_PUT:
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
            if(param2.res.kind != GoodsKind.K6)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("该物品不是宝石"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("该物品不是宝石"),false);
               return;
            }
            this.stone = param2;
            PipeManager.sendMsg(PipeConstants.USE_BAG,0);
            this.sendMsg.send_50125({
               "XY":param2.position,
               "ID":param2.id,
               "type":18
            });
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
      
      private function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         this.loaderBuff = LoadBuffer.show(GameInstance.uiInstance.sixStoneToSevenStonePanel);
      }
      
      private function removeLoaderBuff() : void
      {
         if(this.loaderBuff)
         {
            this.loaderBuff.close();
         }
         this.loaderBuff = null;
      }
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.panel,GameInstance.uiInstance.backpack);
      }
      
      private function get sendMsg() : Stone_MsgSendProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(Stone_MsgSendProxy.NAME) as Stone_MsgSendProxy;
         }
         return this._sendMsg;
      }
   }
}

