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
   import com.tgame.common.GameInstance;
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
   import flash.text.*;
   
   public class ResetStrengthenLevelCanvas extends Sprite
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
      
      public var $parent:DisplayObject;
      
      private var tempCount:int;
      
      private var luckMaterial:Goods;
      
      private var strengthenMaterial:Goods;
      
      private var helpBtn:FSimpleButton;
      
      public function ResetStrengthenLevelCanvas()
      {
         var img:Bitmap;
         var text1:FTextArea;
         var lb:FLabel;
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.equip.pudding.ui";
         img = StaticValue.getBitmapByClassName("ui.equip.pudding.ui.2");
         addChild(img);
         img.x = 8;
         img.y = 225;
         this.setEquipBtn = new SmallButton();
         this.setEquipBtn.label = LanResManager.getLanCommonTextWords("放入装备");
         addChild(this.setEquipBtn);
         this.setEquipBtn.x = 3;
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
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"强化等级重置步骤说明",[StaticValue.ORANGE_HTML]) + LanResManager.getLanTextWords(this,"洗炼石开始强化1",[StaticValue.GREEN_HTML]) + "</textformat>";
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
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"洗成天生极品",[StaticValue.ORANGE_HTML]) + LanResManager.getLanTextWords(this,"降低装备的破碎",[StaticValue.GREEN_HTML]);
         }
         addChild(text1);
         text1 = new FTextArea();
         with(text1)
         {
            width = 300;
            height = 20;
            x = 32;
            y = 195;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'0\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"强化等级清零") + "</font></textformat>";
         }
         addChild(text1);
         this.expend = new FTextArea();
         with(this.expend)
         {
            x = 113;
            y = 220;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            mouseEnabled = false;
            filters = StaticValue.filter;
         }
         addChild(this.expend);
         lb = new FLabel();
         with(lb)
         {
            x = 133;
            y = 274;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(EquipStrengthenCanvas,5);
         }
         addChild(lb);
         this.checkBox = new FCheckBox();
         addChild(this.checkBox);
         this.checkBox.x = 114;
         this.checkBox.y = 273;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.selectBtn = new FSimpleButton();
         this.selectBtn.skin = "bottomButton";
         addChild(this.selectBtn);
         this.selectBtn.x = 227;
         this.selectBtn.y = 273;
         this.selectBtn.enabled = false;
         this.selectBtn.addEventListener(MouseEvent.CLICK,this.onShowList);
         this.count = new FLabel();
         with(this.count)
         {
            x = 212;
            y = 273;
            textColor = StaticValue.WHITE;
            text = "0";
         }
         addChild(this.count);
         this.listContainer = new FCanvas();
         this.listContainer.skin = "backGroud";
         addChild(this.listContainer);
         this.listContainer.x = 208;
         this.listContainer.y = 291;
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
         this.equipContainer.y = 42;
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.itemContainer.x = 16;
         this.itemContainer.y = 250;
         this.itemContainer1 = new Sprite();
         addChild(this.itemContainer1);
         this.itemContainer1.x = 69;
         this.itemContainer1.y = 250;
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanTextWords(ResetAppendAttributeCanvas,"开始重置");
         addChild(this.startBtn);
         this.startBtn.x = (325 - this.startBtn.width) / 2;
         this.startBtn.y = 309;
         this.startBtn.enabled = false;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onStart);
         this.helpBtn = new FSimpleButton();
         this.helpBtn.skin = "helpBtn";
         addChild(this.helpBtn);
         this.helpBtn.x = 20;
         this.helpBtn.y = 309;
         this.helpBtn.addEventListener(MouseEvent.CLICK,this.showHelp);
         this.helpBtn.visible = false;
      }
      
      private function showHelp(param1:MouseEvent) : void
      {
         if(HelpManager.getVisable(HelpManager.UI_HELP_TYPE_EQUIP_QIANGHUA_RESET))
         {
            HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_QIANGHUA_RESET);
         }
         else
         {
            HelpManager.showHelp(this.$parent,HelpManager.UI_HELP_TYPE_EQUIP_QIANGHUA_RESET);
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
         if(this.equipContainer.numChildren == 0)
         {
            this.checkBox.selectState = false;
            this.selectBtn.enabled = false;
            this.count.text = "1";
            FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(EquipStrengthenCanvas,"请先放入装备") + "</font>");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(EquipStrengthenCanvas,"请先放入装备"),false);
            return;
         }
         this.selectBtn.enabled = this.checkBox.selectState;
         if(!this.checkBox.selectState)
         {
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_USELUCKSTONE,"",{
               "num":0,
               "isSetMaterial":false
            }));
            this.count.text = "1";
            this.listContainer.visible = false;
         }
         else if(Boolean(this.luckMaterial) && this.luckMaterial.count > 0)
         {
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_USELUCKSTONE,"",{
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
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_USELUCKSTONE,"",{
               "num":this.tempCount,
               "isSetMaterial":false
            }));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_USELUCKSTONE,"",{
               "num":this.tempCount,
               "isSetMaterial":true
            }));
         }
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_STARTBTN_CLICK));
      }
      
      private function onSetEquip(param1:MouseEvent) : void
      {
         if(this.setEquipBtn.label == LanResManager.getLanCommonTextWords("放入装备"))
         {
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_SETEQUIPBTN_CLICK));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_GETEQUIPBTN_CLICK));
         }
      }
      
      public function setEnergyExpendItem(param1:Boolean = true, param2:Goods = null, param3:Goods = null) : void
      {
         this.luckMaterial = param3;
         this.strengthenMaterial = param2;
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         this.itemContainer.addChild(new ItemFace(param2));
         if(!param1)
         {
            this.itemContainer.filters = [];
            this.startBtn.enabled = true;
         }
         else
         {
            this.startBtn.enabled = false;
            this.itemContainer.filters = Tools.blackWhiteFilter;
         }
         while(this.itemContainer1.numChildren > 0)
         {
            this.itemContainer1.removeChildAt(0);
         }
         this.itemContainer1.addChild(new ItemFace(param3));
         if(param3.count == 0)
         {
            this.itemContainer1.filters = Tools.blackWhiteFilter;
            this.tempCount = 0;
            this.checkBox.selectState = false;
            this.count.text = "1";
            this.listContainer.visible = false;
            this.selectBtn.enabled = false;
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_USELUCKSTONE,"",{
               "num":this.tempCount,
               "isSetMaterial":false
            }));
         }
         else
         {
            this.itemContainer1.filters = [];
            this.checkBox.enabled = true;
            if(this.tempCount > param3.count)
            {
               this.count.text = "" + param3.count;
            }
            this.tempCount = this.checkBox.selectState ? int(this.count.text) : 0;
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_USELUCKSTONE,"",{
               "num":this.tempCount,
               "isSetMaterial":false
            }));
         }
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
         if(this.equipContainer.numChildren == 0)
         {
            return null;
         }
         var _loc1_:Goods = Goods((this.equipContainer.getChildAt(0) as ItemFace).getBaseItem());
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.strengthenMaterial.count = 0;
         this.luckMaterial.count = 0;
         this.setEnergyExpendItem(true,this.strengthenMaterial,this.luckMaterial);
         this.setEquipBtn.label = LanResManager.getLanCommonTextWords("放入装备");
         return _loc1_;
      }
      
      public function setExpendGasAndProbability(param1:int, param2:String, param3:int) : void
      {
         this.expend.htmlText = "<textformat>" + LanResManager.getLanTextWords(EquipStrengthenCanvas,"本次操作消耗铜钱") + "：<font color=\'" + (GameInstance.mainCharData.moneyInfo.copper < param1 ? StaticValue.RED_HTML : StaticValue.GREEN_HTML) + "\'>" + param1 + "</font><br>" + LanResManager.getLanTextWords(EquipStrengthenCanvas,"本次操作消耗材料") + "：" + param2 + "<br>" + LanResManager.getLanTextWords(EquipStrengthenCanvas,"本次操作成功几率") + "：" + param3 + "%</textformat>";
      }
      
      public function reset() : void
      {
         this.count.text = "1";
      }
   }
}

