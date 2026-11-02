package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.active.ActiveActiveCanvas;
   import com.tgame.shell.view.components.active.ActiveFubenPKCanvas;
   import com.tgame.shell.view.components.active.GuajiList;
   import com.tgame.shell.view.components.gift.DayActivityCanvas;
   import com.tgame.shell.view.components.gift.DengLuYouLiCanvas;
   import com.tgame.shell.view.components.gift.JianMianYouLiCanvas;
   import com.tgame.shell.view.components.gift.LeiJiDengluCanvas;
   import com.tgame.shell.view.components.gift.NewsAfficheCanvas;
   import com.tgame.shell.view.components.gift.XianShiDaJiangDuiHuanCanvas;
   import com.tgame.shell.view.components.gift.YaoQingYouLiCanvas;
   import com.tgame.shell.view.components.gift.ZaiXianYouLiCanvas;
   import com.tgame.shell.view.components.mainui.YNHuodongTip;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   
   public class GiftPanel extends FPanel
   {
      
      public static const UI_CONQUERPANEL_BOSS_SHOW:String = "UI_CONQUERPANEL_BOSS_SHOW";
      
      public static const CHAT_MENU_CLICK:String = "CHAT_MENU_CLICK";
      
      public static const UI_CONQUERPANEL_BOSS_LIST_CLICK:String = "UI_CONQUERPANEL_BOSS_LIST_CLICK";
      
      public static const UI_ACTIVE_SHOW:String = "UI_ACTIVE_SHOW";
      
      public static const UI_GIFTPANEL_JIANMIAN_SHOW:String = "UI_GIFTPANEL_JIANMIAN_SHOW";
      
      public static const UI_GIFTPANEL_ZAIXIAN_SHOW:String = "UI_GIFTPANEL_ZAIXIAN_SHOW";
      
      public static const UI_NEWSPAPER_SHOW:String = "UI_NEWSPAPER_SHOW";
      
      public static const UI_RICHANGHUODONG_SHOW:String = "UI_RICHANGHUODONG_SHOW";
      
      public static const UI_JINGCAIFUBEN_SHOW:String = "UI_JINGCAIFUBEN_SHOW";
      
      public static const UI_REXUEPK_SHOW:String = "UI_REXUEPK_SHOW";
      
      public static const UI_GIFTPANEL_ACTIVEACTIVECANVAS_CLECK:String = "UI_GIFTPANEL_ACTIVEACTIVECANVAS_CLECK";
      
      public static const UI_GIFTPANEL_ACTIVEACTIVECANVAS_SELECT:String = "UI_GIFTPANEL_ACTIVEACTIVECANVAS_SELECT";
      
      public static const UI_GIFTPANEL_YAOQING_GET_BTN_CLICK:String = "UI_GIFTPANEL_YAOQING_GET_BTN_CLICK";
      
      public static const UI_GIFTPANEL_ZAIXIAN_GET_BTN_CLICK:String = "UI_GIFTPANEL_ZAIXIAN_GET_BTN_CLICK";
      
      public static const UI_GIFTPANEL_QIANDAO_GET_BTN_CLICK:String = "UI_GIFTPANEL_QIANDAO_GET_BTN_CLICK";
      
      public static const UI_GIFTPANEL_DENGLUY_GET_BTN_CLICK:String = "UI_GIFTPANEL_DENGLUY_GET_BTN_CLICK";
      
      public static const UI_GIFTPANEL_DAYACTIVITY_GET_BTN_CLICK:String = "UI_GIFTPANEL_DAYACTIVITY_GET_BTN_CLICK";
      
      public static const UI_GIFTPANEL_SHOW_DAYACTIVITY_CLICK:String = "UI_GIFTPANEL_SHOW_DAYACTIVITY_CLICK";
      
      public static const UI_GIFTPANEL_SHOW_LEIJIDENGLU_CLICK:String = "UI_GIFTPANEL_SHOW_LEIJIDENGLU_CLICK";
      
      public static const UI_GIFTPANEL_LEIJIDENGLU_CLICK:String = "UI_GIFTPANEL_LEIJIDENGLU_CLICK";
      
      public static const UI_GIFTPANEL_DAYACTIVITY_TIME1_BTN_CLICK:String = "UI_GIFTPANEL_DAYACTIVITY_TIME1_BTN_CLICK";
      
      public static const UI_GIFTPANEL_DAYACTIVITY_TIME2_BTN_CLICK:String = "UI_GIFTPANEL_DAYACTIVITY_TIME2_BTN_CLICK";
      
      public static const UI_GIFTPANEL_DAYACTIVITY_TIME3_BTN_CLICK:String = "UI_GIFTPANEL_DAYACTIVITY_TIME3_BTN_CLICK";
      
      public static const UI_GIFTPANEL_ACTIVE_PAGE_BTN_CLICK:String = "UI_GIFTPANEL_ACTIVE_PAGE_BTN_CLICK";
      
      public static const UI_GUAJIWANCHENG_BTN_CLICK:String = "UI_GUAJIWANCHENG_BTN_CLICK";
      
      public static const UI_LIJIWANCHENG_LINGQUJIANGLI_BTN_CLICK:String = "UI_LIJIWANCHENG_LINGQUJIANGLI_BTN_CLICK";
      
      public static const UI_XINZENGGUAJILAN_BTN_CLICK:String = "UI_XINZENGGUAJILAN_BTN_CLICK";
      
      public static const UI_YUENANHUODONGYOUHUA_CLICK:String = "MAINUI_YUENANHUODONGYOUHUA_CLICK";
      
      public var tabBar:FTabBar;
      
      private var activeactiveCanvas:ActiveActiveCanvas;
      
      private var jianmian:JianMianYouLiCanvas;
      
      private var yaoqing:YaoQingYouLiCanvas;
      
      private var denglu:DengLuYouLiCanvas;
      
      private var zaixian:ZaiXianYouLiCanvas;
      
      private var newsaffiche:NewsAfficheCanvas;
      
      private var xianshiduihuan:XianShiDaJiangDuiHuanCanvas;
      
      private var huodongId:int;
      
      private var bossrefurbishPanel:BossRefurbishPanel;
      
      private var dayActivity:DayActivityCanvas;
      
      private var leijidenglu:LeiJiDengluCanvas;
      
      private var activeCanvas:ActiveFubenPKCanvas;
      
      private var ynyouhuaCanvas:YNHuodongTip;
      
      private var aw:Boolean = true;
      
      public function GiftPanel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 610;
         height = 441;
         titleText = LanResManager.getLanCommonTextWords("活动");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.activeCanvas = new ActiveFubenPKCanvas();
         this.activeCanvas.setParent = this;
         addChild(this.activeCanvas);
         this.activeCanvas.x = 10;
         this.activeCanvas.y = 22;
         this.activeCanvas.visible = false;
         GuajiList._$parent = this;
         this.ynyouhuaCanvas = new YNHuodongTip();
         this.ynyouhuaCanvas.$parent = this;
         addChild(this.ynyouhuaCanvas);
         this.ynyouhuaCanvas.x = 10;
         this.ynyouhuaCanvas.y = 22;
         this.ynyouhuaCanvas.visible = false;
         this.activeactiveCanvas = new ActiveActiveCanvas();
         this.activeactiveCanvas.$parent = this;
         addChild(this.activeactiveCanvas);
         this.activeactiveCanvas.x = 10;
         this.activeactiveCanvas.y = 22;
         this.activeactiveCanvas.visible = false;
         this.jianmian = new JianMianYouLiCanvas();
         this.jianmian.$parent = this;
         addChild(this.jianmian);
         this.jianmian.x = 10;
         this.jianmian.y = 22;
         this.jianmian.visible = false;
         this.yaoqing = new YaoQingYouLiCanvas();
         this.yaoqing.$parent = this;
         addChild(this.yaoqing);
         this.yaoqing.x = 10;
         this.yaoqing.y = 22;
         this.yaoqing.visible = false;
         this.denglu = new DengLuYouLiCanvas();
         this.denglu.$parent = this;
         addChild(this.denglu);
         this.denglu.x = 10;
         this.denglu.y = 22;
         this.denglu.visible = false;
         this.zaixian = new ZaiXianYouLiCanvas();
         this.zaixian.$parent = this;
         addChild(this.zaixian);
         this.zaixian.x = 10;
         this.zaixian.y = 22;
         this.zaixian.visible = false;
         this.newsaffiche = new NewsAfficheCanvas();
         addChild(this.newsaffiche);
         this.newsaffiche.x = 10;
         this.newsaffiche.y = 22;
         this.newsaffiche.visible = false;
         this.xianshiduihuan = new XianShiDaJiangDuiHuanCanvas();
         this.xianshiduihuan.$parent = this;
         addChild(this.xianshiduihuan);
         this.xianshiduihuan.x = 10;
         this.xianshiduihuan.y = 22;
         this.xianshiduihuan.visible = false;
         this.bossrefurbishPanel = new BossRefurbishPanel();
         this.bossrefurbishPanel.$parent = this;
         addChild(this.bossrefurbishPanel);
         this.bossrefurbishPanel.x = 10;
         this.bossrefurbishPanel.y = 22;
         this.dayActivity = new DayActivityCanvas();
         this.dayActivity.$parent = this;
         addChild(this.dayActivity);
         this.dayActivity.x = 10;
         this.dayActivity.y = 22;
         this.dayActivity.visible = false;
         this.leijidenglu = new LeiJiDengluCanvas();
         this.leijidenglu.$parent = this;
         addChild(this.leijidenglu);
         this.leijidenglu.x = 10;
         this.leijidenglu.y = 22;
         this.leijidenglu.visible = false;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.activeactiveCanvas.bgImg);
         _loc1_.push(this.jianmian.bgImg);
         _loc1_.push(this.zaixian.bgImg);
         _loc1_.push(this.dayActivity.bgImg);
         this.DynamicManageImages = _loc1_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("日常活动"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("精彩副本"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("热血PK"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("活跃度"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("野外BOSS刷新信息"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
      }
      
      private function aa1(param1:BaseEvent = null) : void
      {
         var _loc2_:int = 1;
         var _loc3_:String = "";
         this.showHuodong(_loc2_,[[1,1,[[new Goods(20001),new Goods(20002),new Goods(20003),new Goods(20003)],true,_loc3_ + "111<br>1<br>1<br>1<br>1<br>111",0,LanResManager.getLanCommonTextWords("按钮文字")]]]);
         this.setDes("111111111111111");
      }
      
      private function aa2(param1:BaseEvent) : void
      {
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.activeCanvas)
         {
            this.activeCanvas.onShowLv(false);
         }
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("野外BOSS刷新信息"):
               dispatchEvent(new BaseEvent(UI_CONQUERPANEL_BOSS_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("日常活动与副本"):
               dispatchEvent(new BaseEvent(UI_ACTIVE_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("登录与在线奖励"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_JIANMIAN_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("邀请有礼"):
               break;
            case LanResManager.getLanCommonTextWords("新闻公告"):
               dispatchEvent(new BaseEvent(UI_NEWSPAPER_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("商城礼金大奖"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_ZAIXIAN_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("限时大奖兑换"):
               break;
            case LanResManager.getLanCommonTextWords("活跃度"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_SHOW_DAYACTIVITY_CLICK));
               break;
            case LanResManager.getLanCommonTextWords("累计登录奖励"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_SHOW_LEIJIDENGLU_CLICK));
               break;
            case LanResManager.getLanCommonTextWords("日常活动"):
               dispatchEvent(new BaseEvent(UI_RICHANGHUODONG_SHOW,"",1));
               break;
            case LanResManager.getLanCommonTextWords("精彩副本"):
               dispatchEvent(new BaseEvent(UI_JINGCAIFUBEN_SHOW,"",2));
               break;
            case LanResManager.getLanCommonTextWords("热血PK"):
               dispatchEvent(new BaseEvent(UI_REXUEPK_SHOW,"",3));
         }
         if(this.activeCanvas)
         {
            this.activeCanvas.onShowLv(false);
         }
      }
      
      public function showShengJi() : void
      {
         this.activeactiveCanvas.visible = true;
         this.jianmian.visible = false;
         this.yaoqing.visible = false;
         this.denglu.visible = false;
         this.zaixian.visible = false;
         this.xianshiduihuan.visible = false;
         this.newsaffiche.visible = false;
         this.bossrefurbishPanel.visible = false;
         this.dayActivity.visible = false;
         this.leijidenglu.visible = false;
         this.activeCanvas.visible = false;
      }
      
      public function setActiveactiveInitialize(param1:Array) : void
      {
         this.activeactiveCanvas.SetInitialize(param1);
      }
      
      public function set shengJiDataProvider(param1:Array) : void
      {
      }
      
      public function showJianMian() : void
      {
         this.activeactiveCanvas.visible = false;
         this.jianmian.visible = true;
         this.yaoqing.visible = false;
         this.denglu.visible = false;
         this.zaixian.visible = false;
         this.xianshiduihuan.visible = false;
         this.newsaffiche.visible = false;
         this.bossrefurbishPanel.visible = false;
         this.dayActivity.visible = false;
         this.leijidenglu.visible = false;
         this.activeCanvas.visible = false;
      }
      
      public function setJianMianDataProvider(param1:Date, param2:Array) : void
      {
      }
      
      public function setZianXianData(param1:Array) : void
      {
         this.jianmian.setZianXianData(param1);
      }
      
      public function setDengLuYouLiDataProvider(param1:int, param2:Array) : void
      {
         this.jianmian.setPrize(param1,param2);
      }
      
      public function showYaoQing() : void
      {
         this.activeactiveCanvas.visible = false;
         this.jianmian.visible = false;
         this.yaoqing.visible = true;
         this.denglu.visible = false;
         this.zaixian.visible = false;
         this.xianshiduihuan.visible = false;
         this.newsaffiche.visible = false;
         this.bossrefurbishPanel.visible = false;
         this.dayActivity.visible = false;
         this.leijidenglu.visible = false;
         this.activeCanvas.visible = false;
      }
      
      public function setYaoQingYouLiDataProvider(param1:String = "", param2:int = -1, param3:Array = null, param4:Array = null) : void
      {
         if(param1 != "")
         {
            this.yaoqing.URL = param1;
         }
         if(param2 != -1)
         {
            this.yaoqing.playerCount = param2;
         }
         if(param3)
         {
            this.yaoqing.prize = param3;
         }
         if(param4)
         {
            this.yaoqing.player = param4;
         }
         this.yaoqing.resize();
      }
      
      public function setYaoQingPlayer(param1:Array) : void
      {
         this.yaoqing.player = param1;
         this.yaoqing.resize();
      }
      
      public function showDengLu() : void
      {
         this.activeactiveCanvas.visible = false;
         this.jianmian.visible = false;
         this.yaoqing.visible = false;
         this.denglu.visible = true;
         this.zaixian.visible = false;
         this.xianshiduihuan.visible = false;
         this.newsaffiche.visible = false;
         this.bossrefurbishPanel.visible = false;
         this.dayActivity.visible = false;
         this.leijidenglu.visible = false;
         this.activeCanvas.visible = false;
      }
      
      public function showZaiXian() : void
      {
         this.activeactiveCanvas.visible = false;
         this.jianmian.visible = false;
         this.yaoqing.visible = false;
         this.denglu.visible = false;
         this.zaixian.visible = true;
         this.xianshiduihuan.visible = false;
         this.newsaffiche.visible = false;
         this.bossrefurbishPanel.visible = false;
         this.dayActivity.visible = false;
         this.leijidenglu.visible = false;
         this.activeCanvas.visible = false;
      }
      
      public function setZaiXianYouLiDataProvider(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         this.zaixian.setData(param1,param2,param3,param4);
      }
      
      public function setGetBtnEnabled(param1:Boolean) : void
      {
         this.zaixian.btn.enabled = param1;
      }
      
      public function setFettle(param1:int) : void
      {
         this.zaixian.setFettle(param1);
      }
      
      public function returnBtn() : Boolean
      {
         return this.zaixian.returnBtn();
      }
      
      public function qiandanFun(param1:Number, param2:Number, param3:Boolean) : void
      {
         this.zaixian.qiandanFun(param1,param2,param3);
      }
      
      public function showXianShiDuiHuan() : void
      {
         this.activeactiveCanvas.visible = false;
         this.jianmian.visible = false;
         this.yaoqing.visible = false;
         this.denglu.visible = false;
         this.zaixian.visible = false;
         this.newsaffiche.visible = false;
         if(this.huodongId == 1)
         {
            this.xianshiduihuan.visible = true;
         }
         else if(this.huodongId == 2)
         {
            this.xianshiduihuan.visible = false;
         }
         this.bossrefurbishPanel.visible = false;
         this.dayActivity.visible = false;
         this.leijidenglu.visible = false;
         this.activeCanvas.visible = false;
      }
      
      public function showNewSpaper() : void
      {
         this.activeactiveCanvas.visible = false;
         this.jianmian.visible = false;
         this.yaoqing.visible = false;
         this.denglu.visible = false;
         this.zaixian.visible = false;
         this.xianshiduihuan.visible = false;
         this.newsaffiche.visible = true;
         this.bossrefurbishPanel.visible = false;
         this.dayActivity.visible = false;
         this.leijidenglu.visible = false;
         this.activeCanvas.visible = false;
      }
      
      public function setNewSpaperMsg(param1:String) : void
      {
         this.newsaffiche.setNewSpaperMsg(param1);
      }
      
      public function showXianShiDuiHuanBtnFun(param1:Boolean, param2:int = 1) : void
      {
         if(param1)
         {
            if(this.tabBar.getButtonByLabel(LanResManager.getLanCommonTextWords("限时大奖兑换")) == null)
            {
               this.tabBar.addButton(LanResManager.getLanCommonTextWords("限时大奖兑换"),this.onTabClick);
            }
            this.huodongId = param2;
         }
         else
         {
            this.tabBar.subButtonByLabel(LanResManager.getLanCommonTextWords("限时大奖兑换"));
         }
      }
      
      public function openHuodongs(param1:Array) : void
      {
         this.xianshiduihuan.openHuodongs(param1);
      }
      
      public function closeAllHuodong() : void
      {
         this.xianshiduihuan.openHuodongs([]);
      }
      
      public function setDes(param1:String = "") : void
      {
         this.xianshiduihuan.setDes(param1);
      }
      
      public function showHuodong(param1:int, param2:Array) : void
      {
         this.xianshiduihuan.showHuodong(param1,param2);
      }
      
      public function showBossXinxi() : void
      {
         this.activeactiveCanvas.visible = false;
         this.jianmian.visible = false;
         this.yaoqing.visible = false;
         this.denglu.visible = false;
         this.zaixian.visible = false;
         this.xianshiduihuan.visible = false;
         this.newsaffiche.visible = false;
         this.bossrefurbishPanel.visible = true;
         this.dayActivity.visible = false;
         this.leijidenglu.visible = false;
         this.activeCanvas.visible = false;
      }
      
      public function setInitialize(param1:Array) : void
      {
         this.bossrefurbishPanel.SetInitialize(param1);
      }
      
      public function setAvatar(param1:BitmapData) : void
      {
         this.bossrefurbishPanel.avatar = param1;
      }
      
      public function showDayActivity() : void
      {
         this.activeactiveCanvas.visible = false;
         this.jianmian.visible = false;
         this.yaoqing.visible = false;
         this.denglu.visible = false;
         this.zaixian.visible = false;
         this.xianshiduihuan.visible = false;
         this.newsaffiche.visible = false;
         this.bossrefurbishPanel.visible = false;
         this.dayActivity.visible = true;
         this.leijidenglu.visible = false;
         this.activeCanvas.visible = false;
      }
      
      public function DeaultDayActivity() : void
      {
         dispatchEvent(new BaseEvent(UI_GIFTPANEL_SHOW_DAYACTIVITY_CLICK));
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("活跃度"));
      }
      
      public function LeijiDengluActive() : void
      {
         dispatchEvent(new BaseEvent(UI_GIFTPANEL_SHOW_LEIJIDENGLU_CLICK));
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("累计登录奖励"));
      }
      
      public function YeWaiBossActive() : void
      {
         dispatchEvent(new BaseEvent(UI_CONQUERPANEL_BOSS_SHOW));
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("野外BOSS刷新信息"));
      }
      
      public function setList(param1:Array) : void
      {
         this.dayActivity.setList(param1);
      }
      
      public function setInfo(param1:int, param2:int, param3:Boolean) : void
      {
         this.dayActivity.setInfo(param1,param2,param3);
      }
      
      public function setSign(param1:int, param2:String) : void
      {
         this.dayActivity.setSign(param1,param2);
      }
      
      public function setTime1(param1:int, param2:int) : void
      {
         this.dayActivity.setTime1(param1,param2);
      }
      
      public function setTime2(param1:int) : void
      {
         this.dayActivity.setTime2(param1);
      }
      
      public function setTime3(param1:int, param2:int, param3:int) : void
      {
         this.dayActivity.setTime3(param1,param2,param3);
      }
      
      public function setGoods(param1:Array) : void
      {
         this.dayActivity.setGoods(param1);
      }
      
      public function showLeijidengluCanvas() : void
      {
         this.activeactiveCanvas.visible = false;
         this.jianmian.visible = false;
         this.yaoqing.visible = false;
         this.denglu.visible = false;
         this.zaixian.visible = false;
         this.xianshiduihuan.visible = false;
         this.newsaffiche.visible = false;
         this.bossrefurbishPanel.visible = false;
         this.dayActivity.visible = false;
         this.leijidenglu.visible = true;
         this.activeCanvas.visible = false;
      }
      
      public function setLeijidengluData(param1:Array) : void
      {
         this.leijidenglu.setleijidengluData(param1);
      }
      
      public function showleijidengluTab(param1:Boolean, param2:int) : void
      {
         if(param1)
         {
         }
      }
      
      public function showRichanghuodongPanel() : void
      {
         this.activeactiveCanvas.visible = false;
         this.jianmian.visible = false;
         this.yaoqing.visible = false;
         this.denglu.visible = false;
         this.zaixian.visible = false;
         this.xianshiduihuan.visible = false;
         this.newsaffiche.visible = false;
         this.bossrefurbishPanel.visible = false;
         this.dayActivity.visible = false;
         this.leijidenglu.visible = false;
         this.activeCanvas.visible = true;
      }
      
      public function setHuodong(param1:Array) : void
      {
         this.activeCanvas.setHuodong(param1);
      }
      
      public function setPageCount(param1:int, param2:int) : void
      {
         this.activeCanvas.setPageCount(param1,param2);
      }
      
      public function setActiveHodong(param1:int, param2:String) : void
      {
         this.activeCanvas.setActiveHodong(param1,param2);
      }
      
      public function setGuajiPanel(param1:int, param2:int, param3:Array) : void
      {
         this.activeCanvas.setGuajiPanel(param1,param2,param3);
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         this.activeCanvas.onShowLv(param1);
      }
      
      public function addGuajilanNum(param1:int, param2:int) : void
      {
         this.activeCanvas.addGuajilanNum(param1,param2);
      }
      
      public function setYNyouhua(param1:int, param2:String) : void
      {
         this.ynyouhuaCanvas.setActiveHodong(param1,param2);
      }
   }
}

