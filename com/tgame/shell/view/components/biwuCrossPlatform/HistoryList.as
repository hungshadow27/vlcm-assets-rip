package com.tgame.shell.view.components.biwuCrossPlatform
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.display.DisplayObject;
   import flash.events.*;
   import flash.text.*;
   
   public class HistoryList extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      public static var $parent2:DisplayObject;
      
      private var ft:FTextArea;
      
      private var tf:TextFormat;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public function HistoryList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 23;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 2;
            y = 2;
            width = 90;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            htmlText = data.time;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 140;
            y = 2;
            width = 120;
            height = 22;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            htmlText = data.joinCN;
            addEventListener(MouseEvent.MOUSE_OVER,onMouseTip);
            addEventListener(MouseEvent.MOUSE_OUT,onMouseTip);
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 326;
            y = 2;
            width = 90;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            htmlText = data.winCN;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 480;
            y = 2;
            width = 90;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            htmlText = data.name;
         }
         addChild(this.ft);
      }
      
      private function onMouseTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               param1.target.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(param1.target.htmlText);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas != null && this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               param1.target.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
         }
      }
      
      private function showTip(param1:String) : void
      {
         var value:String = param1;
         if(!this.tipCanvas)
         {
            this.tipCanvas = new FCanvas();
            this.tipCanvas.skin = "backGroud";
            this.tip = new FTextArea();
            with(this.tip)
            {
               
               x = 2;
               y = 2;
               autoSize = TextFieldAutoSize.LEFT;
               textColor = StaticValue.WHITE;
               filters = StaticValue.filter;
            }
            this.tipCanvas.addChild(this.tip);
         }
         this.tip.htmlText = value;
         parent.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
   }
}

