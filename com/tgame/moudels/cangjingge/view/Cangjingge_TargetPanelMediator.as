package com.tgame.moudels.cangjingge.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.cangjingge.model.Cangjingge_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Cangjingge_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Cangjingge_TargetPanelMediator";
      
      private var _senderProxy:Cangjingge_MsgSenderProxy;
      
      public function Cangjingge_TargetPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : Cangjingge_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Cangjingge_MsgSenderProxy.NAME) as Cangjingge_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.JINGJIE,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.JINGJIE,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.senderProxy.send_52047(GameInstance.lookPlayerID);
      }
      
      public function initializeMainUI(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean, param6:Array, param7:Boolean, param8:Boolean) : void
      {
         this.targetArrtibutePlane.showJingJie();
         this.targetArrtibutePlane.set_TSJJ(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
         this.targetArrtibutePlane.initilizeJingJieUI(param1,param2 + 1,param3);
         this.targetArrtibutePlane.setJingjieShuxing(param4,param6[0],param6[1],param6[2],param6[3],param6[4],param6[5],param6[6],param6[7]);
         this.targetArrtibutePlane.setJingJieEnabledFunJ();
         this.targetArrtibutePlane.set_LYGG(param4);
         this.targetArrtibutePlane.setWeilieShuxing(param5);
         this.targetArrtibutePlane.setChuandai(param7,param8);
      }
   }
}

