package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.wangzhezhibang.model.info.WangzhezhibangVO;
   import com.tgame.shell.view.components.wangzhezhibangliucheng.WangZheZhiBang_LiuCheng;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class WangzhezhibangPanel extends FPanel
   {
      
      public static const UI_WANGZHEZHIBANG_GUIZESHUOMING:String = "UI_WANGZHEZHIBANG_GUIZESHUOMING";
      
      public static const UI_WANGZHEZHIBANG_KUAFUBAOGUO:String = "UI_WANGZHEZHIBANG_KUAFUBAOGUO";
      
      public static const UI_WANGZHEZHIBANG_LIJIEBAZHU:String = "UI_WANGZHEZHIBANG_LIJIEBAZHU";
      
      public static const UI_WANGZHEZHIBANG_BAOMING:String = "UI_WANGZHEZHIBANG_BAOMING";
      
      public static const UI_WANGZHEZHIBANG_LIUCHENGTU:String = "UI_WANGZHEZHIBANG_LIUCHENGTU";
      
      public static const UI_WANGZHEZHIBANG_JINRUBISAI:String = "UI_WANGZHEZHIBANG_JINRUBISAI";
      
      public static const UI_WANGZHEZHIBANG_BANGPAIZHUWEIBANG:String = "UI_WANGZHEZHIBANG_BANGPAIZHUWEIBANG";
      
      public static const UI_WANGZHEZHIBANG_LINGJIANG:String = "UI_WANGZHEZHIBANG_LINGJIANG";
      
      public static const UI_WANGZHEZHIBANG_MOBAI:String = "UI_WANGZHEZHIBANG_MOBAI";
      
      public static const UI_WANGZHEZHIBANG_ZHUWEIBANGPAI:String = "UI_WANGZHEZHIBANG_ZHUWEIBANGPAI";
      
      public static const UI_WANGZHEZHIBANG_ZHUWEIWODEBANGPAI:String = "UI_WANGZHEZHIBANG_ZHUWEIWODEBANGPAI";
      
      public static const UI_WANGZHEZHIBANG_BANGHUIZHUWEI_FANYE:String = "UI_WANGZHEZHIBANG_BANGHUIZHUWEI_FANYE";
      
      public static const UI_WANGZHEZHIBANG_ZHUWEIQUERY:String = "UI_WANGZHEZHIBANG_ZHUWEIQUERY";
      
      public static const UI_WANGBANGZHIZHAN_FANYE:String = "UI_WANGBANGZHIZHAN_FANYE";
      
      public static const UI_WANGZHEZHIBANG_LINGQUJIANGLI:String = "UI_WANGZHEZHIBANG_LINGQUJIANGLI";
      
      public static const UI_WANGZHEZHIBANG_TIP:String = "UI_WANGZHEZHIBANG_TIP";
      
      private var btnGuize:SecondButton;
      
      private var btnBaoguo:SecondButton;
      
      private var btnLishi:SecondButton;
      
      private var btnBaoming:SecondButton;
      
      private var btnLiucheng:SecondButton;
      
      private var btnZhuwei:SecondButton;
      
      private var btnLingjiang:SecondButton;
      
      private var btnJinru:FSimpleButton;
      
      private var btnMobai:FSimpleButton;
      
      private var ft:FTextArea;
      
      private var ftName1:FTextArea;
      
      private var ftName2:FTextArea;
      
      private var ftName3:FTextArea;
      
      private var ftName4:FTextArea;
      
      private var ftName5:FTextArea;
      
      private var ftTime:FTextArea;
      
      private var ftState:FTextArea;
      
      private var ftLeft:FTextArea;
      
      private var liuChengtu:WangZheZhiBang_LiuCheng;
      
      private var skillSpr:Sprite;
      
      private var _playerAvatar1:Bitmap;
      
      private var _playerAvatar2:Bitmap;
      
      private var _playerAvatar3:Bitmap;
      
      private var _playerAvatar4:Bitmap;
      
      private var _playerAvatar0:Bitmap;
      
      private var chobj1:DisplayObject;
      
      private var chobj2:DisplayObject;
      
      private var chobj3:DisplayObject;
      
      private var chobj4:DisplayObject;
      
      private var chobj5:DisplayObject;
      
      private var chSpr:Sprite;
      
      private var flag:DisplayObject;
      
      private var btIconPingtai:DisplayObject;
      
      private var sprPingtai:Sprite;
      
      public function WangzhezhibangPanel()
      {
         super();
         width = 875 - 20;
         height = 540 - 16;
         skin = "panel_btn";
         dragAble = true;
         titleText = LanResManager.getLanCommonTextWords("王者之帮");
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         this.clearAvatar();
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc2_:TextFormat = null;
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/main_bg.swf");
         _loc1_.x = 9;
         _loc1_.y = 0;
         addChild(_loc1_);
         this.ftLeft = new FTextArea();
         this.ftLeft.x = 40;
         this.ftLeft.y = 30;
         this.ftLeft.multiline = true;
         this.ftLeft.wordWrap = true;
         this.ftLeft.width = 220;
         this.ftLeft.height = 90;
         addChild(this.ftLeft);
         _loc2_ = new TextFormat();
         _loc2_.align = "center";
         this.ftTime = new FTextArea();
         this.ftTime.x = 300 - 15;
         this.ftTime.y = 10;
         this.ftTime.width = 290;
         this.ftTime.height = 20;
         this.ftTime.defaultTextFormat = _loc2_;
         addChild(this.ftTime);
         this.chSpr = new Sprite();
         addChild(this.chSpr);
         this.ftState = new FTextArea();
         this.ftState.x = 135;
         this.ftState.y = 460;
         this.ftState.width = 110;
         addChild(this.ftState);
         this.ftName1 = new FTextArea();
         this.ftName1.x = 385 + 5;
         this.ftName1.y = 120;
         this.ftName1.width = 120;
         addChild(this.ftName1);
         this.ftName2 = new FTextArea();
         this.ftName2.x = 230;
         this.ftName2.y = 180;
         this.ftName2.width = 120;
         addChild(this.ftName2);
         this.ftName3 = new FTextArea();
         this.ftName3.x = 500 + 20;
         this.ftName3.y = 180;
         this.ftName3.width = 120;
         addChild(this.ftName3);
         this.ftName4 = new FTextArea();
         this.ftName4.x = 75 + 15;
         this.ftName4.y = 250;
         this.ftName4.width = 120;
         addChild(this.ftName4);
         this.ftName5 = new FTextArea();
         this.ftName5.x = 680 + 15;
         this.ftName5.y = 250;
         this.ftName5.width = 120;
         addChild(this.ftName5);
         this.btnGuize = new SecondButton();
         this.btnGuize.x = 760 - 20;
         this.btnGuize.y = 20;
         this.btnGuize.label = LanResManager.getLanCommonTextWords("规则说明");
         this.btnGuize.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnGuize);
         this.btnBaoguo = new SecondButton();
         this.btnBaoguo.x = 760 - 20;
         this.btnBaoguo.y = 55;
         this.btnBaoguo.label = LanResManager.getLanCommonTextWords("跨服包裹");
         this.btnBaoguo.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnBaoguo);
         this.btnLishi = new SecondButton();
         this.btnLishi.x = 760 - 20;
         this.btnLishi.y = 90;
         this.btnLishi.label = LanResManager.getLanCommonTextWords("历届霸主");
         this.btnLishi.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnLishi);
         this.btnBaoming = new SecondButton();
         this.btnBaoming.x = 30;
         this.btnBaoming.y = 458;
         this.btnBaoming.label = LanResManager.getLanCommonTextWords("帮会报名");
         this.btnBaoming.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnBaoming);
         this.btnLiucheng = new SecondButton();
         this.btnLiucheng.x = 240;
         this.btnLiucheng.y = 458;
         this.btnLiucheng.label = LanResManager.getLanCommonTextWords("对战流程图");
         this.btnLiucheng.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnLiucheng);
         this.btnJinru = new FSimpleButton();
         this.btnJinru.x = 360 - 5;
         this.btnJinru.y = 465 - 18;
         this.btnJinru.skin = "WZZB_MAINJR_Button";
         this.btnJinru.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnJinru);
         this.btnZhuwei = new SecondButton();
         this.btnZhuwei.x = 580 - 25;
         this.btnZhuwei.y = 458;
         this.btnZhuwei.label = LanResManager.getLanCommonTextWords("帮派助威榜");
         this.btnZhuwei.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnZhuwei);
         this.btnLingjiang = new SecondButton();
         this.btnLingjiang.x = 580 + 150;
         this.btnLingjiang.y = 458;
         this.btnLingjiang.label = LanResManager.getLanCommonTextWords("领取奖励");
         this.btnLingjiang.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnLingjiang);
         this.btnMobai = new FSimpleButton();
         this.btnMobai.x = 370;
         this.btnMobai.y = 375 + 8;
         this.btnMobai.skin = "WZZB_MAINMB_Button";
         this.btnMobai.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnMobai);
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
         var _loc3_:Bitmap = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc3_.x = 295;
         _loc3_.y = 385;
         _loc3_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc3_.x = 550;
         _loc3_.y = 385;
         var _loc4_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/skill.swf");
         _loc4_.x = 260;
         _loc4_.y = 360;
         _loc4_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/skill.swf");
         _loc4_.x = 505;
         _loc4_.y = 360;
         var _loc5_:Skill = new Skill(200394);
         _loc5_.isLearn = 1;
         var _loc6_:ItemFace = new ItemFace(_loc5_);
         _loc6_.setShowCount(false);
         _loc6_.x = 297 - 10;
         _loc6_.y = 387 - 4;
         var _loc7_:Skill = new Skill(200395);
         _loc7_.isLearn = 2;
         var _loc8_:ItemFace = new ItemFace(_loc7_);
         _loc8_.setShowCount(false);
         _loc8_.x = 552 - 20;
         _loc8_.y = 387 - 4;
         this.sprPingtai = new Sprite();
         addChild(this.sprPingtai);
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         switch(param1.target)
         {
            case this.btnBaoguo:
               dispatchEvent(new BaseEvent(UI_WANGZHEZHIBANG_KUAFUBAOGUO));
               break;
            case this.btnBaoming:
               dispatchEvent(new BaseEvent(UI_WANGZHEZHIBANG_BAOMING));
               break;
            case this.btnGuize:
               dispatchEvent(new BaseEvent(UI_WANGZHEZHIBANG_GUIZESHUOMING));
               break;
            case this.btnJinru:
               dispatchEvent(new BaseEvent(UI_WANGZHEZHIBANG_JINRUBISAI));
               break;
            case this.btnLingjiang:
               dispatchEvent(new BaseEvent(UI_WANGZHEZHIBANG_LINGJIANG));
               break;
            case this.btnLishi:
               dispatchEvent(new BaseEvent(UI_WANGZHEZHIBANG_LIJIEBAZHU));
               break;
            case this.btnLiucheng:
               dispatchEvent(new BaseEvent(UI_WANGZHEZHIBANG_LIUCHENGTU));
               break;
            case this.btnMobai:
               dispatchEvent(new BaseEvent(UI_WANGZHEZHIBANG_MOBAI));
               break;
            case this.btnZhuwei:
               dispatchEvent(new BaseEvent(UI_WANGZHEZHIBANG_BANGPAIZHUWEIBANG));
         }
      }
      
      public function liuchengtu(param1:Array = null, param2:Array = null) : void
      {
         if(!this.liuChengtu)
         {
            this.liuChengtu = new WangZheZhiBang_LiuCheng();
            this.liuChengtu._$parent = this;
         }
         this.liuChengtu.x = (GameConfig.sceneWidth - this.liuChengtu.width) / 2;
         this.liuChengtu.y = (GameConfig.sceneHeight - this.liuChengtu.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.liuChengtu);
         this.liuChengtu.setInitialize(param1,param2);
      }
      
      public function setAvatar(param1:int, param2:BitmapData, param3:Boolean = false) : void
      {
         this["_playerAvatar" + param1].bitmapData = param2;
         switch(param1)
         {
            case 0:
               this["_playerAvatar" + param1].x = 390 + 30 + 5 + 5 + 5 - this["_playerAvatar" + param1].width / 2;
               this["_playerAvatar" + param1].y = 200 + 20 - this["_playerAvatar" + param1].height / 2;
               break;
            case 1:
               this["_playerAvatar" + param1].x = 260 + 40 - 20 - 14 + 5 - this["_playerAvatar" + param1].width / 2;
               this["_playerAvatar" + param1].y = 265 + 15 - this["_playerAvatar" + param1].height / 2;
               break;
            case 2:
               this["_playerAvatar" + param1].x = 515 + 30 + 15 + 5 - this["_playerAvatar" + param1].width / 2;
               this["_playerAvatar" + param1].y = 265 + 15 - this["_playerAvatar" + param1].height / 2;
               break;
            case 3:
               this["_playerAvatar" + param1].x = 115 + 15 + 5 - this["_playerAvatar" + param1].width / 2;
               this["_playerAvatar" + param1].y = 300 + 50 - this["_playerAvatar" + param1].height / 2;
               break;
            case 4:
               this["_playerAvatar" + param1].x = 650 + 50 + 15 + 15 + 8 + 5 - this["_playerAvatar" + param1].width / 2;
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
      
      public function setData(param1:WangzhezhibangVO) : void
      {
         this.setName(param1.playerArr);
         this.ftLeft.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("王帮名称：") + param1.name + "<br>" + LanResManager.getLanCommonTextWords("累计胜出次数：") + param1.count + "<br>" + LanResManager.getLanCommonTextWords("帮派总人数：") + param1.num + "<br>" + LanResManager.getLanCommonTextWords("帮派总战力：") + param1.zhan + "</font></textformat>";
         var _loc2_:String = "";
         if(param1.changci == 0)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("帮会报名和助威时间：");
         }
         else if(param1.changci == 1)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("64强预选赛开始时间：");
         }
         else if(param1.changci == 2)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("16强晋级赛开始时间：");
         }
         else if(param1.changci == 3)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("半决赛开始时间：");
         }
         else if(param1.changci = 4)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("决赛开始时间：");
         }
         this.ftTime.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + _loc2_ + param1.zhuweiTime + "</font>";
         this.btnBaoming.enabled = param1.baomingBtn == 1 ? true : false;
         this.btnJinru.enabled = param1.bisaiBtn == 1 ? true : false;
         this.setState(param1.baomingTip);
         this.setPintai(param1.pingtaiID);
      }
      
      private function setPintai(param1:int) : void
      {
         while(this.sprPingtai.numChildren > 0)
         {
            this.sprPingtai.removeChildAt(0);
         }
         if(param1 != 106 || param1 != 110 || param1 != 111)
         {
            param1 = 106;
         }
         this.btIconPingtai = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/biwudahuiKPT/" + String(param1) + "_small.png",30,30);
         if(this.btIconPingtai)
         {
            this.btIconPingtai.x = 225;
            this.btIconPingtai.y = 25;
            this.sprPingtai.addChild(this.btIconPingtai);
         }
      }
      
      private function setName(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this["ftName" + (_loc2_ + 1)].htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1[_loc2_].name + "<br>" + "</font>";
            _loc2_++;
         }
         if(param1.length <= 0)
         {
            return;
         }
         while(this.chSpr.numChildren > 0)
         {
            this.chSpr.removeChildAt(0);
         }
         this.flag = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/flag.swf");
         this.flag.x = 438 - 3;
         this.flag.y = 95 - 40 - 10;
         this.chSpr.addChild(this.flag);
         this.chobj1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/bz.swf");
         this.chobj1.x = 385 - 8 - 8;
         this.chobj1.y = 80;
         this.chSpr.addChild(this.chobj1);
         this.chobj2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/fbz.swf");
         this.chobj2.x = 210;
         this.chobj2.y = 140;
         this.chSpr.addChild(this.chobj2);
         this.chobj3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/dzl.swf");
         this.chobj3.x = 500;
         this.chobj3.y = 140;
         this.chSpr.addChild(this.chobj3);
         this.chobj4 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/dsx.swf");
         this.chobj4.x = 75;
         this.chobj4.y = 210;
         this.chSpr.addChild(this.chobj4);
         this.chobj5 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/dsj.swf");
         this.chobj5.x = 680;
         this.chobj5.y = 210;
         this.chSpr.addChild(this.chobj5);
      }
      
      public function setState(param1:int) : void
      {
         if(param1 == 1)
         {
            this.ftState.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("你的帮派已报名") + "</font>";
         }
         else
         {
            this.ftState.htmlText = "";
         }
      }
   }
}

