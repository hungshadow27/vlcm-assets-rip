package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.tgame.common.GameConfig;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.DisplayObject;
   
   public class HuangTuBaYeShuoMingPanel extends FPanel
   {
      
      private var bg1:DisplayObject;
      
      public function HuangTuBaYeShuoMingPanel()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 576 + 140 - 205;
         height = 432 + 128 + 101;
         titleText = "";
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/hdsmj.swf");
         this.bg1.x = 10;
         this.bg1.y = 2;
         addChild(this.bg1);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

