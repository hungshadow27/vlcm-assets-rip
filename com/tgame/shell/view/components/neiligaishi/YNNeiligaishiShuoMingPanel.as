package com.tgame.shell.view.components.neiligaishi
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import flash.events.MouseEvent;
   import game.skin.NeiLiGaiShi20171228Skin;
   import game.utils.SkinTools;
   
   public class YNNeiligaishiShuoMingPanel extends BasePanel
   {
      
      public function YNNeiligaishiShuoMingPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(NeiLiGaiShi20171228Skin.skin,"wanfashuoming");
         this.init();
      }
      
      private function init() : void
      {
         $("guanbi",this,true).click(this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

