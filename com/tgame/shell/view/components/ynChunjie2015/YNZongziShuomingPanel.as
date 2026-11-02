package com.tgame.shell.view.components.ynChunjie2015
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.DisplayObject;
   
   public class YNZongziShuomingPanel extends FPanel
   {
      
      private var bg1:DisplayObject;
      
      private var zongzi:DisplayObject;
      
      public function YNZongziShuomingPanel()
      {
         super();
         skin = "panel";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 505;
         height = 385;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setData(param1:int) : void
      {
         if(param1 == 1)
         {
            titleText = LanResManager.getLanCommonTextWords("制作粽子说明");
         }
         else if(param1 == 2)
         {
            titleText = LanResManager.getLanCommonTextWords("对联说明");
         }
         else if(param1 == 4)
         {
            titleText = LanResManager.getLanCommonTextWords("雄王活动");
         }
         else if(param1 == 5)
         {
            titleText = LanResManager.getLanCommonTextWords("英雄神雕");
         }
         else
         {
            titleText = LanResManager.getLanCommonTextWords("羊年说明");
         }
         this.bg1 = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/2015chunjie/" + param1 + "_bg.jpg",487,341);
         this.bg1.x = 2 + 7;
         this.bg1.y = 2;
         addChild(this.bg1);
         if(param1 != 4 && param1 != 5)
         {
            this.zongzi = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/2015chunjie/" + param1 + ".swf");
            this.zongzi.x = 2 - 80 + 55;
            this.zongzi.y = 2 - 60 - 45;
            addChild(this.zongzi);
         }
         else if(Boolean(this.zongzi) && Boolean(this.zongzi.parent))
         {
            this.zongzi.parent.removeChild(this.zongzi);
         }
      }
   }
}

