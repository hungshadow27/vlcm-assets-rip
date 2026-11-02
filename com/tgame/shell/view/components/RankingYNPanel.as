package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.rankinglist.ynRankingListRanader;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class RankingYNPanel extends FPanel
   {
      
      public static const REQUEST_YN_XINFURANKING:String = "REQUEST_YN_XINFURANKING";
      
      public static const REQUEST_YN_RANKING_JIANGLI:String = "REQUEST_YN_RANKING_JIANGLI";
      
      public var tabBar:FTabBar;
      
      private var rankList:FList;
      
      private var homePageBtn:SmallButton;
      
      private var endPageBtn:SmallButton;
      
      private var preBtn:FSimpleButton;
      
      private var nextBtn:FSimpleButton;
      
      private var pageCount:FTextArea;
      
      private var type:int;
      
      private var page:int;
      
      private var all:int;
      
      private var okBtn:SecondButton;
      
      private var box:FCanvas;
      
      private var bt_bit:Bitmap;
      
      private var ft:FTextArea;
      
      private var line:DisplayObject;
      
      private var dayFt:FTextArea;
      
      private var playerNoFt:FTextArea;
      
      public function RankingYNPanel()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 400;
         height = 345;
         titleText = LanResManager.getLanCommonTextWords("排行榜");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var bitline:Bitmap = null;
         this.box = new FCanvas();
         this.box.skin = "box_transparence";
         this.box.x = 10;
         this.box.y = 25;
         this.box.width = 380;
         this.box.height = 230 + 17;
         addChild(this.box);
         this.bt_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         this.bt_bit.x = 12;
         this.bt_bit.y = 25;
         this.bt_bit.width = 378;
         this.bt_bit.height = 24;
         addChild(this.bt_bit);
         bitline = new Bitmap();
         bitline = StaticValue.getBitmapByClassName("ui.line");
         bitline.x = 4;
         bitline.y = 24;
         bitline.width = 370;
         addChild(bitline);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 78;
         this.line.y = 27;
         addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 220;
         this.line.y = 27;
         addChild(this.line);
         this.ft = new FTextArea();
         this.ft.x = 30;
         this.ft.y = 25;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.width = 400;
         addChild(this.ft);
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("战斗力"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("等级"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("成就"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("境界"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.rankList = new FList();
         this.rankList.skin = "list";
         this.rankList.listWidth = 380;
         this.rankList.listHeight = 220;
         this.rankList.itemRenderer = new ynRankingListRanader();
         addChild(this.rankList);
         this.rankList.x = 12;
         this.rankList.y = 48;
         this.homePageBtn = new SmallButton();
         this.homePageBtn.label = LanResManager.getLanCommonTextWords("首页");
         addChild(this.homePageBtn);
         this.homePageBtn.x = 30;
         this.homePageBtn.y = 275;
         this.homePageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         addChild(this.preBtn);
         this.preBtn.x = this.homePageBtn.x + 42;
         this.preBtn.y = this.homePageBtn.y + 2;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pageCount = new FTextArea();
         with(this.pageCount)
         {
            x = preBtn.x + 20;
            y = homePageBtn.y;
            textColor = StaticValue.WHITE;
            text = "1/1";
         }
         addChild(this.pageCount);
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = this.pageCount.x + 29;
         this.nextBtn.y = this.homePageBtn.y + 2;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.endPageBtn = new SmallButton();
         this.endPageBtn.label = LanResManager.getLanCommonTextWords("尾页");
         addChild(this.endPageBtn);
         this.endPageBtn.x = this.nextBtn.x + 25;
         this.endPageBtn.y = this.homePageBtn.y;
         this.endPageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.okBtn = new SecondButton();
         this.okBtn.x = 315 + 15;
         this.okBtn.y = 275;
         this.okBtn.label = LanResManager.getLanCommonTextWords("领取奖励");
         addChild(this.okBtn);
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.dayFt = new FTextArea();
         this.dayFt.x = 225 + 25;
         this.dayFt.y = 5;
         this.dayFt.width = 160;
         addChild(this.dayFt);
         this.playerNoFt = new FTextArea();
         this.playerNoFt.x = 190;
         this.playerNoFt.y = 275;
         this.playerNoFt.width = 145;
         addChild(this.playerNoFt);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.homePageBtn:
               dispatchEvent(new BaseEvent(REQUEST_YN_XINFURANKING,"",[this.type,1]));
               break;
            case this.preBtn:
               dispatchEvent(new BaseEvent(REQUEST_YN_XINFURANKING,"",[this.type,this.page - 1]));
               break;
            case this.nextBtn:
               dispatchEvent(new BaseEvent(REQUEST_YN_XINFURANKING,"",[this.type,this.page + 1]));
               break;
            case this.endPageBtn:
               dispatchEvent(new BaseEvent(REQUEST_YN_XINFURANKING,"",[this.type,this.all]));
               break;
            case this.okBtn:
               dispatchEvent(new BaseEvent(REQUEST_YN_RANKING_JIANGLI,"",this.type));
         }
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("战斗力"):
               this.type = 1;
               dispatchEvent(new BaseEvent(REQUEST_YN_XINFURANKING,"",[this.type,1]));
               break;
            case LanResManager.getLanCommonTextWords("等级"):
               this.type = 2;
               dispatchEvent(new BaseEvent(REQUEST_YN_XINFURANKING,"",[this.type,1]));
               break;
            case LanResManager.getLanCommonTextWords("成就"):
               this.type = 3;
               dispatchEvent(new BaseEvent(REQUEST_YN_XINFURANKING,"",[this.type,1]));
               break;
            case LanResManager.getLanCommonTextWords("境界"):
               this.type = 4;
               dispatchEvent(new BaseEvent(REQUEST_YN_XINFURANKING,"",[this.type,1]));
         }
      }
      
      public function setListData(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int, param7:XML) : void
      {
         this.page = param3;
         this.all = param4;
         this.pageCount.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param3 + "/" + param4 + "</font>";
         this.rankList.dataProvider = param7;
         var _loc8_:String = "";
         if(param6 == 0)
         {
            _loc8_ = LanResManager.getLanCommonTextWords("未上榜");
         }
         else
         {
            _loc8_ = param6.toString();
         }
         this.playerNoFt.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前排名：") + _loc8_ + "</font>";
         this.dayFt.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("开服天数：") + param2 + LanResManager.getLanCommonTextWords("天") + "</font>";
         if(param3 == 1)
         {
            this.homePageBtn.enabled = false;
            this.preBtn.enabled = false;
         }
         else
         {
            this.homePageBtn.enabled = true;
            this.preBtn.enabled = true;
         }
         if(param3 == param4)
         {
            this.nextBtn.enabled = false;
            this.endPageBtn.enabled = false;
         }
         else
         {
            this.nextBtn.enabled = true;
            this.endPageBtn.enabled = true;
         }
         if(param5)
         {
            this.okBtn.enabled = true;
         }
         else
         {
            this.okBtn.enabled = false;
         }
         if(param1 == 1)
         {
            this.ft.text = LanResManager.getLanCommonTextWords("排名                      玩家名称                                 战斗力值");
         }
         else if(param1 == 2)
         {
            this.ft.text = LanResManager.getLanCommonTextWords("排名                      玩家名称                                 等级");
         }
         else if(param1 == 3)
         {
            this.ft.text = LanResManager.getLanCommonTextWords("排名                      玩家名称                                 成就");
         }
         else if(param1 == 4)
         {
            this.ft.text = LanResManager.getLanCommonTextWords("排名                      玩家名称                                 境界");
         }
      }
   }
}

