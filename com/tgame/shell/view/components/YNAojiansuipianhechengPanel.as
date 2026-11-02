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
   import flash.events.MouseEvent;
   
   public class YNAojiansuipianhechengPanel extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var btnOK:SecondButton;
      
      private var btnCancle:SecondButton;
      
      private var ftName:FTextArea;
      
      public function YNAojiansuipianhechengPanel()
      {
         super();
         skin = "panel_btn";
         width = 300;
         height = 200;
         titleText = LanResManager.getLanCommonTextWords("傲剑碎片兑换");
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
         this.ft.x = 55;
         this.ft.y = 15;
         this.ft.width = 270;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("傲剑碎片*88") + "  －〉 " + LanResManager.getLanCommonTextWords("（绑定）傲剑袋*1");
         addChild(this.ft);
         var _loc2_:Bitmap = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc2_.x = 50;
         _loc2_.y = 70;
         addChild(_loc2_);
         _loc2_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc2_.x = 190;
         _loc2_.y = 70;
         addChild(_loc2_);
         var _loc3_:ItemFace = new ItemFace(new Goods(9759));
         _loc3_.x = 52;
         _loc3_.y = 72;
         addChild(_loc3_);
         var _loc4_:Bitmap = StaticValue.getBitmapByClassName("ui.duanzhao.jiantou");
         _loc4_.x = 135;
         _loc4_.y = 80;
         addChild(_loc4_);
         _loc3_ = new ItemFace(new Goods(722247));
         _loc3_.x = 192;
         _loc3_.y = 72;
         addChild(_loc3_);
         this.ft = new FTextArea();
         this.ft.x = 92;
         this.ft.y = 85;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'> X 500</font>";
         addChild(this.ft);
         this.btnOK = new SecondButton();
         this.btnOK.x = 65;
         this.btnOK.y = 75 + 57;
         this.btnOK.label = LanResManager.getLanCommonTextWords("兑换");
         this.btnOK.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnOK);
         this.btnCancle = new SecondButton();
         this.btnCancle.x = 185;
         this.btnCancle.y = 75 + 57;
         this.btnCancle.label = LanResManager.getLanCommonTextWords("取消");
         this.btnCancle.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnCancle);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnOK:
               PipeManager.sendMsg(PipeConstants.SEND_YUENANAOJIANHECHENG);
               break;
            case this.btnCancle:
               this.onClose();
         }
      }
   }
}

