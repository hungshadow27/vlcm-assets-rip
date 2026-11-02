package com.tgame.shell.view.components.equippudding
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.EquipPuddingPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class StoneAttributeBestrowPanel extends FPanel
   {
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      public var $parent:DisplayObject;
      
      private var item:Goods;
      
      private var container:Sprite;
      
      public function StoneAttributeBestrowPanel()
      {
         var img:Bitmap;
         var text1:FTextArea;
         super();
         skin = "sceondPanel_btn";
         width = 231;
         height = 330;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("宝石属性覆盖确认");
         img = StaticValue.getBitmapByClassName("ui.equip.stone.attribute.bestrow.ui");
         addChild(img);
         img.x = 6;
         img.y = 2;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         text1 = new FTextArea();
         with(text1)
         {
            width = 206;
            height = 60;
            x = 10;
            y = 4;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanTextWords(this,"融合了下面的宝石");
         }
         addChild(text1);
         text1 = new FTextArea();
         with(text1)
         {
            width = 212;
            height = 40;
            x = 10;
            y = 67;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"若您选择不替换");
         }
         addChild(text1);
         text1 = new FTextArea();
         with(text1)
         {
            width = 212;
            height = 20;
            x = 12;
            y = 110;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"现有装备宝石属性") + "：</font></textformat>";
         }
         addChild(text1);
         this.container = new Sprite();
         addChild(this.container);
         this.container.x = 19;
         this.container.y = 135;
         this.container.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanTextWords(this,"替换该宝石");
         addChild(this.okBtn);
         this.okBtn.x = 25;
         this.okBtn.y = 277;
         this.okBtn.enabled = false;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanTextWords(this,"不替换宝石");
         addChild(this.cancelBtn);
         this.cancelBtn.x = 128;
         this.cancelBtn.y = 277;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         this.hideFram();
         this.item = (param1.target as ItemFace).getBaseItem() as Goods;
         (param1.target as ItemFace).showFram = true;
         this.okBtn.enabled = true;
      }
      
      private function hideFram() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = this.container.numChildren;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            (this.container.getChildAt(_loc1_) as ItemFace).showFram = false;
            _loc1_++;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               if(this.item != null)
               {
                  this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_ATTRIBUTE_BESTROW_OK,"",this.item));
               }
               break;
            case this.cancelBtn:
               this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_ATTRIBUTE_BESTROW_CANCEL));
         }
         visible = false;
         this.reset();
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function reset() : void
      {
         this.item = null;
         this.okBtn.enabled = false;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_ATTRIBUTE_BESTROW_CANCEL));
         this.reset();
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setStones(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:ItemFace = null;
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new ItemFace(param1[_loc2_] as Goods);
            switch(_loc2_)
            {
               case 0:
                  _loc4_.x = 0;
                  _loc4_.y = 0;
                  break;
               case 1:
                  _loc4_.x = 106;
                  _loc4_.y = 0;
                  break;
               case 2:
                  _loc4_.x = 0;
                  _loc4_.y = 43;
                  break;
               case 3:
                  _loc4_.x = 106;
                  _loc4_.y = 43;
                  break;
               case 4:
                  _loc4_.x = 0;
                  _loc4_.y = 86;
            }
            this.container.addChild(_loc4_);
            _loc2_++;
         }
      }
   }
}

