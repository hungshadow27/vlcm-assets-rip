package com.tgame.shell.view.components.mainui.functionbar
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class CircleShow extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var greenCircle:MovieClip;
      
      private var purpleCircle:MovieClip;
      
      private var moxueCircle:MovieClip;
      
      private var greenNow:int;
      
      private var greenMax:int;
      
      private var purpleNow:int;
      
      private var purpleMax:int;
      
      private var moxueNow:int;
      
      private var moxueMax:int;
      
      public var jumpBtn:FSimpleButton;
      
      private var sitBtn:FSimpleButton;
      
      private var rideBtn:FSimpleButton;
      
      private var optionBtn:FSimpleButton;
      
      private var fashionBtn:FSimpleButton;
      
      private var setBtn:FSimpleButton;
      
      private var autoBtn:FSimpleButton;
      
      private var texiaoBtn:FSimpleButton;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var chibangBtn:FSimpleButton;
      
      public function CircleShow()
      {
         var obj:MovieClip = null;
         super();
         obj = StaticValue.getMCByClassName("ui.main.function.circle") as MovieClip;
         obj.mouseEnabled = false;
         obj.mouseChildren = false;
         addChild(obj);
         this.purpleCircle = StaticValue.getMCByClassName("ui.main.function.circle.purple") as MovieClip;
         addChild(this.purpleCircle);
         this.purpleCircle.x = 52;
         this.purpleCircle.y = 4;
         this.purpleCircle.gotoAndStop(50);
         this.purpleCircle.addEventListener(MouseEvent.MOUSE_OVER,this.onPurpleTip);
         this.purpleCircle.addEventListener(MouseEvent.MOUSE_OUT,this.onPurpleTip);
         this.jumpBtn = new FSimpleButton();
         this.jumpBtn.skin = "bigJumpButton";
         this.jumpBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用轻功可不必长按shift键进行跳跃") + "</font><br><font color=\'" + StaticValue.GREEN_HTML + "\'>(" + LanResManager.getLanCommonTextWords("快捷键：") + "Shift+" + LanResManager.getLanCommonTextWords("鼠标左键") + ")</font>";
         addChild(this.jumpBtn);
         this.jumpBtn.x = 148;
         this.jumpBtn.y = 6;
         this.jumpBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.optionBtn = new FSimpleButton();
         this.optionBtn.skin = "flyButton";
         this.optionBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打开/关闭飞行状态") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'>(" + LanResManager.getLanCommonTextWords("快捷键：") + "P)</font>";
         addChild(this.optionBtn);
         this.optionBtn.x = -210;
         this.optionBtn.y = 1;
         this.optionBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fashionBtn = new FSimpleButton();
         this.fashionBtn.skin = "fashionYNBtn";
         this.fashionBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打开/关闭时装试衣间") + "</font>";
         addChild(this.fashionBtn);
         this.fashionBtn.x = -210 - 32;
         this.fashionBtn.y = 3;
         this.fashionBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.sitBtn = new FSimpleButton();
         this.sitBtn.skin = "bigSitButton";
         this.sitBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("进入打坐状态，修炼真气与经验") + "</font><br><font color=\'" + StaticValue.GREEN_HTML + "\'>(" + LanResManager.getLanCommonTextWords("快捷键：") + "X)</font>";
         addChild(this.sitBtn);
         this.sitBtn.x = 187;
         this.sitBtn.y = 6;
         this.sitBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.rideBtn = new FSimpleButton();
         this.rideBtn.skin = "bigRideButton";
         this.rideBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("骑上/收起坐骑") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'>(" + LanResManager.getLanCommonTextWords("快捷键：") + "W)</font>";
         addChild(this.rideBtn);
         this.rideBtn.x = 226;
         this.rideBtn.y = 6;
         this.rideBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.setBtn = new FSimpleButton();
         this.setBtn.skin = "setButton";
         this.setBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("设置") + "</font>";
         addChild(this.setBtn);
         this.setBtn.x = 265;
         this.setBtn.y = 6;
         this.setBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.autoBtn = new FSimpleButton();
         this.autoBtn.skin = "bigAutoButton";
         this.autoBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("开始/结束自动挂机打怪") + "</font><br><font color=\'" + StaticValue.GREEN_HTML + "\'>(" + LanResManager.getLanCommonTextWords("快捷键：") + "Z)</font>";
         addChild(this.autoBtn);
         this.autoBtn.x = 304;
         this.autoBtn.y = 6;
         this.autoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
      }
      
      private function onPurpleTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               addEventListener(MouseEvent.MOUSE_MOVE,this.onPurpleTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(LanResManager.getLanTextWords(this,"当前真气",[StaticValue.PURPLE_HTML,this.purpleNow,this.purpleMax,StaticValue.YELLOW_HTML,StaticValue.BLUE_HTML,StaticValue.GREEN_HTML]));
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               removeEventListener(MouseEvent.MOUSE_MOVE,this.onPurpleTip);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 6;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
         Tools.currentStage.addChild(this.tipCanvas);
         if(Tools.currentStage.mouseX + this.tipCanvas.width > Tools.currentStage.stageWidth)
         {
            this.tipCanvas.x = Tools.currentStage.mouseX - this.tipCanvas.width;
         }
         else
         {
            this.tipCanvas.x = Tools.currentStage.mouseX + 10;
         }
         if(Tools.currentStage.mouseY + this.tipCanvas.height > Tools.currentStage.stageHeight)
         {
            this.tipCanvas.y = Tools.currentStage.mouseY - this.tipCanvas.height;
         }
         else
         {
            this.tipCanvas.y = Tools.currentStage.mouseY + 10;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.jumpBtn:
               this.$parent.dispatchEvent(new BaseEvent(MainUI.FUNCITON_JUMP_BTN_CLICK));
               break;
            case this.sitBtn:
               this.$parent.dispatchEvent(new BaseEvent(MainUI.FUNCITON_SIT_BTN_CLICK));
               break;
            case this.rideBtn:
               this.$parent.dispatchEvent(new BaseEvent(MainUI.FUNCTION_RIDE_BTN_CLICK));
               break;
            case this.optionBtn:
               this.$parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_FEIXING_BTN_CLICK));
               break;
            case this.setBtn:
               this.$parent.dispatchEvent(new BaseEvent(MainUI.FUNCTION_STUDYBTN_CLICK));
               break;
            case this.autoBtn:
               this.$parent.dispatchEvent(new BaseEvent(MainUI.FUNCITON_AUTO_BTN_CLICK));
               break;
            case this.fashionBtn:
               PipeManager.sendMsg(PipeConstants.SHOW_FASHION_PANEL);
         }
      }
      
      public function setValue(param1:int = -1, param2:int = -1, param3:int = -1, param4:int = -1) : void
      {
         if(param1 != -1)
         {
         }
         if(param2 != -1)
         {
         }
         if(param3 != -1)
         {
            this.purpleNow = param3;
         }
         if(param4 != -1)
         {
            this.purpleMax = param4;
         }
         this.purpleCircle.gotoAndStop(int(this.purpleNow / this.purpleMax * 100));
      }
      
      public function setLayout(param1:Boolean) : void
      {
         if(param1)
         {
            this.rideBtn.filters = Tools.darkFilter;
            this.rideBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
            this.fashionBtn.filters = Tools.darkFilter;
            this.fashionBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
         }
         else
         {
            this.rideBtn.filters = [];
            this.rideBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            this.fashionBtn.filters = [];
            this.fashionBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         }
      }
   }
}

