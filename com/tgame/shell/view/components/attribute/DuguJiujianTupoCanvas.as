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
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   import gs.TweenMax;
   
   public class DuguJiujianTupoCanvas extends Sprite
   {
      
      private var closeBtn:FSimpleButton;
      
      private var bgCanvas:FCanvas;
      
      public var _parent:DisplayObject;
      
      public var _parent2:DisplayObject;
      
      private var fta:FTextArea;
      
      private var shuomingFta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var img:Bitmap;
      
      private var CjBar:ColorBar;
      
      private var fb1:FLabel;
      
      private var item:ItemFace;
      
      private var kslwBtn:SecondButton;
      
      private var zdlwBtn:SecondButton;
      
      private var zhufuzhi:int;
      
      private var yanhuaMc:MovieClip;
      
      private var xingyunzhiNum:int;
      
      public function DuguJiujianTupoCanvas()
      {
         var fc:FCanvas = null;
         super();
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 270;
         this.bgCanvas.height = 380;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         fc = new FCanvas();
         fc.skin = "canvas1";
         fc.x = 0;
         fc.y = 0;
         fc.width = 270;
         fc.height = 380;
         addChild(fc);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 20;
            y = 15;
            textColor = StaticValue.ORANGE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("招式说明") + "</font>";
         }
         addChild(this.fta);
         this.shuomingFta = new FTextArea();
         with(this.shuomingFta)
         {
            filters = StaticValue.filter;
            x = 20;
            y = 35;
            textColor = StaticValue.YELLOW;
            width = 240;
            height = 110;
            wordWrap = true;
            htmlText = LanResManager.getLanTextWords(this,"总决式为独孤九剑之纲");
         }
         addChild(this.shuomingFta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 20;
            y = 130;
            textColor = StaticValue.ORANGE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("领悟祝福值") + "</font>";
         }
         addChild(this.fta);
         this.img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(this.img);
         this.img.width = 170;
         this.img.x = 50;
         this.img.y = 150;
         this.CjBar = new ColorBar(5,132,11);
         addChild(this.CjBar);
         this.CjBar.x = 69;
         this.CjBar.y = 153;
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 20;
            y = 166;
            textColor = StaticValue.YELLOW;
            width = 245;
            height = 110;
            wordWrap = true;
            htmlText = "<textformat leading=\'0.1\'>" + "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanTextWords(this,"领悟失败将会增加祝福值") + "</font>" + "</textformat>";
         }
         addChild(this.fta);
         this.fb1 = new FLabel();
         with(this.fb1)
         {
            x = 25;
            y = 261;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.fb1);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 25;
         this.img.y = 282;
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 75;
            y = 273;
            textColor = StaticValue.BlUE20;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta1);
         this.kslwBtn = new SecondButton();
         this.kslwBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         addChild(this.kslwBtn);
         this.kslwBtn.x = 45;
         this.kslwBtn.y = 340;
         this.kslwBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.zdlwBtn = new SecondButton();
         this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         addChild(this.zdlwBtn);
         this.zdlwBtn.x = 155;
         this.zdlwBtn.y = 340;
         this.zdlwBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.kslwBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUJIUJIAN_KAISHITISHENG_CLICK));
               break;
            case this.zdlwBtn:
               if(this.zdlwBtn.label == LanResManager.getLanCommonTextWords("自动领悟"))
               {
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUJIUJIAN_ZIDONGTISHENG_CLICK,"",false));
               }
               else
               {
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUJIUJIAN_ZIDONGTISHENG_CLICK,"",true));
               }
         }
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         var str:String = null;
         var e:MouseEvent = param1;
         if(this.zhufuzhi > 0)
         {
            str = "";
            str = LanResManager.getLanTextWords(this,"独孤九剑突破祝福值重要提示",[StaticValue.RED_HTML,StaticValue.GREEN_HTML,StaticValue.RED_HTML,this.zhufuzhi]);
            FAlert.okLabel = LanResManager.getLanCommonTextWords("关闭面板");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("继续领悟");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  _parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUJIUJIAN_CLOSE));
               }
            });
         }
         else
         {
            this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUJIUJIAN_CLOSE));
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
            y = 152;
            textColor = StaticValue.YELLOW;
            width = 132;
            htmlText = LanResManager.getLanCommonTextWords("祝福值+") + String(xingyunzhiNum);
         }
         addChild(ftaw);
         TweenMax.to(ftaw,1,{
            "y":100,
            "onComplete":this.onCom,
            "onCompleteParams":[ftaw]
         });
      }
      
      private function onCom(param1:FTextArea) : void
      {
         if(param1 != null && param1.parent != null)
         {
            param1.parent.removeChild(param1);
         }
      }
      
      public function setInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int) : void
      {
         var _loc9_:String = "";
         _loc9_ = _loc9_ + "<textformat leading=\'0.1\'>";
         if(param2)
         {
            _loc9_ += LanResManager.getLanCommonTextWords("领悟前提：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1 + "</font><br>";
         }
         else
         {
            _loc9_ += LanResManager.getLanCommonTextWords("领悟前提：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param1 + "</font><br>";
         }
         if(param5)
         {
            _loc9_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param3 + param4 + LanResManager.getLanCommonTextWords("颗") + "</font><br>";
         }
         else
         {
            _loc9_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param3 + param4 + LanResManager.getLanCommonTextWords("颗") + "</font><br>";
         }
         if(param7)
         {
            _loc9_ += LanResManager.getLanCommonTextWords("领悟消耗真气：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param6 + "</font><br>";
         }
         else
         {
            _loc9_ += LanResManager.getLanCommonTextWords("领悟消耗真气：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param6 + "</font><br>";
         }
         _loc9_ += LanResManager.getLanCommonTextWords("领悟成功几率：") + param8 / 100 + "%";
         _loc9_ = _loc9_ + "</textformat>";
         this.fta1.htmlText = _loc9_;
         this.fb1.text = param3;
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.zhufuzhi = param1;
         if(param1 > param2)
         {
            this.CjBar.setValue(param2,param2);
         }
         else
         {
            this.CjBar.setValue(param1,param2);
         }
         if(param3 != 0)
         {
            this.xingyunzhiNum = param3;
            this.aa();
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
         this.item.y = 284;
         addChild(this.item);
         if(param1.count < 1)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
      }
      
      public function setShuoming(param1:String) : void
      {
         this.shuomingFta.htmlText = param1;
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

