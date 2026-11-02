package com.tgame.shell.view.components.mainui
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.*;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import gs.TweenLite;
   
   public class SysTipCanvas extends Sprite
   {
      
      private var ft:FTextArea;
      
      private var tf:TextFormat;
      
      private var arr:Array;
      
      public function SysTipCanvas()
      {
         this.arr = [];
         super();
         this.tf = new TextFormat();
         this.tf.align = TextFormatAlign.RIGHT;
         this.tf.bold = true;
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 342;
            height = 80;
            textColor = 16766720;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            wordWrap = true;
         }
         addChild(this.ft);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouse);
         addEventListener(MouseEvent.MOUSE_MOVE,this.onMouse);
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         GameInstance.scene.sceneDispatchEvent(param1);
      }
      
      public function setTip(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         TweenLite.killTweensOf(this);
         alpha = 1;
         var _loc4_:int = int(this.arr.length);
         _loc2_ = "<textformat><font color=\'" + StaticValue.YELLOW_HTML + "\'>";
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_ += this.arr[_loc3_];
            _loc2_ += "<br>";
            _loc3_++;
         }
         _loc2_ += "</font><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "</font></textformat>";
         this.ft.htmlText = _loc2_;
         this.arr.push(param1);
         if(this.arr.length > 10)
         {
            this.arr.shift();
         }
         this.ft.scrollV = this.ft.maxScrollV;
         TweenLite.to(this,40,{
            "alpha":0,
            "onComplete":this.onCom
         });
      }
      
      private function onCom() : void
      {
         this.arr = [];
      }
   }
}

