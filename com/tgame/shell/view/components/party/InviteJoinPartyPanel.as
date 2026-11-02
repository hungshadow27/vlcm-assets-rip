package com.tgame.shell.view.components.party
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.Party_memberManagePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class InviteJoinPartyPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var headImg:Bitmap;
      
      private var playerName:FLabel;
      
      private var level:FLabel;
      
      private var setup:FLabel;
      
      private var party:FLabel;
      
      private var lookBtn:SecondButton;
      
      private var addBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var tip:FTextArea;
      
      private var id:int;
      
      private var partyID:int;
      
      public function InviteJoinPartyPanel()
      {
         var img:Bitmap;
         super();
         skin = "sceondPanel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 254;
         height = 165;
         titleText = LanResManager.getLanCommonTextWords("邀请入帮");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.friend.add.friend.ui");
         addChild(img);
         img.x = 6;
         img.y = 2;
         this.headImg = new Bitmap();
         addChild(this.headImg);
         this.headImg.x = 14;
         this.headImg.y = 11;
         this.playerName = new FLabel();
         with(this.playerName)
         {
            x = 60;
            y = 14;
            textColor = StaticValue.BLUE;
         }
         addChild(this.playerName);
         this.level = new FLabel();
         with(this.level)
         {
            x = 206;
            y = 14;
            textColor = StaticValue.WHITE;
            text = "100";
         }
         addChild(this.level);
         this.setup = new FLabel();
         with(this.setup)
         {
            x = 60;
            y = 32;
            textColor = StaticValue.WHITE;
         }
         addChild(this.setup);
         this.party = new FLabel();
         with(this.party)
         {
            x = 206;
            y = 32;
            textColor = StaticValue.WHITE;
         }
         addChild(this.party);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 12;
            y = 64;
            width = 228;
            height = 35;
            wordWrap = true;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         this.tip.text = LanResManager.getLanTextWords(ApplicationJoinPartyPanel,"该玩家申请加入您的帮会");
         addChild(this.tip);
         this.lookBtn = new SecondButton();
         this.lookBtn.label = LanResManager.getLanTextWords(ApplicationJoinPartyPanel,"查看资料");
         addChild(this.lookBtn);
         this.lookBtn.x = 15;
         this.lookBtn.y = 110;
         this.lookBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.addBtn = new SecondButton();
         this.addBtn.label = LanResManager.getLanCommonTextWords("同意入帮");
         addChild(this.addBtn);
         this.addBtn.x = 96;
         this.addBtn.y = 110;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanTextWords(ApplicationJoinPartyPanel,"拒绝");
         addChild(this.cancelBtn);
         this.cancelBtn.x = width - this.cancelBtn.width - 15;
         this.cancelBtn.y = 110;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.lookBtn:
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_PLAYER_CHATTRIBUTE_LOOK,"",this.id));
               break;
            case this.addBtn:
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_JOIN_ISOK,"",[this.id,this.partyID,true]));
               this.onClose();
               break;
            case this.cancelBtn:
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_JOIN_ISOK,"",[this.id,this.partyID,false]));
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setPlayer(param1:int, param2:int, param3:String, param4:String, param5:String, param6:String, param7:String) : void
      {
         this.id = param1;
         this.partyID = param2;
         this.headImg.bitmapData = StaticValue.getBitmapByClassName(param3).bitmapData;
         this.headImg.width = this.headImg.height = 40;
         this.playerName.text = param4;
         this.level.text = param5 + LanResManager.getLanCommonTextWords("级");
         this.setup.text = param7;
         this.party.text = param6;
      }
   }
}

