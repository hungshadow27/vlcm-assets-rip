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
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   import gs.TweenMax;
   
   public class WuDuZhenTuPoCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var $parent2:DisplayObject;
      
      private var img:Bitmap;
      
      private var fb1:FLabel;
      
      private var buyBtn:SecondButton;
      
      private var kstsBtn:SecondButton;
      
      private var zdtsBtn:SecondButton;
      
      private var lb6:FLabel;
      
      private var barBar6:ColorBar;
      
      private var barBg6:Bitmap;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var ft:FTextArea;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var item:ItemFace;
      
      private var closeBtn:FSimpleButton;
      
      private var bgCanvas:FCanvas;
      
      private var lb:FLabel;
      
      public var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var goodsNum:int;
      
      private var goods:Goods;
      
      private var xingyunzhi:int;
      
      private var addZhufu:int;
      
      private var index:int;
      
      public function WuDuZhenTuPoCanvas()
      {
         var fc:FCanvas = null;
         super();
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 425;
         this.bgCanvas.height = 107 + 20;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         fc = new FCanvas();
         fc.skin = "canvas1";
         fc.x = 0;
         fc.y = 0;
         fc.width = 425;
         fc.height = 107 + 20;
         addChild(fc);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.fb1 = new FLabel();
         with(this.fb1)
         {
            x = 17;
            y = 33;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         addChild(this.fb1);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 17;
         this.img.y = 67;
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         this.buyBtn.x = 15;
         this.buyBtn.y = 73 + 5;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lb6 = new FLabel();
         with(this.lb6)
         {
            x = 63;
            y = 20;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("提升祝福值");
         }
         addChild(this.lb6);
         this.barBg6 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg6);
         this.barBg6.width = 120;
         this.barBg6.x = this.lb6.x + this.lb6.width;
         this.barBg6.y = this.lb6.y + 2;
         this.barBar6 = new ColorBar(5,110,5);
         addChild(this.barBar6);
         this.barBar6.x = this.lb6.x + this.lb6.width + 4;
         this.barBar6.y = this.lb6.y + 5;
         this.ft1 = new FTextArea();
         this.ft1.x = 80;
         this.ft1.y = 38;
         this.ft1.autoSize = TextFieldAutoSize.LEFT;
         this.ft1.textColor = StaticValue.RED;
         this.ft1.filters = StaticValue.filter;
         this.ft1.htmlText = LanResManager.getLanCommonTextWords("祝福值将会在每日6点清零");
         addChild(this.ft1);
         this.img = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.img);
         this.img.width = 198;
         this.img.x = 68;
         this.img.y = 55;
         this.ft3 = new FTextArea();
         this.ft3.x = 68;
         this.ft3.y = 61;
         this.ft3.autoSize = TextFieldAutoSize.LEFT;
         this.ft3.textColor = StaticValue.GREEN;
         this.ft3.filters = StaticValue.filter;
         this.ft3.htmlText = LanResManager.getLanCommonTextWords("玩家可以使用超级元素精华代替五毒") + "<br>" + LanResManager.getLanCommonTextWords("丹进行突破。五毒阵法突破六层及以") + "<br>" + LanResManager.getLanCommonTextWords("上才能使用超级元素精华进行替代");
         addChild(this.ft3);
         this.check = new FCheckBox();
         this.check.x = this.buyBtn.x + 60 + 195;
         this.check.y = this.buyBtn.y + 2 + 18;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 20;
            --check.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("使用五毒直升丹");
         }
         this.checkLabel.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.checkLabel.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
         this.ft2 = new FTextArea();
         this.ft2.x = 270;
         this.ft2.y = 34 - 10;
         this.ft2.autoSize = TextFieldAutoSize.LEFT;
         this.ft2.textColor = StaticValue.GREEN;
         this.ft2.filters = StaticValue.filter;
         addChild(this.ft2);
         this.kstsBtn = new SecondButton();
         this.kstsBtn.label = LanResManager.getLanCommonTextWords("开始提升");
         addChild(this.kstsBtn);
         this.kstsBtn.x = 284;
         this.kstsBtn.y = 93;
         this.kstsBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdtsBtn = new SecondButton();
         this.zdtsBtn.label = LanResManager.getLanCommonTextWords("自动提升");
         addChild(this.zdtsBtn);
         this.zdtsBtn.x = 354;
         this.zdtsBtn.y = 93;
         this.zdtsBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         if(this.check.selectState)
         {
            this.zdtsBtn.enabled = false;
         }
         else
         {
            this.zdtsBtn.enabled = true;
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
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用五毒直升丹后点击开始领悟") + "<br>" + LanResManager.getLanCommonTextWords("将可以直接领悟任意一层五毒阵") + "</font></textformat>";
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
      
      private function onClose(param1:MouseEvent) : void
      {
         this.$parent2.dispatchEvent(new BaseEvent(WuDuZhen.UI_TUPO_GUANBI_CLICK));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.buyBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDUZHEN_GOUMAI_CLICK,"",this.goods.id));
               break;
            case this.kstsBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDUZHEN_KAISHITISHENG_CLICK,"",this.check.selectState));
               break;
            case this.zdtsBtn:
               if(this.zdtsBtn.label == LanResManager.getLanCommonTextWords("自动提升"))
               {
                  this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDUZHEN_ZIDONGTISHENG_CLICK,"",true));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDUZHEN_ZIDONGTISHENG_CLICK,"",false));
               }
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      public function setTupoPanel(param1:int, param2:Goods, param3:int, param4:int, param5:int, param6:int, param7:int = 0) : void
      {
         this.index = param1;
         this.goods = param2;
         this.setZhufuzhi(param4,param5);
         this.setGoods(param2);
         this.setChenggonglv(param3,param6,param2.res.name);
         this.addZhufu = param7;
         if(param7 > 0)
         {
            this.aa();
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
            x = 130;
            y = 50;
            textColor = StaticValue.YELLOW;
            width = 132;
            if(addZhufu > 0)
            {
               htmlText = LanResManager.getLanCommonTextWords("祝福值") + String(addZhufu);
            }
            else
            {
               htmlText = LanResManager.getLanCommonTextWords("祝福值") + String(addZhufu);
            }
         }
         addChild(ftaw);
         TweenMax.to(ftaw,1,{
            "y":0,
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
      
      public function setZhufuzhi(param1:int, param2:int) : void
      {
         this.xingyunzhi = param1;
         if(param1 > param2)
         {
            this.barBar6.setValue(param2,param2);
         }
         else
         {
            this.barBar6.setValue(param1,param2);
         }
      }
      
      public function setChenggonglv(param1:int, param2:int, param3:String) : void
      {
         var _loc4_:String = "";
         _loc4_ = _loc4_ + "<textformat leading=\'6\'>";
         _loc4_ = _loc4_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次提升需要：") + "</font>");
         if(this.goodsNum < param1)
         {
            _loc4_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + param3 + param1 + LanResManager.getLanCommonTextWords("颗") + "</font><br>";
         }
         else
         {
            _loc4_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param3 + param1 + LanResManager.getLanCommonTextWords("颗") + "</font><br>";
         }
         _loc4_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次提升成功率：") + param2 / 100 + "%</font>";
         _loc4_ = _loc4_ + "</textformat>";
         this.ft2.htmlText = _loc4_;
         this.fb1.text = param3;
      }
      
      public function setGoods(param1:Goods) : void
      {
         this.goodsNum = param1.count;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 19;
         this.item.y = 69;
         addChild(this.item);
      }
      
      public function setZdtsBtnLabel(param1:Boolean) : void
      {
         if(param1)
         {
            this.zdtsBtn.label = LanResManager.getLanCommonTextWords("自动提升");
         }
         else
         {
            this.zdtsBtn.label = LanResManager.getLanCommonTextWords("停止提升");
         }
      }
   }
}

