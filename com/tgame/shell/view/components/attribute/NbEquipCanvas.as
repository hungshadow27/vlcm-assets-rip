package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.tgame.common.GameConfig;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class NbEquipCanvas extends Sprite
   {
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var img:Bitmap;
      
      private var equipContainer:Sprite;
      
      private var itemClickSta:Boolean = true;
      
      private var preAndNextBtnSta:Boolean = true;
      
      public var $parent:DisplayObject;
      
      public var $parent2:DisplayObject;
      
      public var equipArray:Array = new Array();
      
      private var itemNum:int = 7;
      
      private var curIndex:int = 0;
      
      public function NbEquipCanvas()
      {
         super();
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/nbequip/bg.swf");
         addChild(_loc1_);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "nbEquipUpBtn";
         addChild(this.previousButton);
         this.previousButton.x = 17;
         this.previousButton.y = 105;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.previousButton.visible = false;
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nbEquipUpBtn";
         this.nextButton.rotation = 180;
         addChild(this.nextButton);
         this.nextButton.x = 37;
         this.nextButton.y = 435;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton.visible = false;
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 8;
         this.equipContainer.y = 128;
         this.equipContainer.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(!this.preAndNextBtnSta)
         {
            return;
         }
         switch(param1.target)
         {
            case this.previousButton:
               this.curIndex = (this.curIndex - 1) % this.equipArray.length;
               this.setEquipItem();
               break;
            case this.nextButton:
               this.curIndex = (this.curIndex + 1) % this.equipArray.length;
               this.setEquipItem();
         }
      }
      
      public function initEquipList() : void
      {
         this.curIndex = 0;
         this.nextButton.visible = false;
         this.previousButton.visible = false;
         this.equipArray = new Array();
         this.setEquipItem();
      }
      
      public function addEuqip(param1:Goods) : void
      {
         this.curIndex = 0;
         if(param1.res.position == ItemPositionRange.POSTION_YLZR || param1.res.position == ItemPositionRange.POSTION_STDRJ)
         {
            this.equipArray.unshift(param1);
         }
         else
         {
            this.equipArray.push(param1);
         }
         if(this.equipArray.length > this.itemNum)
         {
            this.nextButton.visible = true;
            this.previousButton.visible = true;
         }
         else
         {
            this.nextButton.visible = false;
            this.previousButton.visible = false;
         }
      }
      
      public function setEquipItem() : void
      {
         var _loc2_:Goods = null;
         var _loc3_:ItemFace = null;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.itemNum && _loc1_ < this.equipArray.length)
         {
            _loc2_ = this.getGoodsByIndex(_loc1_ + this.curIndex);
            if(_loc2_ != null)
            {
               _loc3_ = new ItemFace(_loc2_);
               _loc3_.y = _loc1_ * (35 + 7);
               _loc3_.showRedMask();
               _loc3_.showStrengthenLv = true;
               _loc3_.name = String(_loc2_.res.position);
               this.equipContainer.addChild(_loc3_);
            }
            _loc1_++;
         }
      }
      
      public function getGoodsByIndex(param1:int) : Goods
      {
         return this.equipArray[(this.equipArray.length + param1) % this.equipArray.length];
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.itemClickSta && this.$parent2 != null)
         {
            this.$parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function setClickSta(param1:Boolean, param2:Boolean = true) : *
      {
         this.itemClickSta = param1;
         this.preAndNextBtnSta = param2;
      }
   }
}

