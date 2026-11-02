package com.tgame.shell.view.components.wangzhezhibang
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class WangzhezhibangTip extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var bg:DisplayObject;
      
      private var closeBtn:FSimpleButton;
      
      private var btn:FSimpleButton;
      
      private var t:int = -1;
      
      private var ti:Timer;
      
      private var ftTime:FTextArea;
      
      private var syTime:int;
      
      private var stratTime:int;
      
      public function WangzhezhibangTip()
      {
         super();
         graphics.beginFill(0,0);
         graphics.drawRect(0,40,520,220);
         graphics.endFill();
         this.init();
      }
      
      private function init() : void
      {
         this.bg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/activity_begin.png",494,198);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = 465;
         this.closeBtn.y = 10;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.ftTime = new FTextArea();
         this.ftTime.x = width / 2 - 160 / 2;
         this.ftTime.y = 145 + 70;
         this.ftTime.width = 170;
         this.ftTime.textColor = StaticValue.WHITE;
         addChild(this.ftTime);
         this.btn = new FSimpleButton();
         this.btn.skin = "WZZB_CC_Button";
         this.btn.x = width / 2 - this.btn.width / 2;
         this.btn.y = 170 + 70;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn);
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         PipeManager.sendMsg(PipeConstants.WANGZHEZHIBANG_TIP_CLICK,this.t);
         this.onClose();
      }
      
      private function onClose(param1:MouseEvent = null) : void
      {
         if(this.ti != null)
         {
            this.ti.stop();
            this.ti = null;
            removeEventListener(Event.ENTER_FRAME,this.onEnterFarme);
         }
         this.ftTime.htmlText = "";
         if(parent != null)
         {
            parent.removeChild(this);
         }
         POPWindowManager.closeWindow();
      }
      
      private function onEnterFarme(param1:Event) : void
      {
         var _loc2_:int = 0;
         if(this.t == 3 || this.t == 4)
         {
            _loc2_ = (getTimer() - this.stratTime) / 1000;
            _loc2_ = this.syTime - _loc2_;
            if(_loc2_ > 0)
            {
               this.ftTime.htmlText = "<font size=\'14\'>" + _loc2_ + LanResManager.getLanCommonTextWords("秒后自动传出") + "</font>";
            }
            else
            {
               this.ftTime.htmlText = "";
               this.ti = new Timer(1000);
               this.ti.start();
               removeEventListener(Event.ENTER_FRAME,this.onEnterFarme);
               this.onClose();
            }
         }
      }
      
      public function setData(param1:int, param2:int = 0) : void
      {
         if(this.ti != null)
         {
            this.ti.stop();
            this.ti = null;
            removeEventListener(Event.ENTER_FRAME,this.onEnterFarme);
         }
         removeEventListener(Event.ENTER_FRAME,this.onEnterFarme);
         this.ftTime.htmlText = "";
         if(param1 == 3 || param1 == 4)
         {
            this.syTime = param2;
            this.stratTime = getTimer();
            addEventListener(Event.ENTER_FRAME,this.onEnterFarme);
         }
         this.t = param1;
         if(this.bg.parent != null)
         {
            this.bg.parent.removeChild(this.bg);
         }
         if(param1 == 1)
         {
            this.bg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/activity_begin.png",494,198);
            this.btn.skin = "WZZB_BM_Button";
         }
         else if(param1 == 2)
         {
            this.bg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/start.png",494,198);
            this.btn.skin = "WZZB_JR_Button";
         }
         else if(param1 == 3)
         {
            this.bg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/win.png",494,198);
            this.btn.skin = "WZZB_CC_Button";
         }
         else
         {
            this.bg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/lose.png",494,198);
            this.btn.skin = "WZZB_CC_Button";
         }
         this.bg.x = 0;
         this.bg.y = 0;
         addChildAt(this.bg,0);
      }
   }
}

