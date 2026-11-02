package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.HelpManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.npcshop.NPCShopTradingPopWindow;
   import com.tgame.shell.view.components.npcshop.NpcSopTradingNoVevenuePopWindow;
   import com.tgame.shell.view.components.npcshop.ShopItemCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   
   public class NPCShopPanel extends FPanel
   {
      
      private static var labels:Array;
      
      public static const TYPE_WUQI:String = "TYPE_WUQI";
      
      public static const TYPE_HUJU:String = "TYPE_HUJU";
      
      public static const TYPE_SIPIN:String = "TYPE_SIPIN";
      
      public static const TYPE_YAOPIN:String = "TYPE_YAOPIN";
      
      public static const TYPE_ZAHUO:String = "TYPE_ZAHUO";
      
      public static const TYPE_ZHANCHANGSHENGWANG:String = "TYPE_ZHANCHANGSHENGWANG";
      
      public static const UI_NPC_SHOP_GET_ITEM:String = "UI_NPC_SHOP_GET_ITEM";
      
      public static const UI_NPC_SHOP_GET_PAGE:String = "UI_NPC_SHOP_GET_PAGE";
      
      public static const UI_NPC_SHOP_ITEM_CLICK:String = "UI_NPC_SHOP_ITEM_CLICK";
      
      public static const UI_NPC_SHOP_BUYBTN_CLICK:String = "UI_NPC_SHOP_BUYBTN_CLICK";
      
      public static const UI_NPC_SHOP_BUY_OK:String = "UI_NPC_SHOP_BUY_OK";
      
      public static const UI_NPC_SHOP_SELLBTN_CLICK:String = "UI_NPC_SHOP_SELLBTN_CLICK";
      
      public static const UI_NPC_SHOP_SELL_OK:String = "UI_NPC_SHOP_SELL_OK";
      
      public static const UI_NPC_SHOP_REPAIRBTN_CLICK:String = "UI_NPC_SHOP_REPAIRBTN_CLICK";
      
      private var tabbar:FTabBar;
      
      private var _type:String;
      
      public var itemCanvas:ShopItemCanvas;
      
      public function NPCShopPanel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 257;
         height = 325;
         titleText = LanResManager.getLanCommonTextWords("交易");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tabbar = new FTabBar();
         addChild(this.tabbar);
         this.tabbar.x = 10;
         this.tabbar.y = 2;
         this.itemCanvas = new ShopItemCanvas();
         this.itemCanvas.$parent = this;
         addChild(this.itemCanvas);
         this.itemCanvas.x = 10;
         this.itemCanvas.y = 22;
      }
      
      public static function init() : void
      {
         labels = ["",LanResManager.getLanCommonTextWords("武器"),LanResManager.getLanCommonTextWords("少林"),LanResManager.getLanCommonTextWords("全真"),LanResManager.getLanCommonTextWords("古墓"),LanResManager.getLanCommonTextWords("桃花"),LanResManager.getLanCommonTextWords("饰品"),LanResManager.getLanCommonTextWords("药品"),LanResManager.getLanCommonTextWords("杂货"),LanResManager.getLanCommonTextWords("战场声望")];
      }
      
      private function onTabBar(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_NPC_SHOP_GET_ITEM,"",labels.indexOf((param1.target as FButton).label)));
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_TRADING);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_TRADING);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
         switch(param1)
         {
            case TYPE_WUQI:
               this.tabbar.removeAllButton();
               this.tabbar.addButton(LanResManager.getLanCommonTextWords("武器"),this.onTabBar);
               break;
            case TYPE_HUJU:
               this.tabbar.removeAllButton();
               this.tabbar.addButton(LanResManager.getLanCommonTextWords("少林"),this.onTabBar);
               this.tabbar.addButton(LanResManager.getLanCommonTextWords("全真"),this.onTabBar);
               this.tabbar.addButton(LanResManager.getLanCommonTextWords("古墓"),this.onTabBar);
               this.tabbar.addButton(LanResManager.getLanCommonTextWords("桃花"),this.onTabBar);
               break;
            case TYPE_SIPIN:
               this.tabbar.removeAllButton();
               this.tabbar.addButton(LanResManager.getLanCommonTextWords("饰品"),this.onTabBar);
               break;
            case TYPE_YAOPIN:
               this.tabbar.removeAllButton();
               this.tabbar.addButton(LanResManager.getLanCommonTextWords("药品"),this.onTabBar);
               break;
            case TYPE_ZAHUO:
               this.tabbar.removeAllButton();
               this.tabbar.addButton(LanResManager.getLanCommonTextWords("杂货"),this.onTabBar);
               break;
            case TYPE_ZHANCHANGSHENGWANG:
               this.tabbar.removeAllButton();
               this.tabbar.addButton(LanResManager.getLanCommonTextWords("战场声望"),this.onTabBar);
         }
      }
      
      public function setItem(param1:Array, param2:int, param3:int) : void
      {
         var _loc4_:Boolean = param2 == 1 ? true : false;
         var _loc5_:Boolean = param2 == param3 ? true : false;
         this.itemCanvas.setItem(param1,param2,param3,_loc4_,_loc5_);
      }
      
      public function showBuyPanel(param1:Goods, param2:Number, param3:Number) : void
      {
         var _loc4_:NPCShopTradingPopWindow = null;
         var _loc5_:NpcSopTradingNoVevenuePopWindow = null;
         if(GameConfig.wantEnterMapRes.id == OtherConst.XIANGYANGCHENG_MAP_ID)
         {
            _loc4_ = new NPCShopTradingPopWindow();
            _loc4_.type = NPCShopTradingPopWindow.TYPE_BUY;
            _loc4_.$parent = this;
            _loc4_.setItem(param1,param2,param3);
            POPWindowManager.showWindow(_loc4_);
         }
         else
         {
            _loc5_ = new NpcSopTradingNoVevenuePopWindow();
            _loc5_.type = NpcSopTradingNoVevenuePopWindow.TYPE_BUY;
            _loc5_.$parent = this;
            _loc5_.setItem(param1,param2,param3);
            POPWindowManager.showWindow(_loc5_);
         }
      }
      
      public function showSellPanel(param1:Goods, param2:int, param3:int) : void
      {
         var _loc4_:NPCShopTradingPopWindow = new NPCShopTradingPopWindow();
         _loc4_.type = NPCShopTradingPopWindow.TYPE_SELL;
         _loc4_.$parent = this;
         _loc4_.setItem(param1,param2,param3);
         POPWindowManager.showWindow(_loc4_);
      }
   }
}

