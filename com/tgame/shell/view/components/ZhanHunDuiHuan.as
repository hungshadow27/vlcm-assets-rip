package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.zhanhun.DuihuanBaoshiCanvas;
   import com.tgame.shell.view.components.zhanhun.DuihuanZhanhunCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class ZhanHunDuiHuan extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var tabBar:FTabBar;
      
      public var DuihuanBaoshi:DuihuanBaoshiCanvas;
      
      public var DuihuanZhanhun:DuihuanZhanhunCanvas;
      
      private var fc1:FCanvas;
      
      private var img:Bitmap;
      
      public function ZhanHunDuiHuan()
      {
         super();
         this.fc1 = new FCanvas();
         this.fc1.x = 10;
         this.fc1.y = 25;
         this.fc1.width = 617 - 1 - 1;
         this.fc1.height = 263 + 15 + 11;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.img = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.img);
         this.img.width = 617 - 1 - 1 - 4;
         this.img.x = 10 + 2;
         this.img.y = 270 + 10;
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 764 - 125 - 5;
         height = 386 + 78 - 55 + 5;
         titleText = LanResManager.getLanCommonTextWords("战魂兑换");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tabBar = new FTabBar();
         addChild(this.tabBar);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.DuihuanBaoshi = new DuihuanBaoshiCanvas();
         this.DuihuanBaoshi.$parent = this;
         addChild(this.DuihuanBaoshi);
         this.DuihuanBaoshi.x = 10;
         this.DuihuanBaoshi.y = 22;
         this.DuihuanBaoshi.visible = false;
         this.DuihuanZhanhun = new DuihuanZhanhunCanvas();
         this.DuihuanZhanhun.$parent = this;
         addChild(this.DuihuanZhanhun);
         this.DuihuanZhanhun.x = 10;
         this.DuihuanZhanhun.y = 22;
         this.DuihuanZhanhun.visible = false;
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("兑换宝石"),this.onTabBarClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("兑换战魂"),this.onTabBarClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onTabBarClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("兑换宝石"):
               this.$parent.dispatchEvent(new BaseEvent(ZhanHunPanel.UI_ZHANHUNDUIHUAN_DUIHUANBAOSHICANVAS));
               break;
            case LanResManager.getLanCommonTextWords("兑换战魂"):
               this.$parent.dispatchEvent(new BaseEvent(ZhanHunPanel.UI_ZHANHUNDUIHUAN_DUIHUANZHANHUNCANVAS));
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.DuihuanBaoshi.$parent = param1;
         this.DuihuanZhanhun.$parent = param1;
      }
      
      public function showBaoshiCanvas(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("兑换宝石"));
         }
         this.DuihuanBaoshi.visible = true;
         this.DuihuanZhanhun.visible = false;
      }
      
      public function setDuiHuanbaoshi(param1:Array, param2:int) : void
      {
         this.DuihuanBaoshi.setZhanHun(param1);
         this.DuihuanBaoshi.setBaoShi(param2);
      }
      
      public function setYeshu(param1:int, param2:int) : void
      {
         this.DuihuanBaoshi.setYeShu(param1,param2);
      }
      
      public function showZhanhunCanvas(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("兑换战魂"));
         }
         this.DuihuanBaoshi.visible = false;
         this.DuihuanZhanhun.visible = true;
      }
      
      public function setDuiHuanzhanhun(param1:Array, param2:int) : void
      {
         this.DuihuanZhanhun.setZhanHun(param1);
         this.DuihuanZhanhun.setBaoShi(param2);
      }
   }
}

