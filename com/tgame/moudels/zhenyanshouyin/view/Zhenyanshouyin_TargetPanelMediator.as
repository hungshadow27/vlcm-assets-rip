package com.tgame.moudels.zhenyanshouyin.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zhenyanshouyin.model.Zhenyanshouyin_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Zhenyanshouyin_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Zhenyanshouyin_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var isAuto:Boolean = false;
      
      private var autoKnowTimer:Timer;
      
      private var nowExp1:int = 0;
      
      private var maxExp1:int = 0;
      
      private var preExp:int = 0;
      
      private var _senderProxy:Zhenyanshouyin_MsgSenderProxy;
      
      public function Zhenyanshouyin_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get targetArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      private function get senderProxy() : Zhenyanshouyin_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Zhenyanshouyin_MsgSenderProxy.NAME) as Zhenyanshouyin_MsgSenderProxy;
         }
         return this._senderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.ZHENYANSHOUYIN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.ZHENYANSHOUYIN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_73301([GameInstance.lookPlayerID,0]);
      }
      
      public function setData(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Array) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.nowExp1 = param5;
         this.maxExp1 = param6;
         this.targetArrtibutePlane.showZhenYanShouYin();
         this.targetArrtibutePlane.setZhenYanShouYinInit(param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12);
      }
   }
}

