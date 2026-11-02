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
   
   public class WuXingZhenTuPoCanvas extends Sprite
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
      
      public var checkBox:FCheckBox;
      
      public var checkBox1:FCheckBox;
      
      private var goodsNum:int;
      
      private var goods:Goods;
      
      private var xingyunzhi:int;
      
      private var addZhufu:int;
      
      private var index:int;
      
      public function WuXingZhenTuPoCanvas()
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
         }
         addChild(this.fb1);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 17;
         this.img.y = 32;
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
         with(this.ft1)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 80;
            y = 38;
            textColor = StaticValue.RED;
            htmlText = LanResManager.getLanCommonTextWords("祝福值将会在每日6点清零");
         }
         addChild(this.ft1);
         this.img = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.img);
         this.img.width = 198;
         this.img.x = 68;
         this.img.y = 55;
         this.ft3 = new FTextArea();
         with(this.ft3)
         {
            x = 63 + 5;
            y = 61;
            textColor = StaticValue.GREEN;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("玩家可以使用超级锻造材料代替五行灵珠进行突破。五行阵法突破层及以上才能使用超级锻造材料进行替代");
         }
         addChild(this.ft3);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            x = 270;
            y = 34;
            textColor = StaticValue.GREEN;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
         }
         addChild(this.ft2);
         this.kstsBtn = new SecondButton();
         this.kstsBtn.label = LanResManager.getLanCommonTextWords("开始提升");
         addChild(this.kstsBtn);
         this.kstsBtn.x = 270;
         this.kstsBtn.y = 70 + 10;
         this.kstsBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdtsBtn = new SecondButton();
         this.zdtsBtn.label = LanResManager.getLanCommonTextWords("自动提升");
         addChild(this.zdtsBtn);
         this.zdtsBtn.x = 343;
         this.zdtsBtn.y = 70 + 10;
         this.zdtsBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         var str:String = null;
         var e:MouseEvent = param1;
         if(this.xingyunzhi > 0)
         {
            str = "";
            str = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("五行阵提升祝福值重要提示：") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("五行阵等级提升失败将会增加一定幅度的祝福值；祝福值越高则下次突破成功几率越高。") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("您当前已经积累了祝福值：") + this.xingyunzhi + LanResManager.getLanCommonTextWords("点") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("每日凌晨6:00将会准时清空祝福值") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("请在此时间完成领悟，以免造成损失") + "<br></font>" + "</textformat>";
            FAlert.okLabel = LanResManager.getLanCommonTextWords("关闭面板");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("继续提升");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  $parent2.dispatchEvent(new BaseEvent(WuXingZhen.UI_TUPO_GUANBI_CLICK));
               }
            });
         }
         else
         {
            this.$parent2.dispatchEvent(new BaseEvent(WuXingZhen.UI_TUPO_GUANBI_CLICK));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.buyBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUXINGZHEN_GOUMAI_CLICK,"",this.goods.id));
               break;
            case this.kstsBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUXINGZHEN_KAISHITISHENG_CLICK,"",this.index));
               break;
            case this.zdtsBtn:
               if(this.zdtsBtn.label == LanResManager.getLanCommonTextWords("自动提升"))
               {
                  this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUXINGZHEN_ZIDONGTISHENG_CLICK,"",true));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUXINGZHEN_ZIDONGTISHENG_CLICK,"",false));
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
         this.item.y = 34;
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

