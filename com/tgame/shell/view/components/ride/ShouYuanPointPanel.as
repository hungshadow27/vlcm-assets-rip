package com.tgame.shell.view.components.ride
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.RideFeedPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ShouYuanPointPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var pointName:FLabel;
      
      private var prize:FTextArea;
      
      private var gasTotal:FLabel;
      
      private var checkBox:FCheckBox;
      
      private var selectBtn:FSimpleButton;
      
      private var count:FLabel;
      
      private var countList:FList;
      
      private var listContainer:FCanvas;
      
      private var scroll:FVScorllBar;
      
      private var itemContainer:Sprite;
      
      private var okBtn:SecondButton;
      
      private var expandGas:FTextArea;
      
      private var gas:int;
      
      private var probability:FLabel;
      
      private var succ:int;
      
      private var index:int;
      
      public function ShouYuanPointPanel()
      {
         var lb:FLabel;
         var text1:FTextArea;
         var bx:FCanvas = null;
         var textBg:F9GridBitmap = null;
         super();
         this.dragAble = true;
         skin = "panel_btn";
         showCloseButton = true;
         width = 291;
         height = 285;
         titleText = LanResManager.getLanCommonTextWords("兽元");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bx = new FCanvas();
         bx.skin = "box";
         bx.x = 10;
         bx.y = 30;
         bx.width = 271;
         bx.height = 110;
         addChild(bx);
         lb = new FLabel();
         with(lb)
         {
            x = 17;
            y = 11;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("您要修炼的兽元");
         }
         addChild(lb);
         textBg = Tools.get9GridBitmpByName("countBg");
         addChild(textBg);
         textBg.width = 100;
         textBg.x = 130;
         textBg.y = 10;
         this.pointName = new FLabel();
         with(this.pointName)
         {
            x = 154;
            y = 11;
            textColor = StaticValue.WHITE;
         }
         addChild(this.pointName);
         lb = new FLabel();
         with(lb)
         {
            x = 20;
            y = 145;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("修炼成功后将获得");
         }
         addChild(lb);
         this.prize = new FTextArea();
         with(this.prize)
         {
            x = 20;
            y = 165;
            width = 255;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
         }
         addChild(this.prize);
         text1 = new FTextArea();
         with(text1)
         {
            x = 17;
            y = 40;
            width = 268;
            height = 40;
            wordWrap = true;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<textformat>" + LanResManager.getLanCommonTextWords("温馨提示：冲穴时会带给我周围人大量经验加成，请把您的朋友都聚拢在身边后再开始冲穴哦") + "</textformat>";
         }
         addChild(text1);
         this.okBtn = new SecondButton();
         addChild(this.okBtn);
         this.okBtn.label = LanResManager.getLanCommonTextWords("修炼兽元");
         this.okBtn.x = (width - this.okBtn.width) / 2;
         this.okBtn.y = 216;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onStart);
         lb = new FLabel();
         with(lb)
         {
            x = 94;
            y = 120;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本次操作使用个兽元金丹");
         }
         addChild(lb);
         this.expandGas = new FTextArea();
         with(this.expandGas)
         {
            x = 92;
            y = 80;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本次操作消耗魔血：");
         }
         addChild(this.expandGas);
         this.probability = new FLabel();
         with(this.probability)
         {
            x = 92;
            y = 100;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本次操作成功几率：");
         }
         addChild(this.probability);
         this.checkBox = new FCheckBox();
         addChild(this.checkBox);
         this.checkBox.x = 73;
         this.checkBox.y = 120;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.selectBtn = new FSimpleButton();
         this.selectBtn.skin = "bottomButton";
         addChild(this.selectBtn);
         this.selectBtn.x = 192;
         this.selectBtn.y = 120;
         this.selectBtn.enabled = false;
         this.selectBtn.addEventListener(MouseEvent.CLICK,this.onShowList);
         this.count = new FLabel();
         with(this.count)
         {
            x = 176;
            y = 120;
            textColor = StaticValue.WHITE;
            text = "1";
         }
         addChild(this.count);
         this.listContainer = new FCanvas();
         this.listContainer.skin = "backGroud";
         addChild(this.listContainer);
         this.listContainer.x = 172;
         this.listContainer.y = 202 - 65;
         this.listContainer.visible = false;
         this.countList = new FList();
         this.countList.listWidth = 16;
         this.countList.x = 3;
         this.countList.y = 2;
         this.countList.dataProvider = <list>
														<node label="0"/>
													</list>;
         this.listContainer.addChild(this.countList);
         this.countList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.listContainer.width = this.countList.width + 6;
         this.listContainer.height = 78;
         this.setListCount(9);
         this.scroll = new FVScorllBar(this.countList,74);
         this.listContainer.addChild(this.scroll);
         this.scroll.x = 22;
         this.scroll.y = 2;
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.itemContainer.x = 30;
         this.itemContainer.y = 80;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(RideFeedPanel.UI_RIDE_SHOUYUAN_TUPO,"",[this.index,this.checkBox.selectState ? parseInt(this.count.text) : 0]));
      }
      
      private function setListCount(param1:int) : void
      {
         var _loc2_:int = 0;
         param1 = param1 > 9 ? 9 : param1;
         var _loc3_:XML = <list></list>;
         _loc2_ = 1;
         while(_loc2_ < param1 + 1)
         {
            _loc3_.appendChild(<node label={_loc2_}/>);
            _loc2_++;
         }
         this.countList.dataProvider = _loc3_;
      }
      
      private function onShowList(param1:MouseEvent) : void
      {
         this.listContainer.visible = !this.listContainer.visible;
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         this.selectBtn.enabled = this.checkBox.selectState;
         if(!this.checkBox.selectState)
         {
            this.probability.text = LanResManager.getLanCommonTextWords("本次操作成功几率：") + this.succ + "%";
         }
         else
         {
            this.probability.text = LanResManager.getLanCommonTextWords("本次操作成功几率：") + (this.succ + 5 * parseInt(this.count.text)) + "%";
         }
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         this.count.text = this.countList.selectItem.label;
         this.listContainer.visible = false;
         this.probability.text = LanResManager.getLanCommonTextWords("本次操作成功几率：") + (this.succ + 5 * parseInt(this.count.text)) + "%";
      }
      
      public function setPoint(param1:String) : void
      {
         this.pointName.text = param1;
      }
      
      public function setPrize(param1:String) : void
      {
         this.prize.htmlText = param1;
      }
      
      public function setId(param1:int) : void
      {
         this.index = param1;
      }
      
      public function setItem(param1:Goods) : void
      {
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         this.itemContainer.addChild(new ItemFace(param1));
      }
      
      public function setExpandGas(param1:int, param2:int) : void
      {
         this.expandGas.htmlText = LanResManager.getLanCommonTextWords("本次操作消耗魔血：") + "<font color=\'" + (param1 > param2 ? StaticValue.RED_HTML : StaticValue.GREEN_HTML) + "\'>" + param1 + "</font>";
      }
      
      public function setProbability(param1:int) : void
      {
         this.succ = param1;
         if(this.checkBox.selectState)
         {
            param1 += 5 * parseInt(this.count.text);
         }
         this.probability.text = LanResManager.getLanCommonTextWords("本次操作成功几率：") + param1 + "%";
      }
      
      public function reset() : void
      {
         this.count.text = "1";
         this.checkBox.selectState = false;
         this.selectBtn.enabled = false;
      }
   }
}

