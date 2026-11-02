package com.tgame.moudels.banghui.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.banghui.Banghui_ApplicationFacade;
   import com.tgame.moudels.banghui.model.Banghui_MsgSenderProxy;
   import com.tgame.shell.view.components.Party_infoPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Banghui_BanghuiNewsPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Banghui_BanghuiNewsPanelMediator";
      
      private var _senderProxy:Banghui_MsgSenderProxy;
      
      public function Banghui_BanghuiNewsPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : Banghui_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Banghui_MsgSenderProxy.NAME) as Banghui_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Banghui_ApplicationFacade.ADD_BANGHUI_CHAT];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Banghui_ApplicationFacade.ADD_BANGHUI_CHAT:
               _loc3_ = _loc2_ as Array;
               this.receive_banghuiChat(_loc3_[0],_loc3_[1]);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(Party_infoPanel,function():void
         {
            GameInstance.uiInstance.banghuiNewsPanel.addEventListener(Party_infoPanel.UI_PARTY_INFOPANEL_INFO_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiNewsPanel.addEventListener(Party_infoPanel.UI_PARTY_INFOPANEL_CHAT_SHOW,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(Party_infoPanel,function():void
         {
            GameInstance.uiInstance.banghuiNewsPanel.removeEventListener(Party_infoPanel.UI_PARTY_INFOPANEL_INFO_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiNewsPanel.removeEventListener(Party_infoPanel.UI_PARTY_INFOPANEL_CHAT_SHOW,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc5_:Object = null;
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:BanghuiInfo = _loc2_.banghuiInfo;
         var _loc4_:String = param1.type;
         if(param1 is BaseEvent)
         {
            _loc5_ = (param1 as BaseEvent).data;
         }
         switch(_loc4_)
         {
            case Party_infoPanel.UI_PARTY_INFOPANEL_INFO_SHOW:
               GameInstance.uiInstance.banghuiNewsPanel.showInfoPanel();
               break;
            case Party_infoPanel.UI_PARTY_INFOPANEL_CHAT_SHOW:
               GameInstance.uiInstance.banghuiNewsPanel.showChatPanel();
         }
      }
      
      public function receive_banghuiGonggao(param1:String) : void
      {
         GameInstance.uiInstance.banghuiNewsPanel.setInfo(param1);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,param1);
      }
      
      private function receive_banghuiChat(param1:String, param2:String) : void
      {
         GameInstance.uiInstance.banghuiNewsPanel.setChat(param1,param2);
      }
   }
}

