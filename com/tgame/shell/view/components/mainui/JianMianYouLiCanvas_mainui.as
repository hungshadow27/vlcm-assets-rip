package com.tgame.shell.view.components.mainui
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.text.*;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class JianMianYouLiCanvas_mainui extends Sprite
   {
      
      private var box:FSimpleButton;
      
      private var expendBtn:FSimpleButton;
      
      private var tip:FTextArea;
      
      private var timer:Timer;
      
      private var _isExpend:Boolean;
      
      private var gift:String;
      
      private var time:int;
      
      private var stratTime:int;
      
      private var btn:Sprite;
      
      private var isAble:Boolean;
      
      public function JianMianYouLiCanvas_mainui()
      {
         super();
         this._isExpend = true;
         this.box = new FSimpleButton();
         this.box.skin = "giftBoxButton";
         addChild(this.box);
         this.box.addEventListener(MouseEvent.CLICK,this.onClick);
         this.expendBtn = new FSimpleButton();
         this.expendBtn.skin = "expendButton";
         addChild(this.expendBtn);
         this.expendBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.expendBtn.visible = false;
         this.tip = new FTextArea();
         with(this.tip)
         {
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
         }
         addChild(this.tip);
         this.btn = new Sprite();
         with(this.btn.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,54,60);
            endFill();
         }
         addChild(this.btn);
         this.btn.visible = false;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.isAble = false;
      }
      
      private function resize() : void
      {
         this.box.x = 0;
         this.box.y = 0;
         this.tip.x = 5;
         this.tip.y = 5;
         this.expendBtn.visible = false;
         GameInstance.uiInstance.mainUI.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.box:
               if(!this.isAble)
               {
                  break;
               }
               parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_GIFT_BOX_CLICK));
               if(parent != null)
               {
                  parent.removeChild(this);
               }
               this.timer.stop();
               this.timer.removeEventListener(TimerEvent.TIMER,this.tween);
               this.timer = null;
               this.box.filters = [];
         }
         this.resize();
      }
      
      private function onEnterFarme(param1:Event) : void
      {
         var _loc2_:int = (getTimer() - this.stratTime) / 1000;
         _loc2_ = this.time - _loc2_;
         if(_loc2_ > 0)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"分秒",[int(_loc2_ / 60),_loc2_ % 60]);
            this.isAble = false;
            this.box.enabled = false;
         }
         else
         {
            this.tip.text = "";
            this.box.enabled = true;
            this.timer = new Timer(500);
            this.timer.addEventListener(TimerEvent.TIMER,this.tween);
            this.timer.start();
            removeEventListener(Event.ENTER_FRAME,this.onEnterFarme);
            this.isAble = true;
         }
         this.resize();
      }
      
      private function tween(param1:TimerEvent) : void
      {
         if(this.box.filters.length == 0)
         {
            this.box.filters = [new GlowFilter(StaticValue.YELLOW,0.5,8,8,8,BitmapFilterQuality.LOW)];
         }
         else
         {
            this.box.filters = [];
         }
      }
      
      public function get isExpend() : Boolean
      {
         return false;
      }
      
      public function setGift(param1:String, param2:int) : void
      {
         if(this.timer)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.tween);
            this.timer = null;
            this.box.filters = [];
         }
         else
         {
            this.tip.text = "";
         }
         this.gift = param1;
         this.time = param2;
         this.stratTime = getTimer();
         this.isAble = false;
         addEventListener(Event.ENTER_FRAME,this.onEnterFarme);
      }
   }
}

