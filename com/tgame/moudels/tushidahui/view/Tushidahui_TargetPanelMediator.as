package com.tgame.moudels.tushidahui.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.tushidahui.model.Tushidahui_MsgSenderProxy;
   import com.tgame.moudels.tushidahui.view.info.TushidahuiVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.tgame.shell.view.components.attribute.tushidahui.TushidahuiConst;
   import com.tgame.shell.view.components.attribute.tushidahui.TushidahuiTargetController;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Tushidahui_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Tushidahui_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:Tushidahui_MsgSenderProxy;
      
      public function Tushidahui_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : Tushidahui_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Tushidahui_MsgSenderProxy.NAME) as Tushidahui_MsgSenderProxy;
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
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TushidahuiConst.TARGET_TUSHIDAHUI,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TushidahuiConst.TARGET_TUSHIDAHUI,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_71651([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:TushidahuiVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         TushidahuiTargetController.instance.show();
         TushidahuiTargetController.instance.setInitData(param2);
         TushidahuiTargetController.instance.setEnableFun();
      }
   }
}

