package com.tgame.moudels.xiangyangzhizhan.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xiangyangzhizhan.model.XiangYangZhiZhan_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XiangYangZhiZhan_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "XiangYangZhiZhan_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:XiangYangZhiZhan_MsgSenderProxy;
      
      public function XiangYangZhiZhan_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : XiangYangZhiZhan_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XiangYangZhiZhan_MsgSenderProxy.NAME) as XiangYangZhiZhan_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.XIANGYANGZHIZHAN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.XIANGYANGZHIZHAN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_79171([GameInstance.lookPlayerID,0]);
      }
      
      public function setInit(param1:Object, param2:int, param3:int, param4:String, param5:String, param6:String) : void
      {
         GameInstance.uiInstance.targetAttribute.showXiangYangZhiZhan();
         this.targetArrtibutePlane.setXiangYangZhiZhanInit(this.lookPlayerID,param1,param2,param3,param4,param5,param6);
         this.targetArrtibutePlane.setXiangYangZhiZhanEnableFun();
         this.targetArrtibutePlane.set_XiangYangZhiZhan(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

