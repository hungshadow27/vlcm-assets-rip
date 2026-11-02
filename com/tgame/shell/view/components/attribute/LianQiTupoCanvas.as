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
   
   public class LianQiTupoCanvas extends Sprite
   {
      
      public var _parent3:DisplayObject;
      
      public var _parent2:DisplayObject;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var neirong:FTextArea;
      
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
      
      public function LianQiTupoCanvas()
      {
         var fc:FCanvas = null;
         var tszfz:FTextArea = null;
         super();
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 425;
         this.bgCanvas.height = 107;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         fc = new FCanvas();
         fc.skin = "canvas1";
         fc.x = 0;
         fc.y = 0;
         fc.width = 425;
         fc.height = 107;
         addChild(fc);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         tszfz = new FTextArea();
         addChild(tszfz);
         tszfz.multiline = true;
         tszfz.autoSize = TextFieldAutoSize.LEFT;
         tszfz.wordWrap = true;
         tszfz.width = 220;
         tszfz.height = 120;
         tszfz.x = 90 - 10 - 4 - 10;
         tszfz.y = 30 - 5 - 4;
         tszfz.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每日凌晨6：00将会准时清空祝福值") + "<br><br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("炼气从第七层可以使用超级锻造材料") + "</font>";
         this.img = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.img);
         this.img.x = 90 - 19;
         this.img.y = 45 - 5;
         this.CjBar = new ColorBar(5,123,5);
         addChild(this.CjBar);
         this.CjBar.x = 90 - 19 + 4;
         this.CjBar.y = 45 + 3 - 5;
         this.CjBar.setValue(2,2);
         this.daojuming = new FTextArea();
         addChild(this.daojuming);
         this.daojuming.multiline = true;
         this.daojuming.autoSize = TextFieldAutoSize.LEFT;
         this.daojuming.wordWrap = true;
         this.daojuming.width = 220;
         this.daojuming.height = 120;
         this.daojuming.x = 17;
         this.daojuming.y = 15;
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 17;
         this.img.y = 32;
         this.lingwuyaoqiu = new FTextArea();
         addChild(this.lingwuyaoqiu);
         this.lingwuyaoqiu.multiline = true;
         this.lingwuyaoqiu.autoSize = TextFieldAutoSize.LEFT;
         this.lingwuyaoqiu.wordWrap = true;
         this.lingwuyaoqiu.width = 220;
         this.lingwuyaoqiu.height = 120;
         this.lingwuyaoqiu.x = 265 + 5;
         this.lingwuyaoqiu.y = 15 + 14;
         this.lingwuyaoqiu.textColor = StaticValue.BlUE20;
         this.lingwuyaoqiu.htmlText = "";
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         addChild(this.buyBtn);
         this.buyBtn.x = 15;
         this.buyBtn.y = 73;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.kslwBtn = new SecondButton();
         this.kslwBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         addChild(this.kslwBtn);
         this.kslwBtn.x = 270;
         this.kslwBtn.y = 70;
         this.kslwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdlwBtn = new SecondButton();
         this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         addChild(this.zdlwBtn);
         this.zdlwBtn.x = 340;
         this.zdlwBtn.y = 70;
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
            text = LanResManager.getLanCommonTextWords("使用炼气直升丹");
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
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用炼气直升丹后点击开始领悟，将可以直接领悟任意一层炼气") + "</font></textformat>";
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
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANQI_KAISHITISHENG_CLICK,"",this.check.selectState));
               break;
            case this.zdlwBtn:
               if(this.zdlwBtn.label == LanResManager.getLanCommonTextWords("自动领悟"))
               {
                  this.check.enabled = false;
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANQI_ZIDONGTISHENG_CLICK,"",true));
               }
               else
               {
                  this.check.enabled = true;
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANQI_ZIDONGTISHENG_CLICK,"",false));
               }
               break;
            case this.buyBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANQI_GOUMAI_CLICK,"",this.goodsId));
         }
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         var str:String = null;
         var e:MouseEvent = param1;
         if(this.zhufuzhi > 0)
         {
            str = "";
            str = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("炼气突破祝福值重要提示：") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("炼气等级领悟失败将会增加一定幅度的祝福值；") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("祝福值越高则下次突破成功几率越高。") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("您当前已经积累了祝福值：") + this.zhufuzhi + LanResManager.getLanCommonTextWords("点") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("祝福值将会在每日早晨准时清空，") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("为避免损失，强烈建议您请在该时间之前完成突破") + "<br></font>" + "</textformat>";
            FAlert.okLabel = LanResManager.getLanCommonTextWords("关闭面板");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("继续领悟");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  _parent3.dispatchEvent(new BaseEvent(LianQi.UI_LIANQI_GUANBI_CLICK));
               }
            });
         }
         else
         {
            this._parent3.dispatchEvent(new BaseEvent(LianQi.UI_LIANQI_GUANBI_CLICK));
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
            y = 152 - 80;
            textColor = StaticValue.YELLOW;
            width = 132;
            htmlText = LanResManager.getLanCommonTextWords("祝福值+") + String(xingyunzhiNum);
         }
         addChild(ftaw);
         TweenMax.to(ftaw,1,{
            "y":0,
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
      
      public function setTupoInit(param1:String, param2:int, param3:Boolean, param4:int) : void
      {
         var _loc5_:String = "";
         _loc5_ = _loc5_ + "<textformat leading=\'6\'>";
         if(param3)
         {
            _loc5_ += LanResManager.getLanCommonTextWords("本次提升需要：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1 + param2 + LanResManager.getLanCommonTextWords("个") + "</font><br>";
         }
         else
         {
            _loc5_ += LanResManager.getLanCommonTextWords("本次提升需要：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param1 + param2 + LanResManager.getLanCommonTextWords("个") + "</font><br>";
         }
         _loc5_ += LanResManager.getLanCommonTextWords("领悟成功几率：") + param4 / 100 + "%";
         _loc5_ = _loc5_ + "</textformat>";
         this.lingwuyaoqiu.htmlText = _loc5_;
         this.daojuming.htmlText = "<font  color =\'" + StaticValue.ORANGE_HTML + "\'>" + param1 + "</font>";
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
         this.item.x = 17 + 2;
         this.item.y = 32 + 2;
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

