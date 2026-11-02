package com.tgame.moudels.jingleiqiang.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.jingleiqiang.model.JingLeiQiang_MsgSenderProxy;
   import com.tgame.moudels.jingleiqiang.model.info.JingLeiQiangVo;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class JingLeiQiang_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "JingLeiQiang_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:JingLeiQiang_MsgSenderProxy;
      
      public function JingLeiQiang_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : JingLeiQiang_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(JingLeiQiang_MsgSenderProxy.NAME) as JingLeiQiang_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.JINGLEIQIANG,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.JINGLEIQIANG,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_74851([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:JingLeiQiangVo) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showJingLeiQiang();
         this.targetArrtibutePlane.setJingLeiQiangInit(param2);
         this.targetArrtibutePlane.setJingLeiQiangEnableFun();
      }
   }
}

