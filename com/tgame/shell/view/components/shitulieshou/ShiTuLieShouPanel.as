package com.tgame.shell.view.components.shitulieshou
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.skin.ShiTuLieShou20181114Skin;
   import game.utils.SkinTools;
   
   public class ShiTuLieShouPanel extends BasePanel
   {
      
      public function ShiTuLieShouPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ShiTuLieShou20181114Skin.skin,"zhoumorenaohuodong");
         this.init();
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben2",this,true).attr("text",param1 + "");
      }
      
      private function init() : void
      {
         $("lingqu1 lingqu2 lingqu3 lingqu4 lingqu5",this,true).click(this.clickHanlder);
         $("soucha",this,true).click(this.clickSouChaHanlder);
         $("guanbi",this,true).click(this.onClick);
      }
      
      private function clickSouChaHanlder(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_QINGRENJIESONGHUA_PLANE,10);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("u");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[156,uint(_loc2_[1])]);
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

