package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.manager.KeyboardManager;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class YNzhuadayuPanel extends FPanel
   {
      
      public static const YN_ZHUADAYUPANEL_QINGQIUZHUAYU_CLICK:String = "YN_ZHUADAYUPANEL_QINGQIUZHUAYU_CLICK";
      
      public static const YN_ZHUADAYUPANEL_QINGQIULINGJIANG_CLICK:String = "YN_ZHUADAYUPANEL_QINGQIULINGJIANG_CLICK";
      
      private var time:Timer;
      
      private var loading:MovieClip;
      
      private var loadSpr:Sprite;
      
      private var btn:SecondButton;
      
      private var index:int = 0;
      
      private var ft:FTextArea;
      
      private var ftCount:FTextArea;
      
      public function YNzhuadayuPanel()
      {
         super();
         width = 645;
         height = 500;
         titleText = LanResManager.getLanCommonTextWords("抓大鱼");
         dragAble = true;
         showCloseButton = true;
         skin = "panel";
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc1_:DisplayObject = null;
         _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/ynYurenjie/yuBg.swf");
         _loc1_.x = 9;
         _loc1_.y = 0;
         addChild(_loc1_);
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 10;
         this.ft.textColor = StaticValue.BlUE20;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("越南抓大鱼面板内活动说明介绍文字");
         this.ft.width = 595;
         this.ft.height = 45;
         this.ft.wordWrap = true;
         addChild(this.ft);
         this.ftCount = new FTextArea();
         this.ftCount.x = 255;
         this.ftCount.y = 360;
         this.ftCount.htmlText = "抓鱼次数：1/100";
         this.ftCount.width = 200;
         addChild(this.ftCount);
         this.btn = new SecondButton();
         this.btn.x = 140 + 150;
         this.btn.y = 85 + 345;
         this.btn.label = LanResManager.getLanCommonTextWords("抓鱼");
         this.btn.name = "1";
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn.enabled = true;
         addChild(this.btn);
         this.loadSpr = new Sprite();
         this.loadSpr.x = 160;
         this.loadSpr.y = 380;
         addChild(this.loadSpr);
         this.Addloaderbar();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(param1.target.name == 1)
         {
            if(this.time)
            {
               this.time = null;
            }
            this.time = new Timer(1000,10);
            this.time.addEventListener(TimerEvent.TIMER,this.onTimer);
            this.time.start();
            GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = false;
            KeyboardManager.enable = false;
            this.btn.enabled = false;
         }
         else
         {
            dispatchEvent(new BaseEvent(YN_ZHUADAYUPANEL_QINGQIULINGJIANG_CLICK));
            this.btn.enabled = false;
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         if(this.index >= 0)
         {
            ++this.index;
         }
         this.loaderbar(this.index * 10);
         if(this.index >= 10)
         {
            this.index = 0;
            this.time.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this.time.stop();
            this.time = null;
            dispatchEvent(new BaseEvent(YN_ZHUADAYUPANEL_QINGQIUZHUAYU_CLICK));
            GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = true;
            KeyboardManager.enable = true;
         }
      }
      
      private function Addloaderbar() : void
      {
         if(Boolean(this.loading) && this.loading.parent != null)
         {
            this.loading.parent.removeChild(this.loading);
         }
         LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/ynYurenjie/loadingbar.swf",function(param1:MovieClip):*
         {
            if(param1)
            {
               loading = param1;
               loading.gotoAndStop(0);
               loadSpr.addChild(loading);
            }
         });
      }
      
      private function loaderbar(param1:int) : void
      {
         if(this.loading != null)
         {
            this.loading.gotoAndStop(param1);
         }
      }
      
      public function setData(param1:int, param2:int, param3:Boolean, param4:Boolean) : void
      {
         this.ftCount.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\' size=\'14\'>" + LanResManager.getLanCommonTextWords("抓鱼次数：") + "</font><font size=\'14\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "/" + param2 + "</font>";
         if(param3)
         {
            if(param4)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("已领奖");
               this.btn.enabled = false;
            }
            else
            {
               this.btn.label = LanResManager.getLanCommonTextWords("领奖");
               this.btn.name = "2";
               if(param1 == 100)
               {
                  this.btn.enabled = true;
               }
               else
               {
                  this.btn.enabled = false;
               }
            }
         }
         else
         {
            this.btn.label = LanResManager.getLanCommonTextWords("抓鱼");
            this.btn.name = "1";
            this.btn.enabled = true;
         }
      }
   }
}

