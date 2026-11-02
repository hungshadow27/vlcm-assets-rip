package com.tgame.shell.view.components.Accomplishment
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.AccomplishmentPanel;
   import com.tgame.shell.view.components.FriendPanel;
   import com.tgame.shell.view.components.friend.SearchPlayerListRender;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class AccomplishmentContrastSearchPlayerPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var input:FTextInput;
      
      private var searchBtn:FSimpleButton;
      
      private var playerList:FList;
      
      private var preBtn:FSimpleButton;
      
      private var count:FTextArea;
      
      private var nextBtn:FSimpleButton;
      
      private var lookBtn:SecondButton;
      
      private var addBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var _type:String;
      
      public function AccomplishmentContrastSearchPlayerPanel()
      {
         var img:Bitmap;
         var lb:FLabel;
         super();
         skin = "sceondPanel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 284;
         height = 267;
         titleText = LanResManager.getLanTextWords(this,"查询玩家");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.friend.player.search.ui");
         addChild(img);
         img.x = 6;
         img.y = 2;
         lb = new FLabel();
         with(lb)
         {
            x = 44;
            y = 6;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"玩家名");
         }
         addChild(lb);
         this.input = new FTextInput();
         with(this.input)
         {
            x = 90;
            y = 6;
            textColor = StaticValue.WHITE;
         }
         this.input.setMaxChars(12);
         addChild(this.input);
         this.searchBtn = new FSimpleButton();
         this.searchBtn.skin = "searchButton";
         addChild(this.searchBtn);
         this.searchBtn.x = 216;
         this.searchBtn.y = 8;
         this.searchBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         lb = new FLabel();
         with(lb)
         {
            x = 20;
            y = 30;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"查找结果");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 57;
            y = 54;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"名字");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 158;
            y = 54;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"等级");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 220;
            y = 54;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"门派");
         }
         addChild(lb);
         this.playerList = new FList();
         this.playerList.skin = "list";
         this.playerList.itemRenderer = new SearchPlayerListRender();
         this.playerList.listWidth = 266;
         this.playerList.listHeight = 100;
         addChild(this.playerList);
         this.playerList.x = 9;
         this.playerList.y = 74;
         lb = new FLabel();
         with(lb)
         {
            x = 20;
            y = 180;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"本处支持模糊玩家名搜索");
         }
         addChild(lb);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         addChild(this.preBtn);
         this.preBtn.x = 186;
         this.preBtn.y = 180;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.count = new FTextArea();
         with(this.count)
         {
            x = 206;
            y = 180;
            width = 25;
            height = 20;
            textColor = StaticValue.WHITE;
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            text = "1/1";
         }
         addChild(this.count);
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = 234;
         this.nextBtn.y = 180;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lookBtn = new SecondButton();
         this.lookBtn.label = LanResManager.getLanTextWords(this,"查看资料");
         addChild(this.lookBtn);
         this.lookBtn.enabled = false;
         this.lookBtn.x = 15;
         this.lookBtn.y = 212;
         this.lookBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.addBtn = new SecondButton();
         this.addBtn.label = LanResManager.getLanTextWords(this,"开始成就比较");
         addChild(this.addBtn);
         this.addBtn.enabled = false;
         this.addBtn.x = 98;
         this.addBtn.y = 212;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanTextWords(this,"取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = width - this.cancelBtn.width - 15;
         this.cancelBtn.y = 212;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.searchBtn:
               if(this.input.text == "")
               {
                  FAlert.show(LanResManager.getLanTextWords(this,"请输入名字"));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(AccomplishmentPanel.UI_CHENGJIU_SEARCH_SEARCH_BTN_CLICK,"",this.input.text));
               }
               break;
            case this.preBtn:
               this.$parent.dispatchEvent(new BaseEvent(AccomplishmentPanel.UI_CHENGJIU_SEARCH_PAGE_PRE_BTN_CLICK));
               break;
            case this.nextBtn:
               this.$parent.dispatchEvent(new BaseEvent(AccomplishmentPanel.UI_CHENGJIU_SEARCH_PAGE_NEXT_BTN_CLICK));
               break;
            case this.lookBtn:
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_LOOK_INFOBTN_CLICK,"",int(this.playerList.selectItem.label)));
               break;
            case this.addBtn:
               this.$parent.dispatchEvent(new BaseEvent(AccomplishmentPanel.UI_CHENGJIU_SEARCH_START_BTN_CLICK,"",int(this.playerList.selectItem.label)));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         this.reset();
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function reset() : void
      {
         this.setList(<list/>,0);
         this.input.text = "";
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
         if(param1 == "TYPE_BLACKLIST")
         {
            this.addBtn.label = LanResManager.getLanTextWords(this,"添加黑名单");
         }
         else if(param1 == "TYPE_FRIEND")
         {
            this.addBtn.label = LanResManager.getLanTextWords(this,"添加好友");
         }
         else if(param1 == "INVITE_JOIN_PARTY")
         {
            this.addBtn.label = LanResManager.getLanTextWords(this,"邀请入帮");
         }
         else if(param1 == LanResManager.getLanCommonTextWords("组队"))
         {
            this.addBtn.label = LanResManager.getLanTextWords(this,"邀请入队");
         }
      }
      
      public function setList(param1:XML, param2:int) : void
      {
         this.playerList.dataProvider = param1;
         if(param1.children().length() == 0)
         {
            this.lookBtn.enabled = this.addBtn.enabled = false;
         }
         else
         {
            this.lookBtn.enabled = this.addBtn.enabled = true;
            this.playerList.setSelectItemByIndex(0);
         }
         this.count.text = param2.toString();
      }
      
      public function setSearchName(param1:String) : void
      {
         this.input.text = param1;
      }
   }
}

