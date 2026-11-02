package com.tgame.shell.view.components.stone
{
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class StoneHelpCanvas extends Sprite
   {
      
      public function StoneHelpCanvas()
      {
         super();
         var _loc1_:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/stoneHelpBg.png",307,300);
         addChild(_loc1_);
      }
   }
}

