package com.tgame.moudels.synthesize.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
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
   import com.tgame.moudels.synthesize.Synthesize_ApplicationFacde;
   import com.tgame.moudels.synthesize.model.Synthesize_MsgSendProxy;
   import com.tgame.shell.view.components.amulet.HushenfuXilianCanvas;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneRender;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class HushenfuXilianMediator extends Mediator
   {
      
      public static const NAME:String = "HushenfuXilianMediator";
      
      private var equip:Goods;
      
      private var panelType:String = "";
      
      private var loaderBuff:LoadBuffer;
      
      private var ary:Array = [];
      
      private var g1:Goods;
      
      private var boo:Boolean;
      
      private var goodsType:int = 0;
      
      private var lastTime:int;
      
      private var _sendMsg:Synthesize_MsgSendProxy;
      
      private var paneType:int = 0;
      
      public function HushenfuXilianMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get panel() : HushenfuXilianCanvas
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.hushenfuXiLianPanel);
         }
         return viewComponent as HushenfuXilianCanvas;
      }
      
      private function get sendMsg() : Synthesize_MsgSendProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(Synthesize_MsgSendProxy.NAME) as Synthesize_MsgSendProxy;
         }
         return this._sendMsg;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Synthesize_ApplicationFacde.GOODS_CHANGED,Synthesize_ApplicationFacde.HUSHEN_XILIAN];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:Array = _loc2_ as Array;
         switch(param1.getName())
         {
            case Synthesize_ApplicationFacde.HUSHEN_XILIAN:
               this.boo = false;
               this.panel.setSuccText(this.boo,0);
               if((_loc3_[0] as Goods).res.xunZhangXiLian)
               {
                  this.goodsType = 1;
                  this.sendMsg.send_53557([(_loc3_[0] as Goods).position,0]);
               }
               else if(_loc3_[1] == 0)
               {
                  this.goodsType = 0;
                  this.sendMsg.send_53557([(_loc3_[0] as Goods).position,0]);
               }
               else
               {
                  this.goodsType = 2;
                  this.sendMsg.send_53557([(_loc3_[0] as Goods).position,1]);
               }
               this.panel.setPanelText(this.goodsType);
               break;
            case Synthesize_ApplicationFacde.GOODS_CHANGED:
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(HushenfuXilianCanvas,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
            panel.addEventListener(HushenfuXilianCanvas.UI_SHENLONGHUSHENFU_HUFU_PUT_X,hanndel);
            panel.addEventListener(HushenfuXilianCanvas.UI_SHENLONGHUSHENFU_HUFU_GET_X,hanndel);
            panel.addEventListener(HushenfuXilianCanvas.UI_SHENLONGHUSHENFU_START_X,hanndel);
            panel.addEventListener(HushenfuXilianCanvas.UI_SHENLONGHUSHENFU_HUIFU_X,hanndel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(HushenfuXilianCanvas,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
            panel.removeEventListener(HushenfuXilianCanvas.UI_SHENLONGHUSHENFU_HUFU_PUT_X,hanndel);
            panel.removeEventListener(HushenfuXilianCanvas.UI_SHENLONGHUSHENFU_HUFU_GET_X,hanndel);
            panel.removeEventListener(HushenfuXilianCanvas.UI_SHENLONGHUSHENFU_START_X,hanndel);
            panel.removeEventListener(HushenfuXilianCanvas.UI_SHENLONGHUSHENFU_HUIFU_X,hanndel);
         });
      }
      
      private function panelClose(param1:* = null, param2:Boolean = true) : void
      {
         this.equip = null;
         this.panel.getEquip();
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.resumMouseStatus();
         GameInstance.uiInstance.backpack.functionBtnEnalbe = true;
      }
      
      private function hanndel(param1:Event = null) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case HushenfuXilianCanvas.UI_SHENLONGHUSHENFU_HUFU_PUT_X:
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case HushenfuXilianCanvas.UI_SHENLONGHUSHENFU_HUFU_GET_X:
               this.panelClose(null,false);
               this.panel.getEquip();
               this.panel.setEnergyExpendItem(false,this.g1);
               this.boo = false;
               this.panel.setSuccText(this.boo,0);
               this.panel.setBtn(false);
               this.panel.setPanelText(this.goodsType);
               GameInstance.uiInstance.backpack.functionBtnEnalbe = true;
               break;
            case HushenfuXilianCanvas.UI_SHENLONGHUSHENFU_START_X:
               this.boo = false;
               this.panel.setSuccText(this.boo,0);
               if(this.equip)
               {
                  if(SceneRender.nowTime - this.lastTime >= 300)
                  {
                     if(this.goodsType == 1)
                     {
                        this.sendMsg.send_53559({
                           "index":this.equip.position,
                           "type":(_loc2_.data ? 4 : 3)
                        });
                     }
                     else if(this.goodsType == 2)
                     {
                        this.sendMsg.send_53559({
                           "index":this.equip.position,
                           "type":5
                        });
                     }
                     else
                     {
                        this.sendMsg.send_53559({
                           "index":this.equip.position,
                           "type":1
                        });
                     }
                     this.lastTime = SceneRender.nowTime;
                  }
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               }
               break;
            case HushenfuXilianCanvas.UI_SHENLONGHUSHENFU_HUIFU_X:
               this.boo = false;
               this.panel.setSuccText(this.boo,0);
               if(this.equip)
               {
                  if(SceneRender.nowTime - this.lastTime >= 300)
                  {
                     this.sendMsg.send_53559({
                        "index":this.equip.position,
                        "type":2
                     });
                     this.lastTime = SceneRender.nowTime;
                  }
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               }
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
            if(this.goodsType == 0 && param2.id != SpecialGoodsID.SHEN_LONG_HU_SHEN_FU && param2.id != SpecialGoodsID.CHUANSHUO_SHEN_LONG_HU_SHEN_FU && param2.id != SpecialGoodsID.ZHAN_XUESHOU_HU_SHEN_FU)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是神龙护身符"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是神龙护身符"),false);
               return;
            }
            if(this.goodsType == 1 && !param2.res.xunZhangXiLian)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("该物品不能洗练"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("该物品不能洗练"),false);
               return;
            }
            if(this.goodsType == 2 && param2.id != SpecialGoodsID.SHEN_LONG_HU_SHEN_FU && param2.id != SpecialGoodsID.CHUANSHUO_SHEN_LONG_HU_SHEN_FU && param2.id != SpecialGoodsID.ZHAN_XUESHOU_HU_SHEN_FU)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是神龙护身符"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是神龙护身符"),false);
               return;
            }
         }
         this.equip = param2;
         this.mouseToNormal();
         this.panel.setEquip(this.equip);
         if(this.goodsType == 2)
         {
            this.sendMsg.send_53557([this.equip.position,1]);
         }
         else
         {
            this.sendMsg.send_53557([this.equip.position,0]);
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
      
      public function setUpdataItem(param1:int, param2:Array, param3:int, param4:int = 0) : void
      {
         this.goodsType = param4;
         this.ary = param2;
         if(param1 == 0)
         {
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
            return;
         }
         if(!Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
         }
         this.g1 = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2[0].id,true);
         if(this.equip == null)
         {
            this.panel.setEnergyExpendItem(false,this.g1);
            this.panel.setBtn(false);
         }
         else
         {
            this.setGoods();
            this.panel.setBtn(true);
         }
         if(param2[0].id == 40864)
         {
            this.goodsType = 2;
            this.panel.setWugongText(0);
         }
         else
         {
            this.panel.setWugongText(param3);
         }
         GameInstance.uiInstance.backpack.functionBtnEnalbe = false;
      }
      
      public function setGoods() : void
      {
         var _loc1_:Boolean = false;
         if(this.g1.count >= this.ary[0].count)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = true;
         }
         this.panel.setEnergyExpendItem(_loc1_,this.g1,this.ary[1]);
      }
      
      public function equipUpDataCommplete(param1:int, param2:int, param3:int, param4:int = 0) : void
      {
         this.goodsType = param4;
         if(param1 < 0)
         {
            return;
         }
         if(param3 > 0)
         {
            this.boo = true;
         }
         else
         {
            this.boo = false;
         }
         this.panel.setSuccText(this.boo,param2);
         this.equip = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param1);
         this.panel.setEquip(this.equip);
         this.sendMsg.send_53557([this.equip.position,0]);
      }
   }
}

