package com.tgame.moudels.ganjiangmoye.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ganjiangmoye.model.GanJiangMoYe_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class GanJiangMoYe_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "GanJiangMoYe_TargetMediator";
      
      private var _senderProxy:GanJiangMoYe_MsgSenderProxy;
      
      public function GanJiangMoYe_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : GanJiangMoYe_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(GanJiangMoYe_MsgSenderProxy.NAME) as GanJiangMoYe_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.GANJIANGMOYE,requestTargetGanJiangMoYeInfoHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.GANJIANGMOYE,requestTargetGanJiangMoYeInfoHandler);
         });
      }
      
      private function requestTargetGanJiangMoYeInfoHandler(param1:Event) : void
      {
         this.senderProxy.send_61013(GameInstance.lookPlayerID);
      }
      
      public function gouxuan(param1:Boolean, param2:Boolean) : void
      {
         this.targetArrtibutePlane.GjMygouxuan(param1,param2);
      }
      
      public function setPanel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int, param15:Boolean, param16:Boolean, param17:Boolean, param18:Boolean, param19:Boolean) : void
      {
         this.targetArrtibutePlane.showGanJiangMoYe();
         this.targetArrtibutePlane.setGanJiangMoYeEnableFun();
         this.targetArrtibutePlane.setShuxingJiacheng(param1,param4,param5,param6,param7,param8,param9,param10);
         this.targetArrtibutePlane.setBg(param2,param3);
         this.targetArrtibutePlane.setGanJiangMoYeSkill(param14,param15);
         this.targetArrtibutePlane.setGanJiangMoYeHuanZhuang(param16,param17,param18,param19);
         this.targetArrtibutePlane.set_GanJiangMoYe(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

