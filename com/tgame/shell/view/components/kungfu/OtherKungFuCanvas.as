package com.tgame.shell.view.components.kungfu
{
   import com.fireice.text.FLabel;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.OtherConst;
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
   
   public class OtherKungFuCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      private var _parent:DisplayObject;
      
      private var skillContainer:Sprite;
      
      public var studyCanvas:StudyCanvas;
      
      private var upgradeCanvas:UpgradeCanvas;
      
      private var otherCanvas:OtherCanvas;
      
      public var studyCanvas2:TAStudyCanvas;
      
      private var upgradeCanvas2:TAUpgradeCanvas;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var currShowSkill:Skill;
      
      private var currShowItem:ItemFace;
      
      private var line1:Bitmap;
      
      private var line2:Bitmap;
      
      private var line3:Bitmap;
      
      private var line4:Bitmap;
      
      public function OtherKungFuCanvas()
      {
         var img:Bitmap;
         var fb:FLabel;
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.kungfu.other.ui";
         img = StaticValue.getBitmapByClassName("ui.kungfu.other.title1");
         addChild(img);
         img.x = 13;
         img.y = 13;
         img = StaticValue.getBitmapByClassName("ui.kungfu.other.title3");
         addChild(img);
         img.x = 13;
         img.y = 137;
         img = StaticValue.getBitmapByClassName("ui.kungfu.other.title4");
         addChild(img);
         img.x = 13;
         img.y = 309;
         this.line1 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         addChild(this.line1);
         this.line1.x = 41;
         this.line1.y = 205;
         this.line1.name = "line1";
         this.line1.filters = Tools.blackWhiteFilter;
         this.line2 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         addChild(this.line2);
         this.line2.x = 91;
         this.line2.y = 205;
         this.line2.name = "line2";
         this.line2.filters = Tools.blackWhiteFilter;
         this.line3 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         addChild(this.line3);
         this.line3.x = 140;
         this.line3.y = 205;
         this.line3.name = "line3";
         this.line3.filters = Tools.blackWhiteFilter;
         this.line4 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         addChild(this.line4);
         this.line4.x = 189;
         this.line4.y = 205;
         this.line4.name = "line4";
         this.line4.filters = Tools.blackWhiteFilter;
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
         this.otherCanvas = new OtherCanvas();
         addChild(this.otherCanvas);
         this.otherCanvas.x = 248;
         this.otherCanvas.y = 3;
         this.otherCanvas.visible = false;
         fb = new FLabel();
         with(fb)
         {
            x = 264;
            y = 370;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(JiangHuKungFuCanvas,0);
         }
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
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
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
         if((_loc2_.getBaseItem() as Skill).res.wugong_type == 3 || (_loc2_.getBaseItem() as Skill).id == OtherConst.DEFAULT_SKILL_ID)
         {
            this.otherCanvas.visible = true;
            this.studyCanvas.visible = false;
            this.upgradeCanvas.visible = false;
            this.otherCanvas.SKILL = _loc2_.getBaseItem() as Skill;
            this.studyCanvas2.visible = false;
            this.upgradeCanvas2.visible = false;
         }
         else if((_loc2_.getBaseItem() as Skill).isLearn == 0)
         {
            this.studyCanvas.visible = true;
            this.upgradeCanvas.visible = false;
            this.otherCanvas.visible = false;
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
            this.otherCanvas.visible = false;
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
      
      private function showSkill(param1:Skill) : void
      {
         if(param1.res.wugong_type == 3 || param1.id == OtherConst.DEFAULT_SKILL_ID)
         {
            this.otherCanvas.visible = true;
            this.studyCanvas.visible = false;
            this.upgradeCanvas.visible = false;
            this.otherCanvas.SKILL = param1;
            this.studyCanvas2.visible = false;
            this.upgradeCanvas2.visible = false;
         }
         else if(param1.isLearn == 0)
         {
            this.studyCanvas.visible = true;
            this.upgradeCanvas.visible = false;
            this.otherCanvas.visible = false;
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
            this.otherCanvas.visible = false;
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
            _loc5_.setShowCount(false);
            _loc5_.showKungFuTag();
            this.skillContainer.addChild(_loc5_);
            switch(_loc4_.res.showOrder)
            {
               case 1:
                  _loc5_.x = 34;
                  _loc5_.y = 32;
                  break;
               case 2:
                  _loc5_.x = 83;
                  _loc5_.y = 32;
                  break;
               case 3:
                  _loc5_.x = 132;
                  _loc5_.y = 32;
                  break;
               case 4:
                  _loc5_.x = 181;
                  _loc5_.y = 32;
                  break;
               case 5:
                  _loc5_.x = 34;
                  _loc5_.y = 72;
                  break;
               case 6:
                  _loc5_.x = 83;
                  _loc5_.y = 72;
                  break;
               case 7:
                  _loc5_.x = 132;
                  _loc5_.y = 72;
                  break;
               case 8:
                  _loc5_.x = 181;
                  _loc5_.y = 72;
                  break;
               case 9:
                  _loc5_.x = 34;
                  _loc5_.y = 169;
                  _loc5_.setShowCount(true);
                  break;
               case 10:
                  _loc5_.x = 83;
                  _loc5_.y = 169;
                  _loc5_.setShowCount(true);
                  break;
               case 11:
                  _loc5_.x = 132;
                  _loc5_.y = 169;
                  _loc5_.setShowCount(true);
                  break;
               case 12:
                  _loc5_.x = 181;
                  _loc5_.y = 169;
                  _loc5_.setShowCount(true);
                  break;
               case 13:
                  _loc5_.x = 34;
                  _loc5_.y = 243;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 1).filters = [];
                  }
                  _loc5_.setShowCount(true);
                  break;
               case 14:
                  _loc5_.x = 83;
                  _loc5_.y = 243;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 2).filters = [];
                  }
                  _loc5_.setShowCount(true);
                  break;
               case 15:
                  _loc5_.x = 132;
                  _loc5_.y = 243;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 3).filters = [];
                  }
                  _loc5_.setShowCount(true);
                  break;
               case 16:
                  _loc5_.x = 181;
                  _loc5_.y = 243;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 4).filters = [];
                  }
                  _loc5_.setShowCount(true);
                  break;
               case 17:
                  _loc5_.x = 33;
                  _loc5_.y = 329;
                  break;
               case 18:
                  _loc5_.x = 82;
                  _loc5_.y = 329;
                  break;
               case 19:
                  _loc5_.x = 131;
                  _loc5_.y = 329;
                  break;
               case 20:
                  _loc5_.x = 180;
                  _loc5_.y = 329;
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
         if(this.otherCanvas.visible)
         {
            this.otherCanvas.refresh();
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

