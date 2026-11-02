package com.tgame.shell.view.components.mainui
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.ReloginManager;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class Target extends Sprite
   {
      
      private var head:Bitmap;
      
      public var redBar:ColorBar;
      
      public var blueBar:ColorBar;
      
      public var yellowBar:ColorBar;
      
      public var charName:FTextArea;
      
      public var level:FTextArea;
      
      private var viewBtn:FSimpleButton;
      
      private var tradingBtn:FSimpleButton;
      
      private var friendBtn:FSimpleButton;
      
      private var teamBtn:FSimpleButton;
      
      private var chatBtn:FSimpleButton;
      
      private var moreBtn:FSimpleButton;
      
      public var menuCanvas:FCanvas;
      
      private var menuList:FList;
      
      private var tip:FTextArea;
      
      public function Target()
      {
         super();
         this.menuCanvas = new FCanvas();
         this.menuCanvas.skin = "backGroud";
         addChild(this.menuCanvas);
         this.menuCanvas.visible = false;
         this.menuList = new FList();
         this.menuList.skin = "menuList";
         this.menuCanvas.addChild(this.menuList);
         this.menuList.x = 2;
         this.menuList.y = 2;
         this.menuList.listWidth = 60;
         this.menuList.dataProvider = <list>
															 <node label={LanResManager.getLanCommonTextWords("帮邀")} id="1"/>
															 <node label={LanResManager.getLanCommonTextWords("赠花")} id="2"/>
															 <node label={LanResManager.getLanCommonTextWords("求婚")} id="3"/>
															 <node label={LanResManager.getLanCommonTextWords("看摊")} id="4"/>
															 <node label={LanResManager.getLanCommonTextWords("双修")} id="5"/>
															 <node label={LanResManager.getLanCommonTextWords("疗伤")} id="7"/>
															 <node label={LanResManager.getLanCommonTextWords("成就对比")} id="6"/>
															 <node label={LanResManager.getLanCommonTextWords("禁言")} id="8"/>
														</list>;
         this.menuList.addEventListener(MouseEvent.CLICK,this.onList);
         this.menuCanvas.width = this.menuList.width + 4;
         this.menuCanvas.height = this.menuList.height + 4;
         this.redBar = new ColorBar(1,122,7);
         addChild(this.redBar);
         this.redBar.x = 50;
         this.redBar.y = 23;
         this.blueBar = new ColorBar(2,122,7);
         addChild(this.blueBar);
         this.blueBar.x = 50;
         this.blueBar.y = 33;
         this.yellowBar = new ColorBar(4,122,7);
         addChild(this.yellowBar);
         this.yellowBar.x = 50;
         this.yellowBar.y = 43;
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 50;
            y = 55;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
         }
         addChild(this.tip);
         this.redBar.setValue(812345679,987654321);
         this.blueBar.setValue(100,100);
         this.yellowBar.setValue(100,100);
         addChild(StaticValue.getMCByClassName("ui.main.head"));
         this.charName = new FTextArea();
         with(this.charName)
         {
            filters = StaticValue.filter;
            width = 130;
            height = 20;
            x = 50;
            y = 2;
            defaultTextFormat = new TextFormat(null,null,16777215,true,null,null,null,null,"center");
            text = "";
         }
         addChild(this.charName);
         this.level = new FTextArea();
         with(this.level)
         {
            filters = StaticValue.filter;
            width = 50;
            height = 18;
            x = 180;
            y = 2;
            defaultTextFormat = new TextFormat(null,12,StaticValue.ORANGE,true,null,null,null,null,"center");
            text = "LV:100";
         }
         addChild(this.level);
         this.viewBtn = new FSimpleButton();
         this.viewBtn.skin = "target-view";
         this.viewBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("查看信息") + "</font>";
         addChild(this.viewBtn);
         this.viewBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tradingBtn = new FSimpleButton();
         this.tradingBtn.skin = "target-trading";
         this.tradingBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("邀请交易") + "</font>";
         addChild(this.tradingBtn);
         this.tradingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.friendBtn = new FSimpleButton();
         this.friendBtn.skin = "target-friend";
         this.friendBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("加为好友") + "</font>";
         addChild(this.friendBtn);
         this.friendBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.teamBtn = new FSimpleButton();
         this.teamBtn.skin = "target-team";
         this.teamBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("邀请组队") + "</font>";
         addChild(this.teamBtn);
         this.teamBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.chatBtn = new FSimpleButton();
         this.chatBtn.skin = "target-chat";
         this.chatBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("发送私聊信息") + "</font>";
         addChild(this.chatBtn);
         this.chatBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.moreBtn = new FSimpleButton();
         this.moreBtn.skin = "menu-more";
         this.moreBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("展开更多操作") + "</font>";
         addChild(this.moreBtn);
         this.moreBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.viewBtn.x = 31;
         this.viewBtn.y = 56;
         this.tradingBtn.x = this.viewBtn.x + this.viewBtn.width + 2;
         this.tradingBtn.y = 56;
         this.friendBtn.x = this.tradingBtn.x + this.tradingBtn.width + 2;
         this.friendBtn.y = 56;
         this.teamBtn.x = this.friendBtn.x + this.friendBtn.width + 2;
         this.teamBtn.y = 56;
         this.chatBtn.x = this.teamBtn.x + this.teamBtn.width + 2;
         this.chatBtn.y = 56;
         this.moreBtn.x = this.chatBtn.x + this.chatBtn.width + 2;
         this.moreBtn.y = 56;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Event = null;
         switch(param1.target)
         {
            case this.viewBtn:
               _loc2_ = new Event(MainUI.TARGET_VIEWBTN_CLICK);
               parent.dispatchEvent(_loc2_);
               break;
            case this.tradingBtn:
               _loc2_ = new Event(MainUI.TARGET_TRADINGBTN_CLICK);
               parent.dispatchEvent(_loc2_);
               break;
            case this.friendBtn:
               _loc2_ = new Event(MainUI.TARGET_FRIENDBTN_CLICK);
               parent.dispatchEvent(_loc2_);
               break;
            case this.teamBtn:
               _loc2_ = new Event(MainUI.TARGET_TEAMBTN_CLICK);
               parent.dispatchEvent(_loc2_);
               break;
            case this.chatBtn:
               _loc2_ = new Event(MainUI.TARGET_CHATBTN_CLICK);
               parent.dispatchEvent(_loc2_);
               break;
            case this.moreBtn:
               this.menuCanvas.visible = !this.menuCanvas.visible;
               this.menuCanvas.x = this.moreBtn.x;
               this.menuCanvas.y = this.moreBtn.y + this.moreBtn.height;
         }
      }
      
      private function onList(param1:MouseEvent) : void
      {
         switch(this.menuList.selectItem.id)
         {
            case "1":
               parent.dispatchEvent(new BaseEvent(MainUI.TARGET_PARTY_INVITE_CLICK));
               break;
            case "2":
               parent.dispatchEvent(new BaseEvent(MainUI.TARGET_LARGESS_FLOWER_CLICK));
               break;
            case "3":
               parent.dispatchEvent(new BaseEvent(MainUI.TARGET_COURTSHIP_CLICK));
               break;
            case "4":
               parent.dispatchEvent(new BaseEvent(MainUI.TARGET_LOOK_SHOP_CLICK));
               break;
            case "5":
               parent.dispatchEvent(new BaseEvent(MainUI.TARGET_SHUANGXIU_CLICK));
               break;
            case "6":
               parent.dispatchEvent(new BaseEvent(MainUI.TARGET_CHENGJIU_CLICK));
               break;
            case "7":
               parent.dispatchEvent(new BaseEvent(MainUI.TARGET_LIAOSHANG_CLICK));
               break;
            case "8":
               parent.dispatchEvent(new BaseEvent(MainUI.TARGET_JINYAN_CLICK));
               break;
            case "9":
               parent.dispatchEvent(new BaseEvent(MainUI.TARGET_QICHENG_CLICK));
         }
         this.menuCanvas.visible = false;
      }
      
      public function set isNPC(param1:Boolean) : void
      {
         this.viewBtn.visible = this.tradingBtn.visible = this.friendBtn.visible = this.teamBtn.visible = this.chatBtn.visible = this.moreBtn.visible = !param1;
         this.tip.visible = param1;
         if(ReloginManager.isInKuafu)
         {
            this.viewBtn.enabled = false;
         }
         else
         {
            this.viewBtn.enabled = true;
         }
      }
      
      public function setMonsterTypeTip(param1:String) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         this.tip.htmlText = param1;
      }
      
      public function setHead(param1:Bitmap) : void
      {
         if(this.head != null && this.head.parent != null)
         {
            this.head.parent.removeChild(this.head);
         }
         this.head = param1;
         this.head.x = 5;
         this.head.y = 5;
         addChild(this.head);
      }
      
      public function setShowButton(param1:Boolean) : *
      {
         this.viewBtn.visible = this.tradingBtn.visible = this.friendBtn.visible = this.teamBtn.visible = this.chatBtn.visible = this.moreBtn.visible = param1;
      }
      
      public function setBtnStatus(param1:Boolean) : *
      {
         this.tradingBtn.enabled = !param1;
         this.friendBtn.enabled = !param1;
         this.moreBtn.enabled = !param1;
         if(param1)
         {
            this.tradingBtn.filters = Tools.darkFilter;
            this.friendBtn.filters = Tools.darkFilter;
            this.moreBtn.filters = Tools.darkFilter;
         }
         else
         {
            this.tradingBtn.filters = [];
            this.friendBtn.filters = [];
            this.moreBtn.filters = [];
         }
      }
      
      public function setMoreList(param1:Boolean) : void
      {
         if(param1)
         {
            this.menuList.dataProvider = <list>
					 <node label={LanResManager.getLanCommonTextWords("帮邀")} id="1"/>
					 <node label={LanResManager.getLanCommonTextWords("赠花")} id="2"/>
					 <node label={LanResManager.getLanCommonTextWords("求婚")} id="3"/>
					 <node label={LanResManager.getLanCommonTextWords("看摊")} id="4"/>
					 <node label={LanResManager.getLanCommonTextWords("双修")} id="5"/>
					 <node label={LanResManager.getLanCommonTextWords("疗伤")} id="7"/>
					 <node label={LanResManager.getLanCommonTextWords("成就对比")} id="6"/>
				</list>;
         }
         else
         {
            this.menuList.dataProvider = <list>
					 <node label={LanResManager.getLanCommonTextWords("帮邀")} id="1"/>
					 <node label={LanResManager.getLanCommonTextWords("赠花")} id="2"/>
					 <node label={LanResManager.getLanCommonTextWords("求婚")} id="3"/>
					 <node label={LanResManager.getLanCommonTextWords("看摊")} id="4"/>
					 <node label={LanResManager.getLanCommonTextWords("双修")} id="5"/>
					 <node label={LanResManager.getLanCommonTextWords("疗伤")} id="7"/>
					 <node label={LanResManager.getLanCommonTextWords("成就对比")} id="6"/>
				</list>;
         }
         this.menuCanvas.width = this.menuList.width + 4;
         this.menuCanvas.height = this.menuList.height + 4;
      }
   }
}

