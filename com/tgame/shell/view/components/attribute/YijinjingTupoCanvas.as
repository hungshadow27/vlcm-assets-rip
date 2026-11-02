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
   
   public class YijinjingTupoCanvas extends Sprite
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
      
      public function YijinjingTupoCanvas()
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
            textColor = StaticValue.ORANGE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("领悟机缘值") + "</font>";
         }
         addChild(this.fta1);
         this.img1 = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(this.img1);
         this.img1.width = 170;
         this.img1.x = 50;
         this.img1.y = 35;
         this.CjBar1 = new ColorBar(5,132,11);
         addChild(this.CjBar1);
         this.CjBar1.x = 69;
         this.CjBar1.y = 38;
         this.shuomingFta1 = new FTextArea();
         with(this.shuomingFta1)
         {
            filters = StaticValue.filter;
            x = 20;
            y = 55;
            textColor = StaticValue.YELLOW;
            width = 245;
            height = 110;
            wordWrap = true;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"领悟成功或失败均会增加机缘值积累至上限后可以直接领悟招式使用",[StaticValue.BlUE20_HTML,StaticValue.RED_HTML],false) + "</textformat>";
         }
         addChild(this.shuomingFta1);
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
            y = 175;
            textColor = StaticValue.YELLOW;
            width = 250;
            height = 110;
            wordWrap = true;
            htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanTextWords(this,"领悟失败将会增加祝福值祝福值越高则下次领悟成功几率越高每日凌",[StaticValue.BlUE20_HTML,StaticValue.RED_HTML],false) + "</textformat>";
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
            y = 278;
            textColor = StaticValue.BlUE20;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.ft);
         this.kslwBtn = new SecondButton();
         this.kslwBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         addChild(this.kslwBtn);
         this.kslwBtn.x = 23;
         this.kslwBtn.y = 350;
         this.kslwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdlwBtn = new SecondButton();
         this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         addChild(this.zdlwBtn);
         this.zdlwBtn.x = 108;
         this.zdlwBtn.y = 350;
         this.zdlwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zjlwBtn = new SecondButton();
         this.zjlwBtn.label = LanResManager.getLanCommonTextWords("直接领悟");
         this.zjlwBtn.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"当机缘值达到上限后，可以直接领悟当前招式，同时清空机缘值和祝福值") + "</font></textformat>";
         addChild(this.zjlwBtn);
         this.zjlwBtn.x = 188;
         this.zjlwBtn.y = 350;
         this.zjlwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         var str:String = null;
         var e:MouseEvent = param1;
         if(this.zhufuzhi > 0 || this.jiyuanzhi > 0)
         {
            str = "";
            str = LanResManager.getLanTextWords(this,"易筋经突破祝福值重要提示易筋经等级领悟失败将会增加一定幅度的",[StaticValue.RED_HTML,StaticValue.GREEN_HTML,StaticValue.GREEN_HTML,StaticValue.RED_HTML,this.zhufuzhi,this.jiyuanzhi,StaticValue.RED_HTML,StaticValue.RED_HTML]) + "</textformat>";
            FAlert.okLabel = LanResManager.getLanCommonTextWords("关闭面板");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("继续领悟");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  _parent3.dispatchEvent(new BaseEvent(Yijinjing.UI_YIJINJING_GUANBI_CLICK));
               }
            });
         }
         else
         {
            this._parent3.dispatchEvent(new BaseEvent(Yijinjing.UI_YIJINJING_GUANBI_CLICK));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.kslwBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_KAISHITISHENG_CLICKJ));
               break;
            case this.zdlwBtn:
               if(this.zdlwBtn.label == LanResManager.getLanCommonTextWords("自动领悟"))
               {
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_ZIDONGTISHENG_CLICKJ,"",true));
               }
               else
               {
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_ZIDONGTISHENG_CLICKJ,"",false));
               }
               break;
            case this.zjlwBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_ZHIJIETISHENG_CLICKJ));
               break;
            case this.buyBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_GOUMAI_CLICK,"",this.goodsId));
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
      
      public function setInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         var _loc7_:String = "";
         _loc7_ = _loc7_ + "<textformat leading=\'6\'>";
         if(param2)
         {
            _loc7_ += LanResManager.getLanCommonTextWords("领悟前提：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1 + "</font><br>";
         }
         else
         {
            _loc7_ += LanResManager.getLanCommonTextWords("领悟前提：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param1 + "</font><br>";
         }
         if(param5)
         {
            _loc7_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param3 + param4 + LanResManager.getLanCommonTextWords("颗") + "</font><br>";
         }
         else
         {
            _loc7_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param3 + param4 + LanResManager.getLanCommonTextWords("颗") + "</font><br>";
         }
         _loc7_ += LanResManager.getLanCommonTextWords("领悟成功几率：") + param6 / 100 + "%";
         _loc7_ = _loc7_ + "</textformat>";
         this.ft.htmlText = _loc7_;
         this.fb1.text = param3;
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
         this.jiyuanzhi = param1;
         if(param1 >= param2)
         {
            this.CjBar1.setValue(param2,param2);
            this.zjlwBtn.enabled = true;
         }
         else
         {
            this.CjBar1.setValue(param1,param2);
            this.zjlwBtn.enabled = false;
         }
         if(param3 != 0)
         {
            this.jiyuanzhiNum = param3;
            this.bb();
         }
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

