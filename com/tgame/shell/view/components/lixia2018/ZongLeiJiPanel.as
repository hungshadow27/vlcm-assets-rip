package com.tgame.shell.view.components.lixia2018
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import flash.events.MouseEvent;
   import game.skin.ZhongJiLei20260108Skin;
   import game.utils.SkinTools;
   
   public class ZongLeiJiPanel extends BasePanel
   {
      
      public function ZongLeiJiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ZhongJiLei20260108Skin.skin,"zongjilei");
         this.init();
      }
      
      public function setNum(param1:int) : void
      {
         $("zongjileiwenzi",this,true).attr("text",param1 + "");
         $("shijian1",this,true).attr("text","01/01/2025");
         $("shijian2",this,true).attr("text","31/01/2026");
      }
      
      private function init() : void
      {
         $("zongjileianniu",this,true).click(this.onClick);
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

