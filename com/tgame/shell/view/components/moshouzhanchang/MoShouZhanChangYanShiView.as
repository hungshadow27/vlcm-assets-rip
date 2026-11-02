package com.tgame.shell.view.components.moshouzhanchang
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import flash.utils.setTimeout;
   
   public class MoShouZhanChangYanShiView extends Sprite
   {
      
      public var _parent:DisplayObject;
      
      private var txtTime:FTextArea;
      
      private var currTimer:int;
      
      public function MoShouZhanChangYanShiView()
      {
         super();
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.align = "center";
         _loc1_.size = 20;
         this.txtTime = new FTextArea();
         this.txtTime.defaultTextFormat = _loc1_;
         this.txtTime.textColor = StaticValue.RED;
         this.txtTime.width = 500;
         this.txtTime.height = 100;
      }
      
      public function setMoShouZhanChangYanShiData() : void
      {
         this.currTimer = 4;
         this.txtTime.htmlText = "进入跨服倒计时" + this.currTimer + "S";
         setTimeout(this.setTimeoutHandler,1000);
      }
      
      private function setTimeoutHandler() : void
      {
         if(this.currTimer > 0)
         {
            --this.currTimer;
            this.txtTime.htmlText = "进入跨服倒计时" + this.currTimer + "S";
            setTimeout(this.setTimeoutHandler,1000);
         }
         else if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

