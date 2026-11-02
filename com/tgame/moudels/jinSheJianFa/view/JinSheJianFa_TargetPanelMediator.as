package com.tgame.moudels.jinSheJianFa.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.jinSheJianFa.model.JinSheJianFa_MsgSenderProxy;
   import com.tgame.moudels.jinSheJianFa.model.info.JinSheJianFaVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class JinSheJianFa_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "JinSheJianFa_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var vo:JinSheJianFaVO;
      
      private var _senderProxy:JinSheJianFa_MsgSenderProxy;
      
      public function JinSheJianFa_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : JinSheJianFa_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(JinSheJianFa_MsgSenderProxy.NAME) as JinSheJianFa_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get targetArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TargetAttribute.JINSHEJIANFA,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.JINSHEJIANFA,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_74671([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataJinSheJianFaPanel(param1:JinSheJianFaVO) : void
      {
         this.vo = param1;
         this.targetArrtibutePlane.showJinSheJianFa();
         this.targetArrtibutePlane.initializateJinSheJianFa(this.vo);
         this.targetArrtibutePlane.setJinSheJianFaEnabledFun();
      }
   }
}

