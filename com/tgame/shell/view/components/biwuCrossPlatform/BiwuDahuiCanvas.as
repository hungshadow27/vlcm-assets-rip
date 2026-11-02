package com.tgame.shell.view.components.biwuCrossPlatform
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.BiwuCrossPlatform_Panel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class BiwuDahuiCanvas extends Sprite
   {
      
      public static const UI_BIWUDAHUI_ZHUWEI_BTN_CLICK:String = "UI_BIWUDAHUI_ZHUWEI_BTN_CLICK";
      
      public var bgImg:Bitmap;
      
      private var _parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var zhuangtaiFt:FTextArea;
      
      private var LingquBtn:SmallButton;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      public var ico:CharAttributeOccultIco;
      
      private var _avatar:Bitmap;
      
      private var chengZhuWuQi:ItemFace;
      
      private var equipContainer:Sprite;
      
      private var yupei:ItemFace;
      
      private var flag:MovieClip;
      
      private var biwudahuizhuwei:BiwuDahuiZhuweiCanvas;
      
      private var imgTxdi:Bitmap;
      
      private var NOLabel:FLabel;
      
      private var homePageBtn:SmallButton;
      
      private var endPageBtn:SmallButton;
      
      private var preBtn:FSimpleButton;
      
      private var nextBtn:FSimpleButton;
      
      private var pageCount:FLabel;
      
      public var arrs:Array;
      
      public function BiwuDahuiCanvas()
      {
         this.arrs = [];
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.biwuDahui.ui";
         addChild(this.bgImg);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 275;
            y = -17;
            wordWrap = true;
            width = 450;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("名单上的玩家，可以在比武大会开始前分钟传入地图。");
         }
         addChild(this.ft);
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 13;
         this.equipContainer.y = 66;
         with(this.equipContainer.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,203,240);
            endFill();
         }
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 5;
            y = 240;
            wordWrap = true;
            width = 450;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ft1);
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 158;
            y = 5;
            wordWrap = true;
            width = 450;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BlUE50;
            htmlText = LanResManager.getLanCommonTextWords("小组") + "                    " + LanResManager.getLanCommonTextWords("姓名") + "                       " + LanResManager.getLanCommonTextWords("战场地图") + "                  " + LanResManager.getLanCommonTextWords("比赛开始时间") + "                     " + LanResManager.getLanCommonTextWords("选手助威");
         }
         addChild(this.ft);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 150;
            y = 27;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,445,200);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new BiwuDahuiList();
         this.giftList.listWidth = 435;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.giftList.addEventListener(MouseEvent.CLICK,this.onListClick);
         addEventListener(BiwuDahuiCanvas.UI_BIWUDAHUI_ZHUWEI_BTN_CLICK,this.showZhuweiCanvas);
         this.Scroll = new FVScorllBar(this.listContainer,200);
         addChild(this.Scroll);
         this.Scroll.x = 565;
         this.Scroll.y = 27;
         this.homePageBtn = new SmallButton();
         this.homePageBtn.label = LanResManager.getLanCommonTextWords("首页");
         addChild(this.homePageBtn);
         this.homePageBtn.x = 285 + 11;
         this.homePageBtn.y = 198 - 5 - 5 + 2 + 20;
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
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 150;
            y = 238;
            wordWrap = true;
            width = 435;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanCommonTextWords("上榜玩家：在赛前分钟内传入比赛地图，当比赛开始后，未传入的选手当弃权处理；") + LanResManager.getLanCommonTextWords("比赛结束后，选手可以领取自己最高名次的奖励，请选手准时参加比赛。");
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 150;
            y = 275 - 3;
            wordWrap = true;
            width = 435;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("三十二强玩家助威规则详细描述");
         }
         addChild(this.ft);
         this.zhuangtaiFt = new FTextArea();
         with(this.zhuangtaiFt)
         {
            x = 150;
            y = 325 - 3;
            wordWrap = true;
            width = 450;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BlUE;
            htmlText = "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的上榜状态：") + "</font><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("未上榜") + "</font>";
         }
         addChild(this.zhuangtaiFt);
         this.LingquBtn = new SmallButton();
         this.LingquBtn.label = LanResManager.getLanCommonTextWords("领取奖励");
         addChild(this.LingquBtn);
         this.LingquBtn.x = 530;
         this.LingquBtn.y = 325 - 3;
         this.LingquBtn.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("元宝奖励将直接发放到您的包裹内。") + "</font></textformat>";
         this.LingquBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.ico = new CharAttributeOccultIco();
         addChild(this.ico);
         this.ico.isMainChar = true;
         this.ico.x = 102;
         this.ico.y = 20 + 2 + 5;
         this.ico.visible = false;
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
      
      private function onListClick(param1:MouseEvent) : void
      {
         if(this.giftList.selectItem == null)
         {
            return;
         }
         this.ft1.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所属区服：") + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + this.giftList.selectItem.qufu + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色名：") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + this.giftList.selectItem.name + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色等级：") + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + this.giftList.selectItem.dengji + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("战斗力评定：") + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + this.giftList.selectItem.zhandouli + "</font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("来自平台：") + "</font>" + "<font color=\'" + StaticValue
         .RED_HTML + "\'>" + this.giftList.selectItem.pingtaiCN + "</font><br>" + "</textformat>";
         this.arrs = new Array();
         this.arrs[0] = this.giftList.selectItem.id;
         this.arrs[1] = this.giftList.selectItem.qufu;
         this._parent.dispatchEvent(new BaseEvent(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_LIST_ID,"",[this.giftList.selectItem.id,this.giftList.selectItem.qufu,this.giftList.selectItem.pingtai]));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.homePageBtn:
               this._parent.dispatchEvent(new BaseEvent(BiwuCrossPlatform_Panel.UI_BIWUDAHUIPANEL_LIST_GET_PAGE,"",1));
               break;
            case this.preBtn:
               this._parent.dispatchEvent(new BaseEvent(BiwuCrossPlatform_Panel.UI_BIWUDAHUIPANEL_LIST_GET_PAGE,"",2));
               break;
            case this.nextBtn:
               this._parent.dispatchEvent(new BaseEvent(BiwuCrossPlatform_Panel.UI_BIWUDAHUIPANEL_LIST_GET_PAGE,"",3));
               break;
            case this.endPageBtn:
               this._parent.dispatchEvent(new BaseEvent(BiwuCrossPlatform_Panel.UI_BIWUDAHUIPANEL_LIST_GET_PAGE,"",4));
               break;
            case this.LingquBtn:
               this._parent.dispatchEvent(new BaseEvent(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_LINGJIANG_BTN_CLICK));
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         BiwuDahuiList.$parent = this;
         BiwuDahuiList.$parent2 = param1;
      }
      
      public function setInitialize(param1:Array, param2:int = 0) : void
      {
         this.giftList.dataProvider = param1;
         this.Scroll.update();
         if(param1.length == 0)
         {
            this.ft1.htmlText = "";
         }
         else
         {
            this.ft1.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所属区服：") + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1[param2].qufu + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色名：") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1[param2].name + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色等级：") + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1[param2].dengji + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("战斗力评定：") + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1[param2].zhandouli + "</font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("来自平台：") + "</font>" + "<font color=\'" + StaticValue
            .RED_HTML + "\'>" + param1[param2].pingtaiCN + "</font><br>" + "</textformat>";
         }
      }
      
      public function setPageList(param1:int, param2:int, param3:Boolean = false, param4:Boolean = false) : void
      {
         this.clear();
         this.pageCount.text = param1 + "/" + param2;
         this.homePageBtn.enabled = this.preBtn.enabled = !param3;
         this.endPageBtn.enabled = this.nextBtn.enabled = !param4;
      }
      
      public function setShangbang(param1:Boolean, param2:Boolean) : void
      {
         var _loc3_:String = "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的上榜状态：") + "</font>";
         if(param1)
         {
            _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("已上榜") + "</font>";
         }
         else
         {
            _loc3_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("未上榜") + "</font>";
         }
         this.zhuangtaiFt.htmlText = _loc3_;
         this.LingquBtn.enabled = param2;
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         this._avatar.x = 75 - this._avatar.width / 2;
         this._avatar.y = 200 - this._avatar.height + 20;
      }
      
      public function setICOXiantian(param1:Boolean, param2:int, param3:int, param4:int) : void
      {
         this.ico.setXiantian(param1,param2,param3,param4);
      }
      
      public function setICORouti(param1:Boolean) : void
      {
         this.ico.setRouti(param1);
      }
      
      public function setICOHuXinYao(param1:Boolean) : void
      {
         this.ico.setHuXinYao(param1);
      }
      
      public function setICONiXi(param1:Boolean) : void
      {
         this.ico.setNiXi(param1);
      }
      
      public function setStarState(param1:Boolean, param2:int, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int, param9:Boolean, param10:int, param11:Boolean, param12:int, param13:Boolean, param14:int, param15:Boolean, param16:int) : void
      {
         this.ico.setState(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16);
      }
      
      public function setSiShengShouState(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.ico.setSiShengShouState(param1,param2,param3,param4);
      }
      
      public function showZhuweiCanvas(param1:BaseEvent) : void
      {
         if(!this.biwudahuizhuwei)
         {
            this.biwudahuizhuwei = new BiwuDahuiZhuweiCanvas();
            this.biwudahuizhuwei.$parent = this._parent;
         }
         if(param1.data is Array)
         {
            this.arrs = param1.data as Array;
         }
         if(this.arrs == null)
         {
            return;
         }
         this.SetArr(this.arrs);
      }
      
      public function SetArr(param1:Array) : void
      {
         if(!this.biwudahuizhuwei)
         {
            this.biwudahuizhuwei = new BiwuDahuiZhuweiCanvas();
            this.biwudahuizhuwei.$parent = this._parent;
         }
         this.biwudahuizhuwei.visible = true;
         this.biwudahuizhuwei.SetArr(this.arrs);
         GameInstance.uiInstance.uiContainer.addChild(this.biwudahuizhuwei);
         this.biwudahuizhuwei.x = (GameConfig.sceneWidth - this.biwudahuizhuwei.width) / 2;
         this.biwudahuizhuwei.y = (GameConfig.sceneHeight - this.biwudahuizhuwei.height) / 2;
      }
      
      public function clear() : void
      {
         this.avatar = null;
         this.ico.setState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
         this.ico.setXiantian(false,0,0,-1);
         this.ico.setHuXinYao(false);
         this.ico.setRouti(false);
      }
      
      public function setAvaterXY(param1:Boolean, param2:int = 0, param3:int = 0) : void
      {
         if(param1)
         {
            this._avatar.x = 75 - this._avatar.width / 2;
            this._avatar.y = 200 - this._avatar.height - 15;
         }
         else
         {
            this._avatar.x = param2;
            this._avatar.y = param3;
         }
      }
   }
}

