package com.tgame.shell.view.components.huodong
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class XianshiLingquPanel extends FPanel
   {
      
      public static const UI_XIANSHILINGQU_OK:String = "UI_XIANSHILINGQU_OK";
      
      private var line:Bitmap;
      
      private var okBtn:SecondButton;
      
      private var item:ItemFace;
      
      private var tips:FTextArea;
      
      private var myTimer:Timer;
      
      private var Ti:int;
      
      private var lb:FLabel;
      
      private var fta:FTextArea;
      
      public function XianshiLingquPanel(param1:Goods, param2:int)
      {
         var go:Goods = param1;
         var int1:int = param2;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 350;
         height = 175;
         titleText = LanResManager.getLanCommonTextWords("限时领取");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.lb = new FLabel();
         this.lb.text = "";
         this.lb.x = 25;
         this.lb.y = 10;
         this.lb.filters = StaticValue.filter;
         this.lb.textColor = StaticValue.ORANGE;
         addChild(this.lb);
         this.line = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.line);
         this.line.x = 25;
         this.line.y = 30;
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.okBtn);
         this.okBtn.x = 22;
         this.okBtn.y = 80;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta = new FTextArea();
         with(this.fta)
         {
            wordWrap = true;
            filters = StaticValue.filter;
            width = 250;
            height = 100;
            x = 80;
            y = 25;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.fta);
         this.tips = new FTextArea();
         with(this.tips)
         {
            x = 120;
            y = 85 + 25;
            width = 245;
            height = 20;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("倒计时：") + "</textformat>";
         }
         addChild(this.tips);
         this.myTimer = new Timer(1000,400);
         this.myTimer.addEventListener("timer",this.countDownFun);
         this.setGoods(go);
         this.setTimer(int1);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               dispatchEvent(new BaseEvent(UI_XIANSHILINGQU_OK));
         }
      }
      
      private function countDownFun(param1:TimerEvent) : void
      {
         --this.Ti;
         this.tips.htmlText = "【" + LanResManager.getLanCommonTextWords("倒计时：") + this.Ti + "】";
         if(this.Ti == 0)
         {
            this.myTimer.stop();
            this.onClose();
         }
      }
      
      public function setGoods(param1:Goods) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 27;
         this.item.y = 32;
         addChild(this.item);
         this.lb.text = param1.res.name;
      }
      
      public function setTimer(param1:int) : void
      {
         this.fta.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"使用说明秒钟内疯狂的点击提取按钮点击的次数越多获得的数量越多",[StaticValue.WHITE_HTML,StaticValue.WHITE_HTML,param1,StaticValue.GREEN_HTML,this.lb.text,StaticValue.WHITE_HTML,StaticValue.WHITE_HTML,param1]) + "</textformat>";
         this.Ti = param1;
         this.tips.htmlText = "【" + LanResManager.getLanCommonTextWords("倒计时：") + this.Ti + "】";
         this.myTimer.stop();
         this.myTimer.reset();
         this.myTimer.repeatCount = this.Ti;
         this.myTimer.start();
      }
   }
}

