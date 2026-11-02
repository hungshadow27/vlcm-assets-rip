package com.tgame.shell.view.components.chengfajinggao
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import flash.events.MouseEvent;
   import game.skin.JingGaoJieMieSkin;
   import game.utils.SkinTools;
   
   public class ChengfajinggaoPanel extends BasePanel
   {
      
      public function ChengfajinggaoPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(JingGaoJieMieSkin.skin,"jinggaojiemian");
         this.initUI();
      }
      
      private function initUI() : void
      {
         $("chengfaanniu",this,true).click(this.clickHanlder);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         onClose();
      }
   }
}

