package com.tgame.shell.view.components
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class FuqiJingjiVSPanel extends Sprite
   {
      
      private var yellowBit:Sprite;
      
      private var blueBit:Sprite;
      
      private var yellowfc:FCanvas;
      
      private var bluefc:FCanvas;
      
      private var playerName1:FTextArea;
      
      private var playerName2:FTextArea;
      
      public function FuqiJingjiVSPanel()
      {
         super();
         this.yellowfc = new FCanvas();
         this.yellowfc.skin = "box";
         this.yellowfc.x = 0;
         this.yellowfc.y = 15;
         this.yellowfc.width = 70;
         this.yellowfc.height = 26;
         addChild(this.yellowfc);
         var _loc1_:Bitmap = StaticValue.getBitmapByClassName("ui.combo.no.maohao");
         addChild(_loc1_);
         _loc1_.x = 75;
         _loc1_.y = 16;
         this.bluefc = new FCanvas();
         this.bluefc.skin = "box";
         this.bluefc.x = 90;
         this.bluefc.y = 15;
         this.bluefc.width = 70;
         this.bluefc.height = 26;
         addChild(this.bluefc);
         this.playerName1 = new FTextArea();
         this.playerName1.filters = StaticValue.filter;
         this.playerName1.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'><b> " + LanResManager.getLanCommonTextWords("黄队") + "</b></font>";
         this.playerName1.x = 14;
         this.playerName1.y = 0;
         addChild(this.playerName1);
         this.playerName2 = new FTextArea();
         this.playerName2.filters = StaticValue.filter;
         this.playerName2.htmlText = "<font color=\'" + StaticValue.BLUE_HTML + "\'><b>" + LanResManager.getLanCommonTextWords("蓝队") + "</b></font>";
         this.playerName2.x = 111;
         this.playerName2.y = 0;
         addChild(this.playerName2);
         this.mouseChildren = false;
         this.mouseEnabled = false;
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
            this.yellowBit.x = (this.yellowfc.width - this.yellowBit.width) / 2;
            this.yellowBit.y = (this.yellowfc.height - this.yellowBit.height) / 2;
            this.yellowfc.addChild(this.yellowBit);
         }
         else if(param1 == "lan")
         {
            if(this.blueBit != null)
            {
               this.blueBit.parent.removeChild(this.blueBit);
            }
            this.blueBit = this.getNumsprite(param2,param1);
            this.blueBit.x = (this.bluefc.width - this.blueBit.width) / 2;
            this.blueBit.y = (this.bluefc.height - this.blueBit.height) / 2;
            this.bluefc.addChild(this.blueBit);
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

