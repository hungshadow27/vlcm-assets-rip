package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.shell.view.components.InfoQuery.AfficheCanvas;
   import com.tgame.shell.view.components.InfoQuery.IndividualNewsCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   
   public class InfoQueryPanel extends FPanel
   {
      
      public static const UI_INFOQUERY_AFFICHE_SHOW:String = "UI_INFOQUERY_AFFICHE_SHOW";
      
      public static const UI_INFOQUERY_INDIVDUALNEWS_SHOW:String = "UI_INFOQUERY_INDIVDUALNEWS_SHOW";
      
      public static const UI_INFOQUERY_THE_DAY_UPDATA_SHOW:String = "UI_INFOQUERY_THE_DAY_UPDATA_SHOW";
      
      public static const GETACCOMPLISHMENT:String = "ui.char.getaccomplishment";
      
      public static const GERENCHENGHAOPANEL:String = "GERENCHENGHAOPANEL";
      
      private var tabBar:FTabBar;
      
      private var affichecanvas:AfficheCanvas;
      
      private var todopanel:todoPanel;
      
      private var individualnewsCanvas:IndividualNewsCanvas;
      
      public function InfoQueryPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 610;
         height = 442;
         this.titleText = LanResManager.getLanCommonTextWords("信息查询");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.todopanel = new todoPanel();
         addChild(this.todopanel);
         this.todopanel.x = 10;
         this.todopanel.y = 20;
         this.affichecanvas = new AfficheCanvas();
         this.affichecanvas.$parent = this;
         addChild(this.affichecanvas);
         this.affichecanvas.x = 10;
         this.affichecanvas.y = 20;
         this.individualnewsCanvas = new IndividualNewsCanvas();
         this.individualnewsCanvas.$parent = this;
         addChild(this.individualnewsCanvas);
         this.individualnewsCanvas.x = 10;
         this.individualnewsCanvas.y = 20;
         this.individualnewsCanvas.visible = false;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("每日收益"),this.onClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("全服公告"),this.onClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("个人信息"),this.onClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("个人成就"),this.onClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("个人称号"),this.onClick);
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
            case LanResManager.getLanCommonTextWords("每日收益"):
               this.showTodopanel();
               dispatchEvent(new BaseEvent(UI_INFOQUERY_THE_DAY_UPDATA_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("全服公告"):
               this.showAffiche();
               dispatchEvent(new BaseEvent(UI_INFOQUERY_AFFICHE_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("个人信息"):
               this.showIndividualNews();
               dispatchEvent(new BaseEvent(UI_INFOQUERY_INDIVDUALNEWS_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("个人成就"):
               dispatchEvent(new BaseEvent(GETACCOMPLISHMENT));
               break;
            case LanResManager.getLanCommonTextWords("个人称号"):
               dispatchEvent(new BaseEvent(GERENCHENGHAOPANEL));
         }
      }
      
      private function showAffiche() : void
      {
         this.affichecanvas.visible = true;
         this.individualnewsCanvas.visible = false;
         this.todopanel.visible = false;
      }
      
      private function showIndividualNews() : void
      {
         this.affichecanvas.visible = false;
         this.individualnewsCanvas.visible = true;
         this.todopanel.visible = false;
      }
      
      private function showTodopanel() : void
      {
         this.affichecanvas.visible = false;
         this.individualnewsCanvas.visible = false;
         this.todopanel.visible = true;
      }
      
      public function SetInitialize(param1:Array) : void
      {
      }
      
      public function SetInitializeAffiche(param1:Date, param2:String) : void
      {
         this.affichecanvas.SetInitialize(param1,param2);
      }
      
      public function SetInitializeIndividualNews(param1:String) : void
      {
         this.individualnewsCanvas.SetInitialize(param1);
      }
      
      public function setInitializeTodopanel(param1:Array) : void
      {
         this.todopanel.SetInitialize(param1);
      }
   }
}

