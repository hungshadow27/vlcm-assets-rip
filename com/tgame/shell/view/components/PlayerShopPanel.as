package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.character.Mount;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.depot.RideListPanel;
   import com.tgame.shell.view.components.playershop.PlayerShopItemBuyPopWindow;
   import com.tgame.shell.view.components.playershop.PlayerShopItemCanvas;
   import com.tgame.shell.view.components.playershop.PlayerShopItemShowPopWindow;
   import com.tgame.shell.view.components.playershop.PlayerShopRideBuyPopWindow;
   import com.tgame.shell.view.components.playershop.PlayerShopRideCanvas;
   import com.tgame.shell.view.components.playershop.PlayerShopRideShowPopWindow;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.TextFieldType;
   
   public class PlayerShopPanel extends FPanel
   {
      
      public static const CHARSHOPPANEL:String = "CHARSHOPPANEL";
      
      public static const OTHERPLAYERSHOPPANEL:String = "OTHERPLAYERSHOPPANEL";
      
      public static const UI_SHOPPANEL_ITEMCANVAS_SHOW:String = "UI_SHOPPANEL_ITEMCANVAS_SHOW";
      
      public static const UI_SHOPPANEL_RIDECANVAS_SHOW:String = "UI_SHOPPANEL_RIDECANVAS_SHOW";
      
      public static const UI_SHOPPANEL_RIDELISTBTN_CLICK:String = "UI_SHOPPANEL_RIDELISTBTN_CLICK";
      
      public static const UI_SHOPPANEL_ITEM_SHOWBTN_CLICK:String = "UI_SHOPPANEL_ITEM_SHOWBTN_CLICK";
      
      public static const UI_SHOPPANEL_RIDE_SHOWBTN_CLICK:String = "UI_RIDELISTPANEL_RIDE_SHOWBTN_CLICK";
      
      public static const UI_SHOPPANEL_ITEMSHOP_CLICK:String = "UI_SHOPPANEL_ITEMSHOP_CLICK";
      
      public static const UI_SHOPPANEL_RIDESHOP_CLICK:String = "UI_SHOPPANEL_RIDESHOP_CLICK";
      
      public static const UI_SHOPPANEL_ITEM_SHOW_OK:String = "UI_SHOPPANEL_ITEM_SHOW_OK";
      
      public static const UI_SHOPPANEL_ITEM_HIDE_OK:String = "UI_SHOPPANEL_ITEM_HIDE_OK";
      
      public static const UI_SHOPPANEL_RIDE_SHOW_OK:String = "UI_SHOPPANEL_RIDE_SHOW_OK";
      
      public static const UI_SHOPPANEL_RIDE_HIDE_OK:String = "UI_SHOPPANEL_RIDE_HIDE_OK";
      
      public static const UI_SHOPPANEL_ITEM_BUYBTN_CLICK:String = "UI_SHOPPANEL_ITEM_BUYBTN_CLICK";
      
      public static const UI_SHOPPANEL_ITEM_BUY:String = "UI_SHOPPANEL_ITEM_BUY";
      
      public static const UI_SHOPPANEL_RIDE_BUYBTN_CLICK:String = "UI_SHOPPANEL_RIDE_BUYBTN_CLICK";
      
      public static const UI_SHOPPANEL_RIDE_BUY:String = "UI_SHOPPANEL_RIDE_BUY";
      
      public static const UI_SHOPPANEL_LOOK_RIDE_INFO:String = "UI_RIDELISTPANEL_LOOKBTN_CLICK";
      
      public static const UI_SHOPPANEL_NAME_MODIFY:String = "UI_SHOPPANEL_NAME_MODIFY";
      
      private var _type:String;
      
      private var tabBar:FTabBar;
      
      private var itemCanvas:PlayerShopItemCanvas;
      
      private var rideCanvas:PlayerShopRideCanvas;
      
      private var nameBg:F9GridBitmap;
      
      private var shopName:FTextInput;
      
      private var modifyBtn:SecondButton;
      
      private var lookOtherTanwei:SmallButton;
      
      private var rideListPanel:RideListPanel;
      
      private var log:FTextArea;
      
      private var logScroll:FVScorllBar;
      
      public function PlayerShopPanel()
      {
         var v:Vector.<Bitmap>;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 257;
         height = 394;
         this.titleText = LanResManager.getLanCommonTextWords("随身摊位");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.itemCanvas = new PlayerShopItemCanvas();
         this.itemCanvas.$parent = this;
         this.itemCanvas.visible = false;
         this.itemCanvas._type = CHARSHOPPANEL;
         addChild(this.itemCanvas);
         this.itemCanvas.showBtn.visible = true;
         this.itemCanvas.hideBtn.visible = true;
         this.itemCanvas.buyBtn.visible = false;
         this.itemCanvas.x = 10;
         this.itemCanvas.y = 22;
         this.rideCanvas = new PlayerShopRideCanvas();
         this.rideCanvas.$parent = this;
         this.rideCanvas._type = CHARSHOPPANEL;
         this.rideCanvas.visible = false;
         addChild(this.rideCanvas);
         this.rideCanvas.x = 10;
         this.rideCanvas.y = 22;
         v = new Vector.<Bitmap>();
         v.push(this.itemCanvas.bgImg);
         v.push(this.rideCanvas.bgImg);
         this.DynamicManageImages = v;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("出售中的物品"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("出售中的坐骑"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.lookOtherTanwei = new SmallButton();
         this.lookOtherTanwei.label = LanResManager.getLanCommonTextWords("查看他人摊位");
         this.lookOtherTanwei.x = 20;
         this.lookOtherTanwei.y = 232;
         addChild(this.lookOtherTanwei);
         this.lookOtherTanwei.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nameBg = Tools.get9GridBitmpByName("inputBg");
         addChild(this.nameBg);
         this.nameBg.width = 134;
         this.nameBg.x = 28;
         this.nameBg.y = 327;
         this.shopName = new FTextInput();
         with(this.shopName)
         {
            x = 36;
            y = 327;
            width = 118;
            height = 20;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("请输入摊位名字");
         }
         addChild(this.shopName);
         this.shopName.setMaxChars(18);
         this.modifyBtn = new SecondButton();
         this.modifyBtn.label = LanResManager.getLanCommonTextWords("修改");
         addChild(this.modifyBtn);
         this.modifyBtn.x = 167;
         this.modifyBtn.y = 327;
         this.modifyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.log = new FTextArea();
         with(this.log)
         {
            x = 15;
            y = 254;
            width = 212;
            height = 64;
            wordWrap = true;
         }
         addChild(this.log);
         this.logScroll = new FVScorllBar(this.log,64);
         addChild(this.logScroll);
         this.logScroll.x = 227;
         this.logScroll.y = 254;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.modifyBtn:
               dispatchEvent(new BaseEvent(UI_SHOPPANEL_NAME_MODIFY,"",this.shopName.text));
               break;
            case this.lookOtherTanwei:
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_LIST_PANEL);
         }
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("出售中的物品"):
               dispatchEvent(new BaseEvent(UI_SHOPPANEL_ITEMCANVAS_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("出售中的坐骑"):
               dispatchEvent(new BaseEvent(UI_SHOPPANEL_RIDECANVAS_SHOW));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         this.hideRideListPanel();
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
         if(this._type == OTHERPLAYERSHOPPANEL)
         {
            this.modifyBtn.visible = false;
            this.nameBg.x = 60;
            this.shopName.x = 68;
            this.shopName.type = TextFieldType.DYNAMIC;
            this.shopName.selectable = false;
            this.shopName.text = "";
            this.itemCanvas._type = param1;
            this.rideCanvas._type = param1;
            this.itemCanvas.showBtn.visible = false;
            this.itemCanvas.hideBtn.visible = false;
            this.itemCanvas.buyBtn.visible = true;
            this.rideCanvas.showBtn.visible = false;
            this.rideCanvas.hideBtn.visible = false;
            this.rideCanvas.buyBtn.visible = true;
         }
         if(this._type == CHARSHOPPANEL)
         {
            this.modifyBtn.visible = true;
            this.nameBg.x = 28;
            this.shopName.x = 36;
            this.shopName.type = TextFieldType.INPUT;
            this.shopName.selectable = true;
            this.shopName.text = LanResManager.getLanCommonTextWords("请输入摊位名字");
            this.itemCanvas._type = param1;
            this.rideCanvas._type = param1;
            this.itemCanvas.showBtn.visible = true;
            this.itemCanvas.hideBtn.visible = true;
            this.itemCanvas.buyBtn.visible = false;
            this.rideCanvas.showBtn.visible = true;
            this.rideCanvas.hideBtn.visible = true;
            this.rideCanvas.buyBtn.visible = false;
         }
      }
      
      public function set shopShowName(param1:String) : void
      {
         if(param1.charAt(0) == "[" && param1.indexOf("]") != -1)
         {
            this.shopName.text = param1.split("]")[1];
         }
         else
         {
            this.shopName.text = param1;
         }
      }
      
      public function setSellLog(param1:String) : void
      {
         this.log.htmlText += param1;
         if(this.log.numLines > 20)
         {
            this.log.replaceText(0,200,"");
         }
      }
      
      public function showItem() : void
      {
         this.itemCanvas.visible = true;
         this.rideCanvas.visible = false;
         this.hideRideListPanel();
      }
      
      public function setitemList(param1:Array) : void
      {
         this.itemCanvas.setItemList(param1);
      }
      
      public function showItemShowPanel(param1:Goods) : void
      {
         var _loc2_:PlayerShopItemShowPopWindow = new PlayerShopItemShowPopWindow();
         _loc2_.$parent = this;
         _loc2_.setItem(param1);
         POPWindowManager.showWindow(_loc2_);
      }
      
      public function showItemBuyPanel(param1:Goods, param2:int = 0, param3:int = 0) : void
      {
         var _loc4_:PlayerShopItemBuyPopWindow = new PlayerShopItemBuyPopWindow();
         _loc4_.$parent = this;
         _loc4_.setItem(param1,param2,param3);
         POPWindowManager.showWindow(_loc4_);
      }
      
      public function showRide() : void
      {
         this.itemCanvas.visible = false;
         this.rideCanvas.visible = true;
      }
      
      public function setRideList(param1:Array) : void
      {
         this.rideCanvas.setRideList(param1);
      }
      
      public function showRideShowPanel(param1:Mount) : void
      {
         var _loc2_:PlayerShopRideShowPopWindow = new PlayerShopRideShowPopWindow();
         _loc2_.$parent = this;
         _loc2_.setRide(param1);
         POPWindowManager.showWindow(_loc2_);
      }
      
      public function showRideBuyPanel(param1:Mount, param2:int = 0, param3:int = 0) : void
      {
         var _loc4_:PlayerShopRideBuyPopWindow = new PlayerShopRideBuyPopWindow();
         _loc4_.$parent = this;
         _loc4_.setItem(param1,param2,param3);
         POPWindowManager.showWindow(_loc4_);
      }
      
      public function showRideListPanel(param1:XML) : void
      {
         if(this.rideListPanel == null)
         {
            this.rideListPanel = new RideListPanel();
            this.rideListPanel.type = RideListPanel.UI_RIDE_LIST_SHOP;
            this.rideListPanel.$parent = this;
         }
         this.rideListPanel.visible = true;
         addChild(this.rideListPanel);
         this.rideListPanel.x = -this.rideListPanel.width - 10;
         this.rideListPanel.y = 0;
         this.rideListPanel.setRideList(param1);
      }
      
      public function hideRideListPanel() : void
      {
         if(this.rideListPanel != null && this.rideListPanel.parent != null)
         {
            this.rideListPanel.parent.removeChild(this.rideListPanel);
         }
      }
   }
}

