package com.tgame.shell.view.components.attribute
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
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
   
   public class PangXieZhenTupoCanvas extends Sprite
   {
      
      public var _parent3:DisplayObject;
      
      public var _parent2:DisplayObject;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var img:Bitmap;
      
      private var CjBar:ColorBar;
      
      private var daojuming:FTextArea;
      
      private var lingwuyaoqiu:FTextArea;
      
      private var buyBtn:SecondButton;
      
      private var kslwBtn:SecondButton;
      
      public var zdlwBtn:SecondButton;
      
      private var zhufuzhi:int;
      
      private var xingyunzhiNum:int;
      
      private var goodsId:int;
      
      private var item:ItemFace;
      
      public var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var benchong:FTextArea;
      
      private var xiachong:FTextArea;
      
      public function PangXieZhenTupoCanvas()
      {
         var str:String;
         var fc:FCanvas = null;
         var BiaoTi:FTextArea = null;
         var zhufuzhi:FTextArea = null;
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
         this.bgCanvas.height = 370;
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
         BiaoTi = new FTextArea();
         addChild(BiaoTi);
         BiaoTi.multiline = true;
         BiaoTi.autoSize = TextFieldAutoSize.LEFT;
         BiaoTi.wordWrap = true;
         BiaoTi.width = 150 + 30 + 30;
         BiaoTi.height = 30;
         BiaoTi.x = 48 - 15;
         BiaoTi.y = 11 + 13;
         BiaoTi.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("三队平列，中队人少，诈败诱追，伏兵四起，其阵损左益右，运用之妙，可役使万众。") + "</font>";
         this.benchong = new FTextArea();
         addChild(this.benchong);
         this.benchong.multiline = true;
         this.benchong.autoSize = TextFieldAutoSize.LEFT;
         this.benchong.wordWrap = true;
         this.benchong.width = 200 + 30;
         this.benchong.height = 120;
         this.benchong.x = 15 + 50;
         this.benchong.y = 42 + 10 + 30 - 7 + 5;
         this.xiachong = new FTextArea();
         addChild(this.xiachong);
         this.xiachong.multiline = true;
         this.xiachong.autoSize = TextFieldAutoSize.LEFT;
         this.xiachong.wordWrap = true;
         this.xiachong.width = 200 + 30;
         this.xiachong.height = 120;
         this.xiachong.x = 15 + 50;
         this.xiachong.y = 42 + 10 + 50 - 7 + 5;
         zhufuzhi = new FTextArea();
         addChild(zhufuzhi);
         zhufuzhi.multiline = true;
         zhufuzhi.autoSize = TextFieldAutoSize.LEFT;
         zhufuzhi.wordWrap = true;
         zhufuzhi.width = 220;
         zhufuzhi.height = 120;
         zhufuzhi.x = 15;
         zhufuzhi.y = 110 + 10;
         str = "";
         str += "<textformat leading=\'6\'><font size=\'14\'color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("提升祝福值") + "</font>";
         str += "<font color=\'" + StaticValue.BlUE20_HTML + "\'><br><br><br>" + LanResManager.getLanCommonTextWords("提升失败将会增加祝福值") + "</font>";
         str += "<font color=\'" + StaticValue.BlUE20_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("祝福值越高则下次领悟成功率越高") + "</font>";
         str += "<font color=\'" + StaticValue.RED_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("每日凌晨6：00将会准时清空祝福值") + "</font>";
         str += "<font color=\'" + StaticValue.RED_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("请在此期间完成领悟，以免造成损失") + "</font>";
         str += "</textformat>";
         zhufuzhi.htmlText = str;
         this.img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(this.img);
         this.img.width = 170;
         this.img.x = 50;
         this.img.y = 149 - 11 + 10;
         this.CjBar = new ColorBar(5,132,11);
         addChild(this.CjBar);
         this.CjBar.x = 69;
         this.CjBar.y = 152 - 11 + 10;
         this.CjBar.setValue(2,2);
         this.daojuming = new FTextArea();
         addChild(this.daojuming);
         this.daojuming.multiline = true;
         this.daojuming.autoSize = TextFieldAutoSize.LEFT;
         this.daojuming.wordWrap = true;
         this.daojuming.width = 220;
         this.daojuming.height = 120;
         this.daojuming.x = 25;
         this.daojuming.y = 282 - 35 - 10 + 14;
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 25;
         this.img.y = 282 - 10;
         this.lingwuyaoqiu = new FTextArea();
         addChild(this.lingwuyaoqiu);
         this.lingwuyaoqiu.multiline = true;
         this.lingwuyaoqiu.autoSize = TextFieldAutoSize.LEFT;
         this.lingwuyaoqiu.wordWrap = true;
         this.lingwuyaoqiu.width = 220;
         this.lingwuyaoqiu.height = 120;
         this.lingwuyaoqiu.x = 25 + 75;
         this.lingwuyaoqiu.y = 282 - 35 + 30 - 15;
         this.lingwuyaoqiu.textColor = StaticValue.BlUE20;
         this.lingwuyaoqiu.htmlText = "";
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         addChild(this.buyBtn);
         this.buyBtn.x = 23;
         this.buyBtn.y = 323 - 10;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.kslwBtn = new SecondButton();
         this.kslwBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         addChild(this.kslwBtn);
         this.kslwBtn.x = 45;
         this.kslwBtn.y = 345;
         this.kslwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdlwBtn = new SecondButton();
         this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         addChild(this.zdlwBtn);
         this.zdlwBtn.x = 155;
         this.zdlwBtn.y = 345;
         this.zdlwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.check = new FCheckBox();
         addChild(this.check);
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
            text = LanResManager.getLanCommonTextWords("螃蟹阵直升丹");
         }
         this.checkLabel.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.checkLabel.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
         addChild(this.checkLabel);
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
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用螃蟹阵直升丹后点击开始领悟将可以直接领悟任意一层螃蟹阵") + "</font></textformat>";
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
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_PANGXIEZHEN_KAISHITISHENG_CLICK,"",this.check.selectState));
               break;
            case this.zdlwBtn:
               if(this.zdlwBtn.label == LanResManager.getLanCommonTextWords("自动领悟"))
               {
                  this.check.enabled = false;
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_PANGXIEZHEN_ZIDONGTISHENG_CLICK,"",true));
               }
               else
               {
                  this.check.enabled = true;
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_PANGXIEZHEN_ZIDONGTISHENG_CLICK,"",false));
               }
               break;
            case this.buyBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_PANGXIEZHEN_GOUMAI_CLICK,"",this.goodsId));
         }
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         var str:String = null;
         var e:MouseEvent = param1;
         if(this.zhufuzhi > 0)
         {
            str = "";
            str = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("螃蟹阵突破祝福值重要提示：") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("螃蟹阵等级领悟失败将会增加一定幅度的祝福值；") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("祝福值越高则下次突破成功几率越高。") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("您当前已经积累了祝福值：") + this.zhufuzhi + LanResManager.getLanCommonTextWords("点") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("每日凌晨6：00将会准时清空祝福值") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("为避免损失，强烈建议您请在该时间之前完成突破") + "<br></font>" + "</textformat>";
            FAlert.okLabel = LanResManager.getLanCommonTextWords("关闭面板");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("继续领悟");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  _parent3.dispatchEvent(new BaseEvent(PangXieZhen.UI_PANGXIEZHEN_GUANBI_CLICK));
               }
            });
         }
         else
         {
            this._parent3.dispatchEvent(new BaseEvent(PangXieZhen.UI_PANGXIEZHEN_GUANBI_CLICK));
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
      
      public function setTupoInit(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
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
         if(param5)
         {
            _loc9_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param3 + param4 + LanResManager.getLanCommonTextWords("个") + "</font><br>";
         }
         else
         {
            _loc9_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param3 + param4 + LanResManager.getLanCommonTextWords("个") + "</font><br>";
         }
         _loc9_ += LanResManager.getLanCommonTextWords("领悟成功几率：") + param6 / 100 + "%";
         _loc9_ = _loc9_ + "</textformat>";
         this.lingwuyaoqiu.htmlText = _loc9_;
         this.daojuming.htmlText = "<font  color =\'" + StaticValue.ORANGE_HTML + "\'>" + param3 + "</font>";
         this.benchong.htmlText = "<font  color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("本重最大可加成") + param7 + LanResManager.getLanCommonTextWords("倍") + "</font>";
         if(param8 == 0)
         {
            this.xiachong.visible = false;
         }
         else
         {
            this.xiachong.visible = true;
         }
         this.xiachong.htmlText = "<font  color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("下重最大可加成") + param8 + LanResManager.getLanCommonTextWords("倍") + "</font>";
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
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.goodsId = param1.id;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 25 + 2;
         this.item.y = 272 + 2;
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
      
      public function setTuPoBtn(param1:Boolean) : void
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

