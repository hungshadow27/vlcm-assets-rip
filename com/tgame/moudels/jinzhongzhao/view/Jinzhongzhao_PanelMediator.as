package com.tgame.moudels.jinzhongzhao.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.jinzhongzhao.model.Jinzhongzhao_MsgSenderProxy;
   import com.tgame.moudels.jinzhongzhao.model.info.JinzhongzhaoVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.huodong.JinZhongZhaoQiangHuaPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Jinzhongzhao_PanelMediator extends Mediator
   {
      
      private static var _tongrenVO:JinzhongzhaoVo;
      
      public static const NAME:String = "Jinzhongzhao_PanelMediator";
      
      public static var lookPlayerID:int = -1;
      
      private var shengmingPd:int = 0;
      
      private const ZHAOSHU_MAX:int = 12;
      
      private const ZHAOSHU_MIN:int = 1;
      
      private var _qiangHuaPanel:JinZhongZhaoQiangHuaPanel;
      
      private var refreshDelayTimer:Timer = new Timer(400,1);
      
      private var _senderProxy:Jinzhongzhao_MsgSenderProxy;
      
      public function Jinzhongzhao_PanelMediator()
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
      
      public static function clearVO() : void
      {
         if(_tongrenVO)
         {
            _tongrenVO = null;
         }
      }
      
      protected function get mainCharArrtibutePlane() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      private function get senderProxy() : Jinzhongzhao_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Jinzhongzhao_MsgSenderProxy.NAME) as Jinzhongzhao_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(CharAttribute.JINZHONGZHAO,requestShiBaTongRenInfoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.JINZHONGZHAO_DENGJITUPO,chuangguanHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.JINZHONGZHAO_ARROW_CLICK,arrowClickHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.JINZHONGZHAO_QIANGHUA_CLICK,showQiangHuaPanel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.JINZHONGZHAO,requestShiBaTongRenInfoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.JINZHONGZHAO_DENGJITUPO,chuangguanHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.JINZHONGZHAO_ARROW_CLICK,arrowClickHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.JINZHONGZHAO_QIANGHUA_CLICK,showQiangHuaPanel);
         });
      }
      
      public function initializeMainUI() : void
      {
         this.mainCharArrtibutePlane.showJinZhongZhao();
         this.mainCharArrtibutePlane.setHP(true,tongrenVO.minShengming,tongrenVO.maxShengming);
         this.mainCharArrtibutePlane.setMP(true,tongrenVO.minNeili,tongrenVO.maxNeili);
         this.mainCharArrtibutePlane.setDP(true,tongrenVO.minFangyu,tongrenVO.maxFangyu);
         this.mainCharArrtibutePlane.setPP(true,tongrenVO.minTili,tongrenVO.maxTili);
         this.shengmingPd = tongrenVO.minShengming;
         this.mainCharArrtibutePlane.initilizeUIJZZ(tongrenVO.dese,tongrenVO.viewSkillName,tongrenVO.learnedSkillID,tongrenVO.viewSkillID,tongrenVO.sk,tongrenVO.skMiaoshu,tongrenVO.chi,tongrenVO.fumoBo);
         this.mainCharArrtibutePlane.setMiaoshuJZZ(tongrenVO.getMiaoshu(tongrenVO.shiyongArray));
         this.mainCharArrtibutePlane.setQiangHuaSta(tongrenVO.isQiangHua);
         this.mainCharArrtibutePlane.set_CJTBS(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
         this.mainCharArrtibutePlane.setZhuqueTuwen(tongrenVO.isJinzhongTuwen);
         this.mainCharArrtibutePlane.setJinZhongZhaoJiHuo(GameState.dictMainStatus[40710]);
      }
      
      private function arrowClickHandler(param1:BaseEvent) : void
      {
         if(this.refreshDelayTimer.running)
         {
            return;
         }
         var _loc2_:int = int(param1.data);
         var _loc3_:int = _loc2_ == 0 ? -1 : 1;
         if(tongrenVO.viewSkillID + _loc3_ > this.ZHAOSHU_MAX)
         {
            tongrenVO.viewSkillID = this.ZHAOSHU_MAX;
         }
         else if(tongrenVO.viewSkillID + _loc3_ < this.ZHAOSHU_MIN)
         {
            tongrenVO.viewSkillID = this.ZHAOSHU_MIN;
         }
         else
         {
            tongrenVO.viewSkillID += _loc3_;
         }
         this.senderProxy.send_55601({
            "userID":-1,
            "skillID":tongrenVO.viewSkillID
         });
      }
      
      private function delayTimerHandler(param1:TimerEvent) : void
      {
         this.refreshDelayTimer.stop();
         this.refreshDelayTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.delayTimerHandler);
      }
      
      private function chuangguanHandler(param1:BaseEvent) : void
      {
         if(tongrenVO.viewSkillID > tongrenVO.learnedSkillID + 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"不能越级领悟");
            NoticeManager.notify(NoticeManager.FOOT,"不能越级领悟");
            return;
         }
         if(tongrenVO.viewSkillID < tongrenVO.learnedSkillID + 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"此关已经领悟");
            NoticeManager.notify(NoticeManager.FOOT,"此关已经领悟");
            return;
         }
         this.senderProxy.send_55603(tongrenVO.viewSkillID);
      }
      
      private function requestShiBaTongRenInfoHandler(param1:Event) : void
      {
         if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 70)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"很抱歉，只有70级以上玩家才可以修炼金钟罩");
            NoticeManager.notify(NoticeManager.FOOT,"很抱歉，只有70级以上玩家才可以修炼金钟罩");
         }
         else
         {
            this.senderProxy.send_55601({
               "userID":-1,
               "skillID":0
            });
         }
      }
      
      public function s_55601() : void
      {
         this.senderProxy.send_55601({
            "userID":-1,
            "skillID":0
         });
      }
      
      private function showQiangHuaPanel(param1:BaseEvent) : void
      {
         var goods:Goods;
         var e:BaseEvent = param1;
         if(this._qiangHuaPanel == null)
         {
            this._qiangHuaPanel = new JinZhongZhaoQiangHuaPanel();
            this._qiangHuaPanel.addEventListener(JinZhongZhaoQiangHuaPanel.UI_QIANGHUAJINZHONGZHAO_CLICK,function(param1:Event):void
            {
               senderProxy.send_55609();
            });
         }
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JINZHONGZHAOQIANGHUAMIJI,true);
         this._qiangHuaPanel.setGoods(goods);
         this._qiangHuaPanel.x = (GameConfig.sceneWidth - this._qiangHuaPanel.width) / 2;
         this._qiangHuaPanel.y = (GameConfig.sceneHeight - this._qiangHuaPanel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this._qiangHuaPanel);
      }
      
      public function setQiangHuaResult(param1:Boolean) : void
      {
         if(param1)
         {
            this.senderProxy.send_55601({
               "userID":-1,
               "skillID":0
            });
         }
      }
   }
}

