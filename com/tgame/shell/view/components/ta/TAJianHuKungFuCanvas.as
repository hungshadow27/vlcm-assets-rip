package com.tgame.shell.view.components.ta
{
   import com.fireice.util.Tools;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Skill;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TAJianHuKungFuCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      private var skillContainer:Sprite;
      
      private var line2:Bitmap;
      
      private var line3:Bitmap;
      
      private var line4:Bitmap;
      
      private var line5:Bitmap;
      
      private var line6:Bitmap;
      
      private var line7:Bitmap;
      
      private var line8:Bitmap;
      
      private var line9:Bitmap;
      
      private var line10:Bitmap;
      
      private var line12:Bitmap;
      
      private var line14:Bitmap;
      
      public var studyCanvas:TAStudyCanvas;
      
      private var upgradeCanvas:TAUpgradeCanvas;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var currShowSkill:Skill;
      
      private var currShowItem:ItemFace;
      
      public function TAJianHuKungFuCanvas()
      {
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.kungfu.jianghu.ui";
         this.line2 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         addChild(this.line2);
         this.line2.x = 132;
         this.line2.y = 50;
         this.line2.name = "line2";
         this.line2.filters = Tools.blackWhiteFilter;
         this.line3 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         addChild(this.line3);
         this.line3.x = 132;
         this.line3.y = 121;
         this.line3.name = "line3";
         this.line3.filters = Tools.blackWhiteFilter;
         this.line4 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         addChild(this.line4);
         this.line4.x = 132;
         this.line4.y = 192;
         this.line4.name = "line4";
         this.line4.filters = Tools.blackWhiteFilter;
         this.line5 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         addChild(this.line5);
         this.line5.x = 132;
         this.line5.y = 263;
         this.line5.name = "line5";
         this.line5.filters = Tools.blackWhiteFilter;
         this.line6 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line6);
         this.line6.x = 31;
         this.line6.y = 24;
         this.line6.name = "line6";
         this.line6.filters = Tools.blackWhiteFilter;
         this.line7 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line7);
         this.line7.x = 31;
         this.line7.y = 95;
         this.line7.name = "line7";
         this.line7.filters = Tools.blackWhiteFilter;
         this.line8 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line8);
         this.line8.x = 31;
         this.line8.y = 166;
         this.line8.name = "line8";
         this.line8.filters = Tools.blackWhiteFilter;
         this.line9 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line9);
         this.line9.x = 31;
         this.line9.y = 237;
         this.line9.name = "line9";
         this.line9.filters = Tools.blackWhiteFilter;
         this.line10 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.5");
         addChild(this.line10);
         this.line10.x = 31;
         this.line10.y = 308;
         this.line10.name = "line10";
         this.line10.filters = Tools.blackWhiteFilter;
         this.line12 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         addChild(this.line12);
         this.line12.x = 203;
         this.line12.y = 85;
         this.line12.name = "line12";
         this.line12.filters = Tools.blackWhiteFilter;
         this.line14 = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         addChild(this.line14);
         this.line14.x = 203;
         this.line14.y = 227;
         this.line14.name = "line14";
         this.line14.filters = Tools.blackWhiteFilter;
         this.skillContainer = new Sprite();
         addChild(this.skillContainer);
         this.studyCanvas = new TAStudyCanvas();
         addChild(this.studyCanvas);
         this.studyCanvas.x = 248;
         this.studyCanvas.y = 3;
         this.studyCanvas.visible = false;
         this.upgradeCanvas = new TAUpgradeCanvas();
         addChild(this.upgradeCanvas);
         this.upgradeCanvas.x = 248;
         this.upgradeCanvas.y = 3;
         this.upgradeCanvas.visible = false;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = param1.target as ItemFace;
         if((_loc2_.getBaseItem() as Skill).isLearn == 0)
         {
            this.studyCanvas.visible = true;
            this.upgradeCanvas.visible = false;
            this.studyCanvas.SKILL = _loc2_.getBaseItem() as Skill;
         }
         else
         {
            this.studyCanvas.visible = false;
            this.upgradeCanvas.visible = true;
            this.upgradeCanvas.SKILL = _loc2_.getBaseItem() as Skill;
         }
         this.currShowSkill = _loc2_.getBaseItem() as Skill;
         if(this.currShowItem)
         {
            this.currShowItem.showKungFuFram = false;
         }
         _loc2_.showKungFuFram = true;
         this.currShowItem = _loc2_;
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
                  _loc5_.y = 13;
                  break;
               case 2:
                  _loc5_.x = 125;
                  _loc5_.y = 84;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 2).filters = [];
                  }
                  break;
               case 3:
                  _loc5_.x = 125;
                  _loc5_.y = 155;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 3).filters = [];
                  }
                  break;
               case 4:
                  _loc5_.x = 125;
                  _loc5_.y = 226;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 4).filters = [];
                  }
                  break;
               case 5:
                  _loc5_.x = 125;
                  _loc5_.y = 297;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 5).filters = [];
                  }
                  break;
               case 6:
                  _loc5_.x = 23;
                  _loc5_.y = 59;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 6).filters = [];
                  }
                  break;
               case 7:
                  _loc5_.x = 23;
                  _loc5_.y = 130;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 7).filters = [];
                  }
                  break;
               case 8:
                  _loc5_.x = 23;
                  _loc5_.y = 201;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 8).filters = [];
                  }
                  break;
               case 9:
                  _loc5_.x = 23;
                  _loc5_.y = 272;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 9).filters = [];
                  }
                  break;
               case 10:
                  _loc5_.x = 23;
                  _loc5_.y = 343;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 10).filters = [];
                  }
                  break;
               case 11:
                  _loc5_.x = 196;
                  _loc5_.y = 48;
                  break;
               case 12:
                  _loc5_.x = 196;
                  _loc5_.y = 120;
                  if(_loc4_.isLearn == 1)
                  {
                     getChildByName("line" + 12).filters = [];
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
                     getChildByName("line" + 14).filters = [];
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
         }
         else
         {
            this.studyCanvas.visible = false;
            this.upgradeCanvas.visible = true;
            this.upgradeCanvas.SKILL = param1;
         }
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
      }
   }
}

