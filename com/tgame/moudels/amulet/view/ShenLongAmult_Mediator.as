package com.tgame.moudels.amulet.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.equipMosaic.EquipMosaic;
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
   import com.tgame.moudels.amulet.Amulet_ApplicationFacade;
   import com.tgame.moudels.amulet.model.Amult_MsgReceivedProxy;
   import com.tgame.moudels.amulet.model.Amult_MsgSenderProxy;
   import com.tgame.shell.view.components.temp.ShenLongFuLianZiPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ShenLongAmult_Mediator extends Mediator
   {
      
      public static const NAME:String = "ShenLongAmult";
      
      private var huShenFu:Goods;
      
      private var timer:Timer;
      
      private var loaderBuff:LoadBuffer;
      
      private var _sendMsg:Amult_MsgSenderProxy;
      
      public function ShenLongAmult_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get shenLongPanel() : ShenLongFuLianZiPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.shenLongPanel);
         }
         return viewComponent as ShenLongFuLianZiPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Amulet_ApplicationFacade.ITEM_SWAP_OR_MOVE,Amulet_ApplicationFacade.SHOW_SHEN_LONG_AMULT];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Amulet_ApplicationFacade.ITEM_SWAP_OR_MOVE:
               if(!this.huShenFu)
               {
                  return;
               }
               _loc3_ = _loc2_ as Array;
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  if(_loc3_[_loc4_] == this.huShenFu.position)
                  {
                     if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
                     {
                        PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
                     }
                     return;
                  }
                  _loc4_++;
               }
               break;
            case Amulet_ApplicationFacade.SHOW_SHEN_LONG_AMULT:
               this.shenLongPanel.setItem_shenlong(new Goods(SpecialGoodsID.SHEN_LONG_HU_SHEN_FU));
               if(GameState.gongneng103)
               {
                  this.shenLongPanel.isShowHouDongTip(true);
               }
               else
               {
                  this.shenLongPanel.isShowHouDongTip(false);
               }
         }
      }
      
      public function upDataComplete(param1:int, param2:int) : void
      {
         if(param1 == 0)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_EQUIP_STRONG_FA);
         }
         if(param1 == 1)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_HECHENG_SU);
         }
         if(!Fun.isVisible(this.shenLongPanel))
         {
            return;
         }
         if(!this.timer)
         {
            this.timer = new Timer(500,1);
            this.timer.start();
            this.timer.addEventListener(TimerEvent.TIMER,this.timerOvre);
         }
         this.replay();
      }
      
      public function setGL(param1:Object) : void
      {
         if(!Fun.isVisible(this.shenLongPanel))
         {
            return;
         }
         if(param1.isUpData != 1)
         {
            this.replay();
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"圣龙护身符查询失败"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"圣龙护身符查询失败"),false);
            TCursorManager.chickItemToPanelFun = this.itemToPanel;
            this.openBackpack();
            this.changeMouseStatus();
            return;
         }
         this.shenLongPanel.setItem_hufu(this.huShenFu);
         var _loc2_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JU_LING_ZHU,true);
         this.shenLongPanel.setItem_julingzhu(_loc2_);
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ShenLongFuLianZiPanel,function():void
         {
            shenLongPanel.addEventListener(ShenLongFuLianZiPanel.UI_SHENLONGHUSHENFU_HUFU_PUT,easyStonePanelHandle);
            shenLongPanel.addEventListener(ShenLongFuLianZiPanel.UI_SHENLONGHUSHENFU_HUFU_GET,easyStonePanelHandle);
            shenLongPanel.addEventListener(ShenLongFuLianZiPanel.UI_SHENLONGHUSHENFU_START,easyStonePanelHandle);
            shenLongPanel.addEventListener(Event.REMOVED_FROM_STAGE,easyStonePanelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ShenLongFuLianZiPanel,function():void
         {
            shenLongPanel.removeEventListener(ShenLongFuLianZiPanel.UI_SHENLONGHUSHENFU_HUFU_PUT,easyStonePanelHandle);
            shenLongPanel.removeEventListener(ShenLongFuLianZiPanel.UI_SHENLONGHUSHENFU_HUFU_GET,easyStonePanelHandle);
            shenLongPanel.removeEventListener(ShenLongFuLianZiPanel.UI_SHENLONGHUSHENFU_START,easyStonePanelHandle);
            shenLongPanel.removeEventListener(Event.REMOVED_FROM_STAGE,easyStonePanelClose);
         });
      }
      
      private function easyStonePanelClose(param1:* = null) : void
      {
         this.replay();
      }
      
      private function easyStonePanelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         var _loc3_:Object = {};
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.openBackpack();
               break;
            case ShenLongFuLianZiPanel.UI_SHENLONGHUSHENFU_HUFU_PUT:
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case ShenLongFuLianZiPanel.UI_SHENLONGHUSHENFU_HUFU_GET:
               this.replay();
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.resumMouseStatus();
               break;
            case ShenLongFuLianZiPanel.UI_SHENLONGHUSHENFU_START:
               if(!this.huShenFu)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"请放入护身符"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"请放入护身符"),false);
                  return;
               }
               SynthesizeMsg.AmluteSmallLoadingBarMsg = LanResManager.getLanTextWords(this,"护身符合成中");
               this.addLoadBuffer();
               this.send52123(this.huShenFu);
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
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"));
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"));
               return;
            }
            PipeManager.sendMsg(PipeConstants.USE_BAG,0);
            if(EquipMosaic.getEquipMosaicData(param2.id) == 1 && param2.res.kind == GoodsKind.K2)
            {
               this.huShenFu = param2;
               _loc3_.xy = param2.position;
               _loc3_.id = param2.id;
               this.send52121(this.huShenFu);
               this.mouseToNormal();
            }
            else
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"圣龙护身符查询失败"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"圣龙护身符查询失败"),false);
            }
         }
      }
      
      private function send52123(param1:Goods) : void
      {
         var _loc2_:Object = {};
         _loc2_.xy = param1.position;
         _loc2_.id = param1.id;
         this.sendMsg.send_52123(_loc2_);
      }
      
      private function send52121(param1:Goods) : void
      {
         Amult_MsgReceivedProxy.huShenFuIndex = param1.position;
         var _loc2_:Object = {};
         _loc2_.xy = param1.position;
         _loc2_.id = param1.id;
         this.sendMsg.send_52121(_loc2_);
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
         ResizeManager.showDoublePanel(this.shenLongPanel,GameInstance.uiInstance.backpack);
      }
      
      public function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         this.loaderBuff = LoadBuffer.show(GameInstance.uiInstance.shenLongPanel);
      }
      
      public function removeLoaderBuff() : void
      {
         if(this.loaderBuff)
         {
            this.loaderBuff.close();
         }
         this.loaderBuff = null;
      }
      
      private function timerOvre(param1:TimerEvent) : void
      {
         this.timer.removeEventListener(TimerEvent.TIMER,this.timerOvre);
         this.timer = null;
         this.removeLoaderBuff();
      }
      
      private function get sendMsg() : Amult_MsgSenderProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(Amult_MsgSenderProxy.NAME) as Amult_MsgSenderProxy;
         }
         return this._sendMsg;
      }
      
      private function replay() : void
      {
         this.huShenFu = null;
         this.shenLongPanel.setItem_hufu(null);
         this.shenLongPanel.setItem_julingzhu(null);
         this.resumMouseStatus();
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         ResizeManager.hideDoublePanel();
      }
   }
}

