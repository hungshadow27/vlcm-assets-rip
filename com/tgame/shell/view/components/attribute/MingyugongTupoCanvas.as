package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
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
   
   public class MingyugongTupoCanvas extends Sprite
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
      
      public var zdlwBtn:SecondButton;
      
      private var zhufuzhi:int;
      
      private var yanhuaMc:MovieClip;
      
      private var xingyunzhiNum:int;
      
      private var buyBtn:SecondButton;
      
      private var goodsId:int;
      
      public var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var tip:FTextArea;
      
      private var tipCanvas:FCanvas;
      
      public function MingyugongTupoCanvas()
      {
         var fc:FCanvas = null;
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
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
         addChild(this.shuomingFta);
         this.shuomingFta.multiline = true;
         this.shuomingFta.autoSize = TextFieldAutoSize.LEFT;
         this.shuomingFta.wordWrap = true;
         this.shuomingFta.width = 200 + 30;
         this.shuomingFta.height = 120;
         this.shuomingFta.x = 20;
         this.shuomingFta.y = 35 + 10;
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
         this.img.y = 157;
         this.CjBar = new ColorBar(5,132,11);
         addChild(this.CjBar);
         this.CjBar.x = 69;
         this.CjBar.y = 161;
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
            htmlText = "<textformat leading=\'0\'>" + "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanTextWords(DuguJiujianTupoCanvas,"领悟失败将会增加祝福值") + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanTextWords(DuguJiujianTupoCanvas,"每日凌晨6:00将会准时清空祝福值") + "</font>" + "</textformat>";
         }
         addChild(this.fta);
         this.fb1 = new FLabel();
         with(this.fb1)
         {
            x = 12;
            y = 249;
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
            x = 85;
            y = 265;
            textColor = StaticValue.BlUE20;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta1);
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         this.buyBtn.x = 23;
         this.buyBtn.y = 323;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.kslwBtn = new SecondButton();
         this.kslwBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         addChild(this.kslwBtn);
         this.kslwBtn.x = 45;
         this.kslwBtn.y = 345;
         this.kslwBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.zdlwBtn = new SecondButton();
         this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         addChild(this.zdlwBtn);
         this.zdlwBtn.x = 155;
         this.zdlwBtn.y = 345;
         this.zdlwBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.check = new FCheckBox();
         this.check.x = this.buyBtn.x + 60;
         this.check.y = this.buyBtn.y + 2;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 20;
            --check.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = "使用明玉功直升丹";
         }
         this.checkLabel.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.checkLabel.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         if(this.check.selectState)
         {
            this.zdlwBtn.enabled = false;
         }
         else
         {
            this.zdlwBtn.enabled = true;
         }
      }
      
      private function onCheckTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.checkLabel.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + "使用明玉功直升丹后点击开始领悟" + "<br>" + "将可以直接领悟任意一层明玉功" + "</font></textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.checkLabel.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 5;
         this.tipCanvas.y = mouseY + 5;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.kslwBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_MINGYUGONG_KAISHITISHENG_CLICKJ,"",this.check.selectState));
               break;
            case this.zdlwBtn:
               if(this.zdlwBtn.label == LanResManager.getLanCommonTextWords("自动领悟"))
               {
                  this.check.enabled = false;
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_MINGYUGONG_ZIDONGTISHENG_CLICKJ,"",true));
               }
               else
               {
                  this.check.enabled = true;
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_MINGYUGONG_ZIDONGTISHENG_CLICKJ,"",false));
               }
               break;
            case this.buyBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_MINGYUGONG_GOUMAI_CLICK,"",this.goodsId));
         }
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(Mingyugong.UI_MINGYUGONG_GUANBI_CLICK));
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
      
      public function setInitialize(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.shuomingFta.htmlText = "<textformat leading=\'8\'><font size=\'12\' color=\'" + StaticValue.GREEN_HTML + "\'>" + param1 + "</font></textformat><br>";
         var _loc8_:String = "";
         _loc8_ = _loc8_ + "<textformat leading=\'6\'>";
         if(param3)
         {
            _loc8_ += LanResManager.getLanCommonTextWords("领悟前提：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param2 + "</font><br>";
         }
         else
         {
            _loc8_ += LanResManager.getLanCommonTextWords("领悟前提：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param2 + "</font><br>";
         }
         if(param6)
         {
            _loc8_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param4 + param5 + LanResManager.getLanCommonTextWords("个") + "</font><br>";
         }
         else
         {
            _loc8_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param4 + param5 + LanResManager.getLanCommonTextWords("个") + "</font><br>";
         }
         _loc8_ += LanResManager.getLanCommonTextWords("领悟成功几率：") + param7 / 100 + "%";
         _loc8_ = _loc8_ + "</textformat>";
         this.fta1.htmlText = _loc8_;
         this.fb1.text = param4;
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
      
      public function setGoods(param1:Goods, param2:Boolean = false) : void
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
         if(param1.count < 1)
         {
            this.item.filters = Tools.blackWhiteFilter;
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
         this.check.enabled = param1;
      }
   }
}

