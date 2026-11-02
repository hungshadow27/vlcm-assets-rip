package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YNAojianzhizaoPanel2 extends FPanel
   {
      
      public static const UI_YUENANAOJIANZHIZAO_CLICK:String = "UI_YUENANAOJIANZHIZAO_CLICK";
      
      private var ft:FTextArea;
      
      private var btnOld:SecondButton;
      
      private var btnNew:SecondButton;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var bit1:Bitmap;
      
      private var bit2:Bitmap;
      
      private var ftValue1:FTextArea;
      
      private var ftValue2:FTextArea;
      
      private var spr:Sprite;
      
      public function YNAojianzhizaoPanel2()
      {
         super();
         skin = "panel_btn";
         width = 300;
         height = 240;
         titleText = LanResManager.getLanCommonTextWords("傲剑制造");
         dragAble = true;
         this.init();
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function init() : void
      {
         var _loc1_:FCanvas = null;
         _loc1_ = new FCanvas();
         _loc1_.skin = "box";
         _loc1_.x = 10;
         _loc1_.y = 55;
         _loc1_.width = 280;
         _loc1_.height = 110;
         addChild(_loc1_);
         this.ft = new FTextArea();
         this.ft.x = 35;
         this.ft.y = 10;
         this.ft.width = 270;
         this.ft.height = 50;
         this.ft.wordWrap = true;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("点击‘原来’按钮，武器属性不变；") + "<br>" + LanResManager.getLanCommonTextWords("点击‘新属性’按钮，则武器属性变为新属性");
         addChild(this.ft);
         this.bit1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.bit1.x = 50 + 15;
         this.bit1.y = 70;
         addChild(this.bit1);
         this.bit2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.bit2.x = 190;
         this.bit2.y = 70;
         addChild(this.bit2);
         this.ft1 = new FTextArea();
         this.ft1.x = 45 + 13;
         this.ft1.y = 110;
         this.ft1.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前属性：") + "</font>";
         addChild(this.ft1);
         this.ftValue1 = new FTextArea();
         this.ftValue1.x = 45 + 15;
         this.ftValue1.y = 130;
         this.ftValue1.width = 120;
         this.ftValue1.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>10000</font>";
         addChild(this.ftValue1);
         this.ft2 = new FTextArea();
         this.ft2.x = 190;
         this.ft2.y = 110;
         this.ft2.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("新属性：") + "</font>";
         addChild(this.ft2);
         this.ftValue2 = new FTextArea();
         this.ftValue2.x = 190;
         this.ftValue2.y = 130;
         this.ftValue2.width = 120;
         this.ftValue2.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>10000</font>";
         addChild(this.ftValue2);
         this.btnOld = new SecondButton();
         this.btnOld.x = 65 - 15;
         this.btnOld.y = 75 + 57 + 40;
         this.btnOld.label = LanResManager.getLanCommonTextWords("原来");
         this.btnOld.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnOld);
         this.btnNew = new SecondButton();
         this.btnNew.x = 185 - 15;
         this.btnNew.y = 75 + 57 + 40;
         this.btnNew.label = LanResManager.getLanCommonTextWords("新属性");
         this.btnNew.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnNew);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnOld:
               dispatchEvent(new BaseEvent(UI_YUENANAOJIANZHIZAO_CLICK,"",1));
               break;
            case this.btnNew:
               dispatchEvent(new BaseEvent(UI_YUENANAOJIANZHIZAO_CLICK,"",2));
         }
      }
      
      public function setData1(param1:int, param2:String, param3:int, param4:String) : void
      {
         var _loc5_:ItemFace = new ItemFace(new Goods(param1));
         _loc5_.x = 67;
         _loc5_.y = 72;
         addChild(_loc5_);
         this.bit1.x = 50 + 15;
         this.bit1.y = 70;
         this.bit2.x = 190;
         this.bit2.y = 70;
         this.ft1.x = 45 + 13 - 30;
         this.ft1.y = 110;
         this.ft2.x = 190 - 30;
         this.ft2.y = 110;
         this.ftValue1.x = 45 + 15 - 30;
         this.ftValue1.y = 130;
         this.ftValue2.x = 190 - 30;
         this.ftValue2.y = 130;
         this.ftValue1.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param2 + "</font>";
         this.ftValue2.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param4 + "</font>";
         _loc5_ = new ItemFace(new Goods(param3));
         _loc5_.x = 192;
         _loc5_.y = 72;
         addChild(_loc5_);
      }
      
      public function setData2(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         this.bit1.x = 65 - 40 - 8;
         this.bit1.y = 96;
         this.bit2.x = 190 - 35 - 5;
         this.bit2.y = 96;
         this.ft1.y = 60;
         this.ft1.x = 45 + 13 - 15;
         this.ft2.y = 60;
         this.ft2.x = 190 - 15;
         var _loc9_:ItemFace = new ItemFace(new Goods(param1));
         _loc9_.x = 67 - 40 - 8;
         _loc9_.y = 72 + 20;
         addChild(_loc9_);
         this.ftValue1.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + param2 + "<br>" + LanResManager.getLanCommonTextWords("防御：") + param3 + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + param4 + "</font>";
         this.ftValue1.x = 80 - 18 - 3;
         this.ftValue1.y = 95;
         this.ftValue2.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + param6 + "<br>" + LanResManager.getLanCommonTextWords("防御：") + param7 + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + param8 + "</font>";
         this.ftValue2.x = 200 - 10;
         this.ftValue2.y = 95;
         _loc9_ = new ItemFace(new Goods(param5));
         _loc9_.x = 192 - 35 - 5;
         _loc9_.y = 72 + 20;
         addChild(_loc9_);
      }
   }
}

