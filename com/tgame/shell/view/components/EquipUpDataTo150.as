package com.tgame.shell.view.components
{
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
   
   public class EquipUpDataTo150 extends FPanel
   {
      
      public static const UI_EQUIP_UPDATA_TO_150_UPBTN_CLICK:String = "UI_EQUIP_UPDATA_TO_150_UPBTN_CLICK";
      
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
      
      private var upText1:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var upText3:FTextArea;
      
      private var upText4:FTextArea;
      
      public function EquipUpDataTo150()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 325 - 40;
         height = 356 - 20 - 20;
         this.titleText = LanResManager.getLanCommonTextWords("装备升阶");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.menuContainer1 = new FCanvas();
         this.menuContainer1.skin = "box_transparence";
         addChild(this.menuContainer1);
         this.menuContainer1.width = 305 - 40;
         this.menuContainer1.height = 90;
         this.menuContainer1.x = 10;
         this.menuContainer1.y = 0;
         this.miaoshu = new FTextArea();
         this.miaoshu.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("将装备将由120级快速提升至150级。") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("将") + "</font><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("上古玄铁") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("放入包裹，点击提升装备来打造级装备，级装备可以继续养成，来获得更多的攻击") + "</textformat>";
         this.miaoshu.x = 20;
         this.miaoshu.y = 15;
         this.miaoshu.width = 305;
         addChild(this.miaoshu);
         this.menuContainer2 = new FCanvas();
         this.menuContainer2.skin = "backGroud";
         addChild(this.menuContainer2);
         this.menuContainer2.width = 305 - 40;
         this.menuContainer2.height = 110 - 30;
         this.menuContainer2.x = 10;
         this.menuContainer2.y = 91 - 20 + 20 - 2;
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("提升装备");
         addChild(this.startBtn);
         this.startBtn.x = 70 + 30 + 5;
         this.startBtn.y = 250;
         this.startBtn.enabled = true;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onStart);
         this.upText1 = new FTextArea();
         this.upText1.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("原始装备：");
         this.upText1.x = 50;
         this.upText1.y = 100;
         this.upText1.width = 200;
         addChild(this.upText1);
         this.djBit1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit1.x = 50 + 10;
         this.djBit1.y = this.upText1.y + 20;
         addChild(this.djBit1);
         this.upText3 = new FTextArea();
         this.upText3.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("目标装备：");
         this.upText3.x = 200 - 40;
         this.upText3.y = 100;
         this.upText3.width = 200;
         addChild(this.upText3);
         this.djBit2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit2.x = 200 - 30;
         this.djBit2.y = this.upText3.y + 20;
         addChild(this.djBit2);
         this.upText4 = new FTextArea();
         this.upText4.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("升级材料：");
         this.upText4.x = 110;
         this.upText4.y = 210 - 20 - 10 - 10 + 3;
         this.upText4.width = 200;
         this.upText4.height = 20;
         addChild(this.upText4);
         this.djBit3 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit3.x = 50 + 50 + 20;
         this.djBit3.y = this.upText4.y + 20;
         addChild(this.djBit3);
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
         this.startBtn.enabled = false;
         dispatchEvent(new BaseEvent(UI_EQUIP_UPDATA_TO_150_UPBTN_CLICK,"",[this.equip,this.nextEquip,this.upDataItem]));
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
      
      public function setUpdataDate(param1:Goods, param2:Goods, param3:Goods, param4:String) : void
      {
         this.equip = param1;
         this.nextEquip = param2;
         this.upDataItem = param3;
         var _loc5_:ItemFace = new ItemFace(param1);
         this.equipContainer.addChild(_loc5_);
         _loc5_ = new ItemFace(param2);
         this.nextEquipContainer.addChild(_loc5_);
         _loc5_ = new ItemFace(param3);
         this.upDataItemContainer.addChild(_loc5_);
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "<textformat leading=\'1\'>" + param4 + "</textformat>";
      }
      
      public function setStartBtnEnabled(param1:Boolean) : void
      {
         this.startBtn.enabled = param1;
      }
   }
}

