package com.tgame.shell.view.components.gift
{
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.GiftPanel;
   import com.tgame.shell.view.components.gift.itemrender.DayActivityListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class DayActivityCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      private var ft:FTextArea;
      
      private var _parent:DisplayObject;
      
      private var bmpStar:Bitmap;
      
      private var itemVip:ItemFace;
      
      private var loginBtn:SecondButton;
      
      private var getBtn:SmallButton;
      
      private var getBtn1:SmallButton;
      
      private var getBtn2:SmallButton;
      
      private var getBtn3:SmallButton;
      
      private var taskList:FList;
      
      private var zaixianTimeBar1:ColorBar;
      
      private var zaixianTimeBar2:ColorBar;
      
      private var zaixianTimeBar3:ColorBar;
      
      private var box:Bitmap;
      
      private var Scroll:FVScorllBar;
      
      private var starBg:Sprite;
      
      private var goods1:int;
      
      private var goods2:int;
      
      private var goods3:int;
      
      private var boxId:int;
      
      private var dayBg:Sprite;
      
      private var weekDayArr:Array = [LanResManager.getLanCommonTextWords("周一"),LanResManager.getLanCommonTextWords("周二"),LanResManager.getLanCommonTextWords("周三"),LanResManager.getLanCommonTextWords("周四"),LanResManager.getLanCommonTextWords("周五"),LanResManager.getLanCommonTextWords("周六"),LanResManager.getLanCommonTextWords("周日")];
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var listDataAr:Array = [];
      
      public function DayActivityCanvas()
      {
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.huodong.huoyuedu.ui";
         addChild(this.bgImg);
         this.init();
         this.initGoods();
      }
      
      public function init(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:int = 0, param7:Array = null, param8:Array = null) : void
      {
         var listContainer:Sprite;
         var i:int;
         var cur:int = param1;
         var isVip:int = param2;
         var isSign:int = param3;
         var dayTime:int = param4;
         var weekTime:int = param5;
         var dayCount:int = param6;
         var need:Array = param7;
         var list:Array = param8;
         this.starBg = new Sprite();
         this.starBg.x = 220;
         this.starBg.y = 10;
         addChild(this.starBg);
         this.ft = new FTextArea();
         with(this.ft)
         {
            name = "ftAct";
            textColor = StaticValue.GREEN;
            width = 220;
            height = 120;
            x = 15;
            y = 10;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\' size=\'18\'>" + LanResManager.getLanCommonTextWords("今日活跃度") + "0" + "</font>";
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 200;
            height = 120;
            x = 90;
            y = 48;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\' size=\'12\'>" + LanResManager.getLanCommonTextWords("每天登陆签到后，可以获得游戏礼金。") + "</font>";
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            autoSize = TextFieldAutoSize.CENTER;
            width = 112;
            height = 20;
            x = 55;
            y = 80;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.GOLD_HTML + "\' size=\'14\'>" + LanResManager.getLanCommonTextWords("活动名称") + "</font>";
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            autoSize = TextFieldAutoSize.CENTER;
            width = 109;
            height = 20;
            x = 162;
            y = 80;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.GOLD_HTML + "\' size=\'14\'>" + LanResManager.getLanCommonTextWords("完成度") + "</font>";
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            autoSize = TextFieldAutoSize.CENTER;
            width = 85;
            height = 20;
            x = 269;
            y = 80;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.GOLD_HTML + "\' size=\'14\'>" + LanResManager.getLanCommonTextWords("单次活跃") + "</font>";
         }
         addChild(this.ft);
         this.loginBtn = new SecondButton();
         addChild(this.loginBtn);
         this.loginBtn.x = 475;
         this.loginBtn.y = 10;
         if(isSign == 0)
         {
            this.loginBtn.label = LanResManager.getLanCommonTextWords("点此签到");
         }
         else
         {
            this.loginBtn.label = LanResManager.getLanCommonTextWords("领取奖励");
         }
         this.loginBtn.addEventListener(MouseEvent.CLICK,this.onSignClick);
         listContainer = new Sprite();
         with(listContainer)
         {
            x = 6;
            y = 100;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,275,215);
            graphics.endFill();
         }
         addChild(listContainer);
         this.taskList = new FList();
         this.taskList.skin = "list";
         this.taskList.dataProvider = list;
         this.taskList.itemRenderer = new DayActivityListRender();
         this.taskList.listWidth = 297;
         listContainer.addChild(this.taskList);
         this.Scroll = new FVScorllBar(listContainer,215);
         addChild(this.Scroll);
         this.Scroll.x = 305;
         this.Scroll.y = 102;
         this.Scroll.update();
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 180;
            height = 20;
            x = 100;
            y = 322;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\' size=\'12\'>" + LanResManager.getLanCommonTextWords("每天晚上点更新！") + "</font>";
         }
         addChild(this.ft);
         this.itemVip = new ItemFace(new Goods(1300));
         this.itemVip.x = 46;
         this.itemVip.y = 37;
         addChild(this.itemVip);
         i = 0;
         while(i < 7)
         {
            this.ft = new FTextArea();
            with(this.ft)
            {
               
               width = 36;
               height = 16;
               x = 329 + i * 36;
               y = 40;
               autoSize = TextFieldAutoSize.CENTER;
               filters = StaticValue.filter;
               htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\' size=\'12\'>" + weekDayArr[i] + "</font>";
            }
            addChild(this.ft);
            i++;
         }
         this.dayBg = new Sprite();
         this.dayBg.x = 338;
         this.dayBg.y = 58;
         addChild(this.dayBg);
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 150;
            height = 20;
            x = 336;
            y = 90;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.RED_HTML + "\' size=\'12\'>" + LanResManager.getLanCommonTextWords("每日签到奖励说明：") + "</font>";
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            autoSize = TextFieldAutoSize.LEFT;
            x = 336;
            y = 110;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.RED_HTML + "\' size=\'12\'>" + LanResManager.getLanCommonTextWords("每日登陆签到后，在下周一签到时可以领取丰") + "<br>" + LanResManager.getLanCommonTextWords("厚的奖励，签的日期越多，奖品价值越丰厚，") + "<br>" + LanResManager.getLanCommonTextWords("请确保您的背包总是有一个以上的空格，否则") + "<br>" + LanResManager.getLanCommonTextWords("礼物会跳过无法获得！") + "</font>";
         }
         addChild(this.ft);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 10;
            y = 10;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            width = 200;
            wordWrap = true;
         }
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "tipsCanvasBg";
         this.tipCanvas.addChild(this.tip);
      }
      
      private function onSignClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(GiftPanel.UI_GIFTPANEL_QIANDAO_GET_BTN_CLICK));
      }
      
      private function onTimeBtn1Click(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(GiftPanel.UI_GIFTPANEL_DAYACTIVITY_TIME1_BTN_CLICK));
      }
      
      private function onTimeBtn2Click(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(GiftPanel.UI_GIFTPANEL_DAYACTIVITY_TIME2_BTN_CLICK));
      }
      
      private function onTimeBtn3Click(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(GiftPanel.UI_GIFTPANEL_DAYACTIVITY_TIME3_BTN_CLICK));
      }
      
      private function onGoodsBtnClick(param1:MouseEvent) : void
      {
         this.boxId = int(param1.currentTarget.name.charAt(8)) + 1;
         this._parent.dispatchEvent(new BaseEvent(GiftPanel.UI_GIFTPANEL_DAYACTIVITY_GET_BTN_CLICK,"",this.boxId));
      }
      
      private function initGoods() : void
      {
         var xx:int = 0;
         var yy:int = 0;
         var i:int = 0;
         while(i < 4)
         {
            xx = int(i % 2);
            yy = int(i / 2);
            this.ft = new FTextArea();
            with(this.ft)
            {
               
               width = 55;
               height = 20;
               x = 420 + xx * 122 - 30;
               y = 197 + yy * 74;
               filters = StaticValue.filter;
               htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\' size=\'12\'>" + LanResManager.getLanCommonTextWords("需要活跃") + "</font>";
            }
            addChild(this.ft);
            this.ft = new FTextArea();
            with(this.ft)
            {
               
               name = "ft" + i;
               width = 50;
               height = 20;
               x = 420 + xx * 122 - 30;
               y = 212 + yy * 74;
               filters = StaticValue.filter;
               autoSize = TextFieldAutoSize.CENTER;
               htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\' size=\'12\'>" + "0" + "</font>";
            }
            addChild(this.ft);
            this.getBtn = new SmallButton();
            this.getBtn.name = "goodsBtn" + i;
            addChild(this.getBtn);
            this.getBtn.x = 376 + xx * 122 - 30;
            this.getBtn.y = 235 + yy * 74;
            this.getBtn.label = LanResManager.getLanCommonTextWords("领取");
            this.getBtn.addEventListener(MouseEvent.CLICK,this.onGoodsBtnClick);
            i++;
         }
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.taskList.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouse);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.listDataAr[int((this.taskList.mouseY - 1) / 20)].res);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.taskList.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouse);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 20;
         this.tipCanvas.height = this.tip.height + 20;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function setList(param1:Array) : void
      {
         this.taskList.dataProvider = param1;
         this.taskList.listHeight = 115;
         this.listDataAr = param1;
         this.Scroll.update();
         this.taskList.addEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
         this.taskList.addEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
      }
      
      public function setInfo(param1:int, param2:int, param3:Boolean) : void
      {
         var percent:Number;
         var j:int;
         var spBg:Sprite;
         var spMask:Sprite;
         var i:int;
         var cur:int = param1;
         var total:int = param2;
         var vipImg:Boolean = param3;
         while(this.starBg.numChildren)
         {
            this.starBg.removeChildAt(0);
         }
         (getChildByName("ftAct") as FTextArea).htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\' size=\'18\'>" + LanResManager.getLanCommonTextWords("今日活跃度") + cur + "</font>";
         percent = 160 * cur / total;
         j = 0;
         while(j < 10)
         {
            this.bmpStar = StaticValue.getBitmapByClassName("itemtip.s1");
            this.bmpStar.x = j * 16;
            this.bmpStar.y = 0;
            this.starBg.addChild(this.bmpStar);
            j++;
         }
         spBg = new Sprite();
         spMask = new Sprite();
         this.starBg.addChild(spBg);
         this.starBg.addChild(spMask);
         with(spMask)
         {
            x = 0;
            y = 0;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,percent,16);
            graphics.endFill();
         }
         spBg.mask = spMask;
         i = 0;
         while(i < 10)
         {
            this.bmpStar = StaticValue.getBitmapByClassName("itemtip.s2");
            this.bmpStar.x = i * 16;
            this.bmpStar.y = 0;
            spBg.addChild(this.bmpStar);
            i++;
         }
         if(vipImg)
         {
            this.itemVip.filters = [];
         }
         else
         {
            this.itemVip.filters = Tools.blackWhiteFilter;
         }
      }
      
      public function setSign(param1:int, param2:String) : void
      {
         var _loc3_:Bitmap = null;
         switch(param1)
         {
            case 1:
               this.loginBtn.enabled = false;
               this.loginBtn.label = LanResManager.getLanCommonTextWords("已签到");
               break;
            case 0:
               this.loginBtn.label = LanResManager.getLanCommonTextWords("点此签到");
               this.loginBtn.enabled = true;
         }
         while(this.dayBg.numChildren)
         {
            this.dayBg.removeChildAt(0);
         }
         var _loc4_:Array = param2.split("_");
         var _loc5_:int = 0;
         while(_loc5_ < 7)
         {
            if(_loc4_[_loc5_] == "1")
            {
               _loc3_ = StaticValue.getBitmapByClassName("ui.huodong.huoyuedu.qiandao.img");
               _loc3_.x = _loc5_ * 36;
               _loc3_.y = 0;
               this.dayBg.addChild(_loc3_);
            }
            _loc5_++;
         }
      }
      
      public function setTime1(param1:int, param2:int) : void
      {
         if(param1 >= param2)
         {
            this.zaixianTimeBar1.type = 5;
            this.zaixianTimeBar1.setValue(param1,param2);
         }
         else
         {
            this.zaixianTimeBar1.type = 1;
            this.zaixianTimeBar1.setValue(param1,param2);
         }
      }
      
      public function setTime2(param1:int) : void
      {
         if(int(param1 / 60 / 60) >= 84)
         {
            this.zaixianTimeBar2.type = 5;
            this.zaixianTimeBar2.setValue(84,84);
         }
         else
         {
            this.zaixianTimeBar2.type = 1;
            this.zaixianTimeBar2.setValue(int(param1 / 60 / 60),84);
         }
      }
      
      public function setTime3(param1:int, param2:int, param3:int) : void
      {
         if(param2 >= param1)
         {
            this.zaixianTimeBar3.type = 5;
         }
         this.zaixianTimeBar3.setValue(param2,param1);
         this.goods3 = param3;
      }
      
      public function setGoods(param1:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:ItemFace = null;
         var _loc2_:int = int(param1.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_)
         {
            _loc3_ = int(_loc6_ % 2);
            _loc4_ = int(_loc6_ / 2);
            _loc5_ = new ItemFace(param1[_loc6_][0] as Goods);
            _loc5_.x = 345 + _loc3_ * 122;
            _loc5_.y = 193 + _loc4_ * 75;
            addChild(_loc5_);
            (getChildByName("ft" + _loc6_) as FTextArea).htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\' size=\'12\'>" + param1[_loc6_][1] + "</font>";
            (getChildByName("goodsBtn" + _loc6_) as SmallButton).enabled = param1[_loc6_][2];
            _loc6_++;
         }
      }
   }
}

