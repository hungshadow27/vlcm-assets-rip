package com.tgame.shell.view.components.equippuddingTwo
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.EquipPuddingTwoPanel;
   import com.tgame.shell.view.components.equippudding.EquipStrengthenCanvas;
   import com.zcp.common.cd.IItemFace;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.CDFaceManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class EquipZanWenKeHuaCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var bg:Bitmap;
      
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
      
      private var helpBtn:SecondButton;
      
      private var tempCount:int;
      
      private var luckMaterial:Goods;
      
      private var strengthenMaterial:Goods;
      
      private var helpCanvas:Sprite;
      
      private var help:DisplayObject;
      
      private var closeBtn:FSimpleButton;
      
      private var helpBtn1:FSimpleButton;
      
      private var buffSpr:Sprite;
      
      public function EquipZanWenKeHuaCanvas()
      {
         var text1:FTextArea;
         var lb:FLabel;
         super();
         this.bg = new Bitmap();
         this.bg.name = "ui.equip.pudding.zanwen.ui";
         addChild(this.bg);
         this.setEquipBtn = new SmallButton();
         this.setEquipBtn.label = LanResManager.getLanCommonTextWords("放入装备");
         addChild(this.setEquipBtn);
         this.setEquipBtn.x = 3;
         this.setEquipBtn.y = 14;
         this.setEquipBtn.addEventListener(MouseEvent.CLICK,this.onSetEquip);
         text1 = new FTextArea();
         with(text1)
         {
            x = 70;
            y = 7;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"战纹刻画步骤",[StaticValue.ORANGE_HTML]) + LanResManager.getLanTextWords(this,"开始刻画战纹1",[StaticValue.GREEN_HTML]) + "</textformat>";
         }
         addChild(text1);
         text1 = new FTextArea();
         with(text1)
         {
            x = 70;
            y = 77;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"战纹刻画失败",[StaticValue.RED_HTML]) + LanResManager.getLanTextWords(this,"战纹刻画成功",[StaticValue.GREEN_HTML]) + LanResManager.getLanTextWords(this,"成功装备绑定",[StaticValue.RED_HTML]) + "</textformat>";
         }
         addChild(text1);
         text1 = new FTextArea();
         with(text1)
         {
            width = 300;
            height = 20;
            x = 0;
            y = 195;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'0\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"异常强大的图腾战纹") + "</font></textformat>";
         }
         addChild(text1);
         this.expend = new FTextArea();
         with(this.expend)
         {
            x = 115;
            y = 224;
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
            text = LanResManager.getLanTextWords(this,"是否使用镇魂符");
         }
         addChild(lb);
         this.checkBox = new FCheckBox();
         addChild(this.checkBox);
         this.checkBox.x = 114;
         this.checkBox.y = 273;
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
         this.startBtn.label = LanResManager.getLanTextWords(this,"开始纹刻");
         addChild(this.startBtn);
         this.startBtn.x = 50;
         this.startBtn.y = 309;
         this.startBtn.enabled = true;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onStart);
         this.helpBtn = new SecondButton();
         this.helpBtn.label = LanResManager.getLanTextWords(this,"战纹图解");
         this.helpBtn.x = width - 50 - this.helpBtn.width;
         this.helpBtn.y = 309;
         addChild(this.helpBtn);
         this.helpBtn.addEventListener(MouseEvent.CLICK,this.showHelp);
         this.helpBtn1 = new FSimpleButton();
         this.helpBtn1.skin = "helpBtn";
         this.helpBtn1.x = 15;
         this.helpBtn1.y = 309;
         this.helpBtn1.addEventListener(MouseEvent.CLICK,this.showHelp1);
         this.buffSpr = new Sprite();
         this.buffSpr.x = 266;
         this.buffSpr.y = 259;
         addChild(this.buffSpr);
      }
      
      private function showHelp1(param1:MouseEvent) : void
      {
         if(HelpManager.getVisable(HelpManager.UI_HELP_TYPE_EQUIP_ZANWEN))
         {
            HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_ZANWEN);
         }
         else
         {
            HelpManager.showHelp(this.$parent,HelpManager.UI_HELP_TYPE_EQUIP_ZANWEN);
         }
      }
      
      private function showHelp(param1:MouseEvent) : void
      {
         if(!this.helpCanvas)
         {
            this.helpCanvas = new Sprite();
            addChild(this.helpCanvas);
            this.helpCanvas.x = 320;
            this.helpCanvas.y = -55;
            this.help = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/zanwenHelp.png",309,397);
            this.helpCanvas.addChild(this.help);
            this.closeBtn = new FSimpleButton();
            this.closeBtn.skin = "closeButton";
            this.helpCanvas.addChild(this.closeBtn);
            this.closeBtn.x = 309 - this.closeBtn.width - 2;
            this.closeBtn.y = 2;
            this.closeBtn.addEventListener(MouseEvent.CLICK,this.closeHelp);
         }
         else
         {
            this.helpCanvas.visible = !this.helpCanvas.visible;
         }
      }
      
      private function closeHelp(param1:MouseEvent) : void
      {
         this.helpCanvas.visible = false;
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_USELUCKSTONE,"",this.checkBox.selectState));
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_STARTBTN_CLICK,"",this.checkBox.selectState));
      }
      
      private function onSetEquip(param1:MouseEvent) : void
      {
         if(this.setEquipBtn.label == LanResManager.getLanCommonTextWords("放入装备"))
         {
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_SETEQUIPBTN_CLICK));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_GETEQUIPBTN_CLICK));
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
            this.checkBox.enabled = true;
         }
         else
         {
            this.itemContainer1.filters = [];
            this.checkBox.enabled = true;
         }
         this.checkBox.selectState = true;
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
         this.expend.htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(EquipStrengthenCanvas,"本次操作消耗铜钱") + "：<font color=\'" + (GameInstance.mainCharData.moneyInfo.copper < param1 ? StaticValue.RED_HTML : StaticValue.GREEN_HTML) + "\'>" + param1 + "</font><br>" + LanResManager.getLanTextWords(EquipStrengthenCanvas,"本次操作消耗材料") + "：" + param2 + "<br>" + LanResManager.getLanTextWords(EquipStrengthenCanvas,"本次操作成功几率") + "：" + param3 + "%</textformat>";
      }
      
      public function reset() : void
      {
      }
      
      public function setBuff(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:Bitmap = null;
         while(this.buffSpr.numChildren > 0)
         {
            CDFaceManager.removeItemFace(this.buffSpr.removeChildAt(0) as IItemFace);
         }
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.buffSpr.addChild(_loc3_);
            _loc3_.x = -(_loc4_ * 40) - 2;
            _loc3_.y = -2;
            _loc2_ = new ItemFace(param1[_loc4_]);
            _loc2_.x = -(_loc4_ * 40);
            this.buffSpr.addChild(_loc2_);
            CDFaceManager.registerItemFace(_loc2_);
            _loc4_++;
         }
      }
   }
}

