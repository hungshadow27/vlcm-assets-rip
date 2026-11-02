package com.tgame.shell.view.components
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.biguan.AffirmancePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class BiGuangPanel extends FPanel
   {
      
      public static const UI_BIGUAN_BUY_BTN_CLICK:String = "UI_BIGUAN_BUY_BTN_CLICK";
      
      public static const UI_BIGUAN_INCOME_BTN_CLICK:String = "UI_BIGUAN_INCOME_BTN_CLICK";
      
      public static const UI_BIGUAN_DOUBLING_INCOME_BTN_CLICK:String = "UI_BIGUAN_DOUBLING_INCOME_BTN_CLICK";
      
      public static const UI_BIGUAN_INCOME_GET:String = "UI_BIGUAN_INCOME_GET";
      
      public static const UI_BIGUAN_DOUBLING_INCOME_GET:String = "UI_BIGUAN_DOUBLING_INCOME_GET";
      
      private var hourCount:FLabel;
      
      private var minuteCount:FLabel;
      
      private var charExp:FLabel;
      
      private var zhenqi:FLabel;
      
      private var buyBtn:SecondButton;
      
      private var incomeBtn:SecondButton;
      
      private var doublingIncomeBtn:SecondButton;
      
      private var tip:FTextArea;
      
      private var incomePanel:AffirmancePanel;
      
      private var doubleIncomePanel:AffirmancePanel;
      
      public function BiGuangPanel()
      {
         var check:FCheckBox;
         var lb:FLabel;
         var line:Bitmap = null;
         var box:FCanvas = null;
         var img:F9GridBitmap = null;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 340;
         height = 337;
         titleText = LanResManager.getLanCommonTextWords("闭关设定与收益");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         line = StaticValue.getBitmapByClassName("ui.line");
         addChild(line);
         line.width = 320;
         line.x = 10;
         line.y = 51;
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 10;
         box.y = 120;
         box.width = 320;
         box.height = 108;
         check = new FCheckBox();
         addChild(check);
         check.x = 23;
         check.y = 12;
         check.selectState = true;
         lb = new FLabel();
         with(lb)
         {
            x = 45;
            y = 11;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"自动开启闭关");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 45;
            y = 30;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"勾选本选项");
         }
         addChild(lb);
         img = Tools.get9GridBitmpByName("countBg");
         addChild(img);
         img.width = 37;
         img.x = 138;
         img.y = 55;
         img = Tools.get9GridBitmpByName("countBg");
         addChild(img);
         img.width = 37;
         img.x = 204;
         img.y = 55;
         lb = new FLabel();
         with(lb)
         {
            x = 45;
            y = 56;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"您当前已经闭关");
         }
         addChild(lb);
         this.hourCount = new FLabel();
         with(this.hourCount)
         {
            x = 144;
            y = 56;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "12";
         }
         addChild(this.hourCount);
         this.minuteCount = new FLabel();
         with(this.minuteCount)
         {
            x = 210;
            y = 56;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "60";
         }
         addChild(this.minuteCount);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 45;
            y = 80;
            autoSize = TextFormatAlign.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"请注意");
         }
         addChild(this.tip);
         lb = new FLabel();
         with(lb)
         {
            x = 45;
            y = 134;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"您当前可领取的闭关收益");
         }
         addChild(lb);
         img = Tools.get9GridBitmpByName("countBg");
         addChild(img);
         img.width = 70;
         img.x = 135;
         img.y = 164;
         lb = new FLabel();
         with(lb)
         {
            x = 45;
            y = 165;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"人物经验值");
         }
         addChild(lb);
         this.charExp = new FLabel();
         with(this.charExp)
         {
            x = 138;
            y = 165;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "0";
         }
         addChild(this.charExp);
         img = Tools.get9GridBitmpByName("countBg");
         addChild(img);
         img.width = 70;
         img.x = 135;
         img.y = 194;
         lb = new FLabel();
         with(lb)
         {
            x = 45;
            y = 195;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"物真气储量");
         }
         addChild(lb);
         this.zhenqi = new FLabel();
         with(this.zhenqi)
         {
            x = 138;
            y = 195;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "0";
         }
         addChild(this.zhenqi);
         lb = new FLabel();
         with(lb)
         {
            x = 32;
            y = 235;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"温馨提示");
         }
         addChild(lb);
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanTextWords(this,"购买闭关令符");
         addChild(this.buyBtn);
         this.buyBtn.x = 15;
         this.buyBtn.y = 273;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.incomeBtn = new SecondButton();
         this.incomeBtn.label = LanResManager.getLanTextWords(this,"领取闭关收益");
         addChild(this.incomeBtn);
         this.incomeBtn.x = 110;
         this.incomeBtn.y = 273;
         this.incomeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.doublingIncomeBtn = new SecondButton();
         this.doublingIncomeBtn.label = LanResManager.getLanTextWords(this,"领取双倍闭关收益");
         addChild(this.doublingIncomeBtn);
         this.doublingIncomeBtn.x = width - this.doublingIncomeBtn.width - 15;
         this.doublingIncomeBtn.y = 273;
         this.doublingIncomeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.buyBtn:
               dispatchEvent(new BaseEvent(UI_BIGUAN_BUY_BTN_CLICK));
               break;
            case this.incomeBtn:
               dispatchEvent(new BaseEvent(UI_BIGUAN_INCOME_BTN_CLICK));
               break;
            case this.doublingIncomeBtn:
               dispatchEvent(new BaseEvent(UI_BIGUAN_DOUBLING_INCOME_BTN_CLICK));
         }
      }
      
      public function setTime(param1:int, param2:int) : void
      {
         this.hourCount.text = param1.toString();
         this.minuteCount.text = param2.toString();
         if(param1 == 12)
         {
            this.tip.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanTextWords(this,"闭关已满12个小时") + "</font";
         }
         else
         {
            this.tip.htmlText = LanResManager.getLanTextWords(this,"请注意12");
         }
      }
      
      public function setIncome(param1:int, param2:int) : void
      {
         this.charExp.text = param1.toString();
         this.zhenqi.text = param2.toString();
      }
      
      public function showIncomeAffirmancePanel(param1:Goods, param2:int, param3:int) : void
      {
         if(!this.incomePanel)
         {
            this.incomePanel = new AffirmancePanel();
            this.incomePanel.type = 1;
         }
         this.incomePanel.visible = true;
         this.incomePanel.$parent = this;
         this.incomePanel.x = (GameConfig.sceneWidth - this.incomePanel.panelWidth) / 2;
         this.incomePanel.y = (GameConfig.sceneHeight - this.incomePanel.panelHeight) / 2;
         this.incomePanel.setData(param1,param2,param3);
         GameInstance.uiInstance.uiContainer.addChild(this.incomePanel);
      }
      
      public function showDoubleIncomeAffirmancePanel(param1:Goods, param2:int, param3:int) : void
      {
         if(!this.doubleIncomePanel)
         {
            this.doubleIncomePanel = new AffirmancePanel();
            this.doubleIncomePanel.type = 2;
         }
         this.doubleIncomePanel.x = (GameConfig.sceneWidth - this.doubleIncomePanel.panelWidth) / 2;
         this.doubleIncomePanel.y = (GameConfig.sceneHeight - this.doubleIncomePanel.panelHeight) / 2;
         this.doubleIncomePanel.visible = true;
         this.doubleIncomePanel.$parent = this;
         this.doubleIncomePanel.setData(param1,param2,param3);
         GameInstance.uiInstance.uiContainer.addChild(this.doubleIncomePanel);
      }
   }
}

