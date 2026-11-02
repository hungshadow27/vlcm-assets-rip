package com.tgame.shell.view.components.wishingTree
{
   import com.fireice.alert.FAlert;
   import com.fireice.list.FList;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.shell.view.components.WishingTree;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class FriendTreeSpr extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var treeList:FList;
      
      public var scroll:FVScorllBar;
      
      private var bg:DisplayObject;
      
      private var bgspr:Sprite;
      
      private var line:DisplayObject;
      
      private var ft:FTextArea;
      
      private var waterBtn:SecondButton;
      
      public function FriendTreeSpr()
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
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 135;
         this.line.y = 8;
         addChild(this.line);
         this.ft = new FTextArea();
         this.ft.x = 45;
         this.ft.y = 8;
         this.ft.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("好有名称") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 150;
         this.ft.y = 8;
         this.ft.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("许愿树状态") + "</font>";
         addChild(this.ft);
         this.treeList = new FList();
         this.treeList.skin = "list";
         this.treeList.itemRenderer = new FriendTreeRanader();
         this.treeList.listHeight = 260;
         this.treeList.listWidth = 220;
         addChild(this.treeList);
         this.treeList.x = 5;
         this.treeList.y = 28;
         this.treeList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.scroll = new FVScorllBar(this.treeList,260);
         addChild(this.scroll);
         this.scroll.x = 210;
         this.scroll.y = 28;
         this.waterBtn = new SecondButton();
         this.waterBtn.label = LanResManager.getLanCommonTextWords("前往浇水");
         this.waterBtn.x = 80;
         this.waterBtn.y = 305;
         addChild(this.waterBtn);
         this.waterBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         if(this.treeList.selectItem != null)
         {
            this.$parent.dispatchEvent(new BaseEvent(WishingTree.UI_FRIENDLIST_CLICK,"",[this.treeList.selectItem.name,this.treeList.selectItem.desc]));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.treeList.selectItem == null)
         {
            FAlert.show(LanResManager.getLanCommonTextWords("请选中玩家前去浇水！"));
            return;
         }
         this.$parent.dispatchEvent(new BaseEvent(WishingTree.UI_JIAOSHUI_BTN_CLICK,"",this.treeList.selectItem.treeID));
      }
   }
}

