package com.tgame.shell.view.components.zhengba
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   
   public class RankPanel extends FCanvas
   {
      
      private var rankCanvas:RankCanvas;
      
      public function RankPanel()
      {
         super();
         this.skin = "box";
         width = 400;
         height = 145;
         this.rankCanvas = new RankCanvas();
         this.rankCanvas.x = 0;
         this.rankCanvas.y = 0;
         addChild(this.rankCanvas);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setInitialize(param1:XML) : void
      {
         this.rankCanvas.setInitialize(param1);
      }
   }
}

