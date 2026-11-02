package com.tgame.shell.view.components.party
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.Party_memberManagePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class Party_changeChenghaoPanel extends FPanel
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
      
      private var chengHaoInput:FTextInput;
      
      public function Party_changeChenghaoPanel()
      {
         var img:Bitmap;
         var ft:FTextArea;
         var fb:FLabel;
         var bg:F9GridBitmap;
         super();
         skin = "sceondPanel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 254;
         height = 165;
         titleText = LanResManager.getLanCommonTextWords("更改称号");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.friend.add.friend.ui");
         addChild(img);
         img.x = 6;
         img.y = 2;
         this.headImg = new Bitmap();
         addChild(this.headImg);
         this.headImg.x = 14;
         this.headImg.y = 11;
         ft = new FTextArea();
         with(ft)
         {
            x = 60;
            y = 14;
            width = 152;
            height = 45;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         ft.htmlText = LanResManager.getLanTextWords(this,"昵称等级门派");
         addChild(ft);
         this.playerName = new FLabel();
         with(this.playerName)
         {
            x = 94;
            y = 14;
            textColor = StaticValue.BLUE;
         }
         addChild(this.playerName);
         this.level = new FLabel();
         with(this.level)
         {
            x = 94;
            y = 34;
            textColor = StaticValue.WHITE;
            text = "100";
         }
         addChild(this.level);
         this.setup = new FLabel();
         with(this.setup)
         {
            x = 70;
            y = 34;
            textColor = StaticValue.WHITE;
         }
         this.party = new FLabel();
         with(this.party)
         {
            x = 180;
            y = 35;
            textColor = StaticValue.WHITE;
         }
         addChild(this.party);
         fb = new FLabel();
         with(fb)
         {
            x = 12;
            y = 64;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
         }
         fb.text = LanResManager.getLanTextWords(this,"称号更改为");
         addChild(fb);
         bg = Tools.get9GridBitmpByName("inputBg");
         addChild(bg);
         bg.x = 90;
         bg.y = 62;
         bg.width = 124;
         this.chengHaoInput = new FTextInput();
         with(this.chengHaoInput)
         {
            x = 92;
            y = 62;
            width = 120;
            height = 20;
            textColor = StaticValue.WHITE;
         }
         this.chengHaoInput.setMaxChars(12);
         addChild(this.chengHaoInput);
         fb = new FLabel();
         with(fb)
         {
            x = 12;
            y = 83;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         fb.text = LanResManager.getLanTextWords(this,"帮中昵称最多六个字");
         addChild(fb);
         this.lookBtn = new SecondButton();
         this.lookBtn.label = LanResManager.getLanTextWords(ApplicationJoinPartyPanel,"查看资料");
         addChild(this.lookBtn);
         this.lookBtn.x = 15;
         this.lookBtn.y = 110;
         this.lookBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.addBtn = new SecondButton();
         this.addBtn.label = LanResManager.getLanTextWords(this,"变更称号");
         addChild(this.addBtn);
         this.addBtn.x = 96;
         this.addBtn.y = 110;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = 195;
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
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_CHANGE_CHENGHAO,"",[this.id,this.chengHaoInput.text]));
               this.onClose();
               break;
            case this.cancelBtn:
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
      
      public function setPlayer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String) : void
      {
         this.id = param1;
         this.chengHaoInput.text = param2;
         this.headImg.bitmapData = StaticValue.getBitmapByClassName(param3).bitmapData;
         this.headImg.width = this.headImg.height = 40;
         this.playerName.text = param4;
         this.level.text = param5;
         this.setup.text = param6;
         this.party.text = param7;
      }
   }
}

