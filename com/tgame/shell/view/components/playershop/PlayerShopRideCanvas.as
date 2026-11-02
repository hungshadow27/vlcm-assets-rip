package com.tgame.shell.view.components.playershop
{
   import com.fireice.list.FList;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.vo.character.Mount;
   import com.tgame.shell.view.components.PlayerShopPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class PlayerShopRideCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      public var $parent:DisplayObject;
      
      public var _type:String;
      
      private var itemList:FList;
      
      public var showBtn:SmallButton;
      
      public var hideBtn:SmallButton;
      
      public var buyBtn:SmallButton;
      
      public function PlayerShopRideCanvas()
      {
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.char.shop.ui";
         this.itemList = new FList();
         this.itemList.skin = "list";
         this.itemList.itemRenderer = new PlayerShopRideListRender();
         this.itemList.listWidth = 232;
         this.itemList.listHeight = 205;
         this.itemList.x = 2;
         this.itemList.y = 2;
         addChild(this.itemList);
         this.itemList.addEventListener(MouseEvent.CLICK,this.onList);
         this.showBtn = new SmallButton();
         this.showBtn.label = LanResManager.getLanTextWords(this,"坐骑列表");
         addChild(this.showBtn);
         this.showBtn.x = 90;
         this.showBtn.y = 210;
         this.showBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.hideBtn = new SmallButton();
         this.hideBtn.label = LanResManager.getLanTextWords(this,"坐骑下架");
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
               this.$parent.dispatchEvent(new BaseEvent(PlayerShopPanel.UI_SHOPPANEL_RIDELISTBTN_CLICK));
               break;
            case this.hideBtn:
               this.$parent.dispatchEvent(new BaseEvent(PlayerShopPanel.UI_SHOPPANEL_RIDE_HIDE_OK,"",Mount(this.itemList.selectItem.ride)));
               break;
            case this.buyBtn:
               this.$parent.dispatchEvent(new BaseEvent(PlayerShopPanel.UI_SHOPPANEL_RIDE_BUYBTN_CLICK,"",Mount(this.itemList.selectItem.ride)));
         }
      }
      
      private function onList(param1:MouseEvent) : void
      {
         if(this._type == PlayerShopPanel.CHARSHOPPANEL)
         {
            this.$parent.dispatchEvent(new BaseEvent(PlayerShopPanel.UI_SHOPPANEL_RIDESHOP_CLICK));
         }
      }
      
      public function setRideList(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            param1[_loc2_].$parent = this.$parent;
            _loc2_++;
         }
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
      }
   }
}

