package com.tgame.moudels.xiuwei.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xiuwei.model.XiuWei_MsgSenderProxy;
   import com.tgame.moudels.xiuwei.model.info.XiuWeiVo;
   import com.tgame.shell.view.components.TargetAttribute;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XiuWei_TargetPanelMediator extends Mediator
   {
      
      private static var _xiuweiVO:XiuWeiVo;
      
      public static const NAME:String = "XiuWei_TargetPanelMediator";
      
      private var _senderProxy:XiuWei_MsgSenderProxy;
      
      public function XiuWei_TargetPanelMediator()
      {
         super(NAME);
      }
      
      public static function get xiuweiVO() : XiuWeiVo
      {
         if(!_xiuweiVO)
         {
            _xiuweiVO = new XiuWeiVo();
         }
         return _xiuweiVO;
      }
      
      protected function get targetArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      private function get senderProxy() : XiuWei_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XiuWei_MsgSenderProxy.NAME) as XiuWei_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.XIUWEI,requestTargetInfoHander);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.XIUWEI,requestTargetInfoHander);
         });
      }
      
      private function requestTargetInfoHander(param1:Event) : void
      {
         XiuWei_PlaneMediator.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_55701({
            "userID":GameInstance.lookPlayerID,
            "skillID":0
         });
      }
      
      public function initializeMainUI(param1:XiuWeiVo, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.targetArrtibutePlane.showXiuWei();
         this.targetArrtibutePlane.setXiuweiInitializeText(param1.dese,param1.viewDesc,param1.addAttack,param1.addDefend,param1.addLifeMax,param1.addNeiliMax,param1.addTiliMax,param1.isSelect,param1.isHuanZhuang);
         var _loc6_:Goods = new Goods(param2);
         var _loc7_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2);
         var _loc8_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(param2,true);
         this.targetArrtibutePlane.setXiuweiGoods(_loc7_,_loc6_.res.name,param3,false);
         this.targetArrtibutePlane.setXiuweiJinduNum(param4,param5,-1,-1);
         this.targetArrtibutePlane.setXiuweiZhaoShiMsg(param1.viewName,param1.viewID,param1.learnedID);
         this.targetArrtibutePlane.setXiuweiEnabledFun();
         this.targetArrtibutePlane.setXiuweiDingJiShuXing(param1.isJihuo);
         this.targetArrtibutePlane.setXiuWeiJiHuo(GameState.dictTargetStatus[40732]);
         this.targetArrtibutePlane.xiuweiHuanZhuang(param1.isHuanZhuang2);
         this.targetArrtibutePlane.set_XiuWei(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

