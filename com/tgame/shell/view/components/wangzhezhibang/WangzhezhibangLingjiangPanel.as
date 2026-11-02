package com.tgame.shell.view.components.wangzhezhibang
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import flash.display.DisplayObject;
   
   public class WangzhezhibangLingjiangPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      public var list:FList;
      
      public function WangzhezhibangLingjiangPanel()
      {
         super();
         width = 507;
         height = 530;
         dragAble = true;
         titleText = LanResManager.getLanCommonTextWords("帮战领奖");
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc1_:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/lingjiang_bg.png",490,486);
         _loc1_.x = 9;
         _loc1_.y = 0;
         addChild(_loc1_);
         this.list = new FList();
         this.list.skin = "list";
         this.list.itemRenderer = new WangzhezhibangLingjiangRanader();
         this.list.listHeight = 490;
         this.list.listWidth = 487;
         addChild(this.list);
         this.list.x = 10;
         this.list.y = 1;
      }
      
      public function setData(param1:Array) : void
      {
         this.list.dataProvider = param1;
         WangzhezhibangLingjiangRanader.$parent = this.$parent;
      }
   }
}

