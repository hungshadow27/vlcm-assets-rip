package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.zhenQiBaby.SuperJingHunCanvas;
   import flash.events.MouseEvent;
   
   public class ZhenQiBabyPanelTwoPanel extends FPanel
   {
      
      public static const UI_ZHENQIBABYPANEL_TWO_PUT_BABY_EMPTYCANVAS:String = "UI_ZHENQIBABYPANEL_TWO_PUT_BABY_EMPTYCANVAS";
      
      public static const UI_ZHENQIBABYPANEL_TWO_SATR_GET:String = "UI_ZHENQIBABYPANEL_TWO_SATR_GET";
      
      private var tabBar:FTabBar;
      
      private var tiquCanvas:SuperJingHunCanvas;
      
      public function ZhenQiBabyPanelTwoPanel()
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
         this.tiquCanvas = new SuperJingHunCanvas();
         this.tiquCanvas.$parent = this;
         addChild(this.tiquCanvas);
         this.tiquCanvas.x = 10;
         this.tiquCanvas.y = 22;
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("真气提取"),this.onTabBarClick);
      }
      
      private function onTabBarClick(param1:MouseEvent) : void
      {
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setZhenqi(param1:int) : void
      {
         this.tiquCanvas.setZhenQi(param1);
      }
      
      public function setBaby(param1:Goods) : void
      {
         this.tiquCanvas.setBaby(param1);
      }
      
      public function setJingHun(param1:Goods) : void
      {
         this.tiquCanvas.setJingHun(param1);
      }
      
      public function setStartBtnEnabled_EmptyCanvs(param1:Boolean) : void
      {
         this.tiquCanvas.startBtn.enabled = param1;
      }
   }
}

