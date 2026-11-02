package com.tgame.shell.view.components.yitiantulong
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   import flash.utils.getTimer;
   
   public class YiTianTuLongBang extends Sprite
   {
      
      public var _parent:DisplayObject;
      
      private var line:DisplayObject;
      
      private var xian:Bitmap;
      
      private var Meng_bit:Bitmap;
      
      private var tipCanvas:FCanvas;
      
      private var ft:FTextArea;
      
      private var ft2:FTextArea;
      
      private var tuichuBtn:SecondButton;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var dqcs:FTextArea;
      
      private var now:int = 0;
      
      private var bt_bit:Bitmap;
      
      private var listContainer:Sprite;
      
      private var rankList:FList;
      
      private var timeFt:FTextArea;
      
      private var time:int;
      
      private var stratTime:int;
      
      public function YiTianTuLongBang()
      {
         var fts1:FTextArea;
         var i:int = 0;
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "box";
         this.tipCanvas.width = 350;
         this.tipCanvas.height = 400;
         addChild(this.tipCanvas);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 50;
         this.line.y = 5 + 85;
         this.tipCanvas.addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 200;
         this.line.y = 5 + 85;
         this.tipCanvas.addChild(this.line);
         i = 0;
         while(i < 10)
         {
            this.xian = new Bitmap();
            this.xian = StaticValue.getBitmapByClassName("ui.line");
            this.xian.x = 4;
            this.xian.y = (i + 1) * 23 + 28 + 85;
            this.xian.width = 350;
            this.tipCanvas.addChild(this.xian);
            if(i % 2 == 1)
            {
               this.Meng_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
               this.Meng_bit.x = 4;
               this.Meng_bit.y = 23 * i + 28 + 85;
               this.Meng_bit.width = 350 - 6;
               this.Meng_bit.height = 23;
               this.tipCanvas.addChild(this.Meng_bit);
            }
            i++;
         }
         fts1 = new FTextArea();
         this.tipCanvas.addChild(fts1);
         fts1.filters = StaticValue.filter;
         fts1.autoSize = TextFieldAutoSize.LEFT;
         fts1.x = 130;
         fts1.y = 10;
         fts1.textColor = StaticValue.PURPLE;
         fts1.htmlText = "<font size=\'16\'>" + LanResManager.getLanCommonTextWords("排行榜") + "</font>";
         this.ft2 = new FTextArea();
         this.tipCanvas.addChild(this.ft2);
         this.ft2.filters = StaticValue.filter;
         this.ft2.autoSize = TextFieldAutoSize.LEFT;
         this.ft2.x = 20;
         this.ft2.y = 40;
         this.ft2.textColor = StaticValue.YELLOW;
         this.ft2.htmlText = LanResManager.getLanCommonTextWords("战斗信息") + "<br>" + LanResManager.getLanCommonTextWords("战斗信息") + "<br>" + LanResManager.getLanCommonTextWords("战斗信息") + "<br>";
         this.bt_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         this.bt_bit.x = 3;
         this.bt_bit.y = 3 + 85;
         this.bt_bit.width = 350 - 6;
         this.bt_bit.height = 24;
         this.tipCanvas.addChild(this.bt_bit);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 3;
            y = 5 + 85;
            wordWrap = true;
            width = 350;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BlUE50;
            htmlText = "  " + LanResManager.getLanCommonTextWords("排名") + "                  " + LanResManager.getLanCommonTextWords("名字") + "                                 " + LanResManager.getLanCommonTextWords("击杀人数") + "           " + LanResManager.getLanCommonTextWords("武魂值");
         }
         this.tipCanvas.addChild(this.ft);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 135 - 25;
         this.previousButton.y = 222 + 150;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 255 - 25;
         this.nextButton.y = 222 + 150;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tuichuBtn = new SecondButton();
         this.tuichuBtn.label = LanResManager.getLanCommonTextWords("退出副本");
         this.tuichuBtn.x = 220;
         this.tuichuBtn.y = 10;
         addChild(this.tuichuBtn);
         this.tuichuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.timeFt = new FTextArea();
         addChild(this.timeFt);
         this.timeFt.filters = StaticValue.filter;
         this.timeFt.autoSize = TextFieldAutoSize.LEFT;
         this.timeFt.x = this.tuichuBtn.x;
         this.timeFt.y = this.tuichuBtn.y + 30;
         this.timeFt.width = 200;
         this.timeFt.height = 20;
         this.timeFt.textColor = StaticValue.RED;
         this.dqcs = new FTextArea();
         with(this.dqcs)
         {
            multiline = true;
            filters = StaticValue.filter;
            width = 100;
            height = 16;
            x = 155 - 25 + 45;
            y = 222 + 150;
            textColor = StaticValue.WHITE;
            htmlText = "1/2";
         }
         addChild(this.dqcs);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 3;
            y = 27 + 85;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,400,140);
            graphics.endFill();
         }
         this.rankList = new FList();
         this.rankList.skin = "list";
         this.rankList.itemRenderer = new YiTianTuLongList();
         this.rankList.listWidth = 295 + 50;
         this.listContainer.addChild(this.rankList);
         this.rankList.x = 0;
         this.rankList.y = 0;
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this._parent.dispatchEvent(new BaseEvent(MainUI.YITIANTULONG_SHARENBANG_CLICK,"",this.now - 1));
               break;
            case this.nextButton:
               this._parent.dispatchEvent(new BaseEvent(MainUI.YITIANTULONG_SHARENBANG_CLICK,"",this.now + 1));
               break;
            case this.tuichuBtn:
               this._parent.dispatchEvent(new BaseEvent(MainUI.YITIANTULONG_TUICHU_CLICK));
         }
      }
      
      public function setpanel(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:Array, param7:int) : void
      {
         this.ft2.htmlText = LanResManager.getLanCommonTextWords("你的战斗信息：") + "<br>" + LanResManager.getLanCommonTextWords("击杀人数：") + param4 + "<br>" + LanResManager.getLanCommonTextWords("当前排位：") + param5 + "<br>";
         this.dqcs.htmlText = param2 + "/" + param3;
         this.now = param2;
         if(param2 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(param2 == param3)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         this.rankList.dataProvider = param6;
         this.time = param7;
         this.stratTime = getTimer();
         addEventListener(Event.ENTER_FRAME,this.onEnterFarme);
      }
      
      private function onEnterFarme(param1:Event) : void
      {
         var _loc2_:int = (getTimer() - this.stratTime) / 1000;
         _loc2_ = this.time - _loc2_;
         if(_loc2_ > 0)
         {
            this.timeFt.htmlText = LanResManager.getLanCommonTextWords("剩余时间：") + Math.floor(_loc2_ / 3600) + ":" + Math.floor(_loc2_ % 3600 / 60) + ":" + Math.floor(_loc2_ % 3600 % 60);
         }
         else
         {
            this.timeFt.htmlText = " ";
            removeEventListener(Event.ENTER_FRAME,this.onEnterFarme);
         }
      }
   }
}

