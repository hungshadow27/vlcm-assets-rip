package com.tgame.moudels.zhongQiuJie.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zhongQiuJie.ZhongQiuJie_ApplicationFacade;
   import com.tgame.moudels.zhongQiuJie.model.ZhongQiuJie_MsgSendProxy;
   import com.tgame.shell.view.components.zhongQiuJie.ZhongQiuJiePanel;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZhongQiuJie_Mediator extends Mediator
   {
      
      public static const NAME:String = "ZhongQiuJie_Mediator";
      
      private var _senderProxy:ZhongQiuJie_MsgSendProxy;
      
      public function ZhongQiuJie_Mediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ZhongQiuJie_ApplicationFacade.SHOW_ZHONGQIUJIE_PANEL,ZhongQiuJie_ApplicationFacade.TARGET_FUNCTION_QICHENG,ZhongQiuJie_ApplicationFacade.MAINUI_QUEXIAO_QICHENG,ZhongQiuJie_ApplicationFacade.SEND_YN_BOOK,ZhongQiuJie_ApplicationFacade.REQUEST_YN_BOOKRANKPANEL,ZhongQiuJie_ApplicationFacade.REQUEST_YN_BOOK_GETRANK_GOODS,ZhongQiuJie_ApplicationFacade.REQUEST_YN_BOOK_PAIHANG];
      }
      
      private function get senderProxy() : ZhongQiuJie_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ZhongQiuJie_MsgSendProxy.NAME) as ZhongQiuJie_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ZhongQiuJie_ApplicationFacade.SHOW_ZHONGQIUJIE_PANEL:
               this.senderProxy.send_77481();
               this.senderProxy.send_77491(1);
               break;
            case ZhongQiuJie_ApplicationFacade.TARGET_FUNCTION_QICHENG:
               this.senderProxy.send_77511();
               break;
            case ZhongQiuJie_ApplicationFacade.MAINUI_QUEXIAO_QICHENG:
               this.senderProxy.send_77517();
               break;
            case ZhongQiuJie_ApplicationFacade.SEND_YN_BOOK:
               this.senderProxy.send_77485(_loc2_);
               break;
            case ZhongQiuJie_ApplicationFacade.REQUEST_YN_BOOKRANKPANEL:
               this.senderProxy.send_77491(1);
               break;
            case ZhongQiuJie_ApplicationFacade.REQUEST_YN_BOOK_GETRANK_GOODS:
               this.senderProxy.send_77493();
               break;
            case ZhongQiuJie_ApplicationFacade.REQUEST_YN_BOOK_PAIHANG:
               this.senderProxy.send_77491(_loc2_);
         }
      }
      
      public function showQiChengQueRen() : void
      {
         FAlert.okLabel = LanResManager.getLanCommonTextWords("同意");
         FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
         FAlert.show(LanResManager.getLanCommonTextWords("你的配偶请求骑乘坐骑,是否同意？"),"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               senderProxy.send_77515(1);
            }
            else
            {
               senderProxy.send_77515(0);
            }
         },true);
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : ZhongQiuJiePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.zhongQiuJiePanel);
         }
         return viewComponent as ZhongQiuJiePanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ZhongQiuJiePanel,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.addEventListener(ZhongQiuJiePanel.UI_ZHONGQIUJIE_DUIHUAN,onHandle);
            panel.addEventListener(ZhongQiuJiePanel.UI_ZHONGQIUJIE_TIJIAO,onHandle);
            panel.addEventListener(ZhongQiuJiePanel.UI_ZHONGQIUJIE_GETJIANGLI,onHandle);
            panel.addEventListener(ZhongQiuJiePanel.UI_ZHONGQIUJIE_PAIHANG,onHandle);
            panel.addEventListener(ZhongQiuJiePanel.UI_ZHONGQIUJIE_GETRANK_GOODS,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ZhongQiuJiePanel,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.removeEventListener(ZhongQiuJiePanel.UI_ZHONGQIUJIE_DUIHUAN,onHandle);
            panel.removeEventListener(ZhongQiuJiePanel.UI_ZHONGQIUJIE_TIJIAO,onHandle);
            panel.removeEventListener(ZhongQiuJiePanel.UI_ZHONGQIUJIE_GETJIANGLI,onHandle);
            panel.removeEventListener(ZhongQiuJiePanel.UI_ZHONGQIUJIE_PAIHANG,onHandle);
            panel.removeEventListener(ZhongQiuJiePanel.UI_ZHONGQIUJIE_GETRANK_GOODS,onHandle);
         });
      }
      
      public function setPanelData(param1:int, param2:Array, param3:Goods, param4:int, param5:Array) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            this.panel.x = (GameConfig.sceneWidth - this.panel.width) / 2;
            this.panel.y = (GameConfig.sceneHeight - this.panel.height) / 2;
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
         this.panel.update(param1,param4,param2,param3);
         this.panel.setJiangchi(param5);
      }
      
      public function setRankDate(param1:int, param2:int, param3:Array, param4:Boolean, param5:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.zhongQiuJieRankPanel))
         {
            GameInstance.uiInstance.zhongQiuJieRankPanel.x = (GameConfig.sceneWidth - GameInstance.uiInstance.zhongQiuJieRankPanel.width) / 2;
            GameInstance.uiInstance.zhongQiuJieRankPanel.y = (GameConfig.sceneHeight - GameInstance.uiInstance.zhongQiuJieRankPanel.height) / 2;
            GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.zhongQiuJieRankPanel);
            GameInstance.uiInstance.zhongQiuJieRankPanel.$parent = this.panel;
         }
         GameInstance.uiInstance.zhongQiuJieRankPanel.updateRank(param1,param2,param3,param4,param5);
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case ZhongQiuJiePanel.UI_ZHONGQIUJIE_DUIHUAN:
               this.senderProxy.send_77483(param1.data as int);
               break;
            case ZhongQiuJiePanel.UI_ZHONGQIUJIE_TIJIAO:
               this.senderProxy.send_77485(param1.data as int);
               break;
            case ZhongQiuJiePanel.UI_ZHONGQIUJIE_GETJIANGLI:
               this.senderProxy.send_77487(param1.data as int);
               break;
            case ZhongQiuJiePanel.UI_ZHONGQIUJIE_PAIHANG:
               this.senderProxy.send_77491(param1.data as int);
               break;
            case ZhongQiuJiePanel.UI_ZHONGQIUJIE_GETRANK_GOODS:
               this.senderProxy.send_77493();
         }
      }
   }
}

