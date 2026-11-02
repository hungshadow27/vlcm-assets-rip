package com.tgame.moudels.jianghun.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.jianghun.JiangHun_ApplicationFacade;
   import com.tgame.moudels.jianghun.model.JiangHun_MsgSenderProxy;
   import com.tgame.shell.view.components.jianghun.JiangHunPanel_CN;
   import com.tgame.shell.view.components.jiujiexingtu.JiuJieXingTuPanel;
   import com.tgame.shell.view.components.jiujiexingtu.JiuJieXingTu_BoxView;
   import com.tgame.shell.view.components.utils.UITools;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class JiangHun_Mediator extends Mediator
   {
      
      public static const NAME:String = "JiangHun_Mediator";
      
      private var _senderProxy:JiangHun_MsgSenderProxy;
      
      public function JiangHun_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : JiangHun_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(JiangHun_MsgSenderProxy.NAME) as JiangHun_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get panel() : JiangHunPanel_CN
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.jiangHunCNPanel);
         }
         return viewComponent as JiangHunPanel_CN;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [JiangHun_ApplicationFacade.GET_JIANGHUN_PANEL,JiangHun_ApplicationFacade.GET_JIANGHUN_CN_PANEL,JiangHun_ApplicationFacade.GET_CHUNJINGZHUANSHUJIFEN_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case JiangHun_ApplicationFacade.GET_JIANGHUN_PANEL:
               this.senderProxy.send_81641(1);
               break;
            case JiangHun_ApplicationFacade.GET_JIANGHUN_CN_PANEL:
               this.senderProxy.send_81781(1);
               break;
            case JiangHun_ApplicationFacade.GET_CHUNJINGZHUANSHUJIFEN_PANEL:
               this.senderProxy.send_81811();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(JiangHunPanel_CN,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,handlerCN);
            panel.addEventListener(JiangHunPanel_CN.JIANGHUN_CLICK,handlerCN);
            panel.addEventListener(JiangHunPanel_CN.JIANGHUN_JIHUO_CLICK,handlerCN);
            panel.addEventListener(JiangHunPanel_CN.JIANGHUN_CHUANZHAN_CLICK,handlerCN);
            panel.addEventListener(JiangHunPanel_CN.JIANGHUN_XIAOHAO_CLICK,handlerCN);
            panel.addEventListener(JiangHunPanel_CN.JIANGHUN_ZHURU_CLICK,handlerCN);
            panel.addEventListener(JiangHunPanel_CN.UI_JIANGHUN_MENU_SHOW,handlerCN);
         });
         UIEventsRegisterManager.addUIRemovedEvent(JiangHunPanel_CN,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,handlerCN);
            panel.removeEventListener(JiangHunPanel_CN.JIANGHUN_CLICK,handlerCN);
            panel.removeEventListener(JiangHunPanel_CN.JIANGHUN_JIHUO_CLICK,handlerCN);
            panel.removeEventListener(JiangHunPanel_CN.JIANGHUN_CHUANZHAN_CLICK,handlerCN);
            panel.removeEventListener(JiangHunPanel_CN.JIANGHUN_XIAOHAO_CLICK,handlerCN);
            panel.removeEventListener(JiangHunPanel_CN.JIANGHUN_ZHURU_CLICK,handlerCN);
            panel.removeEventListener(JiangHunPanel_CN.UI_JIANGHUN_MENU_SHOW,handlerCN);
         });
         UIEventsRegisterManager.addUIRegisterEvent(JiuJieXingTuPanel,function():void
         {
            GameInstance.uiInstance.jiuJieXingTuPanel.addEventListener(JiuJieXingTuPanel.JIUJIEXINGTUPANEL_FANYE_CLICK,handlerCN);
            GameInstance.uiInstance.jiuJieXingTuPanel.addEventListener(JiuJieXingTuPanel.JIUJIEXINGTUPANEL_PEIYANG_CLICK,handlerCN);
            GameInstance.uiInstance.jiuJieXingTuPanel.addEventListener(JiuJieXingTuPanel.JIUJIEXINGTUPANEL_TASK_CLICK,handlerCN);
            GameInstance.uiInstance.jiuJieXingTuPanel.addEventListener(JiuJieXingTuPanel.JIUJIEXINGTUPANEL_LINGQU_CLICK,handlerCN);
         });
         UIEventsRegisterManager.addUIRemovedEvent(JiuJieXingTuPanel,function():void
         {
            GameInstance.uiInstance.jiuJieXingTuPanel.removeEventListener(JiuJieXingTuPanel.JIUJIEXINGTUPANEL_FANYE_CLICK,handlerCN);
            GameInstance.uiInstance.jiuJieXingTuPanel.removeEventListener(JiuJieXingTuPanel.JIUJIEXINGTUPANEL_PEIYANG_CLICK,handlerCN);
            GameInstance.uiInstance.jiuJieXingTuPanel.removeEventListener(JiuJieXingTuPanel.JIUJIEXINGTUPANEL_TASK_CLICK,handlerCN);
            GameInstance.uiInstance.jiuJieXingTuPanel.removeEventListener(JiuJieXingTuPanel.JIUJIEXINGTUPANEL_LINGQU_CLICK,handlerCN);
         });
         UIEventsRegisterManager.addUIRegisterEvent(JiuJieXingTu_BoxView,function():void
         {
            GameInstance.uiInstance.jiuJieXingTuBoxPanel.addEventListener(JiuJieXingTuPanel.JIUJIEXINGTUPANEL_BOX_CLICK,handlerCN);
         });
         UIEventsRegisterManager.addUIRemovedEvent(JiuJieXingTu_BoxView,function():void
         {
            GameInstance.uiInstance.jiuJieXingTuBoxPanel.removeEventListener(JiuJieXingTuPanel.JIUJIEXINGTUPANEL_BOX_CLICK,handlerCN);
         });
      }
      
      private function handlerCN(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.panel.setSucessed(0);
               break;
            case JiangHunPanel_CN.JIANGHUN_CLICK:
               this.senderProxy.send_81781(_loc2_.data as int);
               break;
            case JiangHunPanel_CN.JIANGHUN_JIHUO_CLICK:
               this.senderProxy.send_81789(_loc2_.data as int);
               break;
            case JiangHunPanel_CN.JIANGHUN_CHUANZHAN_CLICK:
               this.senderProxy.send_81785(_loc2_.data as Object);
               break;
            case JiangHunPanel_CN.JIANGHUN_XIAOHAO_CLICK:
               this.senderProxy.send_81787(_loc2_.data as Object);
               break;
            case JiangHunPanel_CN.JIANGHUN_ZHURU_CLICK:
               this.senderProxy.send_81783(_loc2_.data as Object);
               break;
            case JiangHunPanel_CN.UI_JIANGHUN_MENU_SHOW:
               PipeManager.sendMsg(PipeConstants.UI_CHAR_ATTRIBUTE_MENU_SHOW,_loc2_ as BaseEvent);
               break;
            case JiuJieXingTuPanel.JIUJIEXINGTUPANEL_FANYE_CLICK:
               this.senderProxy.send_82551(_loc2_.data as int);
               break;
            case JiuJieXingTuPanel.JIUJIEXINGTUPANEL_PEIYANG_CLICK:
               this.senderProxy.send_82555(_loc2_.data as int);
               break;
            case JiuJieXingTuPanel.JIUJIEXINGTUPANEL_TASK_CLICK:
               this.senderProxy.send_82553();
               break;
            case JiuJieXingTuPanel.JIUJIEXINGTUPANEL_LINGQU_CLICK:
               this.senderProxy.send_82557();
               break;
            case JiuJieXingTuPanel.JIUJIEXINGTUPANEL_BOX_CLICK:
               this.senderProxy.send_82561(_loc2_.data as int);
         }
      }
      
      public function setJiangHunData(param1:Object) : void
      {
         this.panel.setJiangHunData(param1);
         UITools.showPanel(this.panel);
      }
      
      public function setSucessed(param1:int) : void
      {
         this.panel.setSucessed(param1);
      }
      
      public function setJiangHunCNData(param1:Object) : void
      {
         this.panel.setJiangHunData(param1);
         UITools.showPanel(this.panel);
      }
      
      public function setSucessedCN(param1:int) : void
      {
         this.panel.setSucessed(param1);
      }
      
      public function setJiuJieXingTuData(param1:Object) : void
      {
         UITools.showPanel(GameInstance.uiInstance.jiuJieXingTuPanel);
         GameInstance.uiInstance.jiuJieXingTuPanel.setJiuJieXingTuData(param1);
      }
      
      public function setJiuJieXingTuTaskData(param1:Object) : void
      {
         GameInstance.uiInstance.jiuJieXingTuPanel.setJiuJieXingTuTaskData(param1);
      }
   }
}

