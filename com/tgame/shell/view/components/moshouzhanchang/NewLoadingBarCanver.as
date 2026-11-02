package com.tgame.shell.view.components.moshouzhanchang
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class NewLoadingBarCanver extends Sprite
   {
      
      private var downSpr:Sprite;
      
      private var upSpr:Sprite;
      
      private var maskSpr:Sprite;
      
      private var txtProgress:FTextArea;
      
      private var _currWidth:int;
      
      public function NewLoadingBarCanver()
      {
         var _loc1_:TextFormat = null;
         super();
         this.downSpr = new Sprite();
         addChild(this.downSpr);
         this.upSpr = new Sprite();
         addChild(this.upSpr);
         this.maskSpr = new Sprite();
         addChild(this.maskSpr);
         this.upSpr.mask = this.maskSpr;
         _loc1_ = new TextFormat();
         _loc1_.align = "center";
         this.txtProgress = new FTextArea();
         this.txtProgress.width = 200;
         this.txtProgress.height = 20;
         this.txtProgress.defaultTextFormat = _loc1_;
         this.txtProgress.textColor = StaticValue.YELLOW;
         this.txtProgress.filters = StaticValue.filter;
         addChild(this.txtProgress);
      }
      
      public function setSkin(param1:String, param2:String, param3:int, param4:int) : void
      {
         var _loc5_:DisplayObject = LoadSwf.AndConvert2Bmp(param1);
         this.downSpr.addChild(_loc5_);
         var _loc6_:DisplayObject = LoadSwf.AndConvert2Bmp(param2);
         this.upSpr.addChild(_loc6_);
         this.maskSpr.graphics.clear();
         this.maskSpr.graphics.beginFill(16711680);
         this.maskSpr.graphics.drawRect(0,0,param3,param4);
         this.maskSpr.graphics.endFill();
         this._currWidth = param3;
         this.txtProgress.x = param3 - this.txtProgress.width >> 1;
      }
      
      public function setNumProgress(param1:int, param2:int) : void
      {
         this.txtProgress.text = param1 + "/" + param2;
         this.maskSpr.width = param1 / param2 * this._currWidth;
      }
   }
}

