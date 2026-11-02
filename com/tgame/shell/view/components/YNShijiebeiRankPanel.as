package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.ynShijiebei.YNshijiebeiRankRender;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class YNShijiebeiRankPanel extends FPanel
   {
      
      public static const UI_WORLDCUP_RANK_PRE:String = "UI_WORLDCUP_RANK_PRE";
      
      public static const UI_WORLDCUP_RANK_NEXT:String = "UI_WORLDCUP_RANK_NEXT";
      
      public static const UI_WORLDCUP_RANK_JIANGLIPANEL:String = "UI_WORLDCUP_RANK_JIANGLIPANEL";
      
      public static const UI_WORLDCUP_RANK_LINGJIANG:String = "UI_WORLDCUP_RANK_LINGJIANG";
      
      public static const UI_REQUEST_RANK:String = "UI_REQUEST_RANK";
      
      private var ft:FTextArea;
      
      private var btnNext:SecondButton;
      
      private var btnPre:SecondButton;
      
      private var ftPage:FTextArea;
      
      private var btnLingqu:SecondButton;
      
      private var btnJiangli:SecondButton;
      
      private var list1:FList;
      
      private var list2:FList;
      
      private var list3:FList;
      
      private var line:Bitmap;
      
      private var ftTime:FTextArea;
      
      private var t:int = -1;
      
      private var tab:FTabBar;
      
      private var page:int = 0;
      
      public function YNShijiebeiRankPanel()
      {
         super();
         this.titleText = LanResManager.getLanCommonTextWords("世界杯排行榜");
         this.showCloseButton = true;
         this.skin = "panel_btn";
         this.dragAble = true;
         width = 320;
         height = 420 + 22;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      public function onClose(param1:FCloseEvent = null) : *
      {
         if(this.parent != null)
         {
            if(Fun.isVisible(GameInstance.uiInstance.ynshijiebeijiangliPanel))
            {
               GameInstance.uiInstance.uiContainer.removeChild(GameInstance.uiInstance.ynshijiebeijiangliPanel);
            }
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc1_:Bitmap = null;
         this.tab = new FTabBar();
         this.tab.x = 10;
         this.tab.y = 2;
         addChild(this.tab);
         _loc1_ = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         _loc1_.x = 10;
         _loc1_.y = 5 + 22;
         _loc1_.width = 240 + 60;
         _loc1_.height = 24;
         addChild(_loc1_);
         this.ft = new FTextArea();
         this.ft.text = LanResManager.getLanCommonTextWords("排名");
         this.ft.textColor = StaticValue.BlUE20;
         this.ft.filters = StaticValue.filter;
         this.ft.x = 25;
         this.ft.y = 8 + 22;
         this.ft.width = this.ft.textWidth + 10;
         this.ft.height = 25;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.text = LanResManager.getLanCommonTextWords("玩家名称");
         this.ft.textColor = StaticValue.BlUE20;
         this.ft.filters = StaticValue.filter;
         this.ft.x = 70 + 40;
         this.ft.y = 8 + 22;
         this.ft.width = this.ft.textWidth + 10;
         this.ft.height = 25;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.text = LanResManager.getLanCommonTextWords("数量");
         this.ft.textColor = StaticValue.BlUE20;
         this.ft.filters = StaticValue.filter;
         this.ft.x = 180 + 70;
         this.ft.y = 8 + 22;
         this.ft.width = this.ft.textWidth + 10;
         this.ft.height = 25;
         addChild(this.ft);
         this.list1 = new FList();
         this.list1.itemRenderer = new YNshijiebeiRankRender();
         this.list1.x = 12;
         this.list1.y = 28 + 22;
         this.list1.listWidth = 235 + 60;
         this.list1.listHeight = 250;
         this.list1.skin = "list";
         addChild(this.list1);
         this.list1.mouseChildren = false;
         this.list2 = new FList();
         this.list2.itemRenderer = new YNshijiebeiRankRender();
         this.list2.x = 12;
         this.list2.y = 28 + 22;
         this.list2.listWidth = 235 + 60;
         this.list2.listHeight = 250;
         this.list2.skin = "list";
         addChild(this.list2);
         this.list2.mouseChildren = false;
         this.list2.visible = false;
         this.list3 = new FList();
         this.list3.itemRenderer = new YNshijiebeiRankRender();
         this.list3.x = 12;
         this.list3.y = 28 + 22;
         this.list3.listWidth = 235 + 60;
         this.list3.listHeight = 250;
         this.list3.skin = "list";
         addChild(this.list3);
         this.list3.mouseChildren = false;
         this.list3.visible = false;
         this.btnPre = new SecondButton();
         this.btnPre.x = 50 + 30;
         this.btnPre.y = 280 + 22;
         this.btnPre.label = LanResManager.getLanCommonTextWords("上一页");
         this.btnPre.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnPre);
         this.ftPage = new FTextArea();
         this.ftPage.x = 110 + 30;
         this.ftPage.y = 280 + 22;
         this.ftPage.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>1/1</font>";
         addChild(this.ftPage);
         this.ftPage.width = 100;
         this.ftPage.height = 20;
         this.btnNext = new SecondButton();
         this.btnNext.x = 135 + 30;
         this.btnNext.y = 280 + 22;
         this.btnNext.label = LanResManager.getLanCommonTextWords("下一页");
         this.btnNext.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnNext);
         this.line = new Bitmap();
         this.line = StaticValue.getBitmapByClassName("ui.line");
         this.line.x = 10;
         this.line.y = 307 + 22;
         this.line.width = 240 + 60;
         addChild(this.line);
         this.ftTime = new FTextArea();
         this.ftTime.textColor = StaticValue.GREEN;
         this.ftTime.filters = StaticValue.filter;
         this.ftTime.x = 15;
         this.ftTime.y = 310 + 22;
         this.ftTime.wordWrap = true;
         this.ftTime.width = 230 + 60;
         this.ftTime.height = 35;
         addChild(this.ftTime);
         this.btnLingqu = new SecondButton();
         this.btnLingqu.x = 30 + 30;
         this.btnLingqu.y = 355 + 22;
         this.btnLingqu.label = LanResManager.getLanCommonTextWords("领取奖励");
         this.btnLingqu.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnLingqu);
         this.btnJiangli = new SecondButton();
         this.btnJiangli.x = 150 + 30;
         this.btnJiangli.y = 355 + 22;
         this.btnJiangli.label = LanResManager.getLanCommonTextWords("查看奖励");
         this.btnJiangli.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnJiangli);
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch(param1.target.label)
         {
            case LanResManager.getLanCommonTextWords("足球排行榜"):
               dispatchEvent(new BaseEvent(UI_REQUEST_RANK,"",1));
               break;
            case LanResManager.getLanCommonTextWords("狮子排行榜"):
               dispatchEvent(new BaseEvent(UI_REQUEST_RANK,"",2));
               break;
            case LanResManager.getLanCommonTextWords("狮子每日排行榜"):
               dispatchEvent(new BaseEvent(UI_REQUEST_RANK,"",3));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnNext:
               dispatchEvent(new BaseEvent(UI_WORLDCUP_RANK_NEXT,"",[this.t,this.page + 1]));
               break;
            case this.btnPre:
               dispatchEvent(new BaseEvent(UI_WORLDCUP_RANK_PRE,"",[this.t,this.page - 1]));
               break;
            case this.btnJiangli:
               dispatchEvent(new BaseEvent(UI_WORLDCUP_RANK_JIANGLIPANEL,"",this.t));
               break;
            case this.btnLingqu:
               dispatchEvent(new BaseEvent(UI_WORLDCUP_RANK_LINGJIANG,"",this.t));
         }
      }
      
      public function setList(param1:int, param2:XML) : void
      {
         this.t = param1;
         this["list" + param1].dataProvider = param2;
         this.tab.removeAllButton();
         switch(this.t)
         {
            case 1:
               this.list1.visible = true;
               this.list2.visible = false;
               this.list3.visible = false;
               this.tab.addButton(LanResManager.getLanCommonTextWords("足球排行榜"),this.onTabClick);
               break;
            case 2:
               this.list1.visible = false;
               this.list2.visible = true;
               this.list3.visible = false;
               this.tab.addButton(LanResManager.getLanCommonTextWords("狮子排行榜"),this.onTabClick);
               this.tab.addButton(LanResManager.getLanCommonTextWords("狮子每日排行榜"),this.onTabClick);
               break;
            case 3:
               this.list1.visible = false;
               this.list2.visible = false;
               this.list3.visible = true;
               this.tab.addButton(LanResManager.getLanCommonTextWords("狮子排行榜"),this.onTabClick);
               this.tab.addButton(LanResManager.getLanCommonTextWords("狮子每日排行榜"),this.onTabClick);
         }
         var _loc3_:Array = ["",LanResManager.getLanCommonTextWords("足球排行榜"),LanResManager.getLanCommonTextWords("狮子排行榜"),LanResManager.getLanCommonTextWords("狮子每日排行榜")];
         this.tab.setCurrentButtonByLabel(_loc3_[param1]);
      }
      
      public function setData(param1:int, param2:int, param3:int, param4:String = "") : void
      {
         this.t = param1;
         if(param2 == 0)
         {
            param2 = 1;
         }
         if(param3 == 0)
         {
            param3 = 1;
         }
         this.page = param2;
         if(param2 <= 1)
         {
            this.btnPre.enabled = false;
         }
         else
         {
            this.btnPre.enabled = true;
         }
         if(param2 == param3 || param3 == 0)
         {
            this.btnNext.enabled = false;
         }
         else
         {
            this.btnNext.enabled = true;
         }
         this.ftPage.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + String(param2) + "/" + String(param3) + "</font>";
         if(param1 == 1)
         {
            this.titleText = LanResManager.getLanCommonTextWords("MIK足球排行榜");
            this.ftTime.htmlText = LanResManager.getLanCommonTextWords("MIK足球排行榜截止2015年6月18号23点50分,排行前10名的玩家可领取奖励.");
         }
         else if(param1 == 2)
         {
            this.titleText = LanResManager.getLanCommonTextWords("狮子排行榜");
            this.ftTime.htmlText = LanResManager.getLanCommonTextWords("狮子排行榜截止2015年6月18号23点50分,排行前10名的玩家可领取奖励.");
         }
         else if(param1 == 3)
         {
            this.titleText = LanResManager.getLanCommonTextWords("狮子每日排行榜");
            this.ftTime.htmlText = LanResManager.getLanCommonTextWords("狮子每日排行榜") + "：" + param4 + LanResManager.getLanCommonTextWords("排行前3名的玩家可领取奖励");
         }
      }
   }
}

