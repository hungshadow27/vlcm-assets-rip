package com.tgame.shell.view.components.huodong
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class HuXinYaoTiShengPanel extends FPanel
   {
      
      public static const TISHENG_CLICK:String = "TISHENG_CLICK";
      
      private var jiantouBmp:Bitmap;
      
      private var djBit1:Bitmap;
      
      private var djBit2:Bitmap;
      
      private var djBit3:Bitmap;
      
      private var equip:Goods;
      
      private var nextEquip:Goods;
      
      private var upDataItem:Goods;
      
      private var startBtn:SecondButton;
      
      private var menuContainer1:FCanvas;
      
      private var menuContainer2:FCanvas;
      
      private var equipContainer:Sprite;
      
      private var nextEquipContainer:Sprite;
      
      private var upDataItemContainer:Sprite;
      
      private var label1:FTextArea;
      
      private var label2:FTextArea;
      
      private var label3:FTextArea;
      
      private var miaoshu:FTextArea;
      
      public function HuXinYaoTiShengPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 325 - 40 - 30;
         height = 356 - 40 + 45 - 20 - 50 - 25;
         this.titleText = LanResManager.getLanCommonTextWords("提升品质");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.menuContainer1 = new FCanvas();
         this.menuContainer1.skin = "box_transparence";
         addChild(this.menuContainer1);
         this.menuContainer1.width = 305 - 70;
         this.menuContainer1.height = 90;
         this.menuContainer1.x = 10;
         this.menuContainer1.y = 0;
         this.menuContainer2 = new FCanvas();
         this.menuContainer2.skin = "backGroud";
         addChild(this.menuContainer2);
         this.menuContainer2.width = this.menuContainer1.width;
         this.menuContainer2.height = 100;
         this.menuContainer2.x = 10;
         this.menuContainer2.y = this.menuContainer1.y + this.menuContainer1.height;
         this.label1 = new FTextArea();
         this.label1.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前物品") + "</font>";
         this.label1.x = 30 + 5 + 10 - 5;
         this.label1.y = 15;
         this.label1.filters = StaticValue.filter;
         addChild(this.label1);
         this.djBit1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit1.x = this.label1.x + 5;
         this.djBit1.y = this.label1.y + 20;
         addChild(this.djBit1);
         this.jiantouBmp = StaticValue.getBitmapByClassName("ui.duanzhao.jiantou");
         this.jiantouBmp.x = 120 - 5;
         this.jiantouBmp.y = 45;
         addChild(this.jiantouBmp);
         this.label2 = new FTextArea();
         this.label2.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("提升后物品") + "</font>";
         this.label2.x = 190 - 5 - 15 - 5;
         this.label2.y = this.label1.y;
         this.label2.filters = StaticValue.filter;
         addChild(this.label2);
         this.djBit2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit2.x = this.label2.x + 12;
         this.djBit2.y = this.label2.y + 20;
         addChild(this.djBit2);
         this.label3 = new FTextArea();
         this.label3.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗材料") + "</font>";
         this.label3.filters = StaticValue.filter;
         this.label3.x = this.label1.x;
         this.label3.y = 165 + 40 - 10 - 100 + 15;
         addChild(this.label3);
         this.djBit3 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit3.x = this.djBit1.x;
         this.djBit3.y = this.label3.y + 20;
         addChild(this.djBit3);
         this.miaoshu = new FTextArea();
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("炼化后，可获得更高一层的护心药，高级的护心药会为你带来更强大的属性。") + "</font>";
         this.miaoshu.x = 110;
         this.miaoshu.y = 110;
         this.miaoshu.width = 115;
         this.miaoshu.height = 90;
         this.miaoshu.filters = StaticValue.filter;
         this.miaoshu.wordWrap = true;
         addChild(this.miaoshu);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("提升品质");
         addChild(this.startBtn);
         this.startBtn.x = 70 + 30 + 15 + 3 - 15 - 5;
         this.startBtn.y = 250 + 45 - 20 - 80 + 5;
         this.startBtn.enabled = true;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onStart);
         this.equipContainer = new Sprite();
         this.equipContainer.x = this.djBit1.x + 2;
         this.equipContainer.y = this.djBit1.y + 2;
         addChild(this.equipContainer);
         this.nextEquipContainer = new Sprite();
         this.nextEquipContainer.x = this.djBit2.x + 2;
         this.nextEquipContainer.y = this.djBit2.y + 2;
         addChild(this.nextEquipContainer);
         this.upDataItemContainer = new Sprite();
         this.upDataItemContainer.x = this.djBit3.x + 2;
         this.upDataItemContainer.y = this.djBit3.y + 2;
         addChild(this.upDataItemContainer);
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(TISHENG_CLICK));
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
            if(this.upDataItemContainer.numChildren > 0)
            {
               this.upDataItemContainer.removeChildAt(0);
            }
            this.equip = null;
            this.nextEquip = null;
            this.upDataItem = null;
         }
      }
      
      public function setUpdataDate(param1:Goods, param2:Goods, param3:Goods) : void
      {
         if(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         if(this.nextEquipContainer.numChildren > 0)
         {
            this.nextEquipContainer.removeChildAt(0);
         }
         if(this.upDataItemContainer.numChildren > 0)
         {
            this.upDataItemContainer.removeChildAt(0);
         }
         this.equip = param1;
         this.nextEquip = param2;
         this.upDataItem = param3;
         var _loc4_:ItemFace = new ItemFace(param1);
         _loc4_.setShowCount(false);
         this.equipContainer.addChild(_loc4_);
         _loc4_ = new ItemFace(param2);
         _loc4_.setShowCount(false);
         this.nextEquipContainer.addChild(_loc4_);
         _loc4_ = new ItemFace(param3);
         this.upDataItemContainer.addChild(_loc4_);
         if(this.upDataItem.count == 0)
         {
            _loc4_.filters = Tools.blackWhiteFilter;
         }
         this.startBtn.enabled = true;
      }
      
      public function setStartBtnEnabled(param1:Boolean) : void
      {
         this.startBtn.enabled = param1;
      }
      
      public function setPanelTitle(param1:String) : void
      {
         this.titleText = param1;
      }
      
      public function setMiaoShu(param1:String) : void
      {
         this.miaoshu.htmlText = param1;
      }
   }
}

