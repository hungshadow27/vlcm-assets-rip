package com.tgame.shell.view.components.attribute
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.DisplayObject;
   
   public class WuHunList extends FListCellRenderer
   {
      
      internal var bg:DisplayObject;
      
      internal var bg2:DisplayObject;
      
      public function WuHunList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 100;
         this.bg2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuhun/hengxian.swf");
         this.bg2.x = 6;
         this.bg2.y = 96;
         addChild(this.bg2);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuhun/wuhun_" + data.id + ".swf");
         this.bg.x = 30;
         this.bg.y = 0;
         addChild(this.bg);
         if(data.isHuoDe)
         {
            this.bg.filters = [];
         }
         else
         {
            this.bg.filters = Tools.blackWhiteFilter;
         }
      }
   }
}

