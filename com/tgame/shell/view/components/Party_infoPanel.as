package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.shell.view.components.party.PartyInfoCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   
   public class Party_infoPanel extends FPanel
   {
      
      public static const UI_PARTY_INFOPANEL_INFO_SHOW:String = "UI_PARTY_INFOPANEL_INFO_SHOW";
      
      public static const UI_PARTY_INFOPANEL_CHAT_SHOW:String = "UI_PARTY_INFOPANEL_CHAT_SHOW";
      
      private var tabBar:FTabBar;
      
      private var info:PartyInfoCanvas;
      
      private var chat:PartyInfoCanvas;
      
      public function Party_infoPanel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 680;
         height = 378;
         titleText = LanResManager.getLanCommonTextWords("帮会见闻");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("帮会见闻"),this.onClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("帮聊查询"),this.onClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.info = new PartyInfoCanvas();
         addChild(this.info);
         this.info.x = 10;
         this.info.y = 22;
         this.chat = new PartyInfoCanvas();
         addChild(this.chat);
         this.chat.x = 10;
         this.chat.y = 22;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("帮会见闻"):
               this.showInfoPanel();
               dispatchEvent(new BaseEvent(UI_PARTY_INFOPANEL_INFO_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("帮聊查询"):
               this.showChatPanel();
               dispatchEvent(new BaseEvent(UI_PARTY_INFOPANEL_CHAT_SHOW));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function showInfoPanel() : void
      {
         this.info.visible = true;
         this.chat.visible = false;
      }
      
      public function showChatPanel() : void
      {
         this.info.visible = false;
         this.chat.visible = true;
      }
      
      public function setInfo(param1:String) : void
      {
         this.info.setInfo(param1);
      }
      
      public function setChat(param1:String, param2:String) : void
      {
         this.chat.setChat(param1,param2);
      }
   }
}

