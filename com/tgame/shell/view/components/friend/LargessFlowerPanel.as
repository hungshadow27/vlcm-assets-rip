package com.tgame.shell.view.components.friend
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.FriendPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class LargessFlowerPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var playerName:FLabel;
      
      private var container:Sprite;
      
      private var selectBtn:SecondButton;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var flowers:Array;
      
      public function LargessFlowerPanel()
      {
         var img:Bitmap;
         var lb:FLabel;
         super();
         skin = "sceondPanel_btn";
         this.dragRestrict = false;
         dragAble = true;
         width = 254;
         height = 176;
         titleText = LanResManager.getLanCommonTextWords("赠送鲜花");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.friend.largess.flower.ui");
         addChild(img);
         img.x = 6;
         img.y = 2;
         lb = new FLabel();
         with(lb)
         {
            x = 22;
            y = 6;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"受赠人：");
         }
         addChild(lb);
         this.playerName = new FLabel();
         with(this.playerName)
         {
            x = 70;
            y = 6;
            textColor = StaticValue.BLUE;
            text = LanResManager.getLanCommonTextWords("玩家名字六字");
         }
         addChild(this.playerName);
         lb = new FLabel();
         with(lb)
         {
            x = 36;
            y = 23;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,0);
         }
         addChild(lb);
         this.container = new Sprite();
         addChild(this.container);
         this.container.x = 10;
         this.container.y = 59;
         with(this.container.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,234,35);
            endFill();
         }
         this.container.addEventListener(MouseEvent.MOUSE_UP,this.onReSelect,false,30);
         this.selectBtn = new SecondButton();
         this.selectBtn.label = LanResManager.getLanTextWords(this,"选择花朵");
         addChild(this.selectBtn);
         this.selectBtn.x = 10;
         this.selectBtn.y = 119;
         this.selectBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanTextWords(this,"赠出");
         addChild(this.okBtn);
         this.okBtn.x = (width - this.okBtn.width) / 2;
         this.okBtn.y = 119;
         this.okBtn.enabled = false;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanTextWords(this,"取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = width - this.cancelBtn.width - 10;
         this.cancelBtn.y = 119;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onReSelect(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_LARGEWW_FLOWER_PANEL_CLICK,"",param1));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.selectBtn:
               this.$parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_SELECT_FLOWER_BTN_CLICK));
               break;
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_LARGESS_OK_BTN_CLICK,"",this.flowers));
               this.onClose();
               break;
            case this.cancelBtn:
               this.$parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_LARGESS_CANCEL_BTN_CLICK));
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         this.setFlower([]);
         this.okBtn.enabled = false;
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setPlayer(param1:int, param2:String, param3:String) : void
      {
         this.playerName.text = param2;
      }
      
      public function setFlower(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:ItemFace = null;
         this.flowers = param1;
         if(this.flowers.length == 0)
         {
            this.okBtn.enabled = false;
         }
         else
         {
            this.okBtn.enabled = true;
         }
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new ItemFace(param1[_loc2_] as Goods);
            this.container.addChild(_loc4_);
            _loc4_.x = _loc2_ * 40;
            _loc2_++;
         }
      }
   }
}

