package com.tgame.moudels.ganjiangmoyezhuzao.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ganjiangmoyezhuzao.model.GanJiangMoYeZhuZao_MsgSenderProxy;
   import com.tgame.shell.view.components.ganjiangmoyezhuzao.GanJiangMoYeZhuZaoPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class GanJiangMoYeZhuZao_Mediator extends Mediator
   {
      
      public static const NAME:String = "GanJiangMoYeZhuZao_Mediator";
      
      public function GanJiangMoYeZhuZao_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function onRemove() : void
      {
      }
      
      public function get panel() : GanJiangMoYeZhuZaoPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ganjiangmoyeZhuZaoPanel);
         }
         return viewComponent as GanJiangMoYeZhuZaoPanel;
      }
      
      public function get senderProxy() : GanJiangMoYeZhuZao_MsgSenderProxy
      {
         return facade.retrieveProxy(GanJiangMoYeZhuZao_MsgSenderProxy.NAME) as GanJiangMoYeZhuZao_MsgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(GanJiangMoYeZhuZaoPanel,function():void
         {
            panel.addEventListener(GanJiangMoYeZhuZaoPanel.UI_GANJIANGMOYEZHUZAOPANEL_DUANZAOBTN_CLICK,panelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(GanJiangMoYeZhuZaoPanel,function():void
         {
            panel.removeEventListener(GanJiangMoYeZhuZaoPanel.UI_GANJIANGMOYEZHUZAOPANEL_DUANZAOBTN_CLICK,panelHandle);
         });
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case GanJiangMoYeZhuZaoPanel.UI_GANJIANGMOYEZHUZAOPANEL_DUANZAOBTN_CLICK:
               this.senderProxy.send_61011();
         }
      }
      
      public function sucess_zhuzao(param1:int) : void
      {
         if(param1 == 1)
         {
            this.panel.showlihua();
         }
      }
   }
}

