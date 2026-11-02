package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YNAojianzhizaoPanel1 extends FPanel
   {
      
      public static const UI_YUENANAOJIANZHIZAO_PANEL1_CLICK:String = "UI_YUENANAOJIANZHIZAO_PANEL1_CLICK";
      
      private var ft:FTextArea;
      
      private var btnOK:SecondButton;
      
      private var ftValue:FTextArea;
      
      private var spr:Sprite;
      
      private var goodID:int = 0;
      
      public function YNAojianzhizaoPanel1()
      {
         super();
         skin = "panel_btn";
         width = 300;
         height = 200;
         titleText = LanResManager.getLanCommonTextWords("制造");
         dragAble = true;
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc1_:FCanvas = null;
         _loc1_ = new FCanvas();
         _loc1_.skin = "box";
         _loc1_.x = 10;
         _loc1_.y = 55;
         _loc1_.width = 280;
         _loc1_.height = 70;
         addChild(_loc1_);
         this.ft = new FTextArea();
         this.ft.x = 15;
         this.ft.y = 20;
         this.ft.width = 270;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("消耗制造符一个，可随机生成武器的新属性");
         addChild(this.ft);
         var _loc2_:Bitmap = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc2_.x = 80;
         _loc2_.y = 70;
         addChild(_loc2_);
         this.spr = new Sprite();
         addChild(this.spr);
         this.ft = new FTextArea();
         this.ft.x = 150;
         this.ft.y = 70;
         this.ft.width = 150;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("当前属性：");
         addChild(this.ft);
         this.ftValue = new FTextArea();
         this.ftValue.x = 150;
         this.ftValue.y = 90;
         this.ftValue.width = 150;
         this.ftValue.textColor = StaticValue.WHITE;
         this.ftValue.htmlText = "1000";
         addChild(this.ftValue);
         this.btnOK = new SecondButton();
         this.btnOK.x = 65 + 60;
         this.btnOK.y = 75 + 57;
         this.btnOK.label = LanResManager.getLanCommonTextWords("制造");
         this.btnOK.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnOK);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnOK:
               PipeManager.sendMsg(PipeConstants.SHOW_YUENANAOJIANZHIZAOPANEL2,this.goodID);
         }
      }
      
      public function setData(param1:int, param2:int) : void
      {
         while(this.spr.numChildren > 0)
         {
            this.spr.removeChildAt(0);
         }
         this.goodID = param1;
         var _loc3_:ItemFace = new ItemFace(new Goods(param1));
         _loc3_.x = 82;
         _loc3_.y = 72;
         this.spr.addChild(_loc3_);
         this.ftValue.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2 + "</font>";
      }
   }
}

