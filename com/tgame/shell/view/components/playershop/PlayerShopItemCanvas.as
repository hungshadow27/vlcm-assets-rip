package com.tgame.shell.view.components.playershop
{
   import com.fireice.list.FList;
   import com.fireice.scroll.FVScorllBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.PlayerShopPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class PlayerShopItemCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      public var $parent:DisplayObject;
      
      public var _type:String;
      
      private var itemList:FList;
      
      private var scroll:FVScorllBar;
      
      public var showBtn:SmallButton;
      
      public var hideBtn:SmallButton;
      
      public var buyBtn:SmallButton;
      
      public function PlayerShopItemCanvas()
      {
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.char.shop.ui";
         this.itemList = new FList();
         this.itemList.skin = "list";
         this.itemList.itemRenderer = new PlayerShopItemListRender();
         this.itemList.listWidth = 213;
         this.itemList.listHeight = 205;
         this.itemList.x = 2;
         this.itemList.y = 2;
         addChild(this.itemList);
         this.itemList.addEventListener(MouseEvent.CLICK,this.onList);
         this.scroll = new FVScorllBar(this.itemList,205);
         addChild(this.scroll);
         this.scroll.x = 217;
         this.scroll.y = 2;
         this.showBtn = new SmallButton();
         this.showBtn.label = LanResManager.getLanTextWords(this,"物品上架");
         addChild(this.showBtn);
         this.showBtn.x = 110;
         this.showBtn.y = 210;
         this.showBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.hideBtn = new SmallButton();
         this.hideBtn.label = LanResManager.getLanTextWords(this,"物品下架");
         addChild(this.hideBtn);
         this.hideBtn.x = 174;
         this.hideBtn.y = 210;
         this.hideBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.buyBtn = new SmallButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         addChild(this.buyBtn);
         this.buyBtn.x = 174;
         this.buyBtn.y = 210;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.showBtn:
               this.$parent.dispatchEvent(new BaseEvent(PlayerShopPanel.UI_SHOPPANEL_ITEM_SHOWBTN_CLICK));
               break;
            case this.hideBtn:
               this.$parent.dispatchEvent(new BaseEvent(PlayerShopPanel.UI_SHOPPANEL_ITEM_HIDE_OK,"",Goods(this.itemList.selectItem.item)));
               break;
            case this.buyBtn:
               this.$parent.dispatchEvent(new BaseEvent(PlayerShopPanel.UI_SHOPPANEL_ITEM_BUYBTN_CLICK,"",Goods(this.itemList.selectItem.item)));
         }
      }
      
      private function onList(param1:MouseEvent) : void
      {
         if(this._type == PlayerShopPanel.CHARSHOPPANEL)
         {
            this.$parent.dispatchEvent(new BaseEvent(PlayerShopPanel.UI_SHOPPANEL_ITEMSHOP_CLICK));
         }
      }
      
      public function setItemList(param1:Array) : void
      {
         this.itemList.dataProvider = param1;
         if(param1.length == 0)
         {
            this.buyBtn.enabled = false;
            this.hideBtn.enabled = false;
            return;
         }
         this.itemList.setSelectItemByIndex(0);
         this.buyBtn.enabled = true;
         this.hideBtn.enabled = true;
         this.scroll.update();
      }
   }
}

