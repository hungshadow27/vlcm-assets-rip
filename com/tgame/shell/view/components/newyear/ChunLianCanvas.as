package com.tgame.shell.view.components.newyear
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.NewYearPanel;
   import com.tgame.shell.view.components.mainui.JianMianYouLiCanvas_mainui;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class ChunLianCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var bit:DisplayObject;
      
      private var item:ItemFace;
      
      private var bg:DisplayObject;
      
      private var shanglian:DisplayObject;
      
      private var spr_up:Sprite;
      
      private var spr_down:Sprite;
      
      private var spr_right:Sprite;
      
      private var ftTime:FTextArea;
      
      private var ftPaiHang:FTextArea;
      
      private var ftHB:FTextArea;
      
      private var barBg1:Bitmap;
      
      private var barBg2:Bitmap;
      
      private var gongMc:MovieClip;
      
      private var loadUrl:String;
      
      private var gongMcSpr:Sprite;
      
      private var btnXZ:NewButton;
      
      private var btnDL:NewButton;
      
      private var chunlianTimer:Timer;
      
      private var time:int;
      
      private var stratTime:int;
      
      private var yanhuaMc:MovieClip;
      
      private var fc1:FCanvas;
      
      public function ChunLianCanvas()
      {
         super();
         var _loc1_:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/newyear/bg2.png",532,560);
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         this.init();
      }
      
      private function init() : void
      {
         this.ft = new FTextArea();
         this.ft.x = 40 + 160 + 10;
         this.ft.y = 7 + 105;
         this.ft.width = 130;
         this.ft.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("距离下次春联刷新还有：") + "</font>";
         addChild(this.ft);
         this.ftTime = new FTextArea();
         this.ftTime.x = this.ft.x + this.ft.width + 10;
         this.ftTime.y = 7 + 105;
         this.ftTime.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "28:59" + "</font>";
         addChild(this.ftTime);
         this.spr_up = new Sprite();
         with(this.spr_up)
         {
            x = 120 - 30 + 10;
            y = 25 + 110 + 2;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,380,225);
            graphics.endFill();
         }
         addChild(this.spr_up);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.multiline = true;
         this.ft.wordWrap = true;
         this.ft.y = 70 - 5;
         this.ft.width = 340;
         this.ft.height = 150;
         this.ft.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动期间每收集一副春联可获得10元春节红包，春联所需的文字可在全世界打怪获得！") + "<br>" + LanResManager.getLanCommonTextWords("活动期间8天24小时内每半个小时刷新一副春联") + "<br>" + LanResManager.getLanCommonTextWords("每次刷新春联后本平台第一名提交春联的玩家将获得100元春节红包！") + "<br>" + LanResManager.getLanCommonTextWords("春节红包上限为1000元，获得1000元后即可免费领取本次对联活动的礼包！") + "<br>" + LanResManager.getLanCommonTextWords("活动期间内玩家充值也将会获得等同于充值元宝数量1/10的春节红包！") + "</font></textformat>";
         this.spr_up.addChild(this.ft);
         this.spr_down = new Sprite();
         with(this.spr_down)
         {
            x = 120 - 20 + 10;
            y = 190 + 30 + 30 + 95 - 20 + 2;
            graphics.beginFill(16750866,0);
            graphics.drawRect(0,0,330,130);
            graphics.endFill();
         }
         addChild(this.spr_down);
         this.ftPaiHang = new FTextArea();
         this.ftPaiHang.multiline = true;
         this.ftPaiHang.x = 5;
         this.ftPaiHang.y = 22;
         this.ftPaiHang.height = 150;
         this.ftPaiHang.width = 275;
         this.spr_down.addChild(this.ftPaiHang);
         this.spr_right = new Sprite();
         with(this.spr_right)
         {
            x = 520 - 15 - 60 + 2 + 10;
            y = 25 + 112 - 20 + 2 + 2;
            graphics.beginFill(10040314,0);
            graphics.drawRect(0,0,70,388);
            graphics.endFill();
         }
         addChild(this.spr_right);
         this.bit = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/newyear/bar_bg.swf");
         this.bit.x = 95 + 10;
         this.bit.y = 420 - 115 + 8 + 100 + 75 + 2;
         addChild(this.bit);
         this.gongMcSpr = new Sprite();
         this.gongMcSpr.x = 100 - 160 + 10;
         this.gongMcSpr.y = 420 - 115 + 8 + 100 + 75 - 190 + 2;
         addChild(this.gongMcSpr);
         this.ft = new FTextArea();
         this.ft.x = 170 + 35 - 20 + 10;
         this.ft.y = 420 - 115 + 15 + 100 + 65 + 5 + 2;
         this.ft.width = 125;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("已获得春节活动红包：") + "</font>";
         addChild(this.ft);
         this.ftHB = new FTextArea();
         this.ftHB.x = this.ft.x + this.ft.width + 10;
         this.ftHB.y = 420 - 115 + 15 + 100 + 65 + 5;
         this.ftHB.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "400" + "</font>";
         addChild(this.ftHB);
         this.btnXZ = new NewButton();
         this.btnXZ.x = width / 2 - width / 2 / 2 - this.btnXZ.width / 2 + 20;
         this.btnXZ.y = 450 - 100 + 100 + 70;
         this.btnXZ.textColor = StaticValue.WHITE;
         this.btnXZ.label = LanResManager.getLanCommonTextWords("领取礼包");
         this.btnXZ.setPandding(8,2,18,10);
         this.btnXZ.setSkin("chunlianBtn");
         addChild(this.btnXZ);
         this.btnXZ.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btnDL = new NewButton();
         this.btnDL.textColor = StaticValue.WHITE;
         this.btnDL.x = width / 2 + width / 2 / 2 - this.btnDL.width / 2 + 20;
         this.btnDL.y = 450 - 100 + 100 + 70;
         this.btnDL.label = LanResManager.getLanCommonTextWords("提交对联");
         this.btnDL.setPandding(8,2,18,10);
         this.btnDL.setSkin("chunlianBtn");
         addChild(this.btnDL);
         this.btnDL.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnXZ:
               this.$parent.dispatchEvent(new BaseEvent(NewYearPanel.UI_LINGQUXUNZHANG_BTN));
               break;
            case this.btnDL:
               this.$parent.dispatchEvent(new BaseEvent(NewYearPanel.UI_CHUNLIANPANEL_TIJIAODUILIAN_CLICK));
         }
      }
      
      private function setJDT(param1:int) : void
      {
         this.gongMc = StaticValue.getMCByClassName("ui.newyear.chunlian.bar") as MovieClip;
         this.gongMcSpr.addChild(this.gongMc);
         this.gongMc.x = 145 + 10;
         this.gongMc.y = 190;
         this.gongMc.gotoAndStop(param1);
      }
      
      private function onEnterFarme(param1:Event) : void
      {
         var _loc2_:int = (getTimer() - this.stratTime) / 1000;
         _loc2_ = this.time - _loc2_;
         if(_loc2_ > 0)
         {
            this.ftTime.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(JianMianYouLiCanvas_mainui,LanResManager.getLanCommonTextWords("分秒"),[int(_loc2_ / 60),_loc2_ % 60]) + "</font>";
         }
         else
         {
            this.ftTime.htmlText = "";
            this.chunlianTimer = new Timer(500);
            this.chunlianTimer.start();
            removeEventListener(Event.ENTER_FRAME,this.onEnterFarme);
         }
      }
      
      public function setInit(param1:Array, param2:Boolean, param3:Boolean) : void
      {
         this.setShangLian(param1[1]);
         this.setXunZhang(param1[2]);
         var _loc4_:Array = String(param1[4]).split(",");
         this.setPaiHang(_loc4_);
         this.setHB(param1[7]);
         var _loc5_:Array = String(param1[6]).split(",");
         this.setXL(_loc5_,param2);
         this.setTime(param1[0]);
         if(param3)
         {
            this.btnDL.enabled = false;
            this.btnDL.label = LanResManager.getLanCommonTextWords("已完成");
            this.btnDL.setPandding(8,8,23,8);
            this.btnXZ.enabled = false;
            this.btnXZ.label = LanResManager.getLanCommonTextWords("已领取");
            this.btnXZ.setPandding(8,8,23,8);
         }
         else
         {
            this.btnDL.enabled = true;
            this.btnDL.label = LanResManager.getLanCommonTextWords("提交对联");
            this.btnDL.setPandding(8,2,18,10);
            this.btnXZ.enabled = true;
            this.btnXZ.label = LanResManager.getLanCommonTextWords("领取礼包");
            this.btnXZ.setPandding(8,2,18,10);
         }
      }
      
      public function setTime(param1:int) : void
      {
         if(this.chunlianTimer != null)
         {
            this.chunlianTimer.stop();
            this.chunlianTimer = null;
            removeEventListener(Event.ENTER_FRAME,this.onEnterFarme);
         }
         this.time = param1;
         this.stratTime = getTimer();
         addEventListener(Event.ENTER_FRAME,this.onEnterFarme);
      }
      
      public function setShangLian(param1:String) : void
      {
         if(this.shanglian != null)
         {
            this.shanglian.parent.removeChild(this.shanglian);
         }
         this.shanglian = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/newyear/" + param1 + ".swf");
         this.shanglian.x = 20 + 16 + 10;
         this.shanglian.y = 30 + 135 - 20 + 2;
         addChild(this.shanglian);
      }
      
      public function setXunZhang(param1:int) : void
      {
         var _loc2_:Goods = new Goods(param1);
         this.item = new ItemFace(_loc2_,65,65);
         this.item.x = 132 + 11 + 1;
         this.item.y = 27 - 10 - 20 + 1;
         this.spr_up.addChild(this.item);
      }
      
      public function setPaiHang(param1:Array) : void
      {
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ += param1[_loc3_] + "<br>";
            _loc3_++;
         }
         this.ftPaiHang.htmlText = "<textformat leading=\'4\'><font size=\'12\' color=\'" + StaticValue.WHITE_HTML + "\'>" + _loc2_ + "</font></textformat>";
      }
      
      public function setHB(param1:int) : void
      {
         this.ftHB.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + LanResManager.getLanCommonTextWords(" 元") + "</font>";
         this.setJDT(param1 / 10);
      }
      
      public function setXL(param1:Array, param2:Boolean = false) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.spr_right.numChildren > 0)
         {
            this.spr_right.removeChildAt(0);
         }
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc3_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(int(param1[_loc5_]),true);
            _loc4_ = new ItemFace(_loc3_);
            _loc4_.x = 15 + 2 + 1;
            _loc4_.y = 25 + 45 * _loc5_ + 2;
            this.spr_right.addChild(_loc4_);
            if(param2)
            {
               _loc4_.filters = [];
            }
            else
            {
               _loc4_.filters = Tools.blackWhiteFilter;
            }
            _loc4_.setShowCount(false);
            _loc5_++;
         }
      }
      
      public function setMC() : void
      {
         if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            yanhuaMc = _loc2_.content as MovieClip;
            yanhuaMc.x = 95 + 10 - 30 + 3;
            yanhuaMc.y = 420 - 115 + 8 + 100 + 75 + 2 - 57 + 5;
            addChild(yanhuaMc);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/newyear/yasuiqiantexiao.swf");
      }
      
      public function removeMC() : void
      {
         if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
      }
   }
}

