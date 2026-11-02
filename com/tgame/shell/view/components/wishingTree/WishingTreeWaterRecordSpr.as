package com.tgame.shell.view.components.wishingTree
{
   import com.fireice.list.FList;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class WishingTreeWaterRecordSpr extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var treeList:FList;
      
      public var scroll:FVScorllBar;
      
      private var bg:DisplayObject;
      
      private var bgspr:Sprite;
      
      private var ft:FTextArea;
      
      public function WishingTreeWaterRecordSpr()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.bgspr = new Sprite();
         this.bgspr.x = 5;
         this.bgspr.y = 0;
         addChild(this.bgspr);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wishingTree/recordbg.swf");
         this.bg.x = 0;
         this.bg.y = 0;
         this.bgspr.addChild(this.bg);
         this.treeList = new FList();
         this.treeList.skin = "list";
         this.treeList.itemRenderer = new WaterRecordRanader();
         this.treeList.listHeight = 265;
         this.treeList.listWidth = 220;
         addChild(this.treeList);
         this.treeList.x = 5;
         this.treeList.y = 28;
         this.scroll = new FVScorllBar(this.treeList,265);
         addChild(this.scroll);
         this.scroll.x = 210;
         this.scroll.y = 28;
         this.ft = new FTextArea();
         this.ft.x = 95;
         this.ft.y = 8;
         this.ft.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("浇水记录") + "</font>";
         addChild(this.ft);
      }
   }
}

