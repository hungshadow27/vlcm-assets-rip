package com.tgame.shell.view.components.baoshiyangcheng
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.skin.BaoShiYangChengJieMian20181029Skin;
   import game.utils.SkinTools;
   
   public class BaoShiYangChengPanel extends BasePanel
   {
      
      public function BaoShiYangChengPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(BaoShiYangChengJieMian20181029Skin.skin,"baoshiyangchengjiemian");
         this.init();
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben1",this,true).attr("text",param1 + "");
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[148,uint(_loc2_[1])]);
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

