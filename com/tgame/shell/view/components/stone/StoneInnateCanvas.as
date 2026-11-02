package com.tgame.shell.view.components.stone
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.StonePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.*;
   import flash.text.*;
   
   public class StoneInnateCanvas extends FCanvas
   {
      
      public var $parent:DisplayObject;
      
      private var item1:ItemFace;
      
      private var item2:ItemFace;
      
      private var item3:ItemFace;
      
      private var item4:ItemFace;
      
      private var item5:ItemFace;
      
      private var item6:ItemFace;
      
      private var btn1:SmallButton;
      
      private var btn2:SmallButton;
      
      private var btn3:SmallButton;
      
      private var btn4:SmallButton;
      
      private var btn5:SmallButton;
      
      private var btn6:SmallButton;
      
      private var container1:Sprite;
      
      private var container2:Sprite;
      
      private var container3:Sprite;
      
      private var container4:Sprite;
      
      private var container5:Sprite;
      
      private var container6:Sprite;
      
      public function StoneInnateCanvas()
      {
         var ft:FTextArea;
         var line:Bitmap = null;
         super();
         skin = "box";
         width = 307;
         height = 299;
         ft = new FTextArea();
         with(ft)
         {
            x = 5;
            y = 5;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"宝石限时兑换面板活动说明",[StaticValue.RED_HTML]);
         }
         addChild(ft);
         line = StaticValue.getBitmapByClassName("ui.line");
         addChild(line);
         line.x = 2;
         line.y = ft.y + ft.height + 5;
         line.width = 303;
         this.container1 = new Sprite();
         this.container1.x = 2;
         this.container1.y = line.y;
         addChild(this.container1);
         this.container1.name = "container1";
         this.container2 = new Sprite();
         this.container2.x = 2;
         this.container2.y = this.container1.y + 40;
         addChild(this.container2);
         this.container2.name = "container2";
         this.container3 = new Sprite();
         this.container3.x = 2;
         this.container3.y = this.container1.y + 40 * 2;
         addChild(this.container3);
         this.container3.name = "container3";
         this.container4 = new Sprite();
         this.container4.x = 2;
         this.container4.y = this.container1.y + 40 * 3;
         addChild(this.container4);
         this.container4.name = "container4";
         this.container5 = new Sprite();
         this.container5.x = 2;
         this.container5.y = this.container1.y + 40 * 4;
         addChild(this.container5);
         this.container5.name = "container5";
         this.container6 = new Sprite();
         this.container6.x = 2;
         this.container6.y = this.container1.y + 40 * 5;
         addChild(this.container6);
         this.container6.name = "container6";
         ft = new FTextArea();
         with(ft)
         {
            x = 60;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanTextWords(this,"六品红宝石",[StaticValue.GREEN_HTML]);
         }
         this.container1.addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 60;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanTextWords(this,"六品黄玛瑙",[StaticValue.GREEN_HTML]);
         }
         this.container2.addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 60;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanTextWords(this,"六品蓝水晶",[StaticValue.GREEN_HTML]);
         }
         this.container3.addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 60;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanTextWords(this,"六品绿翡翠",[StaticValue.GREEN_HTML]);
         }
         this.container4.addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 60;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanTextWords(this,"六品白珍珠",[StaticValue.GREEN_HTML]);
         }
         this.container5.addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 60;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanTextWords(this,"六品黑暖玉1",[StaticValue.GREEN_HTML]);
         }
         this.container6.addChild(ft);
         this.btn1 = new SmallButton();
         with(this.btn1)
         {
            label = LanResManager.getLanCommonTextWords("兑换");
            x = 265;
            y = 15;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         this.container1.addChild(this.btn1);
         this.btn2 = new SmallButton();
         with(this.btn2)
         {
            label = LanResManager.getLanCommonTextWords("兑换");
            x = 265;
            y = 15;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         this.container2.addChild(this.btn2);
         this.btn3 = new SmallButton();
         with(this.btn3)
         {
            label = LanResManager.getLanCommonTextWords("兑换");
            x = 265;
            y = 15;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         this.container3.addChild(this.btn3);
         this.btn4 = new SmallButton();
         with(this.btn4)
         {
            label = LanResManager.getLanCommonTextWords("兑换");
            x = 265;
            y = 15;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         this.container4.addChild(this.btn4);
         this.btn5 = new SmallButton();
         with(this.btn5)
         {
            label = LanResManager.getLanCommonTextWords("兑换");
            x = 265;
            y = 15;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         this.container5.addChild(this.btn5);
         this.btn6 = new SmallButton();
         with(this.btn6)
         {
            label = LanResManager.getLanCommonTextWords("兑换");
            x = 265;
            y = 15;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         this.container6.addChild(this.btn6);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn1:
               this.$parent.dispatchEvent(new BaseEvent(StonePanel.UI_STONE_PANEL_EXCHANGE_OK,"",this.item1.getBaseItem().id));
               break;
            case this.btn2:
               this.$parent.dispatchEvent(new BaseEvent(StonePanel.UI_STONE_PANEL_EXCHANGE_OK,"",this.item2.getBaseItem().id));
               break;
            case this.btn3:
               this.$parent.dispatchEvent(new BaseEvent(StonePanel.UI_STONE_PANEL_EXCHANGE_OK,"",this.item3.getBaseItem().id));
               break;
            case this.btn4:
               this.$parent.dispatchEvent(new BaseEvent(StonePanel.UI_STONE_PANEL_EXCHANGE_OK,"",this.item4.getBaseItem().id));
               break;
            case this.btn5:
               this.$parent.dispatchEvent(new BaseEvent(StonePanel.UI_STONE_PANEL_EXCHANGE_OK,"",this.item5.getBaseItem().id));
               break;
            case this.btn6:
               this.$parent.dispatchEvent(new BaseEvent(StonePanel.UI_STONE_PANEL_EXCHANGE_OK,"",this.item6.getBaseItem().id));
         }
      }
      
      public function setStone(param1:Array) : void
      {
         if(Boolean(this.item1) && Boolean(this.item1.parent))
         {
            this.item1.parent.removeChild(this.item1);
         }
         this.item1 = new ItemFace(param1[0]);
         this.container1.addChild(this.item1);
         this.item1.x = 5;
         this.item1.y = 3;
         if(Boolean(this.item2) && Boolean(this.item2.parent))
         {
            this.item2.parent.removeChild(this.item2);
         }
         this.item2 = new ItemFace(param1[1]);
         this.container2.addChild(this.item2);
         this.item2.x = 5;
         this.item2.y = 3;
         if(Boolean(this.item3) && Boolean(this.item3.parent))
         {
            this.item3.parent.removeChild(this.item3);
         }
         this.item3 = new ItemFace(param1[2]);
         this.container3.addChild(this.item3);
         this.item3.x = 5;
         this.item3.y = 3;
         if(Boolean(this.item4) && Boolean(this.item4.parent))
         {
            this.item4.parent.removeChild(this.item4);
         }
         this.item4 = new ItemFace(param1[3]);
         this.container4.addChild(this.item4);
         this.item4.x = 5;
         this.item4.y = 3;
         if(Boolean(this.item5) && Boolean(this.item5.parent))
         {
            this.item5.parent.removeChild(this.item5);
         }
         this.item5 = new ItemFace(param1[4]);
         this.container5.addChild(this.item5);
         this.item5.x = 5;
         this.item5.y = 3;
         if(Boolean(this.item6) && Boolean(this.item6.parent))
         {
            this.item6.parent.removeChild(this.item6);
         }
         this.item6 = new ItemFace(param1[5]);
         this.container6.addChild(this.item6);
         this.item6.x = 5;
         this.item6.y = 3;
      }
   }
}

