package com.tgame.moudels.duguqiubai.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.duguqiubai.model.DuGuQiuBai_MsgSenderProxy;
   import com.tgame.moudels.duguqiubai.model.info.DuGuQiuBaiVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class DuGuQiuBai_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "DuGuQiuBai_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var curZF:int;
      
      private var _senderProxy:DuGuQiuBai_MsgSenderProxy;
      
      public function DuGuQiuBai_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : DuGuQiuBai_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(DuGuQiuBai_MsgSenderProxy.NAME) as DuGuQiuBai_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.DUGUQIUBAI,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.DUGUQIUBAI,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_73001([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:DuGuQiuBaiVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showDuGuQiuBai();
         this.targetArrtibutePlane.setDuGuQiuBaiInit(param2);
         this.targetArrtibutePlane.setDuGuQiuBaiEnableFun();
         this.setTupoPanel(param2.nowZhufuzhi,param2.maxZhufuzhi);
         this.setGood(param2.goodid,param2.count);
      }
      
      public function setGood(param1:int, param2:int) : void
      {
         var _loc3_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param1,true);
         var _loc4_:Boolean = false;
         if(_loc3_.count >= param2)
         {
            _loc4_ = true;
         }
         this.targetArrtibutePlane.setDuGuQiuBaiGoods(_loc3_,false);
      }
      
      public function setTupoPanel(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         if(this.curZF != 0 && param1 > this.curZF)
         {
            _loc3_ = param1 - this.curZF;
         }
         this.targetArrtibutePlane.setDuGuQiuBaiZhufuzhi(param1,param2,_loc3_);
         this.curZF = param1;
      }
   }
}

