package com.fireice.text
{
   import com.fireice.base.FUITextField;
   import com.fireice.panel.FCanvas;
   import com.fireice.util.Tools;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class FLabel extends FUITextField
   {
      
      private var tf:TextFormat;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var isTip:Boolean;
      
      private var charLength:int;
      
      private var content:String;
      
      public function FLabel()
      {
         super();
         mouseWheelEnabled = false;
         selectable = false;
         this.autoSize = TextFieldAutoSize.LEFT;
         this.tf = new TextFormat();
         this.tf.font = Tools.font;
         defaultTextFormat = this.tf;
         this.isTip = false;
      }
      
      override public function set htmlText(param1:String) : void
      {
         this.text = param1;
      }
      
      override public function set text(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.content = param1;
         var _loc2_:String = param1;
         if(this.isTip && Tools.getSBCSLength(param1) > this.charLength)
         {
            while(Tools.getSBCSLength(_loc2_) > this.charLength)
            {
               _loc2_ = _loc2_.substring(0,_loc2_.length - 1);
            }
            _loc2_ += "...";
            super.text = _loc2_;
            addEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
            addEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
         }
         else
         {
            removeEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
            removeEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
            super.text = param1;
         }
         width = textWidth + 4;
         height = textHeight + 4;
      }
      
      public function setCharLength(param1:int) : void
      {
         this.isTip = true;
         this.charLength = param1;
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         if(!this.tipCanvas)
         {
            this.tipCanvas = new FCanvas();
            this.tipCanvas.skin = "toolTip";
         }
         if(!this.tip)
         {
            this.tip = new FTextArea();
            with(this.tip)
            {
               
               textColor = 16777215;
               x = 2;
               y = 2;
               autoSize = TextFieldAutoSize.LEFT;
               text = "";
            }
            this.tipCanvas.addChild(this.tip);
         }
         switch(e.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.showTip();
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
         }
      }
      
      private function showTip() : void
      {
         if(this.content == "")
         {
            return;
         }
         this.tip.text = this.content;
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         Tools.currentStage.addChild(this.tipCanvas);
         var _loc1_:Point = new Point(this.x,this.y);
         _loc1_ = this.parent.localToGlobal(_loc1_);
         if(_loc1_.x + this.width + this.tipCanvas.width > Tools.currentStage.stageWidth)
         {
            this.tipCanvas.x = _loc1_.x - this.tipCanvas.width;
         }
         else
         {
            this.tipCanvas.x = _loc1_.x + this.width + 10;
         }
         if(_loc1_.y + this.height + this.tipCanvas.height > Tools.currentStage.stageHeight)
         {
            this.tipCanvas.y = _loc1_.y - this.tipCanvas.height;
         }
         else
         {
            this.tipCanvas.y = _loc1_.y + this.height + 10;
         }
      }
   }
}

