package com.tgame.shell.view.components.kungfu
{
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import game.display.Container;
   
   public class WufangKungFuCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      private var lineImg1:Bitmap;
      
      private var lineImg2:Bitmap;
      
      private var lineImg3:Bitmap;
      
      private var lineImg4:Bitmap;
      
      private var lineImg5:Bitmap;
      
      private var lineImg6:Bitmap;
      
      private var lineImg7:Bitmap;
      
      private var lineImg8:Bitmap;
      
      private var lineImg9:Bitmap;
      
      private var liftlvImg1:Bitmap;
      
      private var liftlvImg2:Bitmap;
      
      private var liftlvImg3:Bitmap;
      
      private var liftlvImg4:Bitmap;
      
      private var liftlvImg5:Bitmap;
      
      private var liftlvImg6:Bitmap;
      
      private var liftlvImg7:Bitmap;
      
      private var liftlvImg8:Bitmap;
      
      private var liftlvImg9:Bitmap;
      
      private var liftlvImg10:Bitmap;
      
      private var reghtlvImg1:Bitmap;
      
      private var reghtlvImg2:Bitmap;
      
      private var reghtlvImg3:Bitmap;
      
      private var reghtlvImg4:Bitmap;
      
      private var reghtlvImg5:Bitmap;
      
      private var reghtlvImg6:Bitmap;
      
      private var reghtlvImg7:Bitmap;
      
      private var reghtlvImg8:Bitmap;
      
      private var reghtlvImg9:Bitmap;
      
      private var reghtlvImg10:Bitmap;
      
      private var bd:BitmapData;
      
      private var lv:int;
      
      private var ftaLv:FTextArea;
      
      private var ftaCeng:FTextArea;
      
      private var _container:Container;
      
      public function WufangKungFuCanvas()
      {
         super();
         this.bd = RslLoaderManager.getInstance("ui.wufang.bg",517,391) as BitmapData;
         this.bgImg = new Bitmap(this.bd);
         addChild(this.bgImg);
         this.init();
      }
      
      private function init() : void
      {
         this.ftaLv = new FTextArea();
         this.ftaLv.x = 422;
         this.ftaLv.y = 88;
         this.ftaLv.width = 65;
         this.ftaLv.textColor = StaticValue.ORANGE;
         addChild(this.ftaLv);
         this.ftaCeng = new FTextArea();
         this.ftaCeng.x = 364;
         this.ftaCeng.y = 70;
         this.ftaCeng.width = 65;
         this.ftaCeng.textColor = StaticValue.ORANGE;
         addChild(this.ftaCeng);
         this._container = new Container();
         addChild(this._container);
         this.bd = RslLoaderManager.getInstance("ui.wufang.xian.1",29,23) as BitmapData;
         this.lineImg1 = new Bitmap(this.bd);
         addChild(this.lineImg1);
         this.lineImg1.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.xian.2",94,5) as BitmapData;
         this.lineImg2 = new Bitmap(this.bd);
         addChild(this.lineImg2);
         this.lineImg2.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.xian.3",95,61) as BitmapData;
         this.lineImg3 = new Bitmap(this.bd);
         addChild(this.lineImg3);
         this.lineImg3.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.xian.4",94,6) as BitmapData;
         this.lineImg4 = new Bitmap(this.bd);
         addChild(this.lineImg4);
         this.lineImg4.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.xian.5",28,21) as BitmapData;
         this.lineImg5 = new Bitmap(this.bd);
         addChild(this.lineImg5);
         this.lineImg5.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.xian.6",30,23) as BitmapData;
         this.lineImg6 = new Bitmap(this.bd);
         addChild(this.lineImg6);
         this.lineImg6.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.xian.7",94,5) as BitmapData;
         this.lineImg7 = new Bitmap(this.bd);
         addChild(this.lineImg7);
         this.lineImg7.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.xian.8",30,22) as BitmapData;
         this.lineImg8 = new Bitmap(this.bd);
         addChild(this.lineImg8);
         this.lineImg8.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.xian.9",5,27) as BitmapData;
         this.lineImg9 = new Bitmap(this.bd);
         addChild(this.lineImg9);
         this.lineImg9.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.lift.1",41,49) as BitmapData;
         this.liftlvImg1 = new Bitmap(this.bd);
         addChild(this.liftlvImg1);
         this.liftlvImg1.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.lift.2",41,49) as BitmapData;
         this.liftlvImg2 = new Bitmap(this.bd);
         addChild(this.liftlvImg2);
         this.liftlvImg2.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.lift.3",41,49) as BitmapData;
         this.liftlvImg3 = new Bitmap(this.bd);
         addChild(this.liftlvImg3);
         this.liftlvImg3.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.lift.4",41,49) as BitmapData;
         this.liftlvImg4 = new Bitmap(this.bd);
         addChild(this.liftlvImg4);
         this.liftlvImg4.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.lift.5",41,49) as BitmapData;
         this.liftlvImg5 = new Bitmap(this.bd);
         addChild(this.liftlvImg5);
         this.liftlvImg5.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.lift.6",41,49) as BitmapData;
         this.liftlvImg6 = new Bitmap(this.bd);
         addChild(this.liftlvImg6);
         this.liftlvImg6.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.lift.7",41,49) as BitmapData;
         this.liftlvImg7 = new Bitmap(this.bd);
         addChild(this.liftlvImg7);
         this.liftlvImg7.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.lift.8",41,49) as BitmapData;
         this.liftlvImg8 = new Bitmap(this.bd);
         addChild(this.liftlvImg8);
         this.liftlvImg8.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.lift.9",41,49) as BitmapData;
         this.liftlvImg9 = new Bitmap(this.bd);
         addChild(this.liftlvImg9);
         this.liftlvImg9.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.lift.10",41,49) as BitmapData;
         this.liftlvImg10 = new Bitmap(this.bd);
         addChild(this.liftlvImg10);
         this.liftlvImg10.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.right.1",42,46) as BitmapData;
         this.reghtlvImg1 = new Bitmap(this.bd);
         addChild(this.reghtlvImg1);
         this.reghtlvImg1.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.right.2",42,46) as BitmapData;
         this.reghtlvImg2 = new Bitmap(this.bd);
         addChild(this.reghtlvImg2);
         this.reghtlvImg2.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.right.3",42,46) as BitmapData;
         this.reghtlvImg3 = new Bitmap(this.bd);
         addChild(this.reghtlvImg3);
         this.reghtlvImg3.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.right.4",42,46) as BitmapData;
         this.reghtlvImg4 = new Bitmap(this.bd);
         addChild(this.reghtlvImg4);
         this.reghtlvImg4.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.right.5",42,46) as BitmapData;
         this.reghtlvImg5 = new Bitmap(this.bd);
         addChild(this.reghtlvImg5);
         this.reghtlvImg5.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.right.6",42,46) as BitmapData;
         this.reghtlvImg6 = new Bitmap(this.bd);
         addChild(this.reghtlvImg6);
         this.reghtlvImg6.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.right.7",42,46) as BitmapData;
         this.reghtlvImg7 = new Bitmap(this.bd);
         addChild(this.reghtlvImg7);
         this.reghtlvImg7.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.right.8",42,46) as BitmapData;
         this.reghtlvImg8 = new Bitmap(this.bd);
         addChild(this.reghtlvImg8);
         this.reghtlvImg8.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.right.9",42,46) as BitmapData;
         this.reghtlvImg9 = new Bitmap(this.bd);
         addChild(this.reghtlvImg9);
         this.reghtlvImg9.filters = Tools.blackWhiteFilter;
         this.bd = RslLoaderManager.getInstance("ui.wufang.right.10",42,46) as BitmapData;
         this.reghtlvImg10 = new Bitmap(this.bd);
         addChild(this.reghtlvImg10);
         this.reghtlvImg10.filters = Tools.blackWhiteFilter;
         this.lineImg1.x = 142;
         this.lineImg1.y = 57;
         this.lineImg2.x = 79;
         this.lineImg2.y = 79;
         this.lineImg3.x = 77;
         this.lineImg3.y = 86;
         this.lineImg4.x = 78;
         this.lineImg4.y = 148;
         this.lineImg5.x = 76;
         this.lineImg5.y = 155;
         this.lineImg6.x = 141;
         this.lineImg6.y = 191;
         this.lineImg7.x = 79;
         this.lineImg7.y = 217;
         this.lineImg8.x = 76;
         this.lineImg8.y = 224;
         this.lineImg9.x = 123;
         this.lineImg9.y = 288;
         this.liftlvImg1.x = 105;
         this.liftlvImg1.y = 24;
         this.liftlvImg2.x = 172;
         this.liftlvImg2.y = 59;
         this.liftlvImg3.x = 37;
         this.liftlvImg3.y = 59;
         this.liftlvImg4.x = 172;
         this.liftlvImg4.y = 127;
         this.liftlvImg5.x = 37;
         this.liftlvImg5.y = 127;
         this.liftlvImg6.x = 105;
         this.liftlvImg6.y = 161;
         this.liftlvImg7.x = 172;
         this.liftlvImg7.y = 196;
         this.liftlvImg8.x = 37;
         this.liftlvImg8.y = 196;
         this.liftlvImg9.x = 105;
         this.liftlvImg9.y = 239;
         this.liftlvImg10.x = 105;
         this.liftlvImg10.y = 316;
         this.reghtlvImg1.x = 251;
         this.reghtlvImg1.y = 112;
         this.reghtlvImg2.x = 251;
         this.reghtlvImg2.y = 168;
         this.reghtlvImg3.x = 251;
         this.reghtlvImg3.y = 224;
         this.reghtlvImg4.x = 251;
         this.reghtlvImg4.y = 280;
         this.reghtlvImg5.x = 251;
         this.reghtlvImg5.y = 336;
         this.reghtlvImg6.x = 386;
         this.reghtlvImg6.y = 112;
         this.reghtlvImg7.x = 386;
         this.reghtlvImg7.y = 168;
         this.reghtlvImg8.x = 386;
         this.reghtlvImg8.y = 224;
         this.reghtlvImg9.x = 386;
         this.reghtlvImg9.y = 278;
         this.reghtlvImg10.x = 386;
         this.reghtlvImg10.y = 336;
         this.ftaCeng.htmlText = "~.~!";
         this.ftaLv.htmlText = "~.~Lv";
      }
      
      public function setData(param1:Number) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 1;
         while(_loc2_ <= 10)
         {
            this["liftlvImg" + _loc2_].filters = Tools.blackWhiteFilter;
            this["reghtlvImg" + _loc2_].filters = Tools.blackWhiteFilter;
            if(_loc2_ > 1)
            {
               this["lineImg" + (_loc2_ - 1)].filters = Tools.blackWhiteFilter;
            }
            _loc2_++;
         }
         if(param1 >= 20000000000)
         {
            this.lv = 10;
         }
         else if(param1 >= 16000000000)
         {
            this.lv = 9;
         }
         else if(param1 >= 14000000000)
         {
            this.lv = 8;
         }
         else if(param1 >= 12000000000)
         {
            this.lv = 7;
         }
         else if(param1 >= 10000000000)
         {
            this.lv = 6;
         }
         else if(param1 >= 8000000000)
         {
            this.lv = 5;
         }
         else if(param1 >= 6000000000)
         {
            this.lv = 4;
         }
         else if(param1 >= 4000000000)
         {
            this.lv = 3;
         }
         else if(param1 >= 2000000000)
         {
            this.lv = 2;
         }
         else if(param1 >= 500000000)
         {
            this.lv = 1;
         }
         else
         {
            this.lv = 0;
         }
         _loc2_ = 1;
         while(_loc2_ <= this.lv)
         {
            this["liftlvImg" + _loc2_].filters = [];
            this["reghtlvImg" + _loc2_].filters = [];
            if(_loc2_ > 1)
            {
               this["lineImg" + (_loc2_ - 1)].filters = [];
            }
            _loc2_++;
         }
         this.ftaCeng.htmlText = "" + param1;
         this.ftaLv.htmlText = "" + this.lv;
      }
   }
}

