package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.shell.view.components.active.ActiveActiveCanvas;
   import com.tgame.shell.view.components.active.ActiverInstanceCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class ActivePanel extends FPanel
   {
      
      public static const UI_ACTIVEACTIVE_CHECK_CLICK:String = "UI_ACTIVEACTIVE_CHECK_CLICK";
      
      public static const UI_ACTIVEACTIVE_SHOW:String = "UI_ACTIVEACTIVE_SHOW";
      
      public static const UI_ACTIVERINSTANCE_CHECK_CLICK:String = "UI_ACTIVERINSTANCE_CHECK_CLICK";
      
      public static const UI_ACTIVERINSTANCE_SHOW:String = "UI_ACTIVERINSTANCE_SHOW";
      
      public static const UI_ACTIVE_SHOW:String = "UI_ACTIVE_SHOW";
      
      public static const UI_LOGIN_SHOW:String = "UI_LOGIN_SHOW";
      
      public static const UI_SHOP_SHOW:String = "UI_SHOP_SHOW";
      
      public static const UI_NEWSPAPER_SHOW:String = "UI_NEWSPAPER_SHOW";
      
      public static const UI_TIMEGIFT_SHOW:String = "UI_TIMEGIFT_SHOW";
      
      private var tabBar:FTabBar;
      
      private var activeactiveCanvas:ActiveActiveCanvas;
      
      private var activerinstanceCanvas:ActiverInstanceCanvas;
      
      public function ActivePanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 504;
         height = 378;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.activeactiveCanvas = new ActiveActiveCanvas();
         this.activeactiveCanvas.$parent = this;
         addChild(this.activeactiveCanvas);
         this.activeactiveCanvas.x = 10;
         this.activeactiveCanvas.y = 20;
         this.activerinstanceCanvas = new ActiverInstanceCanvas();
         this.activerinstanceCanvas.$parent = this;
         addChild(this.activerinstanceCanvas);
         this.activerinstanceCanvas.x = 10;
         this.activerinstanceCanvas.y = 20;
         this.activerinstanceCanvas.visible = false;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.activeactiveCanvas.bgImg);
         _loc1_.push(this.activerinstanceCanvas.bgImg);
         this.DynamicManageImages = _loc1_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("今日活动"),this.onClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("副本闯阵"),this.onClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("今日活动"):
               this.ShowActive();
               dispatchEvent(new BaseEvent(UI_ACTIVEACTIVE_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("副本闯阵"):
               this.ShowInstance();
               dispatchEvent(new BaseEvent(UI_ACTIVERINSTANCE_SHOW));
         }
      }
      
      private function ShowActive() : void
      {
         this.activeactiveCanvas.visible = true;
         this.activerinstanceCanvas.visible = false;
      }
      
      private function ShowInstance() : void
      {
         this.activeactiveCanvas.visible = false;
         this.activerinstanceCanvas.visible = true;
      }
      
      public function SetInitializeActive(param1:Array) : void
      {
         this.activeactiveCanvas.SetInitialize(param1);
      }
      
      public function SetInitializeInstance(param1:Array) : void
      {
         this.activerinstanceCanvas.SetInitialize(param1);
      }
   }
}

