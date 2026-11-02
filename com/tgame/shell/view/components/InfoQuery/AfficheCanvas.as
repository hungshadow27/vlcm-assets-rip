package com.tgame.shell.view.components.InfoQuery
{
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class AfficheCanvas extends Sprite
   {
      
      private var _parent:DisplayObject;
      
      private var lb:FLabel;
      
      private var content:FTextArea;
      
      private var subBtn:SecondButton;
      
      private var Scroll:FVScorllBar;
      
      private var shujuArr:Array;
      
      private var kuangBg:FCanvas;
      
      public function AfficheCanvas()
      {
         var img:Bitmap = null;
         this.shujuArr = new Array();
         super();
         this.kuangBg = new FCanvas();
         this.kuangBg.skin = "box";
         addChild(this.kuangBg);
         this.kuangBg.width = 590;
         this.kuangBg.height = 346;
         this.kuangBg.y = 2;
         img = StaticValue.getBitmapByClassName("ui.line");
         addChild(img);
         img.width = 583;
         img.y = 24;
         img.x = 3;
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 270;
            y = 6;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,0);
         }
         addChild(this.lb);
         this.content = new FTextArea();
         with(this.content)
         {
            mouseWheelEnabled = true;
            wordWrap = true;
            x = 6;
            y = 28;
            width = 565;
            height = 315;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.content);
         this.Scroll = new FVScorllBar(this.content,315);
         addChild(this.Scroll);
         this.Scroll.x = 570;
         this.Scroll.y = 28;
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      private function Intercalate() : void
      {
      }
      
      public function SetInitialize(param1:Date, param2:String) : void
      {
         if(this.content.numLines > 100)
         {
            this.content.htmlText.replace(/^(.*?)\<P\s*ALIGN=\"LEFT\"\>.*?\<\/P\>(.*)$/,"$1$2");
         }
         var _loc3_:String = "";
         _loc3_ += "【";
         if(param1.getHours() < 10)
         {
            _loc3_ += "0" + param1.getHours();
         }
         else
         {
            _loc3_ += param1.getHours();
         }
         _loc3_ += ":";
         if(param1.getMinutes() < 10)
         {
            _loc3_ += "0" + param1.getMinutes();
         }
         else
         {
            _loc3_ += param1.getMinutes();
         }
         _loc3_ += ":";
         if(param1.getSeconds() < 10)
         {
            _loc3_ += "0" + param1.getSeconds();
         }
         else
         {
            _loc3_ += param1.getSeconds();
         }
         _loc3_ += "】 " + param2 + "<br>";
         this.content.htmlText += _loc3_;
         this.content.scrollV = this.content.maxScrollV;
      }
   }
}

