package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Buff;
   import com.zcp.manager.CDFaceManager;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class DuantijindanCanvas extends Sprite
   {
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var ft:FTextArea;
      
      private var img:Bitmap;
      
      private var fb1:FLabel;
      
      private var item:ItemFace;
      
      public function DuantijindanCanvas()
      {
         var fc:FCanvas = null;
         super();
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 425;
         this.bgCanvas.height = 107;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         fc = new FCanvas();
         fc.skin = "canvas1";
         fc.x = 0;
         fc.y = 0;
         fc.width = 425;
         fc.height = 107;
         addChild(fc);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.fb1 = new FLabel();
         with(this.fb1)
         {
            x = 17;
            y = 20;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("煅体金丹");
         }
         addChild(this.fb1);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 22;
         this.img.y = 42;
         this.ft = new FTextArea();
         with(this.ft)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 70;
            y = 14;
            textColor = StaticValue.RED;
            htmlText = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanTextWords(this,"您使用了【煅体金丹】") + "</font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"加成效果") + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanTextWords(this,"请注意加成时间") + "</font>" + "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanTextWords(this,"只有四阶肉身") + "</font>" + "</textformat>";
         }
         addChild(this.ft);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setInitialize(param1:Buff) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 24;
         this.item.y = 44;
         addChild(this.item);
         CDFaceManager.registerItemFace(this.item);
      }
   }
}

