package com.tgame.shell.view.components.friend
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
   import com.tgame.shell.view.components.FriendPanel;
   import com.tgame.shell.view.components.Party_memberManagePanel;
   import com.tgame.shell.view.components.TeamPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class SearchPlayerPanel extends FPanel
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
      
      public function SearchPlayerPanel()
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
         titleText = LanResManager.getLanCommonTextWords("查询玩家");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.friend.player.search.ui");
         addChild(img);
         img.x = 6;
         img.y = 2;
         lb = new FLabel();
         with(lb)
         {
            x = 20;
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
            text = LanResManager.getLanCommonTextWords("名字");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 158;
            y = 54;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 220;
            y = 54;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("门派");
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
         this.lookBtn.label = LanResManager.getLanTextWords(AddFriendPanel,"查看资料");
         addChild(this.lookBtn);
         this.lookBtn.enabled = false;
         this.lookBtn.x = 15;
         this.lookBtn.y = 212;
         this.lookBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.addBtn = new SecondButton();
         this.addBtn.label = LanResManager.getLanTextWords(AddFriendPanel,"添加好友");
         addChild(this.addBtn);
         this.addBtn.enabled = false;
         this.addBtn.x = 98;
         this.addBtn.y = 212;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
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
                  FAlert.show("  " + LanResManager.getLanTextWords(this,"请输入名字") + "  ");
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_SEARCH_BNT_CLICK,"",this.input.text));
               }
               break;
            case this.preBtn:
               this.$parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_GET_PREPAGE,"",this._type));
               break;
            case this.nextBtn:
               this.$parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_GET_NEXTPAGE,"",this._type));
               break;
            case this.lookBtn:
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_LOOK_INFOBTN_CLICK,"",int(this.playerList.selectItem.label)));
               break;
            case this.addBtn:
               if(this._type == "TYPE_FRIEND")
               {
                  EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_ADD_FRIEND_BTN_CLICK,"",int(this.playerList.selectItem.label)));
               }
               else if(this._type == "TYPE_BLACKLIST")
               {
                  this.$parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_BLACK_ADDTOBTN_CLICK,"",int(this.playerList.selectItem.label)));
               }
               else if(this._type == "INVITE_JOIN_PARTY")
               {
                  this.$parent.dispatchEvent(new BaseEvent(Party_memberManagePanel.UI_PARTY_MEMBER_MANAGE_PANEL_INVITE_JOIN_PARTY,"",int(this.playerList.selectItem.label)));
               }
               else if(this._type == LanResManager.getLanCommonTextWords("组队"))
               {
                  this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_ADDMEMBERBTN_MEMBER,"",this.playerList.selectItem.playerName));
               }
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
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
            this.addBtn.label = LanResManager.getLanTextWords(FriendCanvas,"添加好友");
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
   }
}

