package com.tgame.shell.view.components.liunianhuodong
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.skin.liunianpeibanSkin;
   import game.utils.SkinTools;
   
   public class YNLiunianpeibanPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      public function YNLiunianpeibanPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(liunianpeibanSkin.skin,"liunianpeiban");
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5 DFZQLQAN6 DFZQLQAN7 DFZQLQAN8 DFZQLQAN9 DFZQLQAN10 DFZQLQAN11",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(this.onClick);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben1",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[50,uint(_loc2_[1])]);
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

