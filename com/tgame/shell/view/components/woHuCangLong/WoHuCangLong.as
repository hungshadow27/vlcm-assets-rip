package com.tgame.shell.view.components.woHuCangLong
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.WoHuCangLong.view.info.WoHuCangLongVo;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   
   public class WoHuCangLong extends FPanel
   {
      
      public static const SHOW_WOHUCANGLONG:String = "SHOW_WOHUCANGLONG";
      
      public static const WOHUCANGLONG_TOUXIAN_CLICK:String = "WOHUCANGLONG_TOUXIAN_CLICK";
      
      public static const WOHUCANGLONG_PAIHANG_CLICK:String = "WOHUCANGLONG_PAIHANG_CLICK";
      
      public static const WOHUCANGLONG_PIPEI_CLICK:String = "WOHUCANGLONG_PIPEI_CLICK";
      
      public static const WOHUCANGLONG_QUXIAO_CLICK:String = "WOHUCANGLONG_QUXIAO_CLICK";
      
      public static const WOHUCANGLONG_SHENGJIJINENG_CLICK:String = "WOHUCANGLONG_SHENGJIJINENG_CLICK";
      
      public static const WOHUCANGLONG_PAIHANGBANG_FANYE_CLICK:String = "WOHUCANGLONG_PAIHANGBANG_FANYE_CLICK";
      
      public static const WOHUCANGLONG_BAOGUO_CLICK:String = "WOHUCANGLONG_BAOGUO_CLICK";
      
      public static const WOHUCANGLONG_SHOP_CLICK:String = "WOHUCANGLONG_SHOP_CLICK";
      
      private var tz:Sprite;
      
      private var bg:DisplayObject;
      
      private var wodexinxi:FTextArea;
      
      private var zhandouxinxi:FTextArea;
      
      private var touxianBtn:SecondButton;
      
      private var paihangBtn:SecondButton;
      
      private var wanfaBtn:SecondButton;
      
      private var skillBtn1:FSimpleButton;
      
      private var skillBtn2:FSimpleButton;
      
      private var kuaFuBaoGuoBtn:SecondButton;
      
      private var shopBtn:SecondButton;
      
      private var kuang1:Bitmap;
      
      private var jinengSpr1:Sprite;
      
      private var jinengSpr2:Sprite;
      
      private var name1:FTextArea;
      
      private var name2:FTextArea;
      
      private var name3:FTextArea;
      
      private var name4:FTextArea;
      
      private var name5:FTextArea;
      
      private var wohucanglongTouxian:WoHuCangLong_TouXian;
      
      private var wohucanglongPaihangbang:WoHuCangLong_PaiHangBang;
      
      private var _playerAvatar1:Bitmap;
      
      private var _playerAvatar2:Bitmap;
      
      private var _playerAvatar3:Bitmap;
      
      private var _playerAvatar4:Bitmap;
      
      private var _playerAvatar0:Bitmap;
      
      private var skillId1:int;
      
      private var skillId2:int;
      
      private var shuoMingImg:DisplayObject;
      
      private var queXiaoBtn:FSimpleButton;
      
      private var baoMingBtn:FSimpleButton;
      
      private var timer:Timer;
      
      private var timeFta:FTextArea;
      
      private var timerCount:int = 0;
      
      private var isWaiting:Boolean;
      
      public function WoHuCangLong()
      {
         var tfalign:TextFormat;
         super();
         titleText = LanResManager.getLanCommonTextWords("卧虎藏龙");
         dragAble = true;
         this.showCloseButton = true;
         width = 850;
         height = 490;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/bg.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/1.swf");
         this.bg.x = 375;
         this.bg.y = 80;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/2.swf");
         this.bg.x = 250;
         this.bg.y = 140;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/3.swf");
         this.bg.x = 500;
         this.bg.y = 140;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/4.swf");
         this.bg.x = 85;
         this.bg.y = 200;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/5.swf");
         this.bg.x = 665;
         this.bg.y = 200;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/nameBg.swf");
         this.bg.x = 370;
         this.bg.y = 115;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/nameBg.swf",function():void
         {
            var _loc1_:* = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/nameBg.swf");
            _loc1_.x = 250 - 5;
            _loc1_.y = 140 + 45 - 10;
            addChildAt(_loc1_,1);
            _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/nameBg.swf");
            _loc1_.x = 500 - 5;
            _loc1_.y = 140 + 45 - 10;
            addChildAt(_loc1_,1);
            _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/nameBg.swf");
            _loc1_.x = 85 - 5;
            _loc1_.y = 200 + 45 - 10;
            addChildAt(_loc1_,1);
            _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/nameBg.swf");
            _loc1_.x = 665 - 5;
            _loc1_.y = 200 + 45 - 10;
            addChildAt(_loc1_,1);
         });
         this.wodexinxi = new FTextArea();
         this.wodexinxi.multiline = true;
         this.wodexinxi.filters = StaticValue.filter;
         this.wodexinxi.width = 200;
         this.wodexinxi.height = 110;
         this.wodexinxi.x = 30;
         this.wodexinxi.y = 30;
         addChild(this.wodexinxi);
         this.zhandouxinxi = new FTextArea();
         this.zhandouxinxi.multiline = true;
         this.zhandouxinxi.filters = StaticValue.filter;
         this.zhandouxinxi.width = 200;
         this.zhandouxinxi.height = 110;
         this.zhandouxinxi.x = 710;
         this.zhandouxinxi.y = 30;
         addChild(this.zhandouxinxi);
         this.touxianBtn = new SecondButton();
         addChild(this.touxianBtn);
         this.touxianBtn.x = 30;
         this.touxianBtn.y = 120;
         this.touxianBtn.label = LanResManager.getLanCommonTextWords("头衔");
         this.touxianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.paihangBtn = new SecondButton();
         addChild(this.paihangBtn);
         this.paihangBtn.x = 80;
         this.paihangBtn.y = 120;
         this.paihangBtn.label = LanResManager.getLanCommonTextWords("排行");
         this.paihangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.wanfaBtn = new SecondButton();
         addChild(this.wanfaBtn);
         this.wanfaBtn.x = 710;
         this.wanfaBtn.y = 120 - 35;
         this.wanfaBtn.label = LanResManager.getLanCommonTextWords("玩法说明");
         this.wanfaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shuoMingImg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/shuoMing.swf");
         this.shuoMingImg.x = 850;
         this.shuoMingImg.y = 0;
         this.shuoMingImg.visible = false;
         addChild(this.shuoMingImg);
         this.kuaFuBaoGuoBtn = new SecondButton();
         addChild(this.kuaFuBaoGuoBtn);
         this.kuaFuBaoGuoBtn.x = 710;
         this.kuaFuBaoGuoBtn.y = 120 - 5;
         this.kuaFuBaoGuoBtn.label = LanResManager.getLanCommonTextWords("跨服包裹");
         this.kuaFuBaoGuoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shopBtn = new SecondButton();
         this.shopBtn.x = 710;
         this.shopBtn.y = 120 - 5 + 30;
         this.shopBtn.label = LanResManager.getLanCommonTextWords("功勋商店");
         this.shopBtn.addEventListener(MouseEvent.CLICK,this.onClick);
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
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/skillBg.swf",function():void
         {
            var _loc1_:* = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/skillBg.swf");
            _loc1_.x = 493;
            _loc1_.y = 358;
            addChildAt(_loc1_,1);
         });
         this.bg.x = 273;
         this.bg.y = 358;
         addChild(this.bg);
         this.skillBtn1 = new FSimpleButton();
         this.skillBtn1.skin = "sumButton";
         this.skillBtn1.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("升级技能1") + "</font></textformat>";
         addChild(this.skillBtn1);
         this.skillBtn1.x = 335;
         this.skillBtn1.y = 375;
         this.skillBtn1.visible = false;
         this.skillBtn1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.skillBtn2 = new FSimpleButton();
         this.skillBtn2.skin = "sumButton";
         this.skillBtn2.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("升级技能2") + "</font></textformat>";
         addChild(this.skillBtn2);
         this.skillBtn2.x = 555;
         this.skillBtn2.y = 375;
         this.skillBtn2.visible = false;
         this.skillBtn2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.timeFta = new FTextArea();
         this.timeFta.filters = StaticValue.filter;
         this.timeFta.width = 200;
         this.timeFta.x = 365 + 20;
         this.timeFta.y = 378 - 20;
         this.timeFta.visible = false;
         addChild(this.timeFta);
         this.baoMingBtn = new FSimpleButton();
         this.baoMingBtn.skin = "woHuCangLongBaoMingButton";
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
         this._playerAvatar1 = new Bitmap();
         addChild(this._playerAvatar1);
         this._playerAvatar2 = new Bitmap();
         addChild(this._playerAvatar2);
         this._playerAvatar3 = new Bitmap();
         addChild(this._playerAvatar3);
         this._playerAvatar4 = new Bitmap();
         addChild(this._playerAvatar4);
         this._playerAvatar0 = new Bitmap();
         addChild(this._playerAvatar0);
         this.jinengSpr1 = new Sprite();
         this.jinengSpr1.x = 300;
         this.jinengSpr1.y = 380;
         addChild(this.jinengSpr1);
         this.jinengSpr2 = new Sprite();
         this.jinengSpr2.x = 520;
         this.jinengSpr2.y = 380;
         addChild(this.jinengSpr2);
      }
      
      public function onClose(param1:* = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
         this.showShuoMing(false);
         this.clearAvatar();
         if(Boolean(!this.isWaiting) && Boolean(this.timer) && this.timer.running)
         {
            this.timer.stop();
            this.timerCount = 0;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.touxianBtn:
               this.dispatchEvent(new BaseEvent(WOHUCANGLONG_TOUXIAN_CLICK));
               break;
            case this.paihangBtn:
               this.dispatchEvent(new BaseEvent(WOHUCANGLONG_PAIHANG_CLICK));
               break;
            case this.skillBtn1:
               this.dispatchEvent(new BaseEvent(WOHUCANGLONG_SHENGJIJINENG_CLICK,"",this.skillId1));
               break;
            case this.skillBtn2:
               this.dispatchEvent(new BaseEvent(WOHUCANGLONG_SHENGJIJINENG_CLICK,"",this.skillId2));
               break;
            case this.baoMingBtn:
               this.dispatchEvent(new BaseEvent(WOHUCANGLONG_PIPEI_CLICK));
               break;
            case this.queXiaoBtn:
               this.dispatchEvent(new BaseEvent(WOHUCANGLONG_QUXIAO_CLICK));
               break;
            case this.wanfaBtn:
               this.shuoMingImg.visible = !this.shuoMingImg.visible;
               break;
            case this.kuaFuBaoGuoBtn:
               this.dispatchEvent(new BaseEvent(WOHUCANGLONG_BAOGUO_CLICK));
               break;
            case this.shopBtn:
               this.dispatchEvent(new BaseEvent(WOHUCANGLONG_SHOP_CLICK));
         }
      }
      
      public function showShuoMing(param1:Boolean) : void
      {
         this.shuoMingImg.visible = param1;
      }
      
      public function setinitilizeUI(param1:WoHuCangLongVo) : void
      {
         this.setWodexinxi(param1);
         this.setSkill(param1.haveSkill1,param1.skillId1,param1.skillLevel1,param1.skillNeed1,param1.haveSkill2,param1.skillId2,param1.skillLevel2,param1.skillNeed2);
         this.setPipei(param1.isWaiting);
         this.setPlayer(param1.playerArr);
      }
      
      public function setPlayer(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this["name" + (_loc2_ + 1)].htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + param1[_loc2_].name + "<br>" + "[" + OtherConst.getPingTaiById(parseInt(param1[_loc2_].pingTai)) + "]" + "</font>";
            _loc2_++;
         }
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
      
      public function setWodexinxi(param1:WoHuCangLongVo) : void
      {
         this.wodexinxi.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("我的头衔：") + param1.touXian + "<br>" + LanResManager.getLanCommonTextWords("我的排名：") + param1.paiMing + "<br>" + LanResManager.getLanCommonTextWords("我的威望：") + param1.weiWang + "<br>" + LanResManager.getLanCommonTextWords("我的胜率：") + param1.shengLv + "%" + "<br>" + LanResManager.getLanCommonTextWords("我的功勋：") + param1.gongXun + "</font>";
         this.zhandouxinxi.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("胜利场次：") + param1.winCount + "<br>" + LanResManager.getLanCommonTextWords("比武场次：") + param1.sumCount + "<br>" + LanResManager.getLanCommonTextWords("额外奖励：") + (param1.sumJiangLiCount - param1.jiangLiCount) + "/" + param1.sumJiangLiCount + "</font>";
      }
      
      public function setSkill(param1:Boolean, param2:int, param3:int, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
      {
         var _loc10_:ItemFace = null;
         var _loc12_:ItemFace = null;
         this.skillId1 = param2;
         this.skillId2 = param6;
         while(this.jinengSpr1.numChildren > 0)
         {
            this.jinengSpr1.removeChildAt(0);
         }
         while(this.jinengSpr2.numChildren > 0)
         {
            this.jinengSpr2.removeChildAt(0);
         }
         var _loc9_:Skill = new Skill(param2);
         _loc9_.level = param3;
         _loc9_.isLearn = param1 ? 1 : 0;
         _loc10_ = new ItemFace(_loc9_);
         _loc10_.showKungFuTag();
         _loc10_.setShowCount(param1);
         this.jinengSpr1.addChild(_loc10_);
         var _loc11_:Skill = new Skill(param6);
         _loc11_.level = param7;
         _loc11_.isLearn = param5 ? 1 : 0;
         _loc12_ = new ItemFace(_loc11_);
         _loc12_.showKungFuTag();
         _loc12_.setShowCount(param5);
         this.jinengSpr2.addChild(_loc12_);
         this.skillBtn1.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("技能等级：") + param3 + "<br>" + LanResManager.getLanCommonTextWords("升级消耗功勋：") + param4 + "</font></textformat>";
         this.skillBtn2.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("技能等级：") + param7 + "<br>" + LanResManager.getLanCommonTextWords("升级消耗功勋：") + param8 + "</font></textformat>";
         if(param1)
         {
            this.jinengSpr1.addEventListener(MouseEvent.CLICK,this.onSkillClick);
         }
         else if(this.jinengSpr1.hasEventListener(MouseEvent.CLICK))
         {
            this.jinengSpr1.removeEventListener(MouseEvent.CLICK,this.onSkillClick);
         }
         if(param5)
         {
            this.jinengSpr2.addEventListener(MouseEvent.CLICK,this.onSkillClick);
         }
         else if(this.jinengSpr2.hasEventListener(MouseEvent.CLICK))
         {
            this.jinengSpr2.removeEventListener(MouseEvent.CLICK,this.onSkillClick);
         }
      }
      
      private function onSkillClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.jinengSpr1:
               this.skillBtn1.visible = !this.skillBtn1.visible;
               break;
            case this.jinengSpr2:
               this.skillBtn2.visible = !this.skillBtn2.visible;
         }
      }
      
      public function setTouxianList(param1:Array, param2:String, param3:String, param4:int, param5:int) : void
      {
         if(!this.wohucanglongTouxian)
         {
            this.wohucanglongTouxian = new WoHuCangLong_TouXian();
         }
         this.wohucanglongTouxian.x = (GameConfig.sceneWidth - this.wohucanglongTouxian.width) / 2;
         this.wohucanglongTouxian.y = (GameConfig.sceneHeight - this.wohucanglongTouxian.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.wohucanglongTouxian);
         this.wohucanglongTouxian.setInitialize(param1,param2,param3,param4,param5);
      }
      
      public function setPaihangbangList(param1:int, param2:int, param3:Array, param4:int) : void
      {
         if(!this.wohucanglongPaihangbang)
         {
            this.wohucanglongPaihangbang = new WoHuCangLong_PaiHangBang();
            this.wohucanglongPaihangbang._$parent = this;
            this.wohucanglongPaihangbang.x = (GameConfig.sceneWidth - this.wohucanglongPaihangbang.width) / 2;
            this.wohucanglongPaihangbang.y = (GameConfig.sceneHeight - this.wohucanglongPaihangbang.height) / 2;
         }
         GameInstance.uiInstance.uiContainer.addChild(this.wohucanglongPaihangbang);
         this.wohucanglongPaihangbang.setInitialize(param1,param2,param3,param4);
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

