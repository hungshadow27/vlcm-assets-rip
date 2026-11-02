package com.tgame.shell.view.components.ride.strengthen
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
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
   
   public class EnergyRecoveryCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      private var energyTip:FTextArea;
      
      private var energyValue:FTextArea;
      
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
      
      public function EnergyRecoveryCanvas()
      {
         var text1:FLabel;
         var inputBg:F9GridBitmap;
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
            text = LanResManager.getLanCommonTextWords("提升防御潜力");
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
         text1 = new FLabel();
         with(text1)
         {
            x = 10;
            y = 100;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("提升效果预览");
         }
         addChild(text1);
         this.energyValue = new FTextArea();
         with(this.energyValue)
         {
            x = 10;
            y = 118;
            width = 235;
            height = 80;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.energyValue);
         text1 = new FLabel();
         with(text1)
         {
            x = 10;
            y = 213;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("坐骑等级越高，则加成的效果将会越发明显");
         }
         addChild(text1);
         this.energyExpend = new FTextArea();
         with(this.energyExpend)
         {
            x = 130;
            y = 170;
            width = 188;
            height = 40;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.energyExpend);
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
         this.checkBox = new FCheckBox();
         addChild(this.checkBox);
         this.checkBox.x = 120;
         this.checkBox.y = 200;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onCheck);
         inputBg = Tools.get9GridBitmpByName("inputBg");
         addChild(inputBg);
         inputBg.width = 42;
         inputBg.x = 214;
         inputBg.y = 200;
         text1 = new FLabel();
         with(text1)
         {
            x = 140;
            y = 200;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本次操作使用        个幸运晶");
         }
         addChild(text1);
         this.selectBtn = new FSimpleButton();
         this.selectBtn.skin = "bottomButton";
         addChild(this.selectBtn);
         this.selectBtn.x = 238;
         this.selectBtn.y = 205 - 3;
         this.selectBtn.enabled = false;
         this.selectBtn.addEventListener(MouseEvent.CLICK,this.onShowList);
         this.count = new FLabel();
         with(this.count)
         {
            x = 222;
            y = 205;
            textColor = StaticValue.WHITE;
            text = "1";
         }
         addChild(this.count);
         this.listContainer = new FCanvas();
         this.listContainer.skin = "backGroud";
         addChild(this.listContainer);
         this.listContainer.x = 218;
         this.listContainer.y = 224;
         this.listContainer.visible = false;
         this.countList = new FList();
         this.countList.listWidth = 16;
         this.countList.x = 3;
         this.countList.y = 2;
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
         this.itemContainer.x = 18;
         this.itemContainer.y = 184;
         this.itemContainer1 = new Sprite();
         addChild(this.itemContainer1);
         this.itemContainer1.x = 72;
         this.itemContainer1.y = 184;
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
         this.count.text = this.countList.selectItem.label;
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
         this.energyTip.htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"提升提示",[param1,param2],false) + "</textformat>";
      }
      
      public function setRideValue(param1:String, param2:String) : void
      {
         this.energyValue.htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("当前为您加成防御力：") + param1 + "<br>" + LanResManager.getLanCommonTextWords("提升到最大后将加成：") + param2 + "</textformat>";
      }
      
      public function setEnergyExpendItem(param1:Goods = null, param2:Goods = null, param3:Boolean = false) : void
      {
         var _loc4_:Bitmap = null;
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         while(this.itemContainer1.numChildren > 0)
         {
            this.itemContainer1.removeChildAt(0);
         }
         _loc4_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc4_.x = -2;
         _loc4_.y = -2;
         this.itemContainer.addChild(_loc4_);
         _loc4_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc4_.x = -2;
         _loc4_.y = -2;
         this.itemContainer1.addChild(_loc4_);
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
         var _loc5_:ItemFace = new ItemFace(param2);
         _loc5_.setShowCount(false);
         this.itemContainer1.addChild(_loc5_);
         this.luckCount = param2.count;
         if(param2.count < int(this.count.text))
         {
            this.itemContainer1.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.itemContainer1.filters = [];
            this.checkBox.enabled = true;
            this.selectBtn.enabled = this.checkBox.selectState;
         }
         if(!this.checkBox.selectState)
         {
            this.$parent.dispatchEvent(new BaseEvent(RidePanel.RENEWENERGR_USE_ITEM_CONST,"",0));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(RidePanel.RENEWENERGR_USE_ITEM_CONST,"",int(this.count.text)));
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

