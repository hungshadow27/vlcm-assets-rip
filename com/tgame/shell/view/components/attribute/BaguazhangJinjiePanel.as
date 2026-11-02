package com.tgame.shell.view.components.attribute
{
   import com.fireice.alert.FAlert;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
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
   
   public class BaguazhangJinjiePanel extends FPanel
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
      
      private var bgCanvas:FCanvas;
      
      private var lb:FLabel;
      
      public var checkBox:FCheckBox;
      
      public var checkBox1:FCheckBox;
      
      private var xingyunzhi:int;
      
      private var sp:Sprite;
      
      private var ftt1:FTextArea;
      
      private var bit1:DisplayObject;
      
      private var bit2:DisplayObject;
      
      private var goodsCount:int;
      
      public function BaguazhangJinjiePanel()
      {
         super();
         this.skin = "panel";
         this.showCloseButton = true;
         dragAble = true;
         width = 252 + 178;
         height = 380 - 29;
         titleText = LanResManager.getLanTextWords(this,"八卦掌进阶");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.img = StaticValue.getBitmapByClassName("ui.baguazhang.jiantou");
         addChild(this.img);
         this.img.x = 185;
         this.img.y = 60;
         this.img = StaticValue.getBitmapByClassName("ui.baguazhang.jinjie.bagua");
         addChild(this.img);
         this.img.x = 200;
         this.img.y = 0;
         this.ftt1 = new FTextArea();
         with(this.ftt1)
         {
            filters = StaticValue.filter;
            width = 400;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 135;
            textColor = StaticValue.YELLOW;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("八卦掌以滚钻争裹，奇正相生，走转拧翻，身随步走，掌随身变，行走如龙，回转若猴，换势似鹰，威猛如虎”；以曲刹直，以动扰静，以静刹动为修炼原则。分狮鹿蛇鹞龙熊凤猴八型代表。") + "</textformat>";
         }
         addChild(this.ftt1);
         this.sp = new Sprite();
         addChild(this.sp);
         this.sp.y = 200;
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 10;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 411;
         this.bgCanvas.height = 107;
         this.bgCanvas.skin = "box";
         this.sp.addChild(this.bgCanvas);
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
            text = LanResManager.getLanCommonTextWords("八骨丹");
         }
         this.sp.addChild(this.fb1);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.sp.addChild(this.img);
         this.img.x = 17;
         this.img.y = 32;
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanTextWords(SmithingBodyAdvanceCanvas,"购买");
         this.buyBtn.x = 15;
         this.buyBtn.y = 73;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lb6 = new FLabel();
         with(this.lb6)
         {
            x = 63 + 13;
            y = 18;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(SmithingBodyAdvanceCanvas,"提升祝福值");
         }
         this.sp.addChild(this.lb6);
         this.barBg6 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.sp.addChild(this.barBg6);
         this.barBg6.width = 120;
         this.barBg6.x = this.lb6.x + this.lb6.width;
         this.barBg6.y = this.lb6.y + 5;
         this.barBar6 = new ColorBar(5,110,5);
         this.sp.addChild(this.barBar6);
         this.barBar6.x = this.lb6.x + this.lb6.width + 4;
         this.barBar6.y = this.lb6.y + 8;
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 63;
            y = 38;
            textColor = StaticValue.RED;
            htmlText = LanResManager.getLanCommonTextWords("祝福值将会在每日6点清零");
         }
         this.sp.addChild(this.ft1);
         this.img = StaticValue.getBitmapByClassName("ui.line");
         this.sp.addChild(this.img);
         this.img.width = 198;
         this.img.x = 68;
         this.img.y = 55;
         this.ft3 = new FTextArea();
         with(this.ft3)
         {
            x = 63;
            y = 61;
            textColor = StaticValue.GREEN;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
         }
         this.sp.addChild(this.ft3);
         this.checkBox = new FCheckBox();
         this.sp.addChild(this.checkBox);
         this.checkBox.border = true;
         this.checkBox.textColor = StaticValue.WHITE;
         this.checkBox.text = LanResManager.getLanCommonTextWords("本次使用菩提精萃");
         this.checkBox.x = 270;
         this.checkBox.y = 15;
         this.checkBox.visible = false;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.checkBox1 = new FCheckBox();
         this.sp.addChild(this.checkBox1);
         this.checkBox1.border = true;
         this.checkBox1.textColor = StaticValue.WHITE;
         this.checkBox1.text = LanResManager.getLanCommonTextWords("本次使用神奇菩提丹");
         this.checkBox1.x = 270;
         this.checkBox1.y = 15;
         this.checkBox1.visible = false;
         this.checkBox1.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            x = 270;
            y = 14;
            textColor = StaticValue.GREEN;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
         }
         this.sp.addChild(this.ft2);
         this.kstsBtn = new SecondButton();
         this.kstsBtn.label = LanResManager.getLanTextWords(SmithingBodyAdvanceCanvas,"开始提升");
         this.sp.addChild(this.kstsBtn);
         this.kstsBtn.x = 227;
         this.kstsBtn.y = 79;
         this.kstsBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdtsBtn = new SecondButton();
         this.zdtsBtn.label = LanResManager.getLanTextWords(SmithingBodyAdvanceCanvas,"自动提升");
         this.sp.addChild(this.zdtsBtn);
         this.zdtsBtn.x = 300;
         this.zdtsBtn.y = 79;
         this.zdtsBtn.toolTip = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"自动使用背包中的八骨丹提升八卦掌境界直至成功当前八卦掌境界或",[StaticValue.WHITE_HTML,StaticValue.WHITE_HTML]) + "</textformat>";
         this.zdtsBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.setDengji(1);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         var self:DisplayObject = null;
         var str:String = null;
         var e:FCloseEvent = param1;
         self = this;
         if(this.xingyunzhi > 0)
         {
            str = "";
            str = LanResManager.getLanTextWords(SmithingBodyAdvanceCanvas,"肉身提升祝福值重要提示2",[StaticValue.RED_HTML,StaticValue.GREEN_HTML,StaticValue.RED_HTML,this.xingyunzhi]);
            FAlert.okLabel = LanResManager.getLanCommonTextWords("关闭面板");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("继续提升");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  $parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICKB,"",false));
                  if(parent != null)
                  {
                     parent.removeChild(self);
                  }
               }
            });
         }
         else if(parent != null)
         {
            parent.removeChild(self);
         }
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkBox:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_PUTIJINGCUI_CHECK_CLICKB,"",this.checkBox.selectState ? 1 : 0));
               break;
            case this.checkBox1:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_PUTIJINGCUI_CHECK_CLICKB,"",this.checkBox1.selectState ? 2 : 0));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.buyBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_GOUMAI_CLICKB));
               break;
            case this.kstsBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_KAISHITISHENG_CLICKB));
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICKB,"",false));
               break;
            case this.zdtsBtn:
               if(this.zdtsBtn.label = LanResManager.getLanTextWords(SmithingBodyAdvanceCanvas,"自动提升"))
               {
                  this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICKB,"",true));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICKB,"",false));
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
         _loc4_ = "<textformat leading=\'4\'>";
         _loc4_ = _loc4_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次提升需要：") + "</font>");
         if(this.goodsCount >= param1)
         {
            _loc4_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param3 + param1 + LanResManager.getLanCommonTextWords("颗") + "</font><br>";
         }
         else
         {
            _loc4_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + param3 + param1 + LanResManager.getLanCommonTextWords("颗") + "</font><br>";
         }
         _loc4_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次提升成功率：") + param2 + "%</font>";
         _loc4_ = _loc4_ + "</textformat>";
         this.ft2.htmlText = _loc4_;
         this.fb1.text = param3;
      }
      
      public function setAdvanceMiaoshu(param1:String) : void
      {
         this.ft3.htmlText = param1;
      }
      
      public function setCountDown(param1:int) : void
      {
         this.ft1.htmlText = LanResManager.getLanCommonTextWords("祝福值将会在每日6点清零");
      }
      
      public function setPudidan(param1:Goods) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.goodsCount = param1.count;
         this.item = new ItemFace(param1);
         this.item.x = 19;
         this.item.y = 34;
         this.sp.addChild(this.item);
      }
      
      public function setCheck(param1:Boolean) : void
      {
         this.checkBox.selectState = param1;
      }
      
      public function setDengji(param1:int) : void
      {
         if(this.bit1 != null && this.bit1.parent != null)
         {
            this.bit1.parent.removeChild(this.bit1);
         }
         this.bit1 = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/baguazhang/" + param1 + ".png",133,126);
         this.bit1.x = 82 - 32 - 20;
         this.bit1.y = 14;
         addChild(this.bit1);
         if(this.bit2 != null && this.bit2.parent != null)
         {
            this.bit2.parent.removeChild(this.bit2);
         }
         this.bit2 = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/baguazhang/" + (param1 + 1) + ".png",133,126);
         this.bit2.x = 82 + 200 - 17;
         this.bit2.y = 14;
         addChild(this.bit2);
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

