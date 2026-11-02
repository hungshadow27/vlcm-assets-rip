package com.tgame.shell.view.components.chuanshuozhuangbeidazao
{
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.ChuanShuoZhuangBeiDaZaoPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ChengZhuangDaZaoPanel extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      private var setEquipBtn:SmallButton;
      
      private var expend:FTextArea;
      
      private var equipContainer:Sprite;
      
      private var itemContainer:Sprite;
      
      private var startBtn:SecondButton;
      
      public var $parent:DisplayObject;
      
      private var strengthenMaterial:Goods;
      
      public function ChengZhuangDaZaoPanel()
      {
         var img:Bitmap;
         var text1:FTextArea;
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.equip.innate.attribute.streng.ui";
         img = StaticValue.getBitmapByClassName("ui.chuanshuo.dazaocailiao");
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
            width = 235;
            height = 80;
            x = 70;
            y = 4;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"橙色装备打造提示请在左侧装备框放入要操作的装备请将传说装备打",[StaticValue.ORANGE_HTML,StaticValue.GREEN_HTML]) + "</textformat>";
         }
         addChild(text1);
         text1 = new FTextArea();
         with(text1)
         {
            autoSize = TextFieldAutoSize.LEFT;
            x = 70;
            y = 88;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"注意只有级以上紫色满星装备可用于打造橙装橙色装备打造成功率为",[StaticValue.ORANGE_HTML,StaticValue.RED_HTML,StaticValue.RED_HTML]) + "</textformat>";
         }
         addChild(text1);
         text1 = new FTextArea();
         with(text1)
         {
            autoSize = TextFieldAutoSize.LEFT;
            x = 27;
            y = 190;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"橙色装备打造成功后将随机获得一条传说属性",[StaticValue.ORANGE_HTML],false) + "</textformat>";
         }
         addChild(text1);
         this.expend = new FTextArea();
         with(this.expend)
         {
            x = 85;
            y = 230;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            mouseEnabled = false;
            filters = StaticValue.filter;
         }
         addChild(this.expend);
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 16;
         this.equipContainer.y = 42;
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.itemContainer.x = 15;
         this.itemContainer.y = 249;
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始打造");
         addChild(this.startBtn);
         this.startBtn.x = (325 - this.startBtn.width) / 2;
         this.startBtn.y = 309;
         this.startBtn.enabled = false;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onStart);
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_STARTBTN_CLICK));
      }
      
      private function onSetEquip(param1:MouseEvent) : void
      {
         if(this.setEquipBtn.label == LanResManager.getLanCommonTextWords("放入装备"))
         {
            this.$parent.dispatchEvent(new BaseEvent(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_SETEQUIPBTN_CLICK));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(ChuanShuoZhuangBeiDaZaoPanel.UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_GETEQUIPBTN_CLICK));
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
         this.setEquipBtn.label = LanResManager.getLanCommonTextWords("放入装备");
         return _loc1_;
      }
      
      public function setEnergyExpendItem(param1:Boolean = true, param2:Goods = null) : void
      {
         this.strengthenMaterial = param2;
         this.expend.htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"本次操作消耗材料本次操作成功几率",[StaticValue.WHITE_HTML,param2.res.name,StaticValue.WHITE_HTML,100]) + "</textformat>";
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
      }
      
      public function setExpendGasAndProbability(param1:int, param2:int, param3:Boolean, param4:int) : void
      {
      }
   }
}

