package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class ItemTiHuanPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var itemSpr:Sprite;
      
      private var itemName:FTextArea;
      
      private var item2:Bitmap;
      
      private var itemName2:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      public function ItemTiHuanPanel()
      {
         var lb:FLabel;
         var jiantouBmp:Bitmap;
         var img:Bitmap = null;
         super();
         this.skin = "sceondPanel";
         width = 240;
         height = 190;
         titleText = LanResManager.getLanCommonTextWords("领取物品");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         lb = new FLabel();
         with(lb)
         {
            x = 15;
            y = 12;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("确定要进行以下技能替换吗？");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 15;
            y = 100;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("注:替换后当前技能将更改为替换技能。");
         }
         addChild(lb);
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(img);
         img.x = 30;
         img.y = 50;
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(img);
         img.x = 165;
         img.y = 50;
         jiantouBmp = StaticValue.getBitmapByClassName("ui.duanzhao.jiantou");
         jiantouBmp.x = 100;
         jiantouBmp.y = 55;
         addChild(jiantouBmp);
         this.itemSpr = new Sprite();
         addChild(this.itemSpr);
         this.itemSpr.x = 32;
         this.itemSpr.y = 52;
         this.itemName = new FTextArea();
         with(this.itemName)
         {
            x = 25;
            y = 32;
            width = 80;
            height = 18;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("当前技能");
         }
         addChild(this.itemName);
         this.itemName2 = new FTextArea();
         with(this.itemName2)
         {
            x = 160;
            y = 32;
            width = 80;
            height = 18;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("替换技能");
         }
         addChild(this.itemName2);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("替换新技能");
         addChild(this.okBtn);
         this.okBtn.x = 140;
         this.okBtn.y = 130;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("保留老技能");
         addChild(this.cancelBtn);
         this.cancelBtn.x = 15;
         this.cancelBtn.y = 130;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(ShouYuanChouJiangPanel.UI_KongMingLock_LINGJIANG_CLICK,"",3));
               this.onClose();
               break;
            case this.cancelBtn:
               this.$parent.dispatchEvent(new BaseEvent(ShouYuanChouJiangPanel.UI_KongMingLock_LINGJIANG_CLICK,"",4));
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setItem(param1:Goods, param2:Goods) : void
      {
         while(this.itemSpr.numChildren != 0)
         {
            this.itemSpr.removeChildAt(0);
         }
         var _loc3_:ItemFace = new ItemFace(param1);
         this.itemSpr.addChild(_loc3_);
         var _loc4_:ItemFace = new ItemFace(param2);
         _loc4_.x = 135;
         this.itemSpr.addChild(_loc4_);
      }
   }
}

