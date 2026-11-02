package com.tgame.shell.view.components
{
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class DiZiWuXueCanvas extends Sprite
   {
      
      private var _parent:DisplayObject;
      
      private var skillContainer:Sprite;
      
      private var skillContainer2:Sprite;
      
      private var skillContainer3:Sprite;
      
      private var line1_2:Bitmap;
      
      private var line1_3:Bitmap;
      
      private var line1_4:Bitmap;
      
      private var line1_5:Bitmap;
      
      private var line1_6:Bitmap;
      
      private var line1_7:Bitmap;
      
      private var line1_8:Bitmap;
      
      private var line1_9:Bitmap;
      
      private var line1_11:Bitmap;
      
      private var line1_12:Bitmap;
      
      private var line1_13:Bitmap;
      
      private var line1_14:Bitmap;
      
      private var line1_15:Bitmap;
      
      private var line1_16:Bitmap;
      
      private var line2_2:Bitmap;
      
      private var line2_3:Bitmap;
      
      private var line2_4:Bitmap;
      
      private var line2_5:Bitmap;
      
      private var line2_6:Bitmap;
      
      private var line2_7:Bitmap;
      
      private var line2_8:Bitmap;
      
      private var line2_9:Bitmap;
      
      private var line2_10:Bitmap;
      
      private var line2_12:Bitmap;
      
      private var line2_14:Bitmap;
      
      private var line3_1:Bitmap;
      
      private var line3_2:Bitmap;
      
      private var line3_3:Bitmap;
      
      private var line3_4:Bitmap;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var currShowSkill:Skill;
      
      private var currShowItem:ItemFace;
      
      private var qishi:int = 0;
      
      private var useContainer:Sprite;
      
      private var kuang:Bitmap;
      
      private var tarSkill:Skill;
      
      private var tarSkillItemFace:ItemFace;
      
      private var img:Bitmap;
      
      private var CjBar:ColorBar;
      
      private var skillArr1:Array;
      
      private var skillbiaoshi1:int = 0;
      
      private var skillArr2:Array;
      
      private var skillbiaoshi2:int = 0;
      
      private var skillArr3:Array;
      
      private var skillbiaoshi3:int = 0;
      
      private var diziId:int = 0;
      
      public function DiZiWuXueCanvas()
      {
         var ft1:FTextArea;
         var ft2:FTextArea;
         var ft3:FTextArea = null;
         this.skillArr1 = [];
         this.skillArr2 = [];
         this.skillArr3 = [];
         super();
         this.skillArr1 = new Array();
         this.skillArr2 = new Array();
         this.skillArr3 = new Array();
         this.line1_2 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.4");
         addChild(this.line1_2);
         this.line1_2.x = 132 + 250;
         this.line1_2.y = 53;
         this.line1_2.name = "line1_2";
         this.line1_2.filters = Tools.blackWhiteFilter;
         this.line1_3 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.4");
         addChild(this.line1_3);
         this.line1_3.x = 132 + 250;
         this.line1_3.y = 172;
         this.line1_3.name = "line1_3";
         this.line1_3.filters = Tools.blackWhiteFilter;
         this.line1_4 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line1_4);
         this.line1_4.x = 30 + 250;
         this.line1_4.y = 26;
         this.line1_4.name = "line1_4";
         this.line1_4.filters = Tools.blackWhiteFilter;
         this.line1_5 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.2");
         addChild(this.line1_5);
         this.line1_5.x = 60 + 250;
         this.line1_5.y = 70;
         this.line1_5.name = "line1_5";
         this.line1_5.filters = Tools.blackWhiteFilter;
         this.line1_6 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line1_6);
         this.line1_6.x = 30 + 250;
         this.line1_6.y = 146;
         this.line1_6.name = "line1_6";
         this.line1_6.filters = Tools.blackWhiteFilter;
         this.line1_7 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.2");
         addChild(this.line1_7);
         this.line1_7.x = 60 + 250;
         this.line1_7.y = 190;
         this.line1_7.name = "line1_7";
         this.line1_7.filters = Tools.blackWhiteFilter;
         this.line1_8 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line1_8);
         this.line1_8.x = 30 + 250;
         this.line1_8.y = 264;
         this.line1_8.name = "line1_8";
         this.line1_8.filters = Tools.blackWhiteFilter;
         this.line1_9 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.2");
         addChild(this.line1_9);
         this.line1_9.x = 60 + 250;
         this.line1_9.y = 308;
         this.line1_9.name = "line1_9";
         this.line1_9.filters = Tools.blackWhiteFilter;
         this.line1_11 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.1");
         addChild(this.line1_11);
         this.line1_11.x = 203 + 250;
         this.line1_11.y = 50;
         this.line1_11.name = "line1_11";
         this.line1_11.filters = Tools.blackWhiteFilter;
         this.line1_12 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.1");
         addChild(this.line1_12);
         this.line1_12.x = 203 + 250;
         this.line1_12.y = 105;
         this.line1_12.name = "line1_12";
         this.line1_12.filters = Tools.blackWhiteFilter;
         this.line1_13 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.1");
         addChild(this.line1_13);
         this.line1_13.x = 203 + 250;
         this.line1_13.y = 160;
         this.line1_13.name = "line1_13";
         this.line1_13.filters = Tools.blackWhiteFilter;
         this.line1_14 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.1");
         addChild(this.line1_14);
         this.line1_14.x = 203 + 250;
         this.line1_14.y = 215;
         this.line1_14.name = "line1_14";
         this.line1_14.filters = Tools.blackWhiteFilter;
         this.line1_15 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.1");
         addChild(this.line1_15);
         this.line1_15.x = 203 + 250;
         this.line1_15.y = 270;
         this.line1_15.name = "line1_15";
         this.line1_15.filters = Tools.blackWhiteFilter;
         this.line1_16 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.1");
         addChild(this.line1_16);
         this.line1_16.x = 203 + 250;
         this.line1_16.y = 325;
         this.line1_16.name = "line1_16";
         this.line1_16.filters = Tools.blackWhiteFilter;
         this.line2_2 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         addChild(this.line2_2);
         this.line2_2.x = 132;
         this.line2_2.y = 50;
         this.line2_2.name = "line2_2";
         this.line2_2.filters = Tools.blackWhiteFilter;
         this.line2_3 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         addChild(this.line2_3);
         this.line2_3.x = 132;
         this.line2_3.y = 121;
         this.line2_3.name = "line2_3";
         this.line2_3.filters = Tools.blackWhiteFilter;
         this.line2_4 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         addChild(this.line2_4);
         this.line2_4.x = 132;
         this.line2_4.y = 192;
         this.line2_4.name = "line2_4";
         this.line2_4.filters = Tools.blackWhiteFilter;
         this.line2_5 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         addChild(this.line2_5);
         this.line2_5.x = 132;
         this.line2_5.y = 263;
         this.line2_5.name = "line2_5";
         this.line2_5.filters = Tools.blackWhiteFilter;
         this.line2_6 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line2_6);
         this.line2_6.x = 31;
         this.line2_6.y = 24;
         this.line2_6.name = "line2_6";
         this.line2_6.filters = Tools.blackWhiteFilter;
         this.line2_7 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line2_7);
         this.line2_7.x = 31;
         this.line2_7.y = 95;
         this.line2_7.name = "line2_7";
         this.line2_7.filters = Tools.blackWhiteFilter;
         this.line2_8 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line2_8);
         this.line2_8.x = 31;
         this.line2_8.y = 166;
         this.line2_8.name = "line2_8";
         this.line2_8.filters = Tools.blackWhiteFilter;
         this.line2_9 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line2_9);
         this.line2_9.x = 31;
         this.line2_9.y = 237;
         this.line2_9.name = "line2_9";
         this.line2_9.filters = Tools.blackWhiteFilter;
         this.line2_10 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line2_10);
         this.line2_10.x = 31;
         this.line2_10.y = 308;
         this.line2_10.name = "line2_10";
         this.line2_10.filters = Tools.blackWhiteFilter;
         this.line2_12 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         addChild(this.line2_12);
         this.line2_12.x = 203;
         this.line2_12.y = 85;
         this.line2_12.name = "line2_12";
         this.line2_12.filters = Tools.blackWhiteFilter;
         this.line2_14 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         addChild(this.line2_14);
         this.line2_14.x = 203;
         this.line2_14.y = 227;
         this.line2_14.name = "line2_14";
         this.line2_14.filters = Tools.blackWhiteFilter;
         this.line3_1 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line3_1);
         this.line3_1.x = 675;
         this.line3_1.y = 38;
         this.line3_1.name = "line3_1";
         this.line3_1.rotationY = 180;
         this.line3_1.filters = Tools.blackWhiteFilter;
         this.line3_2 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line3_2);
         this.line3_2.x = 675;
         this.line3_2.y = 124;
         this.line3_2.name = "line3_2";
         this.line3_2.rotationY = 180;
         this.line3_2.filters = Tools.blackWhiteFilter;
         this.line3_3 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line3_3);
         this.line3_3.x = 675;
         this.line3_3.y = 210;
         this.line3_3.name = "line3_3";
         this.line3_3.rotationY = 180;
         this.line3_3.filters = Tools.blackWhiteFilter;
         this.line3_4 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line3_4);
         this.line3_4.x = 675;
         this.line3_4.y = 292;
         this.line3_4.name = "line3_4";
         this.line3_4.rotationY = 180;
         this.line3_4.filters = Tools.blackWhiteFilter;
         this.skillContainer = new Sprite();
         this.skillContainer.x = -2;
         addChild(this.skillContainer);
         this.skillContainer.addEventListener(MouseEvent.CLICK,this.onClick);
         this.skillContainer2 = new Sprite();
         this.skillContainer2.x = 3;
         addChild(this.skillContainer2);
         this.skillContainer2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.skillContainer3 = new Sprite();
         this.skillContainer3.x = -2;
         addChild(this.skillContainer3);
         this.skillContainer3.addEventListener(MouseEvent.CLICK,this.onClick);
         ft1 = new FTextArea();
         ft1.multiline = true;
         ft1.filters = StaticValue.filter;
         ft1.width = 100;
         ft1.height = 110;
         ft1.x = 70;
         ft1.y = 400;
         ft1.textColor = StaticValue.ORANGE;
         addChild(ft1);
         ft1.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前内功经验:") + "</font>";
         ft2 = new FTextArea();
         ft2.multiline = true;
         ft2.filters = StaticValue.filter;
         ft2.width = 350;
         ft2.height = 110;
         ft2.x = 350;
         ft2.y = 392;
         ft2.textColor = StaticValue.ORANGE;
         addChild(ft2);
         ft2.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "" + "</font>";
         ft3 = new FTextArea();
         ft3.multiline = true;
         ft3.filters = StaticValue.filter;
         ft3.width = 100;
         ft3.height = 30;
         ft3.x = 10;
         ft3.y = 5;
         ft3.textColor = StaticValue.ORANGE;
         addChild(ft3);
         ft3.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("江湖绝学") + "</font>";
         ft3 = new FTextArea();
         ft3.multiline = true;
         ft3.filters = StaticValue.filter;
         ft3.x = 255;
         ft3.y = 5;
         ft3.height = 30;
         addChild(ft3);
         ft3.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("门派绝学") + "</font>";
         ft3 = new FTextArea();
         ft3.multiline = true;
         ft3.filters = StaticValue.filter;
         ft3.x = 500;
         ft3.y = 5;
         ft3.height = 25;
         addChild(ft3);
         ft3.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("帮派绝学") + "</font>";
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuang.x = 11;
         this.kuang.y = 430;
         this.img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(this.img);
         this.img.width = 170;
         this.img.x = 70;
         this.img.y = 420;
         this.CjBar = new ColorBar(5,132,11);
         addChild(this.CjBar);
         this.CjBar.x = 89;
         this.CjBar.y = 423;
         this.CjBar.setValue(0,0);
         this.useContainer = new Sprite();
         with(this.useContainer)
         {
            x = 332;
            y = 413;
         }
         addChild(this.useContainer);
      }
      
      public function setSkil(param1:int, param2:Array, param3:Array, param4:Array) : void
      {
         while(this.skillContainer.numChildren > 0)
         {
            this.skillContainer.removeChildAt(0);
         }
         while(this.skillContainer2.numChildren > 0)
         {
            this.skillContainer2.removeChildAt(0);
         }
         while(this.skillContainer3.numChildren > 0)
         {
            this.skillContainer3.removeChildAt(0);
         }
         this.setSkill1(param2);
         this.setSkill2(param3);
         this.setSkill3(param4);
         this.diziId = param1;
      }
      
      private function skllllll(param1:MouseEvent) : void
      {
         var _loc4_:Object = null;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < 10)
         {
            _loc4_ = new Object();
            _loc4_.id = 50001 + _loc3_;
            _loc4_.learn = true;
            _loc4_.dengji = _loc3_;
            _loc4_.nowExp = _loc3_;
            _loc4_.maxExp = 10;
            _loc2_.push(_loc4_);
            _loc3_++;
         }
         this.setSkill2(_loc2_);
      }
      
      private function onMouseDown1(param1:MouseEvent) : void
      {
         this.useContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove1);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onMouseMove1(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.useContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove1);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            this._parent.dispatchEvent(new BaseEvent(ChuanGongWuXuePanel.UI_CHUANGONGWUXUE_DIZI_YICHU,"",this.currSkill));
            this.useContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove1);
         }
      }
      
      private function showMenu(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.useContainer.mouseX > 0 && this.useContainer.mouseX < 41)
         {
            _loc2_ = 1;
         }
         else if(this.useContainer.mouseX > 41 && this.useContainer.mouseX < 82)
         {
            _loc2_ = 2;
         }
         else if(this.useContainer.mouseX > 82 && this.useContainer.mouseX < 123)
         {
            _loc2_ = 3;
         }
         else if(this.useContainer.mouseX > 123 && this.useContainer.mouseX < 164)
         {
            _loc2_ = 4;
         }
         else if(this.useContainer.mouseX > 164 && this.useContainer.mouseX < 205)
         {
            _loc2_ = 5;
         }
         else if(this.useContainer.mouseX > 164 && this.useContainer.mouseX < 205)
         {
            _loc2_ = 6;
         }
         else if(this.useContainer.mouseX > 164 && this.useContainer.mouseX < 205)
         {
            _loc2_ = 7;
         }
         else if(this.useContainer.mouseX > 164 && this.useContainer.mouseX < 205)
         {
            _loc2_ = 8;
         }
         else if(this.useContainer.mouseX > 164 && this.useContainer.mouseX < 205)
         {
            _loc2_ = 9;
         }
         else if(this.useContainer.mouseX > 164 && this.useContainer.mouseX < 205)
         {
            _loc2_ = 10;
         }
         if(_loc2_ == 0)
         {
            return;
         }
         this._parent.dispatchEvent(new BaseEvent(ChuanGongWuXuePanel.UI_CHUANGONGWUXUE_DIZI_DRAGUP,"",[this.diziId,this.currSkill,_loc2_]));
         this.useContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove1);
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.skillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this._parent.dispatchEvent(new BaseEvent(ChuanGongWuXuePanel.UI_CHUANGONGWUXUE_DIZI_DRAGUP_1,"",this.currSkill));
            }
            this.skillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.skillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = param1.target as ItemFace;
         this.currShowSkill = _loc2_.getBaseItem() as Skill;
         if(this.currShowItem)
         {
            this.currShowItem.showKungFuFram = false;
         }
         _loc2_.showKungFuFram = true;
         this.currShowItem = _loc2_;
         this.tarSkill = _loc2_.getBaseItem() as Skill;
         if(this.tarSkillItemFace)
         {
            if(this.tarSkillItemFace.parent)
            {
               this.tarSkillItemFace.parent.removeChild(this.tarSkillItemFace);
            }
         }
         this.tarSkillItemFace = new ItemFace(this.tarSkill);
         this.tarSkillItemFace.showKungFuTag();
         this.tarSkillItemFace.setShowCount(true);
         this.tarSkillItemFace.x = 26;
         this.tarSkillItemFace.y = 409;
         addChild(this.tarSkillItemFace);
         this.CjBar.setValue(this.tarSkill.shulianCurrent,this.tarSkill.shulianTotal);
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function setSkill1(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Skill = null;
         var _loc5_:ItemFace = null;
         this.skillArr1 = param1;
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new Skill(param1[_loc2_].id);
            _loc4_.level = param1[_loc2_].dengji;
            _loc4_.levelAppend = param1[_loc2_].jiacheng;
            _loc4_.shulianCurrent = param1[_loc2_].nowExp;
            _loc4_.shulianTotal = param1[_loc2_].maxExp;
            _loc4_.isLearn = param1[_loc2_].learn;
            _loc5_ = new ItemFace(_loc4_);
            _loc5_.showKungFuTag();
            this.skillContainer.addChild(_loc5_);
            switch(_loc4_.res.showOrder)
            {
               case 1:
                  _loc5_.x = 125 + 250;
                  _loc5_.y = 16;
                  break;
               case 2:
                  _loc5_.x = 125 + 250;
                  _loc5_.y = 135;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line1_" + 2).filters = [];
                  }
                  break;
               case 3:
                  _loc5_.x = 125 + 250;
                  _loc5_.y = 254;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line1_" + 3).filters = [];
                  }
                  break;
               case 4:
                  _loc5_.x = 23 + 250;
                  _loc5_.y = 62;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line1_" + 4).filters = [];
                  }
                  break;
               case 5:
                  _loc5_.x = 68 + 250;
                  _loc5_.y = 102;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line1_" + 5).filters = [];
                  }
                  break;
               case 6:
                  _loc5_.x = 23 + 250;
                  _loc5_.y = 181;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line1_" + 6).filters = [];
                  }
                  break;
               case 7:
                  _loc5_.x = 68 + 250;
                  _loc5_.y = 221;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line1_" + 7).filters = [];
                  }
                  break;
               case 8:
                  _loc5_.x = 23 + 250;
                  _loc5_.y = 300;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line1_" + 8).filters = [];
                  }
                  break;
               case 9:
                  _loc5_.x = 68 + 250;
                  _loc5_.y = 340;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line1_" + 9).filters = [];
                  }
                  break;
               case 10:
                  _loc5_.x = 196 + 250;
                  _loc5_.y = 13;
                  break;
               case 11:
                  _loc5_.x = 196 + 250;
                  _loc5_.y = 68;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line1_" + 11).filters = [];
                  }
                  break;
               case 12:
                  _loc5_.x = 196 + 250;
                  _loc5_.y = 123;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line1_" + 12).filters = [];
                  }
                  break;
               case 13:
                  _loc5_.x = 196 + 250;
                  _loc5_.y = 178;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line1_" + 13).filters = [];
                  }
                  break;
               case 14:
                  _loc5_.x = 196 + 250;
                  _loc5_.y = 233;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line1_" + 14).filters = [];
                  }
                  break;
               case 15:
                  _loc5_.x = 196 + 250;
                  _loc5_.y = 288;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line1_" + 15).filters = [];
                  }
                  break;
               case 16:
                  _loc5_.x = 196 + 250;
                  _loc5_.y = 343;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line1_" + 16).filters = [];
                  }
            }
            _loc2_++;
         }
      }
      
      public function setSkill2(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Skill = null;
         var _loc5_:ItemFace = null;
         this.skillArr2 = param1;
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new Skill(param1[_loc2_].id);
            _loc4_.level = param1[_loc2_].dengji;
            _loc4_.levelAppend = param1[_loc2_].jiacheng;
            _loc4_.shulianCurrent = param1[_loc2_].nowExp;
            _loc4_.shulianTotal = param1[_loc2_].maxExp;
            _loc4_.isLearn = param1[_loc2_].learn;
            _loc5_ = new ItemFace(_loc4_);
            _loc5_.showKungFuTag();
            this.skillContainer2.addChild(_loc5_);
            switch(_loc4_.res.showOrder)
            {
               case 1:
                  _loc5_.x = 125;
                  _loc5_.y = 13;
                  this.skillbiaoshi2 = 0;
                  break;
               case 2:
                  _loc5_.x = 125;
                  _loc5_.y = 84;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line2_" + 2).filters = [];
                  }
                  this.skillbiaoshi2 = 1;
                  break;
               case 3:
                  _loc5_.x = 125;
                  _loc5_.y = 155;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line2_" + 3).filters = [];
                  }
                  this.skillbiaoshi2 = 2;
                  break;
               case 4:
                  _loc5_.x = 125;
                  _loc5_.y = 226;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line2_" + 4).filters = [];
                  }
                  this.skillbiaoshi2 = 3;
                  break;
               case 5:
                  _loc5_.x = 125;
                  _loc5_.y = 297;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line2_" + 5).filters = [];
                  }
                  this.skillbiaoshi2 = 4;
                  break;
               case 6:
                  _loc5_.x = 23;
                  _loc5_.y = 59;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line2_" + 6).filters = [];
                  }
                  this.skillbiaoshi2 = 5;
                  break;
               case 7:
                  _loc5_.x = 23;
                  _loc5_.y = 130;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line2_" + 7).filters = [];
                  }
                  this.skillbiaoshi2 = 6;
                  break;
               case 8:
                  _loc5_.x = 23;
                  _loc5_.y = 201;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line2_" + 8).filters = [];
                  }
                  this.skillbiaoshi2 = 7;
                  break;
               case 9:
                  _loc5_.x = 23;
                  _loc5_.y = 272;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line2_" + 9).filters = [];
                  }
                  this.skillbiaoshi2 = 8;
                  break;
               case 10:
                  _loc5_.x = 23;
                  _loc5_.y = 343;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line2_" + 10).filters = [];
                  }
                  this.skillbiaoshi2 = 9;
                  break;
               case 11:
                  _loc5_.x = 196;
                  _loc5_.y = 48;
                  this.skillbiaoshi2 = 10;
                  break;
               case 12:
                  _loc5_.x = 196;
                  _loc5_.y = 120;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line2_" + 12).filters = [];
                  }
                  break;
               case 13:
                  _loc5_.x = 196;
                  _loc5_.y = 190;
                  break;
               case 14:
                  _loc5_.x = 196;
                  _loc5_.y = 262;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line2_" + 14).filters = [];
                  }
            }
            _loc2_++;
         }
      }
      
      public function setSkill3(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Skill = null;
         var _loc5_:ItemFace = null;
         this.skillArr3 = param1;
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new Skill(param1[_loc2_].id);
            _loc4_.level = param1[_loc2_].dengji;
            _loc4_.levelAppend = param1[_loc2_].jiacheng;
            _loc4_.shulianCurrent = param1[_loc2_].nowExp;
            _loc4_.shulianTotal = param1[_loc2_].maxExp;
            _loc4_.isLearn = param1[_loc2_].learn;
            _loc5_ = new ItemFace(_loc4_);
            _loc5_.showKungFuTag();
            this.skillContainer3.addChild(_loc5_);
            switch(_loc4_.res.showOrder)
            {
               case 1:
                  _loc5_.x = 548;
                  _loc5_.y = 26;
                  break;
               case 2:
                  _loc5_.x = 83 + 500;
                  _loc5_.y = 32;
                  break;
               case 3:
                  _loc5_.x = 132 + 500;
                  _loc5_.y = 32;
                  break;
               case 4:
                  _loc5_.x = 181 + 500;
                  _loc5_.y = 32;
                  break;
               case 5:
                  _loc5_.x = 34 + 500;
                  _loc5_.y = 72;
                  break;
               case 6:
                  _loc5_.x = 83 + 500;
                  _loc5_.y = 72;
                  break;
               case 7:
                  _loc5_.x = 132 + 500;
                  _loc5_.y = 72;
                  break;
               case 8:
                  _loc5_.x = 181 + 500;
                  _loc5_.y = 72;
                  break;
               case 9:
                  _loc5_.x = 548;
                  _loc5_.y = 26;
                  _loc5_.setShowCount(true);
                  break;
               case 10:
                  _loc5_.x = 548;
                  _loc5_.y = 112;
                  _loc5_.setShowCount(true);
                  break;
               case 11:
                  _loc5_.x = 548;
                  _loc5_.y = 198;
                  _loc5_.setShowCount(true);
                  break;
               case 12:
                  _loc5_.x = 548;
                  _loc5_.y = 284;
                  _loc5_.setShowCount(true);
                  break;
               case 13:
                  _loc5_.x = 651;
                  _loc5_.y = 74;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line3_" + 1).filters = [];
                  }
                  _loc5_.setShowCount(true);
                  break;
               case 14:
                  _loc5_.x = 651;
                  _loc5_.y = 160;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line3_" + 2).filters = [];
                  }
                  _loc5_.setShowCount(true);
                  break;
               case 15:
                  _loc5_.x = 651;
                  _loc5_.y = 246;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line3_" + 3).filters = [];
                  }
                  _loc5_.setShowCount(true);
                  break;
               case 16:
                  _loc5_.x = 651;
                  _loc5_.y = 332;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line3_" + 4).filters = [];
                  }
                  _loc5_.setShowCount(true);
                  break;
               case 17:
                  _loc5_.x = 33 + 500;
                  _loc5_.y = 329;
                  break;
               case 18:
                  _loc5_.x = 82 + 500;
                  _loc5_.y = 329;
                  break;
               case 19:
                  _loc5_.x = 131 + 500;
                  _loc5_.y = 329;
                  break;
               case 20:
                  _loc5_.x = 180 + 500;
                  _loc5_.y = 329;
            }
            _loc2_++;
         }
      }
      
      public function setShiYongSkill(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Skill = null;
         var _loc6_:Goods = null;
         while(this.useContainer.numChildren > 0)
         {
            this.useContainer.removeChildAt(0);
         }
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_].type == 1)
            {
               _loc4_ = 0;
               while(_loc4_ < this.skillArr1.length)
               {
                  if(param1[_loc3_].id == this.skillArr1[_loc4_].id)
                  {
                     _loc5_ = new Skill(this.skillArr1[_loc4_].id);
                     _loc5_.level = this.skillArr1[_loc4_].dengji;
                     _loc5_.levelAppend = this.skillArr1[_loc4_].jiacheng;
                     _loc5_.shulianCurrent = this.skillArr1[_loc4_].nowExp;
                     _loc5_.shulianTotal = this.skillArr1[_loc4_].maxExp;
                     _loc5_.isLearn = this.skillArr1[_loc4_].learn;
                     break;
                  }
                  _loc4_++;
               }
               _loc4_ = 0;
               while(_loc4_ < this.skillArr2.length)
               {
                  if(param1[_loc3_].id == this.skillArr2[_loc4_].id)
                  {
                     _loc5_ = new Skill(this.skillArr2[_loc4_].id);
                     _loc5_.level = this.skillArr2[_loc4_].dengji;
                     _loc5_.levelAppend = this.skillArr2[_loc4_].jiacheng;
                     _loc5_.shulianCurrent = this.skillArr2[_loc4_].nowExp;
                     _loc5_.shulianTotal = this.skillArr2[_loc4_].maxExp;
                     _loc5_.isLearn = this.skillArr2[_loc4_].learn;
                     break;
                  }
                  _loc4_++;
               }
               _loc4_ = 0;
               while(_loc4_ < this.skillArr3.length)
               {
                  if(param1[_loc3_].id == this.skillArr3[_loc4_].id)
                  {
                     _loc5_ = new Skill(this.skillArr3[_loc4_].id);
                     _loc5_.level = this.skillArr3[_loc4_].dengji;
                     _loc5_.levelAppend = this.skillArr3[_loc4_].jiacheng;
                     _loc5_.shulianCurrent = this.skillArr3[_loc4_].nowExp;
                     _loc5_.shulianTotal = this.skillArr3[_loc4_].maxExp;
                     _loc5_.isLearn = this.skillArr3[_loc4_].learn;
                     break;
                  }
                  _loc4_++;
               }
               if(_loc5_ == null)
               {
                  _loc5_ = new Skill(param1[_loc3_].id);
                  _loc5_.isLearn = 1;
               }
               _loc2_ = new ItemFace(_loc5_);
               _loc2_.showKungFuTag();
               _loc2_.setShowCount(true);
               _loc2_.x = _loc3_ * 40;
               _loc2_.y = 0;
               this.useContainer.addChild(_loc2_);
            }
            else if(param1[_loc3_].type == 2)
            {
               _loc6_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param1[_loc3_].id,true);
               _loc2_ = new ItemFace(_loc6_);
               _loc2_.showKungFuTag();
               _loc2_.setShowCount(true);
               _loc2_.x = _loc3_ * 40;
               _loc2_.y = 0;
               this.useContainer.addChild(_loc2_);
            }
            _loc3_++;
         }
      }
      
      public function getKungFuBySkill(param1:Skill) : ItemFace
      {
         var _loc2_:int = 0;
         var _loc4_:Skill = null;
         var _loc3_:int = this.skillContainer.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = (this.skillContainer.getChildAt(_loc2_) as ItemFace).getBaseItem() as Skill;
            if(_loc4_.id == param1.id)
            {
               return this.skillContainer.getChildAt(_loc2_) as ItemFace;
            }
            _loc2_++;
         }
         _loc3_ = this.skillContainer2.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = (this.skillContainer2.getChildAt(_loc2_) as ItemFace).getBaseItem() as Skill;
            if(_loc4_.id == param1.id)
            {
               return this.skillContainer2.getChildAt(_loc2_) as ItemFace;
            }
            _loc2_++;
         }
         _loc3_ = this.skillContainer3.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = (this.skillContainer3.getChildAt(_loc2_) as ItemFace).getBaseItem() as Skill;
            if(_loc4_.id == param1.id)
            {
               return this.skillContainer3.getChildAt(_loc2_) as ItemFace;
            }
            _loc2_++;
         }
         return null;
      }
   }
}

