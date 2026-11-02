package com.tgame.moudels.qimenzhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.qimenzhen.model.QiMenZhen_MsgSenderProxy;
   import com.tgame.moudels.qimenzhen.model.info.QiMenZhenVo;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QiMenZhen_TargetPanelMediator extends Mediator
   {
      
      private static var _qimenzhenVO:QiMenZhenVo;
      
      public static const NAME:String = "QiMenZhen_TargetPanelMediator";
      
      private var _senderProxy:QiMenZhen_MsgSenderProxy;
      
      public function QiMenZhen_TargetPanelMediator()
      {
         super(NAME);
      }
      
      public static function get qismenzhenVO() : QiMenZhenVo
      {
         if(!_qimenzhenVO)
         {
            _qimenzhenVO = new QiMenZhenVo();
         }
         return _qimenzhenVO;
      }
      
      protected function get targetArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      private function get senderProxy() : QiMenZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(QiMenZhen_MsgSenderProxy.NAME) as QiMenZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.QIMENZHEN,requestTargetInfoHander);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.QIMENZHEN,requestTargetInfoHander);
         });
      }
      
      private function requestTargetInfoHander(param1:BaseEvent) : void
      {
         QiMenZhen_PanelMediator.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_57701({
            "userID":GameInstance.lookPlayerID,
            "skillID":0
         });
      }
      
      public function initializeMainUI(param1:QiMenZhenVo, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:Boolean) : void
      {
         this.targetArrtibutePlane.showQiMenZhen();
         this.targetArrtibutePlane.setQiMenZhenZhaoShiMsg(param1.viewID,param1.learnedID + 1);
         this.targetArrtibutePlane.setQiMenZhenInitializeText(param1.dese,param1.addAttack);
         var _loc8_:Goods = new Goods(param2);
         this.targetArrtibutePlane.setQiMenZhenGoods(_loc8_,_loc8_.res.name,param3,false);
         this.targetArrtibutePlane.setQiMenZhenJinduNum(param4,param5,0,param6,param7);
         this.targetArrtibutePlane.setQiMenZhenEnabledFun();
         this.targetArrtibutePlane.setQiMenZhenFanBei(param1.fanBei,param1.qiMenDunJia);
         this.targetArrtibutePlane.ShenJiangJiZuoQi(param1.isZuoQi,param1.isDanTian,param1.isZuoqi1);
         this.targetArrtibutePlane.set_QiMenZhen(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

