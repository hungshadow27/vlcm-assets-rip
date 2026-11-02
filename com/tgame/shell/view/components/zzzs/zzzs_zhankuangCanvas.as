package com.tgame.shell.view.components.zzzs
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.ZhiZhanZhiShangPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class zzzs_zhankuangCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var fc:FCanvas;
      
      private var ft:FTextArea;
      
      private var bitTitle:Bitmap;
      
      private var line:DisplayObject;
      
      private var listContainer:Sprite;
      
      private var historyList:FList;
      
      private var homePageBtn:SmallButton;
      
      private var endPageBtn:SmallButton;
      
      private var preBtn:FSimpleButton;
      
      private var nextBtn:FSimpleButton;
      
      private var pageCount:FLabel;
      
      private var xian:Bitmap;
      
      private var Meng_bit:Bitmap;
      
      public function zzzs_zhankuangCanvas()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         var i:int;
         this.fc = new FCanvas();
         this.fc.x = 0;
         this.fc.y = 2;
         this.fc.width = 590;
         this.fc.height = 340;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.bitTitle = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         this.bitTitle.x = 3;
         this.bitTitle.y = 3;
         this.bitTitle.width = 450 + 140 - 6;
         this.bitTitle.height = 24;
         addChild(this.bitTitle);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 20;
            y = 5;
            wordWrap = true;
            width = 110;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BlUE20;
            htmlText = LanResManager.getLanCommonTextWords("对决时间");
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 150;
            y = 5;
            wordWrap = true;
            width = 70;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BlUE20;
            htmlText = LanResManager.getLanCommonTextWords("获胜阵营");
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 230 + 18;
            y = 5;
            wordWrap = true;
            width = 70;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BlUE20;
            htmlText = LanResManager.getLanCommonTextWords("斩杀人数");
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 325;
            y = 5;
            wordWrap = true;
            width = 120;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BlUE20;
            htmlText = LanResManager.getLanCommonTextWords("造成伤害总值");
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 460;
            y = 5;
            wordWrap = true;
            width = 130;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BlUE20;
            htmlText = LanResManager.getLanCommonTextWords("收到擂鼓次数");
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 20;
            y = 265 + 45;
            width = 330;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("历届比赛的结果，收录于此，为了荣誉，我们所向披靡！");
         }
         addChild(this.ft);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 130;
         this.line.y = 5;
         addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 210;
         this.line.y = 5;
         addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 305;
         this.line.y = 5;
         addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 455;
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
            graphics.drawRect(0,0,600 - 6,250);
            graphics.endFill();
         }
         this.historyList = new FList();
         this.historyList.skin = "list";
         this.historyList.itemRenderer = new zzzs_zhankuangListRanader();
         this.historyList.listWidth = 435 + 150 + 4 - 6;
         this.listContainer.addChild(this.historyList);
         this.historyList.x = 0;
         this.historyList.y = 0;
         this.homePageBtn = new SmallButton();
         this.homePageBtn.label = LanResManager.getLanCommonTextWords("首页");
         addChild(this.homePageBtn);
         this.homePageBtn.x = 225;
         this.homePageBtn.y = 285;
         this.homePageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         addChild(this.preBtn);
         this.preBtn.x = this.homePageBtn.x + this.homePageBtn.width + 2;
         this.preBtn.y = this.homePageBtn.y;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pageCount = new FLabel();
         with(this.pageCount)
         {
            x = preBtn.x + preBtn.width + 2;
            y = homePageBtn.y + 1;
            textColor = StaticValue.WHITE;
            text = "1/1";
         }
         addChild(this.pageCount);
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = this.pageCount.x + this.pageCount.width + 2;
         this.nextBtn.y = this.homePageBtn.y;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.endPageBtn = new SmallButton();
         this.endPageBtn.label = LanResManager.getLanCommonTextWords("尾页");
         addChild(this.endPageBtn);
         this.endPageBtn.x = this.nextBtn.x + this.nextBtn.width + 2;
         this.endPageBtn.y = this.homePageBtn.y;
         this.endPageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.homePageBtn:
               this.$parent.dispatchEvent(new BaseEvent(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_LIST_PAGE,"",1));
               break;
            case this.preBtn:
               this.$parent.dispatchEvent(new BaseEvent(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_LIST_PAGE,"",2));
               break;
            case this.nextBtn:
               this.$parent.dispatchEvent(new BaseEvent(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_LIST_PAGE,"",3));
               break;
            case this.endPageBtn:
               this.$parent.dispatchEvent(new BaseEvent(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_LIST_PAGE,"",4));
         }
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

