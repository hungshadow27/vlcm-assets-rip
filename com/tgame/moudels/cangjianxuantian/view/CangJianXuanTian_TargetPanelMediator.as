package com.tgame.moudels.cangjianxuantian.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.cangjianxuantian.model.CangJianXuanTian_MsgSenderProxy;
   import com.tgame.moudels.cangjianxuantian.model.info.CangJianXuanTianVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class CangJianXuanTian_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "CangJianXuanTian_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var vo:CangJianXuanTianVO;
      
      private var _senderProxy:CangJianXuanTian_MsgSenderProxy;
      
      public function CangJianXuanTian_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : CangJianXuanTian_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(CangJianXuanTian_MsgSenderProxy.NAME) as CangJianXuanTian_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.CANGJIANXUANTIAN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.CANGJIANXUANTIAN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_79621([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataCangJianXuanTianPanel(param1:CangJianXuanTianVO) : void
      {
         this.vo = param1;
         this.targetArrtibutePlane.showCangJianXuanTian();
         this.targetArrtibutePlane.initializateCangJianXuanTian(this.vo);
         this.targetArrtibutePlane.setCangJianXuanTianEnabledFun();
      }
   }
}

