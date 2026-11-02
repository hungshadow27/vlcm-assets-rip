package com.tgame.shell.view.components.biwudahui
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class BiwudahuiVSPanel extends Sprite
   {
      
      private var yellowBit:Sprite;
      
      private var blueBit:Sprite;
      
      private var yellowfc:FCanvas;
      
      private var bluefc:FCanvas;
      
      private var playerName1:FTextArea;
      
      private var playerName2:FTextArea;
      
      private var comboNO:Array = ["ui.combo.no.0","ui.combo.no.1","ui.combo.no.2","ui.combo.no.3","ui.combo.no.4","ui.combo.no.5","ui.combo.no.6","ui.combo.no.7","ui.combo.no.8","ui.combo.no.9"];
      
      public function BiwudahuiVSPanel()
      {
         var _loc1_:Bitmap = null;
         super();
         mouseEnabled = mouseChildren = false;
         this.yellowfc = new FCanvas();
         this.yellowfc.skin = "box";
         this.yellowfc.x = 1;
         this.yellowfc.y = 28;
         this.yellowfc.width = 61;
         this.yellowfc.height = 48;
         addChild(this.yellowfc);
         _loc1_ = StaticValue.getBitmapByClassName("ui.combo.no.maohao");
         addChild(_loc1_);
         _loc1_.x = 79;
         _loc1_.y = 40;
         this.bluefc = new FCanvas();
         this.bluefc.skin = "box";
         this.bluefc.x = 107;
         this.bluefc.y = 28;
         this.bluefc.width = 61;
         this.bluefc.height = 48;
         addChild(this.bluefc);
         this.playerName1 = new FTextArea();
         this.playerName1.x = 1;
         this.playerName1.y = 8;
         this.playerName1.text = "";
         this.playerName1.width = 60;
         this.playerName1.autoSize = "center";
         this.playerName1.filters = StaticValue.filter;
         this.playerName1.textColor = StaticValue.YELLOW;
         addChild(this.playerName1);
         this.playerName2 = new FTextArea();
         this.playerName2.x = 107;
         this.playerName2.y = 8;
         this.playerName2.width = 60;
         this.playerName2.autoSize = "center";
         this.playerName2.text = "";
         this.playerName2.filters = StaticValue.filter;
         this.playerName2.textColor = StaticValue.YELLOW;
         addChild(this.playerName2);
         this.setVS("",0,"",0);
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      public function setVS(param1:String, param2:int, param3:String, param4:int) : void
      {
         this.playerName1.text = param1;
         this.playerName2.text = param3;
         this.showCount("huang",param2);
         this.showCount("lan",param4);
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
            this.yellowBit.x = 12;
            this.yellowBit.y = 30;
            this.addChild(this.yellowBit);
         }
         else if(param1 == "lan")
         {
            if(this.blueBit != null)
            {
               this.blueBit.parent.removeChild(this.blueBit);
            }
            this.blueBit = this.getNumsprite(param2,param1);
            this.blueBit.x = 118;
            this.blueBit.y = 30;
            this.addChild(this.blueBit);
         }
      }
      
      private function getNumsprite(param1:int, param2:String) : Sprite
      {
         var _loc6_:Bitmap = null;
         var _loc3_:Sprite = new Sprite();
         var _loc4_:String = param1.toString();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = StaticValue.getBitmapByClassName(this.comboNO[parseInt(_loc4_.charAt(_loc5_))]);
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

