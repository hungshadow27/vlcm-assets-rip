package com.tgame.moudels.wuduzhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wuduzhen.model.WuDuZhen_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WuDuZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "WuDuZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:WuDuZhen_MsgSenderProxy;
      
      public function WuDuZhen_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : WuDuZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(WuDuZhen_MsgSenderProxy.NAME) as WuDuZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.WUDUZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.WUDUZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_72021([GameInstance.lookPlayerID,-1,-1]);
      }
      
      public function setPanel(param1:int, param2:Array, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:int, param9:Boolean, param10:int, param11:Boolean, param12:Boolean, param13:Boolean) : void
      {
         this.targetArrtibutePlane.showWuDuZhen();
         this.targetArrtibutePlane.setWuDuZhenInit(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
         this.targetArrtibutePlane.setWuDuZhenEnableFun();
      }
   }
}

