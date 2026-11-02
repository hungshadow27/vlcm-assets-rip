package com.tgame.shell.view.components.yuanwu
{
   import com.tgame.common.ui.componets.BasePanel;
   import flash.events.MouseEvent;
   import game.display.SimpleButton;
   import game.skin.YuanWuSkin;
   import game.utils.SkinTools;
   
   public class YuanwushuomingPanel extends BasePanel
   {
      
      private var guanbi:SimpleButton;
      
      public function YuanwushuomingPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YuanWuSkin.skin,"zbjieshao");
      }
      
      override protected function createVariableReference() : void
      {
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,onClose);
      }
   }
}

