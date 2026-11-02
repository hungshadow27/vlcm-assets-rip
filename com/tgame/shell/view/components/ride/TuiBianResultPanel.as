package com.tgame.shell.view.components.ride
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class TuiBianResultPanel extends Sprite
   {
      
      private var bg:DisplayObject;
      
      private var nameFta:FTextArea;
      
      private var headSpr:Sprite;
      
      public function TuiBianResultPanel()
      {
         super();
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woDeMenPai/tuiBianResult.swf");
         this.bg.x = 8;
         this.bg.y = 0;
         addChild(this.bg);
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.color = StaticValue.RED;
         _loc1_.align = "center";
         this.nameFta = new FTextArea();
         addChild(this.nameFta);
         this.nameFta.defaultTextFormat = _loc1_;
         this.nameFta.width = 100;
         this.nameFta.x = 70;
         this.nameFta.y = 175;
         this.headSpr = new Sprite();
         this.headSpr.x = 93;
         this.headSpr.y = 99;
         addChild(this.headSpr);
      }
      
      public function setData(param1:String, param2:String) : *
      {
         this.nameFta.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + param1 + "</font>";
         while(this.headSpr.numChildren != 0)
         {
            this.headSpr.removeChildAt(0);
         }
         var _loc3_:Bitmap = new Bitmap();
         this.headSpr.addChild(_loc3_);
         _loc3_.bitmapData = StaticValue.getBitmapByClassName(param2).bitmapData;
      }
   }
}

