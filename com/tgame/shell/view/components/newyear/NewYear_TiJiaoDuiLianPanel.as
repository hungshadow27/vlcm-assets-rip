package com.tgame.shell.view.components.newyear
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.NewYearPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class NewYear_TiJiaoDuiLianPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var itemContainer:Sprite;
      
      private var putBtn:SecondButton;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var arr:Array;
      
      public function NewYear_TiJiaoDuiLianPanel()
      {
         var i:int;
         var ft:FTextArea;
         var bit:Bitmap = null;
         super();
         skin = "sceondPanel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 325;
         height = 150;
         titleText = LanResManager.getLanCommonTextWords("提交对联");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         i = 0;
         while(i < 7)
         {
            bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
            bit.x = 20 + i * 42;
            bit.y = 30 + 10;
            addChild(bit);
            i++;
         }
         ft = new FTextArea();
         with(ft)
         {
            multiline = true;
            wordWrap = true;
            x = 18;
            y = 5;
            width = 295;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         ft.htmlText = LanResManager.getLanCommonTextWords("从背包中将春联文字拖入，必须放满七格，需要使用到重复文字时，请拆分后提交。");
         addChild(ft);
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.itemContainer.x = 0;
         this.itemContainer.y = 10;
         with(this.itemContainer.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,310,70);
            endFill();
         }
         this.itemContainer.addEventListener(MouseEvent.MOUSE_UP,this.onDragEnter,false,30);
         this.itemContainer.addEventListener(MouseEvent.CLICK,this.onItemClick);
         this.putBtn = new SecondButton();
         this.putBtn.label = LanResManager.getLanCommonTextWords("放入文字");
         addChild(this.putBtn);
         this.putBtn.x = 20 + 15;
         this.putBtn.y = 152 - 55;
         this.putBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("提交");
         addChild(this.okBtn);
         this.okBtn.x = 107 + 25;
         this.okBtn.y = 152 - 55;
         this.okBtn.enabled = false;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = 195 + 30;
         this.cancelBtn.y = 152 - 55;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onDragEnter(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(NewYearPanel.UI_CHUNLIANPANEL_DRAG_ENTER));
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(param1.target is ItemFace)
         {
            this.$parent.dispatchEvent(new BaseEvent(NewYearPanel.UI_CHUNLIANPANEL_TOKEN_CLICK,"",param1.target as ItemFace));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.putBtn:
               this.$parent.dispatchEvent(new BaseEvent(NewYearPanel.UI_CHUNLIANPANEL_TOKEN_PUT));
               break;
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(NewYearPanel.UI_TIJIAODUILIAN_BTN,"",this.arr));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      public function setItem(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:ItemFace = null;
         this.arr = param1;
         if(this.arr.length > 0)
         {
            this.okBtn.enabled = true;
         }
         else
         {
            this.okBtn.enabled = false;
         }
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new ItemFace(param1[_loc2_] as Goods);
            this.itemContainer.addChild(_loc4_);
            _loc4_.x = 20 + _loc2_ * 42 + 2;
            _loc4_.y = 30 + 2;
            _loc2_++;
         }
      }
      
      public function setNull() : void
      {
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         this.okBtn.enabled = false;
      }
   }
}

