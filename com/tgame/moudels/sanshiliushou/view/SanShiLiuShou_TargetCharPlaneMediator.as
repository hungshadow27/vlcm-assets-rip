package com.tgame.moudels.sanshiliushou.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.sanshiliushou.model.SanShiLiuShou_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class SanShiLiuShou_TargetCharPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "SanShiLiuShou_TargetCharPlaneMediator";
      
      private var lookPlayerID:int;
      
      private var _msgSenderProxy:SanShiLiuShou_MsgSenderProxy;
      
      public function SanShiLiuShou_TargetCharPlaneMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : SanShiLiuShou_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(SanShiLiuShou_MsgSenderProxy.NAME) as SanShiLiuShou_MsgSenderProxy;
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
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TargetAttribute.SANSHILIUSHOU,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.SANSHILIUSHOU,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.msgSenderProxy.send_60151([GameInstance.lookPlayerID,0]);
      }
      
      public function setSanShiLiuShou(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:int, param13:Boolean) : void
      {
         this.targetArrtibutePlane.showSanShiLiuShou();
         this.targetArrtibutePlane.setSanShiLiuShouInit(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
         this.targetArrtibutePlane.setSanShiLiuShouEnableFun();
      }
   }
}

