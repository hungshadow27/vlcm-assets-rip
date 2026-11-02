package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FButton;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class yn888ShopPanel extends FPanel
   {
      
      public static const UI_REQUEST_YUENAN888SHOP:String = "UI_REQUEST_YUENAN888SHOP";
      
      public static const UI_YUENAN888SHOPGOODBUY:String = "UI_YUENAN888SHOPGOODBUY";
      
      private var tabBar:FTabBar;
      
      private var spr1:Sprite;
      
      private var spr2:Sprite;
      
      private var spr3:Sprite;
      
      private var spr4:Sprite;
      
      private var spr5:Sprite;
      
      private var ty:int = 1;
      
      public function yn888ShopPanel()
      {
         super();
         skin = "panel_btn";
         width = 725;
         height = 577;
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("888商城");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.tabBar = new FTabBar();
         this.tabBar.addButton("60-80" + LanResManager.getLanCommonTextWords("级"),this.onTabClick);
         this.tabBar.addButton("90-110" + LanResManager.getLanCommonTextWords("级"),this.onTabClick);
         this.tabBar.addButton("120-140" + LanResManager.getLanCommonTextWords("级"),this.onTabClick);
         this.tabBar.addButton("150" + LanResManager.getLanCommonTextWords("级"),this.onTabClick);
         addChild(this.tabBar);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.spr1 = new Sprite();
         this.spr1.y = 25;
         addChild(this.spr1);
         this.spr2 = new Sprite();
         this.spr2.y = 25;
         addChild(this.spr2);
         this.spr3 = new Sprite();
         this.spr3.y = 25;
         addChild(this.spr3);
         this.spr4 = new Sprite();
         this.spr4.y = 25;
         addChild(this.spr4);
         this.spr5 = new Sprite();
         this.spr5.y = 25;
         addChild(this.spr5);
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case "30-50" + LanResManager.getLanCommonTextWords("级"):
               this.ty = 1;
               dispatchEvent(new BaseEvent(UI_REQUEST_YUENAN888SHOP,"",1));
               break;
            case "60-80" + LanResManager.getLanCommonTextWords("级"):
               this.ty = 2;
               dispatchEvent(new BaseEvent(UI_REQUEST_YUENAN888SHOP,"",2));
               break;
            case "90-110" + LanResManager.getLanCommonTextWords("级"):
               this.ty = 3;
               dispatchEvent(new BaseEvent(UI_REQUEST_YUENAN888SHOP,"",3));
               break;
            case "120-140" + LanResManager.getLanCommonTextWords("级"):
               this.ty = 4;
               dispatchEvent(new BaseEvent(UI_REQUEST_YUENAN888SHOP,"",4));
               break;
            case "150" + LanResManager.getLanCommonTextWords("级"):
               this.ty = 5;
               dispatchEvent(new BaseEvent(UI_REQUEST_YUENAN888SHOP,"",5));
         }
      }
      
      private function reType(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ = "30-50" + LanResManager.getLanCommonTextWords("级");
               break;
            case 2:
               _loc2_ = "60-80" + LanResManager.getLanCommonTextWords("级");
               break;
            case 3:
               _loc2_ = "90-110" + LanResManager.getLanCommonTextWords("级");
               break;
            case 4:
               _loc2_ = "120-140" + LanResManager.getLanCommonTextWords("级");
               break;
            case 5:
               _loc2_ = "150" + LanResManager.getLanCommonTextWords("级");
         }
         return _loc2_;
      }
      
      private function onBuyClick(param1:MouseEvent) : void
      {
         var str:String = null;
         var ar:Array = null;
         var e:MouseEvent = param1;
         var btn:SecondButton = e.target as SecondButton;
         str = btn.name;
         ar = str.split(",");
         str = LanResManager.getLanCommonTextWords("您确定购买该物品么？");
         FAlert.okLabel = LanResManager.getLanCommonTextWords("购买");
         FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
         FAlert.show(str,"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(MallPanel.UI_MALLPANEL_BUY,"",[ar[0],ar[1],0]));
            }
         },true);
      }
      
      public function setData(param1:int, param2:Array) : void
      {
         var i:int;
         var cas:FCanvas = null;
         var spr:Sprite = null;
         var bg:DisplayObject = null;
         var line:Bitmap = null;
         var ftLV:FTextArea = null;
         var ar:Array = null;
         var j:int = 0;
         var obj:Object = null;
         var sp:Sprite = null;
         var ftName:FTextArea = null;
         var go:Goods = null;
         var ftGoodName:FTextArea = null;
         var item:ItemFace = null;
         var ftCount:FTextArea = null;
         var ftSj:FTextArea = null;
         var bit:Bitmap = null;
         var ftPrice:FTextArea = null;
         var btn:SecondButton = null;
         var type:int = param1;
         var arr:Array = param2;
         this.tabBar.setCurrentButtonByLabel(this.reType(type));
         while(this["spr" + type].numChildren > 0)
         {
            this["spr" + type].removeChildAt(0);
         }
         this.spr1.visible = this.spr2.visible = this.spr3.visible = this.spr4.visible = this.spr5.visible = false;
         this["spr" + type].visible = true;
         cas = new FCanvas();
         cas.width = 705;
         cas.height = 477;
         cas.skin = "box";
         cas.x = 10;
         cas.y = 0;
         this["spr" + type].addChild(cas);
         i = 0;
         while(i < arr.length)
         {
            spr = new Sprite();
            spr.x = 10;
            spr.y = 158 * i;
            this["spr" + type].addChild(spr);
            bg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/yn888shop/bg.png",696,158);
            bg.x = 1;
            bg.y = 0;
            spr.addChild(bg);
            line = new Bitmap();
            line = StaticValue.getBitmapByClassName("ui.line");
            line.x = 3;
            line.y = 157;
            line.width = 705;
            spr.addChild(line);
            ftLV = new FTextArea();
            ftLV.height = 50;
            ftLV.width = 50;
            ftLV.x = 18;
            ftLV.y = 60;
            ftLV.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("级") + "<br>" + arr[i].lv + "</font>";
            spr.addChild(ftLV);
            ar = arr[i].obj;
            j = 0;
            while(j < arr[i].num)
            {
               obj = ar[j];
               sp = new Sprite();
               sp.x = 40 + 145 * j + 18 * (j + 1);
               sp.y = 0;
               with(sp.graphics)
               {
                  
                  beginFill(0,0);
                  drawRect(0,0,160,160);
                  endFill();
               }
               spr.addChild(sp);
               ftName = new FTextArea();
               ftName.y = 0;
               ftName.width = 145;
               ftName.height = 22;
               ftName.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + obj.name + "</font>";
               ftName.x = 145 / 2 - ftName.textWidth / 2;
               go = new Goods(obj.gid);
               ftGoodName = new FTextArea();
               ftGoodName.y = 12;
               ftGoodName.height = 22;
               ftGoodName.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + go.res.name + "</font>";
               ftGoodName.x = 145 / 2 - ftGoodName.textWidth / 2;
               ftGoodName.width = 140;
               sp.addChild(ftGoodName);
               item = new ItemFace(go,65,65);
               item.x = 39;
               item.y = 39;
               sp.addChild(item);
               ftCount = new FTextArea();
               ftCount.y = 85;
               ftCount.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>*" + obj.count + "</font>";
               ftCount.x = 108;
               sp.addChild(ftCount);
               ftSj = new FTextArea();
               ftSj.y = 112;
               ftSj.width = 50;
               ftSj.height = 22;
               ftSj.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("售价：") + "</font>";
               ftSj.x = 25;
               sp.addChild(ftSj);
               bit = StaticValue.getBitmapByClassName("ui.ico.money.silver");
               sp.addChild(bit);
               bit.x = 60;
               bit.y = 112;
               ftPrice = new FTextArea();
               ftPrice.y = 112;
               ftPrice.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>888 " + LanResManager.getLanCommonTextWords("元宝") + "</font>";
               ftPrice.x = 85;
               ftPrice.width = 110;
               ftPrice.height = 22;
               sp.addChild(ftPrice);
               btn = new SecondButton();
               btn.name = obj.id + "," + obj.count;
               if(obj.ty == 0)
               {
                  btn.label = LanResManager.getLanCommonTextWords("购买");
                  btn.enabled = true;
               }
               else if(obj.ty == 1)
               {
                  btn.label = LanResManager.getLanCommonTextWords("已购买");
                  btn.enabled = false;
               }
               else
               {
                  btn.label = LanResManager.getLanCommonTextWords("不可购买");
                  btn.enabled = false;
               }
               btn.y = 133;
               btn.x = 145 / 2 - btn.width / 2;
               btn.addEventListener(MouseEvent.CLICK,this.onBuyClick);
               sp.addChild(btn);
               j++;
            }
            i++;
         }
      }
      
      public function reTypeID() : int
      {
         return this.ty;
      }
   }
}

