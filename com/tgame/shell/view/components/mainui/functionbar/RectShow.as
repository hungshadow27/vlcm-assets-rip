package com.tgame.shell.view.components.mainui.functionbar
{
   import com.fireice.button.FSimpleButton;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   
   public class RectShow extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var rideHPBar:ColorBar;
      
      public var nqBar:ColorBar;
      
      private var jumpBtn:FSimpleButton;
      
      private var sitBtn:FSimpleButton;
      
      private var sheBtn:FSimpleButton;
      
      private var gongBtn:FSimpleButton;
      
      private var studyBtn:SimpleButton;
      
      public function RectShow()
      {
         super();
         this.nqBar = new ColorBar(3,84,8,true,false);
         addChild(this.nqBar);
         this.nqBar.x = 26;
         this.nqBar.y = 12;
         this.nqBar.setValue(100,100);
         addChild(StaticValue.getBitmapByClassName("ui.main.function.rect"));
         this.jumpBtn = new FSimpleButton();
         this.jumpBtn.skin = "jumpButton";
         this.jumpBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用轻功可不必长按shift键进行跳跃") + "</font><br><font color=\'" + StaticValue.GREEN_HTML + "\'>(" + LanResManager.getLanCommonTextWords("快捷键：") + "Shift+" + LanResManager.getLanCommonTextWords("鼠标左键") + ")</font>";
         addChild(this.jumpBtn);
         this.jumpBtn.x = 10;
         this.jumpBtn.y = 27;
         this.jumpBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.sitBtn = new FSimpleButton();
         this.sitBtn.skin = "sitButton";
         this.sitBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("进入打坐状态，修炼真气与经验") + "</font><br><font color=\'" + StaticValue.GREEN_HTML + "\'>(" + LanResManager.getLanCommonTextWords("快捷键：") + "X)</font>";
         addChild(this.sitBtn);
         this.sitBtn.x = this.jumpBtn.x + 17 + 4;
         this.sitBtn.y = 27;
         this.sitBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         var _loc1_:Class = getDefinitionByName("ui.main.function.study") as Class;
         this.studyBtn = new _loc1_() as SimpleButton;
         addChild(this.studyBtn);
         this.studyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.studyBtn.x = this.sitBtn.x + 34 + 8;
         this.studyBtn.y = 27;
         this.gongBtn = new FSimpleButton();
         this.gongBtn.skin = "guaButton";
         this.gongBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("开始/结束自动挂机打怪") + "</font><br><font color=\'" + StaticValue.GREEN_HTML + "\'>(" + LanResManager.getLanCommonTextWords("快捷键：") + "Z)</font>";
         addChild(this.gongBtn);
         this.gongBtn.x = this.studyBtn.x + 17 + 4;
         this.gongBtn.y = 27;
         this.gongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
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
            case this.studyBtn:
               this.$parent.dispatchEvent(new BaseEvent(MainUI.FUNCTION_STUDYBTN_CLICK));
               break;
            case this.gongBtn:
               this.$parent.dispatchEvent(new BaseEvent(MainUI.FUNCITON_AUTO_BTN_CLICK));
         }
      }
      
      public function setValue(param1:int = -1, param2:int = -1, param3:int = -1, param4:int = -1) : void
      {
         this.nqBar.setValue(param3,param4);
      }
   }
}

