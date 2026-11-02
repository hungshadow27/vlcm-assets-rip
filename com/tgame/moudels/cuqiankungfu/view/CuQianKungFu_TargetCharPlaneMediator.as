package com.tgame.moudels.cuqiankungfu.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.cuqiankungfu.model.CuQianKungFu_MsgSenderProxy;
   import com.tgame.moudels.cuqiankungfu.model.info.CuQianKungFuVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class CuQianKungFu_TargetCharPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "CuQianKungFu_TargetCharPlaneMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:CuQianKungFu_MsgSenderProxy;
      
      public function CuQianKungFu_TargetCharPlaneMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : CuQianKungFu_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(CuQianKungFu_MsgSenderProxy.NAME) as CuQianKungFu_MsgSenderProxy;
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
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TargetAttribute.CUQIANKUNGFU,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.CUQIANKUNGFU,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_73451([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:CuQianKungFuVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showCuQianKungFu();
         this.targetArrtibutePlane.setCuQianKungFuInit(param2);
         this.targetArrtibutePlane.setCuQianKungFuJinduNum(param2.nowChallenge,param2.maxChallenge,0,param2.isFire);
         this.targetArrtibutePlane.setCuQianKungFuEnabledFun();
      }
   }
}

