package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.zhenQiBaby.ZhenQi_emptyCanvas;
   import com.tgame.shell.view.components.zhenQiBaby.ZhenQi_fullCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   
   public class ZhenQiBabyPanel extends FPanel
   {
      
      public static const UI_ZHENQIBABYPANEL_SHOW_FULLCANVAS:String = "UI_ZHENQIBABYPANEL_SHOW_FULLCANVAS";
      
      public static const UI_ZHENQIBABYPANEL_SHOW_EMPTYCANVAS:String = "UI_ZHENQIBABYPANEL_SHOW_EMPTYCANVAS";
      
      public static const UI_ZHENQIBABYPANEL_PUT_BABY_FULLCANVAS:String = "UI_ZHENQIBABYPANEL_PUT_BABY_FULLCANVAS";
      
      public static const UI_ZHENQIBABYPANEL_PUT_BABY_EMPTYCANVAS:String = "UI_ZHENQIBABYPANEL_PUT_BABY_EMPTYCANVAS";
      
      public static const UI_ZHENQIBABYPANEL_SATR_FULL:String = "UI_ZHENQIBABYPANEL_SATR_FULL";
      
      public static const UI_ZHENQIBABYPANEL_SATR_GET:String = "UI_ZHENQIBABYPANEL_SATR_GET";
      
      private var tabBar:FTabBar;
      
      public var fullCanvas:ZhenQi_fullCanvas;
      
      public var emptyCanvas:ZhenQi_emptyCanvas;
      
      public function ZhenQiBabyPanel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 374;
         height = 308;
         titleText = LanResManager.getLanCommonTextWords("醍醐灌顶");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tabBar = new FTabBar();
         addChild(this.tabBar);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.fullCanvas = new ZhenQi_fullCanvas();
         this.fullCanvas.$parent = this;
         addChild(this.fullCanvas);
         this.fullCanvas.x = 10;
         this.fullCanvas.y = 22;
         this.fullCanvas.visible = false;
         this.emptyCanvas = new ZhenQi_emptyCanvas();
         this.emptyCanvas.$parent = this;
         addChild(this.emptyCanvas);
         this.emptyCanvas.x = 10;
         this.emptyCanvas.y = 22;
         this.emptyCanvas.visible = false;
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("真气灌注"),this.onTabBarClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("真气提取"),this.onTabBarClick);
      }
      
      private function onTabBarClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("真气灌注"):
               dispatchEvent(new BaseEvent(UI_ZHENQIBABYPANEL_SHOW_FULLCANVAS));
               break;
            case LanResManager.getLanCommonTextWords("真气提取"):
               dispatchEvent(new BaseEvent(UI_ZHENQIBABYPANEL_SHOW_EMPTYCANVAS));
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function showFullCanvas(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("真气灌注"));
         }
         this.fullCanvas.visible = true;
         this.emptyCanvas.visible = false;
      }
      
      public function setItem_FullCanvas(param1:Goods, param2:Goods) : void
      {
         this.fullCanvas.setItem(param1,param2);
      }
      
      public function setStartBtnEnabled_FullCanvs(param1:Boolean) : void
      {
         this.fullCanvas.startBtn.enabled = param1;
      }
      
      public function setZhenqi(param1:int) : void
      {
         this.fullCanvas.setZhenQi(param1);
         this.emptyCanvas.setZhenQi(param1);
      }
      
      public function showEmptyCanvas(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("真气提取"));
         }
         this.fullCanvas.visible = false;
         this.emptyCanvas.visible = true;
      }
      
      public function setItem_EmptyCanvas(param1:Goods, param2:Goods) : void
      {
         this.emptyCanvas.setItem(param1,param2);
      }
      
      public function setCount_EmptyCanvas(param1:int, param2:int, param3:int) : void
      {
         this.emptyCanvas.setCount(param1,param2,param3);
      }
      
      public function setStartBtnEnabled_EmptyCanvs(param1:Boolean) : void
      {
         this.emptyCanvas.startBtn.enabled = param1;
      }
   }
}

