package com.tgame.shell.view.components.zhuangwangguitian
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.skin.ZhuangWangCiShuSkin;
   import game.utils.SkinTools;
   
   public class ZhuangWangCiShuPanel extends BasePanel
   {
      
      public function ZhuangWangCiShuPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ZhuangWangCiShuSkin.skin,"zhoumorenaohuodong");
         this.init();
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben2",this,true).attr("text",param1 + "");
      }
      
      private function init() : void
      {
         $("lingqu1 lingqu2 lingqu3 lingqu4 lingqu5 lingqu6",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(this.onClick);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("u");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[177,uint(_loc2_[1])]);
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

