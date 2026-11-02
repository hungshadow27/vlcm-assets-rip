package com.tgame.shell.view.components.kungfu
{
   import com.fireice.text.FLabel;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class KungFuLvCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      private var fb:FLabel;
      
      private var dqwxcs:FLabel;
      
      private var bgtibiao1:Bitmap;
      
      private var bgwenzi1:Bitmap;
      
      private var fb1:FLabel;
      
      private var bgtibiao2:Bitmap;
      
      private var bgwenzi2:Bitmap;
      
      private var fb2:FLabel;
      
      private var bgtibiao3:Bitmap;
      
      private var bgwenzi3:Bitmap;
      
      private var fb3:FLabel;
      
      private var bgtibiao4:Bitmap;
      
      private var bgwenzi4:Bitmap;
      
      private var fb4:FLabel;
      
      private var bgtibiao5:Bitmap;
      
      private var bgwenzi5:Bitmap;
      
      private var fb5:FLabel;
      
      private var bgtibiao6:Bitmap;
      
      private var bgwenzi6:Bitmap;
      
      private var fb6:FLabel;
      
      private var bgtibiao7:Bitmap;
      
      private var bgwenzi7:Bitmap;
      
      private var fb7:FLabel;
      
      public function KungFuLvCanvas()
      {
         var img:Bitmap = null;
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.kungfu.lv.bg";
         img = StaticValue.getBitmapByClassName("ui.kungfu.lv.title");
         addChild(img);
         img.x = 78;
         img.y = 5;
         this.bgtibiao1 = StaticValue.getBitmapByClassName("ui.jingjie.j1");
         addChild(this.bgtibiao1);
         this.bgtibiao1.x = 9;
         this.bgtibiao1.y = 34;
         this.bgwenzi1 = StaticValue.getBitmapByClassName("ui.kungfu.lv.text.1");
         addChild(this.bgwenzi1);
         this.bgwenzi1.x = 64;
         this.bgwenzi1.y = 32;
         img = StaticValue.getBitmapByClassName("ui.line");
         addChild(img);
         img.width = 196;
         img.x = 6;
         img.y = 70;
         this.fb1 = new FLabel();
         with(this.fb1)
         {
            x = 42;
            y = 51;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,0,[500000000]);
         }
         addChild(this.fb1);
         this.bgtibiao2 = StaticValue.getBitmapByClassName("ui.jingjie.j2");
         addChild(this.bgtibiao2);
         this.bgtibiao2.x = 9;
         this.bgtibiao2.y = 82;
         this.bgwenzi2 = StaticValue.getBitmapByClassName("ui.kungfu.lv.text.2");
         addChild(this.bgwenzi2);
         this.bgwenzi2.x = 64;
         this.bgwenzi2.y = 80;
         img = StaticValue.getBitmapByClassName("ui.line");
         addChild(img);
         img.width = 196;
         img.x = 6;
         img.y = 118;
         this.fb2 = new FLabel();
         with(this.fb2)
         {
            x = 42;
            y = 99;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,0,[2000000000]);
         }
         addChild(this.fb2);
         this.bgtibiao3 = StaticValue.getBitmapByClassName("ui.jingjie.j3");
         addChild(this.bgtibiao3);
         this.bgtibiao3.x = 9;
         this.bgtibiao3.y = 130;
         this.bgwenzi3 = StaticValue.getBitmapByClassName("ui.kungfu.lv.text.3");
         addChild(this.bgwenzi3);
         this.bgwenzi3.x = 64;
         this.bgwenzi3.y = 128;
         img = StaticValue.getBitmapByClassName("ui.line");
         addChild(img);
         img.width = 196;
         img.x = 6;
         img.y = 166;
         this.fb3 = new FLabel();
         with(this.fb3)
         {
            x = 42;
            y = 147;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,0,[5000000000]);
         }
         addChild(this.fb3);
         this.bgtibiao4 = StaticValue.getBitmapByClassName("ui.jingjie.j4");
         addChild(this.bgtibiao4);
         this.bgtibiao4.x = 9;
         this.bgtibiao4.y = 178;
         this.bgwenzi4 = StaticValue.getBitmapByClassName("ui.kungfu.lv.text.4");
         addChild(this.bgwenzi4);
         this.bgwenzi4.x = 64;
         this.bgwenzi4.y = 176;
         img = StaticValue.getBitmapByClassName("ui.line");
         addChild(img);
         img.width = 196;
         img.x = 6;
         img.y = 214;
         this.fb4 = new FLabel();
         with(this.fb4)
         {
            x = 42;
            y = 195;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,0,[10000000000]);
         }
         addChild(this.fb4);
         this.bgtibiao5 = StaticValue.getBitmapByClassName("ui.jingjie.j5");
         addChild(this.bgtibiao5);
         this.bgtibiao5.x = 9;
         this.bgtibiao5.y = 226;
         this.bgwenzi5 = StaticValue.getBitmapByClassName("ui.kungfu.lv.text.5");
         addChild(this.bgwenzi5);
         this.bgwenzi5.x = 64;
         this.bgwenzi5.y = 224;
         img = StaticValue.getBitmapByClassName("ui.line");
         addChild(img);
         img.width = 196;
         img.x = 6;
         img.y = 262;
         this.fb5 = new FLabel();
         with(this.fb5)
         {
            x = 42;
            y = 243;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,0,[14000000000]);
         }
         addChild(this.fb5);
         this.bgtibiao6 = StaticValue.getBitmapByClassName("ui.jingjie.j6");
         addChild(this.bgtibiao6);
         this.bgtibiao6.x = 9;
         this.bgtibiao6.y = 274;
         this.bgwenzi6 = StaticValue.getBitmapByClassName("ui.kungfu.lv.text.6");
         addChild(this.bgwenzi6);
         this.bgwenzi6.x = 64;
         this.bgwenzi6.y = 272;
         img = StaticValue.getBitmapByClassName("ui.line");
         addChild(img);
         img.width = 196;
         img.x = 6;
         img.y = 310;
         this.fb6 = new FLabel();
         with(this.fb6)
         {
            x = 42;
            y = 291;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,0,[18000000000]);
         }
         addChild(this.fb6);
         this.bgtibiao7 = StaticValue.getBitmapByClassName("ui.jingjie.j7");
         addChild(this.bgtibiao7);
         this.bgtibiao7.x = 9;
         this.bgtibiao7.y = 322;
         this.bgwenzi7 = StaticValue.getBitmapByClassName("ui.kungfu.lv.text.7");
         addChild(this.bgwenzi7);
         this.bgwenzi7.x = 64;
         this.bgwenzi7.y = 320;
         img = StaticValue.getBitmapByClassName("ui.line");
         addChild(img);
         img.width = 196;
         img.x = 6;
         img.y = 358;
         this.fb7 = new FLabel();
         with(this.fb7)
         {
            x = 42;
            y = 339;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,0,[20000000000]);
         }
         addChild(this.fb7);
         this.dqwxcs = new FLabel();
         with(this.dqwxcs)
         {
            x = 30;
            y = 366;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.dqwxcs);
      }
      
      public function setInitialize(param1:Number) : void
      {
         if(param1 < 20000000000)
         {
            this.bgtibiao7.filters = Tools.blackWhiteFilter;
            this.bgwenzi7.filters = Tools.blackWhiteFilter;
            this.fb7.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.bgtibiao7.filters = [];
            this.bgwenzi7.filters = [];
            this.fb7.filters = [];
         }
         if(param1 < 16000000000)
         {
            this.bgtibiao6.filters = Tools.blackWhiteFilter;
            this.bgwenzi6.filters = Tools.blackWhiteFilter;
            this.fb6.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.bgtibiao6.filters = [];
            this.bgwenzi6.filters = [];
            this.fb6.filters = [];
         }
         if(param1 < 14000000000)
         {
            this.bgtibiao5.filters = Tools.blackWhiteFilter;
            this.bgwenzi5.filters = Tools.blackWhiteFilter;
            this.fb5.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.bgtibiao5.filters = [];
            this.bgwenzi5.filters = [];
            this.fb5.filters = [];
         }
         if(param1 < 10000000000)
         {
            this.bgtibiao4.filters = Tools.blackWhiteFilter;
            this.bgwenzi4.filters = Tools.blackWhiteFilter;
            this.fb4.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.bgtibiao4.filters = [];
            this.bgwenzi4.filters = [];
            this.fb4.filters = [];
         }
         if(param1 < 5000000000)
         {
            this.bgtibiao3.filters = Tools.blackWhiteFilter;
            this.bgwenzi3.filters = Tools.blackWhiteFilter;
            this.fb3.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.bgtibiao3.filters = [];
            this.bgwenzi3.filters = [];
            this.fb3.filters = [];
         }
         if(param1 < 2000000000)
         {
            this.bgtibiao2.filters = Tools.blackWhiteFilter;
            this.bgwenzi2.filters = Tools.blackWhiteFilter;
            this.fb2.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.bgtibiao2.filters = [];
            this.bgwenzi2.filters = [];
            this.fb2.filters = [];
         }
         if(param1 < 500000000)
         {
            this.bgtibiao1.filters = Tools.blackWhiteFilter;
            this.bgwenzi1.filters = Tools.blackWhiteFilter;
            this.fb1.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.bgtibiao1.filters = [];
            this.bgwenzi1.filters = [];
            this.fb1.filters = [];
         }
         this.dqwxcs.text = LanResManager.getLanTextWords(this,1,[param1]);
      }
   }
}

