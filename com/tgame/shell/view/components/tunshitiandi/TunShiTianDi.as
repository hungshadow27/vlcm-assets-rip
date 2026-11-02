package com.tgame.shell.view.components.tunshitiandi
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.moudels.tunShiTianDi.view.info.TunShiTianDiVo;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   
   public class TunShiTianDi extends FPanel
   {
      
      public static const SHOW_TUNSHITIANDI:String = "SHOW_TUNSHITIANDI";
      
      public static const TUNSHITIANDI_PAIHANG_CLICK:String = "TUNSHITIANDI_PAIHANG_CLICK";
      
      public static const TUNSHITIANDI_PIPEI_CLICK:String = "TUNSHITIANDI_PIPEI_CLICK";
      
      public static const TUNSHITIANDI_QUXIAO_CLICK:String = "TUNSHITIANDI_QUXIAO_CLICK";
      
      public static const TUNSHITIANDI_WANFASHUOMING_CLICK:String = "TUNSHITIANDI_WANFASHUOMING_CLICK";
      
      public static const TUNSHITIANDI_KUAFUBAOGUO_CLICK:String = "TUNSHITIANDI_KUAFUBAOGUO_CLICK";
      
      public static const TUNSHITIANDI_LINGQUJIANGLI_CLICK:String = "TUNSHITIANDI_LINGQUJIANGLI_CLICK";
      
      public static const TUNSHITIANDI_JIFENSHANGCHENG_CLICK:String = "TUNSHITIANDI_JIFENSHANGCHENG_CLICK";
      
      public static const TUNSHITIANDI_PAIHANGBANG_FANYE_CLICK:String = "TUNSHITIANDI_PAIHANGBANG_FANYE_CLICK";
      
      private var bg:DisplayObject;
      
      private var paiming:FTextArea;
      
      private var paihangBtn:SecondButton;
      
      private var bisai:FTextArea;
      
      private var wanfaBtn:SecondButton;
      
      private var baoguoBtn:SecondButton;
      
      private var queXiaoBtn:FSimpleButton;
      
      private var baoMingBtn:NewSkinButton;
      
      private var lingquBtn:SecondButton;
      
      private var shangchengBtn:SecondButton;
      
      private var _playerAvatar1:Bitmap;
      
      private var _playerAvatar2:Bitmap;
      
      private var _playerAvatar3:Bitmap;
      
      private var _playerAvatar4:Bitmap;
      
      private var _playerAvatar0:Bitmap;
      
      private var timer:Timer;
      
      private var timeFta:FTextArea;
      
      private var timerCount:int = 0;
      
      private var isWaiting:Boolean;
      
      private var name1:FTextArea;
      
      private var name2:FTextArea;
      
      private var name3:FTextArea;
      
      private var name4:FTextArea;
      
      private var name5:FTextArea;
      
      private var xuWei1:DisplayObject;
      
      private var xuWei2:DisplayObject;
      
      private var xuWei3:DisplayObject;
      
      private var xuWei4:DisplayObject;
      
      private var xuWei5:DisplayObject;
      
      private var xuWei6:DisplayObject;
      
      private var paihangbang:TunShiTianDi_PaiHangBang;
      
      private var shuoMingPanel:TunShiTianDiShuoMingPanel;
      
      public function TunShiTianDi()
      {
         var tfalign:TextFormat;
         var spr:Sprite;
         super();
         titleText = LanResManager.getLanCommonTextWords("吞食天地");
         dragAble = true;
         this.showCloseButton = true;
         width = 850;
         height = 490;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/bg.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/paiming1.swf");
         this.bg.x = 375;
         this.bg.y = 80;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/paiming2.swf");
         this.bg.x = 250;
         this.bg.y = 140;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/paiming3.swf");
         this.bg.x = 500;
         this.bg.y = 140;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/paiming4.swf");
         this.bg.x = 85;
         this.bg.y = 200;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/paiming5.swf");
         this.bg.x = 665;
         this.bg.y = 200;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/namebg.swf");
         this.bg.x = 370 - 2;
         this.bg.y = 115 + 3;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/namebg.swf",function():void
         {
            var _loc1_:* = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/namebg.swf");
            _loc1_.x = 250 - 5 - 2;
            _loc1_.y = 140 + 45 - 10 + 3;
            addChildAt(_loc1_,1);
            _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/namebg.swf");
            _loc1_.x = 500 - 5 - 2;
            _loc1_.y = 140 + 45 - 10 + 3;
            addChildAt(_loc1_,1);
            _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/namebg.swf");
            _loc1_.x = 85 - 5 - 2;
            _loc1_.y = 200 + 45 - 10 + 3;
            addChildAt(_loc1_,1);
            _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/namebg.swf");
            _loc1_.x = 665 - 5 - 2;
            _loc1_.y = 200 + 45 - 10 + 3;
            addChildAt(_loc1_,1);
         });
         this.xuWei1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/xuweiyidai.swf");
         this.xuWei1.x = 385;
         this.xuWei1.y = 125;
         addChild(this.xuWei1);
         this.xuWei2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/xuweiyidai.swf");
         this.xuWei2.x = 265;
         this.xuWei2.y = 185;
         addChild(this.xuWei2);
         this.xuWei3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/xuweiyidai.swf");
         this.xuWei3.x = 510;
         this.xuWei3.y = 185;
         addChild(this.xuWei3);
         this.xuWei4 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/xuweiyidai.swf");
         this.xuWei4.x = 95;
         this.xuWei4.y = 245;
         addChild(this.xuWei4);
         this.xuWei5 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/xuweiyidai.swf");
         this.xuWei5.x = 680;
         this.xuWei5.y = 245;
         addChild(this.xuWei5);
         this.paiming = new FTextArea();
         this.paiming.multiline = true;
         this.paiming.filters = StaticValue.filter;
         this.paiming.width = 200;
         this.paiming.height = 110;
         this.paiming.x = 52;
         this.paiming.y = 30;
         addChild(this.paiming);
         this.paiming.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("我的排名") + "<br>" + LanResManager.getLanCommonTextWords("我的积分") + "</font>";
         this.paihangBtn = new SecondButton();
         addChild(this.paihangBtn);
         this.paihangBtn.x = 52;
         this.paihangBtn.y = 100;
         this.paihangBtn.label = LanResManager.getLanCommonTextWords("排行榜");
         this.paihangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.bisai = new FTextArea();
         this.bisai.multiline = true;
         this.bisai.filters = StaticValue.filter;
         this.bisai.width = 200;
         this.bisai.height = 110;
         this.bisai.x = 710;
         this.bisai.y = 30;
         addChild(this.bisai);
         this.bisai.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("比赛场次") + "<br>" + LanResManager.getLanCommonTextWords("胜利场次") + "<br>" + LanResManager.getLanCommonTextWords("我的胜率") + "</font>";
         tfalign = new TextFormat();
         tfalign.align = "center";
         this.name1 = new FTextArea();
         this.name1.multiline = true;
         this.name1.filters = StaticValue.filter;
         this.name1.width = 200;
         this.name1.height = 110;
         this.name1.defaultTextFormat = tfalign;
         this.name1.x = 325;
         this.name1.y = 120;
         addChild(this.name1);
         this.name2 = new FTextArea();
         this.name2.multiline = true;
         this.name2.filters = StaticValue.filter;
         this.name2.width = 200;
         this.name2.height = 110;
         this.name2.x = 260 - 65;
         this.name2.y = 180;
         this.name2.defaultTextFormat = tfalign;
         addChild(this.name2);
         this.name3 = new FTextArea();
         this.name3.multiline = true;
         this.name3.filters = StaticValue.filter;
         this.name3.width = 200;
         this.name3.height = 110;
         this.name3.x = 510 - 65;
         this.name3.y = 180;
         this.name3.defaultTextFormat = tfalign;
         addChild(this.name3);
         this.name4 = new FTextArea();
         this.name4.multiline = true;
         this.name4.filters = StaticValue.filter;
         this.name4.width = 200;
         this.name4.height = 110;
         this.name4.x = 100 - 65;
         this.name4.y = 240;
         this.name4.defaultTextFormat = tfalign;
         addChild(this.name4);
         this.name5 = new FTextArea();
         this.name5.multiline = true;
         this.name5.filters = StaticValue.filter;
         this.name5.width = 200;
         this.name5.height = 110;
         this.name5.x = 680 - 65;
         this.name5.y = 240;
         this.name5.defaultTextFormat = tfalign;
         addChild(this.name5);
         this.wanfaBtn = new SecondButton();
         addChild(this.wanfaBtn);
         this.wanfaBtn.x = 710;
         this.wanfaBtn.y = 100;
         this.wanfaBtn.label = LanResManager.getLanCommonTextWords("玩法说明");
         this.wanfaBtn.addEventListener(MouseEvent.CLICK,this.onShuoMingClick);
         this.baoguoBtn = new SecondButton();
         this.baoguoBtn.x = 710;
         this.baoguoBtn.y = 130;
         this.baoguoBtn.label = LanResManager.getLanCommonTextWords("跨服包裹");
         this.baoguoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.timeFta = new FTextArea();
         this.timeFta.filters = StaticValue.filter;
         this.timeFta.width = 200;
         this.timeFta.x = 365 + 20;
         this.timeFta.y = 378 - 20;
         this.timeFta.visible = false;
         addChild(this.timeFta);
         this.baoMingBtn = new NewSkinButton();
         this.baoMingBtn.skin = "qianWangZhanDouBtn";
         this.baoMingBtn.x = 365;
         this.baoMingBtn.y = 378;
         addChild(this.baoMingBtn);
         this.baoMingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.queXiaoBtn = new FSimpleButton();
         this.queXiaoBtn.x = 365;
         this.queXiaoBtn.y = 378;
         this.queXiaoBtn.skin = "woHuCangLongqQuXiaoButton";
         addChild(this.queXiaoBtn);
         this.queXiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingquBtn = new SecondButton();
         addChild(this.lingquBtn);
         this.lingquBtn.x = 680;
         this.lingquBtn.y = 410;
         this.lingquBtn.label = LanResManager.getLanCommonTextWords("领取奖励");
         this.lingquBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shangchengBtn = new SecondButton();
         addChild(this.shangchengBtn);
         this.shangchengBtn.x = 750;
         this.shangchengBtn.y = 410;
         this.shangchengBtn.label = LanResManager.getLanCommonTextWords("积分商城");
         this.shangchengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         spr = new Sprite();
         spr.x = 2;
         spr.y = 2;
         addChild(spr);
         this._playerAvatar1 = new Bitmap();
         spr.addChild(this._playerAvatar1);
         this._playerAvatar2 = new Bitmap();
         spr.addChild(this._playerAvatar2);
         this._playerAvatar3 = new Bitmap();
         spr.addChild(this._playerAvatar3);
         this._playerAvatar4 = new Bitmap();
         spr.addChild(this._playerAvatar4);
         this._playerAvatar0 = new Bitmap();
         spr.addChild(this._playerAvatar0);
         this.shuoMingPanel = new TunShiTianDiShuoMingPanel();
      }
      
      public function onClose(param1:* = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
         this.clearAvatar();
         if(Boolean(!this.isWaiting) && Boolean(this.timer) && this.timer.running)
         {
            this.timer.stop();
            this.timerCount = 0;
         }
      }
      
      private function onShuoMingClick(param1:MouseEvent) : void
      {
         if(Boolean(this.shuoMingPanel) && Boolean(this.shuoMingPanel.parent))
         {
            if(this.shuoMingPanel.parent)
            {
               this.shuoMingPanel.parent.removeChild(this.shuoMingPanel);
            }
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.shuoMingPanel);
            this.shuoMingPanel.x = (GameConfig.sceneWidth - this.shuoMingPanel.width) / 2;
            this.shuoMingPanel.y = (GameConfig.sceneHeight - this.shuoMingPanel.height) / 2;
         }
      }
      
      public function showShuoMing(param1:Boolean) : void
      {
         if(param1)
         {
            this.shuoMingPanel.x = (GameConfig.sceneWidth - this.shuoMingPanel.width) / 2;
            this.shuoMingPanel.y = (GameConfig.sceneHeight - this.shuoMingPanel.height) / 2;
            GameInstance.uiInstance.uiContainer.addChild(this.shuoMingPanel);
         }
         else if(Boolean(this.shuoMingPanel) && Boolean(this.shuoMingPanel.parent))
         {
            this.shuoMingPanel.parent.removeChild(this.shuoMingPanel);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.paihangBtn:
               this.dispatchEvent(new BaseEvent(TUNSHITIANDI_PAIHANG_CLICK));
               break;
            case this.baoMingBtn:
               this.dispatchEvent(new BaseEvent(TUNSHITIANDI_PIPEI_CLICK));
               break;
            case this.queXiaoBtn:
               this.dispatchEvent(new BaseEvent(TUNSHITIANDI_QUXIAO_CLICK));
               break;
            case this.baoguoBtn:
               this.dispatchEvent(new BaseEvent(TUNSHITIANDI_KUAFUBAOGUO_CLICK));
               break;
            case this.lingquBtn:
               this.dispatchEvent(new BaseEvent(TUNSHITIANDI_LINGQUJIANGLI_CLICK));
               break;
            case this.shangchengBtn:
               this.dispatchEvent(new BaseEvent(TUNSHITIANDI_JIFENSHANGCHENG_CLICK));
         }
      }
      
      public function setPaihangbangList(param1:int, param2:int, param3:Array, param4:int) : void
      {
         if(!this.paihangbang)
         {
            this.paihangbang = new TunShiTianDi_PaiHangBang();
            this.paihangbang._$parent = this;
            this.paihangbang.x = (GameConfig.sceneWidth - this.paihangbang.width) / 2;
            this.paihangbang.y = (GameConfig.sceneHeight - this.paihangbang.height) / 2;
         }
         GameInstance.uiInstance.uiContainer.addChild(this.paihangbang);
         this.paihangbang.setInitialize(param1,param2,param3,param4);
      }
      
      public function setinitilizeUI(param1:TunShiTianDiVo) : void
      {
         this.setWodexinxi(param1);
         this.setPipei(param1.isWaiting);
         this.setPlayer(param1.playerArr);
      }
      
      public function setWodexinxi(param1:TunShiTianDiVo) : void
      {
         this.paiming.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("我的排名：") + param1.paiMing + "<br>" + LanResManager.getLanCommonTextWords("我的积分：") + param1.jiFen + "</font>";
         this.bisai.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("比武场次：") + param1.sumCount + "<br>" + LanResManager.getLanCommonTextWords("胜利场次：") + param1.winCount + "<br>" + LanResManager.getLanCommonTextWords("我的胜率：") + (param1.sumCount == 0 ? 0 : int(param1.winCount / param1.sumCount * 100)) + "%</font>";
      }
      
      public function setPipei(param1:Boolean) : void
      {
         this.baoMingBtn.visible = !param1;
         this.queXiaoBtn.visible = param1;
         this.isWaiting = param1;
         this.timeFta.visible = this.isWaiting;
         this.timeFta.htmlText = "";
         if(this.isWaiting)
         {
            if(this.timer == null)
            {
               this.timer = new Timer(1000);
               this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
               this.timer.start();
               this.timerCount = 0;
            }
            else if(!this.timer.running)
            {
               this.timer.reset();
               this.timer.start();
               this.timerCount = 0;
            }
         }
         else
         {
            this.timerCount = 0;
            if(this.timer)
            {
               this.timer.stop();
            }
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         ++this.timerCount;
         this.timeFta.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("已等待：") + (this.timerCount >= 60 ? Math.floor(this.timerCount / 60) + LanResManager.getLanCommonTextWords("分") : "") + this.timerCount % 60 + LanResManager.getLanCommonTextWords("秒") + "</font>";
      }
      
      public function setPlayer(param1:Array) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            this["name" + (_loc2_ + 1)].htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + param1[_loc2_].name + "<br>" + LanResManager.getLanCommonTextWords("弟子") + " " + param1[_loc2_].diZhiName + "[" + OtherConst.getPingTaiById(parseInt(param1[_loc2_].pingTai)) + "]" + "</font>";
            this["xuWei" + (_loc2_ + 1)].visible = false;
            _loc2_++;
         }
         _loc2_ = int(param1.length);
         while(_loc2_ < 5)
         {
            this["xuWei" + (_loc2_ + 1)].visible = true;
            _loc2_++;
         }
      }
      
      public function setAvatar(param1:int, param2:BitmapData, param3:Boolean = false) : void
      {
         this["_playerAvatar" + param1].bitmapData = param2;
         switch(param1)
         {
            case 0:
               this["_playerAvatar" + param1].x = 390 + 30 - this["_playerAvatar" + param1].width / 2;
               this["_playerAvatar" + param1].y = 200 + 20 - this["_playerAvatar" + param1].height / 2;
               break;
            case 1:
               this["_playerAvatar" + param1].x = 260 + 40 - this["_playerAvatar" + param1].width / 2;
               this["_playerAvatar" + param1].y = 265 + 15 - this["_playerAvatar" + param1].height / 2;
               break;
            case 2:
               this["_playerAvatar" + param1].x = 515 + 30 - this["_playerAvatar" + param1].width / 2;
               this["_playerAvatar" + param1].y = 265 + 15 - this["_playerAvatar" + param1].height / 2;
               break;
            case 3:
               this["_playerAvatar" + param1].x = 115 + 15 - this["_playerAvatar" + param1].width / 2;
               this["_playerAvatar" + param1].y = 300 + 50 - this["_playerAvatar" + param1].height / 2;
               break;
            case 4:
               this["_playerAvatar" + param1].x = 650 + 50 + 15 - this["_playerAvatar" + param1].width / 2;
               this["_playerAvatar" + param1].y = 300 + 50 - this["_playerAvatar" + param1].height / 2;
         }
      }
      
      public function clearAvatar() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 5)
         {
            this["_playerAvatar" + _loc1_].bitmapData = null;
            _loc1_++;
         }
      }
   }
}

