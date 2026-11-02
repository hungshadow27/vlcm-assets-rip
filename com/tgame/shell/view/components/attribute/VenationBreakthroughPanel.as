package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class VenationBreakthroughPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var addValue1:FTextArea;
      
      private var addValue2:FTextArea;
      
      private var item:ItemFace;
      
      private var tips:FTextArea;
      
      private var okBtn:FSimpleButton;
      
      public function VenationBreakthroughPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var lodImg:DisplayObject;
         var container:Sprite;
         var pointIco:Bitmap;
         var textImg:Bitmap;
         var ft:FTextArea;
         super();
         dragAble = true;
         this.skin = "sceondPanel";
         this.showCloseButton = true;
         width = 410;
         height = 495;
         titleText = LanResManager.getLanTextWords(this,"突破瓶颈");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.attribute.venation.breakthrough.ui";
         addChild(bg);
         bg.x = 6;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         lodImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/venation_long.png",392,102);
         addChild(lodImg);
         lodImg.x = 9;
         lodImg.y = 4;
         container = new Sprite();
         addChild(container);
         container.x = 9;
         container.y = 4;
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point");
         pointIco.name = "1";
         pointIco.x = 52;
         pointIco.y = 34;
         container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point");
         pointIco.name = "2";
         pointIco.x = 58;
         pointIco.y = 55;
         container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point");
         pointIco.name = "3";
         pointIco.x = 106;
         pointIco.y = 61;
         container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point");
         pointIco.name = "4";
         pointIco.x = 153;
         pointIco.y = 29;
         container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point");
         pointIco.name = "5";
         pointIco.x = 205;
         pointIco.y = 30;
         container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point");
         pointIco.name = "6";
         pointIco.x = 216;
         pointIco.y = 60;
         container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point");
         pointIco.name = "7";
         pointIco.x = 269;
         pointIco.y = 46;
         container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point");
         pointIco.name = "8";
         pointIco.x = 318;
         pointIco.y = 33;
         container.addChild(pointIco);
         textImg = StaticValue.getBitmapByClassName("ui.attribute.venation.zhulongjing");
         container.addChild(textImg);
         textImg.x = 340;
         textImg.y = 68;
         ft = new FTextArea();
         with(ft)
         {
            x = 16;
            y = 106;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"经脉突破加成");
         }
         addChild(ft);
         this.addValue1 = new FTextArea();
         with(this.addValue1)
         {
            x = 50;
            y = 122;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = " ";
         }
         addChild(this.addValue1);
         ft = new FTextArea();
         with(ft)
         {
            x = 70;
            y = 160;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"突破瓶颈加成属性");
         }
         addChild(ft);
         lodImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/venation_long.png",392,102);
         addChild(lodImg);
         lodImg.x = 9;
         lodImg.y = 183;
         container = new Sprite();
         addChild(container);
         container.x = 9;
         container.y = 183;
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.zhenlong.ico.point");
         pointIco.name = "1";
         pointIco.x = 52;
         pointIco.y = 34;
         container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.zhenlong.ico.point");
         pointIco.name = "2";
         pointIco.x = 58;
         pointIco.y = 55;
         container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.zhenlong.ico.point");
         pointIco.name = "3";
         pointIco.x = 106;
         pointIco.y = 61;
         container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.zhenlong.ico.point");
         pointIco.name = "4";
         pointIco.x = 153;
         pointIco.y = 29;
         container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.zhenlong.ico.point");
         pointIco.name = "5";
         pointIco.x = 205;
         pointIco.y = 30;
         container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.zhenlong.ico.point");
         pointIco.name = "6";
         pointIco.x = 216;
         pointIco.y = 60;
         container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.zhenlong.ico.point");
         pointIco.name = "7";
         pointIco.x = 269;
         pointIco.y = 46;
         container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.zhenlong.ico.point");
         pointIco.name = "8";
         pointIco.x = 318;
         pointIco.y = 33;
         container.addChild(pointIco);
         textImg = StaticValue.getBitmapByClassName("ui.attribute.venation.zhenlongjing");
         container.addChild(textImg);
         textImg.x = 340;
         textImg.y = 68;
         ft = new FTextArea();
         with(ft)
         {
            x = 16;
            y = 286;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"真龙总计加成属性");
         }
         addChild(ft);
         this.addValue2 = new FTextArea();
         with(this.addValue2)
         {
            x = 50;
            y = 301;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = " ";
         }
         addChild(this.addValue2);
         ft = new FTextArea();
         with(ft)
         {
            x = 50;
            y = 336;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanTextWords(this,"真龙穴位冲穴冲通武学层数",[],false) + "</textformat>";
         }
         addChild(ft);
         textImg = StaticValue.getBitmapByClassName("ui.attribute.venation.longzhu");
         addChild(textImg);
         textImg.x = 14;
         textImg.y = 404;
         this.tips = new FTextArea();
         with(this.tips)
         {
            x = 65;
            y = 413 - 7;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = " ";
         }
         addChild(this.tips);
         this.okBtn = new FSimpleButton();
         this.okBtn.skin = "breakthroughBtn";
         addChild(this.okBtn);
         this.okBtn.x = 354;
         this.okBtn.y = 422 - 12;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_VENATION_BREAKTHROUGH_OK));
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setZhuLongAaddValue(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         this.addValue1.htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"设置筑龙加成属性",[param1,param2,param3,param4,param5,param6,param7],false) + "</textformat>";
      }
      
      public function setZhenLongAaddValue(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         this.addValue2.htmlText = LanResManager.getLanTextWords(this,"设置真龙加成属性",[param1,param2,param3,param4,param5,param6,param7]);
      }
      
      public function setItemAndOther(param1:Goods, param2:int, param3:int, param4:int) : void
      {
         if(Boolean(this.item) && Boolean(this.item.parent))
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         addChild(this.item);
         this.item.x = 16;
         this.item.y = 421;
         if(param1.count == 0)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         this.tips.htmlText = LanResManager.getLanTextWords(this,"设置龙珠及消耗",[param2,param3,param4,StaticValue.BlUE50_HTML]);
      }
      
      public function setItem(param1:Goods) : void
      {
         if(Boolean(this.item) && Boolean(this.item.parent))
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         addChild(this.item);
         this.item.x = 16;
         this.item.y = 421;
         if(param1.count == 0)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
      }
   }
}

