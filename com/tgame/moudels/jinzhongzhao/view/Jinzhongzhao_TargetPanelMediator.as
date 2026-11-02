package com.tgame.moudels.jinzhongzhao.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.attribute.view.Attribute_TargetCharAttributePlaneMediator;
   import com.tgame.moudels.jinzhongzhao.model.Jinzhongzhao_MsgSenderProxy;
   import com.tgame.moudels.jinzhongzhao.model.info.JinzhongzhaoVo;
   import com.tgame.shell.view.components.TargetAttribute;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Jinzhongzhao_TargetPanelMediator extends Mediator
   {
      
      private static var _tongrenVO:JinzhongzhaoVo;
      
      public static const NAME:String = "Jinzhongzhao_TargetPanelMediator";
      
      private var _senderProxy:Jinzhongzhao_MsgSenderProxy;
      
      private var _attribute_TargetCharAttributePlaneMediator:Attribute_TargetCharAttributePlaneMediator;
      
      public function Jinzhongzhao_TargetPanelMediator()
      {
         super(NAME);
      }
      
      public static function get tongrenVO() : JinzhongzhaoVo
      {
         if(!_tongrenVO)
         {
            _tongrenVO = new JinzhongzhaoVo();
         }
         return _tongrenVO;
      }
      
      protected function get targetArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      private function get senderProxy() : Jinzhongzhao_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Jinzhongzhao_MsgSenderProxy.NAME) as Jinzhongzhao_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      private function get attribute_TargetCharAttributePlaneMediator() : Attribute_TargetCharAttributePlaneMediator
      {
         if(this._attribute_TargetCharAttributePlaneMediator == null)
         {
            this._attribute_TargetCharAttributePlaneMediator = facade.retrieveMediator(Attribute_TargetCharAttributePlaneMediator.NAME) as Attribute_TargetCharAttributePlaneMediator;
         }
         return this._attribute_TargetCharAttributePlaneMediator;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TargetAttribute.JINZHONGZHAO,requestTargetInfoHander);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.JINZHONGZHAO,requestTargetInfoHander);
         });
      }
      
      private function requestTargetInfoHander(param1:Event) : void
      {
         Jinzhongzhao_PanelMediator.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_55601({
            "userID":GameInstance.lookPlayerID,
            "skillID":0
         });
      }
      
      public function initializeMainUI() : void
      {
         this.targetArrtibutePlane.set_CJTBS(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
         var _loc1_:Boolean = tongrenVO.minShengming == tongrenVO.maxShengming;
         this.targetArrtibutePlane.showJinZhongZhao();
         this.targetArrtibutePlane.setLockonJZZ(false);
         this.targetArrtibutePlane.initilizeUIJZZ(tongrenVO.dese,tongrenVO.viewSkillName,tongrenVO.learnedSkillID,tongrenVO.viewSkillID,tongrenVO.sk,tongrenVO.skMiaoshu,_loc1_,tongrenVO.fumoBo);
         this.targetArrtibutePlane.setMiaoshuJZZ(tongrenVO.getMiaoshu(tongrenVO.shiyongArray));
         this.targetArrtibutePlane.setHP(true,tongrenVO.minShengming,tongrenVO.maxShengming);
         this.targetArrtibutePlane.setMP(true,tongrenVO.minNeili,tongrenVO.maxNeili);
         this.targetArrtibutePlane.setDP(true,tongrenVO.minFangyu,tongrenVO.maxFangyu);
         this.targetArrtibutePlane.setPP(true,tongrenVO.minTili,tongrenVO.maxTili);
         this.targetArrtibutePlane.setQiangHuaSta(tongrenVO.isQiangHua);
         this.targetArrtibutePlane.setZhuqueTuwen(tongrenVO.isJinzhongTuwen);
         this.targetArrtibutePlane.setJinZhongZhaoJiHuo(GameState.dictTargetStatus[40710]);
      }
   }
}

