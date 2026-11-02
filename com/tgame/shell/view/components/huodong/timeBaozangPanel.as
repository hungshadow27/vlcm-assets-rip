package com.tgame.shell.view.components.huodong
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.text.*;
   import flash.utils.Timer;
   
   public class timeBaozangPanel extends FPanel
   {
      
      public static const UI_TIMEBAOZANG_DUIHUAN_CLICK:String = "UI_TIMEBAOZANG_DUIHUAN_CLICK";
      
      public static const UI_TIMEBAOZANG_CLOSE_CLICK:String = "UI_TIMEBAOZANG_CLOSE_CLICK";
      
      private var goodsList:FList;
      
      private var scroll:FVScorllBar;
      
      private var bgCanvas:FCanvas;
      
      private var countDownLb:FLabel;
      
      private var myTimer:Timer;
      
      private var Ti:int;
      
      private var ft1:FTextArea;
      
      public function timeBaozangPanel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 624;
         height = 441;
         titleText = "";
         addEventListener(FCloseEvent.CLOSE,this.onClosePanel);
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 7;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 610;
         this.bgCanvas.height = 369;
         this.bgCanvas.skin = "box";
         addChild(this.bgCanvas);
         this.goodsList = new FList();
         this.goodsList.skin = "list";
         this.goodsList.listWidth = 591;
         this.goodsList.listHeight = 364;
         this.goodsList.itemRenderer = new TimeBaozangGoodsListRander();
         addChild(this.goodsList);
         this.goodsList.x = 7;
         this.goodsList.y = 2;
         this.scroll = new FVScorllBar(this.goodsList,364);
         addChild(this.scroll);
         this.scroll.x = 598;
         this.scroll.y = 2;
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 140;
            y = 375;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.ft1);
         TimeBaozangGoodsListRander.$parent = this;
         this.countDownLb = new FLabel();
         with(this.countDownLb)
         {
            x = 10;
            y = 375;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.countDownLb);
         this.myTimer = new Timer(1000);
         this.myTimer.addEventListener(TimerEvent.TIMER,this.countDownFun);
      }
      
      public function onClosePanel(param1:FCloseEvent = null) : void
      {
         dispatchEvent(new Event(UI_TIMEBAOZANG_CLOSE_CLICK));
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function closePanel() : void
      {
         this.myTimer.stop();
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function countDownFun(param1:TimerEvent) : void
      {
         --this.Ti;
         this.countDownLb.text = "【" + LanResManager.getLanCommonTextWords("剩余时间") + "：" + int(this.Ti / 60) + LanResManager.getLanCommonTextWords("分") + int(this.Ti % 60) + LanResManager.getLanCommonTextWords("秒") + "】";
         this.ft1.htmlText = LanResManager.getLanCommonTextWords("此面板将在剩余时间结束后关闭");
         if(this.Ti == 0)
         {
            this.onClosePanel();
         }
      }
      
      public function setTime(param1:int) : void
      {
         this.Ti = param1;
         this.myTimer.stop();
         this.myTimer.reset();
         this.myTimer.repeatCount = this.Ti;
         this.myTimer.start();
      }
      
      public function setList(param1:XML) : void
      {
         this.goodsList.dataProvider = param1;
         this.scroll.update();
      }
   }
}

