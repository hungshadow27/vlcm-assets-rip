package com.tgame.shell.view.components.huanqiukaimu
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.skin.HuanQiuKaiMuSkin;
   import game.utils.SkinTools;
   
   public class HuanQiuKaiMuPanel extends BasePanel
   {
      
      public function HuanQiuKaiMuPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(HuanQiuKaiMuSkin.skin,"huanqiukaimu");
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[104,uint(_loc2_[1])]);
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

