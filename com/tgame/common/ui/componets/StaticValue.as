package com.tgame.common.ui.componets
{
   import com.fireice.alert.FAlert;
   import com.fireice.tabBar.FTabBar;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   
   public class StaticValue
   {
      
      public static var rideColors:Array = [16777215,16777215,2003199,65280,10040314,16750866,16750866];
      
      public static var itemColors:Array = [16777215,16777215,2003199,65280,10040314,16766720,16766720];
      
      public static var itemColors_html:Array = ["#ffffff","#ffffff","#1e90ff","#00ff00","#9933fa","#ffd700","#ffd700"];
      
      public static const WHITE:int = 16777215;
      
      public static const WHITE_HTML:String = "#ffffff";
      
      public static const BLUE:int = 2003199;
      
      public static const BLUE_HTML:String = "#1e90ff";
      
      public static const SKY_BLUE:int = 65535;
      
      public static const SKY_BLUE_HTML:String = "#00ffff";
      
      public static const BlUE50:int = 8900331;
      
      public static const BlUE50_HTML:String = "#87ceeb";
      
      public static const BlUE20:int = 11591910;
      
      public static const BlUE20_HTML:String = "#b0e0e6";
      
      public static const GREEN:int = 65280;
      
      public static const GREEN_HTML:String = "#00ff00";
      
      public static const GREEN_STRONG:int = 51543;
      
      public static const GREEN_STRONG_HTML:String = "#00C957";
      
      public static const GOLD:int = 16766720;
      
      public static const GOLD_HTML:String = "#ffd700";
      
      public static const YELLOW:int = 16776960;
      
      public static const YELLOW_HTML:String = "#ffff00";
      
      public static const ORANGE:int = 16750866;
      
      public static const ORANGE_HTML:String = "#ff9912";
      
      public static const ORANGE_RED:int = 16729344;
      
      public static const ORANGE_RED_HTML:String = "#ff4500";
      
      public static const RED:int = 16711680;
      
      public static const RED_HTML:String = "#ff0000";
      
      public static const PURPLE:int = 10040314;
      
      public static const PURPLE_HTML:String = "#9933fa";
      
      public static const PURPLE50:int = 14315734;
      
      public static const PURPLE50_HTML:String = "#da70d6";
      
      public static const BLACK_HTML:String = "#000000";
      
      public static const HUISE:int = 6052956;
      
      public static const HUISE_HTML:String = "#5c5c5c";
      
      public static var blackWhiteFilter:Array = [new ColorMatrixFilter([0.3086,0.6094,0.082,0,-50,0.3086,0.6094,0.082,0,-50,0.3086,0.6094,0.082,0,-50,0,0,0,1,0])];
      
      public static var filter:Array = [new GlowFilter(3591,1,3,3,15,BitmapFilterQuality.LOW)];
      
      public static var format:TextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
      
      public static var isOpenFunctionForQCZL:Boolean = true;
      
      public static var grayFilters:Array = [new ColorMatrixFilter(grayFilter(0.3))];
      
      public function StaticValue()
      {
         super();
         throw new Error("无法初始化tools类");
      }
      
      public static function getBitmapByClassName(param1:String) : Bitmap
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Class = RslLoaderManager.getClass(param1);
         if(!_loc2_)
         {
            return null;
         }
         return new Bitmap(new _loc2_(10,10) as BitmapData);
      }
      
      public static function getMCByClassName(param1:String) : Sprite
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Class = RslLoaderManager.getClass(param1);
         if(!_loc2_)
         {
            return null;
         }
         return new _loc2_() as Sprite;
      }
      
      public static function setAlert() : void
      {
         FAlert.textRect = new Rectangle(12,30,140,70);
         FAlert.textColor = 16777215;
         FAlert.okButton = new MainButton();
         FAlert.cancelButton = new MainButton();
         FTabBar.buttonStyle = new TabButton();
      }
      
      public static function conversionFlagID(param1:int) : String
      {
         if(param1 < 10)
         {
            param1 += 10;
         }
         var _loc2_:String = param1.toString();
         return "ui.party.flag.lv" + _loc2_.charAt(0) + "." + _loc2_.charAt(1);
      }
      
      public static function grayFilter(param1:Number) : Array
      {
         return [param1,param1,param1,0,0,param1,param1,param1,0,0,param1,param1,param1,0,0,0,0,0,1,0];
      }
   }
}

