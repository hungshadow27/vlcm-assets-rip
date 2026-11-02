package com.tgame.moudels.liumaishenjian.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.liumaishenjian.info.LiumaishenjianVO;
   import com.tgame.moudels.liumaishenjian.model.Liumaishenjian_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Liumaishenjian_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "Liumaishenjian_TargetMediator";
      
      private var lookPlayerID:int;
      
      public var jianId:int;
      
      public var chongId:int;
      
      public var lingwuId:int;
      
      public var shuxingAry:Array = [];
      
      private var current_loockID:int;
      
      private var _senderProxy:Liumaishenjian_MsgSenderProxy;
      
      public function Liumaishenjian_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : Liumaishenjian_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Liumaishenjian_MsgSenderProxy.NAME) as Liumaishenjian_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.LIUMAISHENJIAN,tragetAttributeHandler);
            targetArrtibutePlane.addEventListener(TargetAttribute.UI_SHENJIAN_EVENT_CLICK,tragetHander);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.LIUMAISHENJIAN,tragetAttributeHandler);
            targetArrtibutePlane.removeEventListener(TargetAttribute.UI_SHENJIAN_EVENT_CLICK,tragetHander);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_54409([GameInstance.lookPlayerID,0]);
      }
      
      private function tragetHander(param1:BaseEvent) : void
      {
         this.current_loockID = int(param1.data);
         this.senderProxy.send_54409([GameInstance.lookPlayerID,this.current_loockID]);
      }
      
      public function initializeMainUI(param1:int, param2:LiumaishenjianVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showLiuMaiShenJian();
         this.targetArrtibutePlane.setLiumaishenjianJianshuBtn(param2.shenjianAry);
         this.targetArrtibutePlane.setLiumaishenjianSkill(param2.skillList);
         this.targetArrtibutePlane.lmsjJiHuoStatus(GameState.dictTargetStatus[40632]);
         this.targetArrtibutePlane.setLiumaishenjianMiaoshu(param2.miaoshuFta);
         this.targetArrtibutePlane.setLiumaishenjianShuxingNum(param2.shuxingNumAry,param2.shuxingNumTotalAry);
         this.targetArrtibutePlane.setLiumaishenjianDengji(param2.nowLookingShenjianID,param2.nowLookingChongshuNum,param2.lingWuNum + 1,param2.isLingwu);
         this.targetArrtibutePlane.loadLiumaishenjianPicture(param2.nowLookingShenjianID);
         this.targetArrtibutePlane.setLiumaishenjianEnabledFun();
      }
   }
}

