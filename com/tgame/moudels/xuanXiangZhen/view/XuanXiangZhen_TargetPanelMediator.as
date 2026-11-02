package com.tgame.moudels.xuanXiangZhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xuanXiangZhen.model.XuanXiangZhen_MsgSenderProxy;
   import com.tgame.moudels.xuanXiangZhen.model.info.XuanXiangZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XuanXiangZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "XuanXiangZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:XuanXiangZhen_MsgSenderProxy;
      
      public function XuanXiangZhen_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : XuanXiangZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XuanXiangZhen_MsgSenderProxy.NAME) as XuanXiangZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.XUANXIANGZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.XUANXIANGZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_70751([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:XuanXiangZhenVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showXuanXiangZhen();
         this.targetArrtibutePlane.setXuanXiangZhenInitialize(param2);
         this.targetArrtibutePlane.setXuanXiangZhenEnableFun();
         this.targetArrtibutePlane.setXuanXiangZhenPingBi(param2.isShow);
         this.targetArrtibutePlane.set_XuanXiangZhen(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

