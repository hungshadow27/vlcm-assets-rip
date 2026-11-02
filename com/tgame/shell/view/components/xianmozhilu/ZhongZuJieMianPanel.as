package com.tgame.shell.view.components.xianmozhilu
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class ZhongZuJieMianPanel extends FPanel
   {
      
      public static const UI_ZHONGZUJIEMIAN:String = "UI_ZHONGZUJIEMIAN";
      
      public static const UI_ZHONGZUJIEMIAN_WAIXIAN_CLICK:String = "UI_ZHONGZUJIEMIAN_WAIXIAN_CLICK";
      
      public static const UI_ZHONGZUJIEMIAN_YICHU_CLICK:String = "UI_ZHONGZUJIEMIAN_YICHU_CLICK";
      
      public static const UI_ZHONGZUJIEMIAN_MENU_SHOW:String = "UI_ZHONGZUJIEMIAN_MENU_SHOW";
      
      public static const UI_XIANMOJUEXING:String = "UI_XIANMOJUEXING";
      
      public static const UI_XIANMOJUEXING_SHENGJIE:String = "UI_XIANMOJUEXING_SHENGJIE";
      
      public static const UI_XIANMOTIANJI:String = "UI_XIANMOTIANJI";
      
      public static const UI_XIANMOTIANJI_SHENGJIE:String = "UI_XIANMOTIANJI_SHENGJIE";
      
      public static const UI_XIANMOTIANWEN:String = "UI_XIANMOTIANWEN";
      
      public static const UI_XIANMOTIANWEN_SHENGJIE:String = "UI_XIANMOTIANWEN_SHENGJIE";
      
      public static const UI_XIANMOTIANRUI:String = "UI_XIANMOTIANRUI";
      
      public static const UI_XIANMOTIANRUI_SHENGJIE:String = "UI_XIANMOTIANRUI_SHENGJIE";
      
      public static const UI_XIANMOTIANRUI_GOUXUAN:String = "UI_XIANMOTIANRUI_GOUXUAN";
      
      public static const XIANMOZHILU_JIHUO_SHOW:String = "XIANMOZHILU_JIHUO_SHOW";
      
      public var tabBar:FTabBar;
      
      private var jueSe:ZhongZuJieMian_JueSe;
      
      private var jueXing:ZhongZuJieMian_JueXing;
      
      private var tianJi:ZhongZuJieMian_TianJi;
      
      private var tianWen:ZhongZuJieMian_TianWen;
      
      private var tianRui:ZhongZuJieMian_TianRui;
      
      private var currDisplay:Sprite;
      
      private var cunrrStr:String = "角色";
      
      public function ZhongZuJieMianPanel()
      {
         super();
         this.titleText = "种族界面";
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         width = 400 + 51;
         height = 350 + 112;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tabBar = new FTabBar();
         this.tabBar.addButton("角色",this.onTabClick);
         this.tabBar.addButton("觉醒",this.onTabClick);
         this.tabBar.addButton("天技",this.onTabClick);
         this.tabBar.addButton("天纹",this.onTabClick);
         this.tabBar.addButton("天瑞",this.onTabClick);
         addChild(this.tabBar);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.jueSe = new ZhongZuJieMian_JueSe();
         this.jueSe._parent = this;
         this.jueSe.visible = false;
         addChild(this.jueSe);
         this.jueXing = new ZhongZuJieMian_JueXing();
         this.jueXing._parent = this;
         this.jueXing.visible = false;
         addChild(this.jueXing);
         this.tianJi = new ZhongZuJieMian_TianJi();
         this.tianJi._parent = this;
         this.tianJi.visible = false;
         addChild(this.tianJi);
         this.tianWen = new ZhongZuJieMian_TianWen();
         this.tianWen._parent = this;
         this.tianWen.visible = false;
         addChild(this.tianWen);
         this.tianRui = new ZhongZuJieMian_TianRui();
         this.tianRui._parent = this;
         this.tianRui.visible = false;
         addChild(this.tianRui);
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case "角色":
               this.tabBar.setCurrentButtonByLabel(this.cunrrStr);
               dispatchEvent(new BaseEvent(ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN));
               break;
            case "觉醒":
               this.tabBar.setCurrentButtonByLabel(this.cunrrStr);
               dispatchEvent(new BaseEvent(ZhongZuJieMianPanel.UI_XIANMOJUEXING));
               break;
            case "天技":
               this.tabBar.setCurrentButtonByLabel(this.cunrrStr);
               dispatchEvent(new BaseEvent(ZhongZuJieMianPanel.UI_XIANMOTIANJI));
               break;
            case "天纹":
               this.tabBar.setCurrentButtonByLabel(this.cunrrStr);
               dispatchEvent(new BaseEvent(ZhongZuJieMianPanel.UI_XIANMOTIANWEN));
               break;
            case "天瑞":
               this.tabBar.setCurrentButtonByLabel(this.cunrrStr);
               dispatchEvent(new BaseEvent(ZhongZuJieMianPanel.UI_XIANMOTIANRUI));
         }
      }
      
      public function onClose(param1:* = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setCurrIndexView(param1:int) : void
      {
         if(this.currDisplay)
         {
            this.currDisplay.visible = false;
         }
         switch(param1)
         {
            case 1:
               this.currDisplay = this.jueSe;
               this.cunrrStr = "角色";
               break;
            case 2:
               this.currDisplay = this.jueXing;
               this.cunrrStr = "觉醒";
               break;
            case 3:
               this.currDisplay = this.tianJi;
               this.cunrrStr = "天技";
               break;
            case 4:
               this.currDisplay = this.tianWen;
               this.cunrrStr = "天纹";
               break;
            case 5:
               this.currDisplay = this.tianRui;
               this.cunrrStr = "天瑞";
         }
         this.currDisplay.visible = true;
      }
      
      public function setPanel(param1:Object) : void
      {
         this.tabBar.setCurrentButtonByLabel("角色");
         this.jueSe.setPanel(param1);
      }
      
      public function set_ZhongZuJieMian(param1:Array) : void
      {
         this.jueSe.set_ZhongZuJieMian(param1);
      }
      
      public function set_ZhongZuJueXingMian(param1:Array) : void
      {
         this.jueXing.set_ZhongZuJieMian(param1);
      }
      
      public function setXianMoJueXingData(param1:Object) : void
      {
         this.tabBar.setCurrentButtonByLabel("觉醒");
         this.jueXing.setXianMoJueXingData(param1);
      }
      
      public function setXianMoTianJiData(param1:Object) : void
      {
         this.tabBar.setCurrentButtonByLabel("天技");
         this.tianJi.setXianMoJueXingData(param1);
      }
      
      public function setXianMoTianWenData(param1:Object) : void
      {
         this.tabBar.setCurrentButtonByLabel("天纹");
         this.tianWen.setXianMoTianWenData(param1);
      }
      
      public function setXianMoTianRuiData(param1:Object) : void
      {
         this.tabBar.setCurrentButtonByLabel("天瑞");
         this.tianRui.setXianMoTianRuiData(param1);
      }
      
      public function setGoodsChangeHandler() : void
      {
         this.jueXing.setGoodsChangeHandler();
         this.tianJi.setGoodsChangeHandler();
         this.tianWen.setGoodsChangeHandler();
         this.tianRui.setGoodsChangeHandler();
      }
   }
}

