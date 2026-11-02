package com.tgame.moudels.langhundun.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.langhundun.model.LangHunDun_MsgSenderProxy;
   import com.tgame.moudels.langhundun.model.info.LangHunDunVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class LangHunDun_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "LangHunDun_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var curZF:int;
      
      private var _senderProxy:LangHunDun_MsgSenderProxy;
      
      public function LangHunDun_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : LangHunDun_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(LangHunDun_MsgSenderProxy.NAME) as LangHunDun_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.LANGHUNDUN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.LANGHUNDUN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_72491([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:LangHunDunVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showLangHunDun();
         this.targetArrtibutePlane.setLangHunDunInit(param2);
         this.targetArrtibutePlane.setLangHunDunEnableFun();
         this.setTupoPanel(param2.nowZhufuzhi,param2.maxZhufuzhi);
      }
      
      public function setTupoPanel(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         if(this.curZF != 0 && param1 > this.curZF)
         {
            _loc3_ = param1 - this.curZF;
         }
         this.targetArrtibutePlane.setLangHunDunZhufuzhi(param1,param2,_loc3_);
         this.curZF = param1;
      }
   }
}

