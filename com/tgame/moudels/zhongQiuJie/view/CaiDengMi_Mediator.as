package com.tgame.moudels.zhongQiuJie.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zhongQiuJie.ZhongQiuJie_ApplicationFacade;
   import com.tgame.moudels.zhongQiuJie.model.ZhongQiuJie_MsgSendProxy;
   import com.tgame.shell.view.components.zhongQiuJie.CaiDengMiPanel;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class CaiDengMi_Mediator extends Mediator
   {
      
      public static const NAME:String = "CaiDengMi_Mediator";
      
      private var _senderProxy:ZhongQiuJie_MsgSendProxy;
      
      public function CaiDengMi_Mediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ZhongQiuJie_ApplicationFacade.CLICK_DENGMI];
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
            case ZhongQiuJie_ApplicationFacade.CLICK_DENGMI:
               this.senderProxy.send_78959(_loc2_ as int);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : CaiDengMiPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.caiDengMiPanel);
         }
         return viewComponent as CaiDengMiPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CaiDengMiPanel,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.addEventListener(CaiDengMiPanel.UI_CAIDENGMI_OK_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CaiDengMiPanel,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.removeEventListener(CaiDengMiPanel.UI_CAIDENGMI_OK_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case CaiDengMiPanel.UI_CAIDENGMI_OK_CLICK:
               this.senderProxy.send_78961(param1.data as Array);
         }
      }
      
      public function setData(param1:int, param2:String, param3:String, param4:int, param5:int, param6:int, param7:int, param8:String) : void
      {
         this.panel.x = (GameConfig.sceneWidth - this.panel.width) / 2;
         this.panel.y = (GameConfig.sceneHeight - this.panel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.panel);
         this.panel.setDatas(param1,param2,param6,param7,param4,param5,param3,param8);
      }
   }
}

