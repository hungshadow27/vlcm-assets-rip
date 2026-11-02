package com.tgame.shell.view.components.BossRefurbish
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.conquerPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class BiwuDahuiZhuweiCanvas extends Sprite
   {
      
      public static var checkBoxBl:Boolean = false;
      
      public var _parent:DisplayObject;
      
      public var checkBox:FCheckBox;
      
      private var okBtn:SecondButton;
      
      private var ft:FTextArea;
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var bg9:F9GridBitmap;
      
      private var titleImg:DisplayObject;
      
      private var canvas:FCanvas;
      
      private var arr:Array;
      
      public function BiwuDahuiZhuweiCanvas()
      {
         var _loc1_:Bitmap = null;
         super();
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 315;
         this.bgCanvas.height = 166;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         this.bg9 = Tools.get9GridBitmpByName("biwuDahui_bg");
         this.bg9.width = 315;
         this.bg9.height = 166;
         addChild(this.bg9);
         this.bg9.x = 0;
         this.bg9.y = 0;
         this.titleImg = StaticValue.getBitmapByClassName("ui.biwuDahui.zhuwei.txt");
         addChild(this.titleImg);
         this.titleImg.x = width / 2 - this.titleImg.width / 2;
         this.titleImg.y = 9;
         this.ft = new FTextArea();
         this.ft.x = 3;
         this.ft.y = 35;
         this.ft.width = 310;
         this.ft.height = 110;
         this.ft.wordWrap = true;
         this.ft.htmlText = "<textformat leading=\'9\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家可以在商城购买") + "</font><font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("助威烟火1") + "</font>,<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("对选手进行助威；") + "<br />" + LanResManager.getLanCommonTextWords("玩家可以为每位进阶选手助威一次，最多次，待大会结束后，可以领取丰厚奖励；") + "<br />" + LanResManager.getLanCommonTextWords("凡在本次大会给选手进行助威的朋友，都可以领到奖励，被助威选手获得的名次越高，奖励越丰厚") + "</font></textformat>";
         addChild(this.ft);
         _loc1_ = StaticValue.getBitmapByClassName("ui.line");
         addChild(_loc1_);
         _loc1_.width = 290;
         _loc1_.x = 10;
         _loc1_.y = 137;
         this.checkBox = new FCheckBox();
         addChild(this.checkBox);
         this.checkBox.x = 8;
         this.checkBox.y = 141;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft = new FTextArea();
         this.ft.x = 35;
         this.ft.y = 141;
         this.ft.width = 150;
         this.ft.height = 25;
         this.ft.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("下次助威不弹出此页面") + "</font>";
         addChild(this.ft);
         this.okBtn = new SecondButton();
         addChild(this.okBtn);
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定助威");
         this.okBtn.x = 231 - 40;
         this.okBtn.y = 141;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
      }
      
      public function onClose(param1:MouseEvent = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkBox:
               checkBoxBl = this.checkBox.selectState;
               break;
            case this.okBtn:
               if(parent != null)
               {
                  this.parent.removeChild(this);
               }
               this._parent.dispatchEvent(new BaseEvent(conquerPanel.UI_BIWUDAHUI_ZHUWEIOK_BTN_CLICK,"",[this.arr[0],this.arr[1]]));
         }
      }
      
      public function SetArr(param1:Array) : void
      {
         this.arr = param1;
      }
   }
}

