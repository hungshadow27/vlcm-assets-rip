package com.tgame.common.ui.componets
{
   import com.fireice.text.FLabel;
   import com.fireice.util.*;
   import com.tgame.common.GameConfig;
   import com.tgame.moudels.login.view.compoents.ui.LoginBackGroundCanvas;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.*;
   import flash.text.*;
   import flash.utils.getTimer;
   
   public class LoadingBar extends Sprite
   {
      
      private var backgroudContainer:Sprite;
      
      private var container:Sprite;
      
      private var bar:MovieClip;
      
      private var per:int = 0;
      
      private var loadTip:FLabel;
      
      private var time:Number = 0;
      
      private var tipMc:MovieClip;
      
      private var backGroundLayer:LoginBackGroundCanvas;
      
      public function LoadingBar()
      {
         super();
         this.backGroundLayer = new LoginBackGroundCanvas();
         addChild(this.backGroundLayer);
         this.backGroundLayer.loadMap(0);
         this.backgroudContainer = new Sprite();
         addChild(this.backgroudContainer);
         this.container = new Sprite();
         addChild(this.container);
         this.bar = StaticValue.getMCByClassName("ui.scene.progress.bar2") as MovieClip;
         this.container.addChild(this.bar);
         this.bar.x = 500 - this.bar.width / 2;
         this.bar.y = 425;
         this.loadTip = new FLabel();
         with(this.loadTip)
         {
            textColor = StaticValue.ORANGE;
            width = 200;
            filters = [new GlowFilter(0,1,3,3,15,BitmapFilterQuality.LOW)];
            defaultTextFormat = new TextFormat(null,14,null,true,null,null,null,TextFormatAlign.CENTER);
            x = 400;
            y = 475 + 1;
         }
         this.container.addChild(this.loadTip);
         RslLoaderManager.lazyLoad(this.onCom,null,[GameConfig.fileBaseFolder + GameConfig.program + "/skin/imgTips.swf?v=3"]);
      }
      
      private function onCom() : void
      {
         this.tipMc = StaticValue.getMCByClassName("ui.loading.tips.img") as MovieClip;
         if(this.tipMc)
         {
            this.tipMc.gotoAndStop(1);
            this.tipMc.x = 490;
            this.tipMc.y = 430 - 10 - 1 - 50;
            this.container.addChild(this.tipMc);
         }
      }
      
      public function changeLoadingBar() : void
      {
         if(Boolean(this.tipMc) && this.tipMc.parent != null)
         {
            this.tipMc.parent.removeChild(this.tipMc);
            this.tipMc = null;
         }
      }
      
      private function onFrame(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.tipMc)
         {
            if(getTimer() - this.time > 3000)
            {
               _loc2_ = 3;
               _loc3_ = this.tipMc.currentFrame + 1;
               if(_loc3_ > _loc2_)
               {
                  _loc3_ = 2;
               }
               this.tipMc.gotoAndStop(_loc3_);
               this.time = getTimer();
            }
         }
      }
      
      public function show() : void
      {
         this.reset();
         this.backGroundLayer.play();
         Tools.currentStage.addChild(this);
         this.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
         Tools.currentStage.addEventListener(Event.ENTER_FRAME,this.onFrame);
      }
      
      private function reset() : void
      {
         this.bar.gotoAndStop(1);
      }
      
      public function setPercentage(param1:String, param2:int) : void
      {
         this.bar.gotoAndStop(param2);
         this.per = param2;
         this.loadTip.text = param1 + "  " + this.per.toString() + "%";
      }
      
      public function hide() : void
      {
         if(parent)
         {
            parent.removeChild(this);
         }
         Tools.currentStage.removeEventListener(Event.ENTER_FRAME,this.onFrame);
         if(this.tipMc)
         {
            this.tipMc.gotoAndStop(1);
         }
         this.backGroundLayer.stop();
      }
      
      public function resize(param1:int, param2:int) : void
      {
         var $w:int = param1;
         var $h:int = param2;
         if($w < 1000)
         {
            $w = 1000;
         }
         if($h < 580)
         {
            $h = 580;
         }
         with(graphics)
         {
            clear();
            beginBitmapFill(FBitmapDataBufferManager.getBD("ui.login.bg.tile"));
            drawRect(0,0,$w,$h);
            endFill();
         }
         this.container.x = ($w - 1000) / 2;
         this.container.y = ($h - 580) / 2;
      }
   }
}

