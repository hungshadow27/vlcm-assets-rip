package com.tgame.shell.view.components.gongcheng
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class GongChengHelpCanvas extends Sprite
   {
      
      public function GongChengHelpCanvas()
      {
         super();
         var _loc1_:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/gongchengHelpBg.png",675,377);
         _loc1_.x = 0;
         _loc1_.y = 0;
         addChild(_loc1_);
         var _loc2_:FSimpleButton = new FSimpleButton();
         _loc2_.skin = "closeButton";
         addChild(_loc2_);
         _loc2_.x = 675 - _loc2_.width - 4;
         _loc2_.y = 3;
         _loc2_.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

