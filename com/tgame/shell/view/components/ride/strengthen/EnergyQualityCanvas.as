package com.tgame.shell.view.components.ride.strengthen
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.RidePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class EnergyQualityCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      private var energyTip:FTextArea;
      
      private var energyValue:FTextArea;
      
      private var energyInterzone:FTextArea;
      
      private var energyExpend:FTextArea;
      
      private var checkBox:FCheckBox;
      
      private var selectBtn:FSimpleButton;
      
      private var count:FLabel;
      
      private var countList:FList;
      
      private var listContainer:FCanvas;
      
      private var scroll:FVScorllBar;
      
      private var startBtn:SecondButton;
      
      private var itemContainer:Sprite;
      
      private var itemContainer1:Sprite;
      
      public var $parent:DisplayObject;
      
      private var luckCount:int;
      
      public var sqzzdBtn:SecondButton;
      
      private var autoBtn:SecondButton;
      
      public function EnergyQualityCanvas()
      {
         var text1:FLabel;
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.ridefeed.ridestrengthen.particular.ui";
         this.sqzzdBtn = new SecondButton();
         this.sqzzdBtn.label = LanResManager.getLanCommonTextWords("使用神奇资质丹提升");
         addChild(this.sqzzdBtn);
         this.sqzzdBtn.x = 328 - this.sqzzdBtn.width;
         this.sqzzdBtn.y = 316;
         this.sqzzdBtn.visible = false;
         this.sqzzdBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         text1 = new FLabel();
         with(text1)
         {
            x = 10;
            y = 40;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("提升坐骑品级");
         }
         addChild(text1);
         this.energyTip = new FTextArea();
         with(this.energyTip)
         {
            x = 10;
            y = 55;
            width = 304;
            height = 64;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.energyTip);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始提升");
         addChild(this.startBtn);
         this.startBtn.x = width / 2 / 2 - this.startBtn.width / 2;
         this.startBtn.y = 224;
         this.startBtn.enabled = false;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onStartEnergy);
         this.autoBtn = new SecondButton();
         this.autoBtn.label = LanResManager.getLanCommonTextWords("自动提升");
         addChild(this.autoBtn);
         this.autoBtn.x = width / 2 + width / 2 / 2 - this.autoBtn.width / 2;
         this.autoBtn.y = 224;
         this.autoBtn.addEventListener(MouseEvent.CLICK,this.onStartEnergy);
         text1 = new FLabel();
         with(text1)
         {
            x = 10;
            y = 132 - 25 - 20;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"当前坐骑潜力值       提升成功后潜力值区间");
         }
         addChild(text1);
         this.energyValue = new FTextArea();
         with(this.energyValue)
         {
            x = 10;
            y = 156 - 25 - 10 - 20;
            width = 150;
            height = 80;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.energyValue);
         this.energyInterzone = new FTextArea();
         with(this.energyInterzone)
         {
            x = 155;
            y = 156 - 25 - 10 - 20;
            width = 150;
            height = 80;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.energyInterzone);
         this.energyExpend = new FTextArea();
         with(this.energyExpend)
         {
            x = 68;
            y = 266 - 25 - 50 - 20;
            width = 188;
            height = 40;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.energyExpend);
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.itemContainer.x = 18;
         this.itemContainer.y = 266 - 25 - 50 - 20;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_FEED_SHENQIZIZHIDAN_SHOW));
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
            this.$parent.dispatchEvent(new BaseEvent(RidePanel.RENEWENERGR_USE_ITEM_CONST,"",0));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(RidePanel.RENEWENERGR_USE_ITEM_CONST,"",int(this.count.text)));
         }
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         if(int(this.countList.selectItem.label) > this.luckCount)
         {
            this.count.text = this.luckCount.toString();
         }
         else
         {
            this.count.text = this.countList.selectItem.label;
         }
         this.listContainer.visible = false;
         this.$parent.dispatchEvent(new BaseEvent(RidePanel.RENEWENERGR_USE_ITEM_CONST,"",int(this.count.text)));
      }
      
      private function onStartEnergy(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.target)
         {
            case this.startBtn:
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.RENEWENERGY_START,"",0));
               break;
            case this.autoBtn:
               _loc2_ = 0;
               if(this.autoBtn.label == LanResManager.getLanCommonTextWords("自动提升"))
               {
                  _loc2_ = 1;
               }
               else
               {
                  _loc2_ = 2;
               }
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.RENEWENERGY_START,"",_loc2_));
         }
      }
      
      public function setEnergyTip(param1:String, param2:String) : void
      {
         this.energyTip.htmlText = "<textformat>" + LanResManager.getLanCommonTextWords("当前坐骑品级为：") + param1 + "     " + LanResManager.getLanCommonTextWords("可以选择提升到：") + param2 + "<br>" + LanResManager.getLanCommonTextWords("品级提升后，将大幅提高坐骑为您带来的属性加成") + "</textformat>";
      }
      
      public function setRideValue(param1:String, param2:String, param3:String, param4:String) : void
      {
         this.energyValue.htmlText = "<textformat>" + LanResManager.getLanCommonTextWords("攻击潜力") + LanResManager.getLanCommonTextWords("：") + param1 + "<br>" + LanResManager.getLanCommonTextWords("防御潜力") + LanResManager.getLanCommonTextWords("：") + param2 + "<br>" + LanResManager.getLanCommonTextWords("轻身潜力") + LanResManager.getLanCommonTextWords("：") + param3 + "<br>" + LanResManager.getLanCommonTextWords("健体潜力") + LanResManager.getLanCommonTextWords("：") + param4 + "</textformat>";
      }
      
      public function setAfterEnergyValueInterzone(param1:String, param2:String, param3:String, param4:String) : void
      {
         this.energyInterzone.htmlText = "<textformat>" + LanResManager.getLanCommonTextWords("攻击潜力") + LanResManager.getLanCommonTextWords("：") + param1 + "<br>" + LanResManager.getLanCommonTextWords("防御潜力") + LanResManager.getLanCommonTextWords("：") + param2 + "<br>" + LanResManager.getLanCommonTextWords("轻身潜力") + LanResManager.getLanCommonTextWords("：") + param3 + "<br>" + LanResManager.getLanCommonTextWords("健体潜力") + LanResManager.getLanCommonTextWords("：") + param4 + "</textformat>";
      }
      
      public function setEnergyExpendItem(param1:Goods = null, param2:Goods = null, param3:Boolean = false) : void
      {
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         var _loc4_:Bitmap = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc4_.x = -2;
         _loc4_.y = -2;
         this.itemContainer.addChild(_loc4_);
         this.itemContainer.addChild(new ItemFace(param1));
         if(!param3)
         {
            this.itemContainer.filters = Tools.blackWhiteFilter;
            this.startBtn.enabled = false;
            this.autoBtn.enabled = false;
         }
         else
         {
            this.itemContainer.filters = [];
            this.startBtn.enabled = true;
            this.autoBtn.enabled = true;
         }
      }
      
      public function setExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this.energyExpend.htmlText = "<textformat>" + LanResManager.getLanCommonTextWords("本次操作消耗铜钱") + LanResManager.getLanCommonTextWords("：") + param1 + "<br>" + LanResManager.getLanCommonTextWords("本次操作成功几率") + LanResManager.getLanCommonTextWords("：") + param2 + "%</textformat>";
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.autoBtn.label = LanResManager.getLanCommonTextWords("自动提升");
         }
         else
         {
            this.autoBtn.label = LanResManager.getLanCommonTextWords("停止提升");
         }
      }
      
      public function reBtnState() : Boolean
      {
         var _loc1_:Boolean = false;
         if(this.autoBtn.label == LanResManager.getLanCommonTextWords("停止提升"))
         {
            _loc1_ = true;
         }
         return _loc1_;
      }
   }
}

