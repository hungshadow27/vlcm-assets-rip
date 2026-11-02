package com.tgame.moudels.beiDouQiXingZhen.veiw
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.beiDouQiXingZhen.model.BeiDouQiXingZhen_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class BeiDouQiXingZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "BeiDouQiXingZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:BeiDouQiXingZhen_MsgSenderProxy;
      
      public function BeiDouQiXingZhen_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : BeiDouQiXingZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(BeiDouQiXingZhen_MsgSenderProxy.NAME) as BeiDouQiXingZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.BEIDOUQIXINGZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.BEIDOUQIXINGZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_60301([GameInstance.lookPlayerID,-1]);
      }
      
      public function setPanel(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:Boolean, param13:Boolean, param14:Boolean) : void
      {
         this.targetArrtibutePlane.showBeiDouQiXing();
         this.targetArrtibutePlane.initBeiDouQiXing(false,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
         this.targetArrtibutePlane.setBeiDouQiXingEnableFun();
         this.targetArrtibutePlane.set_BeiDouQiXingZhen(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

