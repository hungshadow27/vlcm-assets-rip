package com.tgame.shell.view.components.kungfu
{
   import com.fireice.text.FLabel;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.KungFuPanel;
   import com.tgame.shell.view.components.ta.TAStudyCanvas;
   import com.tgame.shell.view.components.ta.TAUpgradeCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class PartyKungFuCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      private var _parent:DisplayObject;
      
      private var skillContainer:Sprite;
      
      private var line2:Bitmap;
      
      private var line3:Bitmap;
      
      private var line4:Bitmap;
      
      private var line5:Bitmap;
      
      private var line6:Bitmap;
      
      private var line7:Bitmap;
      
      private var line8:Bitmap;
      
      private var line9:Bitmap;
      
      private var line11:Bitmap;
      
      private var line12:Bitmap;
      
      private var line13:Bitmap;
      
      private var line14:Bitmap;
      
      private var line15:Bitmap;
      
      private var line16:Bitmap;
      
      public var studyCanvas:StudyCanvas;
      
      private var upgradeCanvas:UpgradeCanvas;
      
      public var studyCanvas2:TAStudyCanvas;
      
      private var upgradeCanvas2:TAUpgradeCanvas;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var currShowSkill:Skill;
      
      private var currShowItem:ItemFace;
      
      public function PartyKungFuCanvas()
      {
         var fb:FLabel;
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.kungfu.party.ui";
         this.line2 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.4");
         addChild(this.line2);
         this.line2.x = 132;
         this.line2.y = 53;
         this.line2.name = "line2";
         this.line2.filters = Tools.blackWhiteFilter;
         this.line3 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.4");
         addChild(this.line3);
         this.line3.x = 132;
         this.line3.y = 172;
         this.line3.name = "line3";
         this.line3.filters = Tools.blackWhiteFilter;
         this.line4 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line4);
         this.line4.x = 30;
         this.line4.y = 26;
         this.line4.name = "line4";
         this.line4.filters = Tools.blackWhiteFilter;
         this.line5 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.2");
         addChild(this.line5);
         this.line5.x = 60;
         this.line5.y = 70;
         this.line5.name = "line5";
         this.line5.filters = Tools.blackWhiteFilter;
         this.line6 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line6);
         this.line6.x = 30;
         this.line6.y = 146;
         this.line6.name = "line6";
         this.line6.filters = Tools.blackWhiteFilter;
         this.line7 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.2");
         addChild(this.line7);
         this.line7.x = 60;
         this.line7.y = 190;
         this.line7.name = "line7";
         this.line7.filters = Tools.blackWhiteFilter;
         this.line8 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line8);
         this.line8.x = 30;
         this.line8.y = 264;
         this.line8.name = "line8";
         this.line8.filters = Tools.blackWhiteFilter;
         this.line9 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.2");
         addChild(this.line9);
         this.line9.x = 60;
         this.line9.y = 308;
         this.line9.name = "line9";
         this.line9.filters = Tools.blackWhiteFilter;
         this.line11 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.1");
         addChild(this.line11);
         this.line11.x = 203;
         this.line11.y = 50;
         this.line11.name = "line11";
         this.line11.filters = Tools.blackWhiteFilter;
         this.line12 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.1");
         addChild(this.line12);
         this.line12.x = 203;
         this.line12.y = 105;
         this.line12.name = "line12";
         this.line12.filters = Tools.blackWhiteFilter;
         this.line13 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.1");
         addChild(this.line13);
         this.line13.x = 203;
         this.line13.y = 160;
         this.line13.name = "line13";
         this.line13.filters = Tools.blackWhiteFilter;
         this.line14 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.1");
         addChild(this.line14);
         this.line14.x = 203;
         this.line14.y = 215;
         this.line14.name = "line14";
         this.line14.filters = Tools.blackWhiteFilter;
         this.line15 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.1");
         addChild(this.line15);
         this.line15.x = 203;
         this.line15.y = 270;
         this.line15.name = "line15";
         this.line15.filters = Tools.blackWhiteFilter;
         this.line16 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.1");
         addChild(this.line16);
         this.line16.x = 203;
         this.line16.y = 325;
         this.line16.name = "line16";
         this.line16.filters = Tools.blackWhiteFilter;
         this.skillContainer = new Sprite();
         addChild(this.skillContainer);
         this.skillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.skillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.skillContainer.addEventListener(MouseEvent.CLICK,this.onClick);
         this.studyCanvas = new StudyCanvas();
         addChild(this.studyCanvas);
         this.studyCanvas.x = 248;
         this.studyCanvas.y = 3;
         this.studyCanvas.visible = false;
         this.studyCanvas2 = new TAStudyCanvas();
         addChild(this.studyCanvas2);
         this.studyCanvas2.x = 248;
         this.studyCanvas2.y = 3;
         this.studyCanvas2.visible = false;
         this.upgradeCanvas = new UpgradeCanvas();
         addChild(this.upgradeCanvas);
         this.upgradeCanvas.x = 248;
         this.upgradeCanvas.y = 3;
         this.upgradeCanvas.visible = false;
         this.upgradeCanvas2 = new TAUpgradeCanvas();
         addChild(this.upgradeCanvas2);
         this.upgradeCanvas2.x = 248;
         this.upgradeCanvas2.y = 3;
         this.upgradeCanvas2.visible = false;
         fb = new FLabel();
         with(fb)
         {
            x = 264;
            y = 370;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
         }
         fb.text = LanResManager.getLanTextWords(JiangHuKungFuCanvas,0);
         addChild(fb);
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.skillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
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
               this._parent.dispatchEvent(new BaseEvent(KungFuPanel.UI_KUNGFU_SKILL_DRAG_START,"",this.currSkill));
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
         if((_loc2_.getBaseItem() as Skill).isLearn == 0)
         {
            this.studyCanvas.visible = true;
            this.upgradeCanvas.visible = false;
            this.studyCanvas.SKILL = _loc2_.getBaseItem() as Skill;
            this.studyCanvas2.visible = true;
            this.upgradeCanvas2.visible = false;
            this.studyCanvas2.SKILL = _loc2_.getBaseItem() as Skill;
            this._parent.dispatchEvent(new BaseEvent(KungFuPanel.UI_KUNGFU_SKILL_BOOK_COUNT,"",_loc2_.getBaseItem().id));
         }
         else
         {
            this.studyCanvas.visible = false;
            this.upgradeCanvas.visible = true;
            this.upgradeCanvas.SKILL = _loc2_.getBaseItem() as Skill;
            this.studyCanvas2.visible = false;
            this.upgradeCanvas2.visible = true;
            this.upgradeCanvas2.SKILL = _loc2_.getBaseItem() as Skill;
         }
         this.currShowSkill = _loc2_.getBaseItem() as Skill;
         if(this.currShowItem)
         {
            this.currShowItem.showKungFuFram = false;
         }
         _loc2_.showKungFuFram = true;
         this.currShowItem = _loc2_;
         if(GameInstance.mainCharData.isDiZi)
         {
            this.studyCanvas.visible = false;
            this.upgradeCanvas.visible = false;
         }
         else
         {
            this.studyCanvas2.visible = false;
            this.upgradeCanvas2.visible = false;
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this.studyCanvas.$parent = param1;
         this.upgradeCanvas.$parent = param1;
      }
      
      public function setSkill(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Skill = null;
         var _loc5_:ItemFace = null;
         while(this.skillContainer.numChildren > 0)
         {
            this.skillContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1[_loc2_];
            _loc5_ = new ItemFace(_loc4_);
            _loc5_.showKungFuTag();
            this.skillContainer.addChild(_loc5_);
            switch(_loc4_.res.showOrder)
            {
               case 1:
                  _loc5_.x = 125;
                  _loc5_.y = 16;
                  break;
               case 2:
                  _loc5_.x = 125;
                  _loc5_.y = 135;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 2).filters = [];
                  }
                  break;
               case 3:
                  _loc5_.x = 125;
                  _loc5_.y = 254;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 3).filters = [];
                  }
                  break;
               case 4:
                  _loc5_.x = 23;
                  _loc5_.y = 62;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 4).filters = [];
                  }
                  break;
               case 5:
                  _loc5_.x = 68;
                  _loc5_.y = 102;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 5).filters = [];
                  }
                  break;
               case 6:
                  _loc5_.x = 23;
                  _loc5_.y = 181;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 6).filters = [];
                  }
                  break;
               case 7:
                  _loc5_.x = 68;
                  _loc5_.y = 221;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 7).filters = [];
                  }
                  break;
               case 8:
                  _loc5_.x = 23;
                  _loc5_.y = 300;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 8).filters = [];
                  }
                  break;
               case 9:
                  _loc5_.x = 68;
                  _loc5_.y = 340;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 9).filters = [];
                  }
                  break;
               case 10:
                  _loc5_.x = 196;
                  _loc5_.y = 13;
                  break;
               case 11:
                  _loc5_.x = 196;
                  _loc5_.y = 68;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 11).filters = [];
                  }
                  break;
               case 12:
                  _loc5_.x = 196;
                  _loc5_.y = 123;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 12).filters = [];
                  }
                  break;
               case 13:
                  _loc5_.x = 196;
                  _loc5_.y = 178;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 13).filters = [];
                  }
                  break;
               case 14:
                  _loc5_.x = 196;
                  _loc5_.y = 233;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 14).filters = [];
                  }
                  break;
               case 15:
                  _loc5_.x = 196;
                  _loc5_.y = 288;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 15).filters = [];
                  }
                  break;
               case 16:
                  _loc5_.x = 196;
                  _loc5_.y = 343;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 16).filters = [];
                  }
            }
            if(Boolean(this.currShowSkill) && this.currShowSkill.id == _loc4_.id)
            {
               this.showSkill(_loc4_);
               _loc5_.showKungFuFram = true;
               this.currShowItem.showKungFuFram = false;
               this.currShowItem = _loc5_;
            }
            _loc2_++;
         }
         if(!this.currShowSkill)
         {
            this.showSkill(param1[0] as Skill);
            this.currShowItem = this.skillContainer.getChildAt(0) as ItemFace;
            this.currShowItem.showKungFuFram = true;
         }
      }
      
      private function showSkill(param1:Skill) : void
      {
         if(param1.isLearn == 0)
         {
            this.studyCanvas.visible = true;
            this.upgradeCanvas.visible = false;
            this.studyCanvas.SKILL = param1;
            this.studyCanvas2.visible = true;
            this.upgradeCanvas2.visible = false;
            this.studyCanvas2.SKILL = param1;
            this._parent.dispatchEvent(new BaseEvent(KungFuPanel.UI_KUNGFU_SKILL_BOOK_COUNT,"",param1.id));
         }
         else
         {
            this.studyCanvas.visible = false;
            this.upgradeCanvas.visible = true;
            this.upgradeCanvas.SKILL = param1;
            this.studyCanvas2.visible = false;
            this.upgradeCanvas2.visible = true;
            this.upgradeCanvas2.SKILL = param1;
         }
         if(GameInstance.mainCharData.isDiZi)
         {
            this.studyCanvas.visible = false;
            this.upgradeCanvas.visible = false;
         }
         else
         {
            this.studyCanvas2.visible = false;
            this.upgradeCanvas2.visible = false;
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
         return null;
      }
      
      public function refresh() : void
      {
         if(this.studyCanvas.visible)
         {
            this.studyCanvas.refresh();
         }
         if(this.upgradeCanvas.visible)
         {
            this.upgradeCanvas.refresh();
         }
         if(this.studyCanvas2.visible)
         {
            this.studyCanvas2.refresh();
         }
         if(this.upgradeCanvas2.visible)
         {
            this.upgradeCanvas2.refresh();
         }
      }
   }
}

