package com.tgame.shell.view.components
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.utils.setTimeout;
   
   public class XunZhangAndZhanQiDuanZhaoPanel extends FPanel
   {
      
      public static const UI_ZHANQIXUNZHANG_SHENGJIBTN_CLICK:String = "UI_ZHANQIXUNZHANG_SHENGJIBTN_CLICK";
      
      public static const UI_WUFANGFUJIA_SHENGJIBTN_CLICK:String = "UI_WUFANGFUJIA_SHENGJIBTN_CLICK";
      
      private var jiantouBmp:Bitmap;
      
      private var djBit1:Bitmap;
      
      private var djBit2:Bitmap;
      
      private var djBit3:Bitmap;
      
      private var djBit4:Bitmap;
      
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
      
      private var qianghuaType:int = 0;
      
      private var tipStr:String = "";
      
      private var shangguiSpr:Sprite;
      
      private var tebieSpr:Sprite;
      
      private var dengji:FTextArea;
      
      private var baifenb:FTextArea;
      
      private var img:Bitmap;
      
      private var CjBar:ColorBar;
      
      private var check1:FCheckBox;
      
      private var checkLabel1:FLabel;
      
      private var check2:FCheckBox;
      
      private var checkLabel2:FLabel;
      
      private var item4:ItemFace;
      
      private var zdBtn:SecondButton;
      
      private var updateGoodsNum:* = 0;
      
      private var curUpdateItem:ItemFace;
      
      private var curCount:int = 50;
      
      public function XunZhangAndZhanQiDuanZhaoPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 325 - 40;
         height = 356 - 40 + 45 - 20;
         this.titleText = LanResManager.getLanCommonTextWords("强化");
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
         this.shangguiSpr = new Sprite();
         addChild(this.shangguiSpr);
         this.tebieSpr = new Sprite();
         addChild(this.tebieSpr);
         this.dengji = new FTextArea();
         this.dengji.filters = StaticValue.filter;
         this.dengji.x = 30 + 5 + 10 - 23 + 8;
         this.dengji.y = 165 + 40 + 10 + 3;
         this.tebieSpr.addChild(this.dengji);
         this.baifenb = new FTextArea();
         this.baifenb.filters = StaticValue.filter;
         this.baifenb.width = 230;
         this.baifenb.x = 30 + 5 + 10 - 23 + 8;
         this.baifenb.y = 165 + 40 + 10 + 3 - 20;
         this.tebieSpr.addChild(this.baifenb);
         this.img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         this.tebieSpr.addChild(this.img);
         this.img.width = 170;
         this.img.x = 50 + 40;
         this.img.y = 149 - 11 + 80;
         this.CjBar = new ColorBar(5,132,11);
         this.tebieSpr.addChild(this.CjBar);
         this.CjBar.x = 69 + 40;
         this.CjBar.y = 152 - 11 + 80;
         this.CjBar.setValue(2,2);
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
         addChild(this.jiaChengFa1);
         this.jiantouBmp = StaticValue.getBitmapByClassName("ui.duanzhao.jiantou");
         this.jiantouBmp.x = 120 - 5;
         this.jiantouBmp.y = 45;
         addChild(this.jiantouBmp);
         this.label2 = new FTextArea();
         this.label2.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("强化后装备");
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
         addChild(this.jiaChengFa2);
         this.label3 = new FTextArea();
         this.label3.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("强化材料");
         this.label3.filters = StaticValue.filter;
         this.label3.x = this.label1.x;
         this.label3.y = 165 + 40 - 10;
         this.shangguiSpr.addChild(this.label3);
         this.djBit3 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit3.x = this.djBit1.x;
         this.djBit3.y = this.label3.y + 20;
         this.shangguiSpr.addChild(this.djBit3);
         this.djBit4 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit4.x = 177;
         this.djBit4.y = 216;
         this.miaoshu = new FTextArea();
         this.miaoshu.htmlText = "";
         this.miaoshu.x = 100;
         this.miaoshu.y = 170 + 40 - 10;
         this.miaoshu.width = 170;
         this.miaoshu.height = 60;
         this.miaoshu.filters = StaticValue.filter;
         this.miaoshu.wordWrap = true;
         this.shangguiSpr.addChild(this.miaoshu);
         this.check = new FCheckBox();
         this.check.visible = false;
         addChild(this.check);
         this.checkLabel = new FLabel();
         this.checkLabel.visible = false;
         with(this.checkLabel)
         {
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
         }
         this.checkLabel.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.checkLabel.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
         addChild(this.checkLabel);
         this.check1 = new FCheckBox();
         this.check1.visible = false;
         this.check1.x = 100;
         this.check1.y = 235;
         addChild(this.check1);
         this.checkLabel1 = new FLabel();
         this.checkLabel1.visible = false;
         with(this.checkLabel1)
         {
            x = 125;
            y = 235;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = "Cường Hóa Chi Thuật";
         }
         addChild(this.checkLabel1);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("强化");
         addChild(this.startBtn);
         this.startBtn.x = 70 + 30 + 15 + 3 + 50 + 50;
         this.startBtn.y = 250 + 45 - 20;
         this.startBtn.enabled = true;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onStart);
         this.zdBtn = new SecondButton();
         this.zdBtn.label = "Tự động";
         addChild(this.zdBtn);
         this.zdBtn.x = 70 + 30 + 15 + 3 + 50 + 50 - 10;
         this.zdBtn.y = 250 + 45 - 20;
         this.zdBtn.enabled = true;
         this.zdBtn.addEventListener(MouseEvent.CLICK,this.onStart);
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
         this.shangguiSpr.addChild(this.upDataItemContainer);
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.target == this.startBtn)
         {
            this.zdBtn.label = "Tự động";
            _loc2_ = 1;
         }
         else if(param1.target == this.zdBtn)
         {
            _loc2_ = 2;
            if(this.zdBtn.label == "Ngừng tự động")
            {
               this.zdBtn.label = "Tự động";
            }
            else if(this.zdBtn.label == "Tự động")
            {
               this.zdBtn.label = "Ngừng tự động";
            }
         }
         else
         {
            this.zdBtn.label = "Tự động";
            _loc2_ = 0;
         }
         if(ItemPositionRange.POSTION_WUFANG_ARR.indexOf(this.equip.res.position) != -1)
         {
            dispatchEvent(new BaseEvent(UI_WUFANGFUJIA_SHENGJIBTN_CLICK));
         }
         else if(this.check1.visible)
         {
            if(this.curCount == 100)
            {
               this.curCount = 50;
            }
            this.updateEquip(4,this.check1.selectState ? true : false,this.curCount,_loc2_);
         }
         else if(ItemPositionRange.YUENAN_ZHAOYUANWUHUJIANGARR.indexOf(this.equip.id) != -1)
         {
            if(this.curCount == 50)
            {
               this.curCount = 100;
            }
            this.updateEquip(6,this.check.selectState ? true : false,this.curCount,_loc2_);
         }
         else
         {
            if(this.curCount == 100)
            {
               this.curCount = 50;
            }
            this.updateEquip(1,this.check.selectState ? true : false,this.curCount,_loc2_);
         }
      }
      
      public function stopzdupdate(param1:int) : void
      {
         this.zdBtn.label = "Tự động";
      }
      
      private function updateEquip(param1:int, param2:Boolean, param3:int, param4:int = 0) : void
      {
         if(param4 == 0)
         {
            return;
         }
         if(param4 == 1)
         {
            dispatchEvent(new BaseEvent(UI_ZHANQIXUNZHANG_SHENGJIBTN_CLICK,"",[param1,param2,param3]));
         }
         else if(param4 == 2)
         {
            if(this.zdBtn.label == "Tự động")
            {
               return;
            }
            dispatchEvent(new BaseEvent(UI_ZHANQIXUNZHANG_SHENGJIBTN_CLICK,"",[param1,param2,param3]));
            setTimeout(this.updateEquip,1000,param1,param2,param3,2);
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
            if(this.upDataItemContainer.numChildren > 0)
            {
               this.upDataItemContainer.removeChildAt(0);
            }
            this.equip = null;
            this.nextEquip = null;
            this.upDataItem = null;
         }
      }
      
      public function setUpdataDate(param1:Goods, param2:Goods, param3:Goods, param4:int, param5:String, param6:String, param7:String, param8:String, param9:int, param10:int) : void
      {
         var _loc14_:Bitmap = null;
         if(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         if(this.nextEquipContainer.numChildren > 0)
         {
            this.nextEquipContainer.removeChildAt(0);
         }
         while(this.upDataItemContainer.numChildren > 0)
         {
            this.upDataItemContainer.removeChildAt(0);
         }
         this.equip = param1;
         this.nextEquip = param2;
         this.upDataItem = param3;
         this.updateGoodsNum = this.upDataItem.count;
         var _loc11_:ItemFace = new ItemFace(param1);
         this.equipContainer.addChild(_loc11_);
         _loc11_ = new ItemFace(param2);
         this.nextEquipContainer.addChild(_loc11_);
         this.zdBtn.visible = false;
         var _loc12_:Array = [50,500,5000];
         var _loc13_:Array = [100,1000,10000];
         if(this.upDataItem.id == 730507 && ItemPositionRange.YUENAN_ZHAOYUANWUHUJIANGARR.indexOf(param1.id) != -1)
         {
            if(this.curCount == 50)
            {
               this.curCount = 100;
            }
            this.upDataItem.count = 100;
            _loc11_ = new ItemFace(this.upDataItem);
            this.upDataItemContainer.addChild(_loc11_);
            _loc11_.filters = this.updateGoodsNum < 100 ? Tools.blackWhiteFilter : [];
            _loc11_.Select = this.upDataItem.count == this.curCount ? true : false;
            if(this.upDataItem.count == this.curCount)
            {
               this.curUpdateItem = _loc11_;
            }
            _loc14_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.upDataItemContainer.addChild(_loc14_);
            _loc14_.y = -2;
            _loc14_.x = 73;
            this.upDataItem = new Goods(730507);
            this.upDataItem.count = 1000;
            _loc11_ = new ItemFace(this.upDataItem);
            _loc11_.x = 75;
            this.upDataItemContainer.addChild(_loc11_);
            _loc11_.filters = this.updateGoodsNum < 1000 ? Tools.blackWhiteFilter : [];
            _loc11_.Select = this.upDataItem.count == this.curCount ? true : false;
            if(this.upDataItem.count == this.curCount)
            {
               this.curUpdateItem = _loc11_;
            }
            _loc14_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.upDataItemContainer.addChild(_loc14_);
            _loc14_.y = -2;
            _loc14_.x = 148;
            this.upDataItem = new Goods(730507);
            this.upDataItem.count = 10000;
            _loc11_ = new ItemFace(this.upDataItem);
            _loc11_.x = 150;
            this.upDataItemContainer.addChild(_loc11_);
            _loc11_.filters = this.updateGoodsNum < 10000 ? Tools.blackWhiteFilter : [];
            _loc11_.Select = this.upDataItem.count == this.curCount ? true : false;
            if(this.upDataItem.count == this.curCount)
            {
               this.curUpdateItem = _loc11_;
            }
            this.upDataItemContainer.addEventListener(MouseEvent.CLICK,this.onClickItemHandler);
         }
         else if(this.upDataItem.id == 730507)
         {
            this.zdBtn.visible = true;
            if(this.curCount == 100)
            {
               this.curCount = 50;
            }
            this.upDataItem.count = 50;
            _loc11_ = new ItemFace(this.upDataItem);
            this.upDataItemContainer.addChild(_loc11_);
            _loc11_.filters = this.updateGoodsNum < 50 ? Tools.blackWhiteFilter : [];
            _loc11_.Select = this.upDataItem.count == this.curCount ? true : false;
            if(this.upDataItem.count == this.curCount)
            {
               this.curUpdateItem = _loc11_;
            }
            _loc14_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.upDataItemContainer.addChild(_loc14_);
            _loc14_.y = -2;
            _loc14_.x = 73;
            this.upDataItem = new Goods(730507);
            this.upDataItem.count = 500;
            _loc11_ = new ItemFace(this.upDataItem);
            _loc11_.x = 75;
            this.upDataItemContainer.addChild(_loc11_);
            _loc11_.filters = this.updateGoodsNum < 500 ? Tools.blackWhiteFilter : [];
            _loc11_.Select = this.upDataItem.count == this.curCount ? true : false;
            if(this.upDataItem.count == this.curCount)
            {
               this.curUpdateItem = _loc11_;
            }
            _loc14_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.upDataItemContainer.addChild(_loc14_);
            _loc14_.y = -2;
            _loc14_.x = 148;
            this.upDataItem = new Goods(730507);
            this.upDataItem.count = 5000;
            _loc11_ = new ItemFace(this.upDataItem);
            _loc11_.x = 150;
            this.upDataItemContainer.addChild(_loc11_);
            _loc11_.filters = this.updateGoodsNum < 5000 ? Tools.blackWhiteFilter : [];
            _loc11_.Select = this.upDataItem.count == this.curCount ? true : false;
            if(this.upDataItem.count == this.curCount)
            {
               this.curUpdateItem = _loc11_;
            }
            this.upDataItemContainer.addEventListener(MouseEvent.CLICK,this.onClickItemHandler);
         }
         else
         {
            _loc11_ = new ItemFace(this.upDataItem);
            this.upDataItemContainer.addChild(_loc11_);
            _loc11_.filters = this.updateGoodsNum == 0 ? Tools.blackWhiteFilter : [];
         }
         this.setMiaoShu(param8);
         this.setJiaChengText(param6,param7);
         this.startBtn.enabled = true;
         if(ItemPositionRange.POSITION_XUANYUANPEIJIAN_ARR.indexOf(param1.res.position) != -1)
         {
            this.setBtnStyle(1,param10);
         }
         else if(ItemPositionRange.POSITION_POTIANRENQIANGHUAFU_ARR.indexOf(param1.res.position) != -1)
         {
            this.setBtnStyle(2,param10);
         }
         else if(param1.res.position == ItemPositionRange.POSTION_LIANQI_HUPOSHENDAO)
         {
            this.setBtnStyle(3,param10);
         }
         else if(param1.res.position == ItemPositionRange.POSTION_XUEDAO_SHIXUEKUANGDAO)
         {
            this.setBtnStyle(4,param10);
         }
         else if(param1.res.position == ItemPositionRange.POSTION_BEIMINGSHENGONG_DIHUANGYUXI)
         {
            this.setBtnStyle(5,param10);
         }
         else if(param1.res.position == ItemPositionRange.POSTION_DUGUJIUJIAN_LONGHUNJIAN)
         {
            this.setBtnStyle(6);
         }
         else if(param1.res.position == ItemPositionRange.POSTION_LONGLINDUN)
         {
            this.setBtnStyle(7,param10);
         }
         else if(ItemPositionRange.YUENAN_ZHAOYUANWUHUJIANGARR.indexOf(param1.id) != -1)
         {
            this.setBtnStyle(8,param10);
         }
         else
         {
            this.setBtnStyle(0,param10);
         }
         if(param1.id == 722256)
         {
            this.titleText = LanResManager.getLanCommonTextWords("装备升阶");
         }
         if(param9 < 20)
         {
            this.dengji.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("等级一") + "</font>";
         }
         else if(param9 < 40)
         {
            this.dengji.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("等级二") + "</font>";
         }
         else if(param9 < 60)
         {
            this.dengji.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("等级三") + "</font>";
         }
         else if(param9 < 80)
         {
            this.dengji.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("等级四") + "</font>";
         }
         else if(param9 < 100)
         {
            this.dengji.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("等级五") + "</font>";
         }
         if(param1.id == 371784 || param1.id == 372103 || param1.id == 372682)
         {
            this.shangguiSpr.visible = false;
            this.tebieSpr.visible = true;
         }
         else
         {
            this.shangguiSpr.visible = true;
            this.tebieSpr.visible = false;
         }
         if(param1.id == 371784)
         {
            this.baifenb.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("每次强化将扣除5个魔龙之心碎片") + "</font>";
         }
         else if(param1.id == 372103)
         {
            this.baifenb.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("每次强化将扣除200个神兵碎片") + "</font>";
         }
         else if(param1.id == 372682)
         {
            this.baifenb.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("每次强化将扣除20个炎魔升阶石") + "</font>";
         }
         this.CjBar.setValue(param9,100);
         this.setDelChk(param1.res.position);
         this.setDelChkByID(param1.id);
      }
      
      private function onClickItemHandler(param1:MouseEvent) : void
      {
         if(this.curUpdateItem)
         {
            this.curUpdateItem.Select = false;
            this.curUpdateItem = null;
         }
         this.curUpdateItem = param1.target as ItemFace;
         if(this.curUpdateItem)
         {
            this.curUpdateItem.Select = true;
            this.curCount = this.curUpdateItem.getBaseItem().count;
         }
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
      
      private function onCheckTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.checkLabel.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.qianghuaType == 1)
               {
                  _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用佩剑强化必成卷将可以对佩剑进行强化，绝对不会失败消失！佩剑强化必成卷可以代替天工图进行强化。") + "</font></textformat>";
               }
               else if(this.qianghuaType == 2)
               {
                  _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用【虎魄神刀必成卷】将可以对虎魄神刀进行100%强化，绝对不会失败消失！") + "<br>" + LanResManager.getLanCommonTextWords("虎魄神刀必成卷可以代替天外陨铁进行强化。") + "</font></textformat>";
               }
               else if(this.qianghuaType == 3)
               {
                  _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用【嗜血狂刀必成卷】将可以对嗜血狂刀进行100%强化，绝对不会失败消失！") + "<br>" + LanResManager.getLanCommonTextWords("嗜血狂刀必成卷可以代替血刀精魄进行强化。") + "</font></textformat>";
               }
               else if(this.qianghuaType == 4)
               {
                  _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用【帝皇玉玺必成卷】将可以对帝皇玉玺进行100%强化，绝对不会失败消失！") + "<br>" + LanResManager.getLanCommonTextWords("帝皇玉玺必成卷可以代替帝皇碎片进行强化。") + "</font></textformat>";
               }
               else if(this.qianghuaType == 5)
               {
                  _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用【龙魂精元】将可以对龙魂剑进行100%强化，绝对不会失败消失！") + "<br>" + LanResManager.getLanCommonTextWords("龙魂精元可以代替龙鳞碎片进行强化。") + "</font></textformat>";
               }
               else if(this.qianghuaType == 6)
               {
                  _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用【龙鳞符】将可以对龙鳞盾进行100%强化，绝对不会失败消失！") + "<br>" + LanResManager.getLanCommonTextWords("龙鳞符可以代替龙鳞石进行强化。") + "</font></textformat>";
               }
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.checkLabel.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
         }
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
      
      public function setBtnStyle(param1:int = 0, param2:int = 0) : void
      {
         this.qianghuaType = param1;
         this.check1.visible = this.checkLabel1.visible = Boolean(param2);
         this.titleText = LanResManager.getLanCommonTextWords("强化");
         this.label2.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("强化后装备");
         this.startBtn.label = LanResManager.getLanCommonTextWords("强化");
         if(param1 == 1)
         {
            this.checkLabel.visible = true;
            this.check.visible = true;
            this.checkLabel.text = LanResManager.getLanCommonTextWords("佩剑强化必成卷");
            this.tipStr = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用佩剑强化必成卷将可以对佩剑进行强化，绝对不会失败消失！佩剑强化必成卷可以代替天工图进行强化。") + "</font></textformat>";
            this.check.x = 40;
            this.check.y = 275 + 3;
            this.checkLabel.x = this.check.x + 20;
            this.checkLabel.y = 275 + 3;
            this.checkLabel.text = LanResManager.getLanCommonTextWords("佩剑强化必成卷");
            this.startBtn.x = 160 + 50;
            this.startBtn.y = 275;
         }
         else if(param1 == 2)
         {
            this.checkLabel.visible = true;
            this.check.visible = true;
            this.checkLabel.text = LanResManager.getLanCommonTextWords("破天刃强化符");
            this.tipStr = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用破天刃强化符将可以对破天刃进行强化，绝对不会降星！破天刃强化符可以代替火焰宝石进行强化。") + "</font></textformat>";
            this.check.x = 40;
            this.check.y = 275 + 3;
            this.checkLabel.x = this.check.x + 20;
            this.checkLabel.y = 275 + 3;
            this.startBtn.x = 160;
            this.startBtn.y = 275;
         }
         else if(param1 == 3)
         {
            this.checkLabel.visible = true;
            this.check.visible = true;
            this.check.x = 40;
            this.check.y = 275 + 3;
            this.checkLabel.x = this.check.x + 20;
            this.checkLabel.y = 275 + 3;
            this.checkLabel.text = LanResManager.getLanCommonTextWords("虎魄神刀必成卷");
            this.startBtn.x = 160 + 50;
            this.startBtn.y = 275;
         }
         else if(param1 == 4)
         {
            this.checkLabel.visible = true;
            this.check.visible = true;
            this.check.x = 40;
            this.check.y = 275 + 3;
            this.checkLabel.x = this.check.x + 20;
            this.checkLabel.y = 275 + 3;
            this.checkLabel.text = LanResManager.getLanCommonTextWords("嗜血狂刀必成卷");
            this.startBtn.x = 160 + 50;
            this.startBtn.y = 275;
         }
         else if(param1 == 5)
         {
            this.checkLabel.visible = true;
            this.check.visible = true;
            this.check.x = 40;
            this.check.y = 275 + 3;
            this.checkLabel.x = this.check.x + 20;
            this.checkLabel.y = 275 + 3;
            this.checkLabel.text = LanResManager.getLanCommonTextWords("帝皇玉玺必成卷");
            this.startBtn.x = 160 + 50;
            this.startBtn.y = 275;
         }
         else if(param1 == 6)
         {
            this.checkLabel.visible = true;
            this.check.visible = true;
            this.check.x = 40;
            this.check.y = 275 + 3;
            this.checkLabel.x = this.check.x + 20;
            this.checkLabel.y = 275 + 3;
            this.checkLabel.text = LanResManager.getLanCommonTextWords("龙魂精元");
            this.startBtn.x = 160 + 50;
            this.startBtn.y = 275;
         }
         else if(param1 == 7)
         {
            this.checkLabel.visible = true;
            this.check.visible = true;
            this.check.x = 40;
            this.check.y = 275 + 3;
            this.checkLabel.x = this.check.x + 20;
            this.checkLabel.y = 275 + 3;
            this.checkLabel.text = LanResManager.getLanCommonTextWords("龙鳞符");
            this.startBtn.x = 160 + 50;
            this.startBtn.y = 275;
         }
         else if(param1 == 8)
         {
            this.check.selectState = false;
            this.checkLabel.visible = false;
            this.check.visible = false;
            this.startBtn.x = 118;
            this.startBtn.y = 275;
            this.titleText = "Nâng Cấp";
            this.label2.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "N.cấp thành công";
            this.startBtn.label = "Nâng Cấp";
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
      
      private function setDelChk(param1:int) : void
      {
         if(ItemPositionRange.YUENAN_NO_BICHENG.indexOf(param1) != -1)
         {
            if(this.check)
            {
               this.check.selectState = false;
               this.checkLabel.visible = false;
               this.check.visible = false;
            }
         }
      }
      
      public function setDelChkByID(param1:int) : void
      {
         if(ItemPositionRange.YUENAN_NO_BICHENG_ID.indexOf(param1) != -1)
         {
            if(this.check)
            {
               this.check.selectState = false;
               this.checkLabel.visible = false;
               this.check.visible = false;
            }
         }
      }
   }
}

