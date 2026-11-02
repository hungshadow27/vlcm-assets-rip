package com.tgame.shell.view.components.huodong
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class LiandanluPanel extends FPanel
   {
      
      public static const LIANDANLU_QUEREN_CLICK:String = "LIANDANLU_QUEREN_CLICK";
      
      public static const LIANDANLU_SHUAXIN_CLICK:String = "LIANDANLU_SHUAXIN_CLICK";
      
      public static const LIANDANLU_ZHENHUO_SHUAXIN_CLICK:String = "LIANDANLU_ZHENHUO_SHUAXIN_CLICK";
      
      public static const BAOXIANG_QUEREN_CLICK:String = "BAOXIANG_QUEREN_CLICK";
      
      public static const BAOXIANG_QIANGHUA_CLICK:String = "BAOXIANG_QIANGHUA_CLICK";
      
      private var bgCanvas:FCanvas;
      
      private var img:Bitmap;
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var lqBtn:SecondButton;
      
      private var qrBtn:SecondButton;
      
      private var qhBtn:SecondButton;
      
      private var sxBtn:SecondButton;
      
      private var sxBtn1:SecondButton;
      
      private var item:ItemFace;
      
      private var rongqi:Sprite;
      
      private var biaotiBl:int;
      
      private var goodsPos:Point = new Point();
      
      public function LiandanluPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 305;
         height = 200;
         addEventListener(FCloseEvent.CLOSE,this.onClose1);
         titleText = "";
         this.rongqi = new Sprite();
         addChild(this.rongqi);
      }
      
      private function onClose1(param1:FCloseEvent = null) : void
      {
         this.closeFun();
      }
      
      private function closeFun() : void
      {
         var str:String = null;
         if(this.biaotiBl == 1)
         {
            str = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("关闭面板后将不会获得任何道具") + "</font>" + "</textformat>";
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  onClose();
               }
            });
         }
         else if(this.biaotiBl == 2)
         {
            this.onClose();
         }
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(this != null && this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.lqBtn:
               dispatchEvent(new Event(LIANDANLU_QUEREN_CLICK));
               break;
            case this.sxBtn:
               dispatchEvent(new Event(LIANDANLU_SHUAXIN_CLICK));
               break;
            case this.sxBtn1:
               dispatchEvent(new Event(LIANDANLU_ZHENHUO_SHUAXIN_CLICK));
               break;
            case this.qrBtn:
               dispatchEvent(new Event(BAOXIANG_QUEREN_CLICK));
               break;
            case this.qhBtn:
               dispatchEvent(new Event(BAOXIANG_QIANGHUA_CLICK));
         }
      }
      
      public function setChushihua() : void
      {
         this.biaotiBl = 1;
         while(this.rongqi.numChildren > 0)
         {
            this.rongqi.removeChildAt(0);
         }
         width = 305;
         height = 200;
         titleText = LanResManager.getLanCommonTextWords("炼丹炉");
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.rongqi.addChild(this.img);
         this.img.x = 120 - 35 + 45;
         this.img.y = 15 - 3 + 10;
         this.goodsPos.x = this.img.x + 2;
         this.goodsPos.y = this.img.y + 2;
         this.img = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         this.rongqi.addChild(this.img);
         this.img.width = 193 + 90;
         this.img.height = 25 + 20;
         this.img.x = 11;
         this.img.y = 60 + 20;
         this.img = StaticValue.getBitmapByClassName("ui.line");
         this.rongqi.addChild(this.img);
         this.img.width = 193 + 90;
         this.img.x = 11;
         this.img.y = 60 + 30 - 3 - 5;
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 50 + 15;
            y = 65 + 30 - 3 - 3;
            textColor = StaticValue.GREEN;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = LanResManager.getLanCommonTextWords("元宝刷新: 每次消耗2元宝") + "<br>" + LanResManager.getLanCommonTextWords("炼丹真火刷新: 每次消耗炼丹真火x1");
         }
         this.rongqi.addChild(this.fta);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 170 - 40 + 45;
            y = 27 - 3 + 10;
            textColor = StaticValue.ORANGE;
            autoSize = TextFieldAutoSize.LEFT;
         }
         this.rongqi.addChild(this.fta1);
         this.lqBtn = new SecondButton();
         this.lqBtn.label = LanResManager.getLanCommonTextWords("确认领取");
         this.rongqi.addChild(this.lqBtn);
         this.lqBtn.x = 30 - 5 - 2;
         this.lqBtn.y = 95 + 40;
         this.lqBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.sxBtn = new SecondButton();
         this.sxBtn.label = LanResManager.getLanCommonTextWords("元宝刷新");
         this.sxBtn.x = 135 - 15 - 10 - 5;
         this.sxBtn.y = 95 + 40;
         this.rongqi.addChild(this.sxBtn);
         this.sxBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.sxBtn1 = new SecondButton();
         this.sxBtn1.label = LanResManager.getLanCommonTextWords("炼丹真火刷新");
         this.sxBtn1.x = 135 + 50 + 2;
         this.sxBtn1.y = 95 + 40;
         this.rongqi.addChild(this.sxBtn1);
         this.sxBtn1.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function setBaoxiangChushihua() : void
      {
         this.biaotiBl = 2;
         while(this.rongqi.numChildren > 0)
         {
            this.rongqi.removeChildAt(0);
         }
         width = 305 - 90;
         height = 200 - 40;
         titleText = LanResManager.getLanCommonTextWords("宝箱强化");
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.rongqi.addChild(this.img);
         this.img.x = 120 - 35;
         this.img.y = 15 - 3;
         this.goodsPos.x = this.img.x + 2;
         this.goodsPos.y = this.img.y + 2;
         this.img = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         this.rongqi.addChild(this.img);
         this.img.width = 193;
         this.img.height = 25;
         this.img.x = 11;
         this.img.y = 60;
         this.img = StaticValue.getBitmapByClassName("ui.line");
         this.rongqi.addChild(this.img);
         this.img.width = 193;
         this.img.x = 11;
         this.img.y = 60;
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 50;
            y = 65;
            textColor = StaticValue.GREEN;
            autoSize = TextFieldAutoSize.LEFT;
         }
         this.rongqi.addChild(this.fta);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 170 - 40;
            y = 27 - 3;
            textColor = StaticValue.ORANGE;
            autoSize = TextFieldAutoSize.LEFT;
         }
         this.rongqi.addChild(this.fta1);
         this.qrBtn = new SecondButton();
         this.qrBtn.label = LanResManager.getLanCommonTextWords("确认领取");
         this.rongqi.addChild(this.qrBtn);
         this.qrBtn.x = 30;
         this.qrBtn.y = 95;
         this.qrBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.qhBtn = new SecondButton();
         this.qhBtn.label = LanResManager.getLanCommonTextWords("强化");
         this.qhBtn.x = 135;
         this.qhBtn.y = 95;
         this.rongqi.addChild(this.qhBtn);
         this.qhBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function setGoods(param1:Goods) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = this.goodsPos.x;
         this.item.y = this.goodsPos.y;
         this.rongqi.addChild(this.item);
      }
      
      public function setNum(param1:int) : void
      {
         this.fta1.htmlText = "×" + param1;
      }
      
      public function setQianghua(param1:int) : void
      {
         this.fta.text = LanResManager.getLanCommonTextWords("消耗") + param1 + LanResManager.getLanCommonTextWords("元宝强化材料宝箱");
      }
   }
}

