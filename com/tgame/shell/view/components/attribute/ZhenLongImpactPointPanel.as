package com.tgame.shell.view.components.attribute
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
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
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ZhenLongImpactPointPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var pointName:FLabel;
      
      private var prize:FLabel;
      
      private var gasTotal:FLabel;
      
      private var okBtn:SecondButton;
      
      private var expandGas:FTextArea;
      
      private var probability:FLabel;
      
      private var itemCount:FTextArea;
      
      private var item:ItemFace;
      
      public function ZhenLongImpactPointPanel()
      {
         var img:Bitmap;
         var lb:FLabel;
         var text1:FTextArea;
         super();
         skin = "panel_btn";
         showCloseButton = true;
         width = 292;
         height = 284;
         titleText = LanResManager.getLanTextWords(this,"真龙冲穴");
         img = StaticValue.getBitmapByClassName("ui.attribute.venation.impact.zhenlong.ui");
         addChild(img);
         img.x = 10;
         img.y = 2;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         lb = new FLabel();
         with(lb)
         {
            x = 17;
            y = 9;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"您即冲开穴位");
         }
         addChild(lb);
         this.pointName = new FLabel();
         with(this.pointName)
         {
            x = 154;
            y = 9;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanTextWords(this,"开穴位");
         }
         addChild(this.pointName);
         lb = new FLabel();
         with(lb)
         {
            x = 17;
            y = 33;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"本穴位冲通后您将获得");
         }
         addChild(lb);
         this.prize = new FLabel();
         with(this.prize)
         {
            x = 154;
            y = 33;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanTextWords(this,"您将获得");
         }
         addChild(this.prize);
         lb = new FLabel();
         with(lb)
         {
            x = 17;
            y = 57;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"您当前拥有真气储量");
         }
         addChild(lb);
         this.gasTotal = new FLabel();
         with(this.gasTotal)
         {
            x = 154;
            y = 57;
            textColor = StaticValue.WHITE;
            text = "999999";
         }
         addChild(this.gasTotal);
         text1 = new FTextArea();
         with(text1)
         {
            x = 17;
            y = 84;
            width = 268;
            height = 100;
            wordWrap = true;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"真龙冲穴面板的温馨提示",[StaticValue.GREEN_HTML]);
         }
         addChild(text1);
         text1 = new FTextArea();
         with(text1)
         {
            x = 31;
            y = 176;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
         }
         addChild(text1);
         this.okBtn = new SecondButton();
         addChild(this.okBtn);
         this.okBtn.label = LanResManager.getLanTextWords(this,"真龙冲穴面板运功冲穴");
         this.okBtn.x = (width - this.okBtn.width) / 2;
         this.okBtn.y = 216;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onStart);
         this.expandGas = new FTextArea();
         with(this.expandGas)
         {
            x = 77;
            y = 148;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"真龙冲穴面板本次操作消耗真气");
         }
         addChild(this.expandGas);
         this.itemCount = new FTextArea();
         with(this.itemCount)
         {
            x = 77;
            y = 168;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"本次操作消耗道具");
         }
         addChild(this.itemCount);
         this.probability = new FLabel();
         with(this.probability)
         {
            x = 77;
            y = 188;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"本次操作成功几率");
         }
         addChild(this.probability);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         POPWindowManager.closeWindow();
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_VENATION_POINT_IMPACT_STARTBTN_CLICK,"","no"));
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         POPWindowManager.closeWindow();
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_VENATION_POINT_IMPACT_STARTBTN_CLICK,"","yes"));
      }
      
      public function setPoint(param1:String) : void
      {
         this.pointName.text = param1;
      }
      
      public function setPrize(param1:String) : void
      {
         this.prize.text = param1;
      }
      
      public function setGasTotal(param1:int) : void
      {
         this.gasTotal.text = param1.toString();
      }
      
      public function setItem(param1:Goods) : void
      {
         if(Boolean(this.item) && Boolean(this.item.parent))
         {
            this.item.parent.removeChild(this.item);
         }
         if(!param1)
         {
            return;
         }
         this.item = new ItemFace(param1);
         this.item.x = 30;
         this.item.y = 165;
         addChild(this.item);
      }
      
      public function setExpandGas(param1:int) : void
      {
         this.expandGas.text = LanResManager.getLanTextWords(this,LanResManager.getLanCommonTextWords("设置消耗真气1"),[param1]);
         this.expandGas.htmlText = LanResManager.getLanCommonTextWords("本次操作消耗真气：") + "<font color=\'" + (param1 > int(this.gasTotal.text) ? StaticValue.RED_HTML : StaticValue.GREEN_HTML) + "\'>" + param1 + "</font>";
      }
      
      public function setItemCount(param1:int) : void
      {
         if(param1 == 0)
         {
            this.itemCount.htmlText = LanResManager.getLanCommonTextWords("本次操作消耗道具：无需");
         }
         else
         {
            this.itemCount.htmlText = LanResManager.getLanCommonTextWords("本次操作消耗道具：") + "<font color=\'" + (param1 > this.item.getBaseItem().count ? StaticValue.RED_HTML : StaticValue.GREEN_HTML) + "\'>" + param1 + "</font>";
         }
         if(Boolean(this.item) && Boolean(this.item.parent))
         {
            if(this.item.getBaseItem().count < param1)
            {
               this.item.filters = Tools.blackWhiteFilter;
            }
            else
            {
               this.item.filters = [];
            }
         }
      }
      
      public function setProbability(param1:int) : void
      {
         this.probability.text = LanResManager.getLanCommonTextWords("设置操作成功几率") + "：" + param1 + "%";
      }
   }
}

