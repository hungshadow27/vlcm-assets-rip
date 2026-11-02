package com.tgame.moudels.zhenwuqijiezhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zhenwuqijiezhen.model.ZhenwuQijiezhen_MsgSenderProxy;
   import com.tgame.moudels.zhenwuqijiezhen.model.info.ZhenWuQiJieZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZhenwuQijiezhen_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "ZhenwuQijiezhen_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:ZhenwuQijiezhen_MsgSenderProxy;
      
      public function ZhenwuQijiezhen_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : ZhenwuQijiezhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ZhenwuQijiezhen_MsgSenderProxy.NAME) as ZhenwuQijiezhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.ZHENWUQIJIEZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.ZHENWUQIJIEZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_60951([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:ZhenWuQiJieZhenVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showZhenWuQiJieZhen();
         this.targetArrtibutePlane.setZhenWuQiJieZhenInitialize(param2);
         this.targetArrtibutePlane.setZhenWuQiJieZhenEnableFun();
         this.targetArrtibutePlane.set_ZhenWuQiJieZhen(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

