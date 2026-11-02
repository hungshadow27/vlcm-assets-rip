package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class TianJiangXiangRuiPanel extends FPanel
   {
      
      public static const TIANJIANGXIANGRUI_CHUANSHONG:String = "TIANJIANGXIANGRUI_CHUANSHONG";
      
      public static const TIANJIANGXIANGRUI_QINGQIU_GOODS:String = "TIANJIANGXIANGRUI_QINGQIU_GOODS";
      
      private var fta1:FTextArea;
      
      private var lookBtn:SecondButton;
      
      private var goodsPanel:XiangRuiGoodsPanel;
      
      private var lineList:FList;
      
      public function TianJiangXiangRuiPanel()
      {
         var bgdown:DisplayObject;
         var text:FTextArea;
         var spr:Sprite;
         var bx:FCanvas = null;
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 489;
         height = 382;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         titleText = LanResManager.getLanCommonTextWords("龙脉宝藏");
         bgdown = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tianjiangxiangrui/bg.swf");
         bgdown.x = 10;
         bgdown.y = 2;
         addChild(bgdown);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 20;
            y = 20;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("每周六、日13：00~14:00；19:00~20:00") + "<br></font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("开启龙脉宝藏活动，届时在古墓密室中击杀怪物") + LanResManager.getLanCommonTextWords("几率掉落稀有材料。") + "</font></textformat>";
         }
         addChild(this.fta1);
         bx = new FCanvas();
         bx.skin = "box_transparence";
         bx.x = 246;
         bx.y = 236;
         bx.width = 233;
         bx.height = 103;
         addChild(bx);
         text = new FTextArea();
         with(text)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 280;
            y = 245;
            htmlText = "<font size=\'15\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("稀有掉落") + "</font>";
         }
         addChild(text);
         text = new FTextArea();
         with(text)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 300;
            y = 272;
            htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动期间，击杀古墓密室怪物会掉落") + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("稀有材料。") + "</font>";
         }
         addChild(text);
         this.lookBtn = new SecondButton();
         this.lookBtn.label = LanResManager.getLanCommonTextWords("查看掉落");
         addChild(this.lookBtn);
         this.lookBtn.x = 330;
         this.lookBtn.y = 310;
         this.lookBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         spr = new Sprite();
         spr.graphics.beginFill(0,0.3);
         spr.graphics.drawRect(0,0,233,102);
         spr.graphics.endFill();
         spr.x = 12;
         spr.y = 237;
         addChild(spr);
         this.lineList = new FList();
         this.lineList.skin = "list";
         this.lineList.itemRenderer = new TianJiangXiangRuiListRender();
         TianJiangXiangRuiListRender.$parent = this;
         this.lineList.listWidth = 233;
         spr.addChild(this.lineList);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this != null && this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.lookBtn:
               dispatchEvent(new BaseEvent(TIANJIANGXIANGRUI_QINGQIU_GOODS));
         }
      }
      
      public function setData(param1:Array) : void
      {
         this.lineList.dataProvider = param1;
      }
      
      public function showGoods(param1:Array = null) : void
      {
         if(this.goodsPanel == null)
         {
            this.goodsPanel = new XiangRuiGoodsPanel();
         }
         GameInstance.uiInstance.uiContainer.addChild(this.goodsPanel);
         this.goodsPanel.x = (GameConfig.sceneWidth - this.goodsPanel.panelWidth) / 2;
         this.goodsPanel.y = (GameConfig.sceneHeight - this.goodsPanel.panelHeight) / 2;
         this.goodsPanel.setGoods(param1);
      }
   }
}

