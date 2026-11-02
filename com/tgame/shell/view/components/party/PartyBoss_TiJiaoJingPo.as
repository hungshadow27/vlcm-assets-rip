package com.tgame.shell.view.components.party
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.Party_taskPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class PartyBoss_TiJiaoJingPo extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var itemContainer:Sprite;
      
      private var putBtn:SecondButton;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var arr:Array;
      
      public function PartyBoss_TiJiaoJingPo()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var ft:FTextArea;
         super();
         skin = "sceondPanel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 272;
         height = 215;
         titleText = LanResManager.getLanCommonTextWords("帮派BOSS");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         addChild(img);
         img.name = "ui.party.contribute.token.ui";
         img.x = 6;
         img.y = 20;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 5;
            width = 250;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         ft.htmlText = LanResManager.getLanCommonTextWords("将背包中的精魄拖入下方物品栏中，点击确定后即可上交精魄。帮派中最多只能同时存在个帮派，超出数量时无法提交。");
         addChild(ft);
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.itemContainer.x = 8;
         this.itemContainer.y = 80;
         with(this.itemContainer.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,255,70);
            endFill();
         }
         this.itemContainer.addEventListener(MouseEvent.CLICK,this.onItemClick);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = width / 2 / 2 - this.okBtn.width / 2;
         this.okBtn.y = 160;
         this.okBtn.enabled = false;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = width / 2 + width / 2 / 2 - this.cancelBtn.width / 2;
         this.cancelBtn.y = 160;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onDragEnter(param1:MouseEvent) : void
      {
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(param1.target is ItemFace)
         {
            this.$parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYBOSS_JINGPO_CLICK,"",param1.target as ItemFace));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYBOSS_COMMITJINGPO_CLICK,"",this.arr));
               this.onClose();
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      public function setItem(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:ItemFace = null;
         if(param1 == null)
         {
            return;
         }
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
            _loc4_.x = 5 + _loc2_ * 42;
            _loc4_.y = 18;
            _loc2_++;
         }
      }
   }
}

