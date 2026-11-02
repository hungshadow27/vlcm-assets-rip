package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.shell.view.components.attribute.ZhiZhanZhiShangCanvas;
   import com.tgame.shell.view.components.zzzs.zzzs_zhankuangCanvas;
   import com.tgame.shell.view.components.zzzs.zzzs_zhuweiCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   
   public class ZhiZhanZhiShangPanel extends FPanel
   {
      
      public static const UI_ZHIZHANZHISHANG_LEIGUPANEL:String = "UI_ZHIZHANZHISHANG_LEIGUPANEL";
      
      public static const UI_ZHIZHANZHISHANG_ZHANKUANGPANEL:String = "UI_ZHIZHANZHISHANG_ZHANKUANGPANEL";
      
      public static const UI_ZHIZHANZHISHANG_JINRU_BTN:String = "UI_ZHIZHANZHISHANG_JINRU_BTN";
      
      public static const UI_ZHIZHANZHISHANG_RED_ZHUWEI:String = "UI_ZHIZHANZHISHANG_RED_ZHUWEI";
      
      public static const UI_ZHIZHANZHISHANG_BLUE_ZHUWEI:String = "UI_ZHIZHANZHISHANG_BLUE_ZHUWEI";
      
      public static const UI_ZHIZHANZHISHANG_LIST_PAGE:String = "UI_ZHIZHANZHISHANG_LIST_PAGE";
      
      public var tabBar:FTabBar;
      
      private var zzzs_js:ZhiZhanZhiShangCanvas;
      
      private var zzzs_zw:zzzs_zhuweiCanvas;
      
      private var zzzs_zk:zzzs_zhankuangCanvas;
      
      private var btnStart:SecondButton;
      
      public function ZhiZhanZhiShangPanel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 610;
         height = 440;
         titleText = LanResManager.getLanCommonTextWords("止战之殇");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.zzzs_js = new ZhiZhanZhiShangCanvas();
         this.zzzs_js._$parent = this;
         addChild(this.zzzs_js);
         this.zzzs_js.x = 10;
         this.zzzs_js.y = 22;
         this.zzzs_zw = new zzzs_zhuweiCanvas();
         this.zzzs_zw.$parent = this;
         addChild(this.zzzs_zw);
         this.zzzs_zw.x = 10;
         this.zzzs_zw.y = 22;
         this.zzzs_zk = new zzzs_zhankuangCanvas();
         this.zzzs_zk.$parent = this;
         addChild(this.zzzs_zk);
         this.zzzs_zk.x = 10;
         this.zzzs_zk.y = 22;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("活动介绍"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("擂鼓助威"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("历史战况"),this.onTabClick);
         addChild(this.tabBar);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.btnStart = new SecondButton();
         this.btnStart.x = width / 2 - this.btnStart.width / 2;
         this.btnStart.y = 375;
         this.btnStart.label = LanResManager.getLanCommonTextWords("进入战场");
         this.btnStart.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnStart);
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
         switch(param1.target)
         {
            case this.btnStart:
               dispatchEvent(new BaseEvent(UI_ZHIZHANZHISHANG_JINRU_BTN));
         }
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("活动介绍"):
               this.zzzs_js.visible = true;
               this.zzzs_zk.visible = false;
               this.zzzs_zw.visible = false;
               break;
            case LanResManager.getLanCommonTextWords("擂鼓助威"):
               dispatchEvent(new BaseEvent(UI_ZHIZHANZHISHANG_LEIGUPANEL));
               this.zzzs_js.visible = false;
               this.zzzs_zk.visible = false;
               this.zzzs_zw.visible = true;
               break;
            case LanResManager.getLanCommonTextWords("历史战况"):
               dispatchEvent(new BaseEvent(UI_ZHIZHANZHISHANG_ZHANKUANGPANEL));
               this.zzzs_js.visible = false;
               this.zzzs_zk.visible = true;
               this.zzzs_zw.visible = false;
         }
      }
      
      public function setZhuWeiRed(param1:int) : void
      {
         this.zzzs_zw.setRed(param1);
      }
      
      public function RedPlay() : void
      {
         this.zzzs_zw.RedPlay();
      }
      
      public function BluePlay() : void
      {
         this.zzzs_zw.BluePlay();
      }
      
      public function setZhuWeiBlue(param1:int) : void
      {
         this.zzzs_zw.setBlue(param1);
      }
      
      public function setHistory(param1:int, param2:int, param3:Array) : void
      {
         this.zzzs_zk.setInitialize(param3);
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         if(param1 == 1)
         {
            _loc4_ = true;
         }
         else
         {
            _loc4_ = false;
         }
         if(param1 == param2)
         {
            _loc5_ = true;
         }
         else
         {
            _loc5_ = false;
         }
         this.zzzs_zk.setPageList(param1,param2,_loc4_,_loc5_);
      }
   }
}

