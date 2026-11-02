package com.tgame.shell.view.components.zhoumorenao
{
   import com.asQuery.$;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.skin.ZhouMoReNaoHuoDongSkin;
   import game.utils.SkinTools;
   
   public class ZhoumorenaoPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var ft:FTextArea;
      
      public function ZhoumorenaoPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ZhouMoReNaoHuoDongSkin.skin,"zhoumorenaohuodong");
         this.init();
      }
      
      private function init() : void
      {
         $("lingqu1 lingqu2 lingqu3 lingqu4 lingqu5 lingqu6 lingqu7 lingqu8 lingqu9",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(this.onClick);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben2",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("qu");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[145,uint(_loc2_[1])]);
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

