package com.tgame.moudels.wuxingzhiren.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wuxingzhiren.model.WuXingZhiRen_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import flash.events.Event;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WuXingZhiRen_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "WuXingZhiRen_TargetMediator";
      
      private var timer:Timer;
      
      private var timerNum:Number;
      
      private var _senderProxy:WuXingZhiRen_MsgSenderProxy;
      
      public function WuXingZhiRen_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : WuXingZhiRen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(WuXingZhiRen_MsgSenderProxy.NAME) as WuXingZhiRen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.WUXINGZHIREN,requestTargetWuXingZhiRenInfoHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.WUXINGZHIREN,requestTargetWuXingZhiRenInfoHandler);
         });
      }
      
      private function requestTargetWuXingZhiRenInfoHandler(param1:Event) : void
      {
         this.senderProxy.send_55521(GameInstance.lookPlayerID);
      }
      
      public function isHuanZhuang(param1:Boolean) : void
      {
         this.targetArrtibutePlane.wuxingzhirenHZ(param1);
      }
      
      public function updateWuXingZhiRenPanel(param1:Array, param2:String, param3:int, param4:int, param5:Boolean, param6:int, param7:Boolean) : void
      {
         this.targetArrtibutePlane.showWuXingZhiRen();
         this.targetArrtibutePlane.setWuXingZhiRenEnabledFun();
         this.targetArrtibutePlane.setYunInitializeWuXingZhiRen(param1,param2,param4,param6,param7);
         this.targetArrtibutePlane.WuXingZhiRenShow(param5);
         this.targetArrtibutePlane.set_WuXingZhiRen(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

