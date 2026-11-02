package com.tgame.shell.view.components.biwuCrossPlatform
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.BiwuCrossPlatform_Panel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class HistoryCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      private var _parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var zhuangtaiFt:FTextArea;
      
      private var listContainer:Sprite;
      
      private var historyList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var homePageBtn:SmallButton;
      
      private var endPageBtn:SmallButton;
      
      private var preBtn:FSimpleButton;
      
      private var nextBtn:FSimpleButton;
      
      private var pageCount:FLabel;
      
      public var arrs:Array;
      
      private var bt_bit:Bitmap;
      
      private var line:DisplayObject;
      
      private var fc2:FCanvas;
      
      private var xian:Bitmap;
      
      private var Meng_bit:Bitmap;
      
      public function HistoryCanvas()
      {
         var i:int = 0;
         this.arrs = [];
         super();
         this.fc2 = new FCanvas();
         this.fc2.x = 0;
         this.fc2.y = 0;
         this.fc2.width = 590;
         this.fc2.height = 342;
         this.fc2.skin = "box_transparence";
         addChild(this.fc2);
         this.fc2 = new FCanvas();
         this.fc2.x = 2;
         this.fc2.y = 305;
         this.fc2.width = 590 - 4;
         this.fc2.height = 35;
         this.fc2.skin = "box_transparence";
         addChild(this.fc2);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 275;
            y = -17;
            wordWrap = true;
            width = 450 + 150;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("名单上的玩家，可以在比武大会开始前分钟传入地图。");
         }
         addChild(this.ft);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 5;
            y = 240;
            wordWrap = true;
            width = 450 + 150;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ft1);
         this.bt_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         this.bt_bit.x = 3;
         this.bt_bit.y = 3;
         this.bt_bit.width = 450 + 140 - 6;
         this.bt_bit.height = 24;
         addChild(this.bt_bit);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 3;
            y = 5;
            wordWrap = true;
            width = 450 + 150;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BlUE50;
            htmlText = "       " + LanResManager.getLanCommonTextWords("对决时间") + "                   " + LanResManager.getLanCommonTextWords("参与平台") + "                                 " + LanResManager.getLanCommonTextWords("获胜平台") + "                          " + LanResManager.getLanCommonTextWords("冠军名称");
         }
         addChild(this.ft);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 130;
         this.line.y = 5;
         addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 270;
         this.line.y = 5;
         addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 430;
         this.line.y = 5;
         addChild(this.line);
         i = 0;
         while(i < 12)
         {
            this.xian = new Bitmap();
            this.xian = StaticValue.getBitmapByClassName("ui.line");
            this.xian.x = 4;
            this.xian.y = (i + 1) * 23 + 28;
            this.xian.width = 580;
            addChild(this.xian);
            if(i % 2 == 1)
            {
               this.Meng_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
               this.Meng_bit.x = 4;
               this.Meng_bit.y = 23 * i + 28;
               this.Meng_bit.width = 590 - 6;
               this.Meng_bit.height = 23;
               addChild(this.Meng_bit);
            }
            i++;
         }
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 3;
            y = 27;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,600 - 6,376);
            graphics.endFill();
         }
         this.historyList = new FList();
         this.historyList.skin = "list";
         this.historyList.itemRenderer = new HistoryList();
         this.historyList.listWidth = 435 + 150 + 4 - 6;
         this.listContainer.addChild(this.historyList);
         this.historyList.x = 0;
         this.historyList.y = 0;
         this.homePageBtn = new SmallButton();
         this.homePageBtn.label = LanResManager.getLanCommonTextWords("首页");
         addChild(this.homePageBtn);
         this.homePageBtn.x = 285 + 11 - 150 / 2;
         this.homePageBtn.y = 198 - 5 - 5 + 2 + 95;
         this.homePageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         addChild(this.preBtn);
         this.preBtn.x = this.homePageBtn.x + 42;
         this.preBtn.y = this.homePageBtn.y;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pageCount = new FLabel();
         with(this.pageCount)
         {
            x = preBtn.x + 22 + 2;
            y = homePageBtn.y + 1;
            textColor = StaticValue.WHITE;
            text = "1/1";
         }
         addChild(this.pageCount);
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = this.pageCount.x + 37 - 10 - 5 - 2;
         this.nextBtn.y = this.homePageBtn.y;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.endPageBtn = new SmallButton();
         this.endPageBtn.label = LanResManager.getLanCommonTextWords("尾页");
         addChild(this.endPageBtn);
         this.endPageBtn.x = this.nextBtn.x + 27;
         this.endPageBtn.y = this.homePageBtn.y;
         this.endPageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zhuangtaiFt = new FTextArea();
         with(this.zhuangtaiFt)
         {
            x = 12;
            y = 315;
            wordWrap = true;
            width = 450;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanCommonTextWords("历届的荣誉就在于此，为了平台的荣誉，为了个人的荣誉，我们所向披靡！");
         }
         addChild(this.zhuangtaiFt);
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage,false,-int.MAX_VALUE);
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         var _loc2_:Shape = new Shape();
         _loc2_.graphics.beginFill(0,0);
         _loc2_.graphics.drawRect(-9999,0,999999,999999);
         _loc2_.graphics.endFill();
         addChild(_loc2_);
         this.mask = _loc2_;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.homePageBtn:
               this._parent.dispatchEvent(new BaseEvent(BiwuCrossPlatform_Panel.UI_HISTORYPANEL_LIST_GET_PAGE,"",1));
               break;
            case this.preBtn:
               this._parent.dispatchEvent(new BaseEvent(BiwuCrossPlatform_Panel.UI_HISTORYPANEL_LIST_GET_PAGE,"",2));
               break;
            case this.nextBtn:
               this._parent.dispatchEvent(new BaseEvent(BiwuCrossPlatform_Panel.UI_HISTORYPANEL_LIST_GET_PAGE,"",3));
               break;
            case this.endPageBtn:
               this._parent.dispatchEvent(new BaseEvent(BiwuCrossPlatform_Panel.UI_HISTORYPANEL_LIST_GET_PAGE,"",4));
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         HistoryList.$parent = this;
         HistoryList.$parent2 = param1;
      }
      
      public function setInitialize(param1:Array, param2:int = 0) : void
      {
         this.historyList.dataProvider = param1;
      }
      
      public function setPageList(param1:int, param2:int, param3:Boolean = false, param4:Boolean = false) : void
      {
         this.pageCount.text = param1 + "/" + param2;
         this.homePageBtn.enabled = this.preBtn.enabled = !param3;
         this.endPageBtn.enabled = this.nextBtn.enabled = !param4;
      }
   }
}

