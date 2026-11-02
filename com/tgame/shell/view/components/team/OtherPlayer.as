package com.tgame.shell.view.components.team
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.TeamPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class OtherPlayer extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      public var $parent:DisplayObject;
      
      private var playerList:FList;
      
      private var refreshBtn:SecondButton;
      
      private var lookInfoBtn:SecondButton;
      
      private var inviteTeamBtn:SecondButton;
      
      private var homePageBtn:SmallButton;
      
      private var endPageBtn:SmallButton;
      
      private var preBtn:FSimpleButton;
      
      private var nextBtn:FSimpleButton;
      
      private var pageCount:FLabel;
      
      private var playerName:FTextInput;
      
      private var searchBtn:FSimpleButton;
      
      private var menuCanvas:FCanvas;
      
      private var menuList:FList;
      
      private var selectId:int;
      
      private var selectName:String;
      
      public function OtherPlayer()
      {
         super();
         this.menuCanvas = new FCanvas();
         this.menuCanvas.skin = "backGroud";
         this.menuList = new FList();
         this.menuList.skin = "menuList";
         this.menuCanvas.addChild(this.menuList);
         this.menuList.x = 2;
         this.menuList.y = 2;
         this.menuList.listWidth = 35;
         this.menuList.dataProvider = XML(LanResManager.getLanTextWords(this,"xml数据"));
         this.menuList.addEventListener(MouseEvent.CLICK,this.onList);
         this.menuCanvas.width = this.menuList.width + 4;
         this.menuCanvas.height = this.menuList.height + 4;
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.team.otherPlayer.ui";
         this.init();
      }
      
      private function init() : void
      {
         var lb:FLabel = new FLabel();
         with(lb)
         {
            x = 80;
            y = 6;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"您可以搜索当前地图中的未组队玩家");
         addChild(lb);
         this.playerName = new FTextInput();
         with(this.playerName)
         {
            x = 302;
            y = 6;
            width = 116;
            height = 20;
            textColor = StaticValue.WHITE;
         }
         this.playerName.setMaxChars(12);
         addChild(this.playerName);
         this.searchBtn = new FSimpleButton();
         this.searchBtn.skin = "searchButton";
         addChild(this.searchBtn);
         this.searchBtn.x = 430;
         this.searchBtn.y = 6;
         this.searchBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         lb = new FLabel();
         with(lb)
         {
            x = 38;
            y = 35;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"玩家名称");
         addChild(lb);
         this.playerList = new FList();
         this.playerList.skin = "list";
         this.playerList.listWidth = 547;
         this.playerList.itemRenderer = new OtherPlayerRender();
         addChild(this.playerList);
         this.playerList.x = 5;
         this.playerList.y = 57;
         this.playerList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.homePageBtn = new SmallButton();
         this.homePageBtn.label = LanResManager.getLanTextWords(this,"首页");
         addChild(this.homePageBtn);
         this.homePageBtn.x = 183;
         this.homePageBtn.y = 298;
         this.homePageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         addChild(this.preBtn);
         this.preBtn.x = 245;
         this.preBtn.y = 298;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pageCount = new FLabel();
         with(this.pageCount)
         {
            x = 263;
            y = 298;
            textColor = StaticValue.WHITE;
            text = "0/0";
         }
         addChild(this.pageCount);
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = 292;
         this.nextBtn.y = 298;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.endPageBtn = new SmallButton();
         this.endPageBtn.label = LanResManager.getLanTextWords(this,"尾页");
         addChild(this.endPageBtn);
         this.endPageBtn.x = 315;
         this.endPageBtn.y = 298;
         this.endPageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.refreshBtn = new SecondButton();
         this.refreshBtn.label = LanResManager.getLanTextWords(this,"刷新列表");
         addChild(this.refreshBtn);
         this.refreshBtn.x = 20;
         this.refreshBtn.y = 332;
         this.refreshBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lookInfoBtn = new SecondButton();
         this.lookInfoBtn.label = LanResManager.getLanTextWords(this,"查看资料");
         addChild(this.lookInfoBtn);
         this.lookInfoBtn.x = 388;
         this.lookInfoBtn.y = 332;
         this.lookInfoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.inviteTeamBtn = new SecondButton();
         this.inviteTeamBtn.label = LanResManager.getLanTextWords(this,"邀请组队");
         addChild(this.inviteTeamBtn);
         this.inviteTeamBtn.x = 468;
         this.inviteTeamBtn.y = 332;
         this.inviteTeamBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.refreshBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_REFRESH_LIST));
               break;
            case this.homePageBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_GET_PAGE,"",1));
               break;
            case this.preBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_GET_PAGE,"",2));
               break;
            case this.nextBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_GET_PAGE,"",3));
               break;
            case this.endPageBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_GET_PAGE,"",4));
               break;
            case this.lookInfoBtn:
               if(this.playerList.selectItem)
               {
                  this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_LOOKINFOBTN_CLICK,"",int(this.playerList.selectItem.label)));
               }
               break;
            case this.inviteTeamBtn:
               if(this.playerList.selectItem)
               {
                  this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_INVITE_TEAM,"",int(this.playerList.selectItem.label)));
               }
               break;
            case this.searchBtn:
               if(this.playerName.text == "")
               {
                  FAlert.show(LanResManager.getLanTextWords(this,"请输入要搜索的玩家的名字"));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_SEARCH_PLAYER,this.playerName.text));
               }
         }
      }
      
      private function showMenu() : void
      {
         Tools.currentStage.addChild(this.menuCanvas);
         this.menuCanvas.x = Tools.currentStage.mouseX;
         this.menuCanvas.y = Tools.currentStage.mouseY;
         Tools.currentStage.addEventListener(MouseEvent.CLICK,this.onStageClick);
      }
      
      private function onStageClick(param1:MouseEvent = null) : void
      {
         if(this.menuCanvas.parent != null)
         {
            this.menuCanvas.parent.removeChild(this.menuCanvas);
         }
         Tools.currentStage.removeEventListener(MouseEvent.CLICK,this.onStageClick);
      }
      
      private function onList(param1:MouseEvent) : void
      {
         this.onStageClick();
         this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_OTHERPLAYER_MENU_CLICK,"",[int(this.menuList.selectItem.id),this.selectId,this.selectName]));
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         if(!this.playerList.selectItem)
         {
            return;
         }
         if(Boolean(param1.target as FTextArea && param1.target.name == "mate") && Boolean(this.playerList.selectItem.mate != "") && this.playerList.selectItem.mateIsLine == "1")
         {
            param1.stopPropagation();
            this.selectId = this.playerList.selectItem.mateid;
            this.selectName = this.playerList.selectItem.mate;
            this.showMenu();
         }
         else
         {
            if(Boolean(param1.target as FTextArea && param1.target.name == "mate") && Boolean(this.playerList.selectItem.mate != "") && this.playerList.selectItem.mateIsLine == "0")
            {
               return;
            }
            param1.stopPropagation();
            this.selectId = this.playerList.selectItem.label;
            this.selectName = this.playerList.selectItem.playerName;
            this.showMenu();
         }
      }
      
      public function setPlayerList(param1:XML, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false) : void
      {
         this.playerList.dataProvider = param1;
         if(param1.children().length() > 0)
         {
            this.playerList.setSelectItemByIndex(0);
         }
         this.pageCount.text = param3 + "/" + param2;
         this.homePageBtn.enabled = this.preBtn.enabled = !param4;
         this.endPageBtn.enabled = this.nextBtn.enabled = !param5;
      }
   }
}

