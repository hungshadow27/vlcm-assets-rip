package com.tgame.moudels.jinchantuoqiao.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.jinchantuoqiao.model.JinChanTuoQiao_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class JinChanTuoQiao_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "JinChanTuoQiao_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:JinChanTuoQiao_MsgSenderProxy;
      
      public function JinChanTuoQiao_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : JinChanTuoQiao_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(JinChanTuoQiao_MsgSenderProxy.NAME) as JinChanTuoQiao_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.JINCHANTUOQIAO,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.JINCHANTUOQIAO,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_60481([GameInstance.lookPlayerID,-1]);
      }
      
      public function setPanel(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:Boolean) : void
      {
         this.targetArrtibutePlane.showJinChanTuoQiao();
         this.targetArrtibutePlane.setJinChanTuoQiaoInit(false,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.targetArrtibutePlane.setJinChanTuoQiaoEnableFun();
      }
   }
}

