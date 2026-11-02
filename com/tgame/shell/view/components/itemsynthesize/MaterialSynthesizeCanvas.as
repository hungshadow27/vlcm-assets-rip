package com.tgame.shell.view.components.itemsynthesize
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
   import com.tgame.shell.view.components.ItemSynthesizePanel;
   import com.tgame.shell.view.components.equippudding.EquipStrengthenCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class MaterialSynthesizeCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      public var $parent:DisplayObject;
      
      private var expend:FTextArea;
      
      private var checkBox:FCheckBox;
      
      private var selectBtn:FSimpleButton;
      
      private var count:FLabel;
      
      private var countList:FList;
      
      private var listContainer:FCanvas;
      
      private var scroll:FVScorllBar;
      
      private var equip:Goods;
      
      private var setItemBtn:SmallButton;
      
      private var startBtn:SecondButton;
      
      public var piliangBtn:SecondButton;
      
      private var itemContainer:Sprite;
      
      private var materialContainer:Sprite;
      
      private var tempCount:int;
      
      private var luckMaterial:Goods;
      
      public function MaterialSynthesizeCanvas()
      {
         var img:Bitmap;
         var text1:FTextArea;
         var lb:FLabel;
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.equip.synthesize.ui";
         img = StaticValue.getBitmapByClassName("ui.equip.synthesize.ui.3");
         addChild(img);
         img.x = 76;
         img.y = 90;
         text1 = new FTextArea();
         with(text1)
         {
            width = 282;
            height = 80;
            x = 6;
            y = 4;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'0\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,102) + "</font></textformat>";
         }
         addChild(text1);
         text1 = new FTextArea();
         with(text1)
         {
            width = 215;
            height = 80;
            x = 72;
            y = 154;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'0\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,1) + "</font></textformat>";
         }
         addChild(text1);
         this.expend = new FTextArea();
         with(this.expend)
         {
            x = 73;
            y = 233;
            width = 188;
            height = 40;
            textColor = StaticValue.WHITE;
            mouseEnabled = false;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.expend);
         this.setItemBtn = new SmallButton();
         this.setItemBtn.label = LanResManager.getLanCommonTextWords("放入材料");
         addChild(this.setItemBtn);
         this.setItemBtn.x = 5;
         this.setItemBtn.y = 87;
         this.setItemBtn.addEventListener(MouseEvent.CLICK,this.onSetItem);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始合成");
         this.startBtn.enabled = false;
         addChild(this.startBtn);
         this.startBtn.x = (width - this.startBtn.width) / 2;
         this.startBtn.y = 311;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onStart);
         this.piliangBtn = new SecondButton();
         this.piliangBtn.label = LanResManager.getLanCommonTextWords("批量合成");
         addChild(this.piliangBtn);
         this.piliangBtn.x = this.startBtn.x + this.startBtn.width + 10;
         this.piliangBtn.y = 311;
         this.piliangBtn.enabled = false;
         this.piliangBtn.visible = false;
         this.piliangBtn.addEventListener(MouseEvent.CLICK,this.onPiliang);
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.itemContainer.x = 17;
         this.itemContainer.y = 113;
         this.materialContainer = new Sprite();
         addChild(this.materialContainer);
         this.materialContainer.x = 77;
         this.materialContainer.y = 113;
         lb = new FLabel();
         with(lb)
         {
            x = 93;
            y = 272;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本次操作使用个幸运晶");
         }
         addChild(lb);
         this.checkBox = new FCheckBox();
         addChild(this.checkBox);
         this.checkBox.x = 72;
         this.checkBox.y = 271;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.selectBtn = new FSimpleButton();
         this.selectBtn.skin = "bottomButton";
         addChild(this.selectBtn);
         this.selectBtn.x = 192;
         this.selectBtn.y = 271;
         this.selectBtn.enabled = false;
         this.selectBtn.addEventListener(MouseEvent.CLICK,this.onShowList);
         this.count = new FLabel();
         with(this.count)
         {
            x = 175;
            y = 271;
            textColor = StaticValue.WHITE;
            text = "1";
         }
         addChild(this.count);
         this.listContainer = new FCanvas();
         this.listContainer.skin = "backGroud";
         addChild(this.listContainer);
         this.listContainer.x = 172;
         this.listContainer.y = 290;
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
         if(this.itemContainer.numChildren == 0)
         {
            FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,2) + "</font>");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,2),false);
            this.checkBox.selectState = false;
            this.count.text = "1";
            return;
         }
         this.selectBtn.enabled = this.checkBox.selectState;
         if(!this.checkBox.selectState)
         {
            this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT,"",{
               "num":0,
               "isSetMaterial":false
            }));
            this.count.text = "1";
            this.listContainer.visible = false;
         }
         else if(Boolean(this.luckMaterial) && this.luckMaterial.count > 0)
         {
            this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT,"",{
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
            this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT,"",{
               "num":this.tempCount,
               "isSetMaterial":false
            }));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT,"",{
               "num":this.tempCount,
               "isSetMaterial":true
            }));
         }
      }
      
      private function onSetItem(param1:MouseEvent) : void
      {
         if(this.setItemBtn.label == LanResManager.getLanCommonTextWords("放入材料"))
         {
            this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_SETMATERIALBTN_CLICK));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_GETMATERIALBTN_CLICK));
         }
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_STARTBTN_CLICK));
      }
      
      private function onPiliang(param1:MouseEvent) : void
      {
         if(param1.currentTarget.label == LanResManager.getLanCommonTextWords("批量合成"))
         {
            this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_PILIANGHECHENG_CLICK,"",true));
         }
         else if(param1.currentTarget.label == LanResManager.getLanCommonTextWords("终止批量合成"))
         {
            this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_PILIANGHECHENG_CLICK,"",false));
         }
      }
      
      public function setItem(param1:Goods, param2:Goods) : void
      {
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         this.itemContainer.addChild(new ItemFace(param1));
         var _loc3_:ItemFace = new ItemFace(param2);
         this.itemContainer.addChild(_loc3_);
         _loc3_.y = 139;
         this.setItemBtn.label = LanResManager.getLanCommonTextWords("取回材料");
      }
      
      public function getItem() : Goods
      {
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         this.setItemBtn.label = LanResManager.getLanCommonTextWords("放入材料");
         if(this.luckMaterial)
         {
            this.luckMaterial.count = 0;
            this.setMaterial(null,null,null,this.luckMaterial);
         }
         return this.equip;
      }
      
      public function setMaterial(param1:Goods = null, param2:Goods = null, param3:Goods = null, param4:Goods = null, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : void
      {
         var _loc8_:ItemFace = null;
         this.luckMaterial = param4;
         while(this.materialContainer.numChildren > 0)
         {
            this.materialContainer.removeChildAt(0);
         }
         if(param1)
         {
            _loc8_ = new ItemFace(param1);
            this.materialContainer.addChild(_loc8_);
            _loc8_.x = 0;
            if(param1.count != 0)
            {
               _loc8_.filters = [];
               this.startBtn.enabled = true;
            }
            else
            {
               _loc8_.filters = Tools.blackWhiteFilter;
               this.startBtn.enabled = false;
            }
            if(param5)
            {
               _loc8_.filters = Tools.blackWhiteFilter;
            }
         }
         else
         {
            this.startBtn.enabled = false;
         }
         if(param2)
         {
            _loc8_ = new ItemFace(param2);
            this.materialContainer.addChild(_loc8_);
            _loc8_.x = 56;
            if(param2.count != 0)
            {
               _loc8_.filters = [];
            }
            else
            {
               _loc8_.filters = Tools.blackWhiteFilter;
            }
            if(param5)
            {
               _loc8_.filters = Tools.blackWhiteFilter;
            }
         }
         if(param3)
         {
            _loc8_ = new ItemFace(param3);
            this.materialContainer.addChild(_loc8_);
            _loc8_.x = 112;
            if(param3.count != 0)
            {
               _loc8_.filters = [];
            }
            else
            {
               _loc8_.filters = Tools.blackWhiteFilter;
            }
            if(param5)
            {
               _loc8_.filters = Tools.blackWhiteFilter;
            }
         }
         if(param4)
         {
            _loc8_ = new ItemFace(param4);
            this.materialContainer.addChild(_loc8_);
            _loc8_.x = 168;
            if(param4.count != 0)
            {
               _loc8_.filters = [];
               this.checkBox.enabled = true;
               this.setListCount(param4.count);
               if(this.tempCount > param4.count)
               {
                  this.count.text = "" + param4.count;
               }
               this.tempCount = this.checkBox.selectState ? int(this.count.text) : 0;
               this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT,"",{
                  "num":this.tempCount,
                  "isSetMaterial":false
               }));
            }
            else
            {
               _loc8_.filters = Tools.blackWhiteFilter;
               this.tempCount = 0;
               this.checkBox.selectState = false;
               this.checkBox.enabled = false;
               this.count.text = "1";
               this.listContainer.visible = false;
               this.selectBtn.enabled = false;
               this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT,"",{
                  "num":this.tempCount,
                  "isSetMaterial":false
               }));
            }
         }
      }
      
      public function setExpendGasAndProbability(param1:int, param2:int) : void
      {
         this.expend.htmlText = "<textformat>" + LanResManager.getLanTextWords(this,3) + param1 + "<br>" + LanResManager.getLanTextWords(this,4) + param2 + "%</textformat>";
      }
      
      public function reset() : void
      {
         this.count.text = "1";
      }
      
      public function setPiliangBtn(param1:int) : void
      {
         if(param1 == 1)
         {
            this.piliangBtn.enabled = false;
            this.piliangBtn.label = LanResManager.getLanCommonTextWords("批量合成");
         }
         else if(param1 == 2)
         {
            this.piliangBtn.enabled = true;
            this.piliangBtn.label = LanResManager.getLanCommonTextWords("批量合成");
         }
         else if(param1 == 3)
         {
            this.piliangBtn.enabled = true;
            this.piliangBtn.label = LanResManager.getLanCommonTextWords("终止批量合成");
         }
      }
   }
}

