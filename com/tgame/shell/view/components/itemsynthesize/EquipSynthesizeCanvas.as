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
   import com.tgame.common.GameInstance;
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
   import flash.text.*;
   
   public class EquipSynthesizeCanvas extends Sprite
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
      
      private var check1:FCheckBox;
      
      private var check2:FCheckBox;
      
      private var setItemBtn:SmallButton;
      
      private var startBtn:SecondButton;
      
      private var equip:Goods;
      
      private var itemContainer:Sprite;
      
      private var materialContainer:Sprite;
      
      private var tempCount:int;
      
      private var luckMaterial:Goods;
      
      private var zhenHunFu:Goods;
      
      private var zhenXingFu:Goods;
      
      private var shengJieShi:Goods;
      
      private var helpBtn:FSimpleButton;
      
      public function EquipSynthesizeCanvas()
      {
         var text1:FTextArea;
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.equip.synthesize.synthesize.ui";
         text1 = new FTextArea();
         with(text1)
         {
            width = 282;
            height = 60;
            x = 6;
            y = 4;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'0\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,104) + "</font></textformat>";
         }
         addChild(text1);
         this.check1 = new FCheckBox();
         this.check1.textColor = StaticValue.WHITE;
         this.check1.border = true;
         this.check1.text = LanResManager.getLanTextWords(this,1);
         addChild(this.check1);
         this.check1.x = 78;
         this.check1.y = 252;
         this.check1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.check2 = new FCheckBox();
         this.check2.textColor = StaticValue.WHITE;
         this.check2.border = true;
         this.check2.text = LanResManager.getLanTextWords(this,2);
         addChild(this.check2);
         this.check2.x = 78;
         this.check2.y = 273;
         this.check2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         text1 = new FTextArea();
         with(text1)
         {
            width = 215;
            height = 80;
            x = 72;
            y = 143;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,3,[StaticValue.ORANGE_HTML]) + "</textformat>";
         }
         addChild(text1);
         this.expend = new FTextArea();
         with(this.expend)
         {
            x = 73;
            y = 202;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            mouseEnabled = false;
            filters = StaticValue.filter;
         }
         addChild(this.expend);
         this.setItemBtn = new SmallButton();
         this.setItemBtn.label = LanResManager.getLanCommonTextWords("放入装备");
         addChild(this.setItemBtn);
         this.setItemBtn.x = 5;
         this.setItemBtn.y = 78;
         this.setItemBtn.addEventListener(MouseEvent.CLICK,this.onSetItem);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始合成");
         this.startBtn.enabled = false;
         addChild(this.startBtn);
         this.startBtn.x = (width - this.startBtn.width) / 2;
         this.startBtn.y = 311;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onStart);
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.itemContainer.x = 18;
         this.itemContainer.y = 105;
         this.materialContainer = new Sprite();
         addChild(this.materialContainer);
         this.materialContainer.x = 82;
         this.materialContainer.y = 100;
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
         if(HelpManager.getVisable(HelpManager.UI_HELP_TYPE_EQUIP_HECHENG))
         {
            HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_HECHENG);
         }
         else
         {
            HelpManager.showHelp(this.$parent,HelpManager.UI_HELP_TYPE_EQUIP_HECHENG);
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
         if(this.itemContainer.numChildren == 0)
         {
            FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,4) + "</font>");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,4),false);
            this.checkBox.selectState = false;
            this.count.text = "1";
            return;
         }
         this.selectBtn.enabled = this.checkBox.selectState;
         if(!this.checkBox.selectState)
         {
            this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_LUCKSTONE_COUNT,"",{
               "num":0,
               "isSetMaterial":false
            }));
            this.count.text = "1";
            this.listContainer.visible = false;
         }
         else if(Boolean(this.luckMaterial) && this.luckMaterial.count > 0)
         {
            this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_LUCKSTONE_COUNT,"",{
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
            this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_LUCKSTONE_COUNT,"",{
               "num":this.tempCount,
               "isSetMaterial":false
            }));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_LUCKSTONE_COUNT,"",{
               "num":this.tempCount,
               "isSetMaterial":true
            }));
         }
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         var _loc2_:BaseEvent = null;
         if(this.itemContainer.numChildren == 0)
         {
            this.check1.selectState = false;
            this.check2.selectState = false;
            FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,4) + "</font>");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,4),false);
            return;
         }
         switch(param1.currentTarget)
         {
            case this.check1:
               if(this.zhenXingFu.count != 0)
               {
                  if(this.check1.selectState)
                  {
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,5),false);
                     FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,5) + "</font>");
                  }
                  _loc2_ = new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_ZHENXINGFU,"",this.check1.selectState);
                  break;
               }
               FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,6) + "</font>");
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,6),false);
               this.check1.selectState = false;
               return;
               break;
            case this.check2:
               if(this.zhenHunFu.count != 0)
               {
                  if(this.check2.selectState)
                  {
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,7),false);
                     FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,7) + "</font>");
                  }
                  _loc2_ = new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_ZHENHUNFU,"",this.check2.selectState);
                  break;
               }
               FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,8) + "</font>");
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,8),false);
               this.check2.selectState = false;
               return;
         }
         this.$parent.dispatchEvent(_loc2_);
      }
      
      private function onSetItem(param1:MouseEvent) : void
      {
         if(this.setItemBtn.label == LanResManager.getLanCommonTextWords("放入装备"))
         {
            this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SETEQUIPBTN_CLICK));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_GETEQUIPBTN_CLICK));
         }
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_STARTBTN_CLICK));
      }
      
      public function setItem(param1:Goods, param2:Goods) : void
      {
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         this.equip = param1;
         this.itemContainer.addChild(new ItemFace(param1));
         var _loc3_:ItemFace = new ItemFace(param2);
         this.itemContainer.addChild(_loc3_);
         _loc3_.y = 143;
         this.setItemBtn.label = LanResManager.getLanCommonTextWords("取出装备");
      }
      
      public function getItem() : Goods
      {
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         this.setItemBtn.label = LanResManager.getLanCommonTextWords("放入装备");
         this.luckMaterial.count = 0;
         this.shengJieShi.count = 0;
         this.zhenXingFu.count = 0;
         this.zhenHunFu.count = 0;
         this.setMaterial(true,this.shengJieShi,this.zhenXingFu,this.zhenHunFu,this.luckMaterial);
         return this.equip;
      }
      
      public function setMaterial(param1:Boolean = true, param2:Goods = null, param3:Goods = null, param4:Goods = null, param5:Goods = null) : void
      {
         var _loc6_:ItemFace = null;
         this.luckMaterial = param5;
         this.zhenHunFu = param4;
         this.zhenXingFu = param3;
         this.shengJieShi = param2;
         while(this.materialContainer.numChildren > 0)
         {
            this.materialContainer.removeChildAt(0);
         }
         _loc6_ = new ItemFace(param2);
         this.materialContainer.addChild(_loc6_);
         _loc6_.x = 0;
         if(!param1)
         {
            _loc6_.filters = [];
            this.startBtn.enabled = true;
         }
         else
         {
            _loc6_.filters = Tools.blackWhiteFilter;
            this.startBtn.enabled = false;
         }
         _loc6_ = new ItemFace(param3);
         this.materialContainer.addChild(_loc6_);
         _loc6_.x = 57;
         if(param3.count != 0)
         {
            _loc6_.filters = [];
            this.check1.enabled = true;
         }
         else
         {
            _loc6_.filters = Tools.blackWhiteFilter;
            if(this.check1.selectState)
            {
               this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_ZHENXINGFU,"",false));
            }
            this.check1.selectState = false;
         }
         _loc6_ = new ItemFace(param4);
         this.materialContainer.addChild(_loc6_);
         _loc6_.x = 114;
         if(param4.count != 0)
         {
            _loc6_.filters = [];
            this.check2.enabled = true;
         }
         else
         {
            if(this.check2.selectState)
            {
               this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_ZHENHUNFU,"",false));
            }
            this.check2.selectState = false;
            _loc6_.filters = Tools.blackWhiteFilter;
         }
      }
      
      public function setExpendGasAndProbability(param1:int, param2:String, param3:int) : void
      {
         this.expend.htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(EquipStrengthenCanvas,"本次操作消耗铜钱") + "：<font color=\'" + (GameInstance.mainCharData.moneyInfo.copper < param1 ? StaticValue.RED_HTML : StaticValue.GREEN_HTML) + "\'>" + param1 + "</font><br>" + LanResManager.getLanTextWords(EquipStrengthenCanvas,"本次操作消耗材料") + "：" + param2 + "<br>" + LanResManager.getLanTextWords(EquipStrengthenCanvas,"本次操作成功几率") + "：" + param3 + "%</textformat>";
      }
      
      public function reset() : void
      {
         this.check1.selectState = false;
         this.check2.selectState = false;
      }
   }
}

