package com.tgame.shell.view.components.attribute
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
   
   public class ImpactPointPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var pointName:FLabel;
      
      private var prize:FLabel;
      
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
      
      public function ImpactPointPanel()
      {
         var img:Bitmap;
         var lb:FLabel;
         var text1:FTextArea;
         super();
         skin = "panel_btn";
         showCloseButton = true;
         width = 291;
         height = 285;
         titleText = LanResManager.getLanTextWords(this,"冲穴");
         img = StaticValue.getBitmapByClassName("ui.char.attribute.venation.point.impact.ui");
         addChild(img);
         img.x = 10;
         img.y = 2;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         lb = new FLabel();
         with(lb)
         {
            x = 17;
            y = 11;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"您即冲开穴位");
         }
         addChild(lb);
         this.pointName = new FLabel();
         with(this.pointName)
         {
            x = 154;
            y = 11;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanTextWords(this,"开穴位");
         }
         addChild(this.pointName);
         lb = new FLabel();
         with(lb)
         {
            x = 17;
            y = 35;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"本穴位冲通后您将获得");
         }
         addChild(lb);
         this.prize = new FLabel();
         with(this.prize)
         {
            x = 154;
            y = 35;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanTextWords(this,"您将获得");
         }
         addChild(this.prize);
         lb = new FLabel();
         with(lb)
         {
            x = 17;
            y = 59;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"您当前拥有真气储量");
         }
         addChild(lb);
         this.gasTotal = new FLabel();
         with(this.gasTotal)
         {
            x = 154;
            y = 59;
            textColor = StaticValue.WHITE;
            text = "999999";
         }
         addChild(this.gasTotal);
         text1 = new FTextArea();
         with(text1)
         {
            x = 17;
            y = 84;
            width = 266;
            height = 60;
            wordWrap = true;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"温馨提示");
         }
         addChild(text1);
         this.okBtn = new SecondButton();
         addChild(this.okBtn);
         this.okBtn.label = LanResManager.getLanTextWords(this,"运功冲穴");
         this.okBtn.x = (width - this.okBtn.width) / 2;
         this.okBtn.y = 216;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onStart);
         lb = new FLabel();
         with(lb)
         {
            x = 94;
            y = 184;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"本次操作使用个经脉铜人");
         }
         addChild(lb);
         this.expandGas = new FTextArea();
         with(this.expandGas)
         {
            x = 92;
            y = 135;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"本次操作消耗真气");
         }
         addChild(this.expandGas);
         this.probability = new FLabel();
         with(this.probability)
         {
            x = 92;
            y = 155;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"本次操作成功几率");
         }
         addChild(this.probability);
         this.checkBox = new FCheckBox();
         addChild(this.checkBox);
         this.checkBox.x = 73;
         this.checkBox.y = 185;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.selectBtn = new FSimpleButton();
         this.selectBtn.skin = "bottomButton";
         addChild(this.selectBtn);
         this.selectBtn.x = 192;
         this.selectBtn.y = 185;
         this.selectBtn.enabled = false;
         this.selectBtn.addEventListener(MouseEvent.CLICK,this.onShowList);
         this.count = new FLabel();
         with(this.count)
         {
            x = 176;
            y = 185;
            textColor = StaticValue.WHITE;
            text = "1";
         }
         addChild(this.count);
         this.listContainer = new FCanvas();
         this.listContainer.skin = "backGroud";
         addChild(this.listContainer);
         this.listContainer.x = 172;
         this.listContainer.y = 202;
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
         this.itemContainer.y = 155;
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
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_VENATION_USE_ITEM_COUNT,"",0));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_VENATION_USE_ITEM_COUNT,"",parseInt(this.count.text)));
         }
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         this.count.text = this.countList.selectItem.label;
         this.listContainer.visible = false;
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_VENATION_USE_ITEM_COUNT,"",parseInt(this.countList.selectItem.label)));
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
         this.gas = param1;
         this.gasTotal.text = param1.toString();
      }
      
      public function setItem(param1:Goods) : void
      {
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         this.itemContainer.addChild(new ItemFace(param1));
         if(param1.count == 0)
         {
            this.itemContainer.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.itemContainer.filters = [];
         }
      }
      
      public function setExpandGas(param1:int) : void
      {
         this.expandGas.htmlText = LanResManager.getLanTextWords(this,"消耗真气本次操作") + "<font color=\'" + (param1 > this.gas ? StaticValue.RED_HTML : StaticValue.GREEN_HTML) + "\'>" + param1 + "</font>";
      }
      
      public function setProbability(param1:int) : void
      {
         this.probability.text = LanResManager.getLanTextWords(this,"成功几率本次操作成功几率") + param1 + "%";
      }
      
      public function reset() : void
      {
         this.count.text = "1";
         this.checkBox.selectState = false;
         this.selectBtn.enabled = false;
      }
   }
}

