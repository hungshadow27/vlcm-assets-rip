package com.tgame.moudels.yitiantulong.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.yitiantulong.YiTianTuLong_ApplicationFacade;
   import com.tgame.moudels.yitiantulong.model.YiTianTuLong_MsgSenderProxy;
   import com.tgame.shell.view.components.yitiantulong.YiTianTuLong;
   import com.tgame.shell.view.components.yitiantulong.jinruBaituoshanPanel;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YiTianTuLong_Mediator extends Mediator
   {
      
      public static const NAME:String = "YiTianTuLong_Mediator";
      
      public var isJDreturn:Boolean = false;
      
      private var equip:Goods;
      
      private var equipid:int = 0;
      
      private var equipXY:int = 0;
      
      private var _jinruBaituoshanPanel:jinruBaituoshanPanel;
      
      private var _senderProxy:YiTianTuLong_MsgSenderProxy;
      
      public function YiTianTuLong_Mediator()
      {
         super(NAME);
      }
      
      public static function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         return [YiTianTuLong_ApplicationFacade.SHOW_YITIANTULONG_PANEL,YiTianTuLong_ApplicationFacade.BAITUOSHANXIA];
      }
      
      private function get senderProxy() : YiTianTuLong_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YiTianTuLong_MsgSenderProxy.NAME) as YiTianTuLong_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case YiTianTuLong_ApplicationFacade.SHOW_YITIANTULONG_PANEL:
               this.senderProxy.send_79481();
               break;
            case YiTianTuLong_ApplicationFacade.BAITUOSHANXIA:
               this.setBaituoshanPanel();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YiTianTuLong
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.yitiantulongPanel);
         }
         return viewComponent as YiTianTuLong;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YiTianTuLong,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.addEventListener(YiTianTuLong.UI_SHOW_YITIANTULONG,onHandle);
            panel.addEventListener(YiTianTuLong.UI_YITIANTULONG_ZHOANGJIAN_CLICK,onHandle);
            panel.addEventListener(YiTianTuLong.UI_XUANTIEZHONGJIAN_ZHUZAO_CLICK,onHandle);
            panel.addEventListener(YiTianTuLong.UI_XUANTIEZHONGJIAN_CUILIAN_CLICK,onHandle);
            panel.addEventListener(YiTianTuLong.UI_YITIANTULONG_JINCHANG_CLICK,onHandle);
            panel.addEventListener(YiTianTuLong.UI_XUANTIEZHONGJIAN_FANGRU_CLICK,onHandle);
            panel.addEventListener(YiTianTuLong.UI_YITIANTULONG_WUHUNSHANGDIAN_CLICK,onHandle);
            panel.addEventListener(YiTianTuLong.UI_YITIANTULONG_KUAFUBAOGUO_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YiTianTuLong,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.removeEventListener(YiTianTuLong.UI_SHOW_YITIANTULONG,onHandle);
            panel.removeEventListener(YiTianTuLong.UI_YITIANTULONG_ZHOANGJIAN_CLICK,onHandle);
            panel.removeEventListener(YiTianTuLong.UI_XUANTIEZHONGJIAN_ZHUZAO_CLICK,onHandle);
            panel.removeEventListener(YiTianTuLong.UI_XUANTIEZHONGJIAN_CUILIAN_CLICK,onHandle);
            panel.removeEventListener(YiTianTuLong.UI_YITIANTULONG_JINCHANG_CLICK,onHandle);
            panel.removeEventListener(YiTianTuLong.UI_XUANTIEZHONGJIAN_FANGRU_CLICK,onHandle);
            panel.removeEventListener(YiTianTuLong.UI_YITIANTULONG_WUHUNSHANGDIAN_CLICK,onHandle);
            panel.removeEventListener(YiTianTuLong.UI_YITIANTULONG_KUAFUBAOGUO_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case YiTianTuLong.UI_SHOW_YITIANTULONG:
               this.senderProxy.send_79481();
               break;
            case YiTianTuLong.UI_YITIANTULONG_ZHOANGJIAN_CLICK:
               this.senderProxy.send_79483();
               break;
            case YiTianTuLong.UI_XUANTIEZHONGJIAN_ZHUZAO_CLICK:
               this.senderProxy.send_79485([1,0,0]);
               break;
            case YiTianTuLong.UI_XUANTIEZHONGJIAN_CUILIAN_CLICK:
               this.senderProxy.send_79485([2,this.equipid,this.equipXY]);
               break;
            case YiTianTuLong.UI_YITIANTULONG_JINCHANG_CLICK:
               _loc2_ = param1.data as int;
               this.senderProxy.send_79487(_loc2_);
               break;
            case YiTianTuLong.UI_YITIANTULONG_WUHUNSHANGDIAN_CLICK:
               _loc2_ = param1.data as int;
               PipeManager.sendMsg(PipeConstants.SET_MAINCHAR_MALL,_loc2_);
               break;
            case YiTianTuLong.UI_XUANTIEZHONGJIAN_FANGRU_CLICK:
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case YiTianTuLong.UI_YITIANTULONG_KUAFUBAOGUO_CLICK:
               PipeManager.sendMsg(PipeConstants.MAINUI_KUAFU_GUIZHE_QUERY,3);
         }
      }
      
      public function setPanel(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int, param7:Array, param8:*, param9:Boolean) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            this.panel.x = (GameConfig.sceneWidth - this.panel.width) / 2;
            this.panel.y = (GameConfig.sceneHeight - this.panel.height) / 2;
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
         this.panel.setPanel(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setZhuZao(param1:int, param2:Boolean) : void
      {
         var _loc3_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param1,true);
         this.panel.setZhuZao(_loc3_.res.name,_loc3_.count,param2);
      }
      
      public function setChengGong() : void
      {
         this.panel.setChengGong();
      }
      
      public function setClose() : void
      {
         this.panel.onClose1();
         resumMouseStatus();
      }
      
      public function setCount(param1:int) : void
      {
         var _loc2_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(45522,true);
         this.panel.setCuiLian(_loc2_.res.name,_loc2_.count,param1);
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
            if(param2.res.position != 651)
            {
               NoticeManager.notify(NoticeManager.FOOT,"请放入玄铁重剑",false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"请放入玄铁重剑",false);
               return;
            }
         }
         this.equip = param2;
         this.mouseToNormal();
         this.panel.setEquip(this.equip);
         var _loc4_:Object = {};
         _loc4_.byte = 0;
         _loc4_.XY = this.equip.position;
         _loc4_.ID = this.equip.id;
         this.equipid = this.equip.id;
         this.equipXY = this.equip.position;
         this.senderProxy.send_79495(this.equipid);
      }
      
      public function setBaituoshanPanel() : void
      {
         if(this._jinruBaituoshanPanel == null)
         {
            this._jinruBaituoshanPanel = new jinruBaituoshanPanel();
            this._jinruBaituoshanPanel.addEventListener(jinruBaituoshanPanel.UI_JINRUBAITUOSHAN_CLICK,function(param1:Event):void
            {
               senderProxy.send_70567();
            });
         }
         this._jinruBaituoshanPanel.x = (GameConfig.sceneWidth - this._jinruBaituoshanPanel.width) / 2;
         this._jinruBaituoshanPanel.y = (GameConfig.sceneHeight - this._jinruBaituoshanPanel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this._jinruBaituoshanPanel);
      }
   }
}

