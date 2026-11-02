package com.tgame.shell.view.components.xiatianzhien
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import game.skin.XiaTianZhiEnSkin;
   import game.utils.SkinTools;
   
   public class YN2017XiatianzhienPanel extends BasePanel
   {
      
      public function YN2017XiatianzhienPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(XiaTianZhiEnSkin.skin,"xiatianzhien");
         this.init();
      }
      
      private function init() : void
      {
         $("YBZLGBAN",this,true).click(function():*
         {
            onClose();
         });
      }
   }
}

