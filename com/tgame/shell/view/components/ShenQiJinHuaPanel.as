package com.tgame.shell.view.components
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class ShenQiJinHuaPanel extends FPanel
   {
      
      public static const UI_ZHANQIXUNZHANG_SHENGJIBTN_CLICK:String = "UI_ZHANQIXUNZHANG_SHENGJIBTN_CLICK";
      
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
      
      private var jiaChengFa1:FTextArea;
      
      private var jiaChengFa2:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public function ShenQiJinHuaPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 325 - 40;
         height = 356 - 40 + 45 - 20;
         this.titleText = LanResManager.getLanCommonTextWords("进化");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.menuContainer1 = new FCanvas();
         this.menuContainer1.skin = "box_transparence";
         addChild(this.menuContainer1);
         this.menuContainer1.width = 305 - 40;
         this.menuContainer1.height = 140 + 45;
         this.menuContainer1.x = 10;
         this.menuContainer1.y = 0;
         this.menuContainer2 = new FCanvas();
         this.menuContainer2.skin = "backGroud";
         addChild(this.menuContainer2);
         this.menuContainer2.width = 305 - 40;
         this.menuContainer2.height = 100 - 20;
         this.menuContainer2.x = 10;
         this.menuContainer2.y = 140 + 45;
         this.label1 = new FTextArea();
         this.label1.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前装备");
         this.label1.x = 30 + 5 + 10;
         this.label1.y = 15;
         this.label1.filters = StaticValue.filter;
         addChild(this.label1);
         this.djBit1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit1.x = this.label1.x + 5;
         this.djBit1.y = this.label1.y + 20;
         addChild(this.djBit1);
         this.jiaChengFa1 = new FTextArea();
         this.jiaChengFa1.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + "";
         this.jiaChengFa1.x = 25 + 5;
         this.jiaChengFa1.y = 90 - 10;
         this.jiaChengFa1.filters = StaticValue.filter;
         this.jiaChengFa1.autoSize = TextFieldAutoSize.LEFT;
         this.jiaChengFa1.width = 230;
         this.jiaChengFa1.wordWrap = true;
         addChild(this.jiaChengFa1);
         this.jiantouBmp = StaticValue.getBitmapByClassName("ui.duanzhao.jiantou");
         this.jiantouBmp.x = 120 - 5;
         this.jiantouBmp.y = 45;
         addChild(this.jiantouBmp);
         this.label2 = new FTextArea();
         this.label2.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("进化后装备");
         this.label2.x = 190 - 5 - 15 - 5;
         this.label2.y = this.label1.y;
         this.label2.filters = StaticValue.filter;
         addChild(this.label2);
         this.djBit2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit2.x = this.label2.x + 12;
         this.djBit2.y = this.label2.y + 20;
         addChild(this.djBit2);
         this.jiaChengFa2 = new FTextArea();
         this.jiaChengFa2.htmlText = "";
         this.jiaChengFa2.x = 170 - 10 - 10;
         this.jiaChengFa2.y = 90 - 10;
         this.jiaChengFa2.width = 140;
         this.jiaChengFa2.filters = StaticValue.filter;
         this.jiaChengFa1.autoSize = TextFieldAutoSize.LEFT;
         this.label3 = new FTextArea();
         this.label3.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("进化材料");
         this.label3.filters = StaticValue.filter;
         this.label3.x = this.label1.x;
         this.label3.y = 165 + 40 - 10;
         addChild(this.label3);
         this.djBit3 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit3.x = this.djBit1.x;
         this.djBit3.y = this.label3.y + 20;
         addChild(this.djBit3);
         this.miaoshu = new FTextArea();
         this.miaoshu.htmlText = "";
         this.miaoshu.x = 100;
         this.miaoshu.y = 170 + 40 - 10 + 25;
         this.miaoshu.width = 170;
         this.miaoshu.height = 60;
         this.miaoshu.filters = StaticValue.filter;
         this.miaoshu.wordWrap = true;
         addChild(this.miaoshu);
         this.check = new FCheckBox();
         this.check.visible = false;
         this.checkLabel = new FLabel();
         this.checkLabel.visible = false;
         with(this.checkLabel)
         {
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("佩剑强化必成卷");
         }
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("进化");
         addChild(this.startBtn);
         this.startBtn.x = 70 + 30 + 15 + 3;
         this.startBtn.y = 250 + 45 - 20;
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
         dispatchEvent(new BaseEvent(UI_ZHANQIXUNZHANG_SHENGJIBTN_CLICK));
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
      
      public function setUpdataDate(param1:Goods, param2:Goods, param3:Goods, param4:int, param5:String) : void
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
         var _loc6_:ItemFace = new ItemFace(param1);
         this.equipContainer.addChild(_loc6_);
         _loc6_ = new ItemFace(param2);
         this.nextEquipContainer.addChild(_loc6_);
         _loc6_ = new ItemFace(param3);
         this.upDataItemContainer.addChild(_loc6_);
         this.setMiaoShu(param3.res.name + "X" + param4 + LanResManager.getLanCommonTextWords("，成功率100%"));
         if(this.upDataItem.count == 0)
         {
            _loc6_.filters = Tools.blackWhiteFilter;
         }
         this.startBtn.enabled = true;
         this.jiaChengFa1.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + param5 + "</font>";
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
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + param1 + "</font>";
      }
      
      public function setJiaChengText(param1:String, param2:String) : void
      {
         var _loc3_:Array = param1.split(",");
         var _loc4_:String = "";
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc4_ += "" + _loc3_[_loc5_] + "<br>";
            _loc5_++;
         }
         var _loc6_:Array = param2.split(",");
         var _loc7_:String = "";
         _loc5_ = 0;
         while(_loc5_ < _loc6_.length)
         {
            _loc7_ += "" + _loc6_[_loc5_] + "<br>";
            _loc5_++;
         }
         this.jiaChengFa1.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前属性加成") + "：</font><br>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + _loc4_;
         this.jiaChengFa2.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("强化后属性加成") + "：</font><br>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + _loc7_;
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 5;
         this.tipCanvas.y = mouseY + 5;
      }
      
      public function setBtnStyle(param1:int = 0) : void
      {
         if(param1 == 1)
         {
            this.checkLabel.visible = true;
            this.check.visible = true;
            this.check.x = 40;
            this.check.y = 275 + 3;
            this.checkLabel.x = this.check.x + 20;
            this.checkLabel.y = 275 + 3;
            this.startBtn.x = 160;
            this.startBtn.y = 275;
         }
         else
         {
            this.check.selectState = false;
            this.checkLabel.visible = false;
            this.check.visible = false;
            this.startBtn.x = 118;
            this.startBtn.y = 275;
         }
      }
   }
}

