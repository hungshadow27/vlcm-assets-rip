package com.tgame.shell.view.components.gift
{
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.gift.itemrender.YaoQinYouLiGiftListRender;
   import com.tgame.shell.view.components.gift.itemrender.YaoQingYouLiPlayerListRender;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.system.System;
   import flash.text.*;
   
   public class YaoQingYouLiCanvas extends FCanvas
   {
      
      private var _parent:DisplayObject;
      
      private var container:Sprite;
      
      private var scroll:FVScorllBar;
      
      private var giftContainer:FCanvas;
      
      private var giftList:FList;
      
      private var url:FTextArea;
      
      private var copyBtn:SmallButton;
      
      private var countLabel:FLabel;
      
      private var tip:FTextArea;
      
      private var playerBox:FCanvas;
      
      private var playerList:FList;
      
      public function YaoQingYouLiCanvas()
      {
         var lb:FLabel;
         var tf:TextFormat;
         var ft:FTextArea = null;
         var bg:F9GridBitmap = null;
         var line:Bitmap = null;
         super();
         skin = "box";
         width = 450;
         height = 307;
         this.container = new Sprite();
         addChild(this.container);
         this.container.x = 2;
         this.container.y = 2;
         with(this.container.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,430,303);
            endFill();
         }
         this.scroll = new FVScorllBar(this.container,303);
         addChild(this.scroll);
         this.scroll.x = 432;
         this.scroll.y = 2;
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 10;
            wordWrap = true;
            width = 420;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,0) + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,1) + "</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanTextWords(this,2) + "</font><br>" + "</textformat>";
         }
         this.container.addChild(ft);
         bg = Tools.get9GridBitmpByName("inputBg");
         this.container.addChild(bg);
         bg.width = 320;
         bg.x = 10;
         bg.y = ft.y + ft.height + 10;
         this.url = new FTextArea();
         with(this.url)
         {
            x = 12;
            y = bg.y;
            height = 20;
            width = 316;
            textColor = StaticValue.WHITE;
            selectable = true;
            text = "http://www.aojian.net/userid=12345679";
         }
         this.container.addChild(this.url);
         this.copyBtn = new SmallButton();
         this.copyBtn.label = LanResManager.getLanTextWords(this,3);
         this.container.addChild(this.copyBtn);
         this.copyBtn.x = 335;
         this.copyBtn.y = bg.y + 1;
         this.copyBtn.addEventListener(MouseEvent.CLICK,this.onCopy);
         line = StaticValue.getBitmapByClassName("ui.line");
         this.container.addChild(line);
         line.width = 430;
         line.y = this.url.y + 30;
         this.countLabel = new FLabel();
         with(this.countLabel)
         {
            x = 10;
            y = line.y + 10;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("您当前已经邀请了0位玩家成功穿越到了傲剑的世界");
         }
         this.container.addChild(this.countLabel);
         this.giftContainer = new FCanvas();
         this.giftContainer.skin = "box";
         this.container.addChild(this.giftContainer);
         this.giftContainer.x = 0;
         this.giftContainer.y = this.url.y + 70;
         this.giftContainer.width = 430;
         line = StaticValue.getBitmapByClassName("ui.line");
         this.giftContainer.addChild(line);
         line.width = 426;
         line.x = 2;
         line.y = 23;
         lb = new FLabel();
         with(lb)
         {
            x = 8;
            y = 3;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,4);
         }
         this.giftContainer.addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 185;
            y = 3;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,5);
         }
         this.giftContainer.addChild(lb);
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new YaoQinYouLiGiftListRender();
         this.giftList.listWidth = 426;
         this.giftContainer.addChild(this.giftList);
         this.giftList.x = 2;
         this.giftList.y = 25;
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 10;
            width = 300;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,6) + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,7) + "</font>" + "</textformat>";
         }
         this.container.addChild(this.tip);
         this.playerBox = new FCanvas();
         this.playerBox.skin = "box";
         this.container.addChild(this.playerBox);
         this.playerBox.x = 30;
         this.playerBox.y = this.tip.y + this.tip.height + 10;
         this.playerBox.width = 370;
         tf = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            x = 0;
            y = 3;
            width = 110;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("玩家名");
         }
         this.playerBox.addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 110;
            y = 3;
            width = 50;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         this.playerBox.addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 160;
            y = 3;
            width = 50;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("门派");
         }
         this.playerBox.addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 210;
            y = 3;
            width = 110;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮派");
         }
         this.playerBox.addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 320;
            y = 3;
            width = 50;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("状态");
         }
         this.playerBox.addChild(ft);
         line = StaticValue.getBitmapByClassName("ui.line");
         this.playerBox.addChild(line);
         line.width = 370;
         line.x = 2;
         line.y = 23;
         this.playerList = new FList();
         this.playerList.skin = "list";
         this.playerList.itemRenderer = new YaoQingYouLiPlayerListRender();
         this.playerList.listWidth = 366;
         this.playerBox.addChild(this.playerList);
         this.playerList.x = 2;
         this.playerList.y = 25;
         this.playerList.addEventListener(MouseEvent.CLICK,this.onList);
         this.resize();
      }
      
      private function onList(param1:MouseEvent) : void
      {
         if(!this.playerList.selectItem)
         {
         }
      }
      
      private function onCopy(param1:MouseEvent) : void
      {
         System.setClipboard(this.url.text);
      }
      
      public function resize() : void
      {
         this.giftContainer.height = this.giftList.height + 25;
         this.tip.y = this.giftContainer.y + this.giftContainer.height;
         this.playerBox.y = this.tip.y + this.tip.height + 10;
         this.playerBox.height = this.playerList.height + 25;
         this.scroll.update();
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         YaoQinYouLiGiftListRender.$parent = param1;
      }
      
      public function set URL(param1:String) : void
      {
         this.url.text = param1;
      }
      
      public function set prize(param1:Array) : void
      {
         this.giftList.dataProvider = param1;
      }
      
      public function set playerCount(param1:int) : void
      {
         this.countLabel.text = LanResManager.getLanTextWords(this,8,[param1]);
      }
      
      public function set player(param1:Array) : void
      {
         this.playerList.dataProvider = param1;
      }
   }
}

