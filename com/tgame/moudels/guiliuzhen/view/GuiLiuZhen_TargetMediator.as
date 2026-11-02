package com.tgame.moudels.guiliuzhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.guiliuzhen.model.GuiLiuZhen_MsgSenderProxy;
   import com.tgame.moudels.guiliuzhen.model.info.GuiLiuZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class GuiLiuZhen_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "GuiLiuZhen_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:GuiLiuZhen_MsgSenderProxy;
      
      public function GuiLiuZhen_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : GuiLiuZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(GuiLiuZhen_MsgSenderProxy.NAME) as GuiLiuZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.GUILIUZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.GUILIUZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_61601([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:GuiLiuZhenVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showGuiLiuZhen();
         this.targetArrtibutePlane.setGuiLiuZhenInitialize(param2);
         this.targetArrtibutePlane.setGuiLiuZhenEnableFun();
         this.targetArrtibutePlane.set_GuiLiuZhen(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

