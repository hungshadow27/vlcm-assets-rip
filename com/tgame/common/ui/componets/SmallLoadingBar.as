package com.tgame.common.ui.componets
{
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.text.*;
   import flash.utils.Timer;
   
   public class SmallLoadingBar extends Sprite
   {
      
      private static var loading:SmallLoadingBar;
      
      private var bar:MovieClip;
      
      private var loadTip:FTextArea;
      
      private var timer:Timer;
      
      private var i:int;
      
      public function SmallLoadingBar()
      {
         super();
         this.bar = StaticValue.getMCByClassName("ui.loadingbar.small") as MovieClip;
         addChild(this.bar);
         this.bar.y = 20;
         this.loadTip = new FTextArea();
         with(this.loadTip)
         {
            width = 185;
            height = 20;
            wordWrap = false;
            defaultTextFormat = new TextFormat(null,null,StaticValue.GREEN,true,null,null,null,null,"center");
            filters = StaticValue.filter;
         }
         addChild(this.loadTip);
         this.timer = new Timer(500);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
      }
      
      public static function loading_resize(param1:int, param2:int) : void
      {
         if(loading == null)
         {
            return;
         }
         loading.resize(param1,param2);
      }
      
      public static function close() : void
      {
         if(loading == null)
         {
            return;
         }
         loading.hide();
      }
      
      public static function showLoading(param1:String, param2:int) : void
      {
         if(loading == null)
         {
            loading = new SmallLoadingBar();
         }
         loading.setPercentage(param1,param2);
         loading.show();
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:int = Math.ceil(100 / this.timer.repeatCount * this.timer.currentCount);
         if(_loc2_ >= 100)
         {
            this.hide();
         }
         else
         {
            this.bar.gotoAndStop(_loc2_);
         }
      }
      
      public function show() : void
      {
         Tools.currentStage.addChild(this);
         this.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
         this.timer.start();
      }
      
      private function reset() : void
      {
         this.bar.gotoAndStop(0);
         this.loadTip.text = "";
      }
      
      private function setPercentage(param1:String, param2:int) : void
      {
         this.reset();
         this.timer.repeatCount = int(param2 / 500);
         this.loadTip.text = param1;
      }
      
      private function hide() : void
      {
         if(parent)
         {
            this.timer.stop();
            this.timer.reset();
            parent.removeChild(this);
         }
      }
      
      public function resize(param1:int, param2:int) : void
      {
         x = (param1 - this.width) / 2;
         y = param2 - 300;
      }
   }
}

