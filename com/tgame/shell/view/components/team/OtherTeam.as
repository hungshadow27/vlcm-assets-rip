package com.tgame.shell.view.components.team
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.TeamPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class OtherTeam extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      public var $parent:DisplayObject;
      
      private var teamList:FList;
      
      private var refreshBtn:SecondButton;
      
      private var addTeamBtn:SecondButton;
      
      private var homePageBtn:SmallButton;
      
      private var endPageBtn:SmallButton;
      
      private var preBtn:FSimpleButton;
      
      private var nextBtn:FSimpleButton;
      
      private var pageCount:FLabel;
      
      private var memberContainer:Sprite;
      
      public function OtherTeam()
      {
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.team.otherTeam.ui";
         this.init();
      }
      
      private function init() : void
      {
         var lb:FLabel;
         this.memberContainer = new Sprite();
         addChild(this.memberContainer);
         this.memberContainer.x = 393;
         this.memberContainer.y = 68;
         lb = new FLabel();
         with(lb)
         {
            x = 37;
            y = 35;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"队伍宣言");
         addChild(lb);
         this.teamList = new FList();
         this.teamList.skin = "list";
         this.teamList.listWidth = 381;
         this.teamList.listHeight = 239;
         this.teamList.itemRenderer = new OtherTeamListRender();
         addChild(this.teamList);
         this.teamList.x = 5;
         this.teamList.y = 58;
         this.teamList.addEventListener(MouseEvent.CLICK,this.onList);
         this.homePageBtn = new SmallButton();
         this.homePageBtn.label = LanResManager.getLanTextWords(this,"首页");
         addChild(this.homePageBtn);
         this.homePageBtn.x = 90;
         this.homePageBtn.y = 298;
         this.homePageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         addChild(this.preBtn);
         this.preBtn.x = 150;
         this.preBtn.y = 298;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pageCount = new FLabel();
         with(this.pageCount)
         {
            x = 170;
            y = 298;
            textColor = StaticValue.WHITE;
            text = "0/0";
         }
         addChild(this.pageCount);
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = 196;
         this.nextBtn.y = 298;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.endPageBtn = new SmallButton();
         this.endPageBtn.label = LanResManager.getLanTextWords(this,"尾页");
         addChild(this.endPageBtn);
         this.endPageBtn.x = 220;
         this.endPageBtn.y = 298;
         this.endPageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.refreshBtn = new SecondButton();
         this.refreshBtn.label = LanResManager.getLanTextWords(this,"刷新列表");
         addChild(this.refreshBtn);
         this.refreshBtn.x = 148;
         this.refreshBtn.y = 332;
         this.refreshBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.addTeamBtn = new SecondButton();
         this.addTeamBtn.label = LanResManager.getLanTextWords(this,"申请入队");
         addChild(this.addTeamBtn);
         this.addTeamBtn.x = 440;
         this.addTeamBtn.y = 332;
         this.addTeamBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onList(param1:MouseEvent) : void
      {
         if(!this.teamList.selectItem)
         {
            return;
         }
         this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_OTHERTEAM_GET_OTHERTEAM_MEMBERLIST,"",int(this.teamList.selectItem.label)));
         while(this.memberContainer.numChildren > 0)
         {
            this.memberContainer.removeChildAt(0);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.refreshBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_OTHERTEAM_REFRESH_LIST));
               break;
            case this.addTeamBtn:
               if(this.teamList.selectItem)
               {
                  this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_OTHERTEAM_ADD_TEAM,"",int(this.teamList.selectItem.label)));
               }
               break;
            case this.homePageBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_OTHERTEAM_GET_PAGE,"",1));
               break;
            case this.preBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_OTHERTEAM_GET_PAGE,"",2));
               break;
            case this.nextBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_OTHERTEAM_GET_PAGE,"",3));
               break;
            case this.endPageBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_OTHERTEAM_GET_PAGE,"",4));
         }
      }
      
      public function setTeamList(param1:XML, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false) : void
      {
         this.teamList.dataProvider = param1;
         if(param1.children().length() > 0)
         {
            this.teamList.setSelectItemByIndex(0);
            this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_OTHERTEAM_GET_OTHERTEAM_MEMBERLIST,"",int(this.teamList.selectItem.label)));
         }
         while(this.memberContainer.numChildren > 0)
         {
            this.memberContainer.removeChildAt(0);
         }
         this.pageCount.text = param3 + "/" + param2;
         this.homePageBtn.enabled = this.preBtn.enabled = !param4;
         this.endPageBtn.enabled = this.nextBtn.enabled = !param5;
      }
      
      public function setTeamMemberList(param1:XML = null) : void
      {
         var fa:FTextArea;
         var fa1:FTextArea;
         var fa3:FTextArea;
         var len:int;
         var i:int = 0;
         var str:String = null;
         var arr:Array = null;
         var value:XML = param1;
         while(this.memberContainer.numChildren > 0)
         {
            this.memberContainer.removeChildAt(0);
         }
         fa = new FTextArea();
         with(fa)
         {
            x = 0;
            y = -6;
            width = 90;
            height = 250;
            defaultTextFormat = new TextFormat(null,null,StaticValue.BLUE,null,null,null,null,null,"center");
            filters = StaticValue.filter;
         }
         this.memberContainer.addChild(fa);
         fa1 = new FTextArea();
         with(fa1)
         {
            x = 90;
            y = 6;
            width = 24;
            height = 250;
            defaultTextFormat = new TextFormat(null,null,StaticValue.WHITE,null,null,null,null,null,"center");
            filters = StaticValue.filter;
         }
         this.memberContainer.addChild(fa1);
         fa3 = new FTextArea();
         with(fa3)
         {
            x = 110;
            y = 6;
            width = 56;
            height = 250;
            defaultTextFormat = new TextFormat(null,null,StaticValue.WHITE,null,null,null,null,null,"center");
            filters = StaticValue.filter;
         }
         this.memberContainer.addChild(fa3);
         fa.htmlText = "<textformat leading=\'2\'>";
         fa1.htmlText = "<textformat leading=\'1\'>";
         fa3.htmlText = "<textformat leading=\'1\'>";
         len = value.children().length();
         i = 0;
         while(i < len)
         {
            str = value.node[i].@memberName;
            if(str.charAt(0) == "[" && str.indexOf("]") != -1)
            {
               arr = str.split("]");
               fa.htmlText += arr[0] + "]<br>" + arr[1] + "<br>";
            }
            else
            {
               fa.htmlText += "<br>" + str + "<br>";
            }
            fa1.htmlText += value.node[i].@level + "<br><br>";
            fa3.htmlText += value.node[i].@party + "<br><br>";
            i++;
         }
         fa.htmlText += "</textformat>";
         fa1.htmlText += "</textformat>";
         fa3.htmlText += "</textformat>";
      }
   }
}

