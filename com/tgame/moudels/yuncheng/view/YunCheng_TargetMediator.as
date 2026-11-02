package com.tgame.moudels.yuncheng.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.yuncheng.model.YunCheng_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YunCheng_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "YunCheng_TargetMediator";
      
      public var no:int = 0;
      
      private var arrZodiac:Array = new Array();
      
      private var _msgSenderProxy:YunCheng_MsgSenderProxy;
      
      public function YunCheng_TargetMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : YunCheng_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(YunCheng_MsgSenderProxy.NAME) as YunCheng_MsgSenderProxy;
         }
         return this._msgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.GETYUNCHENG,requestTargetYunChengInfoHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.GETYUNCHENG,requestTargetYunChengInfoHandler);
         });
      }
      
      private function requestTargetYunChengInfoHandler(param1:Event) : void
      {
         this.msgSenderProxy.send_54201(GameInstance.lookPlayerID);
      }
      
      public function updateYunChengPanel(param1:Array, param2:Boolean, param3:Array, param4:int = -1, param5:int = -1, param6:Number = 0) : void
      {
         this.arrZodiac = param1;
         this.targetArrtibutePlane.setYunInitializeYuncheng(this.arrZodiac,param5,param6);
         if(param4 >= 1 && param4 <= 12)
         {
            this.targetArrtibutePlane.setTime(param4);
         }
         this.targetArrtibutePlane.showYunCheng();
         this.targetArrtibutePlane.setYunchengEnabledFun();
         this.targetArrtibutePlane.setYunchengJihuo(param2,param3);
         this.targetArrtibutePlane.set_YunCheng(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
      
      public function setYunChengZuoQi(param1:Boolean, param2:Boolean) : void
      {
         this.targetArrtibutePlane.setYunChengZuoQi(param1,param2);
      }
   }
}

