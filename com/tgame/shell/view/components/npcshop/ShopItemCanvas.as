package com.tgame.shell.view.components.npcshop
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.NPCShopPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class ShopItemCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var container:Sprite;
      
      private var preBtn:SmallButton;
      
      private var pageCount:FLabel;
      
      private var nextBtn:SmallButton;
      
      private var buyBtn:SecondButton;
      
      private var sellBtn:SecondButton;
      
      private var repairBtn:SecondButton;
      
      private var tipCanvas:FCanvas;
      
      private var Scroll:FVScorllBar;
      
      private var helpBtn:FSimpleButton;
      
      public function ShopItemCanvas()
      {
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "box";
         this.tipCanvas.width = 237;
         this.tipCanvas.height = 227;
         addChild(this.tipCanvas);
         this.container = new Sprite();
         addChild(this.container);
         with(this.container.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,213,220);
            endFill();
         }
         this.container.x = 3;
         this.container.y = 3;
         this.container.addEventListener(MouseEvent.MOUSE_UP,this.onBuy,false,30);
         this.container.addEventListener(MouseEvent.CLICK,this.onItemClick);
         this.Scroll = new FVScorllBar(this.container,220);
         addChild(this.Scroll);
         this.Scroll.x = 218;
         this.Scroll.y = 3;
         this.preBtn = new SmallButton();
         this.preBtn.label = LanResManager.getLanCommonTextWords("上一页");
         addChild(this.preBtn);
         this.preBtn.x = 58;
         this.preBtn.y = 203;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.preBtn.visible = false;
         this.pageCount = new FLabel();
         with(this.pageCount)
         {
            x = 108;
            y = 203;
            textColor = StaticValue.WHITE;
            text = "1/1";
         }
         addChild(this.pageCount);
         this.pageCount.visible = false;
         this.nextBtn = new SmallButton();
         this.nextBtn.label = LanResManager.getLanCommonTextWords("下一页");
         addChild(this.nextBtn);
         this.nextBtn.x = 132;
         this.nextBtn.y = 203;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextBtn.visible = false;
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanTextWords(this,"购买");
         addChild(this.buyBtn);
         this.buyBtn.x = 30;
         this.buyBtn.y = 236;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.sellBtn = new SecondButton();
         this.sellBtn.label = LanResManager.getLanTextWords(this,"出售");
         addChild(this.sellBtn);
         this.sellBtn.x = (width - this.sellBtn.width) / 2 + 10;
         this.sellBtn.y = 236;
         this.sellBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.repairBtn = new SecondButton();
         this.repairBtn.label = LanResManager.getLanTextWords(this,"修理");
         addChild(this.repairBtn);
         this.repairBtn.x = width - this.repairBtn.width - 10;
         this.repairBtn.y = 236;
         this.repairBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.helpBtn = new FSimpleButton();
         this.helpBtn.skin = "helpBtn";
         addChild(this.helpBtn);
         this.helpBtn.x = 0;
         this.helpBtn.y = 236;
         this.helpBtn.addEventListener(MouseEvent.CLICK,this.showHelp);
         this.helpBtn.visible = false;
      }
      
      private function showHelp(param1:MouseEvent) : void
      {
         if(HelpManager.getVisable(HelpManager.UI_HELP_TYPE_TRADING))
         {
            HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_TRADING);
         }
         else
         {
            HelpManager.showHelp(this.$parent,HelpManager.UI_HELP_TYPE_TRADING);
         }
      }
      
      private function onBuy(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(NPCShopPanel.UI_NPC_SHOP_ITEM_CLICK,"",null));
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         var _loc2_:Object = null;
         if(param1.target is ItemFace)
         {
            _loc2_ = (param1.target as ItemFace).getBaseItem();
            this.$parent.dispatchEvent(new BaseEvent(NPCShopPanel.UI_NPC_SHOP_ITEM_CLICK,"",_loc2_));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.preBtn:
               this.$parent.dispatchEvent(new BaseEvent(NPCShopPanel.UI_NPC_SHOP_GET_PAGE,"",1));
               break;
            case this.nextBtn:
               this.$parent.dispatchEvent(new BaseEvent(NPCShopPanel.UI_NPC_SHOP_GET_PAGE,"",2));
               break;
            case this.buyBtn:
               this.$parent.dispatchEvent(new BaseEvent(NPCShopPanel.UI_NPC_SHOP_BUYBTN_CLICK));
               break;
            case this.sellBtn:
               this.$parent.dispatchEvent(new BaseEvent(NPCShopPanel.UI_NPC_SHOP_SELLBTN_CLICK));
               break;
            case this.repairBtn:
               this.$parent.dispatchEvent(new BaseEvent(NPCShopPanel.UI_NPC_SHOP_REPAIRBTN_CLICK));
         }
      }
      
      public function setItem(param1:Array, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false) : void
      {
         var len:int;
         var i:int = 0;
         var j:int = 0;
         var item:ItemFace = null;
         var goods:Goods = null;
         var lb:FLabel = null;
         var img:Bitmap = null;
         var bg:F9GridBitmap = null;
         var items:Array = param1;
         var page:int = param2;
         var total:int = param3;
         var isHome:Boolean = param4;
         var isEnd:Boolean = param5;
         this.preBtn.enabled = !isHome;
         this.nextBtn.enabled = !isEnd;
         this.pageCount.text = page + "/" + total;
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         len = int(items.length);
         i = 0;
         while(i < len)
         {
            img = StaticValue.getBitmapByClassName("ui.tiem.slot");
            img.x = i % 2 * 105;
            img.y = int(i / 2) * 44;
            this.container.addChild(img);
            goods = items[i] as Goods;
            item = new ItemFace(goods);
            item.showRedMask();
            this.container.addChild(item);
            item.x = i % 2 * 105 + 2;
            item.y = int(i / 2) * 44 + 2;
            lb = new FLabel();
            with(lb)
            {
               
               x = i % 2 * 105 + 44;
               y = int(i / 2) * 44 + 2;
               textColor = StaticValue.WHITE;
               filters = StaticValue.filter;
               text = goods.res.name;
            }
            this.container.addChild(lb);
            bg = Tools.get9GridBitmpByName("countBg");
            bg.width = 60;
            bg.x = i % 2 * 105 + 40;
            bg.y = int(i / 2) * 44 + 20;
            this.container.addChild(bg);
            img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
            img.x = i % 2 * 105 + 39;
            img.y = int(i / 2) * 44 + 19;
            this.container.addChild(img);
            lb = new FLabel();
            with(lb)
            {
               
               x = i % 2 * 105 + 61;
               y = int(i / 2) * 44 + 21;
               textColor = StaticValue.ORANGE;
               filters = StaticValue.filter;
               text = goods.res.buy_price;
            }
            this.container.addChild(lb);
            i++;
         }
         this.Scroll.update();
      }
   }
}

