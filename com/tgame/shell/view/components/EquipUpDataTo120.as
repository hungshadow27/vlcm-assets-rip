package com.tgame.shell.view.components
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class EquipUpDataTo120 extends FPanel
   {
      
      public static const UI_EQUIP_UPDATA_TO_120_UPBTN_CLICK:String = "UI_EQUIP_UPDATA_TO_120_UPBTN_CLICK";
      
      private var checkBox1:FCheckBox;
      
      private var checkBox2:FCheckBox;
      
      private var selectGoods:Goods;
      
      private var equip:Goods;
      
      private var nextEquip:Goods;
      
      private var upDataItem1:Goods;
      
      private var upDataItem2:Goods;
      
      private var startBtn:SecondButton;
      
      private var myCloseBtn:SecondButton;
      
      private var menuContainer1:FCanvas;
      
      private var menuContainer2:FCanvas;
      
      private var djBit1:Bitmap;
      
      private var djBit2:Bitmap;
      
      private var djBit3:Bitmap;
      
      private var djBit4:Bitmap;
      
      private var equipContainer:Sprite;
      
      private var nextEquipContainer:Sprite;
      
      private var upDataItem1Container:Sprite;
      
      private var upDataItem2Container:Sprite;
      
      private var upText1:FTextArea;
      
      private var upText2:FTextArea;
      
      private var upText3:FTextArea;
      
      private var upText4:FTextArea;
      
      public function EquipUpDataTo120()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 325;
         height = 356;
         this.titleText = LanResManager.getLanCommonTextWords("快速升阶");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.menuContainer1 = new FCanvas();
         this.menuContainer1.skin = "box_transparence";
         addChild(this.menuContainer1);
         this.menuContainer1.width = 305;
         this.menuContainer1.height = 90;
         this.menuContainer1.x = 10;
         this.menuContainer1.y = 0;
         this.menuContainer2 = new FCanvas();
         this.menuContainer2.skin = "backGroud";
         addChild(this.menuContainer2);
         this.menuContainer2.width = 305;
         this.menuContainer2.height = 110;
         this.menuContainer2.x = 10;
         this.menuContainer2.y = 91;
         this.upText2 = new FTextArea();
         this.upText2.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("将装备由级快速提升至级。") + "<br></font><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用") + "</font><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("上古玄铁") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以提升装备进阶度。") + "<br>" + LanResManager.getLanCommonTextWords("当进阶度为时，装备由原先的级提升至级。") + "<br></font><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当装备进度时") + "，" + LanResManager.getLanCommonTextWords("使用活动道具") + "</font><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("神锻玄铁") + "</font><font color=\'" + StaticValue.YELLOW_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("可以以极为优惠的价格直接提升至级") + "</textformat>";
         this.upText2.x = 10;
         this.upText2.y = 5;
         this.upText2.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.upText2);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.startBtn);
         this.startBtn.x = 70;
         this.startBtn.y = 290;
         this.startBtn.enabled = false;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onStart);
         this.myCloseBtn = new SecondButton();
         this.myCloseBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.myCloseBtn);
         this.myCloseBtn.x = 210;
         this.myCloseBtn.y = 290;
         this.myCloseBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.upText1 = new FTextArea();
         this.upText1.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("原始装备：");
         this.upText1.x = 50;
         this.upText1.y = 100;
         this.upText1.width = 200;
         addChild(this.upText1);
         this.upText2 = new FTextArea();
         this.upText2.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("阶段进度：");
         this.upText2.x = 50;
         this.upText2.y = 170;
         this.upText2.width = 200;
         addChild(this.upText2);
         this.upText3 = new FTextArea();
         this.upText3.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("目标装备：");
         this.upText3.x = 200;
         this.upText3.y = 100;
         this.upText3.width = 200;
         addChild(this.upText3);
         this.upText4 = new FTextArea();
         this.upText4.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("升级材料选择：");
         this.upText4.x = 75;
         this.upText4.y = 210;
         this.upText4.width = 200;
         this.upText4.height = 20;
         addChild(this.upText4);
         this.djBit1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit1.x = 50;
         this.djBit1.y = this.upText1.y + 20;
         addChild(this.djBit1);
         this.djBit2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit2.x = 200;
         this.djBit2.y = this.upText3.y + 20;
         addChild(this.djBit2);
         this.djBit3 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit3.x = 50;
         this.djBit3.y = this.upText4.y + 20;
         addChild(this.djBit3);
         this.djBit4 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit4.x = 200;
         this.djBit4.y = this.upText4.y + 20;
         addChild(this.djBit4);
         this.equipContainer = new Sprite();
         this.equipContainer.x = this.djBit1.x + 2;
         this.equipContainer.y = this.djBit1.y + 2;
         addChild(this.equipContainer);
         this.nextEquipContainer = new Sprite();
         this.nextEquipContainer.x = this.djBit2.x + 2;
         this.nextEquipContainer.y = this.djBit2.y + 2;
         addChild(this.nextEquipContainer);
         this.upDataItem1Container = new Sprite();
         this.upDataItem1Container.x = this.djBit3.x + 2;
         this.upDataItem1Container.y = this.djBit3.y + 2;
         addChild(this.upDataItem1Container);
         this.upDataItem2Container = new Sprite();
         this.upDataItem2Container.x = this.djBit4.x + 2;
         this.upDataItem2Container.y = this.djBit4.y + 2;
         addChild(this.upDataItem2Container);
         this.checkBox1 = new FCheckBox();
         addChild(this.checkBox1);
         this.checkBox1.x = this.djBit3.x + 45;
         this.checkBox1.y = this.djBit3.y + 10;
         this.checkBox1.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.checkBox2 = new FCheckBox();
         addChild(this.checkBox2);
         this.checkBox2.x = this.djBit4.x + 45;
         this.checkBox2.y = this.djBit4.y + 10;
         this.checkBox2.addEventListener(MouseEvent.CLICK,this.onCheck);
      }
      
      public function setUpdataDate(param1:Goods, param2:int, param3:Goods, param4:Goods, param5:Goods) : void
      {
         this.equip = param1;
         this.nextEquip = param3;
         this.upDataItem1 = param4;
         this.upDataItem2 = param5;
         var _loc6_:ItemFace = new ItemFace(param1);
         this.equipContainer.addChild(_loc6_);
         _loc6_ = new ItemFace(param3);
         this.nextEquipContainer.addChild(_loc6_);
         _loc6_ = new ItemFace(param4);
         this.upDataItem1Container.addChild(_loc6_);
         _loc6_ = new ItemFace(param5);
         this.upDataItem2Container.addChild(_loc6_);
         this.upText2.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("阶段进度：") + param2 + "%";
         this.checkBox1.selectState = false;
         this.checkBox2.selectState = false;
         if(this.checkBox1.selectState || this.checkBox2.selectState)
         {
            this.startBtn.enabled = true;
         }
         else
         {
            this.startBtn.enabled = false;
         }
      }
      
      public function setStartBtnEnabledIsTrue() : void
      {
         if(this.checkBox1.selectState || this.checkBox2.selectState)
         {
            if(this.equip)
            {
               this.startBtn.enabled = true;
            }
         }
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         this.startBtn.enabled = false;
         dispatchEvent(new BaseEvent(UI_EQUIP_UPDATA_TO_120_UPBTN_CLICK,"",[this.equip,this.nextEquip,this.selectGoods]));
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         var _loc2_:FCheckBox = param1.currentTarget as FCheckBox;
         if(_loc2_ == this.checkBox1)
         {
            this.selectGoods = this.upDataItem1;
            this.checkBox2.selectState = false;
         }
         else
         {
            this.selectGoods = this.upDataItem2;
            this.checkBox1.selectState = false;
         }
         if(this.checkBox1.selectState || this.checkBox2.selectState)
         {
            if(this.equip)
            {
               this.startBtn.enabled = true;
            }
            else
            {
               this.startBtn.enabled = false;
            }
         }
         else
         {
            this.startBtn.enabled = false;
         }
      }
      
      private function onClose(param1:*) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
            if(this.equipContainer.numChildren > 0)
            {
               this.equipContainer.removeChildAt(0);
            }
            if(this.nextEquipContainer.numChildren > 0)
            {
               this.nextEquipContainer.removeChildAt(0);
            }
            if(this.upDataItem1Container.numChildren > 0)
            {
               this.upDataItem1Container.removeChildAt(0);
            }
            if(this.upDataItem1Container.numChildren > 0)
            {
               this.upDataItem1Container.removeChildAt(0);
            }
            this.equip = null;
            this.nextEquip = null;
            this.upDataItem1 = null;
            this.upDataItem2 = null;
            this.selectGoods = null;
            this.upText2.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("阶段进度：");
         }
      }
   }
}

