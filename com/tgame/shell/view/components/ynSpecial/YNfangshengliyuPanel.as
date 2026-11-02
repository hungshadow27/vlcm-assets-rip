package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.manager.KeyboardManager;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class YNfangshengliyuPanel extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var btn:SecondButton;
      
      private var index:int = 0;
      
      private var time:Timer;
      
      private var loading:MovieClip;
      
      private var loadSpr:Sprite;
      
      public function YNfangshengliyuPanel()
      {
         super();
         width = 340;
         height = 380;
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("放生");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function init() : void
      {
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/yu/bg.swf");
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         this.ft = new FTextArea();
         this.ft.x = 60;
         this.ft.y = 10;
         this.ft.wordWrap = true;
         this.ft.multiline = true;
         this.ft.width = 220;
         this.ft.height = 80;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("我是放生鲤鱼面板的描述");
         this.ft.textColor = StaticValue.YELLOW;
         addChild(this.ft);
         this.btn = new SecondButton();
         this.btn.x = 150;
         this.btn.y = 30;
         this.btn.label = LanResManager.getLanCommonTextWords("放生");
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn.enabled = true;
         addChild(this.btn);
         this.loadSpr = new Sprite();
         this.loadSpr.x = 77;
         this.loadSpr.y = 215;
         addChild(this.loadSpr);
         _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/yu/word.swf");
         _loc1_.x = 70;
         _loc1_.y = 250 - 110;
         addChild(_loc1_);
         this.Addloaderbar();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.time)
         {
            this.time = null;
         }
         this.time = new Timer(1000,60);
         this.time.addEventListener(TimerEvent.TIMER,this.onTimer);
         this.time.start();
         GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = false;
         KeyboardManager.enable = false;
         this.btn.enabled = false;
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         if(this.index >= 0)
         {
            ++this.index;
         }
         this.loaderbar(this.index);
         if(this.index >= 60)
         {
            this.index = 0;
            this.time.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this.time.stop();
            this.time = null;
            PipeManager.sendMsg(PipeConstants.SEND_53095,[54]);
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
         LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/yu/loadingbar.swf",function(param1:MovieClip):*
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
      
      public function setBtn(param1:Boolean) : void
      {
         this.btn.enabled = param1;
      }
   }
}

