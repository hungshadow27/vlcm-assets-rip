package com.tgame.shell.view.components.jingjichang
{
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class JingjiVSPanel extends Sprite
   {
      
      private var yellowBit:Sprite;
      
      private var blueBit:Sprite;
      
      public function JingjiVSPanel()
      {
         super();
         mouseEnabled = mouseChildren = false;
         var _loc1_:Bitmap = new Bitmap(RslLoaderManager.getInstance("ui.jingjichang.jifen.ui",1,1));
         addChild(_loc1_);
      }
      
      public function setVS(param1:int, param2:int) : void
      {
         this.showCount("huang",param1);
         this.showCount("lan",param2);
      }
      
      private function showCount(param1:String, param2:int) : void
      {
         if(param1 == "huang")
         {
            if(this.yellowBit != null)
            {
               this.yellowBit.parent.removeChild(this.yellowBit);
            }
            this.yellowBit = this.getNumsprite(param2,param1);
            this.yellowBit.x = 15;
            this.yellowBit.y = 33;
            this.addChild(this.yellowBit);
         }
         else if(param1 == "lan")
         {
            if(this.blueBit != null)
            {
               this.blueBit.parent.removeChild(this.blueBit);
            }
            this.blueBit = this.getNumsprite(param2,param1);
            this.blueBit.x = 125;
            this.blueBit.y = 33;
            this.addChild(this.blueBit);
         }
      }
      
      private function getNumsprite(param1:int, param2:String) : Sprite
      {
         var _loc3_:Sprite = null;
         var _loc6_:Bitmap = null;
         _loc3_ = new Sprite();
         var _loc4_:String = param1.toString();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = StaticValue.getBitmapByClassName("ui.jingjichang." + param2 + "." + _loc4_.charAt(_loc5_));
            _loc3_.addChild(_loc6_);
            _loc6_.x = _loc5_ * _loc6_.width;
            _loc5_++;
         }
         _loc3_.mouseChildren = false;
         _loc3_.mouseEnabled = false;
         return _loc3_;
      }
   }
}

