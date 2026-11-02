package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class QingGongYanPanel extends FPanel
   {
      
      public static const UI_QINGGONGYAN_START:String = "UI_QINGGONGYAN_START";
      
      public static const UI_OPEN_SHANGCHENG:String = "UI_OPEN_SHANGCHENG";
      
      private var title:FTextArea;
      
      private var count:FLabel;
      
      private var exp:FLabel;
      
      private var okBtn:SecondButton;
      
      private var shangchengBtn:SecondButton;
      
      private var barbg:Bitmap;
      
      private var fc1:FCanvas;
      
      public function QingGongYanPanel()
      {
         var fb:FLabel;
         var ft:FTextArea;
         var img:F9GridBitmap;
         var tf:TextFormat = null;
         var img1:F9GridBitmap = null;
         super();
         dragAble = true;
         this.skin = "sceondPanel_btn";
         this.showCloseButton = true;
         width = 271;
         height = 320;
         this.titleText = LanResManager.getLanCommonTextWords("庆功宴");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.fc1 = new FCanvas();
         this.fc1.width = 258;
         this.fc1.height = 50;
         this.fc1.x = 6;
         this.fc1.y = 100;
         this.fc1.skin = "box";
         addChild(this.fc1);
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
         this.barbg = StaticValue.getBitmapByClassName("ui.18zhang.tiao");
         addChild(this.barbg);
         this.barbg.width = 265;
         this.barbg.x = 2;
         this.barbg.y = 32;
         img1 = Tools.get9GridBitmpByName("countBg");
         addChild(img1);
         img1.width = 70;
         img1.x = 155;
         img1.y = 33;
         fb = new FLabel();
         with(fb)
         {
            x = 10;
            y = 35;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本餐桌上现在食物份数");
         }
         addChild(fb);
         this.count = new FLabel();
         with(this.count)
         {
            x = 158;
            y = 35;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "30";
         }
         this.count.width = 65;
         this.count.autoSize = TextFieldAutoSize.CENTER;
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
            text = "    " + LanResManager.getLanCommonTextWords("不用多想食物不多手快有手慢没") + "\n    " + LanResManager.getLanCommonTextWords("食用菜肴所得经验数值随机加成");
         }
         addChild(ft);
         tf.align = "left";
         ft = new FTextArea();
         with(ft)
         {
            x = 8;
            y = 155;
            defaultTextFormat = tf;
            width = 258;
            height = 100;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("庆功宴信息");
         }
         ft.multiline = true;
         ft.wordWrap = true;
         addChild(ft);
         fb = new FLabel();
         with(fb)
         {
            x = 10;
            y = 107;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("今日食用婚宴所获得经验");
         }
         addChild(fb);
         img = Tools.get9GridBitmpByName("countBg");
         addChild(img);
         img.width = 170;
         img.x = 50;
         img.y = 125;
         this.exp = new FLabel();
         with(this.exp)
         {
            x = 52;
            y = 126;
            textColor = StaticValue.ORANGE;
            text = "";
         }
         this.exp.width = 160;
         this.exp.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.exp);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("食用餐桌上的菜肴");
         addChild(this.okBtn);
         this.okBtn.x = 40;
         this.okBtn.y = 267;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shangchengBtn = new SecondButton();
         this.shangchengBtn.label = LanResManager.getLanCommonTextWords("商城");
         addChild(this.shangchengBtn);
         this.shangchengBtn.y = 267;
         this.shangchengBtn.x = 180;
         this.shangchengBtn.addEventListener(MouseEvent.CLICK,this.onShangChengClick);
      }
      
      private function onShangChengClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_OPEN_SHANGCHENG));
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
         dispatchEvent(new BaseEvent(UI_QINGGONGYAN_START));
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setShengyuFenshu(param1:int) : void
      {
         this.count.text = param1.toString();
      }
      
      public function setJingYan(param1:int) : void
      {
         this.exp.text = param1.toString();
      }
      
      public function setPlayerName(param1:String) : void
      {
         this.title.text = param1 + LanResManager.getLanCommonTextWords("的庆功宴");
      }
      
      public function hide() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

