package com.tgame.common.ui.componets
{
   import com.fireice.panel.FPanel;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   
   public class LoadBuffer extends Sprite
   {
      
      private var ico:Sprite;
      
      public function LoadBuffer()
      {
         super();
         this.ico = StaticValue.getMCByClassName("cycle_stage");
         addChild(this.ico);
      }
      
      public static function show(param1:DisplayObjectContainer, param2:* = null) : LoadBuffer
      {
         var _loc3_:LoadBuffer = new LoadBuffer();
         param1.addChild(_loc3_);
         if(param1 is FPanel)
         {
            _loc3_.reDraw((param1 as FPanel).panelWidth,(param1 as FPanel).panelHeight - (param1 as FPanel).titleHeight);
         }
         else
         {
            _loc3_.reDraw(param1.width,param1.height);
         }
         if(param2)
         {
            param1.addChild(param2);
         }
         return _loc3_;
      }
      
      private function reDraw(param1:Number, param2:Number) : void
      {
         graphics.clear();
         graphics.beginFill(0,0.5);
         graphics.drawRect(0,0,param1,param2);
         graphics.endFill();
         this.ico.x = param1 / 2;
         this.ico.y = param2 / 2;
      }
      
      public function close() : void
      {
         if(parent)
         {
            parent.removeChild(this);
         }
      }
   }
}

