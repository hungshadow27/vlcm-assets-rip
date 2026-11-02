package com.tgame.shell.view.components.yuanbaoyouhui
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.skin.YuanBaoYouHui20180927Skin;
   import game.utils.SkinTools;
   
   public class YuanBaoYouHuiPanel extends BasePanel
   {
      
      public function YuanBaoYouHuiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YuanBaoYouHui20180927Skin.skin,"yuanbaoyouhui");
         $("wenben1",this,true).attr("text","Hoạt động diễn ra 7 ngày theo phiên bản.");
         this.init();
      }
      
      private function init() : void
      {
         $("lingqu1 lingqu2 lingqu3 lingqu4 lingqu5 lingqu6 lingqu7",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(this.onClick);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("u");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[91,uint(_loc2_[1])]);
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

