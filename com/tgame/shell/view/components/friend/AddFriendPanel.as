package com.tgame.shell.view.components.friend
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.FriendPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class AddFriendPanel extends FPanel
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
      
      public function AddFriendPanel()
      {
         var img:Bitmap;
         var ft:FTextArea;
         super();
         skin = "sceondPanel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 254;
         height = 165;
         titleText = LanResManager.getLanTextWords(this,"添加好友");
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
            htmlText = LanResManager.getLanTextWords(this,"昵称帮派");
         }
         addChild(ft);
         this.playerName = new FLabel();
         with(this.playerName)
         {
            x = 92;
            y = 14;
            textColor = StaticValue.BLUE;
            text = LanResManager.getLanCommonTextWords("玩家名字六个");
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
            x = 92;
            y = 32;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanCommonTextWords("帮派名字六字");
         }
         addChild(this.setup);
         this.party = new FLabel();
         with(this.party)
         {
            x = 195;
            y = 35;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanCommonTextWords("三个字");
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
            text = LanResManager.getLanTextWords(this,"需要添加他为好友");
         }
         addChild(this.tip);
         this.lookBtn = new SecondButton();
         this.lookBtn.label = LanResManager.getLanTextWords(this,"查看资料");
         addChild(this.lookBtn);
         this.lookBtn.x = 15;
         this.lookBtn.y = 110;
         this.lookBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.addBtn = new SecondButton();
         this.addBtn.label = LanResManager.getLanTextWords(this,"添加好友");
         addChild(this.addBtn);
         this.addBtn.x = 96;
         this.addBtn.y = 110;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
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
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_LOOK_INFOBTN_CLICK,"",this.id));
               break;
            case this.addBtn:
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_ADD_FRIEND_BTN_CLICK,"",this.id));
               this.onClose();
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      public function setPlayer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:String, param7:Boolean) : void
      {
         this.id = param1;
         this.headImg.bitmapData = StaticValue.getBitmapByClassName(param2).bitmapData;
         this.headImg.width = this.headImg.height = 40;
         this.playerName.text = param3;
         this.level.text = param4 + LanResManager.getLanCommonTextWords("级");
         this.setup.text = param5;
         this.party.text = param6;
         if(param7)
         {
            this.addBtn.enabled = false;
            this.tip.text = LanResManager.getLanTextWords(this,"您已经和该玩家");
         }
         else
         {
            this.addBtn.enabled = true;
            this.tip.text = LanResManager.getLanTextWords(this,"该玩家已经将您加为好友");
         }
      }
   }
}

