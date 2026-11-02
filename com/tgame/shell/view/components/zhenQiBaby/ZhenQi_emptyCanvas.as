package com.tgame.shell.view.components.zhenQiBaby
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.ZhenQiBabyPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ZhenQi_emptyCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var container:FCanvas;
      
      private var putBtn:SmallButton;
      
      public var startBtn:SecondButton;
      
      private var zhenqiBar:ColorBar;
      
      private var tip:FTextArea;
      
      private var item1:ItemFace;
      
      private var item2:ItemFace;
      
      public function ZhenQi_emptyCanvas()
      {
         var ft:FTextArea;
         var fb:FLabel;
         var img:Bitmap = null;
         super();
         this.container = new FCanvas();
         this.container.skin = "box";
         addChild(this.container);
         this.container.width = 354;
         this.container.height = 210;
         img = StaticValue.getBitmapByClassName("ui.zhenQiBaby.text.gsjh");
         this.container.addChild(img);
         img.x = 4;
         img.y = 5;
         ft = new FTextArea();
         with(ft)
         {
            x = 4;
            y = 25;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
         }
         ft.htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"充气娃娃",[StaticValue.GREEN_HTML,StaticValue.BLUE_HTML],false) + "</textformat>";
         addChild(ft);
         img = StaticValue.getBitmapByClassName("ui.line");
         this.container.addChild(img);
         img.width = 350;
         img.x = 2;
         img.y = 136;
         this.putBtn = new SmallButton();
         this.putBtn.label = LanResManager.getLanTextWords(this,"放入娃娃");
         addChild(this.putBtn);
         this.putBtn.x = 10;
         this.putBtn.y = 140;
         this.putBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.container.addChild(img);
         img.x = 20;
         img.y = 160;
         img = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         this.container.addChild(img);
         img.rotation = 90;
         img.x = 95;
         img.y = 170;
         fb = new FLabel();
         with(fb)
         {
            x = 96;
            y = 140;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         fb.text = LanResManager.getLanTextWords(this,"所需精魄");
         this.container.addChild(fb);
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.container.addChild(img);
         img.x = 100;
         img.y = 160;
         fb = new FLabel();
         with(fb)
         {
            x = 175;
            y = 140;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         fb.text = LanResManager.getLanTextWords(this,"您拥有真气");
         this.container.addChild(fb);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 155;
            y = 158;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
         }
         this.container.addChild(this.tip);
         img = StaticValue.getBitmapByClassName("ui.char.attribute.colorBar.bg");
         this.container.addChild(img);
         img.x = 230;
         img.y = 142;
         this.zhenqiBar = new ColorBar(5,99,5,true,false);
         this.container.addChild(this.zhenqiBar);
         this.zhenqiBar.x = 235;
         this.zhenqiBar.y = 145;
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanTextWords(this,"开始提取");
         addChild(this.startBtn);
         this.startBtn.enabled = false;
         this.startBtn.x = (width - this.startBtn.width) / 2;
         this.startBtn.y = 220;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.putBtn:
               this.$parent.dispatchEvent(new BaseEvent(ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_PUT_BABY_EMPTYCANVAS));
               break;
            case this.startBtn:
               this.$parent.dispatchEvent(new BaseEvent(ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_SATR_GET));
         }
      }
      
      public function setItem(param1:Goods, param2:Goods) : void
      {
         if(Boolean(this.item1) && Boolean(this.item1.parent))
         {
            this.item1.parent.removeChild(this.item1);
         }
         if(Boolean(this.item2) && Boolean(this.item2.parent))
         {
            this.item2.parent.removeChild(this.item2);
         }
         if(param1)
         {
            this.item1 = new ItemFace(param1);
            this.container.addChild(this.item1);
            this.item1.x = 22;
            this.item1.y = 162;
         }
         if(param2)
         {
            this.item2 = new ItemFace(param2);
            this.container.addChild(this.item2);
            this.item2.x = 102;
            this.item2.y = 162;
            if(param2.count == 0)
            {
               this.item2.filters = Tools.blackWhiteFilter;
            }
         }
      }
      
      public function setCount(param1:int, param2:int, param3:int) : void
      {
         this.tip.htmlText = LanResManager.getLanTextWords(this,"本次提取需要消耗古树精魄1枚",[StaticValue.RED_HTML,param2,param3]);
      }
      
      public function setZhenQi(param1:int) : void
      {
         this.zhenqiBar.setValue(param1,10000);
      }
   }
}

