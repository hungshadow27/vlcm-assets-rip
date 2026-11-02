package com.tgame.moudels.qishangquan.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.qishangquan.model.QiShangQuan_MsgSenderProxy;
   import com.tgame.moudels.qishangquan.model.info.QiShangQuanVo;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QiShangQuan_TargetPanelMediator extends Mediator
   {
      
      private static var _qishangVO:QiShangQuanVo;
      
      public static const NAME:String = "QiShangQuan_TargetPanelMediator";
      
      private var _senderProxy:QiShangQuan_MsgSenderProxy;
      
      public function QiShangQuan_TargetPanelMediator()
      {
         super(NAME);
      }
      
      public static function get qishangquanVO() : QiShangQuanVo
      {
         if(!_qishangVO)
         {
            _qishangVO = new QiShangQuanVo();
         }
         return _qishangVO;
      }
      
      protected function get targetArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      private function get senderProxy() : QiShangQuan_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(QiShangQuan_MsgSenderProxy.NAME) as QiShangQuan_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TargetAttribute.QISHANGQUAN,requestTargetInfoHander);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.QISHANGQUAN,requestTargetInfoHander);
         });
      }
      
      private function requestTargetInfoHander(param1:BaseEvent) : void
      {
         QiShangQuan_PlaneMediator.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_57261({
            "userID":GameInstance.lookPlayerID,
            "skillID":0
         });
      }
      
      public function initializeMainUI(param1:QiShangQuanVo, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:Boolean) : void
      {
         this.targetArrtibutePlane.showQiShangQuan();
         this.targetArrtibutePlane.setQiShangQuanInitializeText(param1.dese,param1.addAttack);
         var _loc8_:Goods = new Goods(param2);
         this.targetArrtibutePlane.setQiShangQuanGoods(_loc8_,_loc8_.res.name,param3,false);
         this.targetArrtibutePlane.setQiShangQuanJinduNum(param4,param5,0,param6,param7);
         this.targetArrtibutePlane.setQiShangQuanZhaoShiMsg(param1,param1.viewName,param1.viewID,param1.learnedID + 1);
         this.targetArrtibutePlane.setQiShangQuanEnabledFun();
         this.targetArrtibutePlane.setQiShangQuanFanBei(param1.fanBei);
         this.targetArrtibutePlane.setQiShangQuanZuoQi(param1.isZuoQi,param1.isDanTian);
      }
   }
}

