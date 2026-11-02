package com.tgame.shell.view.components.tunshitiandi
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class TunshiTianDiVSPanel extends Sprite
   {
      
      private var yellowBit:Sprite;
      
      private var blueBit:Sprite;
      
      private var yellowfc:FCanvas;
      
      private var bluefc:FCanvas;
      
      private var playerName1:FTextArea;
      
      private var playerName2:FTextArea;
      
      private var comboNO:Array = ["ui.combo.no.0","ui.combo.no.1","ui.combo.no.2","ui.combo.no.3","ui.combo.no.4","ui.combo.no.5","ui.combo.no.6","ui.combo.no.7","ui.combo.no.8","ui.combo.no.9"];
      
      private var bg:DisplayObject;
      
      public function TunshiTianDiVSPanel()
      {
         super();
         mouseEnabled = mouseChildren = false;
         this.yellowfc = new FCanvas();
         this.yellowfc.skin = "box";
         this.yellowfc.x = 1;
         this.yellowfc.y = 28;
         this.yellowfc.width = 61;
         this.yellowfc.height = 48;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/redbg.swf");
         this.bg.x = 0;
         this.bg.y = 25;
         addChild(this.bg);
         var _loc1_:Bitmap = StaticValue.getBitmapByClassName("ui.combo.no.maohao");
         _loc1_.x = 79;
         _loc1_.y = 40;
         this.bluefc = new FCanvas();
         this.bluefc.skin = "box";
         this.bluefc.x = 107;
         this.bluefc.y = 28;
         this.bluefc.width = 61;
         this.bluefc.height = 48;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/bluebg.swf");
         this.bg.x = 150;
         this.bg.y = 25;
         addChild(this.bg);
         this.playerName1 = new FTextArea();
         this.playerName1.x = 70;
         this.playerName1.y = 8;
         this.playerName1.text = "";
         this.playerName1.width = 60;
         this.playerName1.autoSize = "center";
         this.playerName1.filters = StaticValue.filter;
         this.playerName1.textColor = StaticValue.RED;
         addChild(this.playerName1);
         this.playerName2 = new FTextArea();
         this.playerName2.x = 180;
         this.playerName2.y = 8;
         this.playerName2.width = 60;
         this.playerName2.autoSize = "center";
         this.playerName2.text = "";
         this.playerName2.filters = StaticValue.filter;
         this.playerName2.textColor = StaticValue.BLUE;
         addChild(this.playerName2);
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      public function setVS(param1:String, param2:int, param3:String, param4:int) : void
      {
         this.playerName1.text = LanResManager.getLanCommonTextWords("红队");
         this.playerName2.text = LanResManager.getLanCommonTextWords("蓝队");
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
            this.yellowBit.x = (45 - this.yellowBit.width) / 2 + 45;
            this.yellowBit.y = 45;
            this.addChild(this.yellowBit);
         }
         else if(param1 == "lan")
         {
            if(this.blueBit != null)
            {
               this.blueBit.parent.removeChild(this.blueBit);
            }
            this.blueBit = this.getNumsprite(param2,param1);
            this.blueBit.x = 225 + (45 - this.blueBit.width) / 2;
            this.blueBit.y = 45;
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
            _loc6_ = StaticValue.getBitmapByClassName("ui.jingjichang.huang." + _loc4_.charAt(_loc5_));
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

