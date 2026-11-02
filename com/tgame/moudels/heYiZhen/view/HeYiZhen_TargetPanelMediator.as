package com.tgame.moudels.heYiZhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.heYiZhen.model.HeYiZhen_MsgSenderProxy;
   import com.tgame.moudels.heYiZhen.model.info.HeYiZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class HeYiZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "HeYiZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:HeYiZhen_MsgSenderProxy;
      
      public function HeYiZhen_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : HeYiZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(HeYiZhen_MsgSenderProxy.NAME) as HeYiZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.HEYIZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.HEYIZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_70201([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:HeYiZhenVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showHeYiZhen();
         this.targetArrtibutePlane.setHeYiZhenInitialize(param2);
         this.targetArrtibutePlane.setHeYiZhenEnableFun();
         this.targetArrtibutePlane.setHeYiZhenPingBi(param2.isShow);
         this.targetArrtibutePlane.setHeYiJiHuo(GameState.dictTargetStatus[40740]);
         this.targetArrtibutePlane.set_HeYiZhen(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

