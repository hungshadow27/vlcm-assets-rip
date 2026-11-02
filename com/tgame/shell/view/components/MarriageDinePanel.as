package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class MarriageDinePanel extends FPanel
   {
      
      public static const UI_MARRIAGE_DINE_START:String = "UI_MARRIAGE_DINE_START";
      
      private var title:FTextArea;
      
      private var count:FLabel;
      
      private var exp:FLabel;
      
      private var giftTotal:FLabel;
      
      private var okBtn:SecondButton;
      
      public function MarriageDinePanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var tf:TextFormat;
         var fb:FLabel;
         var ft:FTextArea;
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
         bg.name = "ui.marriage.attend.2.ui";
         addChild(bg);
         bg.x = 6;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         tf = new TextFormat();
         tf.align = "center";
         tf.leading = 6;
         this.title = new FTextArea();
         with(this.title)
         {
            x = 6;
            y = 6;
            width = 258;
            height = 20;
            defaultTextFormat = StaticValue.format;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.title);
         fb = new FLabel();
         with(fb)
         {
            x = 10;
            y = 35;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本餐桌上现在食物人数") + "：";
         }
         addChild(fb);
         this.count = new FLabel();
         with(this.count)
         {
            x = 162;
            y = 35;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.count);
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 60;
            defaultTextFormat = tf;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"婚宴信息");
         }
         addChild(ft);
         tf.align = "left";
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 223;
            defaultTextFormat = tf;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"婚宴信息2");
         }
         addChild(ft);
         fb = new FLabel();
         with(fb)
         {
            x = 10;
            y = 127;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("今日食用婚宴所获得经验");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 10;
            y = 174;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("今日食用婚宴所获得真气");
         }
         addChild(fb);
         ico = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(ico);
         ico.x = 68;
         ico.y = 147;
         ico = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(ico);
         ico.x = 68;
         ico.y = 193;
         this.exp = new FLabel();
         with(this.exp)
         {
            x = 92;
            y = 148;
            textColor = StaticValue.ORANGE;
            text = "000000";
         }
         addChild(this.exp);
         this.giftTotal = new FLabel();
         with(this.giftTotal)
         {
            x = 92;
            y = 195;
            textColor = StaticValue.ORANGE;
            text = "000000";
         }
         addChild(this.giftTotal);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("食用餐桌上的菜肴");
         addChild(this.okBtn);
         this.okBtn.x = (this.panelWidth - this.okBtn.width) / 2;
         this.okBtn.y = 267;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
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
         dispatchEvent(new BaseEvent(UI_MARRIAGE_DINE_START));
      }
      
      public function setName(param1:String) : void
      {
         this.title.text = param1;
      }
      
      public function setCash(param1:int) : void
      {
         this.giftTotal.text = param1.toString();
      }
      
      public function setExp(param1:int) : void
      {
         this.exp.text = param1.toString();
      }
      
      public function setFoodCount(param1:Number) : void
      {
         this.count.text = param1.toString();
      }
   }
}

