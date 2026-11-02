package com.tgame.shell.view.components.kuafuleitai
{
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class KuaFuleitaiDefaultCanvas extends Sprite
   {
      
      private var $_parent:DisplayObject;
      
      private var bit1:DisplayObject;
      
      private var ftext:FTextArea;
      
      public function KuaFuleitaiDefaultCanvas()
      {
         super();
         this.loadImg();
         this.setText();
      }
      
      private function loadImg() : void
      {
         if(this.bit1 != null && this.bit1.parent != null)
         {
            this.bit1.parent.removeChild(this.bit1);
         }
         this.bit1 = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/kuafuleitai/kf.jpg",246,175);
         this.bit1.x = 2;
         this.bit1.y = 2;
         addChild(this.bit1);
      }
      
      private function setText() : void
      {
         this.ftext = new FTextArea();
         with(this.ftext)
         {
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            x = 5;
            y = 187;
            width = 237;
            height = 125;
            wordWrap = true;
            htmlText = LanResManager.getLanCommonTextWords("跨服擂台默认界面说明");
         }
         addChild(this.ftext);
      }
   }
}

