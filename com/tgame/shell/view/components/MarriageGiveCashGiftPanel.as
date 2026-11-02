package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class MarriageGiveCashGiftPanel extends FPanel
   {
      
      public static const UI_MARRIAGE_GIVE_CASH_GIFT_GIVE:String = "UI_MARRIAGE_GIVE_CASH_GIFT_GIVE";
      
      public static const UI_MARRIAGE_GIVE_CASH_GIFT_DINE:String = "UI_MARRIAGE_GIVE_CASH_GIFT_DINE";
      
      private var title:FTextArea;
      
      private var giftCount:FTextInput;
      
      private var total:FLabel;
      
      private var giveBtn:SecondButton;
      
      public function MarriageGiveCashGiftPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var tf:TextFormat;
         var ft:FTextArea;
         var fb:FLabel;
         var ico:Bitmap;
         super();
         dragAble = true;
         this.skin = "sceondPanel_btn";
         this.showCloseButton = true;
         width = 271;
         height = 320;
         this.titleText = LanResManager.getLanCommonTextWords("参加婚宴");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.marriage.attend.1.ui";
         addChild(bg);
         bg.x = 6;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         tf = new TextFormat();
         tf.leading = 6;
         this.title = new FTextArea();
         with(this.title)
         {
            x = 6;
            y = 4;
            width = 258;
            height = 20;
            defaultTextFormat = StaticValue.format;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.title);
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 100;
            defaultTextFormat = tf;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'2\'>" + LanResManager.getLanTextWords(this,"赠送红包",[],false) + "</textformat>";
         }
         addChild(ft);
         fb = new FLabel();
         with(fb)
         {
            x = 10;
            y = 163;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("请输入您要赠送的红包铜钱数额") + "：";
         }
         addChild(fb);
         ico = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(ico);
         ico.x = 68;
         ico.y = 182;
         this.giftCount = new FTextInput();
         with(this.giftCount)
         {
            x = 93;
            y = 183;
            restrict = "0-9";
            textColor = StaticValue.ORANGE;
            text = "100000";
         }
         addChild(this.giftCount);
         fb = new FLabel();
         with(fb)
         {
            x = 10;
            y = 209;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("今日累计赠出红包数") + "：";
         }
         addChild(fb);
         this.total = new FLabel();
         with(this.total)
         {
            x = 93;
            y = 230;
            textColor = StaticValue.ORANGE;
            text = "000000";
         }
         addChild(this.total);
         ico = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(ico);
         ico.x = 68;
         ico.y = 229;
         this.giveBtn = new SecondButton();
         this.giveBtn.label = LanResManager.getLanCommonTextWords("送上红包");
         this.giveBtn.toolTip = "<textformat leading=\'6\'><font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanTextWords(this,"红包信息1") + "</font></textformat>";
         addChild(this.giveBtn);
         this.giveBtn.x = (this.panelWidth - this.giveBtn.width) / 2;
         this.giveBtn.y = 267;
         this.giveBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_MARRIAGE_GIVE_CASH_GIFT_GIVE,"",Number(this.giftCount.text)));
      }
      
      public function setName(param1:String) : void
      {
         this.title.text = param1;
      }
      
      public function setCash(param1:Number) : void
      {
         this.total.text = param1.toString();
      }
      
      public function setGiftCount(param1:Number) : void
      {
         this.giftCount.text = param1.toString();
      }
      
      public function setAvatar(param1:int) : void
      {
      }
   }
}

