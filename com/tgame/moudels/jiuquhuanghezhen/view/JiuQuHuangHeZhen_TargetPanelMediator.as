package com.tgame.moudels.jiuquhuanghezhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.jiuquhuanghezhen.model.JiuQuHuangHeZhen_MsgSenderProxy;
   import com.tgame.moudels.jiuquhuanghezhen.model.info.JiuQuHuangHeZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class JiuQuHuangHeZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "JiuQuHuangHeZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:JiuQuHuangHeZhen_MsgSenderProxy;
      
      public function JiuQuHuangHeZhen_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : JiuQuHuangHeZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(JiuQuHuangHeZhen_MsgSenderProxy.NAME) as JiuQuHuangHeZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.JIUQUHUANGHEZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.JIUQUHUANGHEZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_60851([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:JiuQuHuangHeZhenVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showJiuQuHuangHeZhen();
         this.targetArrtibutePlane.setJiuQuHuangHeZhenInitialize(param2);
         this.targetArrtibutePlane.setJiuQuHuangHeZhenEnableFun();
         this.targetArrtibutePlane.setJiuquJiHuo(GameState.dictTargetStatus[40727]);
         this.targetArrtibutePlane.set_JiuQuHuangHeZhen(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

