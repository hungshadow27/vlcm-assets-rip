package com.tgame.moudels.xianmozhilu.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
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
   import com.tgame.moudels.xianmozhilu.XianMoZhiLu_ApplicationFacade;
   import com.tgame.moudels.xianmozhilu.model.XianMoZhiLu_MsgSenderProxy;
   import com.tgame.shell.view.components.xianmozhilu.XianMoZhiLuPanel;
   import com.tgame.shell.view.components.xianmozhilu.XianMoZhiLu_XianMoZhuanZhi;
   import com.tgame.shell.view.components.xianmozhilu.XianMoZhiLu_ZhuangBeiShengJie;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XianMoZhiLu_Mediator extends Mediator
   {
      
      public static const NAME:String = "XianMoZhiLu_Mediator";
      
      public var zhuangBeiShengJi:XianMoZhiLu_ZhuangBeiShengJie;
      
      public var xianMoZhuanZhi:XianMoZhiLu_XianMoZhuanZhi;
      
      private var isZHuanZHI:Boolean = false;
      
      private var _senderProxy:XianMoZhiLu_MsgSenderProxy;
      
      private var data:Object = new Object();
      
      public function XianMoZhiLu_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : XianMoZhiLu_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XianMoZhiLu_MsgSenderProxy.NAME) as XianMoZhiLu_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [XianMoZhiLu_ApplicationFacade.GET_XIANMOZHILU_PANEL,XianMoZhiLu_ApplicationFacade.NPC_REQ_FUNCTION,XianMoZhiLu_ApplicationFacade.GOODS_CHANGED,XianMoZhiLu_ApplicationFacade.UI_ZHONGZUJIEMIAN_YICHU_CLICK,XianMoZhiLu_ApplicationFacade.UI_ZHONGZUJIEMIAN_WAIXIAN_CLICK,XianMoZhiLu_ApplicationFacade.UI_ZHONGZUJIEMIAN_SKILL_DRAG];
      }
      
      public function get panel() : XianMoZhiLuPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xianmozhiluPanel);
         }
         return viewComponent as XianMoZhiLuPanel;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:ItemFace = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case XianMoZhiLu_ApplicationFacade.GET_XIANMOZHILU_PANEL:
               this.senderProxy.send_80231(1);
               break;
            case XianMoZhiLu_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(GameInstance.uiInstance._xianmozhiluPanel))
               {
                  this.panel.setGoodsChangeHandler();
               }
               if(this.zhuangBeiShengJi)
               {
                  this.zhuangBeiShengJi.setGoodsChangeHandler();
               }
               break;
            case XianMoZhiLu_ApplicationFacade.NPC_REQ_FUNCTION:
               this.senderProxy.send_80241();
               break;
            case XianMoZhiLu_ApplicationFacade.UI_ZHONGZUJIEMIAN_YICHU_CLICK:
               this.senderProxy.send_80467();
               break;
            case XianMoZhiLu_ApplicationFacade.UI_ZHONGZUJIEMIAN_WAIXIAN_CLICK:
               this.senderProxy.send_80465(_loc2_ as int);
               break;
            case XianMoZhiLu_ApplicationFacade.UI_ZHONGZUJIEMIAN_SKILL_DRAG:
               _loc3_ = _loc2_ as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = _loc3_;
                  TCursorManager.showItem(_loc3_.itemBD);
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XianMoZhiLuPanel,function():void
         {
            panel.addEventListener(XianMoZhiLuPanel.XIANMOZHILU_TUPO_CLICK,handler);
            panel.addEventListener(XianMoZhiLuPanel.XIANMOZHILU_FANYE_CLICK,handler);
            panel.addEventListener(XianMoZhiLuPanel.XIANMOZHILU_INTO_MAP_CLICK,handler);
            panel.addEventListener(XianMoZhiLuPanel.XIANMOZHILU_OPEN_ZHUANGBEI_CLICK,handler);
            panel.addEventListener(XianMoZhiLuPanel.XIANMOZHILU_OPEN_ZHUANZHI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XianMoZhiLuPanel,function():void
         {
            panel.removeEventListener(XianMoZhiLuPanel.XIANMOZHILU_TUPO_CLICK,handler);
            panel.removeEventListener(XianMoZhiLuPanel.XIANMOZHILU_FANYE_CLICK,handler);
            panel.removeEventListener(XianMoZhiLuPanel.XIANMOZHILU_INTO_MAP_CLICK,handler);
            panel.removeEventListener(XianMoZhiLuPanel.XIANMOZHILU_OPEN_ZHUANGBEI_CLICK,handler);
            panel.removeEventListener(XianMoZhiLuPanel.XIANMOZHILU_OPEN_ZHUANZHI_CLICK,handler);
         });
      }
      
      private function handler(param1:*) : void
      {
         switch(param1.type)
         {
            case XianMoZhiLuPanel.XIANMOZHILU_TUPO_CLICK:
               this.senderProxy.send_80233(param1.data as int);
               break;
            case XianMoZhiLuPanel.XIANMOZHILU_FANYE_CLICK:
               this.senderProxy.send_80231(param1.data as int);
               break;
            case XianMoZhiLuPanel.XIANMOZHILU_INTO_MAP_CLICK:
               this.senderProxy.send_80235();
               break;
            case XianMoZhiLuPanel.XIANMOZHILU_OPEN_ZHUANGBEI_CLICK:
               if(!this.zhuangBeiShengJi)
               {
                  this.zhuangBeiShengJi = new XianMoZhiLu_ZhuangBeiShengJie();
               }
               this.zhuangBeiShengJi.x = (GameConfig.sceneWidth - this.zhuangBeiShengJi.width) / 2;
               this.zhuangBeiShengJi.y = (GameConfig.sceneHeight - this.zhuangBeiShengJi.height) / 2;
               GameInstance.uiInstance.uiContainer.addChild(this.zhuangBeiShengJi);
               this.zhuangBeiShengJi.addEventListener(XianMoZhiLuPanel.UI_EQUIP_PUT_CLICK,this.handler);
               this.zhuangBeiShengJi.addEventListener(XianMoZhiLuPanel.UI_EQUIP_GET_CLICK,this.handler);
               this.zhuangBeiShengJi.addEventListener(XianMoZhiLuPanel.UI_ZHUANHUAN_START_CLICK,this.handler);
               this.zhuangBeiShengJi.addEventListener(FCloseEvent.CLOSE,this.handler);
               break;
            case XianMoZhiLuPanel.XIANMOZHILU_OPEN_ZHUANZHI_CLICK:
               if(this.isZHuanZHI)
               {
                  PipeManager.sendMsg(PipeConstants.GET_ZHONGZU_PANEL,1);
               }
               else
               {
                  if(!this.xianMoZhuanZhi)
                  {
                     this.xianMoZhuanZhi = new XianMoZhiLu_XianMoZhuanZhi();
                     this.xianMoZhuanZhi.addEventListener(XianMoZhiLu_XianMoZhuanZhi.UI_XIANMOZHUANZHI_CLICK,this.zhuanzhiFun);
                  }
                  this.xianMoZhuanZhi.x = (GameConfig.sceneWidth - 900) / 2;
                  this.xianMoZhuanZhi.y = (GameConfig.sceneHeight - 577) / 2;
                  GameInstance.uiInstance.uiContainer.addChild(this.xianMoZhuanZhi);
               }
               break;
            case XianMoZhiLuPanel.UI_EQUIP_PUT_CLICK:
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case XianMoZhiLuPanel.UI_EQUIP_GET_CLICK:
               this.getItems();
               break;
            case XianMoZhiLuPanel.UI_ZHUANHUAN_START_CLICK:
               this.senderProxy.send_80239(this.data);
               break;
            case FCloseEvent.CLOSE:
               if(this.zhuangBeiShengJi.parent)
               {
                  this.getItems();
                  this.zhuangBeiShengJi.parent.removeChild(this.zhuangBeiShengJi);
                  this.zhuangBeiShengJi.removeEventListener(XianMoZhiLuPanel.UI_EQUIP_PUT_CLICK,this.handler);
                  this.zhuangBeiShengJi.removeEventListener(XianMoZhiLuPanel.UI_EQUIP_GET_CLICK,this.handler);
                  this.zhuangBeiShengJi.removeEventListener(XianMoZhiLuPanel.UI_ZHUANHUAN_START_CLICK,this.handler);
                  this.zhuangBeiShengJi.removeEventListener(FCloseEvent.CLOSE,this.handler);
               }
         }
      }
      
      private function zhuanzhiFun(param1:*) : void
      {
         this.senderProxy.send_80461(param1.data as int);
      }
      
      public function setTrackVisibleInto(param1:Boolean) : void
      {
         if(param1)
         {
            GameInstance.uiInstance.mainUI.setTrackVisible(false);
            GameInstance.uiInstance.mainUI.setImageLeadContainerVisible(false);
         }
      }
      
      public function setTrackVisibleBack(param1:Boolean) : void
      {
         if(param1)
         {
            GameInstance.uiInstance.mainUI.setTrackVisible(true);
            GameInstance.uiInstance.mainUI.setImageLeadContainerVisible(true);
         }
      }
      
      public function setXianMoZhiLuData(param1:int = 0, param2:int = 0, param3:Array = null, param4:Boolean = false) : void
      {
         this.isZHuanZHI = param4;
         PipeManager.sendMsg(PipeConstants.SHOW_XIANMOZHILU);
         this.panel.setXianMoZhiLuData(param1,param2,param3);
      }
      
      public function setZhuangBeiYuLanData(param1:int = 0, param2:int = 0, param3:int = 0) : void
      {
         if(this.zhuangBeiShengJi)
         {
            this.zhuangBeiShengJi.setZhuangBeiYuLanData(this.data.ID,param1,param2,param3);
         }
      }
      
      public function setZhuangBeiShengJiData(param1:int = 0) : void
      {
         if(param1)
         {
            this.getItems();
         }
      }
      
      private function getItems() : void
      {
         this.zhuangBeiShengJi.reset();
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.resumMouseStatus();
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
            if(param2.res.kind != GoodsKind.K2)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
               return;
            }
         }
         this.data.position = param2.position;
         this.data.ID = param2.id;
         this.senderProxy.send_80237(this.data);
         this.mouseToNormal();
      }
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.zhuangBeiShengJi,GameInstance.uiInstance.backpack);
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
      
      public function setChengongZhuanzhi(param1:Boolean) : void
      {
         if(param1)
         {
            this.senderProxy.send_80463();
            this.xianMoZhuanZhi.onClose();
            this.panel.onClose();
         }
      }
      
      public function setjieChu(param1:Boolean) : void
      {
         if(param1)
         {
            this.panel.onClose();
         }
      }
   }
}

