package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class DantianTupoCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var $parent2:DisplayObject;
      
      private var img:Bitmap;
      
      private var fb1:FLabel;
      
      private var buyBtn:SecondButton;
      
      private var kstsBtn:SmallButton;
      
      private var zdtsBtn:SmallButton;
      
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
      
      public var checkBox:FCheckBox;
      
      public var checkBox1:FCheckBox;
      
      private var goodsId:int;
      
      private var useBLJH:FCheckBox;
      
      private var useBLJH2:FCheckBox;
      
      private var _goodsName:String;
      
      private var _count:int;
      
      private var _jilv:int;
      
      private var _enough:Boolean;
      
      private var ftTime:FTextArea;
      
      public var rTime:int;
      
      public function DantianTupoCanvas()
      {
         var fc:FCanvas = null;
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
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.fb1 = new FLabel();
         with(this.fb1)
         {
            x = 17;
            y = 15;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("碧灵丹");
         }
         addChild(this.fb1);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 17;
         this.img.y = 32;
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         addChild(this.buyBtn);
         this.buyBtn.x = 15;
         this.buyBtn.y = 73;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.buyBtn.visible = false;
         this.lb6 = new FLabel();
         with(this.lb6)
         {
            x = 63;
            y = 17;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("突破祝福值：");
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
         with(this.ft1)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 63;
            y = 31;
            textColor = StaticValue.RED;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"突破失败将会增加一定幅度的祝福值",[StaticValue.RED_HTML,StaticValue.GREEN_HTML],false) + "</textformat>";
         }
         addChild(this.ft1);
         this.ftTime = new FTextArea();
         with(this.ftTime)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 130;
            height = 20;
            x = 63;
            y = 73;
            textColor = StaticValue.GREEN;
            htmlText = "";
         }
         addChild(this.ftTime);
         this.useBLJH = new FCheckBox();
         this.useBLJH.textColor = StaticValue.YELLOW;
         this.useBLJH.text = LanResManager.getLanCommonTextWords("使用碧灵精华");
         this.useBLJH.x = 270;
         this.useBLJH.y = 10;
         this.useBLJH.visible = false;
         this.useBLJH.addEventListener(MouseEvent.CLICK,this.updateSuoxuCount);
         addChild(this.useBLJH);
         this.useBLJH2 = new FCheckBox();
         this.useBLJH2.textColor = StaticValue.YELLOW;
         this.useBLJH2.text = LanResManager.getLanCommonTextWords("使用神奇碧灵丹");
         this.useBLJH2.x = 270;
         this.useBLJH2.y = 10;
         this.useBLJH2.visible = false;
         this.useBLJH2.addEventListener(MouseEvent.CLICK,this.updateSuoxuCount);
         addChild(this.useBLJH2);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            x = 270;
            y = 30;
            textColor = StaticValue.GREEN;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.ft2);
         this.kstsBtn = new SmallButton();
         this.kstsBtn.label = LanResManager.getLanCommonTextWords("开始突破");
         addChild(this.kstsBtn);
         this.kstsBtn.x = 277 + 33;
         this.kstsBtn.y = 70;
         this.kstsBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdtsBtn = new SmallButton();
         this.zdtsBtn.label = LanResManager.getLanCommonTextWords("自动突破");
         addChild(this.zdtsBtn);
         this.zdtsBtn.x = 350 + 15;
         this.zdtsBtn.y = 70;
         this.zdtsBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function get useDantianGoodsType() : int
      {
         if(this.useBLJH.visible && this.useBLJH.selectState)
         {
            return 1;
         }
         if(this.useBLJH2.visible && this.useBLJH2.selectState)
         {
            return 2;
         }
         return 0;
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         this.$parent2.dispatchEvent(new BaseEvent(Dantian.UI_DANTIAN_GUANBI_CLICK,"",this.ftTime.htmlText));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.buyBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DANTIAN_GOUMAI_CLICK,"",this.goodsId));
               break;
            case this.kstsBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DANTIAN_KAISHITISHENG_CLICK));
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DANTIAN_ZIDONGTISHENG_CLICK,"",false));
               break;
            case this.zdtsBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DANTIAN_ZIDONGTISHENG_CLICK));
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
      
      public function setZhufuzhi(param1:int, param2:int) : void
      {
         if(param1 > param2)
         {
            this.barBar6.setValue(param2,param2);
         }
         else
         {
            this.barBar6.setValue(param1,param2);
         }
      }
      
      public function setChenggonglv(param1:int, param2:int, param3:String, param4:Boolean) : void
      {
         this._goodsName = param3;
         this._count = param1;
         this._jilv = param2;
         this._enough = param4;
         this.updateSuoxuCount();
         this.fb1.text = param3;
      }
      
      public function updateSuoxuCount(param1:* = null) : void
      {
         var _loc2_:int = this._count;
         if(this.useDantianGoodsType == 1)
         {
            _loc2_ = this._count - 1;
         }
         if(this.useDantianGoodsType == 2)
         {
            _loc2_ = 0;
         }
         _loc2_ = Math.max(0,_loc2_);
         if(this._enough)
         {
            this.ft2.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次提升需要：") + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + this._goodsName + _loc2_ + LanResManager.getLanCommonTextWords("颗") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次提升成功率：") + this._jilv + "%</font>" + "</textformat>";
         }
         else
         {
            this.ft2.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次提升需要：") + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + this._goodsName + _loc2_ + LanResManager.getLanCommonTextWords("颗") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次提升成功率：") + this._jilv + "%</font>" + "</textformat>";
         }
         this.useBLJH.visible = GameState.gongneng161;
         this.useBLJH2.visible = GameState.gongneng162;
      }
      
      public function setPudidan(param1:Goods) : void
      {
         this.goodsId = param1.id;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 19;
         this.item.y = 34;
         addChild(this.item);
      }
      
      public function setCheck(param1:Boolean) : void
      {
         this.checkBox.selectState = param1;
      }
      
      public function setZdtsBtnLabel(param1:Boolean) : void
      {
         if(param1)
         {
            this.zdtsBtn.label = LanResManager.getLanCommonTextWords("自动突破");
         }
         else
         {
            this.zdtsBtn.label = LanResManager.getLanCommonTextWords("停止突破");
         }
      }
      
      public function setRTime(param1:int) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         this.rTime = param1;
         if(this.rTime == 0)
         {
            this.ftTime.htmlText = "";
         }
         else
         {
            _loc2_ = LanResManager.getLanCommonTextWords("祝福值清空倒计时：");
            _loc3_ = LanResManager.getLanCommonTextWords("时");
            _loc4_ = LanResManager.getLanCommonTextWords("分");
            this.ftTime.htmlText = "";
         }
      }
   }
}

