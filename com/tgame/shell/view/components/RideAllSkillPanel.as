package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Skill;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class RideAllSkillPanel extends FPanel
   {
      
      private var container:Sprite;
      
      private var scroll:FVScorllBar;
      
      public function RideAllSkillPanel()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 325;
         height = 340;
         titleText = LanResManager.getLanCommonTextWords("坐骑技能大全");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.container = new Sprite();
         addChild(this.container);
         with(this.container.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,315,170);
            endFill();
         }
         this.container.x = 15;
         this.container.y = 5;
         this.scroll = new FVScorllBar(this.container,315);
         this.scroll.x = 290;
         this.scroll.y = 4;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
      }
      
      public function setSkill(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Skill = null;
         var _loc5_:int = 0;
         var _loc6_:Bitmap = null;
         var _loc7_:ItemFace = null;
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc6_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc6_.x = 49 * (_loc2_ % 6) - 1;
            _loc5_ = _loc2_ / 6;
            _loc6_.y = 49 * _loc5_ - 1;
            this.container.addChild(_loc6_);
            _loc4_ = param1[_loc2_] as Skill;
            _loc4_.isLearn = 1;
            _loc7_ = new ItemFace(_loc4_);
            _loc7_.x = 1 + 49 * (_loc2_ % 6);
            _loc7_.y = 49 * _loc5_ + 1;
            _loc7_.setShowCount(false);
            this.container.addChild(_loc7_);
            _loc2_++;
         }
         this.scroll.update();
      }
   }
}

