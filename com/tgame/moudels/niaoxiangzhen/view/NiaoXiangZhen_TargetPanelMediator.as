package com.tgame.moudels.niaoxiangzhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.niaoxiangzhen.model.NiaoXiangZhen_MsgSenderProxy;
   import com.tgame.moudels.niaoxiangzhen.model.info.NiaoXiangZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.tgame.shell.view.components.attribute.niaoxiangzhen.NiaoXiangZhenConst;
   import com.tgame.shell.view.components.attribute.niaoxiangzhen.NiaoXiangZhenTargetController;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class NiaoXiangZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "NiaoXiangZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:NiaoXiangZhen_MsgSenderProxy;
      
      public function NiaoXiangZhen_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : NiaoXiangZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(NiaoXiangZhen_MsgSenderProxy.NAME) as NiaoXiangZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(NiaoXiangZhenConst.TARGET_NIAOXIANGZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(NiaoXiangZhenConst.TARGET_NIAOXIANGZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_71551([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:NiaoXiangZhenVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         NiaoXiangZhenTargetController.instance.showTianFuZhen();
         NiaoXiangZhenTargetController.instance.setTianFuZhenInitialize(param2);
         NiaoXiangZhenTargetController.instance.setTianFuZhenEnableFun();
         NiaoXiangZhenTargetController.instance.setTianFuZhenPingBi(param2.isShow);
      }
   }
}

