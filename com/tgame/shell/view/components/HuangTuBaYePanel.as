package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.shell.view.components.huangtubaye.JiangShanSheJi;
   import com.tgame.shell.view.components.huangtubaye.ZhengZhanSiFang;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   
   public class HuangTuBaYePanel extends FPanel
   {
      
      public static const UI_HUANGTUBAYE_SHOW_ZHENGZHANSIFANG:String = "UI_HUANGTUBAYE_SHOW_ZHENGZHANSIFANG";
      
      public static const UI_HUANGTUBAYE_ZHENGZHANSIFANG_JINRU:String = "UI_HUANGTUBAYE_ZHENGZHANSIFANG_JINRU";
      
      public static const UI_HUANGTUBAYE_ZHENGZHANSIFANG_JIHUOLONGMAI:String = "UI_HUANGTUBAYE_ZHENGZHANSIFANG_JIHUOLONGMAI";
      
      public static const UI_HUANGTUBAYE_SHOW_JIANGSHANSHEJI:String = "UI_HUANGTUBAYE_SHOW_JIANGSHANSHEJI";
      
      public static const UI_HUANGTUBAYE_JIANGSHANSHEJI_CHAKAN:String = "UI_HUANGTUBAYE_JIANGSHANSHEJI_CHAKAN";
      
      public static const UI_HUANGTUBAYE_CHAKAN_FANYE:String = "UI_HUANGTUBAYE_CHAKAN_FANYE";
      
      public static const UI_HUANGTUBAYE_JIANGSHANSHEJI_MOBAI:String = "UI_HUANGTUBAYE_JIANGSHANSHEJI_MOBAI";
      
      public static const UI_HUANGTUBAYE_JIANGSHANSHEJI_LINGQU:String = "UI_HUANGTUBAYE_JIANGSHANSHEJI_LINGQU";
      
      public static const UI_HUANGTUBAYE_JIANGSHANSHEJI_JIANGLI:String = "UI_HUANGTUBAYE_JIANGSHANSHEJI_JIANGLI";
      
      public var tabBar:FTabBar;
      
      private var zhengzhansifang:ZhengZhanSiFang;
      
      private var jiangshansheji:JiangShanSheJi;
      
      private var shuoming:FTextArea;
      
      private var fenglujianglibiao:FengLuJiangLiBiaoPanel;
      
      private var chakanxinxi:HuangTuBaYeChaKanXinXiPanel;
      
      public function HuangTuBaYePanel()
      {
         var _loc1_:FCanvas = null;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 576 + 130 + 278;
         height = 432 + 140 + 87;
         titleText = LanResManager.getLanCommonTextWords("皇途霸业");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = new FCanvas();
         _loc1_.skin = "box";
         _loc1_.x = 10;
         _loc1_.y = 24;
         _loc1_.width = 576 + 130 - 20;
         _loc1_.height = 432 + 140 - 76 - 22 - 1;
         this.zhengzhansifang = new ZhengZhanSiFang();
         this.zhengzhansifang.$parent = this;
         this.zhengzhansifang.visible = false;
         addChild(this.zhengzhansifang);
         this.zhengzhansifang.x = 10;
         this.zhengzhansifang.y = 22;
         this.jiangshansheji = new JiangShanSheJi();
         this.jiangshansheji.$parent = this;
         this.jiangshansheji.visible = false;
         addChild(this.jiangshansheji);
         this.jiangshansheji.x = 10;
         this.jiangshansheji.y = 22;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("征战四方"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("江山社稷"),this.onTabClick);
         addChild(this.tabBar);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.chakanxinxi = new HuangTuBaYeChaKanXinXiPanel();
         this.chakanxinxi.setParent = this;
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("征战四方"):
               dispatchEvent(new BaseEvent(UI_HUANGTUBAYE_SHOW_ZHENGZHANSIFANG));
               this.showZhengZhanSiFang();
               break;
            case LanResManager.getLanCommonTextWords("江山社稷"):
               this.showJiangShanSheJi();
               dispatchEvent(new BaseEvent(UI_HUANGTUBAYE_SHOW_JIANGSHANSHEJI));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setinitilizeUI(param1:Array) : void
      {
         this.zhengzhansifang.setinitilizeUI(param1);
      }
      
      public function isJiangShanSheJi(param1:String, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Array) : void
      {
         this.jiangshansheji.setinitilizeUI(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function isJiangShanSheJiXinXi(param1:Array, param2:int, param3:int) : void
      {
         GameInstance.uiInstance.huangTuBaYeChaKanXinXiPanel.setInitialize(param1,param2,param3);
      }
      
      public function isJiangShanSheJiJiangLi(param1:Array) : void
      {
         if(this.fenglujianglibiao == null)
         {
            this.fenglujianglibiao = new FengLuJiangLiBiaoPanel();
         }
         this.fenglujianglibiao.x = (GameConfig.sceneWidth - 510) / 2;
         this.fenglujianglibiao.y = (GameConfig.sceneHeight - 480) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.fenglujianglibiao);
         this.fenglujianglibiao.setInitialize(param1);
      }
      
      public function showZhengZhanSiFang(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("征战四方"));
         }
         this.zhengzhansifang.visible = true;
         this.jiangshansheji.visible = false;
         titleText = LanResManager.getLanCommonTextWords("皇途霸业");
      }
      
      public function showJiangShanSheJi(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("江山社稷"));
         }
         this.jiangshansheji.visible = true;
         this.zhengzhansifang.visible = false;
         titleText = LanResManager.getLanCommonTextWords("江山社稷");
      }
   }
}

