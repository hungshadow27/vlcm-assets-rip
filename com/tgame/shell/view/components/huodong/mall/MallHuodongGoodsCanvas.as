package com.tgame.shell.view.components.huodong.mall
{
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import flash.display.DisplayObject;
   
   public class MallHuodongGoodsCanvas extends FCanvas
   {
      
      public var $parent:DisplayObject;
      
      private var goodsList:FList;
      
      private var scroll:FVScorllBar;
      
      public function MallHuodongGoodsCanvas()
      {
         super();
         skin = "box";
         width = 619;
         height = 370;
         this.goodsList = new FList();
         this.goodsList.skin = "list";
         this.goodsList.listWidth = 596;
         this.goodsList.listHeight = 364;
         this.goodsList.itemRenderer = new MallHuodongGoodsListRander();
         addChild(this.goodsList);
         this.goodsList.x = 2;
         this.goodsList.y = 2;
         this.scroll = new FVScorllBar(this.goodsList,364);
         addChild(this.scroll);
         this.scroll.x = 598;
         this.scroll.y = 2;
      }
      
      public function setList(param1:XML) : void
      {
         this.goodsList.dataProvider = param1;
         this.scroll.update();
      }
   }
}

