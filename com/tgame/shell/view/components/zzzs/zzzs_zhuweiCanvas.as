package com.tgame.shell.view.components.zzzs
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.ZhiZhanZhiShangPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class zzzs_zhuweiCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var bitRed:Bitmap;
      
      private var bitBlue:Bitmap;
      
      private var ft:FTextArea;
      
      private var ftRed:FTextArea;
      
      private var ftBlue:FTextArea;
      
      private var btnRed:SecondButton;
      
      private var btnBlue:SecondButton;
      
      private var fc:FCanvas;
      
      private var gongImg:DisplayObject;
      
      private var bx:FCanvas;
      
      private var gongMc1:MovieClip;
      
      private var gongMc2:MovieClip;
      
      private var gongMcSprRed:Sprite;
      
      private var gongMcSprBlue:Sprite;
      
      public function zzzs_zhuweiCanvas()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         if(this.gongImg != null && this.gongImg.parent != null)
         {
            removeChild(this.gongImg);
         }
         this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/zhizhanzhishang/zhuwei.swf",590,342);
         this.gongImg.x = 0;
         this.gongImg.y = 0;
         addChild(this.gongImg);
         this.fc = new FCanvas();
         this.fc.x = 0;
         this.fc.y = 2;
         this.fc.width = 590;
         this.fc.height = 340;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.ft = new FTextArea();
         this.ft.x = 80 - 20;
         this.ft.y = 18;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("擂鼓次数：");
         this.ft.textColor = StaticValue.ORANGE_RED;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 390 - 20;
         this.ft.y = 18;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("擂鼓次数：");
         this.ft.textColor = StaticValue.BlUE50;
         addChild(this.ft);
         this.ftRed = new FTextArea();
         this.ftRed.x = 150 + 10;
         this.ftRed.y = 18;
         this.ftRed.htmlText = "0" + LanResManager.getLanCommonTextWords("次");
         this.ftRed.textColor = StaticValue.ORANGE_RED;
         addChild(this.ftRed);
         this.ftBlue = new FTextArea();
         this.ftBlue.x = 440 + 20 + 10;
         this.ftBlue.y = 18;
         this.ftBlue.htmlText = "0" + LanResManager.getLanCommonTextWords("次");
         this.ftBlue.textColor = StaticValue.BlUE50;
         addChild(this.ftBlue);
         this.bx = new FCanvas();
         this.bx.skin = "box";
         this.bx.x = 2;
         this.bx.y = 278;
         this.bx.width = 590;
         this.bx.height = 65;
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 278;
         this.ft.width = 555;
         this.ft.textColor = StaticValue.GREEN;
         this.ft.htmlText = "<font>" + LanResManager.getLanCommonTextWords("任何玩家都可以为红方、蓝方擂鼓助威，但只能选择其一；") + "<br />" + LanResManager.getLanCommonTextWords("鼠标点击助威按钮进行擂鼓助威，每次消耗1元宝；") + "<br />" + LanResManager.getLanCommonTextWords("如所助威阵营获得胜利，该助威玩家将获得奖励。") + "</font>";
         addChild(this.ft);
         this.btnRed = new SecondButton();
         this.btnRed.x = 102;
         this.btnRed.y = 170 + 8;
         this.btnRed.label = LanResManager.getLanCommonTextWords("红方助威");
         addChild(this.btnRed);
         this.btnRed.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btnBlue = new SecondButton();
         this.btnBlue.x = 410 + 10;
         this.btnBlue.y = 170 + 8;
         this.btnBlue.label = LanResManager.getLanCommonTextWords("蓝方助威");
         addChild(this.btnBlue);
         this.btnBlue.addEventListener(MouseEvent.CLICK,this.onClick);
         this.gongMcSprRed = new Sprite();
         this.gongMcSprRed.x = 80;
         this.gongMcSprRed.y = 40;
         this.gongMcSprRed.addEventListener(MouseEvent.CLICK,this.onClick);
         this.gongMcSprBlue = new Sprite();
         this.gongMcSprBlue.x = 400;
         this.gongMcSprBlue.y = 40;
         this.gongMcSprBlue.addEventListener(MouseEvent.CLICK,this.onClick);
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            gongMc1 = _loc2_.content as MovieClip;
            gongMc1.x = 40 + 80 + 5;
            gongMc1.y = 30 + 35 - 3;
            addChild(gongMc1);
         },null,false,GameConfig.fileBaseFolder + "res/ui/zhizhanzhishang/jigu.swf");
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            gongMc2 = _loc2_.content as MovieClip;
            gongMc2.x = 40 + 400;
            gongMc2.y = 30 + 35 - 3;
            addChild(gongMc2);
         },null,false,GameConfig.fileBaseFolder + "res/ui/zhizhanzhishang/jigu.swf");
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnRed:
               this.$parent.dispatchEvent(new BaseEvent(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_RED_ZHUWEI));
               break;
            case this.btnBlue:
               this.$parent.dispatchEvent(new BaseEvent(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_BLUE_ZHUWEI));
         }
      }
      
      public function RedPlay() : void
      {
         this.gongMc1.play();
      }
      
      public function BluePlay() : void
      {
         this.gongMc2.play();
      }
      
      public function setRed(param1:int) : void
      {
         this.ftRed.htmlText = param1.toString() + LanResManager.getLanCommonTextWords("次");
      }
      
      public function setBlue(param1:int) : void
      {
         this.ftBlue.htmlText = param1.toString() + LanResManager.getLanCommonTextWords("次");
      }
   }
}

