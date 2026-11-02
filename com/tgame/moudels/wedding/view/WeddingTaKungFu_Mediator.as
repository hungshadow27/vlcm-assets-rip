package com.tgame.moudels.wedding.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wedding.model.Wedding_MsgSenderProxy;
   import com.tgame.shell.view.components.TAKungfuPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WeddingTaKungFu_Mediator extends Mediator
   {
      
      public static const NAME:String = "WeddingTaKungFu_Mediator";
      
      private var _senderProxy:Wedding_MsgSenderProxy;
      
      public function WeddingTaKungFu_Mediator()
      {
         super(NAME);
      }
      
      protected function get panel() : TAKungfuPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.taKungfuPanel);
         }
         return viewComponent as TAKungfuPanel;
      }
      
      private function get sender() : Wedding_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Wedding_MsgSenderProxy.NAME) as Wedding_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TAKungfuPanel,function():void
         {
            panel.addEventListener(TAKungfuPanel.UI_TA_KUNGFU_PARTY_SHOW,addPanelEventListener);
            panel.addEventListener(TAKungfuPanel.UI_TA_KUNGFU_JIANGHU_SHOW,addPanelEventListener);
            panel.addEventListener(TAKungfuPanel.UI_TA_KUNGFU_OTHER_SHOW,addPanelEventListener);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TAKungfuPanel,function():void
         {
            panel.removeEventListener(TAKungfuPanel.UI_TA_KUNGFU_PARTY_SHOW,addPanelEventListener);
            panel.removeEventListener(TAKungfuPanel.UI_TA_KUNGFU_JIANGHU_SHOW,addPanelEventListener);
            panel.removeEventListener(TAKungfuPanel.UI_TA_KUNGFU_OTHER_SHOW,addPanelEventListener);
         });
      }
      
      private function addPanelEventListener(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case TAKungfuPanel.UI_TA_KUNGFU_PARTY_SHOW:
               this.panel.showParty();
               this.panel.setPartyKungfu(GameInstance.peioPlayerData.skillInfo.getMenPaiSkill());
               break;
            case TAKungfuPanel.UI_TA_KUNGFU_JIANGHU_SHOW:
               this.panel.showJiangHu();
               this.panel.setJiangHuKungfu(GameInstance.peioPlayerData.skillInfo.getJiangHuSkill());
               break;
            case TAKungfuPanel.UI_TA_KUNGFU_OTHER_SHOW:
               this.panel.showOther();
               this.panel.setOtherKungfu(GameInstance.peioPlayerData.skillInfo.getOtherSkill());
         }
      }
      
      public function updateTaKungFu() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._taKungfuPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_TA_KUNGFU);
         }
         this.panel.showParty();
         this.panel.setPartyKungfu(GameInstance.peioPlayerData.skillInfo.getMenPaiSkill());
      }
   }
}

