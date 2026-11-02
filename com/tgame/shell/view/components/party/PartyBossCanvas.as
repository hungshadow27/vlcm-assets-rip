package com.tgame.shell.view.components.party
{
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import flash.display.DisplayObject;
   
   public class PartyBossCanvas extends FCanvas
   {
      
      public var $parent:DisplayObject;
      
      public var bossList:FList;
      
      private var scroll:FVScorllBar;
      
      public function PartyBossCanvas()
      {
         super();
         skin = "box";
         width = 260;
         height = 264;
         this.bossList = new FList();
         this.bossList.skin = "list";
         this.bossList.listWidth = 260;
         this.bossList.listHeight = 264 - 6;
         this.bossList.itemRenderer = new PartyBossListRander();
         addChild(this.bossList);
         this.bossList.x = 2;
         this.bossList.y = 2;
         this.scroll = new FVScorllBar(this.bossList,264 - 6);
         addChild(this.scroll);
         this.scroll.x = 237 + 2;
         this.scroll.y = 2;
      }
      
      public function setList(param1:XML, param2:Boolean = false) : void
      {
         this.bossList.dataProvider = param1;
         this.scroll.update(param2);
         if(!this.scroll.visible)
         {
            this.bossList.listWidth = 260;
         }
         else
         {
            this.bossList.listWidth = 240;
         }
      }
   }
}

