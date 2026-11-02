package com.tgame.shell.view.components.couple
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.LaunchProposalPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class BuyGoodsPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var OkBtn:SecondButton;
      
      private var CancelBtn:SecondButton;
      
      private var bgImg:DisplayObject;
      
      private var goodsId:int;
      
      public function BuyGoodsPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var img:Bitmap;
         super();
         skin = "panel_btn";
         dragAble = false;
         showCloseButton = true;
         this.dragRestrict = false;
         width = 348;
         height = 230;
         titleText = LanResManager.getLanTextWords(this,"购买道具");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.marriage.jade.buy.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 100;
            y = 20;
            wordWrap = true;
            width = 415;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            htmlText = LanResManager.getLanTextWords(this,0);
         }
         addChild(this.ft1);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 100;
            y = 43;
            width = 110;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanCommonTextWords("售价：");
         }
         addChild(this.ft);
         img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(img);
         img.x = 133;
         img.y = 41;
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            x = 153;
            y = 43;
            width = 110;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = "122222";
         }
         addChild(this.ft2);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 205;
            y = 43;
            width = 110;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            htmlText = LanResManager.getLanTextWords(this,1);
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 20;
            y = 80;
            width = 110;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            htmlText = "<textformat leading=\'3\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,2) + "<br><font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,3) + "<br><font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,4) + "<br><font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,5) + "<font>" + "</textformat>";
         }
         addChild(this.ft);
         this.OkBtn = new SecondButton();
         this.OkBtn.label = LanResManager.getLanCommonTextWords("购买");
         addChild(this.OkBtn);
         this.OkBtn.x = 85;
         this.OkBtn.y = 165;
         this.OkBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.CancelBtn = new SecondButton();
         this.CancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.CancelBtn);
         this.CancelBtn.x = 220;
         this.CancelBtn.y = 165;
         this.CancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.OkBtn:
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_BUYGOODSPANEL_OK_CLICK,"",this.goodsId));
               break;
            case this.CancelBtn:
               this.onClose();
         }
      }
      
      public function setItem(param1:int, param2:String, param3:String, param4:int) : void
      {
         this.goodsId = param1;
         if(this.bgImg != null)
         {
            removeChild(this.bgImg);
         }
         this.bgImg = FLoader.startLoad(param2,65,65);
         this.bgImg.x = 23;
         this.bgImg.y = 8;
         addChild(this.bgImg);
         this.ft1.htmlText = param3;
         this.ft2.htmlText = String(param4);
      }
   }
}

