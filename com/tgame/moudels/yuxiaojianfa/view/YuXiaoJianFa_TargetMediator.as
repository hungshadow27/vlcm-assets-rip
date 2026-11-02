package com.tgame.moudels.yuxiaojianfa.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.yuxiaojianfa.model.YuXiaoJianFa_MsgSenderProxy;
   import com.tgame.moudels.yuxiaojianfa.model.info.YuXiaoJianFaVo;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YuXiaoJianFa_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "YuXiaoJianFa_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:YuXiaoJianFa_MsgSenderProxy;
      
      public function YuXiaoJianFa_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : YuXiaoJianFa_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YuXiaoJianFa_MsgSenderProxy.NAME) as YuXiaoJianFa_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.YUXIAOJIANFA,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.YUXIAOJIANFA,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_70301([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:YuXiaoJianFaVo) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showYuXiaoJianFa();
         this.targetArrtibutePlane.setYuXiaoJianFaInit(param2);
         this.targetArrtibutePlane.setYuXiaoJianFaEnableFun();
      }
   }
}

