package com.tgame.shell.view.components.fengzhengjie
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class FengzhengjieXunzhangDuihuanPanel extends FPanel
   {
      
      public static const UI_FENGZHENGJIEXUNZHANGDUIHUAN_CLICK:String = "UI_FENGZHENGJIEXUNZHANGDUIHUAN_CLICK";
      
      private var ft:FTextArea;
      
      private var spr:Sprite;
      
      private var btnOk:SecondButton;
      
      private var btnOk1:SecondButton;
      
      private var btnOk2:SecondButton;
      
      private var cas:FCanvas;
      
      public function FengzhengjieXunzhangDuihuanPanel()
      {
         super();
         this.titleText = LanResManager.getLanCommonTextWords("风筝节勋章兑换");
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         width = 300;
         height = 200 + 53 + 110;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function init() : void
      {
         var _loc1_:Bitmap = null;
         var _loc2_:Bitmap = null;
         var _loc3_:Bitmap = null;
         var _loc4_:ItemFace = null;
         this.cas = new FCanvas();
         this.cas.skin = "box";
         this.cas.width = 281;
         this.cas.height = 105;
         this.cas.x = 10;
         this.cas.y = 1;
         addChild(this.cas);
         this.ft = new FTextArea();
         this.ft.htmlText = "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("2个2014风筝节勋章即可兑换1个夏天风筝勋章(1星)") + "</font>";
         this.ft.x = 15;
         this.ft.y = 10;
         this.ft.width = 280;
         this.ft.height = 60;
         this.ft.wordWrap = true;
         addChild(this.ft);
         _loc1_ = new Bitmap();
         _loc1_ = StaticValue.getBitmapByClassName("ui.line");
         _loc1_.x = 10;
         _loc1_.y = 50;
         _loc1_.width = 280;
         addChild(_loc1_);
         _loc2_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc2_.x = 40;
         _loc2_.y = 60;
         addChild(_loc2_);
         this.ft = new FTextArea();
         this.ft.x = 90 - 10;
         this.ft.y = 70;
         this.ft.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\' size=\'14\'> X 2</font>";
         addChild(this.ft);
         _loc3_ = StaticValue.getBitmapByClassName("ui.duanzhao.jiantou");
         _loc3_.x = 135 - 15;
         _loc3_.y = 70;
         addChild(_loc3_);
         _loc4_ = new ItemFace(new Goods(370171));
         _loc4_.x = 42;
         _loc4_.y = 62;
         addChild(_loc4_);
         _loc2_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc2_.x = 195 - 30;
         _loc2_.y = 60;
         addChild(_loc2_);
         _loc4_ = new ItemFace(new Goods(722119));
         _loc4_.x = 197 - 30;
         _loc4_.y = 62;
         addChild(_loc4_);
         this.btnOk = new SecondButton();
         this.btnOk.label = LanResManager.getLanCommonTextWords("兑换");
         this.btnOk.x = 240;
         this.btnOk.y = 65;
         addChild(this.btnOk);
         this.btnOk.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cas = new FCanvas();
         this.cas.skin = "box";
         this.cas.x = 10;
         this.cas.y = 106;
         this.cas.width = 281;
         this.cas.height = 105;
         addChild(this.cas);
         this.ft = new FTextArea();
         this.ft.htmlText = "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("2个夏天风筝勋章(1星)兑换夏天风筝勋章(2星)") + "</font>";
         this.ft.x = 15;
         this.ft.y = 10 + 100;
         this.ft.width = 280;
         this.ft.height = 60;
         this.ft.wordWrap = true;
         addChild(this.ft);
         _loc1_ = new Bitmap();
         _loc1_ = StaticValue.getBitmapByClassName("ui.line");
         _loc1_.x = 10;
         _loc1_.y = 50 + 100;
         _loc1_.width = 280;
         addChild(_loc1_);
         _loc2_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc2_.x = 40;
         _loc2_.y = 60 + 100;
         addChild(_loc2_);
         this.ft = new FTextArea();
         this.ft.x = 90 - 10;
         this.ft.y = 70 + 100;
         this.ft.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\' size=\'14\'> X 2</font>";
         addChild(this.ft);
         _loc3_ = StaticValue.getBitmapByClassName("ui.duanzhao.jiantou");
         _loc3_.x = 135 - 15;
         _loc3_.y = 70 + 100;
         addChild(_loc3_);
         _loc4_ = new ItemFace(new Goods(722119));
         _loc4_.x = 42;
         _loc4_.y = 62 + 100;
         addChild(_loc4_);
         _loc2_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc2_.x = 195 - 30;
         _loc2_.y = 60 + 100;
         addChild(_loc2_);
         _loc4_ = new ItemFace(new Goods(722181));
         _loc4_.x = 197 - 30;
         _loc4_.y = 62 + 100;
         addChild(_loc4_);
         this.btnOk1 = new SecondButton();
         this.btnOk1.label = LanResManager.getLanCommonTextWords("兑换");
         this.btnOk1.x = 240;
         this.btnOk1.y = 65 + 100;
         addChild(this.btnOk1);
         this.btnOk1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cas = new FCanvas();
         this.cas.skin = "box";
         this.cas.x = 10;
         this.cas.y = 106 + 106;
         this.cas.width = 281;
         this.cas.height = 105;
         addChild(this.cas);
         this.ft = new FTextArea();
         this.ft.htmlText = "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("2个夏天风筝勋章(2星)兑换夏天风筝勋章(3星)") + "</font>";
         this.ft.x = 15;
         this.ft.y = 10 + 100 + 106;
         this.ft.width = 280;
         this.ft.height = 60;
         this.ft.wordWrap = true;
         addChild(this.ft);
         _loc1_ = new Bitmap();
         _loc1_ = StaticValue.getBitmapByClassName("ui.line");
         _loc1_.x = 10;
         _loc1_.y = 50 + 100 + 106;
         _loc1_.width = 280;
         addChild(_loc1_);
         _loc2_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc2_.x = 40;
         _loc2_.y = 60 + 100 + 106;
         addChild(_loc2_);
         this.ft = new FTextArea();
         this.ft.x = 90 - 10;
         this.ft.y = 70 + 100 + 106;
         this.ft.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\' size=\'14\'> X 2</font>";
         addChild(this.ft);
         _loc3_ = StaticValue.getBitmapByClassName("ui.duanzhao.jiantou");
         _loc3_.x = 135 - 15;
         _loc3_.y = 70 + 100 + 106;
         addChild(_loc3_);
         _loc4_ = new ItemFace(new Goods(722181));
         _loc4_.x = 42;
         _loc4_.y = 62 + 100 + 106;
         addChild(_loc4_);
         _loc2_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc2_.x = 195 - 30;
         _loc2_.y = 60 + 100 + 106;
         addChild(_loc2_);
         _loc4_ = new ItemFace(new Goods(722277));
         _loc4_.x = 197 - 30;
         _loc4_.y = 62 + 100 + 106;
         addChild(_loc4_);
         this.btnOk2 = new SecondButton();
         this.btnOk2.label = LanResManager.getLanCommonTextWords("兑换");
         this.btnOk2.x = 240;
         this.btnOk2.y = 65 + 100 + 106;
         addChild(this.btnOk2);
         this.btnOk2.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnOk:
               PipeManager.sendMsg(PipeConstants.FENGZHENGJIEDUIHUAN_CLICK,1);
               break;
            case this.btnOk1:
               PipeManager.sendMsg(PipeConstants.FENGZHENGJIEDUIHUAN_CLICK,2);
               break;
            case this.btnOk2:
               PipeManager.sendMsg(PipeConstants.FENGZHENGJIEDUIHUAN_CLICK,3);
         }
      }
   }
}

