package com.tgame.shell.view.components.mainui
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.CDFaceManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.text.*;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class WanbaogeFunctionBar extends Sprite
   {
      
      public var _parent:DisplayObject;
      
      private var container:Sprite;
      
      private var box:FSimpleButton;
      
      private var isAble:Boolean;
      
      private var timer:Timer;
      
      private var tip:FTextArea;
      
      private var time:int;
      
      private var stratTime:int;
      
      private var nuqiBar:MovieClip;
      
      private var sp:Sprite;
      
      private var nuqiNum:int;
      
      private var digunBtn:FSimpleButton;
      
      private var jumpBtn:FSimpleButton;
      
      public function WanbaogeFunctionBar()
      {
         super();
         this.nuqiBar = StaticValue.getMCByClassName("ui.zunrongwanbaoge.nuqizhi.bar") as MovieClip;
         addChild(this.nuqiBar);
         this.nuqiBar.gotoAndStop(0);
         this.nuqiBar.x = 0;
         this.nuqiBar.y = 0;
         this.sp = new Sprite();
         addChild(this.sp);
         with(this.sp)
         {
            x = 39;
            y = 36 + 14;
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,386,19);
            graphics.endFill();
         }
         ToolTips.createToolTips(this.sp,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("当前怒气值：") + nuqiNum;
            return _loc1_ + "</textformat>";
         });
         this.container = new Sprite();
         addChild(this.container);
         with(this.container)
         {
            x = 178;
            y = 3 + 2 + 7;
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,118,40);
            graphics.endFill();
         }
         this.container.addEventListener(MouseEvent.CLICK,this.onShortCutClick,false,30);
         this.box = new FSimpleButton();
         this.box.skin = "yabaoButton";
         this.box.x = 460 - 8 - 23;
         this.box.y = 0;
         addChild(this.box);
         this.box.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 455 - 23 + 7;
            y = -16;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
         }
         addChild(this.tip);
         this.digunBtn = new FSimpleButton();
         this.digunBtn.skin = "digunButton";
         addChild(this.digunBtn);
         this.digunBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击切换为地滚") + "</font>";
         this.digunBtn.x = -8;
         this.digunBtn.y = 5;
         this.digunBtn.visible = false;
         this.digunBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jumpBtn = new FSimpleButton();
         this.jumpBtn.skin = "tiaoyueButton";
         addChild(this.jumpBtn);
         this.jumpBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击切换为跳跃") + "</font>";
         this.jumpBtn.x = -8;
         this.jumpBtn.y = 5;
         this.jumpBtn.visible = false;
         this.jumpBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onShortCutClick(param1:MouseEvent) : void
      {
         if(param1.target as ItemFace)
         {
            this._parent.dispatchEvent(new BaseEvent(MainUI.FUNCTION_SHORTCUT_CLICK,"",[param1,null]));
         }
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
               this._parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_WANBAOGE_YABAO_CLICK));
               if(this.timer)
               {
                  this.timer.stop();
                  this.timer.removeEventListener(TimerEvent.TIMER,this.tween);
                  this.timer = null;
                  this.box.filters = [];
               }
               break;
            case this.digunBtn:
               this._parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_TIAOYUE_DIGUN_CLICK,"",1));
               this.digunBtn.visible = false;
               this.jumpBtn.visible = true;
               break;
            case this.jumpBtn:
               this._parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_TIAOYUE_DIGUN_CLICK,"",0));
               this.digunBtn.visible = true;
               this.jumpBtn.visible = false;
         }
      }
      
      private function onEnterFarme(param1:Event) : void
      {
         var _loc2_:int = (getTimer() - this.stratTime) / 1000;
         _loc2_ = this.time - _loc2_;
         if(_loc2_ > 0)
         {
            this.tip.text = LanResManager.getLanTextWords(JianMianYouLiCanvas_mainui,"分秒",[int(_loc2_ / 60),_loc2_ % 60]);
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
      
      public function setYanbaoBtn(param1:int) : void
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
         this.time = param1;
         this.stratTime = getTimer();
         this.isAble = false;
         addEventListener(Event.ENTER_FRAME,this.onEnterFarme);
      }
      
      public function setNuqiNum(param1:int) : void
      {
         this.nuqiNum = param1;
         this.nuqiBar.gotoAndStop(param1);
      }
      
      public function setSkill(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc4_:int = 0;
         var _loc6_:Skill = null;
         param1.sortOn("quickbarindex",Array.NUMERIC);
         while(this.container.numChildren > 0)
         {
            _loc2_ = this.container.getChildAt(0) as ItemFace;
            this.container.removeChildAt(0);
            _loc2_.destroy();
         }
         var _loc3_:Array = [];
         var _loc5_:int = int(param1.length);
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = param1[_loc4_] as Skill;
            _loc2_ = new ItemFace(_loc6_);
            _loc2_.setShowCount(false);
            this.container.addChild(_loc2_);
            _loc2_.x = (_loc6_.quickbarindex - 1) * 39;
            if(_loc6_.isLearn)
            {
               _loc2_.filters = [];
            }
            else
            {
               _loc2_.filters = Tools.blackWhiteFilter;
            }
            _loc2_.showShortCutTip(_loc6_.quickbarindex);
            _loc3_.push(_loc2_);
            _loc4_++;
         }
         CDFaceManager.registerItemFace_batch(_loc3_);
      }
      
      public function setJumpOrDigunBtn() : void
      {
         this.digunBtn.visible = true;
         this.jumpBtn.visible = false;
      }
   }
}

