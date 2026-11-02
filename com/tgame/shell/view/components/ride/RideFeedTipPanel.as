package com.tgame.shell.view.components.ride
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class RideFeedTipPanel extends FPanel
   {
      
      private var btn:SecondButton;
      
      private var btn1:SecondButton;
      
      public var fun:Function;
      
      private var ftTime:FTextArea;
      
      public function RideFeedTipPanel()
      {
         var ico:Bitmap;
         var tip:FTextArea = null;
         var line:Bitmap = null;
         super();
         this.skin = "panel_btn";
         this.showCloseButton = true;
         this.dragAble = true;
         width = 314;
         height = 285;
         titleText = LanResManager.getLanCommonTextWords("坐骑驯养");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         tip = new FTextArea();
         with(tip)
         {
            x = 20;
            y = 10;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leadin=\'4\'>" + LanResManager.getLanTextWords(this,"炼骨进阶提示") + "</textformat>";
         }
         addChild(tip);
         line = StaticValue.getBitmapByClassName("ui.line");
         addChild(line);
         line.width = 295;
         line.x = 10;
         line.y = tip.y + tip.height + 5;
         tip = new FTextArea();
         with(tip)
         {
            x = 20;
            y = line.y + 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = "<textformat leadin=\'4\'>" + LanResManager.getLanTextWords(this,"祝福值提示") + "</textformat>";
         }
         addChild(tip);
         line = StaticValue.getBitmapByClassName("ui.line");
         addChild(line);
         line.width = 295;
         line.x = 10;
         line.y = tip.y + tip.height;
         this.ftTime = new FTextArea();
         with(this.ftTime)
         {
            width = 240;
            wordWrap = true;
            x = 60;
            y = line.y + 18;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
         }
         addChild(this.ftTime);
         tip = new FTextArea();
         with(tip)
         {
            x = 60;
            y = line.y + 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
         }
         addChild(tip);
         ico = StaticValue.getBitmapByClassName("ui.ride.ico.exclamation");
         addChild(ico);
         ico.x = 22;
         ico.y = 170;
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("我明白了");
         addChild(this.btn);
         this.btn.x = 30;
         this.btn.y = 220;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.btn1 = new SecondButton();
         this.btn1.label = LanResManager.getLanCommonTextWords("继续进阶");
         addChild(this.btn1);
         this.btn1.x = panelWidth - 30 - this.btn1.width;
         this.btn1.y = 220;
         this.btn1.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.fun != null)
         {
            this.fun();
         }
         this.onClose();
      }
      
      private function onClose(param1:* = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setRTime(param1:int) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(param1 == 0)
         {
            this.ftTime.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("每次进阶失败增加祝福值,值越高则下次进阶成功率越高") + "</font>";
         }
         else
         {
            _loc2_ = LanResManager.getLanCommonTextWords("祝福值清空倒计时：");
            _loc3_ = LanResManager.getLanCommonTextWords("时");
            _loc4_ = LanResManager.getLanCommonTextWords("分");
            this.ftTime.htmlText = "";
         }
      }
   }
}

