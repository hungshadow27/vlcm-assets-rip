package com.tgame.shell.view.components.wangzhezhibang
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class WangzhezhibangGuizePanel extends Sprite
   {
      
      private var bg:DisplayObject;
      
      private var closeBtn:FSimpleButton;
      
      private var tz:Sprite;
      
      private var ftTime:FTextArea;
      
      public function WangzhezhibangGuizePanel()
      {
         var _loc1_:FCanvas = null;
         super();
         _loc1_ = new FCanvas();
         _loc1_.skin = "canvas1";
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 692;
         _loc1_.height = 560;
         addChild(_loc1_);
         this.init();
      }
      
      private function init() : void
      {
         this.bg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/guize_bg.png",679,540);
         this.bg.x = 7;
         this.bg.y = 9;
         addChild(this.bg);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.tz = new Sprite();
         this.tz.graphics.beginFill(0,0);
         this.tz.graphics.drawRect(0,0,675,30);
         this.tz.graphics.endFill();
         this.tz.width = 675;
         this.tz.height = 30;
         this.tz.x = 0;
         this.tz.y = 0;
         this.tz.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDowns);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseReleaseds);
         addChild(this.tz);
         this.ftTime = new FTextArea();
         this.ftTime.x = 20;
         this.ftTime.y = 55;
         this.ftTime.width = 300;
         addChild(this.ftTime);
      }
      
      private function mouseDowns(param1:MouseEvent) : void
      {
         this.parent.setChildIndex(this,parent.numChildren - 1);
         this.startDrag(false,new Rectangle(0,0,Tools.currentStage.stageWidth - this.width,Tools.currentStage.stageHeight - this.height));
      }
      
      private function mouseReleaseds(param1:MouseEvent) : void
      {
         this.stopDrag();
      }
      
      public function onClose(param1:MouseEvent = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setTime(param1:String) : void
      {
         param1 = param1.replace(",",LanResManager.getLanCommonTextWords("到"));
         this.ftTime.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1 + LanResManager.getLanCommonTextWords("开启跨服帮会战。") + "</font>";
      }
   }
}

