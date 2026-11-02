package com.tgame.moudels.login.view.compoents.ui
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.moudels.login.view.compoents.LoginUI;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import flash.utils.getTimer;
   
   public class SelectLinePanel extends Sprite
   {
      
      private var lineList:FList;
      
      private var okBtn:FSimpleButton;
      
      private var time:Number;
      
      private var p:Point;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var listContainer:Sprite;
      
      private var Scroll:FVScorllBar;
      
      public var imgSeal:Bitmap;
      
      public function SelectLinePanel()
      {
         var bg:F9GridBitmap = null;
         var img:Bitmap = null;
         super();
         with(graphics)
         {
            beginFill(0,0);
            drawRect(0,0,1000,580);
            endFill();
         }
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "tipsCanvasBg";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 10;
            y = 10;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.p = new Point();
         this.time = getTimer();
         bg = Tools.get9GridBitmpByName("selectXianluBg_cg");
         addChild(bg);
         bg.width = 326;
         bg.height = 408;
         bg.x = 314;
         bg.y = 93;
         img = StaticValue.getBitmapByClassName("ui.login.xuanzheXianlu.luxian.txt");
         addChild(img);
         img.x = 415;
         img.y = 98;
         this.imgSeal = StaticValue.getBitmapByClassName("ui.login.seal");
         addChild(this.imgSeal);
         this.imgSeal.x = 900;
         this.imgSeal.y = 430;
         img.visible = false;
         this.okBtn = new FSimpleButton();
         this.okBtn.skin = "loginBtn_cg";
         addChild(this.okBtn);
         this.okBtn.x = 397;
         this.okBtn.y = 464;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 367;
            y = 140;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,200,295);
            graphics.endFill();
         }
         this.lineList = new FList();
         this.lineList.skin = "loginList";
         this.lineList.itemRenderer = new SelectLineRender();
         this.lineList.listWidth = 220;
         this.listContainer.addChild(this.lineList);
         this.lineList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.lineList.addEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
         this.lineList.addEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
         this.Scroll = new FVScorllBar(this.listContainer,295);
         addChild(this.Scroll);
         this.Scroll.x = 203 + 367;
         this.Scroll.y = 140;
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.lineList.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouse);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(LanResManager.getLanTextWords(SelectLinePanel,"线路依照在线人数排序",[StaticValue.GREEN]));
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.lineList.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouse);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 20;
         this.tipCanvas.height = this.tip.height + 20;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         parent.parent.dispatchEvent(new BaseEvent(LoginUI.UI_LOGIN_SELECTLINE_OK,"",this.lineList.selectItem));
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         parent.parent.dispatchEvent(new BaseEvent(LoginUI.UI_LOGIN_SELECTLINE_OK,"",this.lineList.selectItem));
      }
      
      public function set dataProvider(param1:XML) : void
      {
         this.lineList.dataProvider = param1;
         this.lineList.setSelectItemByIndex(0);
         this.Scroll.update();
      }
      
      public function destory() : void
      {
      }
   }
}

