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
   
   public class WuXingQuanTupoCanvas extends Sprite
   {
      
      public var _parent2:DisplayObject;
      
      public var _parent3:DisplayObject;
      
      private var closeBtn:FSimpleButton;
      
      private var bgCanvas:FCanvas;
      
      private var fta:FTextArea;
      
      private var shuomingFta:FTextArea;
      
      private var img:Bitmap;
      
      private var imgSlot:Bitmap;
      
      private var CjBar:ColorBar;
      
      private var fb1:FLabel;
      
      private var fta1:FTextArea;
      
      private var kslwBtn:SecondButton;
      
      private var zdlwBtn:SecondButton;
      
      private var buyBtn:SecondButton;
      
      private var zhufuzhi:int;
      
      private var xingyunzhiNum:int;
      
      private var item:ItemFace;
      
      private var goodsId:int;
      
      public function WuXingQuanTupoCanvas()
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
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 20;
            y = 15;
            textColor = StaticValue.ORANGE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("武功说明") + "</font>";
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
            htmlText = "";
         }
         addChild(this.shuomingFta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 20;
            y = 132;
            textColor = StaticValue.ORANGE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("领悟祝福值") + "</font>";
         }
         addChild(this.fta);
         this.img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(this.img);
         this.img.width = 170;
         this.img.x = 50;
         this.img.y = 155;
         this.CjBar = new ColorBar(5,132,11);
         addChild(this.CjBar);
         this.CjBar.x = 69;
         this.CjBar.y = 158;
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
            htmlText = "<textformat leading=\'8\'>" + "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanTextWords(FeilongtanyunshouTupoCanvas,"领悟失败将会增加祝福值祝福值越高则下次领悟成功几率越高") + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + "<br>" + LanResManager.getLanTextWords(FeilongtanyunshouTupoCanvas,"每日凌晨将会准时清空祝福值请在此时间完成领悟，以免造成损失") + "</font>" + "</textformat>";
         }
         addChild(this.fta);
         this.fb1 = new FLabel();
         with(this.fb1)
         {
            x = 25;
            y = 265;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.fb1);
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         this.buyBtn.x = 23;
         this.buyBtn.y = 323;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 70 - 5;
            y = 285 + 5;
            textColor = StaticValue.BlUE20;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta1);
         this.kslwBtn = new SecondButton();
         this.kslwBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         addChild(this.kslwBtn);
         this.kslwBtn.x = 45;
         this.kslwBtn.y = 350;
         this.kslwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdlwBtn = new SecondButton();
         this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         addChild(this.zdlwBtn);
         this.zdlwBtn.x = 155;
         this.zdlwBtn.y = 350;
         this.zdlwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.kslwBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.WUXINGQUAN_LINGWUMIANBAN_KAISHILINGWU));
               break;
            case this.zdlwBtn:
               if(this.zdlwBtn.label == LanResManager.getLanCommonTextWords("自动领悟"))
               {
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.WUXINGQUAN_LINGWUMIANBAN_ZIDONGLINGWU,"",true));
               }
               else
               {
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.WUXINGQUAN_LINGWUMIANBAN_ZIDONGLINGWU,"",false));
               }
               break;
            case this.buyBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.WUXINGQUAN_GOUMAI_CLICK,"",this.goodsId));
         }
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         var str:String = null;
         var e:MouseEvent = param1;
         if(this.zhufuzhi > 0)
         {
            str = "";
            str = LanResManager.getLanTextWords(this,"突破祝福值重要提示飞龙探云手等级领悟失败将会增加一",[StaticValue.RED_HTML,StaticValue.GREEN_HTML,StaticValue.RED_HTML,StaticValue.RED_HTML,this.zhufuzhi,StaticValue.RED_HTML,StaticValue.RED_HTML]);
            FAlert.okLabel = LanResManager.getLanCommonTextWords("关闭面板");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("继续领悟");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  _parent3.dispatchEvent(new BaseEvent(WuXingQuan.UI_TUPO_GUANBI_CLICK));
               }
            });
         }
         else
         {
            this._parent3.dispatchEvent(new BaseEvent(WuXingQuan.UI_TUPO_GUANBI_CLICK));
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
            htmlText = LanResManager.getLanCommonTextWords("祝福值") + String(xingyunzhiNum);
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
         _loc9_ = _loc9_ + "<textformat leading=\'6\'>";
         if(param2)
         {
            _loc9_ += LanResManager.getLanCommonTextWords("领悟前提：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1 + "</font><br>";
         }
         else
         {
            _loc9_ += LanResManager.getLanCommonTextWords("领悟前提：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param1 + "</font><br>";
         }
         if(param4 != 0)
         {
            if(param5)
            {
               _loc9_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param3 + "×" + param4 + "</font><br>";
            }
            else
            {
               _loc9_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param3 + "×" + param4 + "</font><br>";
            }
         }
         if(param6 != 0)
         {
            if(param7)
            {
               _loc9_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("铜钱") + "×" + param6 + "</font><br>";
            }
            else
            {
               _loc9_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("铜钱") + "×" + param6 + "</font><br>";
            }
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
      
      public function setGoods(param1:Goods, param2:Boolean = true) : void
      {
         if(this.imgSlot != null && this.imgSlot.parent != null)
         {
            this.imgSlot.parent.removeChild(this.imgSlot);
         }
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.buyBtn.visible = false;
         if(param1 == null)
         {
            return;
         }
         this.goodsId = param1.id;
         this.imgSlot = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.imgSlot);
         this.imgSlot.x = 25;
         this.imgSlot.y = 282;
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
         this.buyBtn.visible = true;
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

