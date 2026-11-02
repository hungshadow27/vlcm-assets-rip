package com.tgame.shell.view.components.Accomplishment
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.*;
   
   public class AccomplishmentListRender extends FListCellRenderer
   {
      
      private var CjBar:ColorBar;
      
      private var Fname:FLabel;
      
      private var lb:FLabel;
      
      private var cjmb:FLabel;
      
      private var cjds:FLabel;
      
      private var jlch:FLabel;
      
      private var tsjl:FLabel;
      
      public function AccomplishmentListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var img:Bitmap;
         var tf:TextFormat;
         var obj:DisplayObject;
         var aab:Sprite;
         var tColor:int = 0;
         var jdtColor:int = 0;
         var aa:FCanvas = null;
         _height = 97;
         if(data.isAccomplish)
         {
            tColor = StaticValue.GREEN_STRONG;
            jdtColor = 5;
         }
         else
         {
            tColor = StaticValue.BLUE;
            jdtColor = 1;
         }
         aa = new FCanvas();
         aa.x = 0;
         aa.y = 0;
         aa.skin = "box_transparence";
         aa.width = 438;
         aa.height = 101;
         addChild(aa);
         img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.bg.bar");
         addChild(img);
         img.x = 0;
         img.y = 0;
         tf = new TextFormat();
         tf.align = "left";
         img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(img);
         img.x = 310;
         img.y = 2;
         this.Fname = new FLabel();
         with(this.Fname)
         {
            x = 80;
            y = 2;
            filters = StaticValue.filter;
            textColor = tColor;
            text = data.name;
            height = 20;
         }
         addChild(this.Fname);
         this.CjBar = new ColorBar(jdtColor,95,11);
         addChild(this.CjBar);
         this.CjBar.x = 325;
         this.CjBar.y = 5;
         this.CjBar.setValue(data.CjNow,data.CjMax);
         img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.slot.big");
         addChild(img);
         img.x = 10;
         img.y = 25;
         obj = FLoader.startLoad(data.icoPath,65,65);
         addChild(obj);
         obj.x = 12;
         obj.y = 27;
         if(!data.isAccomplish)
         {
            obj.filters = Tools.blackWhiteFilter;
         }
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 95;
            y = 35;
            textColor = tColor;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            height = 20;
            text = LanResManager.getLanTextWords(this,"成就目标");
         }
         addChild(this.lb);
         this.cjmb = new FLabel();
         with(this.cjmb)
         {
            x = 157;
            y = 35;
            textColor = tColor;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            text = data.cjmb;
         }
         addChild(this.cjmb);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 95;
            y = 52;
            textColor = tColor;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            height = 20;
            text = LanResManager.getLanTextWords(this,"成就点数");
         }
         addChild(this.lb);
         this.cjds = new FLabel();
         with(this.cjds)
         {
            x = 157;
            y = 52;
            textColor = tColor;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            text = data.cjds;
         }
         addChild(this.cjds);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 250;
            y = 52;
            textColor = tColor;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            height = 20;
            text = LanResManager.getLanTextWords(this,"奖励称号");
         }
         addChild(this.lb);
         this.jlch = new FLabel();
         with(this.jlch)
         {
            x = 312;
            y = 52;
            textColor = tColor;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            text = data.jlch;
         }
         addChild(this.jlch);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 95;
            y = 69;
            textColor = tColor;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            height = 20;
            text = LanResManager.getLanTextWords(this,"特殊奖励");
         }
         addChild(this.lb);
         this.tsjl = new FLabel();
         with(this.tsjl)
         {
            x = 157;
            y = 69;
            textColor = tColor;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            text = data.tsjl;
         }
         addChild(this.tsjl);
         if(data.isAccomplish)
         {
            img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.complete");
            addChild(img);
            img.x = 160;
            img.y = 23;
         }
         aab = new Sprite();
         aab.graphics.beginFill(16711680,1);
         aab.graphics.drawRect(0,0,1,1);
         aab.graphics.endFill();
         aab.y = 111;
         addChild(aab);
         aab.visible = false;
      }
   }
}

