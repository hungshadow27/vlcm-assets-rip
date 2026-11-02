package com.tgame.shell.view.components.shengxiaotiaozhan
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import gs.TweenMax;
   
   public class ShengXiaoTiaoZhanPanel extends FPanel
   {
      
      public static const UI_SHENGXIAOTIAOZHAN_CENGSHU_CLICK:String = "UI_SHENGXIAOTIAOZHAN_CENGSHU_CLICK";
      
      public static const UI_SHENGXIAOTIAOZHAN_KAISHITIAOZHANTIP_CLICK:String = "UI_SHENGXIAOTIAOZHAN_KAISHITIAOZHANTIP_CLICK";
      
      public static const UI_SHENGXIAOTIAOZHAN_KAISHI_CLICK:String = "UI_SHENGXIAOTIAOZHAN_KAISHI_CLICK";
      
      public static const UI_SHENGXIAOTIAOZHAN_LINGQU_CLICK:String = "UI_SHENGXIAOTIAOZHAN_LINGQU_CLICK";
      
      public static const UI_SHENGXIAOTIAOZHAN_FANYE_CLICK:String = "UI_SHENGXIAOTIAOZHAN_FANYE_CLICK";
      
      private var bg:DisplayObject;
      
      private var btn1:FSimpleButton;
      
      private var btn2:FSimpleButton;
      
      private var btn3:FSimpleButton;
      
      private var btn4:FSimpleButton;
      
      private var btn5:FSimpleButton;
      
      private var btnStart:SecondButton;
      
      private var btnGet:SecondButton;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var ft:FTextArea;
      
      private var ftRankName:FTextArea;
      
      private var ftRankTime:FTextArea;
      
      private var ftCount:FTextArea;
      
      private var ftOver:FTextArea;
      
      private var sprGo:Sprite;
      
      private var spr1:Sprite;
      
      private var spr2:Sprite;
      
      private var spr3:Sprite;
      
      private var spr4:Sprite;
      
      private var spr5:Sprite;
      
      private var state1:Sprite;
      
      private var state2:Sprite;
      
      private var state3:Sprite;
      
      private var state4:Sprite;
      
      private var state5:Sprite;
      
      private var btnStateArr:Array = [];
      
      private var btnLVState:Array = [];
      
      private var now:Sprite;
      
      private var nowDJ:int = -1;
      
      private var lingjiangID:int = -1;
      
      private var jiangliSpr:Sprite;
      
      private var jiangliSpr1:Sprite;
      
      private var jiangliSpr2:Sprite;
      
      private var jiangliArr1:Array = [1347,42363,371490,42351,42352];
      
      private var jiangliArr2:Array = [42353,42354,42355,371490,42352];
      
      private var x1:int = 0;
      
      private var xx1:int = 0;
      
      private var x2:int = 0;
      
      private var xx2:int = 0;
      
      private var timer:Timer;
      
      public function ShengXiaoTiaoZhanPanel()
      {
         super();
         this.titleText = LanResManager.getLanCommonTextWords("十二生肖");
         this.showCloseButton = true;
         this.skin = "panel_btn";
         this.dragAble = true;
         width = 640;
         height = 470;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            if(this.timer.running)
            {
               this.timer.reset();
               this.timer.stop();
            }
            parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var bit:Bitmap;
         var $mask1:Sprite;
         var $mask2:Sprite;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shiershengxiao/bg.swf");
         this.bg.x = 8;
         this.bg.y = 2;
         addChild(this.bg);
         this.btn1 = new FSimpleButton();
         this.btn1.skin = "shengxiaoliang_Button";
         addChild(this.btn1);
         this.btn1.name = "1";
         this.btn1.x = 75;
         this.btn1.y = 175;
         this.btn1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn2 = new FSimpleButton();
         this.btn2.skin = "shengxiaoliang_Button";
         addChild(this.btn2);
         this.btn1.name = "2";
         this.btn2.x = 250;
         this.btn2.y = 130;
         this.btn2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn3 = new FSimpleButton();
         this.btn3.skin = "shengxiaoliang_Button";
         addChild(this.btn3);
         this.btn1.name = "3";
         this.btn3.x = 270;
         this.btn3.y = 20;
         this.btn3.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn4 = new FSimpleButton();
         this.btn4.skin = "shengxiaoliang_Button";
         addChild(this.btn4);
         this.btn1.name = "4";
         this.btn4.x = 190;
         this.btn4.y = 65;
         this.btn4.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn5 = new FSimpleButton();
         this.btn5.skin = "shengxiaoliang_Button";
         addChild(this.btn5);
         this.btn1.name = "5";
         this.btn5.x = 55;
         this.btn5.y = 15;
         this.btn5.addEventListener(MouseEvent.CLICK,this.onClick);
         this.spr1 = new Sprite();
         this.spr1.x = 72;
         this.spr1.y = 175 + 80;
         addChild(this.spr1);
         this.spr2 = new Sprite();
         this.spr2.x = 250;
         this.spr2.y = 130 + 80;
         addChild(this.spr2);
         this.spr3 = new Sprite();
         this.spr3.x = 268;
         this.spr3.y = 20 + 80;
         addChild(this.spr3);
         this.spr4 = new Sprite();
         this.spr4.x = 188;
         this.spr4.y = 65 + 80;
         addChild(this.spr4);
         this.spr5 = new Sprite();
         this.spr5.x = 52;
         this.spr5.y = 15 + 80;
         addChild(this.spr5);
         this.state1 = new Sprite();
         this.state1.x = 72;
         this.state1.y = 175 + 25;
         addChild(this.state1);
         this.state2 = new Sprite();
         this.state2.x = 250;
         this.state2.y = 130 + 25;
         addChild(this.state2);
         this.state3 = new Sprite();
         this.state3.x = 268;
         this.state3.y = 20 + 25;
         addChild(this.state3);
         this.state4 = new Sprite();
         this.state4.x = 188;
         this.state4.y = 65 + 25;
         addChild(this.state4);
         this.state5 = new Sprite();
         this.state5.x = 52;
         this.state5.y = 15 + 25;
         addChild(this.state5);
         this.now = new Sprite();
         addChild(this.now);
         bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.jiangliSpr1 = new Sprite();
         addChild(this.jiangliSpr1);
         this.jiangliSpr1.x = 75;
         this.jiangliSpr1.y = 344;
         with(this.jiangliSpr1.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,180,45);
            endFill();
         }
         $mask1 = new Sprite();
         $mask1.mouseEnabled = false;
         addChild($mask1);
         $mask1.x = 75;
         $mask1.y = 344;
         with($mask1.graphics)
         {
            beginFill(16750866,0);
            drawRect(0,0,180,40);
            endFill();
         }
         this.jiangliSpr1.mask = $mask1;
         this.jiangliSpr2 = new Sprite();
         addChild(this.jiangliSpr2);
         this.jiangliSpr2.visible = false;
         this.jiangliSpr2.x = 75 + 180 + 45;
         this.jiangliSpr2.y = 344;
         with(this.jiangliSpr2.graphics)
         {
            beginFill(65280,0);
            drawRect(0,0,180,45);
            endFill();
         }
         $mask2 = new Sprite();
         $mask2.mouseEnabled = false;
         addChild($mask2);
         $mask2.x = 75;
         $mask2.y = 344;
         with($mask2.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,180,40);
            endFill();
         }
         this.jiangliSpr2.mask = $mask2;
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "QiShangQuanPreviousButton";
         addChild(this.previousButton);
         this.previousButton.x = 20;
         this.previousButton.y = 155;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "QiShangQuanNextButton";
         addChild(this.nextButton);
         this.nextButton.x = 315;
         this.nextButton.y = 155;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft = new FTextArea();
         this.ft.x = 350;
         this.ft.y = 30;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>    " + LanResManager.getLanCommonTextWords("十二生肖副本是新增挑战副本；共20层，100个独立关卡。") + "<br>    " + LanResManager.getLanCommonTextWords("玩家挑战成功低级关卡才可以进行下一等级挑战，挑战成功可以获得丰厚奖励；若幸运进入生肖副本则奖励翻本。") + "<br>    " + LanResManager.getLanCommonTextWords("挑战需要消耗十二生肖副本令，每日可挑战5次。") + "<br>    " + LanResManager.getLanCommonTextWords("关卡挑战成功后，可以在面板处领取奖励。重复挑战可重复领取奖励。") + "</font><br><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("注：奖励不累计，挑战成功后，请及时领取。") + "</font>";
         this.ft.width = 270;
         this.ft.height = 160;
         this.ft.wordWrap = true;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 360;
         this.ft.y = 215;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("排名") + "</font>";
         this.ft.width = 40;
         this.ft.height = 20;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 440;
         this.ft.y = 215;
         this.ft.width = 80;
         this.ft.height = 20;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家名称") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 535;
         this.ft.y = 215;
         this.ft.width = 100;
         this.ft.height = 20;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("最短挑战时间") + "</font>";
         addChild(this.ft);
         this.ftRankName = new FTextArea();
         this.ftRankName.x = 430;
         this.ftRankName.y = 245;
         this.ftRankName.width = 100;
         this.ftRankName.height = 90;
         this.ftRankName.htmlText = "";
         this.ftRankName.wordWrap = true;
         addChild(this.ftRankName);
         this.ftRankTime = new FTextArea();
         this.ftRankTime.x = 540;
         this.ftRankTime.y = 245;
         this.ftRankTime.width = 100;
         this.ftRankTime.height = 90;
         this.ftRankTime.htmlText = "";
         this.ftRankTime.wordWrap = true;
         addChild(this.ftRankTime);
         this.ft = new FTextArea();
         this.ft.x = 495;
         this.ft.y = 340;
         this.ft.width = 100;
         this.ft.height = 20;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("今日挑战次数：") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 495;
         this.ft.y = 365;
         this.ft.width = 100;
         this.ft.height = 20;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("通过层数：") + "</font>";
         addChild(this.ft);
         this.ftCount = new FTextArea();
         this.ftCount.x = 580;
         this.ftCount.y = 340;
         this.ftCount.width = 100;
         this.ftCount.height = 20;
         this.ftCount.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>1/5</font>";
         addChild(this.ftCount);
         this.ftOver = new FTextArea();
         this.ftOver.x = 560;
         this.ftOver.y = 365;
         this.ftOver.width = 100;
         this.ftOver.height = 20;
         this.ftOver.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>1/100</font>";
         addChild(this.ftOver);
         this.ft = new FTextArea();
         this.ft.x = 350;
         this.ft.y = 340;
         this.ft.width = 100;
         this.ft.height = 20;
         this.ft.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("通关奖励：") + "</font>";
         addChild(this.ft);
         bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         bit.x = 420;
         bit.y = 340;
         addChild(bit);
         this.sprGo = new Sprite();
         addChild(this.sprGo);
         this.btnStart = new SecondButton();
         this.btnStart.x = 430;
         this.btnStart.y = 405;
         this.btnStart.label = LanResManager.getLanCommonTextWords("开始挑战");
         this.btnStart.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnStart);
         this.btnGet = new SecondButton();
         this.btnGet.x = 515;
         this.btnGet.y = 405;
         this.btnGet.label = LanResManager.getLanCommonTextWords("领取奖励");
         this.btnGet.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnGet);
         this.initGO();
         this.timer = new Timer(3000,0);
         this.timer.start();
         this.timer.addEventListener(TimerEvent.TIMER,this.show);
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         GameInstance.stage.dispatchEvent(new BaseEvent(ItemFace.MOUSE_OVER,"",[param1.target,param1]));
         this.timer.stop();
         this.timer.reset();
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         GameInstance.stage.dispatchEvent(new BaseEvent(ItemFace.MOUSE_OUT,"",[param1.target,param1]));
         this.timer.start();
         this.timer.addEventListener(TimerEvent.TIMER,this.show);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc5_:FSimpleButton = null;
         var _loc6_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = "";
         if(param1.target == this.btn1 || param1.target == this.btn2 || param1.target == this.btn3 || param1.target == this.btn4 || param1.target == this.btn5)
         {
            _loc5_ = param1.target as FSimpleButton;
            while(this.now.numChildren > 0)
            {
               this.now.removeChildAt(0);
            }
            _loc6_ = _loc5_.name.split(",");
            _loc2_ = int(_loc6_[1]);
            _loc3_ = int(_loc6_[0]);
            this.setBtnSkin(this.nowDJ,this.btnLVState);
            if(this.btnStateArr[_loc2_] == 0)
            {
               this["btn" + _loc2_].skin = "shengxiaohuidd_Button";
            }
            else if(this.btnStateArr[_loc2_] == 1)
            {
               this["btn" + _loc2_].skin = "shengxiaoliangtgdd_Button";
            }
            else
            {
               this["btn" + _loc2_].skin = "shengxiaoliangdd_Button";
            }
            dispatchEvent(new BaseEvent(UI_SHENGXIAOTIAOZHAN_CENGSHU_CLICK,"",_loc3_));
         }
         switch(param1.target)
         {
            case this.btnStart:
               dispatchEvent(new BaseEvent(UI_SHENGXIAOTIAOZHAN_KAISHITIAOZHANTIP_CLICK,"",this.lingjiangID));
               break;
            case this.btnGet:
               dispatchEvent(new BaseEvent(UI_SHENGXIAOTIAOZHAN_LINGQU_CLICK,"",this.lingjiangID));
               break;
            case this.previousButton:
               dispatchEvent(new BaseEvent(UI_SHENGXIAOTIAOZHAN_FANYE_CLICK,"",1));
               break;
            case this.nextButton:
               dispatchEvent(new BaseEvent(UI_SHENGXIAOTIAOZHAN_FANYE_CLICK,"",2));
         }
      }
      
      private function initGO() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Goods = null;
         var _loc3_:Bitmap = null;
         var _loc4_:ItemFace = null;
         while(this.jiangliSpr1.numChildren > 0)
         {
            this.jiangliSpr1.removeChildAt(0);
         }
         while(this.jiangliSpr2.numChildren > 0)
         {
            this.jiangliSpr2.removeChildAt(0);
         }
         this.jiangliSpr2.x = 75 + 180 + 45;
         this.jiangliSpr1.x = 75;
         _loc1_ = 0;
         while(_loc1_ < 5)
         {
            _loc2_ = new Goods(this.jiangliArr1[_loc1_]);
            if(_loc2_ != null)
            {
               _loc3_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
               _loc3_.x = _loc1_ * 45;
               _loc3_.y = 0;
               this.jiangliSpr1.addChild(_loc3_);
               _loc4_ = new ItemFace(_loc2_);
               _loc4_.x = 2 + _loc1_ * 45;
               _loc4_.y = 2;
               _loc4_.showRedMask();
               this.jiangliSpr1.addChild(_loc4_);
               _loc4_.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
               _loc4_.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 5)
         {
            _loc2_ = new Goods(this.jiangliArr2[_loc1_]);
            if(_loc2_ != null)
            {
               _loc3_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
               _loc3_.x = _loc1_ * 45;
               _loc3_.y = 0;
               this.jiangliSpr2.addChild(_loc3_);
               _loc4_ = new ItemFace(_loc2_);
               _loc4_.x = 2 + _loc1_ * 45;
               _loc4_.y = 2;
               _loc4_.showRedMask();
               this.jiangliSpr2.addChild(_loc4_);
               _loc4_.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
               _loc4_.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
            }
            _loc1_++;
         }
      }
      
      private function show(param1:TimerEvent) : void
      {
         var _loc2_:int = int(this.jiangliSpr1.x);
         if(_loc2_ - 45 < -160)
         {
            this.jiangliSpr1.x = 300;
            _loc2_ = this.jiangliSpr1.x;
            TweenMax.to(this.jiangliSpr1,1,{"x":_loc2_ - 45});
         }
         else
         {
            TweenMax.to(this.jiangliSpr1,1,{"x":_loc2_ - 45});
         }
         var _loc3_:int = int(this.jiangliSpr2.x);
         if(_loc3_ - 45 < -160)
         {
            this.jiangliSpr2.x = 300;
            _loc3_ = this.jiangliSpr2.x;
            TweenMax.to(this.jiangliSpr2,1,{"x":_loc3_ - 45});
         }
         else
         {
            this.jiangliSpr2.visible = true;
            TweenMax.to(this.jiangliSpr2,1,{"x":_loc3_ - 45});
         }
      }
      
      private function setBtnSkin(param1:int, param2:Array, param3:int = 0) : void
      {
         var _loc4_:int = 0;
         while(_loc4_ < 5)
         {
            if(int(param2[_loc4_].state == 0))
            {
               this["btn" + (_loc4_ + 1)].skin = "shengxiaohui_Button";
            }
            else if(int(param2[_loc4_].state == 1))
            {
               this["btn" + (_loc4_ + 1)].skin = "shengxiaoliangtg_Button";
            }
            else
            {
               this["btn" + (_loc4_ + 1)].skin = "shengxiaoliang_Button";
            }
            if(param3 == 1)
            {
               if(param1 == int(param2[_loc4_].lv))
               {
                  if(int(param2[_loc4_].state == 0))
                  {
                     this["btn" + (_loc4_ + 1)].skin = "shengxiaohuidd_Button";
                  }
                  else
                  {
                     this["btn" + (_loc4_ + 1)].skin = "shengxiaoliangdd_Button";
                  }
               }
            }
            _loc4_++;
         }
      }
      
      public function setData(param1:int, param2:int, param3:Array) : void
      {
         var _loc4_:DisplayObject = null;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc12_:String = null;
         var _loc13_:String = null;
         var _loc14_:String = null;
         this.btnLVState = param3;
         if(param1 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(param1 == 20)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         this.nowDJ = param2;
         while(this.spr1.numChildren > 0)
         {
            this.spr1.removeChildAt(0);
         }
         while(this.spr2.numChildren > 0)
         {
            this.spr2.removeChildAt(0);
         }
         while(this.spr3.numChildren > 0)
         {
            this.spr3.removeChildAt(0);
         }
         while(this.spr4.numChildren > 0)
         {
            this.spr4.removeChildAt(0);
         }
         while(this.spr5.numChildren > 0)
         {
            this.spr5.removeChildAt(0);
         }
         while(this.state1.numChildren > 0)
         {
            this.state1.removeChildAt(0);
         }
         while(this.state2.numChildren > 0)
         {
            this.state2.removeChildAt(0);
         }
         while(this.state3.numChildren > 0)
         {
            this.state3.removeChildAt(0);
         }
         while(this.state4.numChildren > 0)
         {
            this.state4.removeChildAt(0);
         }
         while(this.state5.numChildren > 0)
         {
            this.state5.removeChildAt(0);
         }
         while(this.now.numChildren > 0)
         {
            this.now.removeChildAt(0);
         }
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         while(_loc8_ < 5)
         {
            this.btnStateArr[_loc8_ + 1] = param3[_loc8_].state;
            _loc9_ = 0;
            if(int(param3[_loc8_].lv) < 10)
            {
               _loc5_ = int(param3[_loc8_].lv);
               _loc6_ = -1;
               _loc7_ = -1;
               _loc9_ = 15;
            }
            else if(int(param3[_loc8_].lv) < 100)
            {
               _loc5_ = int(param3[_loc8_].lv) / 10;
               _loc6_ = int(param3[_loc8_].lv) % 10;
               _loc7_ = -1;
               _loc9_ = 30;
            }
            else
            {
               _loc5_ = 1;
               _loc6_ = _loc7_ = 0;
               _loc9_ = 45;
            }
            _loc10_ = "" + _loc5_;
            _loc11_ = "" + _loc6_;
            _loc12_ = "" + _loc7_;
            _loc13_ = "D";
            _loc14_ = "C";
            if(int(param3[_loc8_].state) == 0)
            {
               _loc10_ = "0_" + _loc5_;
               _loc11_ = "0_" + _loc6_;
               _loc12_ = "0_" + _loc7_;
               _loc13_ = "0_D";
               _loc14_ = "0_C";
            }
            _loc4_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shiershengxiao/" + _loc13_ + ".swf");
            _loc4_.x = 8;
            _loc4_.y = 2;
            this["spr" + (_loc8_ + 1)].addChild(_loc4_);
            _loc4_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shiershengxiao/" + _loc10_ + ".swf");
            _loc4_.x = 2 + 22;
            _loc4_.y = 2;
            this["spr" + (_loc8_ + 1)].addChild(_loc4_);
            if(_loc6_ != -1)
            {
               _loc4_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shiershengxiao/" + _loc11_ + ".swf");
               _loc4_.x = 2 + 22 + 15;
               _loc4_.y = 2;
               this["spr" + (_loc8_ + 1)].addChild(_loc4_);
            }
            if(_loc7_ != -1)
            {
               _loc4_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shiershengxiao/" + _loc12_ + ".swf");
               _loc4_.x = 2 + 22 + 15 + 15;
               _loc4_.y = 2;
               this["spr" + (_loc8_ + 1)].addChild(_loc4_);
            }
            _loc4_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shiershengxiao/" + _loc14_ + ".swf");
            _loc4_.x = 2 + 20 + _loc9_;
            _loc4_.y = 2;
            this["spr" + (_loc8_ + 1)].addChild(_loc4_);
            if(int(param3[_loc8_].state) == 1)
            {
               _loc4_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shiershengxiao/tg.swf");
               _loc4_.x = 2;
               _loc4_.y = 2;
            }
            this["btn" + (_loc8_ + 1)].name = param3[_loc8_].lv + "," + (_loc8_ + 1);
            this.setBtnSkin(param2,param3,1);
            _loc8_++;
         }
         if(!this.timer.running)
         {
            this.timer.reset();
            this.timer.start();
         }
      }
      
      public function setlv(param1:int, param2:Array, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int) : void
      {
         var _loc16_:String = null;
         var _loc17_:int = 0;
         this.lingjiangID = param1;
         var _loc11_:String = "<textformat leading=\'18\'><font color=\'" + StaticValue.WHITE_HTML + "\'>";
         var _loc12_:String = "<textformat leading=\'18\'><font color=\'" + StaticValue.WHITE_HTML + "\'>";
         var _loc13_:int = 0;
         while(_loc13_ < param2.length)
         {
            _loc11_ += param2[_loc13_].name + "<br>";
            _loc16_ = "";
            _loc17_ = int(param2[_loc13_].time);
            _loc16_ = int(_loc17_ / 60) + ":" + int(_loc17_ % 60);
            _loc12_ += _loc16_ + "<br>";
            _loc13_++;
         }
         _loc11_ = _loc11_.substr(0,_loc11_.length - 4);
         _loc12_ = _loc12_.substr(0,_loc12_.length - 4);
         _loc11_ += "</font></textformat>";
         _loc12_ += "</font></textformat>";
         this.ftRankName.htmlText = _loc11_;
         this.ftRankTime.htmlText = _loc12_;
         this.ftCount.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param3 + "/" + param4 + "</font>";
         this.ftOver.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param5 + "/" + param6 + "</font>";
         while(this.sprGo.numChildren > 0)
         {
            this.sprGo.removeChildAt(0);
         }
         var _loc14_:Goods = new Goods(param7);
         _loc14_.count = param8;
         var _loc15_:ItemFace = new ItemFace(_loc14_);
         _loc15_.x = 422;
         _loc15_.y = 342;
         this.sprGo.addChild(_loc15_);
         if(param9 == 0)
         {
            this.btnStart.enabled = false;
            this.btnStart.label = LanResManager.getLanCommonTextWords("不可挑战");
         }
         else if(param9 == 1)
         {
            this.btnStart.enabled = true;
            this.btnStart.label = LanResManager.getLanCommonTextWords("重新挑战");
         }
         else if(param9 == 2)
         {
            this.btnStart.enabled = true;
            this.btnStart.label = LanResManager.getLanCommonTextWords("开始挑战");
         }
         if(param10 == 0)
         {
            this.btnGet.enabled = false;
         }
         else
         {
            this.btnGet.enabled = true;
         }
      }
   }
}

