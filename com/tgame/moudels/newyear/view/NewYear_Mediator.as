package com.tgame.moudels.newyear.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.newyear.NewYear_ApplicationFacade;
   import com.tgame.moudels.newyear.model.NewYear_MsgSenderProxy;
   import com.tgame.shell.view.components.NewYearPanel;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class NewYear_Mediator extends Mediator
   {
      
      public static const NAME:String = "NewYear_Mediator";
      
      public function NewYear_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      private function get wanbaogeMsgSenderProxy() : NewYear_MsgSenderProxy
      {
         return facade.retrieveProxy(NewYear_MsgSenderProxy.NAME) as NewYear_MsgSenderProxy;
      }
      
      protected function get newyearPanel() : NewYearPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.newyearPanel);
         }
         return viewComponent as NewYearPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [NewYear_ApplicationFacade.NEWYEAR_YASUIQIAN_CLICK,NewYear_ApplicationFacade.SHOW_NEWYEARNEIRONG_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case NewYear_ApplicationFacade.NEWYEAR_YASUIQIAN_CLICK:
               this.wanbaogeMsgSenderProxy.send_72607();
               break;
            case NewYear_ApplicationFacade.SHOW_NEWYEARNEIRONG_PANEL:
               this.wanbaogeMsgSenderProxy.send_72611();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(NewYearPanel,function():void
         {
            newyearPanel.addEventListener(Event.ADDED_TO_STAGE,onHandler);
            newyearPanel.addEventListener(NewYearPanel.UI_REQUEST_CHUNLIANSONGHAOLI_PANEL,onHandler);
            newyearPanel.addEventListener(NewYearPanel.QIANDAOPANEL_CHOUJIANG_CLICK,onHandler);
            newyearPanel.addEventListener(NewYearPanel.QIANDAOPANEL_XUNZHANG_CLICK,onHandler);
            newyearPanel.addEventListener(NewYearPanel.QIANDAOPANEL_GETINFO,onHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(NewYearPanel,function():void
         {
            newyearPanel.removeEventListener(Event.ADDED_TO_STAGE,onHandler);
            newyearPanel.removeEventListener(NewYearPanel.UI_REQUEST_CHUNLIANSONGHAOLI_PANEL,onHandler);
            newyearPanel.removeEventListener(NewYearPanel.QIANDAOPANEL_CHOUJIANG_CLICK,onHandler);
            newyearPanel.removeEventListener(NewYearPanel.QIANDAOPANEL_GETINFO,onHandler);
            newyearPanel.removeEventListener(NewYearPanel.QIANDAOPANEL_XUNZHANG_CLICK,onHandler);
         });
      }
      
      public function onHandler(param1:*) : void
      {
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case NewYearPanel.UI_REQUEST_CHUNLIANSONGHAOLI_PANEL:
               this.wanbaogeMsgSenderProxy.send_72601();
               break;
            case NewYearPanel.QIANDAOPANEL_CHOUJIANG_CLICK:
               this.wanbaogeMsgSenderProxy.send_72615();
            case NewYearPanel.QIANDAOPANEL_GETINFO:
               this.wanbaogeMsgSenderProxy.send_72611();
               break;
            case NewYearPanel.QIANDAOPANEL_XUNZHANG_CLICK:
               this.wanbaogeMsgSenderProxy.send_72617([(param1.data as Object).id]);
         }
      }
      
      public function openQianDaoPanel(param1:Array, param2:Boolean) : void
      {
         if(!Fun.isVisible(this.newyearPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_NEWYEAR_PANEL);
         }
         if(Fun.isVisible(this.newyearPanel))
         {
            this.newyearPanel.showQianDaoPanel(param1,param2);
         }
      }
      
      public function upDateHuojiang(param1:Array) : void
      {
         if(Fun.isVisible(this.newyearPanel))
         {
            this.newyearPanel.upDateHuojiang(param1);
         }
      }
      
      public function chouJiangJieGuo(param1:Boolean) : void
      {
         if(Fun.isVisible(this.newyearPanel))
         {
            this.newyearPanel.chouJiangJieGuo(param1);
         }
      }
      
      public function updataXunZhang(param1:Array) : void
      {
         if(Fun.isVisible(this.newyearPanel))
         {
            this.newyearPanel.updataXunZhang(param1);
         }
      }
   }
}

