package com.tgame.shell.view.components.lliuyueqingzhu
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import flash.events.MouseEvent;
   import game.display.Image;
   import game.skin.caipiao1Skin;
   import game.utils.SkinTools;
   
   public class CaiPiaoShowPanel extends BasePanel
   {
      
      private var caipiao735491:Image;
      
      private var caipiao735492:Image;
      
      private var caipiao735493:Image;
      
      private var caipiao735494:Image;
      
      private var caipiao735495:Image;
      
      private var caipiao735496:Image;
      
      private var caipiao735497:Image;
      
      private var caipiao735498:Image;
      
      private var caipiao735499:Image;
      
      private var caipiao735500:Image;
      
      private var currentCaiPiao:Image;
      
      public function CaiPiaoShowPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(caipiao1Skin.skin,"CAIPIAO");
      }
      
      override protected function createVariableReference() : void
      {
         this.caipiao735491 = getChildByName("TU1") as Image;
         this.caipiao735492 = getChildByName("TU2") as Image;
         this.caipiao735493 = getChildByName("TU3") as Image;
         this.caipiao735494 = getChildByName("TU4") as Image;
         this.caipiao735495 = getChildByName("TU5") as Image;
         this.caipiao735496 = getChildByName("TU6") as Image;
         this.caipiao735497 = getChildByName("TU7") as Image;
         this.caipiao735498 = getChildByName("TU8") as Image;
         this.caipiao735499 = getChildByName("TU9") as Image;
         this.caipiao735500 = getChildByName("TU10") as Image;
         $("YBZLGBAN",this,true).click(this.onClick);
      }
      
      public function showCaiPiao(param1:int) : void
      {
         if(this.currentCaiPiao)
         {
            this.currentCaiPiao.visible = false;
            this.currentCaiPiao = null;
         }
         this.currentCaiPiao = this["caipiao" + param1];
         this.currentCaiPiao.visible = true;
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

