package com.tgame.shell.view.components.attribute
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FAlertEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   import gs.TweenMax;
   
   public class XisuijingTupoCanvas extends Sprite
   {
      
      public var _parent2:DisplayObject;
      
      public var _parent3:DisplayObject;
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var zhufuzhi:int;
      
      private var xingyunzhiNum:int;
      
      private var jiyuanzhi:int;
      
      private var jiyuanzhiNum:int;
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var ft:FTextArea;
      
      private var img:Bitmap;
      
      private var img1:Bitmap;
      
      private var img2:Bitmap;
      
      private var CjBar1:ColorBar;
      
      private var CjBar2:ColorBar;
      
      private var shuomingFta1:FTextArea;
      
      private var fb1:FLabel;
      
      private var buyBtn:SecondButton;
      
      private var goodsId:int;
      
      private var kslwBtn:SecondButton;
      
      private var zdlwBtn:SecondButton;
      
      private var zjlwBtn:SecondButton;
      
      private var item:ItemFace;
      
      public function XisuijingTupoCanvas()
      {
         var fc:FCanvas = null;
         super();
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 270;
         this.bgCanvas.height = 385;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         fc = new FCanvas();
         fc.skin = "canvas1";
         fc.x = 0;
         fc.y = 0;
         fc.width = 270;
         fc.height = 385;
         addChild(fc);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 20;
            y = 15;
            width = 230;
            height = 110;
            textColor = 15100454;
            wordWrap = true;
            htmlText = "";
         }
         addChild(this.fta1);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            x = 20;
            y = 132;
            textColor = StaticValue.ORANGE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("领悟祝福值") + "</font>";
         }
         addChild(this.fta2);
         this.img2 = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(this.img2);
         this.img2.width = 170;
         this.img2.x = 50;
         this.img2.y = 155;
         this.CjBar2 = new ColorBar(5,132,11);
         addChild(this.CjBar2);
         this.CjBar2.x = 69;
         this.CjBar2.y = 158;
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 20;
            y = 180;
            textColor = StaticValue.YELLOW;
            width = 240;
            height = 110;
            wordWrap = true;
            htmlText = LanResManager.getLanTextWords(this,"领悟失败将会增加祝福值祝福值越高则下次领悟成功几率越高每日凌",[StaticValue.BlUE20_HTML,StaticValue.BlUE20_HTML,StaticValue.RED_HTML,StaticValue.RED_HTML]) + "</textformat>";
         }
         addChild(this.fta);
         this.fb1 = new FLabel();
         with(this.fb1)
         {
            x = 25;
            y = 265;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("易筋丹");
         }
         addChild(this.fb1);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 25;
         this.img.y = 282;
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         this.buyBtn.x = 23;
         this.buyBtn.y = 323;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft = new FTextArea();
         with(this.ft)
         {
            filters = StaticValue.filter;
            x = 75;
            y = 275;
            textColor = StaticValue.BlUE20;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.ft);
         this.kslwBtn = new SecondButton();
         this.kslwBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         addChild(this.kslwBtn);
         this.kslwBtn.x = 43;
         this.kslwBtn.y = 350;
         this.kslwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdlwBtn = new SecondButton();
         this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         addChild(this.zdlwBtn);
         this.zdlwBtn.x = 163;
         this.zdlwBtn.y = 350;
         this.zdlwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         var str:String = null;
         var e:MouseEvent = param1;
         if(this.zhufuzhi > 0)
         {
            str = "";
            str = LanResManager.getLanTextWords(this,"洗髓经领悟祝福值重要提示洗髓经领悟失败将会增加一定的祝福值祝",[StaticValue.RED_HTML,StaticValue.GREEN_HTML,StaticValue.GREEN_HTML,StaticValue.RED_HTML,this.zhufuzhi,StaticValue.RED_HTML,StaticValue.RED_HTML]) + "</textformat>";
            FAlert.okLabel = LanResManager.getLanCommonTextWords("关闭面板");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("继续领悟");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  _parent3.dispatchEvent(new BaseEvent(Xisuijing.UI_YIJINJING_GUANBI_CLICK_X));
               }
            });
         }
         else
         {
            this._parent3.dispatchEvent(new BaseEvent(Xisuijing.UI_YIJINJING_GUANBI_CLICK_X));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.kslwBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_KAISHITISHENG_CLICKJ_X));
               break;
            case this.zdlwBtn:
               if(this.zdlwBtn.label == LanResManager.getLanCommonTextWords("自动领悟"))
               {
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_ZIDONGTISHENG_CLICKJ_X,"",true));
               }
               else
               {
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_ZIDONGTISHENG_CLICKJ_X,"",false));
               }
               break;
            case this.zjlwBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_ZHIJIETISHENG_CLICKJ_X));
               break;
            case this.buyBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_GOUMAI_CLICK_X,"",this.goodsId));
         }
      }
      
      private function aa(param1:Event = null) : void
      {
         var e:Event = param1;
         var ftaw:FTextArea = new FTextArea();
         with(ftaw)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.CENTER;
            x = 69;
            y = 155;
            textColor = StaticValue.YELLOW;
            width = 132;
            if(xingyunzhiNum >= 0)
            {
               htmlText = LanResManager.getLanCommonTextWords("祝福值") + String(xingyunzhiNum);
            }
            else
            {
               htmlText = LanResManager.getLanCommonTextWords("祝福值") + String(xingyunzhiNum);
            }
         }
         addChild(ftaw);
         TweenMax.to(ftaw,1,{
            "y":120,
            "onComplete":this.onCom1,
            "onCompleteParams":[ftaw]
         });
      }
      
      private function onCom1(param1:FTextArea) : void
      {
         if(param1 != null && param1.parent != null)
         {
            param1.parent.removeChild(param1);
         }
      }
      
      private function bb(param1:Event = null) : void
      {
         var e:Event = param1;
         var ftaw:FTextArea = new FTextArea();
         with(ftaw)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.CENTER;
            x = 69;
            y = 35;
            textColor = StaticValue.YELLOW;
            width = 132;
            if(jiyuanzhiNum >= 0)
            {
               htmlText = LanResManager.getLanCommonTextWords("机缘值") + String(jiyuanzhiNum);
            }
            else
            {
               htmlText = LanResManager.getLanCommonTextWords("机缘值") + String(jiyuanzhiNum);
            }
         }
         addChild(ftaw);
         TweenMax.to(ftaw,1,{
            "y":0,
            "onComplete":this.onCom2,
            "onCompleteParams":[ftaw]
         });
      }
      
      private function onCom2(param1:FTextArea) : void
      {
         if(param1 != null && param1.parent != null)
         {
            param1.parent.removeChild(param1);
         }
      }
      
      public function setInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:String) : void
      {
         var _loc8_:String = "";
         _loc8_ = _loc8_ + "<textformat leading=\'6\'>";
         if(param2)
         {
            _loc8_ += LanResManager.getLanCommonTextWords("领悟前提：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1 + "</font><br>";
         }
         else
         {
            _loc8_ += LanResManager.getLanCommonTextWords("领悟前提：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param1 + "</font><br>";
         }
         if(param5)
         {
            _loc8_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param3 + param4 + LanResManager.getLanCommonTextWords("颗") + "</font><br>";
         }
         else
         {
            _loc8_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param3 + param4 + LanResManager.getLanCommonTextWords("颗") + "</font><br>";
         }
         _loc8_ += LanResManager.getLanCommonTextWords("领悟成功几率：") + param6 / 100 + "%";
         _loc8_ = _loc8_ + "</textformat>";
         this.ft.htmlText = _loc8_;
         this.fb1.text = param3;
         this.fta1.htmlText = "<textformat leading=\'8\'>" + "<font size=\'18\'>" + param7 + "</font>" + "</textformat>";
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.zhufuzhi = param1;
         if(param1 > param2)
         {
            this.CjBar2.setValue(param2,param2);
         }
         else
         {
            this.CjBar2.setValue(param1,param2);
         }
         if(param3 != 0)
         {
            this.xingyunzhiNum = param3;
            this.aa();
         }
      }
      
      public function setJiyuanzhi(param1:int, param2:int, param3:int = 0) : void
      {
      }
      
      public function setGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.goodsId = param1.id;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 27;
         this.item.y = 284;
         addChild(this.item);
         if(!param2)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.item.filters = [];
         }
      }
      
      public function setBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         }
         else
         {
            this.zdlwBtn.label = LanResManager.getLanCommonTextWords("停止领悟");
         }
      }
   }
}

