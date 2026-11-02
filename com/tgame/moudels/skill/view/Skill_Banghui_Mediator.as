package com.tgame.moudels.skill.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.skill.SkillRes;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.skill.model.Skill_MsgSenderProxy;
   import com.tgame.shell.view.components.PartyKungfuPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Skill_Banghui_Mediator extends Mediator
   {
      
      public static const NAME:String = "Skill_Banghui_Mediator";
      
      private var _msgSender:Skill_MsgSenderProxy;
      
      public function Skill_Banghui_Mediator()
      {
         super(NAME);
      }
      
      public function get sender() : Skill_MsgSenderProxy
      {
         if(this._msgSender == null)
         {
            this._msgSender = facade.retrieveProxy(Skill_MsgSenderProxy.NAME) as Skill_MsgSenderProxy;
         }
         return this._msgSender;
      }
      
      protected function get partyKungfuPanel() : PartyKungfuPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.partyKungfuPanel);
         }
         return viewComponent as PartyKungfuPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(PartyKungfuPanel,function():void
         {
            partyKungfuPanel.addEventListener(PartyKungfuPanel.UI_PARTY_KUNGFU_STUDY,onStudy);
            partyKungfuPanel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
         });
         UIEventsRegisterManager.addUIRemovedEvent(PartyKungfuPanel,function():void
         {
            partyKungfuPanel.removeEventListener(PartyKungfuPanel.UI_PARTY_KUNGFU_STUDY,onStudy);
            partyKungfuPanel.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
         });
      }
      
      private function onAddToStage(param1:Event) : void
      {
         var _loc3_:Skill = null;
         var _loc2_:Array = GameInstance.mainCharData.skillInfo.getPartySkill();
         _loc2_.sortOn("id",Array.NUMERIC);
         var _loc4_:Array = [];
         for each(_loc3_ in _loc2_)
         {
            _loc4_.push([_loc3_,GameInstance.mainCharData.skillInfo.getGoodsBySkill(_loc3_.id)]);
         }
         this.partyKungfuPanel.setDate(_loc4_);
      }
      
      private function onStudy(param1:BaseEvent) : void
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
      
      public function updateSkill(param1:int) : void
      {
         var _loc2_:Skill = GameInstance.mainCharData.skillInfo.getSkillByID(param1);
         this.partyKungfuPanel.updata(_loc2_,null);
      }
   }
}

