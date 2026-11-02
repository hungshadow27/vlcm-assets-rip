package com.tgame.shell.view.components.BossRefurbish
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.shell.view.components.conquerPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class KuafuFuQiCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      private var _parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var playFta1:FTextArea;
      
      private var playFta2:FTextArea;
      
      private var statusFa:FTextArea;
      
      private var listContainer:Sprite;
      
      private var playerList:FList;
      
      private var startBtn:SecondButton;
      
      private var bagBtn:SecondButton;
      
      private var shopBtn:SecondButton;
      
      private var giftBtn:SecondButton;
      
      private var _avatar:Bitmap;
      
      private var homePageBtn:SmallButton;
      
      private var endPageBtn:SmallButton;
      
      private var preBtn:FSimpleButton;
      
      private var nextBtn:FSimpleButton;
      
      private var pageCount:FLabel;
      
      private var _leftAvatar:Bitmap;
      
      private var _rightAvatar:Bitmap;
      
      private var noOnLineText1:FTextArea;
      
      private var noOnLineText2:FTextArea;
      
      public function KuafuFuQiCanvas()
      {
         var bg:DisplayObject;
         super();
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/fuqijingji/rankbg.swf");
         bg.x = 0;
         bg.y = 0;
         addChild(bg);
         this.statusFa = new FTextArea();
         with(this.statusFa)
         {
            x = 15;
            y = 270;
            wordWrap = true;
            width = 500;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.PURPLE50;
            htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("上榜的前十侠侣组合每天可领取额外的侠侣值！您当前排名：") + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("【未上榜】") + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("侠侣值：") + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("不可领取") + "</font></textformat>";
         }
         addChild(this.statusFa);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 15;
            y = 290 + 10;
            wordWrap = true;
            width = 570;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("侠侣声望每周一0点清空，排行榜每天6点更新。侠侣值可在好友界面查看，并且每月一号零点清空，请尽快使用！") + "</font></textformat>";
         }
         addChild(this.ft);
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this.playFta1 = new FTextArea();
         with(this.playFta1)
         {
            x = 10;
            y = 198;
            wordWrap = true;
            width = 150;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.playFta1);
         this.playFta2 = new FTextArea();
         with(this.playFta2)
         {
            x = 465;
            y = 198;
            wordWrap = true;
            width = 150;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.playFta2);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 150;
            y = 5;
            wordWrap = true;
            width = 450;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BlUE50;
            htmlText = LanResManager.getLanCommonTextWords("排名             侠侣组合               本周声望");
         }
         addChild(this.ft);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 145;
            y = 27;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,300,210);
            graphics.endFill();
         }
         this.playerList = new FList();
         this.playerList.skin = "list";
         this.playerList.itemRenderer = new FuQiJingjiList();
         this.playerList.listWidth = 300;
         this.listContainer.addChild(this.playerList);
         this.playerList.x = 0;
         this.playerList.y = 0;
         this.playerList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.homePageBtn = new SmallButton();
         this.homePageBtn.label = LanResManager.getLanCommonTextWords("首页");
         addChild(this.homePageBtn);
         this.homePageBtn.x = 205;
         this.homePageBtn.y = 240;
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
         this.nextBtn.x = this.pageCount.x + 37 - 10 - 5 - 2 + 15;
         this.nextBtn.y = this.homePageBtn.y;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.endPageBtn = new SmallButton();
         this.endPageBtn.label = LanResManager.getLanCommonTextWords("尾页");
         addChild(this.endPageBtn);
         this.endPageBtn.x = this.nextBtn.x + 27;
         this.endPageBtn.y = this.homePageBtn.y;
         this.endPageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始竞技");
         addChild(this.startBtn);
         this.startBtn.x = 50;
         this.startBtn.y = 353;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.bagBtn = new SecondButton();
         this.bagBtn.label = LanResManager.getLanCommonTextWords("跨服包裹与收益取回");
         addChild(this.bagBtn);
         this.bagBtn.x = 150;
         this.bagBtn.y = 353;
         this.bagBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.giftBtn = new SecondButton();
         this.giftBtn.label = LanResManager.getLanCommonTextWords("领取上榜奖励");
         addChild(this.giftBtn);
         this.giftBtn.x = 330;
         this.giftBtn.y = 353;
         this.giftBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.shopBtn = new SecondButton();
         this.shopBtn.label = LanResManager.getLanCommonTextWords("侠侣商店");
         addChild(this.shopBtn);
         this.shopBtn.x = 450;
         this.shopBtn.y = 353;
         this.shopBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.noOnLineText1 = new FTextArea();
         with(this.noOnLineText1)
         {
            x = 25 - 5;
            y = 100 - 45 + 20;
            width = 96;
            height = 40;
            defaultTextFormat = new TextFormat(null,null,StaticValue.YELLOW,null,null,null,null,null,"center");
            filters = StaticValue.filter;
            visible = false;
         }
         this.noOnLineText1.text = LanResManager.getLanCommonTextWords("玩家不在线");
         addChild(this.noOnLineText1);
         this.noOnLineText2 = new FTextArea();
         with(this.noOnLineText2)
         {
            x = 480 - 5;
            y = 100 - 45 + 20;
            width = 96;
            height = 40;
            defaultTextFormat = new TextFormat(null,null,StaticValue.YELLOW,null,null,null,null,null,"center");
            filters = StaticValue.filter;
            visible = false;
         }
         this.noOnLineText2.text = LanResManager.getLanCommonTextWords("玩家不在线");
         addChild(this.noOnLineText2);
         this._leftAvatar = new Bitmap();
         addChild(this._leftAvatar);
         this._rightAvatar = new Bitmap();
         addChild(this._rightAvatar);
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
         if(this.playerList.selectItem == null)
         {
            return;
         }
         this.clear();
         this.playFta1.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所属区服：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + this.playerList.selectItem.qufu1 + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色名：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + this.playerList.selectItem.name1 + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色等级：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + this.playerList.selectItem.dengji1 + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("胜率：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + this.playerList.selectItem.shenglv1 / 100 + "%</font><br>" + "</textformat>";
         this.playFta2.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所属区服：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + this.playerList.selectItem.qufu2 + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色名：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + this.playerList.selectItem.name2 + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色等级：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + this.playerList.selectItem.dengji2 + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("胜率：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + this.playerList.selectItem.shenglv2 / 100 + "%</font><br>" + "</textformat>";
         this._parent.dispatchEvent(new BaseEvent(conquerPanel.UI_FUQI_SHOW_AVATAR,"",[this.playerList.selectItem.id1,this.playerList.selectItem.id2]));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.giftBtn:
               this._parent.dispatchEvent(new BaseEvent(conquerPanel.UI_FUQI_GIFT_CLICK));
               break;
            case this.startBtn:
               this._parent.dispatchEvent(new BaseEvent(conquerPanel.UI_FUQI_START_CLICK));
               break;
            case this.bagBtn:
               this._parent.dispatchEvent(new BaseEvent(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_BAOGUOYUSHOUYI));
               break;
            case this.shopBtn:
               this._parent.dispatchEvent(new BaseEvent(conquerPanel.UI_FUQI_SHOP_CLICK));
               break;
            case this.homePageBtn:
               this._parent.dispatchEvent(new BaseEvent(conquerPanel.UI_FUQI_SHOW_BY_PAGE,"",1));
               break;
            case this.preBtn:
               this._parent.dispatchEvent(new BaseEvent(conquerPanel.UI_FUQI_SHOW_BY_PAGE,"",2));
               break;
            case this.nextBtn:
               this._parent.dispatchEvent(new BaseEvent(conquerPanel.UI_FUQI_SHOW_BY_PAGE,"",3));
               break;
            case this.endPageBtn:
               this._parent.dispatchEvent(new BaseEvent(conquerPanel.UI_FUQI_SHOW_BY_PAGE,"",4));
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function setPageList(param1:int, param2:int, param3:Boolean = false, param4:Boolean = false) : void
      {
         this.clear();
         this.pageCount.text = param1 + "/" + param2;
         this.homePageBtn.enabled = this.preBtn.enabled = !param3;
         this.endPageBtn.enabled = this.nextBtn.enabled = !param4;
      }
      
      public function clear() : void
      {
         this.noOnLineText1.visible = true;
         this.noOnLineText2.visible = true;
         this._leftAvatar.bitmapData = null;
         this._rightAvatar.bitmapData = null;
      }
      
      public function setInitialize(param1:Array, param2:int, param3:int, param4:int, param5:Boolean) : void
      {
         var _loc6_:Object = null;
         this.playerList.dataProvider = param1;
         this.setShangbang(param4,param5);
         this.setPageList(param2,param3,param2 <= 1,param2 == param3);
         if(param1 != null && param1.length > 0)
         {
            this.playerList.setSelectItemByIndex(0);
            this._parent.dispatchEvent(new BaseEvent(conquerPanel.UI_FUQI_SHOW_AVATAR,"",[this.playerList.selectItem.id1,this.playerList.selectItem.id2]));
            _loc6_ = param1[0];
            this.playFta1.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所属区服：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + _loc6_.qufu1 + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色名：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + _loc6_.name1 + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色等级：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + _loc6_.dengji1 + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("胜率：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + _loc6_.shenglv1 / 100 + "%</font><br>" + "</textformat>";
            this.playFta2.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所属区服：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + _loc6_.qufu2 + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色名：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + _loc6_.name2 + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色等级：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + _loc6_.dengji2 + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("胜率：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + _loc6_.shenglv2 / 100 + "%</font><br>" + "</textformat>";
         }
         else
         {
            this.playFta1.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所属区服：") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色名：") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色等级：") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("胜率：") + "</font>" + "</textformat>";
            this.playFta2.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所属区服：") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色名：") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色等级：") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("胜率：") + "</font>" + "</textformat>";
         }
      }
      
      public function setShangbang(param1:int, param2:Boolean) : void
      {
         this.statusFa.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("上榜的前十侠侣组合每天可领取额外的侠侣值！您当前排名：") + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + (param1 == 0 ? LanResManager.getLanCommonTextWords("【未上榜】") : " " + param1 + "  ") + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("侠侣值：") + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + (param2 ? LanResManager.getLanCommonTextWords("可领取") : LanResManager.getLanCommonTextWords("不可领取")) + "</font></textformat>";
         this.giftBtn.enabled = param2;
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
      
      public function setAvatar(param1:int, param2:BitmapData, param3:Boolean = false) : void
      {
         if(this.playerList.selectItem == null)
         {
            return;
         }
         if(this.playerList.selectItem.id1 == param1)
         {
            this.noOnLineText1.visible = false;
            this.setLeftAvatar(param2,param3);
         }
         else if(this.playerList.selectItem.id2 == param1)
         {
            this.noOnLineText2.visible = false;
            this.setRightAvatar(param2,param3);
         }
      }
      
      private function setLeftAvatar(param1:BitmapData, param2:Boolean) : void
      {
         this._leftAvatar.bitmapData = param1;
         if(param2)
         {
            this._leftAvatar.x = 70 - this._leftAvatar.width / 2;
            this._leftAvatar.y = 200 - this._leftAvatar.height - 5;
         }
         else
         {
            this._leftAvatar.x = 70 - this._leftAvatar.width / 2;
            this._leftAvatar.y = 200 - this._leftAvatar.height + 30;
         }
      }
      
      private function setRightAvatar(param1:BitmapData, param2:Boolean) : void
      {
         this._rightAvatar.bitmapData = param1;
         if(param2)
         {
            this._rightAvatar.x = 520 - this._rightAvatar.width / 2;
            this._rightAvatar.y = 200 - this._rightAvatar.height - 5;
         }
         else
         {
            this._rightAvatar.x = 520 - this._rightAvatar.width / 2;
            this._rightAvatar.y = 200 - this._rightAvatar.height + 30;
         }
      }
   }
}

