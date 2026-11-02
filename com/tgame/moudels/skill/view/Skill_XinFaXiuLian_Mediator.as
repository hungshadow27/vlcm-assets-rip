package com.tgame.moudels.skill.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.fight.model.FightHeadThread;
   import com.tgame.moudels.skill.model.Skill_MsgSenderProxy;
   import com.tgame.shell.view.components.ButtonContainer;
   import com.tgame.shell.view.components.XinfaPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.graphics.tagger.AttackFace;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Skill_XinFaXiuLian_Mediator extends Mediator
   {
      
      public static const NAME:String = "Skill_XinFaXiuLian_Mediator";
      
      private var _fightFHT:FightHeadThread = new FightHeadThread();
      
      private var _msgSender:Skill_MsgSenderProxy;
      
      private var _xiulianID:int = 0;
      
      public function Skill_XinFaXiuLian_Mediator()
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
      
      protected function get xinfaPanel() : XinfaPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xinfaPanel);
         }
         return viewComponent as XinfaPanel;
      }
      
      protected function get buttonContainer() : ButtonContainer
      {
         return GameInstance.uiInstance.buttonContainer;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ButtonContainer,function():void
         {
            buttonContainer.xinfa.addEventListener(MouseEvent.CLICK,onXinFaClick);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ButtonContainer,function():void
         {
            buttonContainer.xinfa.removeEventListener(MouseEvent.CLICK,onXinFaClick);
         });
         UIEventsRegisterManager.addUIRegisterEvent(XinfaPanel,function():void
         {
            xinfaPanel.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
            xinfaPanel.addEventListener(XinfaPanel.UI_XINFAPANEL_OK,onXinFaOKClick);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XinfaPanel,function():void
         {
            xinfaPanel.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
            xinfaPanel.removeEventListener(XinfaPanel.UI_XINFAPANEL_OK,onXinFaOKClick);
         });
      }
      
      private function onXinFaClick(param1:Event) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_XINFA_XIULIAN);
      }
      
      private function onXinFaOKClick(param1:BaseEvent) : void
      {
         var _loc2_:Skill = param1.data as Skill;
         if(!_loc2_)
         {
            return;
         }
         this.sender.send_50631(_loc2_.id);
      }
      
      public function updateXiuLianSkill(param1:int) : void
      {
         var _loc2_:Skill = null;
         this._xiulianID = param1;
         if(GameInstance.uiInstance._xinfaPanel != null)
         {
            _loc2_ = GameInstance.mainCharData.skillInfo.getSkillByID(this._xiulianID);
            if(!_loc2_)
            {
               return;
            }
            this.xinfaPanel.item = _loc2_;
         }
      }
      
      public function updateXinFaShow(param1:int) : void
      {
         var _loc2_:Skill = GameInstance.mainCharData.skillInfo.getSkillByID(param1);
         if(!_loc2_ || _loc2_.res.useway == 1)
         {
            return;
         }
         var _loc3_:String = _loc2_.res.name + LanResManager.getLanTextWords(this,"熟练度");
         this._fightFHT.push(GameInstance.mainChar,"",0,false,false,_loc3_,AttackFace.DEFAULT_FOUNT_SIZE_20,AttackFace.DEFAULT_FOUNT_COLOR_YELLOW);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc3_);
      }
      
      public function updateXinFa() : void
      {
         if(GameInstance.uiInstance._xinfaPanel != null)
         {
            this.xinfaPanel.Skills = GameInstance.mainCharData.skillInfo.findXinFa();
         }
      }
      
      private function onAddedToStage(param1:* = null) : void
      {
         this.updateXinFa();
         this.updateXiuLianSkill(this._xiulianID);
      }
   }
}

