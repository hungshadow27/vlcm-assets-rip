package com.tgame.shell.view.components.gift
{
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.gift.itemrender.DengLuYouLiGiftListRender;
   import com.tgame.shell.view.components.gift.itemrender.ZaiXianJiangLiListRender;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class JianMianYouLiCanvas extends Sprite
   {
      
      private var container:Sprite;
      
      private var scroll:FVScorllBar;
      
      private var giftContainer:FCanvas;
      
      private var giftList:FList;
      
      private var tip:FTextArea;
      
      private var ft:FTextArea;
      
      private var img:Bitmap;
      
      private var zaixianBar1:ColorBar;
      
      private var zaixianBar2:ColorBar;
      
      private var zaixianBar3:ColorBar;
      
      private var zaixianBar4:ColorBar;
      
      private var tip1:FTextArea;
      
      private var tip2:FTextArea;
      
      private var tip3:FTextArea;
      
      private var tip4:FTextArea;
      
      private var dengluBar1:ColorBar;
      
      private var dengluBar2:ColorBar;
      
      private var dengluBar3:ColorBar;
      
      private var dengluBtn1:SmallButton;
      
      private var dengluBtn2:SmallButton;
      
      private var dengluBtn3:SmallButton;
      
      private var giftList1:FList;
      
      private var ft1:FTextArea;
      
      private var giftList2:FList;
      
      private var _parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      public function JianMianYouLiCanvas()
      {
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.huodong.zaixian.jiangli.ui";
         addChild(this.bgImg);
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 180;
            height = 120;
            x = 407;
            y = 10;
            wordWrap = true;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,0) + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,1) + "</font>" + "</textformat>";
         }
         addChild(this.ft);
         this.giftList1 = new FList();
         this.giftList1.skin = "list";
         this.giftList1.itemRenderer = new ZaiXianJiangLiListRender();
         this.giftList1.listWidth = 380;
         addChild(this.giftList1);
         this.giftList1.x = 12;
         this.giftList1.y = 31;
         this.giftList2 = new FList();
         this.giftList2.skin = "list";
         this.giftList2.itemRenderer = new DengLuYouLiGiftListRender();
         this.giftList2.listWidth = 380;
         addChild(this.giftList2);
         this.giftList2.x = 12;
         this.giftList2.y = 220;
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 100;
            height = 20;
            x = 434;
            y = 197;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,2) + "</font>";
         }
         addChild(this.ft);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            width = 100;
            height = 20;
            x = 482;
            y = 218;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "2" + LanResManager.getLanCommonTextWords("天");
         }
         addChild(this.ft1);
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 200;
            height = 80;
            x = 407;
            y = 255;
            wordWrap = true;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,3) + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,4) + "</font>";
         }
         addChild(this.ft);
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         DengLuYouLiGiftListRender.$parent = param1;
      }
      
      public function setZianXianData(param1:Array) : void
      {
         this.giftList1.dataProvider = param1;
      }
      
      public function setPrize(param1:int, param2:Array) : void
      {
         this.giftList2.dataProvider = param2;
         this.ft1.htmlText = param1 + LanResManager.getLanCommonTextWords("天");
      }
   }
}

