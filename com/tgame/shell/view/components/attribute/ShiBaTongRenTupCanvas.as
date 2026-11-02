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
   
   public class ShiBaTongRenTupCanvas extends Sprite
   {
      
      public var _parent2:DisplayObject;
      
      public var _parent3:DisplayObject;
      
      private var closeBtn:FSimpleButton;
      
      private var bgCanvas:FCanvas;
      
      private var fta:FTextArea;
      
      private var shuomingFta:FTextArea;
      
      private var img:Bitmap;
      
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
      
      public function ShiBaTongRenTupCanvas()
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
            htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("闯关说明") + "</font>";
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
            htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("闯关祝福值") + "</font>";
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
            htmlText = "<textformat leading=\'8\'>" + "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("闯关失败将会增加祝福值祝福值越高则下次领悟闯关成功几率越高") + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("每日凌晨6：00将会准时清空祝福值请在此时间完成闯关，以免造成损失") + "</font>" + "</textformat>";
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
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 25;
         this.img.y = 282;
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         this.buyBtn.x = 23;
         this.buyBtn.y = 323;
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 75;
            y = 275;
            textColor = StaticValue.BlUE20;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta1);
         this.kslwBtn = new SecondButton();
         this.kslwBtn.label = LanResManager.getLanCommonTextWords("开始闯关");
         addChild(this.kslwBtn);
         this.kslwBtn.x = 45;
         this.kslwBtn.y = 350;
         this.kslwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdlwBtn = new SecondButton();
         this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动闯关");
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
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.SHIBATONGREN_CHUANGGUAN_KAISHI));
               break;
            case this.zdlwBtn:
               if(this.zdlwBtn.label == LanResManager.getLanCommonTextWords("自动闯关"))
               {
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.SHIBATONGREN_CHUANGGUAN_ZIDONG,"",true));
               }
               else
               {
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.SHIBATONGREN_CHUANGGUAN_ZIDONG,"",false));
               }
               break;
            case this.buyBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.SHIBATONGREN_GOUMAI_CLICK,"",this.goodsId));
         }
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         var str:String = null;
         var e:MouseEvent = param1;
         if(this.zhufuzhi > 0)
         {
            str = "";
            str = "<textformat leading=\'\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("闯关祝福值重要提示：") + "<br></font><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("闯关失败将会增加一定幅度的祝福值；") + "<br></font><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("祝福值越高则下次闯关成功几率越高。") + "<br></font><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("您当前已经积累了祝福值：") + this.zhufuzhi + LanResManager.getLanCommonTextWords("点") + "<br></font><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("祝福值将会在每日早晨6:00准时清空，") + "<br></font><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("为避免损失，强烈建议您请在该时间之前完成闯关") + "<br></font></textformat>";
            FAlert.okLabel = LanResManager.getLanCommonTextWords("关闭面板");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("继续闯关");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  _parent2.dispatchEvent(new BaseEvent(CharAttribute.SHIBATONGREN_CHUANGGUAN_CLOSE));
               }
            });
         }
         else
         {
            this._parent2.dispatchEvent(new BaseEvent(CharAttribute.SHIBATONGREN_CHUANGGUAN_CLOSE));
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
      
      public function setInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         var _loc7_:String = "";
         _loc7_ = _loc7_ + "<textformat leading=\'6\'>";
         if(param2)
         {
            if(param1 == LanResManager.getLanCommonTextWords("未闯关"))
            {
               _loc7_ += LanResManager.getLanCommonTextWords("闯关前提：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("无") + "</font><br>";
            }
            else
            {
               _loc7_ += LanResManager.getLanCommonTextWords("闯关前提：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("闯过") + param1 + "</font><br>";
            }
         }
         else if(param1 == LanResManager.getLanCommonTextWords("未闯关"))
         {
            _loc7_ += LanResManager.getLanCommonTextWords("闯关前提：") + "<font color=\'" + StaticValue.RED_HTML + "\'>无</font><br>";
         }
         else
         {
            _loc7_ += LanResManager.getLanCommonTextWords("闯关前提：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("闯过") + param1 + "</font><br>";
         }
         if(param5)
         {
            _loc7_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param3 + param4 + LanResManager.getLanCommonTextWords("个") + "</font><br>";
         }
         else
         {
            _loc7_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param3 + param4 + LanResManager.getLanCommonTextWords("个") + "</font><br>";
         }
         _loc7_ += LanResManager.getLanCommonTextWords("闯关成功几率：") + param6 / 100 + "%";
         _loc7_ = _loc7_ + "</textformat>";
         this.fta1.htmlText = _loc7_;
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
      
      public function setShuoming(param1:String) : void
      {
         this.shuomingFta.htmlText = param1;
      }
      
      public function setBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动闯关");
         }
         else
         {
            this.zdlwBtn.label = LanResManager.getLanCommonTextWords("停止闯关");
         }
      }
      
      public function BtnEnableTrue() : void
      {
         this.kslwBtn.enabled = true;
         this.zdlwBtn.enabled = true;
         this.buyBtn.enabled = true;
      }
      
      public function BtnEnableFalse() : void
      {
         this.kslwBtn.enabled = false;
         this.zdlwBtn.enabled = false;
         this.buyBtn.enabled = false;
      }
   }
}

