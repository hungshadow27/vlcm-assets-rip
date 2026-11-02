package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.BossRefurbish.BiwuDahuiCanvas;
   import com.tgame.shell.view.components.BossRefurbish.KuafuFuQiCanvas;
   import com.tgame.shell.view.components.BossRefurbish.KuafuLunjianCanvas;
   import com.tgame.shell.view.components.BossRefurbish.XiangYangZhanChangCanvas;
   import com.tgame.shell.view.components.biwuCrossPlatform.HistoryCanvas;
   import com.tgame.shell.view.components.jingjichang.JingjiChangPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   
   public class conquerPanel extends FPanel
   {
      
      public static const UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_SHOW:String = "UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_SHOW";
      
      public static const UI_CONQUERPANEL_TESEWANFA_SHOW:String = "UI_CONQUERPANEL_TESEWANFA_SHOW";
      
      public static const UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LIST_ID:String = "UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LIST_ID";
      
      public static const UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LINGQUJIANGLI_ID:String = "UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LINGQUJIANGLI_ID";
      
      public static const UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LUNJIANTAI:String = "UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LUNJIANTAI";
      
      public static const UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_BAOGUOYUSHOUYI:String = "UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_BAOGUOYUSHOUYI";
      
      public static const UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_SHENGWANGSHANGDIAN:String = "UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_SHENGWANGSHANGDIAN";
      
      public static const UI_CONQUERPANEL_3V3JINGJICHANG_SHOW:String = "UI_CONQUERPANEL_3V3JINGJICHANG_SHOW";
      
      public static const UI_JINGJIPANEL_lINGQUJIAGNLI_BTN_CLICK:String = "UI_JINGJIPANEL_lINGQUJIAGNLI_BTN_CLICK";
      
      public static const UI_JINGJIPANEL_JINGJIGUIZECHAXUN_BTN_CLICK:String = "UI_JINGJIPANEL_JINGJIGUIZECHAXUN_BTN_CLICK";
      
      public static const UI_JINGJIPANEL_KAISHIJINGJI_BTN_CLICK:String = "UI_JINGJIPANEL_KAISHIJINGJI_BTN_CLICK";
      
      public static const UI_JINGJIPANEL_BAOGUOSHOUYIQUHUI_BTN_CLICK:String = "UI_JINGJIPANEL_BAOGUOSHOUYIQUHUI_BTN_CLICK";
      
      public static const UI_JINGJIPANEL_SHENGWANGSHANGDIANGOUWU_BTN_CLICK:String = "UI_JINGJIPANEL_SHENGWANGSHANGDIANGOUWU_BTN_CLICK";
      
      public static const UI_BIWUDAHUI_SHOW:String = "UI_BIWUDAHUI_SHOW";
      
      public static const UI_BIWUDAHUI_LINGJIANG_BTN_CLICK:String = "UI_BIWUDAHUI_LINGJIANG_BTN_CLICK";
      
      public static const UI_BIWUDAHUI_GUIZECHAXUN_BTN_CLICK:String = "UI_BIWUDAHUI_GUIZECHAXUN_BTN_CLICK";
      
      public static const UI_BIWUDAHUI_BAOGUOSHOUYIQUHUI_BTN_CLICK:String = "UI_BIWUDAHUI_BAOGUOSHOUYIQUHUI_BTN_CLICK";
      
      public static const UI_BIWUDAHUI_SHIJIANGUIZE_BTN_CLICK:String = "UI_BIWUDAHUI_SHIJIANGUIZE_BTN_CLICK";
      
      public static const UI_BIWUDAHUI_DUIJUELIUCHENGTU_BTN_CLICK:String = "UI_BIWUDAHUI_DUIJUELIUCHENGTU_BTN_CLICK";
      
      public static const UI_BIWUDAHUI_LIST_ID:String = "UI_BIWUDAHUI_LIST_ID";
      
      public static const UI_BIWUDAHUI_CHUANRU:String = "UI_BIWUDAHUI_CHUANRU";
      
      public static const UI_BIWUDAHUIPANEL_LIST_GET_PAGE:String = "UI_BIWUDAHUIPANEL_LIST_GET_PAGE";
      
      public static const UI_BIWUDAHUI_ZHUWEIOK_BTN_CLICK:String = "UI_BIWUDAHUI_ZHUWEIOK_BTN_CLICK";
      
      public static const UI_BIWUDAHUI_ZHUWEITIAOGUO_BTN_CLICK:String = "UI_BIWUDAHUI_ZHUWEITIAOGUO_BTN_CLICK";
      
      public static const UI_BIWUDAHUI_GUANZHAN_BTN_CLICK:String = "UI_BIWUDAHUI_GUANZHAN_BTN_CLICK";
      
      public static const UI_JINGJIPANEL_PARTICULAR_INFO_SHOW:String = "UI_JINGJIPANEL_PARTICULAR_INFO_SHOW";
      
      public static const UI_JINGJIPANEL_LIST_GET_PAGE:String = "UI_JINGJIPANEL_LIST_GET_PAGE";
      
      public static const UI_JINGJIPANEL_LIST_MUTUAL:String = "UI_JINGJIPANEL_LIST_MUTUAL";
      
      public static const UI_XIANGYANGZHANCHANGPANEL_SHOW:String = "UI_XIANGYANGZHANCHANGPANEL_SHOW";
      
      public static const UI_XIANGYANGZHANCHANG_BAOGUOSHOUYIQUHUI_BTN_CLICK:String = "UI_XIANGYANGZHANCHANG_BAOGUOSHOUYIQUHUI_BTN_CLICK";
      
      public static const UI_XIANGYANGZHANCHANG_BAOMING:String = "UI_XIANGYANGZHANCHANG_BAOMING";
      
      public static const UI_XIANGYANGZHANCHANG_AGAIN:String = "UI_XIANGYANGZHANCHANG_AGAIN";
      
      public static const UI_YN_XIANGYANGZHANCHANGRANK:String = "UI_YN_XIANGYANGZHANCHANGRANK";
      
      public static const UI_KUAPINGTAI_HISTORY_SHOW:String = "UI_KUAPINGTAI_HISTORY_SHOW";
      
      public static const UI_FUQI_SHOW:String = "UI_FUQI_SHOW";
      
      public static const UI_FUQI_GIFT_CLICK:String = "UI_FUQI_LINGJIANG_CLICK";
      
      public static const UI_FUQI_START_CLICK:String = "UI_FUQI_KAISHI_CLICK";
      
      public static const UI_FUQI_BAG_CLICK:String = "UI_FUQI_BAOGUO_CLICK";
      
      public static const UI_FUQI_SHOP_CLICK:String = "UI_FUQI_SHOP_CLICK";
      
      public static const UI_FUQI_SHOW_BY_PAGE:String = "UI_FUQI_SHOW_BY_PAGE";
      
      public static const UI_FUQI_SHOW_AVATAR:String = "UI_FUQI_SHOW_AVATAR";
      
      public static const ConquerPanelHeight:int = 408;
      
      public var tabBar:FTabBar;
      
      private var conquertargetPanel:ConquerTargetPanel;
      
      private var jingjichang:JingjiChangPanel;
      
      public var kuafuLunjianCanvas:KuafuLunjianCanvas;
      
      public var biwudahuiCanvas:BiwuDahuiCanvas;
      
      public var xiangyangzhanchangCanvas:XiangYangZhanChangCanvas;
      
      public var historyCanvas:HistoryCanvas;
      
      public var fuQiCanvas:KuafuFuQiCanvas;
      
      public function conquerPanel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 610;
         height = 440;
         titleText = LanResManager.getLanCommonTextWords("征服");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.kuafuLunjianCanvas = new KuafuLunjianCanvas();
         this.kuafuLunjianCanvas.$parent = this;
         addChild(this.kuafuLunjianCanvas);
         this.kuafuLunjianCanvas.x = 10;
         this.kuafuLunjianCanvas.y = 22;
         this.biwudahuiCanvas = new BiwuDahuiCanvas();
         this.biwudahuiCanvas.$parent = this;
         addChild(this.biwudahuiCanvas);
         this.biwudahuiCanvas.x = 10;
         this.biwudahuiCanvas.y = 22;
         this.xiangyangzhanchangCanvas = new XiangYangZhanChangCanvas();
         this.xiangyangzhanchangCanvas.$parent = this;
         addChild(this.xiangyangzhanchangCanvas);
         this.xiangyangzhanchangCanvas.x = 10;
         this.xiangyangzhanchangCanvas.y = 22;
         this.historyCanvas = new HistoryCanvas();
         this.historyCanvas.$parent = this;
         addChild(this.historyCanvas);
         this.historyCanvas.x = 10;
         this.historyCanvas.y = 22;
         this.jingjichang = new JingjiChangPanel();
         this.jingjichang.$parent = this;
         addChild(this.jingjichang);
         this.jingjichang.x = 10;
         this.jingjichang.y = 22;
         this.fuQiCanvas = new KuafuFuQiCanvas();
         this.fuQiCanvas.$parent = this;
         addChild(this.fuQiCanvas);
         this.fuQiCanvas.x = 10;
         this.fuQiCanvas.y = 22;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.kuafuLunjianCanvas.bgImg);
         _loc1_.push(this.jingjichang.bgImg);
         _loc1_.push(this.biwudahuiCanvas.bgImg);
         this.DynamicManageImages = _loc1_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("跨服论剑天下第一"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("3V3跨服竞技场"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("比武大会"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("跨服襄阳战场"),this.onTabClick);
         if(GameState["gongneng1001"])
         {
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("历史战况"),this.onTabClick);
         }
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("夫妻竞技"),this.onTabClick);
         addChild(this.tabBar);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("跨服论剑天下第一"):
               dispatchEvent(new BaseEvent(UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("3V3跨服竞技场"):
               dispatchEvent(new BaseEvent(UI_CONQUERPANEL_3V3JINGJICHANG_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("比武大会"):
               dispatchEvent(new BaseEvent(UI_BIWUDAHUI_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("跨服襄阳战场"):
               dispatchEvent(new BaseEvent(UI_XIANGYANGZHANCHANGPANEL_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("历史战况"):
               dispatchEvent(new BaseEvent(UI_KUAPINGTAI_HISTORY_SHOW));
               dispatchEvent(new BaseEvent(BiwuCrossPlatform_Panel.UI_HISTORYPANEL_LIST_GET_PAGE));
               break;
            case LanResManager.getLanCommonTextWords("夫妻竞技"):
               dispatchEvent(new BaseEvent(UI_FUQI_SHOW));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function showTesewanfa() : void
      {
         this.jingjichang.visible = false;
      }
      
      public function showKuafu() : void
      {
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("跨服论剑天下第一"));
         this.kuafuLunjianCanvas.visible = true;
         this.jingjichang.visible = false;
         this.biwudahuiCanvas.visible = false;
         this.xiangyangzhanchangCanvas.visible = false;
         this.historyCanvas.visible = false;
         this.fuQiCanvas.visible = false;
      }
      
      public function showJingjichang() : void
      {
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("3V3跨服竞技场"));
         this.jingjichang.visible = true;
         this.kuafuLunjianCanvas.visible = false;
         this.biwudahuiCanvas.visible = false;
         this.xiangyangzhanchangCanvas.visible = false;
         this.historyCanvas.visible = false;
         this.fuQiCanvas.visible = false;
      }
      
      public function showBiwudahui() : void
      {
         this.biwudahuiCanvas.clear();
         this.biwudahuiCanvas.setInitialize([]);
         this.biwudahuiCanvas.setShangbang(false,false);
         this.biwudahuiCanvas.visible = true;
         this.kuafuLunjianCanvas.visible = false;
         this.jingjichang.visible = false;
         this.xiangyangzhanchangCanvas.visible = false;
         this.historyCanvas.visible = false;
         this.fuQiCanvas.visible = false;
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("比武大会"));
      }
      
      public function setKuafuInitialize(param1:Array) : void
      {
         this.kuafuLunjianCanvas.setInitialize(param1);
      }
      
      public function setShangbang(param1:int, param2:int, param3:Boolean) : void
      {
         this.kuafuLunjianCanvas.setShangbang(param1,param2,param3);
      }
      
      public function setICOState(param1:Boolean, param2:int, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int, param9:Boolean, param10:int, param11:Boolean, param12:int, param13:Boolean, param14:int, param15:Boolean, param16:int) : void
      {
         this.kuafuLunjianCanvas.ico.setState(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16);
      }
      
      public function setICOXiantian(param1:Boolean, param2:int, param3:int, param4:int) : void
      {
         this.kuafuLunjianCanvas.ico.setXiantian(param1,param2,param3,param4);
      }
      
      public function setICOHuXinYao(param1:Boolean) : void
      {
         this.kuafuLunjianCanvas.ico.setHuXinYao(param1);
      }
      
      public function setICONiXi(param1:Boolean) : void
      {
         this.kuafuLunjianCanvas.ico.setNiXi(param1);
      }
      
      public function setICOFengHuang(param1:Boolean) : void
      {
         this.kuafuLunjianCanvas.ico.setFengHuang(param1);
      }
      
      public function setICORouti(param1:Boolean) : void
      {
         this.kuafuLunjianCanvas.ico.setRouti(param1);
      }
      
      public function setICOWuhun(param1:int, param2:Boolean, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:Boolean, param9:int) : void
      {
         this.kuafuLunjianCanvas.ico.setWuhun(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setKuafuAvatar(param1:BitmapData, param2:Boolean = false) : void
      {
         this.kuafuLunjianCanvas.avatar = param1;
         if(param2)
         {
            this.kuafuLunjianCanvas.setAvaterXY(param2);
         }
      }
      
      public function showGuizechaxun() : void
      {
         this.kuafuLunjianCanvas.showGuizechaxun();
      }
      
      public function onCloseGuizechaxun() : void
      {
         this.kuafuLunjianCanvas.onCloseGuizechaxun();
      }
      
      public function setYupei(param1:Goods = null) : void
      {
      }
      
      public function setFlag(param1:int) : void
      {
      }
      
      public function setTitle(param1:Boolean = true, param2:String = "", param3:String = "") : void
      {
         this.jingjichang.setTitle(param1,param2,param3);
      }
      
      public function setList(param1:XML, param2:String, param3:int, param4:int, param5:Boolean = false, param6:Boolean = false) : void
      {
         this.jingjichang.setList(param1,param2,param3,param4,param5,param6);
      }
      
      public function setItem(param1:Array, param2:BitmapData, param3:int, param4:int, param5:int, param6:Boolean, param7:int = 0) : void
      {
         this.jingjichang.setItem(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setCongBaiAndBiShi(param1:int, param2:int) : void
      {
         this.jingjichang.setCongBaiAndBiShi(param1,param2);
      }
      
      public function setJingjiAavatar(param1:BitmapData, param2:Boolean = false) : void
      {
         this.jingjichang.setAavatar(param1);
         if(param2)
         {
            this.jingjichang.setAvaterXY(param2);
         }
      }
      
      public function setJingjiFlag(param1:int) : void
      {
         this.jingjichang.setFlag(param1);
      }
      
      public function setJingjiYupei(param1:Goods) : void
      {
         this.jingjichang.setYupei(param1);
      }
      
      public function setICOXiantian3V3(param1:Boolean, param2:int, param3:int, param4:int) : void
      {
         this.jingjichang.ico.setXiantian(param1,param2,param3,param4);
      }
      
      public function setICOHuXinYao3V3(param1:Boolean) : void
      {
         this.jingjichang.ico.setHuXinYao(param1);
      }
      
      public function setICONiXi3V3(param1:Boolean) : void
      {
         this.jingjichang.ico.setNiXi(param1);
      }
      
      public function setICOFengHuang3V3(param1:Boolean) : void
      {
         this.jingjichang.ico.setFengHuang(param1);
      }
      
      public function setICORouti3V3(param1:Boolean) : void
      {
         this.jingjichang.ico.setRouti(param1);
      }
      
      public function setICOWuhun3V3(param1:int, param2:Boolean, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:Boolean, param9:int) : void
      {
         this.jingjichang.ico.setWuhun(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setICOWuhuns(param1:int, param2:Boolean, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:Boolean, param9:int) : void
      {
         this.biwudahuiCanvas.ico.setWuhun(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setJingjiClear() : void
      {
         this.jingjichang.clear();
      }
      
      public function setJianJiICOState(param1:Boolean, param2:int, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int, param9:Boolean, param10:int, param11:Boolean, param12:int, param13:Boolean, param14:int, param15:Boolean, param16:int) : void
      {
         this.jingjichang.setJianJiICOState(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16);
      }
      
      public function setSiShengShouState(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.jingjichang.setSiShengShouState(param1,param2,param3,param4);
      }
      
      public function setJianJiShangbang(param1:int, param2:int, param3:Boolean) : void
      {
         this.jingjichang.setJianJiShangbang(param1,param2,param3);
      }
      
      public function setInitialize(param1:Array, param2:int) : void
      {
         this.biwudahuiCanvas.setInitialize(param1,param2);
      }
      
      public function setShangbangs(param1:Boolean, param2:Boolean) : void
      {
         this.biwudahuiCanvas.setShangbang(param1,param2);
      }
      
      public function setavatars(param1:BitmapData, param2:Boolean = false) : void
      {
         this.biwudahuiCanvas.avatar = param1;
         if(param2)
         {
            this.biwudahuiCanvas.setAvaterXY(param2);
         }
      }
      
      public function setICOXiantians(param1:Boolean, param2:int, param3:int, param4:int) : void
      {
         this.biwudahuiCanvas.setICOXiantian(param1,param2,param3,param4);
      }
      
      public function setICOHuXinYaos(param1:Boolean) : void
      {
         this.biwudahuiCanvas.setICOHuXinYao(param1);
      }
      
      public function setICONiXis(param1:Boolean) : void
      {
         this.biwudahuiCanvas.setICONiXi(param1);
      }
      
      public function setICOFengHuangs(param1:Boolean) : void
      {
         this.biwudahuiCanvas.ico.setFengHuang(param1);
      }
      
      public function setICORoutis(param1:Boolean) : void
      {
         this.biwudahuiCanvas.setICORouti(param1);
      }
      
      public function setStarState(param1:Boolean, param2:int, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int, param9:Boolean, param10:int, param11:Boolean, param12:int, param13:Boolean, param14:int, param15:Boolean, param16:int) : void
      {
         this.biwudahuiCanvas.setStarState(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16);
      }
      
      public function setTime(param1:String) : void
      {
         this.biwudahuiCanvas.setTime(param1);
      }
      
      public function showDuijue() : void
      {
         this.biwudahuiCanvas.showDuijue();
      }
      
      public function onCloseDuijue() : void
      {
         this.biwudahuiCanvas.onCloseDuijue();
      }
      
      public function setPageList(param1:int, param2:int, param3:Boolean = false, param4:Boolean = false) : void
      {
         this.biwudahuiCanvas.setPageList(param1,param2,param3,param4);
      }
      
      public function showXiangYangZhanChang() : void
      {
         this.jingjichang.visible = false;
         this.kuafuLunjianCanvas.visible = false;
         this.biwudahuiCanvas.visible = false;
         this.xiangyangzhanchangCanvas.visible = true;
         this.historyCanvas.visible = false;
         this.fuQiCanvas.visible = false;
      }
      
      public function showXiangYangGuiZe() : void
      {
         this.xiangyangzhanchangCanvas.showGuize();
      }
      
      public function showKuapingtaiHistory() : void
      {
         this.jingjichang.visible = false;
         this.kuafuLunjianCanvas.visible = false;
         this.biwudahuiCanvas.visible = false;
         this.xiangyangzhanchangCanvas.visible = false;
         this.historyCanvas.visible = true;
         this.fuQiCanvas.visible = false;
      }
      
      public function setInitialize_History(param1:Array, param2:int) : void
      {
         this.historyCanvas.setInitialize(param1,param2);
      }
      
      public function setPageList_History(param1:int, param2:int, param3:Boolean = false, param4:Boolean = false) : void
      {
         this.historyCanvas.setPageList(param1,param2,param3,param4);
      }
      
      public function showFuQiJingJi() : void
      {
         this.biwudahuiCanvas.visible = false;
         this.kuafuLunjianCanvas.visible = false;
         this.jingjichang.visible = false;
         this.xiangyangzhanchangCanvas.visible = false;
         this.historyCanvas.visible = false;
         this.fuQiCanvas.visible = true;
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("夫妻竞技"));
      }
      
      public function setFuQiRank(param1:int, param2:int, param3:Array, param4:int, param5:Boolean) : void
      {
         this.fuQiCanvas.setInitialize(param3,param1,param2,param4,param5);
      }
      
      public function setFuQiAvatar(param1:int, param2:BitmapData, param3:Boolean = false) : void
      {
         this.fuQiCanvas.setAvatar(param1,param2,param3);
      }
   }
}

