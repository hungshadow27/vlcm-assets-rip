package com.tgame.moudels.wedding.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wedding.model.Wedding_MsgSenderProxy;
   import com.tgame.shell.view.components.AutoFightPanel;
   import com.tgame.shell.view.components.MarriageSuccePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WeddingMarriageSuccess_Mediator extends Mediator
   {
      
      public static const NAME:String = "WeddingMarriageSuccess_Mediator";
      
      private var _senderProxy:Wedding_MsgSenderProxy;
      
      public function WeddingMarriageSuccess_Mediator()
      {
         super(NAME);
      }
      
      protected function get panel() : MarriageSuccePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.marriageSuccePanel);
         }
         return viewComponent as MarriageSuccePanel;
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
         UIEventsRegisterManager.addUIRegisterEvent(MarriageSuccePanel,function():void
         {
         });
         UIEventsRegisterManager.addUIRemovedEvent(MarriageSuccePanel,function():void
         {
         });
      }
      
      private function addPanelEventListener(param1:BaseEvent) : void
      {
         switch(param1.type)
         {
            case AutoFightPanel.UI_AUTOFIGHT_START:
         }
      }
      
      public function setInit(param1:int, param2:int, param3:String) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MARRIAGE_SUCCESS_PANEL);
         }
         this.panel.setInitialize(GameInstance.mainChar.name,GameInstance.mainCharData.attributeInfo.headImg,param3,HeadResChange.headResChangeToString(param2),param3);
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"成功结为夫妻",[param3]),false);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"成功结为夫妻",[param3]),false);
      }
   }
}

