package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.character.Mount;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.manager.NumberFormatter;
   import com.tgame.shell.view.components.depot.RideListPanel;
   import com.tgame.shell.view.components.trading.TradingListRander;
   import com.tgame.shell.view.components.trading.TradingSetCopperPopWindow;
   import com.tgame.shell.view.components.trading.TradingSetSilverPopWindow;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.text.*;
   
   public class TradingPanel extends FPanel
   {
      
      public static const UI_TRADINGPANEL_ITEM_SHOWBTN_CLICK:String = "UI_TRADINGPANEL_ITEM_SHOWBTN_CLICK";
      
      public static const UI_TRADINGPANEL_INPUT_COPPER_CLICK:String = "UI_TRADINGPANEL_INPUT_COPPER_CLICK";
      
      public static const UI_TRADINGPANEL_INPUT_COPPER:String = "UI_TRADINGPANEL_INPUT_COPPER";
      
      public static const UI_TRADINGPANEL_INPUT_SILVER_CLICK:String = "UI_TRADINGPANEL_INPUT_SILVER_CLICK";
      
      public static const UI_TRADINGPANEL_INPUT_SILVER:String = "UI_TRADINGPANEL_INPUT_SILVER";
      
      public static const UI_TRADINGPANEL_RIDELISTPANEL_SHOW:String = "UI_TRADINGPANEL_RIDELISTPANEL_SHOW";
      
      public static const UI_TRADINGPANEL_LOCK:String = "UI_TRADINGPANEL_LOCK";
      
      public static const UI_TRADINGPANEL_TRADING:String = "UI_TRADINGPANEL_TRADING";
      
      public static const UI_TRADINGPANEL_RIDE_SHOWBTN_CLICK:String = "UI_RIDELISTPANEL_RIDE_SHOWBTN_CLICK";
      
      public static const UI_TRADINGPANEL_RIDE_LOOKBTN_CLICK:String = "UI_RIDELISTPANEL_LOOKBTN_CLICK";
      
      public static const UI_TRADINGPANEL_CLICK:String = "UI_TRADINGPANEL_CLICK";
      
      private var rideListPanel:RideListPanel;
      
      private var targetName:FLabel;
      
      private var targetLv:FLabel;
      
      private var showBtn:SmallButton;
      
      private var targetItemList:FList;
      
      private var selfItemList:FList;
      
      private var targetRide:Sprite;
      
      private var selfRide:Sprite;
      
      private var targetCopper:FLabel;
      
      private var targetSilver:FLabel;
      
      private var targetSilverBg:F9GridBitmap;
      
      private var selfCopper:FLabel;
      
      private var selfSilver:FLabel;
      
      private var selfSilverBg:F9GridBitmap;
      
      private var copperBtn:SmallButton;
      
      private var silverBtn:SmallButton;
      
      private var tip:FTextArea;
      
      private var rideListBtn:SecondButton;
      
      private var lockBtn:SecondButton;
      
      private var tradingBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var targetMask:Shape;
      
      private var selfMask:Sprite;
      
      private var ride:Mount;
      
      public function TradingPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var lb:FLabel;
         var bg:F9GridBitmap;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 295;
         height = 460;
         titleText = LanResManager.getLanCommonTextWords("交易");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.trading.ui";
         addChild(img);
         img.x = 10;
         img.y = 0;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         this.targetName = new FLabel();
         with(this.targetName)
         {
            x = 12;
            y = 1;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("玩家名字六字的物品");
         }
         addChild(this.targetName);
         this.targetLv = new FLabel();
         with(this.targetLv)
         {
            x = 12;
            y = 15;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级：100级");
         }
         addChild(this.targetLv);
         lb = new FLabel();
         with(lb)
         {
            x = 152;
            y = 1;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("我的物品");
         }
         addChild(lb);
         this.showBtn = new SmallButton();
         this.showBtn.label = LanResManager.getLanCommonTextWords("物品上架");
         addChild(this.showBtn);
         this.showBtn.x = 210;
         this.showBtn.y = 12;
         this.showBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.targetItemList = new FList();
         this.targetItemList.skin = "list";
         this.targetItemList.itemRenderer = new TradingListRander();
         this.targetItemList.listWidth = 131;
         this.targetItemList.listHeight = 205;
         this.targetItemList.x = 13;
         this.targetItemList.y = 36;
         addChild(this.targetItemList);
         this.selfItemList = new FList();
         this.selfItemList.skin = "list";
         this.selfItemList.itemRenderer = new TradingListRander();
         this.selfItemList.listWidth = 132;
         this.selfItemList.listHeight = 205;
         this.selfItemList.x = 150;
         this.selfItemList.y = 36;
         addChild(this.selfItemList);
         this.selfItemList.addEventListener(MouseEvent.MOUSE_UP,this.onItemUp,false,30);
         this.selfItemList.addEventListener(MouseEvent.CLICK,this.onItemClick);
         this.targetRide = new Sprite();
         addChild(this.targetRide);
         this.targetRide.x = 13;
         this.targetRide.y = 246;
         this.selfRide = new Sprite();
         addChild(this.selfRide);
         this.selfRide.x = 150;
         this.selfRide.y = 246;
         this.selfRide.addEventListener(MouseEvent.CLICK,this.onRideClick);
         lb = new FLabel();
         with(lb)
         {
            x = 14 - 3;
            y = 295;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("铜钱") + "：";
         }
         addChild(lb);
         bg = Tools.get9GridBitmpByName("countBg");
         addChild(bg);
         bg.width = 96;
         bg.x = 46;
         bg.y = 295;
         img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(img);
         img.x = 48;
         img.y = 295;
         this.targetCopper = new FLabel();
         with(this.targetCopper)
         {
            x = 72;
            y = 295;
            textColor = StaticValue.ORANGE;
            text = "200";
         }
         addChild(this.targetCopper);
         lb = new FLabel();
         with(lb)
         {
            x = 152 - 3;
            y = 295;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("铜钱") + "：";
         }
         addChild(lb);
         bg = Tools.get9GridBitmpByName("countBg");
         addChild(bg);
         bg.width = 96;
         bg.x = 185;
         bg.y = 295;
         img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(img);
         img.x = 187;
         img.y = 295;
         this.selfCopper = new FLabel();
         with(this.selfCopper)
         {
            x = 210;
            y = 295;
            textColor = StaticValue.ORANGE;
            text = "200";
         }
         addChild(this.selfCopper);
         lb = new FLabel();
         with(lb)
         {
            x = 14 - 3;
            y = 319;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("元宝") + "：";
         }
         addChild(lb);
         this.targetSilverBg = Tools.get9GridBitmpByName("countBg");
         addChild(this.targetSilverBg);
         this.targetSilverBg.width = 96;
         this.targetSilverBg.x = 46;
         this.targetSilverBg.y = 319;
         img = StaticValue.getBitmapByClassName("ui.ico.money.silver");
         addChild(img);
         img.x = 48;
         img.y = 319;
         this.targetSilver = new FLabel();
         with(this.targetSilver)
         {
            x = 72;
            y = 319;
            textColor = StaticValue.ORANGE;
            text = "200";
         }
         addChild(this.targetSilver);
         lb = new FLabel();
         with(lb)
         {
            x = 152 - 3;
            y = 319;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("元宝") + "：";
         }
         addChild(lb);
         this.selfSilverBg = Tools.get9GridBitmpByName("countBg");
         addChild(this.selfSilverBg);
         this.selfSilverBg.width = 96;
         this.selfSilverBg.x = 185;
         this.selfSilverBg.y = 319;
         img = StaticValue.getBitmapByClassName("ui.ico.money.silver");
         addChild(img);
         img.x = 187;
         img.y = 319;
         this.selfSilver = new FLabel();
         with(this.selfSilver)
         {
            x = 210;
            y = 319;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "200";
         }
         addChild(this.selfSilver);
         this.copperBtn = new SmallButton();
         this.copperBtn.label = LanResManager.getLanCommonTextWords("输入铜钱");
         addChild(this.copperBtn);
         this.copperBtn.x = 160;
         this.copperBtn.y = 340;
         this.copperBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.silverBtn = new SmallButton();
         this.silverBtn.label = LanResManager.getLanCommonTextWords("输入元宝");
         addChild(this.silverBtn);
         this.silverBtn.x = 222;
         this.silverBtn.y = 340;
         this.silverBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 10;
            y = 364;
            width = 275;
            height = 20;
            defaultTextFormat = new TextFormat(null,null,StaticValue.RED,null,null,null,null,null,"center");
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("请确认好您要交易的物品后，点击锁定货物按钮");
         }
         addChild(this.tip);
         this.rideListBtn = new SecondButton();
         this.rideListBtn.label = LanResManager.getLanCommonTextWords("坐骑列表");
         addChild(this.rideListBtn);
         this.rideListBtn.x = 10;
         this.rideListBtn.y = 394;
         this.rideListBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lockBtn = new SecondButton();
         this.lockBtn.label = LanResManager.getLanCommonTextWords("锁定物品");
         addChild(this.lockBtn);
         this.lockBtn.x = 100;
         this.lockBtn.y = 394;
         this.lockBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tradingBtn = new SecondButton();
         this.tradingBtn.label = LanResManager.getLanCommonTextWords("交易");
         addChild(this.tradingBtn);
         this.tradingBtn.x = 188 - 25;
         this.tradingBtn.y = 394;
         this.tradingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = 242;
         this.cancelBtn.y = 394;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.targetMask = new Shape();
         addChild(this.targetMask);
         this.targetMask.x = 10;
         this.targetMask.y = 2;
         this.targetMask.visible = false;
         with(this.targetMask.graphics)
         {
            beginFill(16711680,0.2);
            drawRect(0,0,136,362);
            endFill();
         }
         this.selfMask = new Sprite();
         this.selfMask.visible = false;
         addChild(this.selfMask);
         this.selfMask.x = 149;
         this.selfMask.y = 2;
         with(this.selfMask.graphics)
         {
            beginFill(16711680,0.2);
            drawRect(0,0,136,362);
            endFill();
         }
      }
      
      private function onItemUp(param1:MouseEvent) : void
      {
         if(param1.target is FList)
         {
            dispatchEvent(new BaseEvent(UI_TRADINGPANEL_CLICK,"",null));
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(!(param1.target is FList))
         {
            dispatchEvent(new BaseEvent(UI_TRADINGPANEL_CLICK,"",this.selfItemList.selectItem.item));
         }
      }
      
      private function onRideClick(param1:MouseEvent) : void
      {
         if(this.selfRide.numChildren > 0)
         {
            if(param1.target is SmallButton)
            {
               return;
            }
            dispatchEvent(new BaseEvent(UI_TRADINGPANEL_CLICK,"",this.ride));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.showBtn:
               dispatchEvent(new BaseEvent(UI_TRADINGPANEL_ITEM_SHOWBTN_CLICK));
               break;
            case this.copperBtn:
               dispatchEvent(new BaseEvent(UI_TRADINGPANEL_INPUT_COPPER_CLICK));
               break;
            case this.silverBtn:
               dispatchEvent(new BaseEvent(UI_TRADINGPANEL_INPUT_SILVER_CLICK));
               break;
            case this.rideListBtn:
               dispatchEvent(new BaseEvent(UI_TRADINGPANEL_RIDELISTPANEL_SHOW));
               break;
            case this.lockBtn:
               dispatchEvent(new BaseEvent(UI_TRADINGPANEL_LOCK));
               break;
            case this.tradingBtn:
               dispatchEvent(new BaseEvent(UI_TRADINGPANEL_TRADING,"",true));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onLookSelf(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_TRADINGPANEL_RIDE_LOOKBTN_CLICK,"0",int(param1.target.name)));
      }
      
      private function onLookTarget(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_TRADINGPANEL_RIDE_LOOKBTN_CLICK,"1",int(param1.target.name)));
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         this.reset();
         dispatchEvent(new BaseEvent(UI_TRADINGPANEL_TRADING,"",false));
         if(parent)
         {
            parent.removeChild(this);
         }
      }
      
      public function showRideListPanel(param1:XML) : void
      {
         if(this.rideListPanel == null)
         {
            this.rideListPanel = new RideListPanel();
            this.rideListPanel.$parent = this;
            this.rideListPanel.type = RideListPanel.UI_RIDE_LIST_SHOP;
         }
         this.rideListPanel.setRideList(param1);
         addChild(this.rideListPanel);
         this.rideListPanel.dragAble = false;
         this.rideListPanel.visible = true;
         this.rideListPanel.x = -this.rideListPanel.width;
      }
      
      public function setTarget(param1:String, param2:int) : void
      {
         this.targetName.text = param1 + LanResManager.getLanCommonTextWords("的物品");
         this.targetLv.text = LanResManager.getLanCommonTextWords("等级") + "：" + param2;
      }
      
      public function setTargetItem(param1:Array, param2:Mount = null, param3:Number = 0, param4:Number = 0) : void
      {
         var i:int = 0;
         var ico:Bitmap = null;
         var lb:FLabel = null;
         var btn:SmallButton = null;
         var $items:Array = param1;
         var $ride:Mount = param2;
         var $copper:Number = param3;
         var $silver:Number = param4;
         var len:int = int($items.length);
         i = 0;
         while(i < len)
         {
            $items[i].$parent = this;
            i++;
         }
         this.targetItemList.dataProvider = $items;
         this.targetCopper.text = NumberFormatter.formatThousands($copper);
         this.targetSilver.text = NumberFormatter.formatThousands($silver);
         if($silver > 0)
         {
            this.targetSilverBg.filters = [new GlowFilter(StaticValue.RED,1,3,3,15,BitmapFilterQuality.LOW)];
         }
         else
         {
            this.targetSilverBg.filters = [];
         }
         if($ride != null)
         {
            while(this.targetRide.numChildren > 0)
            {
               this.targetRide.removeChildAt(0);
            }
            ico = $ride.getSmallICO();
            ico.x = 5;
            ico.y = 5;
            this.targetRide.addChild(ico);
            lb = new FLabel();
            with(lb)
            {
               
               x = 48;
               y = 7;
               textColor = StaticValue.rideColors[$ride.mountAttributeInfo.quality];
               filters = StaticValue.filter;
               text = $ride.res.name;
            }
            this.targetRide.addChild(lb);
            btn = new SmallButton();
            btn.label = LanResManager.getLanCommonTextWords("查看");
            btn.name = ($ride as PureMount).id.toString();
            this.targetRide.addChild(btn);
            btn.x = 90;
            btn.y = 23;
            btn.addEventListener(MouseEvent.CLICK,this.onLookTarget);
         }
      }
      
      public function setSelfItem(param1:Array, param2:Mount = null, param3:Number = 0, param4:Number = 0) : void
      {
         var i:int = 0;
         var ico:Bitmap = null;
         var lb:FLabel = null;
         var btn:SmallButton = null;
         var $items:Array = param1;
         var $ride:Mount = param2;
         var $copper:Number = param3;
         var $silver:Number = param4;
         var len:int = int($items.length);
         i = 0;
         while(i < len)
         {
            $items[i].$parent = this;
            i++;
         }
         this.selfItemList.dataProvider = $items;
         this.selfCopper.text = NumberFormatter.formatThousands($copper);
         this.selfSilver.text = NumberFormatter.formatThousands($silver);
         if($silver > 0)
         {
            this.selfSilverBg.filters = [new GlowFilter(StaticValue.RED,1,3,3,15,BitmapFilterQuality.LOW)];
         }
         else
         {
            this.selfSilverBg.filters = [];
         }
         if($ride != null)
         {
            this.ride = $ride;
            while(this.selfRide.numChildren > 0)
            {
               this.selfRide.removeChildAt(0);
            }
            ico = $ride.getSmallICO();
            ico.x = 5;
            ico.y = 5;
            this.selfRide.addChild(ico);
            lb = new FLabel();
            with(lb)
            {
               
               x = 48;
               y = 7;
               textColor = StaticValue.rideColors[$ride.mountAttributeInfo.quality];
               filters = StaticValue.filter;
               text = $ride.res.name;
            }
            this.selfRide.addChild(lb);
            btn = new SmallButton();
            btn.label = LanResManager.getLanCommonTextWords("查看");
            btn.name = ($ride as PureMount).id.toString();
            this.selfRide.addChild(btn);
            btn.x = 90;
            btn.y = 23;
            btn.addEventListener(MouseEvent.CLICK,this.onLookSelf);
         }
      }
      
      public function clear() : void
      {
         this.selfItemList.dataProvider = <list/>;
         this.selfCopper.text = "0";
         this.selfSilver.text = "0";
         while(this.selfRide.numChildren > 0)
         {
            this.selfRide.removeChildAt(0);
         }
         this.targetItemList.dataProvider = <list/>;
         this.targetCopper.text = "0";
         this.targetSilver.text = "0";
         while(this.targetRide.numChildren > 0)
         {
            this.targetRide.removeChildAt(0);
         }
      }
      
      public function showCopperTradingPanel(param1:Number) : void
      {
         var _loc2_:TradingSetCopperPopWindow = new TradingSetCopperPopWindow();
         _loc2_.$parent = this;
         _loc2_.setTotal(param1);
         POPWindowManager.showWindow(_loc2_);
      }
      
      public function showSilverTradingPanel(param1:int) : void
      {
         var _loc2_:TradingSetSilverPopWindow = new TradingSetSilverPopWindow();
         _loc2_.$parent = this;
         _loc2_.setTotal(param1);
         POPWindowManager.showWindow(_loc2_);
      }
      
      public function setTip(param1:String) : void
      {
         this.tip.text = param1;
      }
      
      public function lockTarget(param1:Boolean = true) : void
      {
         this.targetMask.visible = param1;
      }
      
      public function getLockTarget() : Boolean
      {
         return this.targetMask.visible;
      }
      
      public function lockSelf(param1:Boolean = true) : void
      {
         this.selfMask.visible = param1;
         var _loc2_:Boolean = !param1;
         this.showBtn.enabled = _loc2_;
         this.copperBtn.enabled = _loc2_;
         this.silverBtn.enabled = _loc2_;
         this.rideListBtn.enabled = _loc2_;
         this.lockBtn.enabled = _loc2_;
         if(this.rideListPanel != null)
         {
            this.rideListPanel.visible = _loc2_;
         }
      }
      
      public function getLockSelf() : Boolean
      {
         return this.selfMask.visible;
      }
      
      public function setOKEnabled(param1:Boolean) : void
      {
         this.tradingBtn.enabled = param1;
      }
      
      public function reset() : void
      {
         while(this.targetRide.numChildren > 0)
         {
            this.targetRide.removeChildAt(0);
         }
         while(this.selfRide.numChildren > 0)
         {
            this.selfRide.removeChildAt(0);
         }
         this.targetCopper.text = this.targetSilver.text = this.selfCopper.text = this.selfSilver.text = "0";
         this.tip.text = "";
      }
   }
}

