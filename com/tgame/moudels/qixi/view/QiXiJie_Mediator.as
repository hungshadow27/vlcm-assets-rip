package com.tgame.moudels.qixi.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.qixi.QiXiJie_ApplicationFacade;
   import com.tgame.moudels.qixi.model.QiXiJie_MsgSendProxy;
   import com.tgame.shell.view.components.qixi.QiXiPanel;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QiXiJie_Mediator extends Mediator
   {
      
      public static const NAME:String = "QiXiJie_Mediator";
      
      private var _senderProxy:QiXiJie_MsgSendProxy;
      
      public function QiXiJie_Mediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [QiXiJie_ApplicationFacade.GET_QIXIJIE_PANEL];
      }
      
      private function get senderProxy() : QiXiJie_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(QiXiJie_MsgSendProxy.NAME) as QiXiJie_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case QiXiJie_ApplicationFacade.GET_QIXIJIE_PANEL:
               this.senderProxy.send_74301();
               this.senderProxy.send_74305(1);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : QiXiPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.qixiPanel);
         }
         return viewComponent as QiXiPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(QiXiPanel,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.addEventListener(QiXiPanel.UI_QIXI,onHandle);
            panel.addEventListener(QiXiPanel.UI_QIXI_GET,onHandle);
            panel.addEventListener(QiXiPanel.UI_QIXI_PAIHANG,onHandle);
            panel.addEventListener(QiXiPanel.UI_QIXI_TIJIAO,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(QiXiPanel,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.removeEventListener(QiXiPanel.UI_QIXI,onHandle);
            panel.removeEventListener(QiXiPanel.UI_QIXI_GET,onHandle);
            panel.removeEventListener(QiXiPanel.UI_QIXI_PAIHANG,onHandle);
            panel.removeEventListener(QiXiPanel.UI_QIXI_TIJIAO,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.guanbi();
               break;
            case QiXiPanel.UI_QIXI_GET:
               this.senderProxy.send_74303(param1.data as int);
               break;
            case QiXiPanel.UI_QIXI_PAIHANG:
               this.senderProxy.send_74305(param1.data as int);
               break;
            case QiXiPanel.UI_QIXI_TIJIAO:
               this.senderProxy.send_74307(param1.data as int);
         }
      }
      
      public function update(param1:int, param2:Array) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_QIXIJIE_PANEL);
         if(Fun.isVisible(GameInstance.uiInstance.qixiPanel))
         {
            GameInstance.uiInstance.qixiPanel.update(param1,param2);
         }
      }
      
      public function updateRank(param1:int, param2:int, param3:Array, param4:int, param5:int) : void
      {
         this.panel.setPaihang(param1,param2,param3,param4,param5);
      }
      
      private function guanbi() : void
      {
      }
   }
}

