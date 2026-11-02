package com.tgame.moudels.xuedaoxinfa.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xuedaoxinfa.model.XueDaoXinFa_MsgSenderProxy;
   import com.tgame.moudels.xuedaoxinfa.model.info.XueDaoXinFaVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XueDaoXinFa_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "XueDaoXinFa_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:XueDaoXinFa_MsgSenderProxy;
      
      public function XueDaoXinFa_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : XueDaoXinFa_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XueDaoXinFa_MsgSenderProxy.NAME) as XueDaoXinFa_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.XUEDAOXINFA,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.XUEDAOXINFA,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_71351([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:XueDaoXinFaVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showXueDaoXinFa();
         this.targetArrtibutePlane.setXueDaoXinFaInit(param2);
         this.targetArrtibutePlane.setXueDaoXinFaEnableFun();
         this.targetArrtibutePlane.set_XueDaoXinFa(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

