package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class GiftCardPanel extends FPanel
   {
      
      public static const UI_GIFTCARD_NO_CHECK:String = "UI_GIFTCARD_NO_CHECK";
      
      public static const UI_GIFTCARD_GET:String = "UI_GIFTCARD_GET";
      
      private var title:FLabel;
      
      private var content:FTextArea;
      
      private var input:FTextInput;
      
      private var btn:SecondButton;
      
      private var itemContainer:Sprite;
      
      public function GiftCardPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 460;
         height = 180;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.title = new FLabel();
         addChild(this.title);
         this.title.x = 25;
         this.title.y = 20;
         this.title.textColor = StaticValue.ORANGE;
         this.title.filters = StaticValue.filter;
         this.title.text = LanResManager.getLanCommonTextWords("请输入您的礼品卡卡号：");
         this.content = new FTextArea();
         addChild(this.content);
         this.content.x = 10;
         this.content.y = 30;
         this.content.textColor = StaticValue.BLUE;
         this.content.filters = StaticValue.filter;
         this.content.width = 440;
         this.content.height = 20;
         this.content.defaultTextFormat = StaticValue.format;
         this.input = new FTextInput();
         addChild(this.input);
         this.input.defaultTextFormat = StaticValue.format;
         this.input.x = 20;
         this.input.y = 60;
         this.input.width = 420;
         this.input.height = 18;
         this.input.border = true;
         this.input.borderColor = StaticValue.BlUE20;
         this.input.background = true;
         this.input.backgroundColor = 6052956;
         this.input.textColor = StaticValue.WHITE;
         this.input.setMaxChars(100);
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.itemContainer.x = 10;
         this.itemContainer.y = 50;
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("验证卡号");
         addChild(this.btn);
         this.btn.x = 230 - this.btn.width / 2;
         this.btn.y = 100;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         this.reset();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(this.btn.label)
         {
            case LanResManager.getLanCommonTextWords("验证卡号"):
               dispatchEvent(new BaseEvent(UI_GIFTCARD_NO_CHECK,"",this.input.text));
               break;
            case LanResManager.getLanCommonTextWords("领取奖品"):
               dispatchEvent(new BaseEvent(UI_GIFTCARD_GET));
         }
      }
      
      public function reset() : void
      {
         this.title.y = 20;
         this.content.text = "";
         this.title.text = LanResManager.getLanCommonTextWords("请输入您的礼品卡卡号：");
         this.btn.label = LanResManager.getLanCommonTextWords("验证卡号");
         this.input.visible = true;
         this.input.text = "";
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
      }
      
      public function setItem(param1:String, param2:Array) : void
      {
         var _loc4_:ItemFace = null;
         var _loc5_:int = 0;
         this.title.y = 10;
         this.title.text = LanResManager.getLanCommonTextWords("恭喜您获得：");
         this.content.text = param1;
         this.btn.label = LanResManager.getLanCommonTextWords("领取奖品");
         this.input.visible = false;
         var _loc3_:int = (460 - param2.length * 39) / 2;
         var _loc6_:int = int(param2.length);
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc4_ = new ItemFace(param2[_loc5_] as Goods);
            this.itemContainer.addChild(_loc4_);
            _loc4_.x = _loc5_ * 39 + _loc3_;
            _loc5_++;
         }
      }
   }
}

