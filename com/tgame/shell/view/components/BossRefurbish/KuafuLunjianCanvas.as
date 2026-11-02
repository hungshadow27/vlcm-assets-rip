package com.tgame.shell.view.components.BossRefurbish
{
   import com.fireice.list.FList;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.conquerPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class KuafuLunjianCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      private var _parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var zhuangtaiFt:FTextArea;
      
      private var LingquBtn:SmallButton;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var guizheChaxunBtn:SecondButton;
      
      private var chuanruBtn:SecondButton;
      
      private var baoguoBtn:SecondButton;
      
      private var shengwangBtn:SecondButton;
      
      public var ico:CharAttributeOccultIco;
      
      private var _avatar:Bitmap;
      
      private var chengZhuWuQi:ItemFace;
      
      private var equipContainer:Sprite;
      
      private var yupei:ItemFace;
      
      private var flag:MovieClip;
      
      public var kuafulunjianguizechaxunCanvas:KuafuLunjianGuizeChaxunCanvas;
      
      private var imgTxdi:Bitmap;
      
      public function KuafuLunjianCanvas()
      {
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.kuafu.list.ui";
         addChild(this.bgImg);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 273;
            y = -17;
            wordWrap = true;
            width = 450;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("等级级以上，每周一：分可参与跨服论剑活动");
         }
         addChild(this.ft);
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this.imgTxdi = StaticValue.getBitmapByClassName("ui.paihang.ph13");
         addChild(this.imgTxdi);
         this.imgTxdi.width = 120;
         this.imgTxdi.height = 20.8;
         this.imgTxdi.x = 15;
         this.imgTxdi.y = 5;
         this.ico = new CharAttributeOccultIco();
         addChild(this.ico);
         this.ico.isMainChar = true;
         this.ico.x = 102;
         this.ico.y = 20;
         this.ico.visible = false;
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
            y = 223;
            wordWrap = true;
            width = 450;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ft1);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 153;
            y = 5;
            wordWrap = true;
            width = 450;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BlUE50;
            htmlText = LanResManager.getLanTextWords(this,"战场");
         }
         addChild(this.ft);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 150;
            y = 27;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,415,240);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new KuafuLunjianList();
         this.giftList.listWidth = 415;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.giftList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.Scroll = new FVScorllBar(this.listContainer,240);
         addChild(this.Scroll);
         this.Scroll.x = 565;
         this.Scroll.y = 27;
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 5;
            y = 317;
            wordWrap = true;
            width = 450;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanCommonTextWords("胜率每周一0:00准时清空");
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 150;
            y = 275;
            wordWrap = true;
            width = 450;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.GREEN;
            htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanTextWords(this,"在跨服战活动结束时1",[],false) + "</textformat>";
         }
         addChild(this.ft);
         this.zhuangtaiFt = new FTextArea();
         with(this.zhuangtaiFt)
         {
            x = 150;
            y = 319;
            wordWrap = true;
            width = 450;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.PURPLE50;
            htmlText = "";
         }
         addChild(this.zhuangtaiFt);
         this.LingquBtn = new SmallButton();
         this.LingquBtn.label = LanResManager.getLanCommonTextWords("领取上榜奖励");
         addChild(this.LingquBtn);
         this.LingquBtn.x = 490;
         this.LingquBtn.y = 313;
         this.LingquBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.guizheChaxunBtn = new SecondButton();
         this.guizheChaxunBtn.label = LanResManager.getLanCommonTextWords("跨服论剑规则查询");
         addChild(this.guizheChaxunBtn);
         this.guizheChaxunBtn.x = 10;
         this.guizheChaxunBtn.y = 353;
         this.guizheChaxunBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.chuanruBtn = new SecondButton();
         this.chuanruBtn.label = LanResManager.getLanCommonTextWords("传入跨服论剑台");
         addChild(this.chuanruBtn);
         this.chuanruBtn.x = 206;
         this.chuanruBtn.y = 353;
         this.chuanruBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.baoguoBtn = new SecondButton();
         this.baoguoBtn.label = LanResManager.getLanCommonTextWords("跨服包裹与收益取回");
         addChild(this.baoguoBtn);
         this.baoguoBtn.x = 331;
         this.baoguoBtn.y = 353;
         this.baoguoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shengwangBtn = new SecondButton();
         this.shengwangBtn.label = LanResManager.getLanCommonTextWords("声望商店购物");
         addChild(this.shengwangBtn);
         this.shengwangBtn.x = 466;
         this.shengwangBtn.y = 353;
         this.shengwangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
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
         this.ft1.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所属区服：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + this.giftList.selectItem.qufu + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色名：") + "</font><br>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + this.giftList.selectItem.name + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色等级：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + this.giftList.selectItem.dengji + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("胜率：") + "</font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + this.giftList.selectItem.shenglv + "</font><br>" + "</textformat>";
         this._parent.dispatchEvent(new BaseEvent(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LIST_ID,"",[this.giftList.selectItem.id,this.giftList.selectItem.qufu]));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.LingquBtn:
               this._parent.dispatchEvent(new BaseEvent(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LINGQUJIANGLI_ID));
               break;
            case this.guizheChaxunBtn:
               this.showGuizechaxun();
               break;
            case this.chuanruBtn:
               this._parent.dispatchEvent(new BaseEvent(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LUNJIANTAI));
               break;
            case this.baoguoBtn:
               this._parent.dispatchEvent(new BaseEvent(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_BAOGUOYUSHOUYI));
               break;
            case this.shengwangBtn:
               this._parent.dispatchEvent(new BaseEvent(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_SHENGWANGSHANGDIAN));
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function setInitialize(param1:Array) : void
      {
         this.giftList.dataProvider = param1;
         this.Scroll.update();
         this.ft1.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"所属区服角色名") + "</textformat>";
      }
      
      public function setShangbang(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc4_:String = LanResManager.getLanCommonTextWords("您的上榜状态：");
         if(param1 == 1)
         {
            _loc4_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【已上榜】") + "</font>";
         }
         else
         {
            _loc4_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("【未上榜】") + "</font>";
         }
         _loc4_ += LanResManager.getLanTextWords(this,"今日可领取");
         if(param2 == 0)
         {
            _loc4_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("【") + param2 + LanResManager.getLanCommonTextWords("块") + LanResManager.getLanCommonTextWords("】") + "</font>";
         }
         else
         {
            _loc4_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【") + param2 + LanResManager.getLanCommonTextWords("块") + LanResManager.getLanCommonTextWords("】") + "</font>";
         }
         this.zhuangtaiFt.htmlText = _loc4_;
         this.LingquBtn.enabled = param3;
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
      
      public function setYupei(param1:Goods) : void
      {
         if(Boolean(this.yupei) && Boolean(this.yupei.parent))
         {
            this.yupei.parent.removeChild(this.yupei);
         }
         if(!param1)
         {
            return;
         }
         this.yupei = new ItemFace(param1);
         addChildAt(this.yupei,getChildIndex(this.equipContainer) + 1);
         this.yupei.x = 134;
         this.yupei.y = 271;
      }
      
      public function setFlag(param1:int) : void
      {
         var onCom:Function = null;
         var value:int = param1;
         onCom = function():void
         {
            if(Boolean(flag) && Boolean(flag.parent))
            {
               flag.parent.removeChild(flag);
               flag.stop();
            }
            if(value != 0)
            {
               flag = StaticValue.getMCByClassName(StaticValue.conversionFlagID(value)) as MovieClip;
               addChildAt(flag,1);
               flag.x = 80 - flag.width / 2;
               flag.y = 70;
            }
         };
         RslLoaderManager.lazyLoad(onCom,null,GameConfig.fileBaseFolder + "res/data/mc/flag/lv1flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv2flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv3flag.swf");
      }
      
      public function showGuizechaxun() : void
      {
         if(!this.kuafulunjianguizechaxunCanvas)
         {
            this.kuafulunjianguizechaxunCanvas = new KuafuLunjianGuizeChaxunCanvas();
         }
         this.kuafulunjianguizechaxunCanvas.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.kuafulunjianguizechaxunCanvas);
         this.kuafulunjianguizechaxunCanvas.x = (GameConfig.sceneWidth - this.kuafulunjianguizechaxunCanvas.width) / 2;
         this.kuafulunjianguizechaxunCanvas.y = (GameConfig.sceneHeight - this.kuafulunjianguizechaxunCanvas.height) / 2;
      }
      
      public function onCloseGuizechaxun() : void
      {
         this.kuafulunjianguizechaxunCanvas.onClose();
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

