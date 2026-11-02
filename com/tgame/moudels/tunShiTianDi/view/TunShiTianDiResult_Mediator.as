package com.tgame.moudels.tunShiTianDi.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.tunShiTianDi.model.TunShiTianDi_MsgSenderProxy;
   import com.tgame.shell.view.components.tunshitiandi.TunShiTianDi_JieGuo;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TunShiTianDiResult_Mediator extends Mediator
   {
      
      public static const NAME:String = "TunShiTianDiResult_Mediator";
      
      public function TunShiTianDiResult_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function onRemove() : void
      {
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      public function get panel() : TunShiTianDi_JieGuo
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.tunShiTianDiResultPanel);
         }
         return viewComponent as TunShiTianDi_JieGuo;
      }
      
      public function get senderProxy() : TunShiTianDi_MsgSenderProxy
      {
         return facade.retrieveProxy(TunShiTianDi_MsgSenderProxy.NAME) as TunShiTianDi_MsgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TunShiTianDi_JieGuo,function():void
         {
            panel.addEventListener(TunShiTianDi_JieGuo.TUNSHITIANDI_CHUANHUIYUANFU_CLICK,panelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TunShiTianDi_JieGuo,function():void
         {
            panel.removeEventListener(TunShiTianDi_JieGuo.TUNSHITIANDI_CHUANHUIYUANFU_CLICK,panelHandle);
         });
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case TunShiTianDi_JieGuo.TUNSHITIANDI_CHUANHUIYUANFU_CLICK:
               PipeManager.sendMsg(PipeConstants.LIKAI_KUAFU_LEITAI);
               this.hidePanel();
         }
      }
      
      public function showResultPanel(param1:Boolean) : void
      {
         if(param1)
         {
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
            this.panel.x = (GameConfig.sceneWidth - this.panel.width) / 2;
            this.panel.y = (GameConfig.sceneHeight - this.panel.height) / 2;
         }
         else if(Fun.isVisible(this.panel))
         {
            this.hidePanel();
         }
      }
      
      public function setResultPanel(param1:int, param2:int, param3:Array, param4:Array, param5:int) : void
      {
         this.panel.setInitialize(param1,param2,param3,param4,param5);
      }
      
      public function hidePanel() : void
      {
         if(Boolean(this.panel) && this.panel.parent != null)
         {
            this.panel.parent.removeChild(this.panel);
         }
         this.panel.clearData();
      }
   }
}

