package com.tgame.shell.view.components.gift
{
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.GiftPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ZaiXianYouLiCanvas extends Sprite
   {
      
      private var _parent:DisplayObject;
      
      private var container:Sprite;
      
      private var countLabel:FTextArea;
      
      private var scroll:FVScorllBar;
      
      private var giftContainer:FCanvas;
      
      private var giftList:FList;
      
      private var tip:FTextArea;
      
      public var btn:SecondButton;
      
      public var qiandaoBtn:SecondButton;
      
      private var zaixianTimeBar1:ColorBar;
      
      private var zaixianTimeBar2:ColorBar;
      
      private var zaixianTimeBar3:ColorBar;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      public var ft3:FTextArea;
      
      private var ft4:FTextArea;
      
      private var ft5:FTextArea;
      
      private var imgIco1:DisplayObject;
      
      private var imgIco2:DisplayObject;
      
      private var imgIco3:DisplayObject;
      
      public var bgImg:Bitmap;
      
      private var _prize:int;
      
      public function ZaiXianYouLiCanvas()
      {
         var tf:TextFormat;
         var ft:FTextArea;
         var obj:DisplayObject;
         var img:Bitmap;
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.huodong.shangcheng.lijing.ui";
         addChild(this.bgImg);
         tf = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            x = 0;
            y = 10;
            wordWrap = true;
            width = 300;
            defaultTextFormat = tf;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'10\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,0) + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,1) + "</font>" + "</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 300;
            y = 10;
            wordWrap = true;
            width = 150;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'10\'>" + LanResManager.getLanTextWords(this,18) + "</textformat>";
         }
         addChild(ft);
         this.ft4 = new FTextArea();
         with(this.ft4)
         {
            x = 383;
            y = 10;
            wordWrap = true;
            width = 80;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ft4);
         this.ft5 = new FTextArea();
         with(this.ft5)
         {
            x = 440;
            y = 10;
            wordWrap = true;
            width = 150;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'10\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,15) + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>【" + LanResManager.getLanTextWords(this,16) + "】</font>" + "</textformat>";
         }
         addChild(this.ft5);
         this.qiandaoBtn = new SecondButton();
         addChild(this.qiandaoBtn);
         this.qiandaoBtn.x = 475;
         this.qiandaoBtn.y = 30;
         this.qiandaoBtn.label = LanResManager.getLanCommonTextWords("签到");
         this.qiandaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.qiandaoBtn.visible = false;
         ft = new FTextArea();
         with(ft)
         {
            x = 95;
            y = 105;
            wordWrap = true;
            width = 250;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,2) + "</font><br>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanTextWords(this,3) + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,4) + "</font>" + "</textformat>";
         }
         addChild(ft);
         obj = FLoader.startLoad(GameConfig.fileBaseFolder + "/res/ui/bigIco/ico_14hour.png",65,65);
         addChild(obj);
         obj.x = 19;
         obj.y = 96;
         obj = FLoader.startLoad(GameConfig.fileBaseFolder + "/res/ui/bigIco/ico_42hour.png",65,65);
         addChild(obj);
         obj.x = 19;
         obj.y = 177;
         obj = FLoader.startLoad(GameConfig.fileBaseFolder + "/res/ui/bigIco/ico_84hour.png",65,65);
         addChild(obj);
         obj.x = 19;
         obj.y = 257;
         img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(img);
         img.x = 133;
         img.y = 121;
         this.zaixianTimeBar1 = new ColorBar(1,95,11);
         addChild(this.zaixianTimeBar1);
         this.zaixianTimeBar1.x = 147;
         this.zaixianTimeBar1.y = 124;
         this.zaixianTimeBar1.setValue(80,100);
         ft = new FTextArea();
         with(ft)
         {
            x = 95;
            y = 185;
            wordWrap = true;
            width = 250;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,5) + "</font><br>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanTextWords(this,3) + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,6) + "</font>" + "</textformat>";
         }
         addChild(ft);
         img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(img);
         img.x = 133;
         img.y = 201;
         this.zaixianTimeBar2 = new ColorBar(1,95,11);
         addChild(this.zaixianTimeBar2);
         this.zaixianTimeBar2.x = 147;
         this.zaixianTimeBar2.y = 204;
         this.zaixianTimeBar2.setValue(80,100);
         ft = new FTextArea();
         with(ft)
         {
            x = 95;
            y = 265;
            wordWrap = true;
            width = 330;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,7) + "</font><br>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanTextWords(this,3) + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,8) + "</font>" + "</textformat>";
         }
         addChild(ft);
         img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(img);
         img.x = 133;
         img.y = 281;
         this.zaixianTimeBar3 = new ColorBar(1,95,11);
         addChild(this.zaixianTimeBar3);
         this.zaixianTimeBar3.x = 147;
         this.zaixianTimeBar3.y = 284;
         this.zaixianTimeBar3.setValue(100,100);
         ft = new FTextArea();
         with(ft)
         {
            x = 410;
            y = 60;
            wordWrap = true;
            width = 180;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,9) + "</font>" + "</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 410;
            y = 128;
            wordWrap = true;
            width = 175;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanTextWords(this,10) + "</font>" + "</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 410;
            y = 202;
            wordWrap = true;
            width = 180;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanTextWords(this,11);
         }
         addChild(ft);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            x = 433;
            y = 224;
            wordWrap = true;
            width = 180;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ft2);
         this.ft3 = new FTextArea();
         with(this.ft3)
         {
            x = 395;
            y = 248;
            wordWrap = true;
            width = 200;
            autoSize = TextFieldAutoSize.LEFT;
            defaultTextFormat = tf;
            textColor = StaticValue.GREEN;
            htmlText = "";
         }
         addChild(this.ft3);
         ft = new FTextArea();
         with(ft)
         {
            x = 410;
            y = 274;
            wordWrap = true;
            width = 180;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanTextWords(this,12);
         }
         addChild(ft);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 453;
            y = 295;
            wordWrap = true;
            width = 180;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ft1);
         ft = new FTextArea();
         with(ft)
         {
            x = 425;
            y = 318;
            wordWrap = true;
            width = 180;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanTextWords(this,17);
         }
         addChild(ft);
         this.btn = new SecondButton();
         addChild(this.btn);
         this.btn.x = 517;
         this.btn.y = 222;
         this.btn.label = LanResManager.getLanCommonTextWords("领取奖励");
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               this._parent.dispatchEvent(new BaseEvent(GiftPanel.UI_GIFTPANEL_ZAIXIAN_GET_BTN_CLICK));
               break;
            case this.qiandaoBtn:
               this._parent.dispatchEvent(new BaseEvent(GiftPanel.UI_GIFTPANEL_QIANDAO_GET_BTN_CLICK));
         }
      }
      
      private function resize() : void
      {
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function setData(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         this.ft1.htmlText = int(param3 / 60 / 60) + LanResManager.getLanCommonTextWords("小时") + int(param3 / 60 % 60) + LanResManager.getLanCommonTextWords("分");
         this.ft2.htmlText = int(param1 / 60 / 60) + LanResManager.getLanCommonTextWords("小时") + int(param1 / 60 % 60) + LanResManager.getLanCommonTextWords("分");
         this.ft3.htmlText = LanResManager.getLanTextWords(this,13,[String(param2)]);
         this._prize = param2;
         if(param4)
         {
         }
         if(int(param3 / 60 / 60) >= 14)
         {
            this.zaixianTimeBar1.type = 5;
            this.zaixianTimeBar1.setValue(14,14);
         }
         else
         {
            this.zaixianTimeBar1.type = 1;
            this.zaixianTimeBar1.setValue(int(param3 / 60 / 60),14);
         }
         if(int(param3 / 60 / 60) >= 42)
         {
            this.zaixianTimeBar2.type = 5;
            this.zaixianTimeBar2.setValue(42,42);
         }
         else
         {
            this.zaixianTimeBar2.type = 1;
            this.zaixianTimeBar2.setValue(int(param3 / 60 / 60),42);
         }
         if(int(param3 / 60 / 60) >= 84)
         {
            this.zaixianTimeBar3.type = 5;
            this.zaixianTimeBar3.setValue(84,84);
         }
         else
         {
            this.zaixianTimeBar3.type = 1;
            this.zaixianTimeBar3.setValue(int(param3 / 60 / 60),84);
         }
      }
      
      public function setFettle(param1:int) : void
      {
         if(param1 == 1)
         {
            this.ft3.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,14,[String(this._prize)]) + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>[" + LanResManager.getLanCommonTextWords("已领奖") + "]</font>" + "</textformat>";
         }
         else if(param1 == 2)
         {
            this.ft3.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,14,[String(this._prize)]) + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>[" + LanResManager.getLanCommonTextWords("未领奖") + "]</font>" + "</textformat>";
         }
         else if(param1 == 3)
         {
            this.ft3.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,14,[String(this._prize)]) + "</font>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>[" + LanResManager.getLanCommonTextWords("未获奖") + "]</font>" + "</textformat>";
         }
      }
      
      public function returnBtn() : Boolean
      {
         return this.btn.enabled;
      }
      
      public function qiandanFun(param1:Number, param2:Number, param3:Boolean) : void
      {
         this.ft4.htmlText = "<textformat leading=\'10\'>" + param1 + LanResManager.getLanCommonTextWords("礼金") + "<br>" + param2 + LanResManager.getLanCommonTextWords("礼金") + "</textformat>";
         if(param3)
         {
            this.qiandaoBtn.visible = false;
            this.ft5.htmlText = "<textformat leading=\'10\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,15) + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>【" + LanResManager.getLanTextWords(this,16) + "】</font>" + "</textformat>";
         }
         else
         {
            this.qiandaoBtn.visible = true;
            this.ft5.htmlText = "<textformat leading=\'10\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,15) + "</font><br>" + "</textformat>";
         }
      }
      
      public function setOnlineTime(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
      }
   }
}

