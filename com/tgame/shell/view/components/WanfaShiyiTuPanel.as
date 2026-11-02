package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class WanfaShiyiTuPanel extends Sprite
   {
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var bgImg:DisplayObject;
      
      private var letfFt:FTextArea;
      
      private var rightFt:FTextArea;
      
      private var ft:FTextArea;
      
      public function WanfaShiyiTuPanel()
      {
         var _loc1_:FCanvas = null;
         super();
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 750;
         this.bgCanvas.height = 460;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         _loc1_ = new FCanvas();
         _loc1_.skin = "canvas1";
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 750;
         _loc1_.height = 460;
         addChild(_loc1_);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 20;
         this.ft.y = 15;
         this.ft.multiline = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("蒙军出生地");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 20;
         this.ft.y = 55;
         this.ft.multiline = true;
         this.ft.htmlText = "<font  color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("蒙军将会从上往下攻击");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 20;
         this.ft.y = 135;
         this.ft.multiline = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("争夺火炮");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 20;
         this.ft.y = 195;
         this.ft.multiline = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("宋军的左先锋");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 20;
         this.ft.y = 250;
         this.ft.multiline = true;
         this.ft.htmlText = "<font  color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("宋军的中先锋");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 20;
         this.ft.y = 305;
         this.ft.multiline = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("宋军的右先锋");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 20;
         this.ft.y = 360;
         this.ft.multiline = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("宋军大将，击败宋方3路");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 585;
         this.ft.y = 15;
         this.ft.multiline = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("蒙军元帅，击败蒙方3路");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 585;
         this.ft.y = 105;
         this.ft.multiline = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("蒙军的左统领");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 585;
         this.ft.y = 160;
         this.ft.multiline = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("蒙军的中统领");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 585;
         this.ft.y = 215;
         this.ft.multiline = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("蒙军的右统领");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 585;
         this.ft.y = 270;
         this.ft.multiline = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("争夺火炮");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 585;
         this.ft.y = 335;
         this.ft.multiline = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("宋军将会从下往上攻击");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 585;
         this.ft.y = 410;
         this.ft.multiline = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("宋军出生地");
         addChild(this.ft);
         this.bgImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/2.jpg",408,406);
         this.bgImg.x = 170;
         this.bgImg.y = 28;
         addChild(this.bgImg);
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
   }
}

