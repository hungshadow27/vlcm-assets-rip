package com.tgame.shell.view.components.menghuanshuxingka
{
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
   import com.tgame.common.vo.item.ItemTip;
   import com.tgame.shell.view.components.MenghuanShuxingKa;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class FujiaShuxingChongzhiCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var bg:Bitmap;
      
      private var setEquipBtn:SmallButton;
      
      private var expend:FTextArea;
      
      private var checkBox1:FCheckBox;
      
      private var checkBox2:FCheckBox;
      
      private var checkBox3:FCheckBox;
      
      private var checkBox4:FCheckBox;
      
      private var checkBox5:FCheckBox;
      
      private var checkBox6:FCheckBox;
      
      private var selectBtn:FSimpleButton;
      
      private var count:FLabel;
      
      private var countList:FList;
      
      private var listContainer:FCanvas;
      
      private var scroll:FVScorllBar;
      
      private var equipContainer:Sprite;
      
      private var itemContainer:Sprite;
      
      private var itemContainer1:Sprite;
      
      private var startBtn:SecondButton;
      
      private var tempCount:int;
      
      private var luckMaterial:Goods;
      
      private var strengthenMaterial:Goods;
      
      private var helpBtn:FSimpleButton;
      
      private var shuxingFt:FTextArea;
      
      private var shuxingMaxFt:FTextArea;
      
      private var shuxingSpr:Sprite;
      
      private var tf1:TextFormat;
      
      private var cailiaoFt:FTextArea;
      
      private var menghuanmanzhiFt:FTextArea;
      
      private var menghuanArr:Array;
      
      private var selectId:int;
      
      public function FujiaShuxingChongzhiCanvas()
      {
         var text1:FTextArea;
         super();
         this.bg = new Bitmap();
         this.bg.name = "ui.menghuan.ui";
         addChild(this.bg);
         this.setEquipBtn = new SmallButton();
         this.setEquipBtn.label = LanResManager.getLanCommonTextWords("放入紫装");
         addChild(this.setEquipBtn);
         this.setEquipBtn.x = 4;
         this.setEquipBtn.y = 14;
         this.setEquipBtn.addEventListener(MouseEvent.CLICK,this.onSetEquip);
         this.tf1 = new TextFormat();
         this.tf1.align = "right";
         text1 = new FTextArea();
         with(text1)
         {
            x = 73;
            y = 5;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"梦幻属性卡可以重置紫装附加属性数值到满值") + "</font>" + LanResManager.getLanTextWords(this,"1：请放入一件紫色装备") + "</textformat>";
         }
         addChild(text1);
         this.shuxingSpr = new Sprite();
         this.shuxingSpr.x = 70;
         this.shuxingSpr.y = 75;
         addChild(this.shuxingSpr);
         this.shuxingSpr.visible = false;
         this.shuxingFt = new FTextArea();
         with(this.shuxingFt)
         {
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.PURPLE;
            htmlText = "";
         }
         this.shuxingSpr.addChild(this.shuxingFt);
         this.shuxingMaxFt = new FTextArea();
         with(this.shuxingMaxFt)
         {
            x = 130;
            autoSize = TextFieldAutoSize.LEFT;
            defaultTextFormat = tf1;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.GREEN_STRONG;
            htmlText = "";
         }
         this.shuxingSpr.addChild(this.shuxingMaxFt);
         this.checkBox1 = new FCheckBox();
         this.shuxingSpr.addChild(this.checkBox1);
         this.checkBox1.x = 235;
         this.checkBox1.y = 0;
         this.checkBox1.name = "1";
         this.checkBox1.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.checkBox2 = new FCheckBox();
         this.shuxingSpr.addChild(this.checkBox2);
         this.checkBox2.x = 235;
         this.checkBox2.y = this.checkBox1.y + 19;
         this.checkBox2.name = "2";
         this.checkBox2.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.checkBox3 = new FCheckBox();
         this.shuxingSpr.addChild(this.checkBox3);
         this.checkBox3.x = 235;
         this.checkBox3.y = this.checkBox2.y + 19;
         this.checkBox3.name = "3";
         this.checkBox3.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.checkBox4 = new FCheckBox();
         this.shuxingSpr.addChild(this.checkBox4);
         this.checkBox4.x = 235;
         this.checkBox4.y = this.checkBox3.y + 19;
         this.checkBox4.name = "4";
         this.checkBox4.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.checkBox5 = new FCheckBox();
         this.shuxingSpr.addChild(this.checkBox5);
         this.checkBox5.x = 235;
         this.checkBox5.y = this.checkBox4.y + 19;
         this.checkBox5.name = "5";
         this.checkBox5.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.checkBox6 = new FCheckBox();
         this.shuxingSpr.addChild(this.checkBox6);
         this.checkBox6.x = 235;
         this.checkBox6.y = this.checkBox5.y + 19;
         this.checkBox6.name = "6";
         this.checkBox6.addEventListener(MouseEvent.CLICK,this.onCheck);
         text1 = new FTextArea();
         with(text1)
         {
            width = 285;
            height = 20;
            x = 20;
            y = 195;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanTextWords(this,"您所选定的属性");
         }
         addChild(text1);
         text1 = new FTextArea();
         with(text1)
         {
            x = 65;
            y = 224;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            mouseEnabled = false;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"本次操作消耗材料") + "</textformat>";
         }
         addChild(text1);
         this.cailiaoFt = new FTextArea();
         with(this.cailiaoFt)
         {
            x = 173;
            y = 224;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            mouseEnabled = false;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.cailiaoFt);
         this.menghuanmanzhiFt = new FTextArea();
         with(this.menghuanmanzhiFt)
         {
            x = 65;
            y = 277;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            mouseEnabled = false;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.menghuanmanzhiFt);
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 16;
         this.equipContainer.y = 42;
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.itemContainer.x = 15;
         this.itemContainer.y = 249;
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("确定重置");
         addChild(this.startBtn);
         this.startBtn.x = (325 - this.startBtn.width) / 2;
         this.startBtn.y = 309;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onStart);
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(MenghuanShuxingKa.UI_FUJIASHUXINGCHONGZHI_CHONGZHI_CLICK,"",this.selectId));
      }
      
      private function onSetEquip(param1:MouseEvent) : void
      {
         if(this.setEquipBtn.label == LanResManager.getLanCommonTextWords("放入紫装"))
         {
            this.$parent.dispatchEvent(new BaseEvent(MenghuanShuxingKa.UI_FUJIASHUXINGCHONGZHI_SETEQUIPBTN_CLICK));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(MenghuanShuxingKa.UI_FUJIASHUXINGCHONGZHI_GETEQUIPBTN_CLICK));
         }
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         var _loc2_:int = 1;
         while(_loc2_ < 7)
         {
            this["checkBox" + _loc2_].selectState = false;
            _loc2_++;
         }
         param1.target.selectState = true;
         this.menghuanmanzhiFt.htmlText = this.menghuanArr[int(param1.target.name) - 1];
         this.selectId = param1.target.name;
      }
      
      public function setCailiao(param1:Goods, param2:String, param3:Boolean, param4:int) : void
      {
         this.itemContainer.addChild(new ItemFace(param1));
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         this.itemContainer.addChild(new ItemFace(param1));
         if(param1.count > 0)
         {
            this.itemContainer.filters = [];
            this.startBtn.enabled = true;
         }
         else
         {
            this.startBtn.enabled = false;
            this.itemContainer.filters = Tools.blackWhiteFilter;
         }
         var _loc5_:String = "";
         if(param3)
         {
            this.cailiaoFt.htmlText = "<textformat leading=\'4\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param2 + "<br></font>" + param4 + "%" + "</textformat>";
         }
         else
         {
            this.cailiaoFt.htmlText = "<textformat leading=\'4\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param2 + "<br></font>" + param4 + "%" + "</textformat>";
         }
      }
      
      public function setEquip(param1:Goods) : void
      {
         this.selectId = 0;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.equipContainer.addChild(new ItemFace(param1));
         this.setEquipBtn.label = LanResManager.getLanCommonTextWords("取出紫装");
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
         this.setEquipBtn.label = LanResManager.getLanCommonTextWords("放入紫装");
         this.shuxingSpr.visible = false;
         this.menghuanmanzhiFt.htmlText = "";
         var _loc2_:int = 1;
         while(_loc2_ < 7)
         {
            this["checkBox" + _loc2_].selectState = false;
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function setShuxing(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         this.menghuanArr = new Array();
         var _loc2_:Array = param1.split(";");
         var _loc4_:int = int(_loc2_.length);
         _loc5_ = "<textformat leading=\'4\'>";
         _loc6_ = "<textformat leading=\'4\'>";
         _loc3_ = 0;
         while(_loc3_ < _loc4_ - 1)
         {
            _loc7_ = _loc2_[_loc3_].split(",");
            _loc5_ += ItemTip.fightAttr["a" + _loc7_[0]] + "  +" + _loc7_[1] + "<br>";
            this.menghuanArr.push("<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + ItemTip.fightAttr["a" + _loc7_[0]] + "  +" + _loc7_[2] + "</font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + "        " + LanResManager.getLanCommonTextWords("【梦幻满值】") + "</font>");
            if(_loc7_[3] == 1)
            {
               this["checkBox" + (_loc3_ + 1)].visible = false;
               _loc6_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("【梦幻满值】") + "</font><br>";
            }
            else
            {
               this["checkBox" + (_loc3_ + 1)].visible = true;
               _loc6_ += LanResManager.getLanTextWords(this,"最大可提升至+") + _loc7_[2] + "<br>";
            }
            _loc3_++;
         }
         _loc5_ += "</textformat>";
         _loc6_ += "</textformat>";
         this.shuxingFt.htmlText = _loc5_;
         this.shuxingMaxFt.htmlText = _loc6_;
         this.shuxingSpr.visible = true;
      }
   }
}

