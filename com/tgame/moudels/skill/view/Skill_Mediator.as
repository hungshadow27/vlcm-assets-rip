package com.tgame.moudels.skill.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.skill.SkillRes;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.skill.Skill_ApplicationFacade;
   import com.tgame.moudels.skill.model.Skill_MsgSenderProxy;
   import com.tgame.moudels.skill.model.Skill_Proxy;
   import com.tgame.shell.view.components.KungFuPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Skill_Mediator extends Mediator
   {
      
      public static const NAME:String = "Skill_Mediator";
      
      private var _skillProxy:Skill_Proxy;
      
      private var _msgSender:Skill_MsgSenderProxy;
      
      private var _currentSelectedSkill:Skill;
      
      private var _readyShortIndex:int;
      
      private var _currentShowTab:int;
      
      public function Skill_Mediator()
      {
         super(NAME);
      }
      
      public function get skillProxy() : Skill_Proxy
      {
         if(this._skillProxy == null)
         {
            this._skillProxy = facade.retrieveProxy(Skill_Proxy.NAME) as Skill_Proxy;
         }
         return this._skillProxy;
      }
      
      public function get msgSender() : Skill_MsgSenderProxy
      {
         if(this._msgSender == null)
         {
            this._msgSender = facade.retrieveProxy(Skill_MsgSenderProxy.NAME) as Skill_MsgSenderProxy;
         }
         return this._msgSender;
      }
      
      protected function get kungfu() : KungFuPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.kungFuPanel);
         }
         return viewComponent as KungFuPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Skill_ApplicationFacade.SKILL_LEVEL_UPDATE,Skill_ApplicationFacade.KUAFU_STATUS];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Boolean = false;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Skill_ApplicationFacade.SKILL_LEVEL_UPDATE:
               break;
            case Skill_ApplicationFacade.KUAFU_STATUS:
               _loc3_ = _loc2_ as Boolean;
               if(_loc3_)
               {
                  this.kungfu.showMask(true);
               }
               else
               {
                  this.kungfu.showMask(false);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(KungFuPanel,function():void
         {
            kungfu.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
            kungfu.addEventListener(KungFuPanel.UI_KUNGFU_PARTY_SHOW,onShowMenPaiClick);
            kungfu.addEventListener(KungFuPanel.UI_KUNGFU_JIANGHU_SHOW,onShowJiangHuClick);
            kungfu.addEventListener(KungFuPanel.UI_KUNGFU_OTHER_SHOW,onShowOtherClick);
            kungfu.addEventListener(KungFuPanel.UI_KUNGFU_SKILL_UPGRADE,onSkillLevelUpClick);
            kungfu.addEventListener(KungFuPanel.UI_KUNGFU_SKILL_BOOK_COUNT,onCheckSkillBookClick);
            kungfu.addEventListener(KungFuPanel.UI_KUNGFU_SKILL_STUDY,onStudySkillClick);
            kungfu.addEventListener(KungFuPanel.UI_KUNGFU_SKILL_DRAG_START,onStartDrag);
            kungfu.addEventListener(KungFuPanel.UI_KUNGFU_SKILL_TUPO,onClickStartTupPanel);
            kungfu.addEventListener(KungFuPanel.UI_KUNGFUBREAKTHROUGHPANEL_KSTPCLICK,onClickStartTupo);
            kungfu.addEventListener(KungFuPanel.UI_KUNGFU_WUFANG_SHOW,onShowWufangClick);
            kungfu.addEventListener(KungFuPanel.UI_KUNGFU_TIANFU_SHOW,onShowTianFuClick);
            kungfu.addEventListener(KungFuPanel.UI_KUNGFU_TIANFU_TUPO,onShowTianFuClick);
         });
         UIEventsRegisterManager.addUIRemovedEvent(KungFuPanel,function():void
         {
            kungfu.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
            kungfu.removeEventListener(KungFuPanel.UI_KUNGFU_PARTY_SHOW,onShowMenPaiClick);
            kungfu.removeEventListener(KungFuPanel.UI_KUNGFU_JIANGHU_SHOW,onShowJiangHuClick);
            kungfu.removeEventListener(KungFuPanel.UI_KUNGFU_OTHER_SHOW,onShowOtherClick);
            kungfu.removeEventListener(KungFuPanel.UI_KUNGFU_SKILL_UPGRADE,onSkillLevelUpClick);
            kungfu.removeEventListener(KungFuPanel.UI_KUNGFU_SKILL_BOOK_COUNT,onCheckSkillBookClick);
            kungfu.removeEventListener(KungFuPanel.UI_KUNGFU_SKILL_STUDY,onStudySkillClick);
            kungfu.removeEventListener(KungFuPanel.UI_KUNGFU_SKILL_DRAG_START,onStartDrag);
            kungfu.removeEventListener(KungFuPanel.UI_KUNGFU_SKILL_TUPO,onClickStartTupPanel);
            kungfu.removeEventListener(KungFuPanel.UI_KUNGFUBREAKTHROUGHPANEL_KSTPCLICK,onClickStartTupo);
            kungfu.removeEventListener(KungFuPanel.UI_KUNGFU_WUFANG_SHOW,onShowWufangClick);
            kungfu.removeEventListener(KungFuPanel.UI_KUNGFU_TIANFU_SHOW,onShowTianFuClick);
            kungfu.removeEventListener(KungFuPanel.UI_KUNGFU_TIANFU_TUPO,onShowTianFuClick);
         });
      }
      
      private function onStartDrag(param1:BaseEvent) : void
      {
         var _loc2_:ItemFace = param1.data as ItemFace;
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
         {
            TCursorManager.currentItemFace = _loc2_;
            TCursorManager.showItem(_loc2_.itemBD);
            TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
            TCursorManager.lockOnMouseStatus();
         }
      }
      
      private function onStudySkillClick(param1:BaseEvent) : void
      {
         var _loc5_:Goods = null;
         var _loc2_:SkillRes = SkillResManager.getSkillRes(Number(param1.data));
         var _loc3_:int = _loc2_.learningBook;
         var _loc4_:Array = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(_loc3_,true);
         if(_loc4_.length >= 1)
         {
            _loc5_ = _loc4_[0];
            PipeManager.sendMsg(PipeConstants.ITEM_USE_SKILLGOODS,_loc5_);
         }
      }
      
      private function onCheckSkillBookClick(param1:BaseEvent) : void
      {
         var _loc5_:Goods = null;
         var _loc2_:SkillRes = SkillResManager.getSkillRes(Number(param1.data));
         var _loc3_:int = _loc2_.learningBook;
         var _loc4_:Array = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(_loc3_,true);
         if(_loc4_.length >= 1)
         {
            _loc5_ = _loc4_[0];
         }
         else
         {
            _loc5_ = new Goods(_loc3_);
            if(_loc5_.res == null)
            {
               this.kungfu.setSkillBook(null);
               return;
            }
         }
         this.kungfu.setSkillBook(_loc5_);
      }
      
      private function onShowMenPaiClick(param1:BaseEvent, param2:Boolean = false) : void
      {
         this.kungfu.showParty(param2);
         this.kungfu.setPartyKungfu(GameInstance.mainCharData.skillInfo.getMenPaiSkill());
         this._currentShowTab = 1;
      }
      
      private function onShowJiangHuClick(param1:BaseEvent, param2:Boolean = false) : void
      {
         this.kungfu.showJiangHu(param2);
         this.kungfu.setJiangHuKungfu(GameInstance.mainCharData.skillInfo.getJiangHuSkill());
         this._currentShowTab = 2;
      }
      
      private function onShowOtherClick(param1:BaseEvent, param2:Boolean = false) : void
      {
         this.kungfu.showOther(param2);
         this.kungfu.setOtherKungfu(GameInstance.mainCharData.skillInfo.getOtherSkill());
         this._currentShowTab = 3;
      }
      
      private function onShowWufangClick(param1:BaseEvent, param2:Boolean = false) : void
      {
         this.msgSender.send_82421();
         this.kungfu.showWufang(param2);
         this._currentShowTab = 4;
      }
      
      private function onShowTianFuClick(param1:BaseEvent, param2:Boolean = false) : void
      {
         switch(param1.type)
         {
            case KungFuPanel.UI_KUNGFU_TIANFU_SHOW:
               this.msgSender.send_83241();
               this._currentShowTab = 5;
               break;
            case KungFuPanel.UI_KUNGFU_TIANFU_TUPO:
               this.msgSender.send_83243();
         }
      }
      
      private function onSkillLevelUpClick(param1:BaseEvent) : void
      {
         var _loc2_:Array = param1.data as Array;
         this.msgSender.send_10271(_loc2_);
      }
      
      public function updateTab() : void
      {
         switch(this._currentShowTab)
         {
            case 1:
               this.onShowMenPaiClick(null);
               break;
            case 2:
               this.onShowJiangHuClick(null);
               break;
            case 3:
               this.onShowOtherClick(null);
         }
      }
      
      public function updateMenPaiRight() : void
      {
         this.kungfu.refresh();
      }
      
      public function updateMenPaiLeft() : void
      {
         if(this._currentShowTab == 1)
         {
            this.kungfu.setPartyKungfu(GameInstance.mainCharData.skillInfo.getMenPaiSkill());
         }
         else if(this._currentShowTab == 2)
         {
            this.kungfu.setJiangHuKungfu(GameInstance.mainCharData.skillInfo.getJiangHuSkill());
         }
         else if(this._currentShowTab == 3)
         {
            this.kungfu.setOtherKungfu(GameInstance.mainCharData.skillInfo.getOtherSkill());
         }
      }
      
      public function skillTupoOK(param1:int) : void
      {
         var _loc2_:Skill = GameInstance.mainCharData.skillInfo.getSkillByID(param1);
         _loc2_.isPingJingSkill = 0;
         this.updateMenPaiRight();
         this.updateTab();
         this.kungfu.closeKungFuBreakthroughPanel();
      }
      
      public function getSkillTuPoInfo(param1:Skill) : void
      {
         this.kungfu.showKungFuBreakthroughPanel(param1);
      }
      
      public function onAddedToStage(param1:* = null) : void
      {
         this.updateSkillLevel();
      }
      
      public function updateSkillLevel() : void
      {
         if(GameInstance.uiInstance._kungFuPanel != null)
         {
            this.kungfu.setKungfuLv(GameInstance.mainCharData.skillInfo.skillLevel);
         }
      }
      
      private function onClickStartTupPanel(param1:BaseEvent) : void
      {
         this.msgSender.send_10291(param1.data);
      }
      
      private function onClickStartTupo(param1:BaseEvent) : void
      {
         this.msgSender.send_10275(param1.data);
      }
      
      public function showNewSkillMovie(param1:Skill) : void
      {
         var _loc2_:ItemFace = null;
         if(param1.res.wugong_type == 1 || param1.res.wugong_type == 2)
         {
            if(param1.res.skilltype == 2 && param1.res.useway == 1)
            {
               if(!Fun.isVisible(GameInstance.uiInstance._kungFuPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_KUNGFU);
               }
               this.dragToQuickBar(param1);
               switch(param1.res.wugong_type)
               {
                  case 1:
                     this.onShowMenPaiClick(null,true);
                     _loc2_ = this.kungfu.getPartyKungfuBySkill(param1);
                     break;
                  case 2:
                     this.onShowJiangHuClick(null,true);
                     _loc2_ = this.kungfu.getJiangHuKungfuBySkill(param1);
               }
               if(_loc2_)
               {
                  GameInstance.uiInstance.mainUI.setItemFaceAndShowMovie(_loc2_);
               }
            }
         }
      }
      
      private function dragToQuickBar(param1:Skill) : void
      {
         var _loc3_:ByteArray = null;
         var _loc2_:int = ExchangePositionManager.checkBlankShortIndex();
         if(_loc2_ != -1)
         {
            param1.quickbarindex = _loc2_;
            _loc3_ = new ByteArray();
            _loc3_.writeInt(param1.id);
            _loc3_.writeByte(_loc2_);
            NetWorkManager.sendMsg(10277,_loc3_);
         }
      }
      
      public function setWufang(param1:Number) : void
      {
         this.kungfu.setWufang(param1);
      }
      
      public function setTianFuData(param1:Object) : void
      {
         this.kungfu.setTianFuData(param1);
      }
      
      public function setTianFuUpSuccess(param1:Boolean) : void
      {
         this.kungfu.setTianFuUpSuccess(param1);
      }
   }
}

