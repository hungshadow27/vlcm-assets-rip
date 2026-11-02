package com.tgame.shell.view.components.equippudding
{
   import com.fireice.alert.FAlert;
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
   import com.tgame.manager.NoticeManager;
   import com.tgame.shell.view.components.EquipPuddingPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class StoneFuseCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      private var setEquipBtn:SmallButton;
      
      private var expend:FTextArea;
      
      private var checkBox:FCheckBox;
      
      private var selectBtn:FSimpleButton;
      
      private var count:FLabel;
      
      private var countList:FList;
      
      private var listContainer:FCanvas;
      
      private var scroll:FVScorllBar;
      
      private var equipContainer:Sprite;
      
      private var itemContainer:Sprite;
      
      private var itemContainer1:Sprite;
      
      private var startBtn:SecondButton;
      
      private var setStoneBtn:SmallButton;
      
      private var attributeBestrow:StoneAttributeBestrowPanel;
      
      public var $parent:DisplayObject;
      
      private var tempCount:int;
      
      private var luckMaterial:Goods;
      
      public function StoneFuseCanvas()
      {
         var text1:FTextArea;
         var lb:FLabel;
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.equip.stone.fuse.ui";
         this.setEquipBtn = new SmallButton();
         this.setEquipBtn.label = LanResManager.getLanCommonTextWords("放入装备");
         addChild(this.setEquipBtn);
         this.setEquipBtn.x = 6;
         this.setEquipBtn.y = 14;
         this.setEquipBtn.addEventListener(MouseEvent.CLICK,this.onSetEquip);
         text1 = new FTextArea();
         with(text1)
         {
            width = 232;
            height = 80;
            x = 70;
            y = 4;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"融合步骤说明",[StaticValue.ORANGE_HTML]) + LanResManager.getLanTextWords(this,"进行宝石融合",[StaticValue.GREEN_HTML]);
         }
         addChild(text1);
         text1 = new FTextArea();
         with(text1)
         {
            width = 232;
            height = 100;
            x = 70;
            y = 88;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"宝石融合",[StaticValue.ORANGE_HTML]) + LanResManager.getLanTextWords(this,"幸运晶",[StaticValue.GREEN_HTML]) + "</textformat>";
         }
         addChild(text1);
         text1 = new FTextArea();
         with(text1)
         {
            width = 255;
            height = 20;
            x = 32;
            y = 183;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"宝石融入装备") + "</font></textformat>";
         }
         addChild(text1);
         this.expend = new FTextArea();
         with(this.expend)
         {
            x = 115;
            y = 230;
            width = 188;
            height = 40;
            textColor = StaticValue.WHITE;
            mouseEnabled = false;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"本次操作消耗真气");
         }
         addChild(this.expend);
         lb = new FLabel();
         with(lb)
         {
            x = 138;
            y = 276;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(EquipStrengthenCanvas,"本次操作使用");
         }
         addChild(lb);
         this.checkBox = new FCheckBox();
         addChild(this.checkBox);
         this.checkBox.x = 119;
         this.checkBox.y = 275;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.selectBtn = new FSimpleButton();
         this.selectBtn.skin = "bottomButton";
         addChild(this.selectBtn);
         this.selectBtn.x = 232;
         this.selectBtn.y = 275;
         this.selectBtn.enabled = false;
         this.selectBtn.addEventListener(MouseEvent.CLICK,this.onShowList);
         this.count = new FLabel();
         with(this.count)
         {
            x = 217;
            y = 275;
            textColor = StaticValue.WHITE;
            text = "0";
         }
         addChild(this.count);
         this.listContainer = new FCanvas();
         this.listContainer.skin = "backGroud";
         addChild(this.listContainer);
         this.listContainer.x = 223;
         this.listContainer.y = 293;
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
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 16;
         this.equipContainer.y = 38;
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.itemContainer.x = 19;
         this.itemContainer.y = 235;
         this.itemContainer1 = new Sprite();
         addChild(this.itemContainer1);
         this.itemContainer1.x = 72;
         this.itemContainer1.y = 235;
         this.setStoneBtn = new SmallButton();
         this.setStoneBtn.label = LanResManager.getLanTextWords(this,"放入宝石");
         addChild(this.setStoneBtn);
         this.setStoneBtn.x = 8;
         this.setStoneBtn.y = 273;
         this.setStoneBtn.addEventListener(MouseEvent.CLICK,this.onSetStone);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanTextWords(this,"开始融合");
         addChild(this.startBtn);
         this.startBtn.x = (325 - this.startBtn.width) / 2;
         this.startBtn.y = 309;
         this.startBtn.enabled = false;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onStart);
      }
      
      private function onSetStone(param1:MouseEvent) : void
      {
         if(this.setStoneBtn.label == LanResManager.getLanTextWords(this,"放入宝石"))
         {
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_SETSTONE));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_GETSTONE));
         }
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
         if(this.equipContainer.numChildren == 0 || this.itemContainer.numChildren == 0)
         {
            this.checkBox.selectState = false;
            this.selectBtn.enabled = false;
            this.count.text = "1";
            FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"请先放入装备及宝石") + "</font>");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"请先放入装备及宝石"),false);
            return;
         }
         this.selectBtn.enabled = this.checkBox.selectState;
         if(!this.checkBox.selectState)
         {
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_USELUCKSTONE,"",{
               "num":0,
               "isSetMaterial":false
            }));
            this.count.text = "1";
            this.listContainer.visible = false;
         }
         else if(Boolean(this.luckMaterial) && this.luckMaterial.count > 0)
         {
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_USELUCKSTONE,"",{
               "num":1,
               "isSetMaterial":true
            }));
         }
         else
         {
            FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(EquipStrengthenCanvas,"没有幸运晶无法提升"));
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(EquipStrengthenCanvas,"没有幸运晶无法提升"),false);
            this.checkBox.selectState = false;
            this.selectBtn.enabled = false;
         }
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         this.count.text = this.countList.selectItem.label;
         this.listContainer.visible = false;
         this.tempCount = int(this.countList.selectItem.label);
         if(Boolean(this.luckMaterial) && this.luckMaterial.count < this.tempCount)
         {
            this.tempCount = this.luckMaterial.count;
            FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(EquipStrengthenCanvas,"抱歉背包只有") + this.tempCount + LanResManager.getLanTextWords(EquipStrengthenCanvas,"个幸运晶"));
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(EquipStrengthenCanvas,"抱歉背包只有") + this.tempCount + LanResManager.getLanTextWords(EquipStrengthenCanvas,"个幸运晶"),false);
            this.count.text = "" + this.tempCount;
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_USELUCKSTONE,"",{
               "num":this.tempCount,
               "isSetMaterial":false
            }));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_USELUCKSTONE,"",{
               "num":this.tempCount,
               "isSetMaterial":true
            }));
         }
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_STARTBTN_CLICK));
      }
      
      private function onSetEquip(param1:MouseEvent) : void
      {
         if(this.setEquipBtn.label == LanResManager.getLanCommonTextWords("放入装备"))
         {
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_SETEQUIPBTN_CLICK));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_GETEQUIPBTN_CLICK));
         }
      }
      
      public function setEnergyExpendItem(param1:Goods = null) : void
      {
         this.luckMaterial = param1;
         while(this.itemContainer1.numChildren > 0)
         {
            this.itemContainer1.removeChildAt(0);
         }
         this.itemContainer1.addChild(new ItemFace(param1));
         if(param1.count == 0)
         {
            this.itemContainer1.filters = Tools.blackWhiteFilter;
            this.tempCount = 0;
            this.checkBox.selectState = false;
            this.count.text = "1";
            this.listContainer.visible = false;
            this.selectBtn.enabled = false;
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_USELUCKSTONE,"",{
               "num":this.tempCount,
               "isSetMaterial":false
            }));
         }
         else
         {
            this.itemContainer1.filters = [];
            this.checkBox.enabled = true;
            if(this.tempCount > param1.count)
            {
               this.count.text = "" + param1.count;
            }
            this.tempCount = this.checkBox.selectState ? int(this.count.text) : 0;
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_USELUCKSTONE,"",{
               "num":this.tempCount,
               "isSetMaterial":false
            }));
         }
      }
      
      public function setStone(param1:Goods) : void
      {
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         this.itemContainer.addChild(new ItemFace(param1));
         this.startBtn.enabled = true;
         this.setStoneBtn.label = LanResManager.getLanTextWords(this,"取出宝石");
      }
      
      public function getStone() : Goods
      {
         var _loc1_:Goods = Goods((this.itemContainer.getChildAt(0) as ItemFace).getBaseItem());
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         this.setStoneBtn.label = LanResManager.getLanTextWords(this,"放入宝石");
         return _loc1_;
      }
      
      public function setEquip(param1:Goods) : void
      {
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.equipContainer.addChild(new ItemFace(param1));
         this.setEquipBtn.label = LanResManager.getLanCommonTextWords("取出装备");
      }
      
      public function getEquip() : Goods
      {
         var _loc1_:Goods = Goods((this.equipContainer.getChildAt(0) as ItemFace).getBaseItem());
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.luckMaterial.count = 0;
         this.setEnergyExpendItem(this.luckMaterial);
         this.setEquipBtn.label = LanResManager.getLanCommonTextWords("放入装备");
         return _loc1_;
      }
      
      public function setExpendGasAndProbability(param1:int, param2:int) : void
      {
         this.expend.htmlText = "<textformat>" + LanResManager.getLanTextWords(this,"操作消耗真气") + param1 + LanResManager.getLanTextWords(this,"操作成功几率") + param2 + "%</textformat>";
      }
      
      public function showStoneAttributeBestrow(param1:Array) : void
      {
         if(this.attributeBestrow == null)
         {
            this.attributeBestrow = new StoneAttributeBestrowPanel();
            this.attributeBestrow.$parent = this.$parent;
            this.attributeBestrow.x = (this.width - this.attributeBestrow.width) / 2;
            this.attributeBestrow.y = (this.height - this.attributeBestrow.height) / 2;
         }
         if(this.attributeBestrow.parent != null)
         {
            return;
         }
         this.attributeBestrow.visible = true;
         addChild(this.attributeBestrow);
         this.attributeBestrow.setStones(param1);
      }
      
      public function reset() : void
      {
         this.count.text = "1";
      }
   }
}

