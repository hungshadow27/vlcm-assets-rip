package com.tgame.shell.view.components.changnianchongzhi
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.skin.ChangNianChongZhi20181212Skin;
   import game.utils.SkinTools;
   
   public class ChangNianChongZhiPanel extends BasePanel
   {
      
      public function ChangNianChongZhiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ChangNianChongZhi20181212Skin.skin,"peiyangdianfengshou");
         this.init();
         this.setDate();
      }
      
      private function init() : void
      {
         $("lingqu1 lingqu2 lingqu3 lingqu4 lingqu5 lingqu6 lingqu7 lingqu8 lingqu9",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(this.onClick);
      }
      
      public function setDate() : void
      {
         $("wenben1",this,true).attr("text","Từ 00:00 đến 23:59 của mỗi ngày trong phiên bản");
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben2",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("u");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[84,uint(_loc2_[1])]);
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

