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
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class JingJieTuPoCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var $parent2:DisplayObject;
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var fb1:FLabel;
      
      private var img:Bitmap;
      
      private var buyBtn:SecondButton;
      
      private var lb6:FLabel;
      
      private var barBg6:Bitmap;
      
      private var barBar6:ColorBar;
      
      private var ft2:FTextArea;
      
      private var ft1:FTextArea;
      
      private var kstsBtn:SecondButton;
      
      private var zdtsBtn:SecondButton;
      
      private var zhufuzhi:int;
      
      private var item:ItemFace;
      
      private var goodsId:int;
      
      private var daojuInt:int;
      
      private var shuliang:int;
      
      public function JingJieTuPoCanvas()
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
         this.fb1 = new FLabel();
         with(this.fb1)
         {
            x = 12;
            y = 15;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.fb1);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 17;
         this.img.y = 32;
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         this.buyBtn.x = 15;
         this.buyBtn.y = 73;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lb6 = new FLabel();
         with(this.lb6)
         {
            x = 63;
            y = 18;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("突破祝福值：");
         }
         addChild(this.lb6);
         this.barBg6 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg6);
         this.barBg6.width = 120;
         this.barBg6.x = this.lb6.x + this.lb6.width;
         this.barBg6.y = this.lb6.y + 4;
         this.barBar6 = new ColorBar(5,110,5);
         addChild(this.barBar6);
         this.barBar6.x = this.lb6.x + this.lb6.width + 4;
         this.barBar6.y = this.lb6.y + 7;
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 63;
            y = 33;
            htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanTextWords(this,"突破失败将会增加一定幅度的祝福值祝福值越高则下次突破成功几率",[StaticValue.RED_HTML,StaticValue.GREEN_HTML],false) + "</textformat>";
         }
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            x = 265;
            y = 34;
            textColor = StaticValue.GREEN;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.ft2);
         this.kstsBtn = new SecondButton();
         this.kstsBtn.label = LanResManager.getLanCommonTextWords("开始突破");
         addChild(this.kstsBtn);
         this.kstsBtn.x = 270;
         this.kstsBtn.y = 70;
         this.kstsBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdtsBtn = new SecondButton();
         this.zdtsBtn.label = LanResManager.getLanCommonTextWords("自动突破");
         addChild(this.zdtsBtn);
         this.zdtsBtn.x = 343;
         this.zdtsBtn.y = 70;
         this.zdtsBtn.toolTip = LanResManager.getLanTextWords(this,"自动使用背包中的藏经密卷突破境界直至成功突破当前境界或所剩藏",[StaticValue.WHITE_HTML,StaticValue.WHITE_HTML]) + "</textformat>";
         this.zdtsBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         var str:String = null;
         var e:MouseEvent = param1;
         if(this.zhufuzhi > 0)
         {
            str = "";
            str = LanResManager.getLanTextWords(this,"境界突破祝福值重要提示境界突破失败将会增加一定幅度的祝福值祝",[StaticValue.RED_HTML,StaticValue.GREEN_HTML,StaticValue.GREEN_HTML,StaticValue.RED_HTML,this.zhufuzhi]) + "</textformat>";
            FAlert.okLabel = LanResManager.getLanCommonTextWords("关闭面板");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("继续提升");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  $parent2.dispatchEvent(new BaseEvent(JingJie.UI_JINGJIE_GUANBI_CLICK));
               }
            });
         }
         else
         {
            this.$parent2.dispatchEvent(new BaseEvent(JingJie.UI_JINGJIE_GUANBI_CLICK));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.buyBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGJIE_GOUMAI_CLICK,"",this.goodsId));
               break;
            case this.kstsBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGJIE_KAISHITISHENG_CLICK));
               break;
            case this.zdtsBtn:
               if(this.zdtsBtn.label == LanResManager.getLanCommonTextWords("自动突破"))
               {
                  this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGJIE_ZIDONGTISHENG_CLICK,"",true));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGJIE_ZIDONGTISHENG_CLICK,"",false));
               }
         }
      }
      
      public function setZhufuzhi(param1:int, param2:int) : void
      {
         this.zhufuzhi = param1;
         if(param1 > param2)
         {
            this.barBar6.setValue(param2,param2);
         }
         else
         {
            this.barBar6.setValue(param1,param2);
         }
      }
      
      public function setShuxing(param1:int, param2:int, param3:String) : void
      {
         this.daojuInt = param1;
         var _loc4_:String = "";
         _loc4_ = _loc4_ + "<textformat leading=\'3\'>";
         _loc4_ = _loc4_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次提升需要：") + "</font>");
         if(this.shuliang < this.daojuInt)
         {
            _loc4_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + param3 + param1 + LanResManager.getLanCommonTextWords("本") + "</font><br>";
         }
         else
         {
            _loc4_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param3 + param1 + LanResManager.getLanCommonTextWords("本") + "</font><br>";
         }
         _loc4_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次提升成功率：") + param2 / 100 + "%</font>";
         _loc4_ = _loc4_ + "</textformat>";
         this.fb1.text = param3;
         this.ft2.htmlText = _loc4_;
      }
      
      public function setGoods(param1:Goods) : void
      {
         this.shuliang = param1.count;
         this.goodsId = param1.id;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 19;
         this.item.y = 34;
         addChild(this.item);
         if(this.shuliang < this.daojuInt)
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
            this.zdtsBtn.label = LanResManager.getLanCommonTextWords("自动突破");
         }
         else
         {
            this.zdtsBtn.label = LanResManager.getLanCommonTextWords("停止突破");
         }
      }
   }
}

