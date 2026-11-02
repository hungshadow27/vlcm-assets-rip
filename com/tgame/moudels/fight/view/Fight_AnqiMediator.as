package com.tgame.moudels.fight.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.anqi.AnQiRes;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.info.AnQiInfo;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.fight.Fight_ApplicationFacade;
   import com.tgame.moudels.fight.model.Fight_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.huodong.AnqiKaifengPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Fight_AnqiMediator extends Mediator
   {
      
      public static const NAME:String = "Fight_AnqiMediator";
      
      private var _senderProxy:Fight_MsgSenderProxy;
      
      private var _currentShowCount:int;
      
      private var _showCountMax:int;
      
      private var _currentShowAnqiBottom:AnQiRes;
      
      public var _isVisbleCurrentAnqiTupoPanel:Boolean = false;
      
      public var rTime:int;
      
      private var _isAutoCmp:Boolean = false;
      
      private var _timer:Timer;
      
      private var _kaifengPanel:AnqiKaifengPanel;
      
      public function Fight_AnqiMediator(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      public function get senderProxy() : Fight_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Fight_MsgSenderProxy.NAME) as Fight_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get charAttribute() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            charAttribute.addEventListener(Event.ADDED_TO_STAGE,handle);
            charAttribute.addEventListener(CharAttribute.GETANQI,onClickGetAnQi);
            charAttribute.addEventListener(CharAttribute.GETBINGQI,onClickGetBingQi);
            charAttribute.addEventListener(CharAttribute.UI_ANQI_PREVIOUS_CLICK,handle);
            charAttribute.addEventListener(CharAttribute.UI_ANQI_NEXT_CLICK,handle);
            charAttribute.addEventListener(CharAttribute.UI_ANQI_CHAYUEANQICHENGJIU_CLICK,handle);
            charAttribute.addEventListener(CharAttribute.UI_ANQI_TISHENGSUDU_CLICK,handle);
            charAttribute.addEventListener(CharAttribute.UI_ANQI_TUPOPINGJING_CLICK,handle);
            charAttribute.addEventListener(CharAttribute.UI_ANQI_SHIFOUSHIYONGANQI_CLICK,handle);
            charAttribute.addEventListener(CharAttribute.UI_XIULIANTISU_GOUMAI_CLICK,handle);
            charAttribute.addEventListener(CharAttribute.UI_XIULIANTISU_KAISHITISU_CLICK,handle);
            charAttribute.addEventListener(CharAttribute.UI_XIULIANTISU_SHIYONGQUANBU_CLICK,handle);
            charAttribute.addEventListener(CharAttribute.UI_ANQITUPOPINGJING_KAISHITUPO_CLICK,handle);
            charAttribute.addEventListener(CharAttribute.UI_ANQIJINJIE_ZIDONGJINJIE_CLICK,onAutoComposeAnqiArrow);
            charAttribute.addEventListener(CharAttribute.UI_ANQITUPOPINGJINGTISHI_MUBATUPO_CLICK,handle);
            charAttribute.addEventListener(CharAttribute.UI_ANQITUPOPINGJING_GOUMAISHENGJIEWUPIN_CLICK,handle);
            charAttribute.addEventListener(CharAttribute.UI_ANQITUPOPINGJINGTISHI_GUANBITUPO_CLICK,onComposeBowArrowPanelClose);
            charAttribute.addEventListener(CharAttribute.UI_ANQI_KAIFENG_CLICK,handle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            charAttribute.removeEventListener(CharAttribute.GETANQI,onClickGetAnQi);
            charAttribute.removeEventListener(CharAttribute.GETBINGQI,onClickGetBingQi);
            charAttribute.removeEventListener(CharAttribute.UI_ANQI_PREVIOUS_CLICK,handle);
            charAttribute.removeEventListener(CharAttribute.UI_ANQI_NEXT_CLICK,handle);
            charAttribute.removeEventListener(CharAttribute.UI_ANQI_CHAYUEANQICHENGJIU_CLICK,handle);
            charAttribute.removeEventListener(CharAttribute.UI_ANQI_TISHENGSUDU_CLICK,handle);
            charAttribute.removeEventListener(CharAttribute.UI_ANQI_TUPOPINGJING_CLICK,handle);
            charAttribute.removeEventListener(CharAttribute.UI_ANQI_SHIFOUSHIYONGANQI_CLICK,handle);
            charAttribute.removeEventListener(CharAttribute.UI_XIULIANTISU_GOUMAI_CLICK,handle);
            charAttribute.removeEventListener(CharAttribute.UI_XIULIANTISU_KAISHITISU_CLICK,handle);
            charAttribute.removeEventListener(CharAttribute.UI_XIULIANTISU_SHIYONGQUANBU_CLICK,handle);
            charAttribute.removeEventListener(CharAttribute.UI_ANQITUPOPINGJING_KAISHITUPO_CLICK,handle);
            charAttribute.removeEventListener(CharAttribute.UI_ANQIJINJIE_ZIDONGJINJIE_CLICK,onAutoComposeAnqiArrow);
            charAttribute.removeEventListener(CharAttribute.UI_ANQITUPOPINGJINGTISHI_MUBATUPO_CLICK,handle);
            charAttribute.removeEventListener(CharAttribute.UI_ANQITUPOPINGJING_GOUMAISHENGJIEWUPIN_CLICK,handle);
            charAttribute.removeEventListener(CharAttribute.UI_ANQITUPOPINGJINGTISHI_GUANBITUPO_CLICK,onComposeBowArrowPanelClose);
            charAttribute.removeEventListener(CharAttribute.UI_ANQI_KAIFENG_CLICK,handle);
         });
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Fight_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Fight_ApplicationFacade.GOODS_CHANGED:
               if(this._isVisbleCurrentAnqiTupoPanel)
               {
                  this.showTupuInfo(true);
               }
         }
      }
      
      private function onClickGetAnQi(param1:Event) : void
      {
         if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 14 && !GameInstance.mainCharData.isDiZi)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，只有14级以上玩家才可以获得暗器"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有14级以上玩家才可以获得暗器"));
            return;
         }
         if(this.charAttribute.getBiaoqianVisible(3,1) == false)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，你的暗器暂未解封"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，你的暗器暂未解封"));
            this.charAttribute.tabBar.recoverBtnState();
            return;
         }
         this.init();
      }
      
      private function onClickGetBingQi(param1:Event) : void
      {
         if(GameInstance.mainCharData.attributeInfo.lv >= 14)
         {
            this.charAttribute.dispatchEvent(new Event(CharAttribute.GETANQI));
         }
         else if(GameInstance.mainCharData.attributeInfo.lv >= 60)
         {
            this.charAttribute.dispatchEvent(new Event(CharAttribute.GETGONGJIAN));
         }
         else if(GameInstance.mainCharData.attributeInfo.lv >= 68)
         {
            this.charAttribute.dispatchEvent(new Event(CharAttribute.DONGXIAO));
         }
         else if(GameInstance.mainCharData.attributeInfo.lv >= 70)
         {
            this.charAttribute.dispatchEvent(new Event(CharAttribute.WUXINGZHIREN));
         }
         else
         {
            this.charAttribute.dispatchEvent(new Event(CharAttribute.GETANQI));
            this.charAttribute.tabBar.recoverBtnState();
         }
      }
      
      private function showAnqi(param1:int) : void
      {
         var _loc7_:Skill = null;
         var _loc2_:AnQiInfo = GameInstance.mainCharData.anqiInfo;
         var _loc3_:AttributeInfo = GameInstance.mainCharData.attributeInfo;
         this.charAttribute.setAnqiBtnFun(_loc2_.have);
         var _loc4_:AnQiRes = _loc2_.anqiInfoArray[param1];
         this._currentShowAnqiBottom = _loc4_;
         var _loc5_:AnQiRes = _loc2_.getCurrentAnqiRes();
         if(_loc4_.name == _loc5_.name && Boolean(_loc2_.have))
         {
            _loc4_ = _loc2_.getCurrentAnqiRes();
            this._currentShowAnqiBottom = _loc4_;
            this.charAttribute.setAnqiInitialize([_loc4_.name,_loc2_.shulian,_loc4_.mastery,_loc2_.xiulian,_loc2_.xiulianMax,_loc4_.method,Math.round(_loc3_.ap * _loc4_.hidden_weaponscol / 10000) + "(" + _loc4_.hidden_weaponscol / 100 + LanResManager.getLanTextWords(this,"人物攻击力") + ")",_loc4_.attackDis,_loc4_.tribLv / 100,_loc4_.spcialDesc,_loc4_.grade,_loc4_.attackTargets,true]);
         }
         else if(_loc5_.grade > _loc4_.grade && Boolean(_loc2_.have))
         {
            this.charAttribute.setAnqiInitialize([_loc4_.name,5000,5000,2,1,_loc4_.method,Math.round(_loc3_.ap * _loc4_.hidden_weaponscol / 10000) + "(" + _loc4_.hidden_weaponscol / 100 + LanResManager.getLanTextWords(this,"人物攻击力") + ")",_loc4_.attackDis,_loc4_.tribLv / 100,_loc4_.spcialDesc,_loc4_.grade,_loc4_.attackTargets,true]);
         }
         else
         {
            this.charAttribute.setAnqiInitialize([_loc4_.name,0,_loc4_.mastery,0,0,_loc4_.method,Math.round(_loc3_.ap * _loc4_.hidden_weaponscol / 10000) + "(" + _loc4_.hidden_weaponscol / 100 + LanResManager.getLanTextWords(this,"人物攻击力") + ")",_loc4_.attackDis,_loc4_.tribLv / 100,_loc4_.spcialDesc,_loc4_.grade,_loc4_.attackTargets,false]);
         }
         this.setSpecialSkillArr(_loc4_);
         if(this._currentShowAnqiBottom.grade == 7 && GameInstance.mainCharData.anqiInfo.isActiveAnqi == 1)
         {
            this.charAttribute.setYincangshuxing(true,true,1000);
         }
         else if(this._currentShowAnqiBottom.grade == 7 && GameInstance.mainCharData.anqiInfo.isActiveAnqi == 0)
         {
            this.charAttribute.setYincangshuxing(true,false,1000);
         }
         else
         {
            this.charAttribute.setYincangshuxing(false,false,1000);
         }
         this.charAttribute.setPageInitialize(this._currentShowCount + 1,this._showCountMax,_loc4_.getBigICOPath());
         if(this._currentShowCount + 1 == 7)
         {
            this.charAttribute.SetkfSkillContentFalse(_loc2_.isKf);
            if(_loc2_.isKf)
            {
               this.charAttribute.SetkfSkillContent(_loc2_.isNowKf);
               if(_loc2_.isNowKf)
               {
                  _loc7_ = GameInstance.mainCharData.skillInfo.getSkillByID(_loc2_.skillId);
                  this.charAttribute.setAnqiKfSkill(_loc7_);
               }
            }
         }
         else
         {
            this.charAttribute.SetkfSkillContentFalse(false);
         }
         var _loc6_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ANQI_DUOMINGCHIZHEN] != undefined)
         {
            _loc6_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ANQI_DUOMINGCHIZHEN]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_20171115KONGQUEYUPEI] != undefined)
         {
            _loc6_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_20171115KONGQUEYUPEI]);
         }
         this.charAttribute.setAnQiZhuangBei(_loc6_);
      }
      
      private function setSpecialSkillArr(param1:AnQiRes) : void
      {
         var _loc3_:String = null;
         var _loc5_:Skill = null;
         var _loc2_:Array = param1.spcialType.split(",");
         var _loc4_:Array = [];
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_ != "" && _loc3_ != "0")
            {
               _loc5_ = new Skill(Number(_loc3_));
               _loc5_.isLearn = 1;
               _loc5_.isAnqiSkill = 1;
               _loc4_.push(_loc5_);
            }
         }
         this.charAttribute.setSkillTeshunengli(_loc4_);
      }
      
      private function handle(param1:*) : void
      {
         var anqiRes:AnQiRes = null;
         var tisushiGood:Goods = null;
         var arr:Array = null;
         var $e:* = param1;
         var anqiInfo:AnQiInfo = GameInstance.mainCharData.anqiInfo;
         switch($e.type)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case CharAttribute.UI_ANQI_NEXT_CLICK:
               ++this._currentShowCount;
               this.showAnqi(this._currentShowCount);
               break;
            case CharAttribute.UI_ANQI_PREVIOUS_CLICK:
               --this._currentShowCount;
               this.showAnqi(this._currentShowCount);
               break;
            case CharAttribute.UI_ANQI_CHAYUEANQICHENGJIU_CLICK:
               break;
            case CharAttribute.UI_ANQI_TISHENGSUDU_CLICK:
               anqiRes = anqiInfo.getCurrentAnqiRes();
               tisushiGood = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.TISUSHI,true);
               this.charAttribute.showXiuliantisuPanel([anqiRes.name,anqiRes.grade,anqiInfo.xiulian + "/" + anqiInfo.xiulianMax,tisushiGood]);
               break;
            case CharAttribute.UI_ANQI_TUPOPINGJING_CLICK:
               this.charAttribute.setAnQiZdtsBtnLabel(true);
               this.showTupuInfo(true);
               this._isVisbleCurrentAnqiTupoPanel = true;
               break;
            case CharAttribute.UI_ANQI_SHIFOUSHIYONGANQI_CLICK:
               this.senderProxy.send_52005($e.data);
               break;
            case CharAttribute.UI_XIULIANTISU_GOUMAI_CLICK:
               this.charAttribute.CloseXiuliantisuPanel();
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[SpecialGoodsID.TISUSHI,0]);
               break;
            case CharAttribute.UI_XIULIANTISU_KAISHITISU_CLICK:
               this.senderProxy.send_52011(1);
               this.charAttribute.CloseXiuliantisuPanel();
               break;
            case CharAttribute.UI_XIULIANTISU_SHIYONGQUANBU_CLICK:
               FAlert.show(LanResManager.getLanTextWords(this,"您确定要使用背包内全部的提速石么"),LanResManager.getLanTextWords(this,"注意"),2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == "FAlert.ok")
                  {
                     senderProxy.send_52011(2);
                     charAttribute.CloseXiuliantisuPanel();
                  }
               },true);
               break;
            case CharAttribute.UI_ANQITUPOPINGJING_KAISHITUPO_CLICK:
               this.senderProxy.send_52009(0);
               break;
            case CharAttribute.UI_ANQITUPOPINGJINGTISHI_MUBATUPO_CLICK:
               this.senderProxy.send_52009(1);
               POPWindowManager.closeWindow();
               break;
            case CharAttribute.UI_ANQITUPOPINGJING_GOUMAISHENGJIEWUPIN_CLICK:
               if(anqiInfo.getNextAnqiRes())
               {
                  arr = anqiInfo.getCurrentAnqiRes().getUpgradeGood();
                  PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[arr[0][0],0]);
               }
               break;
            case CharAttribute.UI_ANQI_KAIFENG_CLICK:
               this.senderProxy.send_52021();
         }
      }
      
      public function init() : void
      {
         var _loc3_:Skill = null;
         var _loc1_:AnQiInfo = GameInstance.mainCharData.anqiInfo;
         var _loc2_:AnQiRes = _loc1_.getCurrentAnqiRes();
         this._currentShowCount = _loc2_.grade - 1;
         this.charAttribute.setDangqianInitialize([_loc2_.name,_loc1_.shulian + "/" + _loc2_.mastery,_loc1_.xiulian + "/" + _loc1_.xiulianMax,_loc2_.tribLv / 100,_loc1_.tangMenMiJi,_loc1_.zhongJiAnqi]);
         this._showCountMax = _loc1_.anqiInfoArray.length;
         this.showAnqi(this._currentShowCount);
         this.setOpen(_loc1_.isOpen);
         this.charAttribute.showAnqi();
         this.showTupuInfo(false);
         this.charAttribute.SetkfSkillContentFalse(_loc1_.isKf);
         if(_loc1_.isKf)
         {
            this.charAttribute.SetkfSkillContent(_loc1_.isNowKf);
            if(_loc1_.isNowKf)
            {
               _loc3_ = GameInstance.mainCharData.skillInfo.getSkillByID(_loc1_.skillId);
               this.charAttribute.setAnqiKfSkill(_loc3_);
            }
         }
      }
      
      public function anqiZuoQi(param1:Boolean) : void
      {
         this.charAttribute.anqiZuoQi(param1);
      }
      
      public function shengjiInit() : void
      {
         var _loc3_:Skill = null;
         var _loc1_:AnQiInfo = GameInstance.mainCharData.anqiInfo;
         var _loc2_:AnQiRes = _loc1_.getCurrentAnqiRes();
         this._currentShowCount = _loc2_.grade - 1;
         this.showAnqi(this._currentShowCount);
         this.charAttribute.setDangqianInitialize([_loc2_.name,_loc1_.shulian + "/" + _loc2_.mastery,_loc1_.xiulian + "/" + _loc1_.xiulianMax,_loc2_.tribLv / 100,_loc1_.tangMenMiJi,_loc1_.zhongJiAnqi]);
         this._showCountMax = _loc1_.anqiInfoArray.length;
         this.setOpen(_loc1_.isOpen);
         this.showTupuInfo(false);
         this.charAttribute.SetkfSkillContentFalse(_loc1_.isKf);
         if(_loc1_.isKf)
         {
            this.charAttribute.SetkfSkillContent(_loc1_.isNowKf);
            if(_loc1_.isNowKf)
            {
               _loc3_ = GameInstance.mainCharData.skillInfo.getSkillByID(_loc1_.skillId);
               this.charAttribute.setAnqiKfSkill(_loc3_);
            }
         }
      }
      
      public function showTupuInfo(param1:Boolean, param2:int = -1) : void
      {
         var _loc3_:AnQiInfo = GameInstance.mainCharData.anqiInfo;
         var _loc4_:AnQiRes = _loc3_.getCurrentAnqiRes();
         var _loc5_:AnQiRes = _loc3_.getNextAnqiRes();
         var _loc6_:Boolean = _loc4_.upgradeNeedCopper < GameInstance.mainCharData.moneyInfo.copper ? true : false;
         var _loc7_:Boolean = _loc4_.upgradeNeedZhenqi < GameInstance.mainCharData.attributeInfo.gqNow ? true : false;
         var _loc8_:Boolean = _loc4_.isGetUpgradeGood();
         if(_loc5_)
         {
            this.charAttribute.setTupopingjingInitializeFun([_loc4_.name,_loc4_.grade,_loc3_.shulian,_loc4_.mastery,_loc4_.upgradeNeedCopper,_loc4_.upgradeNeedZhenqi,_loc4_.getUpgradeGoodInfo(),_loc4_.upgradeTribLv,10000,_loc3_.zhufu,_loc4_.upgradeMaxCnt * 5,_loc5_.name,_loc5_.grade,_loc4_.getBigICOPath(),_loc5_.getBigICOPath(),_loc6_,_loc7_,_loc8_]);
            if(param1)
            {
               this.charAttribute.showTupopingjingPanel(true,this._isVisbleCurrentAnqiTupoPanel);
               if(GameState.gongneng101 && _loc4_.grade >= 3)
               {
                  this.charAttribute.showMubaBtn(true);
               }
               else
               {
                  this.charAttribute.showMubaBtn(false);
               }
               this.charAttribute.setRTime(this.rTime);
            }
         }
      }
      
      public function setOpen(param1:int) : void
      {
         GameInstance.mainCharData.anqiInfo.isOpen = param1;
         var _loc2_:Boolean = param1 == 1 ? true : false;
         this.charAttribute.setAnqiUse(_loc2_);
      }
      
      public function setAnqiShuLian(param1:int, param2:int) : void
      {
         var _loc5_:String = null;
         var _loc3_:AnQiInfo = GameInstance.mainCharData.anqiInfo;
         var _loc4_:AnQiRes = _loc3_.getCurrentAnqiRes();
         if(param1 == _loc3_.anqiID)
         {
            _loc3_.shulian = param2;
            _loc5_ = _loc3_.shulian + "/" + _loc4_.mastery;
            this.charAttribute.setAnqiXljdTop(_loc5_);
            if(this._currentShowAnqiBottom.grade == _loc4_.grade)
            {
               this.charAttribute.setAnqiXljdBottom(_loc5_);
            }
            if(_loc3_.shulian == _loc4_.mastery)
            {
               this.init();
            }
         }
      }
      
      public function tupuSuccess() : void
      {
         this.charAttribute.showTupopingjingPanel(false,this._isVisbleCurrentAnqiTupoPanel);
         this._isVisbleCurrentAnqiTupoPanel = false;
         this._isAutoCmp = false;
         if(this._timer)
         {
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer.stop();
         }
         this.charAttribute.setAnQiZdtsBtnLabel(true);
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("暗器突破成功"));
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("暗器突破成功"));
      }
      
      private function onAutoComposeAnqiArrow(param1:BaseEvent) : void
      {
         var str:String = null;
         var evt:BaseEvent = param1;
         if(evt.data != null && evt.data as Boolean == false)
         {
            this.stopAutoCompose();
            return;
         }
         if(!this._isAutoCmp)
         {
            str = LanResManager.getLanTextWords(this,"您希望自动使用背包中的暗器练习木耙进阶暗器吗当遇到以下情况时",[StaticValue.RED_HTML,StaticValue.BLUE_HTML]);
            FAlert.okLabel = LanResManager.getLanCommonTextWords("开始自动突破");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  _isAutoCmp = true;
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("已开始自动提升"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("已开始自动提升"),false);
                  if(!_timer)
                  {
                     _timer = new Timer(500);
                  }
                  _timer.addEventListener(TimerEvent.TIMER,onTimer);
                  _timer.start();
                  onTimer();
                  charAttribute.setAnQiZdtsBtnLabel(false);
               }
            });
         }
         else
         {
            this.stopAutoCompose();
         }
         this.charAttribute.setTuPoBtnEnabled(!this._isAutoCmp);
      }
      
      public function stopAutoCompose() : void
      {
         if(this._isAutoCmp)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("已停止自动提升"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("已停止自动提升!"),false);
            this._isAutoCmp = false;
         }
         if(this._timer)
         {
            this._timer.stop();
         }
         this.charAttribute.setAnQiZdtsBtnLabel(true);
      }
      
      private function onComposeBowArrowPanelClose(param1:BaseEvent) : void
      {
         this.stopAutoCompose();
         this._isVisbleCurrentAnqiTupoPanel = false;
         if(this._timer)
         {
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer.stop();
            this._timer = null;
         }
      }
      
      private function onTimer(param1:TimerEvent = null) : void
      {
         this._timer.stop();
         this.senderProxy.send_52009(0);
      }
      
      public function composeFaile() : void
      {
         if(Boolean(this._timer) && this._isAutoCmp)
         {
            this._timer.start();
         }
      }
      
      public function setRTime(param1:int) : void
      {
         this.rTime = param1;
      }
      
      public function setKfPanel(param1:int, param2:int) : void
      {
         var goods:Goods;
         var gongji:int = param1;
         var goodsId:int = param2;
         if(this._kaifengPanel == null)
         {
            this._kaifengPanel = new AnqiKaifengPanel();
            this._kaifengPanel.addEventListener(AnqiKaifengPanel.UI_KAIFENG_CLICK,function(param1:Event):void
            {
               senderProxy.send_52023();
            });
         }
         this._kaifengPanel.setShuxingNum(gongji);
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(goodsId,true);
         this._kaifengPanel.setGoods(goods);
         this._kaifengPanel.x = (GameConfig.sceneWidth - this._kaifengPanel.width) / 2;
         this._kaifengPanel.y = (GameConfig.sceneHeight - this._kaifengPanel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this._kaifengPanel);
      }
      
      public function kfIsOK(param1:int) : void
      {
         var _loc2_:AnQiInfo = null;
         var _loc3_:Skill = null;
         if(param1 == 1)
         {
            _loc2_ = GameInstance.mainCharData.anqiInfo;
            _loc2_.isNowKf = true;
            this.charAttribute.SetkfSkillContentFalse(true);
            this.charAttribute.SetkfSkillContent(true);
            _loc3_ = GameInstance.mainCharData.skillInfo.getSkillByID(_loc2_.skillId);
            this.charAttribute.setAnqiKfSkill(_loc3_);
         }
      }
   }
}

