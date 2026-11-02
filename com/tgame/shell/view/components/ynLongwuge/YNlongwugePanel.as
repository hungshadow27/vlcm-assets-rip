package com.tgame.shell.view.components.ynLongwuge
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.moudels.ynLongwuge.model.info.YNlongwugeVO;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   
   public class YNlongwugePanel extends FPanel
   {
      
      public static const UI_YN_LONGWUGE_TABBTN_CLICK:String = "UI_YN_LONGWUGE_TABBTN_CLICK";
      
      public static const UI_YN_LONGWUGE_QIANJIAN_SHOUYI_CLICK:String = "UI_YN_LONGWUGE_SHOUYI_CLICK";
      
      public static const UI_YN_LONGWUGE_QIANJIAN_ADDNONGMIN_CLICK:String = "UI_YN_LONGWUGE_QIANJIAN_ADDNONGMIN_CLICK";
      
      public static const UI_YN_LONGWUGE_SISHENGSHOU_PAGE_CLICK:String = "UI_YN_LONGWUGE_SISHENGSHOU_PAGE_CLICK";
      
      public static const UI_YN_LONGWUGE_SHENGJI_CLICK:String = "UI_YN_LONGWUGE_SHENGJI_CLICK";
      
      private var tabBar:FTabBar;
      
      private var qianjian:YNlongwuge_qianjian;
      
      private var sishengshou:YNlongwuge_sishengshou;
      
      private var tabType:int = 0;
      
      private var mainchar:int = -1;
      
      public function YNlongwugePanel()
      {
         super();
         width = 850;
         height = 530;
         dragAble = true;
         titleText = LanResManager.getLanCommonTextWords("龙武阁");
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
         this.qianjian = new YNlongwuge_qianjian();
         this.qianjian.$parent = this;
         this.qianjian.x = 10;
         this.qianjian.y = 22;
         addChild(this.qianjian);
         this.sishengshou = new YNlongwuge_sishengshou();
         this.sishengshou.$parent = this;
         this.sishengshou.x = 10;
         this.sishengshou.y = 22;
         addChild(this.sishengshou);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("钱监"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("青龙阁"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("白虎阁"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("朱雀阁"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("玄武阁"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("钱监"):
               dispatchEvent(new BaseEvent(UI_YN_LONGWUGE_TABBTN_CLICK,"",[1,this.mainchar]));
               break;
            case LanResManager.getLanCommonTextWords("青龙阁"):
               dispatchEvent(new BaseEvent(UI_YN_LONGWUGE_TABBTN_CLICK,"",[2,this.mainchar]));
               break;
            case LanResManager.getLanCommonTextWords("白虎阁"):
               dispatchEvent(new BaseEvent(UI_YN_LONGWUGE_TABBTN_CLICK,"",[3,this.mainchar]));
               break;
            case LanResManager.getLanCommonTextWords("朱雀阁"):
               dispatchEvent(new BaseEvent(UI_YN_LONGWUGE_TABBTN_CLICK,"",[4,this.mainchar]));
               break;
            case LanResManager.getLanCommonTextWords("玄武阁"):
               dispatchEvent(new BaseEvent(UI_YN_LONGWUGE_TABBTN_CLICK,"",[5,this.mainchar]));
         }
         this.setTab(this.tabType);
      }
      
      public function setQianjianData(param1:YNlongwugeVO) : void
      {
         this.mainchar = param1.playerID;
         this.tabType = 1;
         this.qianjian.visible = true;
         this.sishengshou.visible = false;
         this.qianjian.setData(param1);
         this.setTab(this.tabType);
      }
      
      public function setSishengshouData(param1:YNlongwugeVO) : void
      {
         this.mainchar = param1.playerID;
         this.tabType = param1.type;
         this.qianjian.visible = false;
         this.sishengshou.visible = true;
         this.sishengshou.setData(param1);
         this.setTab(this.tabType);
      }
      
      public function updateFarmer(param1:int) : void
      {
         this.tabType = 1;
         this.qianjian.setFarmer(param1);
         this.setTab(this.tabType);
      }
      
      public function requestPanel(param1:int) : void
      {
         dispatchEvent(new BaseEvent(UI_YN_LONGWUGE_TABBTN_CLICK,"",param1));
      }
      
      public function setTab(param1:int) : void
      {
         this.tabBar.setCurrentButtonByLabel(this.getName(param1));
      }
      
      private function getName(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ = LanResManager.getLanCommonTextWords("钱监");
               break;
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("青龙阁");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("白虎阁");
               break;
            case 4:
               _loc2_ = LanResManager.getLanCommonTextWords("朱雀阁");
               break;
            case 5:
               _loc2_ = LanResManager.getLanCommonTextWords("玄武阁");
         }
         return _loc2_;
      }
   }
}

