package com.tgame.shell.view.components.xiatiankuaile
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.skin.XiaTianKuaiLeSkin;
   import game.utils.SkinTools;
   
   public class XiaTianKuaiLePanel extends BasePanel
   {
      
      public function XiaTianKuaiLePanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(XiaTianKuaiLeSkin.skin,"xiatiankuaile");
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[101,uint(_loc2_[1])]);
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

