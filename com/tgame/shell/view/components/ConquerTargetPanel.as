package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.ConquerTarget.ConquerTargetPlarListRender;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ConquerTargetPanel extends Sprite
   {
      
      public static const UI_CONQUERTARGET_SUB:String = "UI_CONQUERTARGET_SUB";
      
      public static const UI_BOSS_SHOW:String = "UI_BOSS_SHOW";
      
      public static const UI_PLAY_SHOW:String = "UI_PLAY_SHOW";
      
      private var lb:FLabel;
      
      private var listContainer:Sprite;
      
      private var Scroll:FVScorllBar;
      
      private var giftList:FList;
      
      private var prizelistContainer:Sprite;
      
      private var prizetaskScroll:FVScorllBar;
      
      private var prizegiftList:FList;
      
      private var subBtn:SecondButton;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      public function ConquerTargetPanel()
      {
         super();
         addChild(StaticValue.getBitmapByClassName("ui.zhengfu.wanfa.ui"));
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 5;
            y = 5;
            graphics.beginFill(16711680,0.5);
            graphics.drawRect(0,0,120,330);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new ConquerTargetPlarListRender();
         this.giftList.listWidth = 120;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.giftList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.Scroll = new FVScorllBar(this.listContainer,330);
         addChild(this.Scroll);
         this.Scroll.x = 125;
         this.Scroll.y = 5;
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 145;
            y = 5;
            wordWrap = true;
            width = 115;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BlUE50;
            htmlText = "";
         }
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            x = 145;
            y = 28;
            wordWrap = true;
            width = 115;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BlUE50;
            htmlText = "";
         }
         addChild(this.ft2);
         this.ft3 = new FTextArea();
         with(this.ft3)
         {
            x = 145;
            y = 125;
            wordWrap = true;
            width = 115;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BlUE50;
            htmlText = "";
         }
         addChild(this.ft3);
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         if(this.giftList.selectItem == null)
         {
            return;
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function SetInitializePlay(param1:Array) : void
      {
         this.giftList.dataProvider = param1;
         this.Scroll.update();
      }
      
      public function SetInitializePrize(param1:Array) : void
      {
      }
   }
}

