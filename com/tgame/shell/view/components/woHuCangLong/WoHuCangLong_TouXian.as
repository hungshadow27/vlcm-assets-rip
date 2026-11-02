package com.tgame.shell.view.components.woHuCangLong
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class WoHuCangLong_TouXian extends FPanel
   {
      
      private var tz:Sprite;
      
      private var bg:DisplayObject;
      
      private var dangqianTouxian:FTextArea;
      
      private var xiajieTouxian:FTextArea;
      
      private var img:Bitmap;
      
      private var CjBar:ColorBar;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var giftList2:FList;
      
      private var titleFta:FTextArea;
      
      private var barBg1:Bitmap;
      
      private var barBar1:ColorBar;
      
      public function WoHuCangLong_TouXian()
      {
         super();
         titleText = LanResManager.getLanCommonTextWords("头衔");
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 545 + 2 + 2;
         height = 320 + 45 + 16 - 2;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/touXianBg.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.dangqianTouxian = new FTextArea();
         this.dangqianTouxian.multiline = true;
         this.dangqianTouxian.filters = StaticValue.filter;
         this.dangqianTouxian.width = 200;
         this.dangqianTouxian.height = 110;
         this.dangqianTouxian.x = 20;
         this.dangqianTouxian.y = 20;
         addChild(this.dangqianTouxian);
         this.dangqianTouxian.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前头衔：无敌超人") + "</font>";
         this.xiajieTouxian = new FTextArea();
         this.xiajieTouxian.multiline = true;
         this.xiajieTouxian.filters = StaticValue.filter;
         this.xiajieTouxian.width = 200;
         this.xiajieTouxian.height = 110;
         this.xiajieTouxian.x = 400;
         this.xiajieTouxian.y = 20;
         addChild(this.xiajieTouxian);
         this.xiajieTouxian.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("下阶头衔：超级赛亚人") + "</font>";
         this.img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(this.img);
         this.img.width = 200;
         this.img.x = 175;
         this.img.y = 20;
         this.CjBar = new ColorBar(5,157,12);
         addChild(this.CjBar);
         this.CjBar.x = 197;
         this.CjBar.y = 23;
         this.CjBar.setValue(100,100);
         this.titleFta = new FTextArea();
         this.titleFta.filters = StaticValue.filter;
         this.titleFta.width = 530;
         this.titleFta.height = 110;
         this.titleFta.x = 40;
         this.titleFta.y = 53;
         this.titleFta.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("头衔") + "               " + LanResManager.getLanCommonTextWords("威望") + "            " + LanResManager.getLanCommonTextWords("铜币奖励") + "                    " + LanResManager.getLanCommonTextWords("头衔") + "                    " + LanResManager.getLanCommonTextWords("威望") + "               " + LanResManager.getLanCommonTextWords("铜币奖励") + "</font>";
         addChild(this.titleFta);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 20;
            y = 75;
         }
         this.listContainer.mouseChildren = false;
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new WoHuCangLong_TouXianList();
         this.giftList.listWidth = 345 + 20 + 15 + 60 + 10 + 19;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.giftList2 = new FList();
         this.giftList2.skin = "list";
         this.giftList2.itemRenderer = new WoHuCangLong_TouXianList();
         this.giftList2.listWidth = 345 + 20 + 15 + 60 + 10 + 19;
         this.listContainer.addChild(this.giftList2);
         this.giftList2.x = 270;
         this.giftList2.y = 0;
      }
      
      public function onClose(param1:* = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setInitialize(param1:Array, param2:String, param3:String, param4:int, param5:int) : void
      {
         var _loc6_:Array = [];
         var _loc7_:Array = [];
         var _loc8_:int = 0;
         while(_loc8_ < param1.length)
         {
            if(_loc8_ < 10)
            {
               _loc6_.push(param1[_loc8_]);
            }
            else
            {
               _loc7_.push(param1[_loc8_]);
            }
            _loc8_++;
         }
         this.giftList.dataProvider = _loc6_;
         this.giftList2.dataProvider = _loc7_;
         this.dangqianTouxian.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前头衔：") + param2 + "</font>";
         this.xiajieTouxian.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("下阶头衔：") + param3 + "</font>";
         this.CjBar.setValue(param4,param5);
      }
   }
}

