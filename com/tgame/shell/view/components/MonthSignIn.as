package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
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
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class MonthSignIn extends FPanel
   {
      
      public static const UI_SHOW_MONTHSIGNIN_PANEL:String = "UI_SHOW_MONTHSIGNIN_PANEL";
      
      public static const UI_REQUEST_REWARD_CLICK:String = "UI_REQUEST_REWARD_CLICK";
      
      public static const UI_REQUEST_SIGNIN_CLICK:String = "UI_REQUEST_SIGNIN_CLICK";
      
      private var ft:FTextArea;
      
      private var month:FTextArea;
      
      private var signinNum:FTextArea;
      
      private var titleBit:Bitmap;
      
      private var btnSignIn1:SecondButton;
      
      private var btnSignIn3:SecondButton;
      
      private var btnSignIn7:SecondButton;
      
      private var btnSignIn14:SecondButton;
      
      private var btnSignIn24:SecondButton;
      
      private var spr1:FCanvas;
      
      private var spr3:FCanvas;
      
      private var spr7:FCanvas;
      
      private var spr14:FCanvas;
      
      private var spr24:FCanvas;
      
      private var btnGet1:SecondButton;
      
      private var btnGet3:SecondButton;
      
      private var btnGet7:SecondButton;
      
      private var btnGet14:SecondButton;
      
      private var btnGet24:SecondButton;
      
      private var btnSignIn:SecondButton;
      
      private var sprMonth:Sprite;
      
      public var tabBar:FTabBar;
      
      public function MonthSignIn()
      {
         var _loc1_:DisplayObject = null;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 503;
         height = 406 + 33 + 8;
         titleText = LanResManager.getLanCommonTextWords("每日签到");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/monthSignIn/ui.qiandao.bg.swf");
         _loc1_.x = 10;
         _loc1_.y = 4;
         addChild(_loc1_);
         addEventListener(Event.ADDED_TO_STAGE,this.onAdd);
         this.init();
      }
      
      private function onAdd(param1:Event) : void
      {
         dispatchEvent(new BaseEvent(UI_SHOW_MONTHSIGNIN_PANEL));
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.month = new FTextArea();
         this.month.x = 20;
         this.month.y = 10;
         this.month.width = 60;
         this.month.height = 20;
         this.month.htmlText = "1月";
         this.month.textColor = StaticValue.ORANGE;
         addChild(this.month);
         this.ft = new FTextArea();
         this.ft.x = 300;
         this.ft.y = 10;
         this.ft.width = 100;
         this.ft.height = 20;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("本月已累计签到：");
         this.ft.textColor = StaticValue.ORANGE;
         addChild(this.ft);
         this.signinNum = new FTextArea();
         this.signinNum.x = 400;
         this.signinNum.y = 10;
         this.signinNum.width = 50;
         this.signinNum.height = 20;
         this.signinNum.htmlText = "N次";
         this.signinNum.textColor = StaticValue.ORANGE;
         addChild(this.signinNum);
         this.titleBit = new Bitmap();
         this.sprMonth = new Sprite();
         this.sprMonth.x = 20;
         this.sprMonth.y = 60;
         addChild(this.sprMonth);
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("签到1天"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("签到3天"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("签到7天"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("签到14天"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("签到24天"),this.onTabClick);
         addChild(this.tabBar);
         this.tabBar.x = 20;
         this.tabBar.y = 320;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("签到1天"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("签到3天"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("签到7天"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("签到14天"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("签到24天"),this.onTabClick);
         addChild(this.tabBar);
         this.tabBar.x = 20;
         this.tabBar.y = 320;
         this.spr1 = new FCanvas();
         this.spr1.skin = "box";
         this.spr1.width = 468;
         this.spr1.height = 52;
         this.spr1.x = 19;
         this.spr1.y = 300 + 33 + 11;
         addChild(this.spr1);
         this.spr1.visible = false;
         this.spr3 = new FCanvas();
         this.spr3.skin = "box";
         this.spr3.width = 468;
         this.spr3.height = 52;
         this.spr3.x = 19;
         this.spr3.y = 300 + 33 + 11;
         addChild(this.spr3);
         this.spr3.visible = false;
         this.spr7 = new FCanvas();
         this.spr7.skin = "box";
         this.spr7.width = 468;
         this.spr7.height = 52;
         this.spr7.x = 19;
         this.spr7.y = 300 + 33 + 11;
         addChild(this.spr7);
         this.spr7.visible = false;
         this.spr14 = new FCanvas();
         this.spr14.skin = "box";
         this.spr14.width = 468;
         this.spr14.height = 52;
         this.spr14.x = 19;
         this.spr14.y = 300 + 33 + 11;
         addChild(this.spr14);
         this.spr14.visible = false;
         this.spr24 = new FCanvas();
         this.spr24.skin = "box";
         this.spr24.width = 468;
         this.spr24.height = 52;
         this.spr24.x = 19;
         this.spr24.y = 300 + 33 + 11;
         addChild(this.spr24);
         this.spr24.visible = false;
         this.btnGet1 = new SecondButton();
         this.btnGet1.x = 395;
         this.btnGet1.y = 3;
         this.btnGet1.label = LanResManager.getLanCommonTextWords("点击签到领奖");
         this.btnGet1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.spr1.addChild(this.btnGet1);
         this.btnGet3 = new SecondButton();
         this.btnGet3.x = 395;
         this.btnGet3.y = 3;
         this.btnGet3.label = LanResManager.getLanCommonTextWords("点击签到领奖");
         this.btnGet3.addEventListener(MouseEvent.CLICK,this.onClick);
         this.spr3.addChild(this.btnGet3);
         this.btnGet7 = new SecondButton();
         this.btnGet7.x = 395;
         this.btnGet7.y = 3;
         this.btnGet7.label = LanResManager.getLanCommonTextWords("点击签到领奖");
         this.btnGet7.addEventListener(MouseEvent.CLICK,this.onClick);
         this.spr7.addChild(this.btnGet7);
         this.btnGet14 = new SecondButton();
         this.btnGet14.x = 395;
         this.btnGet14.y = 3;
         this.btnGet14.label = LanResManager.getLanCommonTextWords("点击签到领奖");
         this.btnGet14.addEventListener(MouseEvent.CLICK,this.onClick);
         this.spr14.addChild(this.btnGet14);
         this.btnGet24 = new SecondButton();
         this.btnGet24.x = 395;
         this.btnGet24.y = 3;
         this.btnGet24.label = LanResManager.getLanCommonTextWords("点击签到领奖");
         this.btnGet24.addEventListener(MouseEvent.CLICK,this.onClick);
         this.spr24.addChild(this.btnGet24);
         this.btnSignIn = new SecondButton();
         this.btnSignIn.x = 395 + 10 + 10;
         this.btnSignIn.y = 330 + 33 + 8;
         this.btnSignIn.label = LanResManager.getLanCommonTextWords("点击签到");
         this.btnSignIn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnSignIn);
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("签到1天"):
               this.spr1.visible = true;
               this.spr3.visible = false;
               this.spr7.visible = false;
               this.spr14.visible = false;
               this.spr24.visible = false;
               break;
            case LanResManager.getLanCommonTextWords("签到3天"):
               this.spr1.visible = false;
               this.spr3.visible = true;
               this.spr7.visible = false;
               this.spr14.visible = false;
               this.spr24.visible = false;
               break;
            case LanResManager.getLanCommonTextWords("签到7天"):
               this.spr1.visible = false;
               this.spr3.visible = false;
               this.spr7.visible = true;
               this.spr14.visible = false;
               this.spr24.visible = false;
               break;
            case LanResManager.getLanCommonTextWords("签到14天"):
               this.spr1.visible = false;
               this.spr3.visible = false;
               this.spr7.visible = false;
               this.spr14.visible = true;
               this.spr24.visible = false;
               break;
            case LanResManager.getLanCommonTextWords("签到24天"):
               this.spr1.visible = false;
               this.spr3.visible = false;
               this.spr7.visible = false;
               this.spr14.visible = false;
               this.spr24.visible = true;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnSignIn1:
               this.spr1.visible = true;
               this.spr3.visible = false;
               this.spr7.visible = false;
               this.spr14.visible = false;
               this.spr24.visible = false;
               break;
            case this.btnSignIn3:
               this.spr1.visible = false;
               this.spr3.visible = true;
               this.spr7.visible = false;
               this.spr14.visible = false;
               this.spr24.visible = false;
               break;
            case this.btnSignIn7:
               this.spr1.visible = false;
               this.spr3.visible = false;
               this.spr7.visible = true;
               this.spr14.visible = false;
               this.spr24.visible = false;
               break;
            case this.btnSignIn14:
               this.spr1.visible = false;
               this.spr3.visible = false;
               this.spr7.visible = false;
               this.spr14.visible = true;
               this.spr24.visible = false;
               break;
            case this.btnSignIn24:
               this.spr1.visible = false;
               this.spr3.visible = false;
               this.spr7.visible = false;
               this.spr14.visible = false;
               this.spr24.visible = true;
               break;
            case this.btnGet1:
               dispatchEvent(new BaseEvent(UI_REQUEST_REWARD_CLICK,"",1));
               this.onClose();
               break;
            case this.btnGet3:
               dispatchEvent(new BaseEvent(UI_REQUEST_REWARD_CLICK,"",3));
               this.onClose();
               break;
            case this.btnGet7:
               dispatchEvent(new BaseEvent(UI_REQUEST_REWARD_CLICK,"",7));
               this.onClose();
               break;
            case this.btnGet14:
               dispatchEvent(new BaseEvent(UI_REQUEST_REWARD_CLICK,"",14));
               this.onClose();
               break;
            case this.btnGet24:
               dispatchEvent(new BaseEvent(UI_REQUEST_REWARD_CLICK,"",24));
               this.onClose();
               break;
            case this.btnSignIn:
               dispatchEvent(new BaseEvent(UI_REQUEST_SIGNIN_CLICK));
               this.onClose();
         }
      }
      
      public function setItem(param1:Array, param2:int, param3:Boolean, param4:int) : void
      {
         var _loc6_:Goods = null;
         var _loc7_:ItemFace = null;
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc6_ = param1[_loc5_] as Goods;
            _loc7_ = new ItemFace(_loc6_);
            _loc7_.x = 10 + 40 * _loc5_;
            _loc7_.y = 10;
            this["spr" + String(param2)].addChild(_loc7_);
            _loc5_++;
         }
         this["btnGet" + String(param2)].enabled = param3;
         if(param4 != 1)
         {
            this["btnGet" + String(param2)].label = LanResManager.getLanCommonTextWords("点击签到领奖");
         }
         else
         {
            this["btnGet" + String(param2)].label = LanResManager.getLanCommonTextWords("已领取");
         }
      }
      
      public function setBtnEn(param1:Boolean) : void
      {
         this.btnSignIn.enabled = param1;
      }
      
      public function setGetBtnEn(param1:int, param2:Boolean) : void
      {
         this["btnGet" + String(param1)].enabled = param2;
         this["btnGet" + String(param1)].label = LanResManager.getLanCommonTextWords("已领取");
      }
      
      public function setValue(param1:int, param2:int) : void
      {
         this.month.htmlText = LanResManager.getLanCommonTextWords("月越南") + " " + String(param1);
         this.signinNum.htmlText = String(param2) + "  " + LanResManager.getLanCommonTextWords("次");
      }
      
      public function initDay(param1:int, param2:Array, param3:int, param4:int) : void
      {
         var _loc12_:DisplayObject = null;
         var _loc14_:FTextArea = null;
         var _loc15_:DisplayObject = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         _loc7_ = param2[0].week - 1;
         var _loc11_:int = 0;
         while(this.sprMonth.numChildren > 0)
         {
            this.sprMonth.removeChildAt(0);
         }
         var _loc13_:int = 0;
         while(_loc13_ < 42)
         {
            _loc14_ = new FTextArea();
            if((_loc8_ < _loc7_ || _loc8_ > _loc7_) && _loc8_ != _loc7_ + 1 || _loc11_ >= param2.length)
            {
               if(_loc11_ > param2.length)
               {
                  if(_loc13_ > 27 && _loc13_ < 35)
                  {
                     _loc5_ = 4;
                  }
                  else if(_loc13_ > 34)
                  {
                     _loc5_ = 5;
                  }
                  if(_loc13_ % 7 == 1)
                  {
                     _loc8_ = 0;
                  }
               }
               if(_loc8_ == 7)
               {
                  _loc8_--;
               }
               _loc12_ = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/monthSignIn/bg_null.swf",64,35);
               _loc12_.x = 65 * _loc8_ + 5;
               _loc12_.y = 36 * _loc5_ + 20;
               _loc9_++;
               if(_loc11_ >= param1)
               {
                  _loc11_++;
               }
            }
            else if(_loc8_ == _loc7_ || _loc8_ == _loc7_ + 1)
            {
               _loc6_ = int(param2[_loc11_].day);
               _loc7_ = int(param2[_loc11_].week);
               _loc7_ = _loc7_ - 1;
               _loc10_ = int(param2[_loc11_].isQian);
               if(_loc10_ == 0)
               {
                  _loc12_ = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/monthSignIn/bg1.swf",64,35);
               }
               else
               {
                  _loc12_ = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/monthSignIn/bg_yqd.swf",64,35);
               }
               _loc12_.x = 65 * _loc7_ + 5;
               _loc14_.htmlText = String(_loc6_);
               _loc12_.y = 36 * _loc5_ + 20;
               if(_loc7_ == 6)
               {
                  _loc5_++;
               }
               _loc11_++;
            }
            if(_loc8_ == 7)
            {
               _loc8_ = 0;
            }
            _loc8_++;
            this.sprMonth.addChild(_loc12_);
            this.sprMonth.addChild(_loc14_);
            _loc14_.x = _loc12_.x + _loc12_.width / 2 - 4;
            _loc14_.y = _loc12_.y + 10;
            _loc14_.textColor = StaticValue.YELLOW;
            if(_loc11_ == param3)
            {
               _loc15_ = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/monthSignIn/today.swf",64,13);
               _loc15_.x = _loc12_.x + 2;
               _loc15_.y = _loc12_.y;
               this.sprMonth.addChild(_loc15_);
               if(_loc10_ == 1)
               {
                  this.setBtnEn(false);
               }
               else
               {
                  this.setBtnEn(true);
               }
            }
            _loc13_++;
         }
         this["spr" + String(param4)].visible = true;
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("签到" + String(param4) + "天"));
      }
   }
}

