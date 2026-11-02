package com.tgame.shell.view.components.wishingTree
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.shell.view.components.WishingTree;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class FriendTreePanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var tabBar:FTabBar;
      
      private var fri:FriendTreeSpr;
      
      private var rec:WishingTreeWaterRecordSpr;
      
      public function FriendTreePanel()
      {
         super();
         skin = "panel_btn";
         width = 245;
         height = 395;
         dragAble = true;
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(WishingTree.UI_WISHINGTREECLOSE_CLICK));
      }
      
      private function init() : void
      {
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("好友"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("记录"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.fri = new FriendTreeSpr();
         this.fri.$parent = this.$parent;
         this.fri.x = 5;
         this.fri.y = 25;
         addChild(this.fri);
         this.fri.visible = false;
         this.rec = new WishingTreeWaterRecordSpr();
         this.rec.$parent = this.$parent;
         this.rec.x = 5;
         this.rec.y = 25;
         addChild(this.rec);
         this.rec.visible = false;
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("好友"):
               this.fri.visible = true;
               this.rec.visible = false;
               this.$parent.dispatchEvent(new BaseEvent(WishingTree.UI_FRIEND_RECORD_BTN_CLICK,"",1));
               break;
            case LanResManager.getLanCommonTextWords("记录"):
               this.fri.visible = false;
               this.rec.visible = true;
               this.$parent.dispatchEvent(new BaseEvent(WishingTree.UI_FRIEND_RECORD_BTN_CLICK,"",2));
         }
      }
      
      public function setFriInit(param1:XML) : void
      {
         this.fri.treeList.dataProvider = param1;
         this.fri.scroll.update();
      }
      
      public function setSecInit(param1:XML = null) : void
      {
         this.rec.treeList.dataProvider = null;
         this.rec.treeList.dataProvider = param1;
         this.rec.scroll.update();
      }
      
      public function setparent() : void
      {
         this.fri.$parent = this.$parent;
         this.rec.$parent = this.$parent;
      }
   }
}

