package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.moxuebaby.MoXue_Guanzhu_Canvas;
   import com.tgame.shell.view.components.moxuebaby.MoXue_Tiqu_Canvas;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   
   public class MoXueBabyPanel extends FPanel
   {
      
      public static const UI_MOXUEBABYPANEL_SHOW_FULLCANVAS:String = "UI_MOXUEBABYPANEL_SHOW_FULLCANVAS";
      
      public static const UI_MOXUEBABYPANEL_SHOW_EMPTYCANVAS:String = "UI_MOXUEBABYPANEL_SHOW_EMPTYCANVAS";
      
      public static const UI_MOXUEBABYPANEL_PUT_BABY_FULLCANVAS:String = "UI_MOXUEBABYPANEL_PUT_BABY_FULLCANVAS";
      
      public static const UI_MOXUEBABYPANEL_SATR_FULL:String = "UI_MOXUEBABYPANEL_SATR_FULL";
      
      public static const UI_MOXUEBABYPANEL_PUT_BABY_EMPTYCANVAS:String = "UI_MOXUEBABYPANEL_PUT_BABY_EMPTYCANVAS";
      
      public static const UI_MOXUEBABYPANEL_SATR_GET:String = "UI_MOXUEBABYPANEL_SATR_GET";
      
      private var tabBar:FTabBar;
      
      public var GuanzhuCanvas:MoXue_Guanzhu_Canvas;
      
      public var TiquCanvas:MoXue_Tiqu_Canvas;
      
      public function MoXueBabyPanel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 374;
         height = 308;
         titleText = LanResManager.getLanCommonTextWords("魔血娃娃");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tabBar = new FTabBar();
         addChild(this.tabBar);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.GuanzhuCanvas = new MoXue_Guanzhu_Canvas();
         this.GuanzhuCanvas.$parent = this;
         addChild(this.GuanzhuCanvas);
         this.GuanzhuCanvas.x = 10;
         this.GuanzhuCanvas.y = 22;
         this.GuanzhuCanvas.visible = false;
         this.TiquCanvas = new MoXue_Tiqu_Canvas();
         this.TiquCanvas.$parent = this;
         addChild(this.TiquCanvas);
         this.TiquCanvas.x = 10;
         this.TiquCanvas.y = 22;
         this.TiquCanvas.visible = false;
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("魔血灌注"),this.onTabBarClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("魔血提取"),this.onTabBarClick);
      }
      
      private function onTabBarClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("魔血灌注"):
               dispatchEvent(new BaseEvent(UI_MOXUEBABYPANEL_SHOW_FULLCANVAS));
               break;
            case LanResManager.getLanCommonTextWords("魔血提取"):
               dispatchEvent(new BaseEvent(UI_MOXUEBABYPANEL_SHOW_EMPTYCANVAS));
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
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("魔血灌注"));
         }
         this.GuanzhuCanvas.visible = true;
         this.TiquCanvas.visible = false;
      }
      
      public function setItem_FullCanvas(param1:Goods, param2:Goods) : void
      {
         this.GuanzhuCanvas.setItem(param1,param2);
      }
      
      public function setStartBtnEnabled_FullCanvs(param1:Boolean) : void
      {
         this.GuanzhuCanvas.startBtn.enabled = param1;
      }
      
      public function setMoxue_Guanzhu(param1:int) : void
      {
         this.GuanzhuCanvas.setMoXue(param1);
      }
      
      public function showEmptyCanvas(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("魔血提取"));
         }
         this.GuanzhuCanvas.visible = false;
         this.TiquCanvas.visible = true;
      }
      
      public function setItem_EmptyCanvas(param1:Goods, param2:Goods) : void
      {
         this.TiquCanvas.setItem(param1,param2);
      }
      
      public function setMoxue_Tiqu(param1:int, param2:int, param3:int = 1) : void
      {
         this.TiquCanvas.setMoXue(param1,param2,param3);
      }
      
      public function setStartBtnEnabled_EmptyCanvs(param1:Boolean) : void
      {
         this.TiquCanvas.startBtn.enabled = param1;
      }
   }
}

