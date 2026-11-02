package com.tgame.shell.view.components.shiJieBei
{
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.SecondButton;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class ShengFuJingCai extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var ceshi:SecondButton;
      
      public function ShengFuJingCai()
      {
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.multiline = true;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.x = 7;
         this.tip.y = 3;
         this.tipCanvas.addChild(this.tip);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 0;
            y = 5;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,732,500);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new ShengFuJingCaiList();
         this.giftList.listWidth = 732;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.Scroll = new FVScorllBar(this.listContainer,500);
         addChild(this.Scroll);
         this.Scroll.x = 487 + 250 + 3;
         this.Scroll.y = 0;
      }
      
      public function setInitialize(param1:Array) : void
      {
         this.giftList.dataProvider = param1;
         this.Scroll.update();
      }
      
      public function setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         ShengFuJingCaiList._$parent = param1;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Object = param1.target;
         switch(0)
         {
         }
      }
   }
}

