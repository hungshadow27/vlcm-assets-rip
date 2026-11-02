package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.shell.view.components.biwuCrossPlatform.BiwuDahuiCanvas;
   import com.tgame.shell.view.components.biwuCrossPlatform.BiwuDahuiGuizeCanvas;
   import com.tgame.shell.view.components.biwuCrossPlatform.BiwuDahuiTimeGuizeCanvas;
   import com.tgame.shell.view.components.biwuCrossPlatform.HistoryCanvas;
   import com.tgame.shell.view.components.biwuCrossPlatform.PingtaiDuijueCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   
   public class BiwuCrossPlatform_Panel extends FPanel
   {
      
      public static const UI_BIWUDAHUI_SHOW:String = "UI_BIWUDAHUI_SHOW";
      
      public static const UI_BIWUDAHUI_GUIZECHAXUN_BTN_CLICK:String = "UI_BIWUDAHUI_GUIZECHAXUN_BTN_CLICK";
      
      public static const UI_BIWUDAHUI_SHIJIANGUIZE_BTN_CLICK:String = "UI_BIWUDAHUI_SHIJIANGUIZE_BTN_CLICK";
      
      public static const UI_BAOMING_BTN_CLICK:String = "UI_BAOMING_BTN_CLICK";
      
      public static const UI_BIWUDAHUI_DUIJUELIUCHENGTU_BTN_CLICK:String = "UI_BIWUDAHUI_DUIJUELIUCHENGTU_BTN_CLICK";
      
      public static const UI_KUAFUBAOGUO_BTN_CLICK:String = "UI_KUAFUBAOGUO_BTN_CLICK";
      
      public static const UI_BIWUDAHUI_CHUANRU:String = "UI_BIWUDAHUI_CHUANRU";
      
      public static const UI_BIWUDAHUIPANEL_LIST_GET_PAGE:String = "UI_BIWUDAHUIPANEL_LIST_GET_PAGE";
      
      public static const UI_HISTORYPANEL_LIST_GET_PAGE:String = "UI_HISTORYPANEL_LIST_GET_PAGE";
      
      public static const UI_BIWUDAHUI_ZHUWEIOK_BTN_CLICK:String = "UI_BIWUDAHUI_ZHUWEIOK_BTN_CLICK";
      
      public static const UI_BIWUDAHUI_ZHUWEITIAOGUO_BTN_CLICK:String = "UI_BIWUDAHUI_ZHUWEITIAOGUO_BTN_CLICK";
      
      public static const UI_BIWUDAHUI_GUANZHAN_BTN_CLICK:String = "UI_BIWUDAHUI_GUANZHAN_BTN_CLICK";
      
      public static const UI_BIWUDAHUI_LINGJIANG_BTN_CLICK:String = "UI_BIWUDAHUI_LINGJIANG_BTN_CLICK";
      
      public static const UI_BIWUDAHUI_LIST_ID:String = "UI_BIWUDAHUI_LIST_ID";
      
      public var tabBar:FTabBar;
      
      private var pingtaiDuijueCanvas:PingtaiDuijueCanvas;
      
      public var biwudahuiCanvas:BiwuDahuiCanvas;
      
      public var historyCanvas:HistoryCanvas;
      
      private var guizheChaxunBtn:SecondButton;
      
      private var shijianguizeBtn:SecondButton;
      
      private var baomingBtn:SecondButton;
      
      private var liuchengtuBtn:SecondButton;
      
      private var baoguoBtn:SecondButton;
      
      private var chuanruBtn:SecondButton;
      
      public var biwudahuiguize:BiwuDahuiGuizeCanvas;
      
      public var biwudahuiTimeguize:BiwuDahuiTimeGuizeCanvas;
      
      public var biwuduijue:BiwuDuijue_Panel;
      
      public function BiwuCrossPlatform_Panel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 610;
         height = 440;
         titleText = LanResManager.getLanCommonTextWords("跨平台比武大会");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.pingtaiDuijueCanvas = new PingtaiDuijueCanvas();
         this.pingtaiDuijueCanvas.$parent = this;
         addChild(this.pingtaiDuijueCanvas);
         this.pingtaiDuijueCanvas.x = 10;
         this.pingtaiDuijueCanvas.y = 22;
         this.biwudahuiCanvas = new BiwuDahuiCanvas();
         this.biwudahuiCanvas.$parent = this;
         addChild(this.biwudahuiCanvas);
         this.biwudahuiCanvas.x = 10;
         this.biwudahuiCanvas.y = 22;
         this.historyCanvas = new HistoryCanvas();
         this.historyCanvas.$parent = this;
         addChild(this.historyCanvas);
         this.historyCanvas.x = 10;
         this.historyCanvas.y = 22;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.biwudahuiCanvas.bgImg);
         this.DynamicManageImages = _loc1_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("平台对决"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("英雄表"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("历史战况"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.guizheChaxunBtn = new SecondButton();
         this.guizheChaxunBtn.label = LanResManager.getLanCommonTextWords("比武规则");
         addChild(this.guizheChaxunBtn);
         this.guizheChaxunBtn.x = 10;
         this.guizheChaxunBtn.y = 353 + 20;
         this.guizheChaxunBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shijianguizeBtn = new SecondButton();
         this.shijianguizeBtn.label = LanResManager.getLanCommonTextWords("比武时间规则及要求");
         addChild(this.shijianguizeBtn);
         this.shijianguizeBtn.x = 90 + 10;
         this.shijianguizeBtn.y = 353 + 20;
         this.shijianguizeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.baomingBtn = new SecondButton();
         this.baomingBtn.label = LanResManager.getLanCommonTextWords("报名");
         addChild(this.baomingBtn);
         this.baomingBtn.x = 287;
         this.baomingBtn.y = 353 + 20;
         this.baomingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.liuchengtuBtn = new SecondButton();
         this.liuchengtuBtn.label = LanResManager.getLanCommonTextWords("对决流程图");
         addChild(this.liuchengtuBtn);
         this.liuchengtuBtn.x = 355;
         this.liuchengtuBtn.y = 353 + 20;
         this.liuchengtuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.baoguoBtn = new SecondButton();
         this.baoguoBtn.label = LanResManager.getLanCommonTextWords("跨服包裹");
         addChild(this.baoguoBtn);
         this.baoguoBtn.x = 435;
         this.baoguoBtn.y = 353 + 20;
         this.baoguoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.chuanruBtn = new SecondButton();
         this.chuanruBtn.label = LanResManager.getLanCommonTextWords("传入比武场地");
         addChild(this.chuanruBtn);
         this.chuanruBtn.x = 523;
         this.chuanruBtn.y = 353 + 20;
         this.chuanruBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function setPos() : void
      {
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("平台对决"):
               this.pingtaiDuijueCanvas.visible = true;
               this.biwudahuiCanvas.visible = false;
               this.historyCanvas.visible = false;
               break;
            case LanResManager.getLanCommonTextWords("英雄表"):
               dispatchEvent(new BaseEvent(UI_BIWUDAHUI_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("历史战况"):
               dispatchEvent(new BaseEvent(UI_HISTORYPANEL_LIST_GET_PAGE));
               this.pingtaiDuijueCanvas.visible = false;
               this.biwudahuiCanvas.visible = false;
               this.historyCanvas.visible = true;
         }
      }
      
      public function showBiwudahui() : void
      {
         this.biwudahuiCanvas.clear();
         this.biwudahuiCanvas.setInitialize([]);
         this.biwudahuiCanvas.setShangbang(false,false);
         this.biwudahuiCanvas.visible = true;
         this.pingtaiDuijueCanvas.visible = false;
         this.historyCanvas.visible = false;
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("英雄表"));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.guizheChaxunBtn:
               this.showGuize();
               dispatchEvent(new BaseEvent(UI_BIWUDAHUI_GUIZECHAXUN_BTN_CLICK));
               break;
            case this.shijianguizeBtn:
               this.showTimeGuize();
               break;
            case this.baomingBtn:
               dispatchEvent(new BaseEvent(UI_BAOMING_BTN_CLICK));
               break;
            case this.liuchengtuBtn:
               dispatchEvent(new BaseEvent(UI_BIWUDAHUI_DUIJUELIUCHENGTU_BTN_CLICK));
               break;
            case this.baoguoBtn:
               dispatchEvent(new BaseEvent(UI_KUAFUBAOGUO_BTN_CLICK));
               break;
            case this.chuanruBtn:
               dispatchEvent(new BaseEvent(UI_BIWUDAHUI_CHUANRU));
         }
      }
      
      public function setInitialize(param1:Array, param2:int) : void
      {
         this.biwudahuiCanvas.setInitialize(param1,param2);
      }
      
      public function setInitialize_History(param1:Array, param2:int) : void
      {
         this.historyCanvas.setInitialize(param1,param2);
      }
      
      public function setShangbangs(param1:Boolean, param2:Boolean) : void
      {
         this.biwudahuiCanvas.setShangbang(param1,param2);
      }
      
      public function setavatars(param1:BitmapData) : void
      {
         this.biwudahuiCanvas.avatar = param1;
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
      
      public function setICOWuhuns(param1:int, param2:Boolean, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:Boolean, param9:int) : void
      {
         this.biwudahuiCanvas.ico.setWuhun(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setStarState(param1:Boolean, param2:int, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int, param9:Boolean, param10:int, param11:Boolean, param12:int, param13:Boolean, param14:int, param15:Boolean, param16:int) : void
      {
         this.biwudahuiCanvas.setStarState(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16);
      }
      
      public function setSiShengShouState(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.biwudahuiCanvas.setSiShengShouState(param1,param2,param3,param4);
      }
      
      public function showGuize() : void
      {
         if(!this.biwudahuiguize)
         {
            this.biwudahuiguize = new BiwuDahuiGuizeCanvas();
         }
         this.biwudahuiguize.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.biwudahuiguize);
         this.biwudahuiguize.x = (GameConfig.sceneWidth - this.biwudahuiguize.width) / 2;
         this.biwudahuiguize.y = (GameConfig.sceneHeight - this.biwudahuiguize.height) / 2;
      }
      
      public function onCloseGuize() : void
      {
         this.biwudahuiguize.onClose();
      }
      
      public function showTimeGuize() : void
      {
         if(!this.biwudahuiTimeguize)
         {
            this.biwudahuiTimeguize = new BiwuDahuiTimeGuizeCanvas();
         }
         this.biwudahuiTimeguize.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.biwudahuiTimeguize);
         this.biwudahuiTimeguize.x = (GameConfig.sceneWidth - this.biwudahuiTimeguize.width) / 2;
         this.biwudahuiTimeguize.y = (GameConfig.sceneHeight - this.biwudahuiTimeguize.height) / 2;
      }
      
      public function setData(param1:Object) : void
      {
         if(!this.pingtaiDuijueCanvas)
         {
            this.pingtaiDuijueCanvas = new PingtaiDuijueCanvas();
         }
         this.pingtaiDuijueCanvas.setData(param1.time,param1.pingtai);
         if(!this.biwudahuiTimeguize)
         {
            this.biwudahuiTimeguize = new BiwuDahuiTimeGuizeCanvas();
         }
         this.biwudahuiTimeguize.setTime(param1.rule);
      }
      
      public function onCloseTimeGuize() : void
      {
         this.biwudahuiguize.onClose();
      }
      
      public function showDuijue() : void
      {
         if(!this.biwuduijue)
         {
            this.biwuduijue = new BiwuDuijue_Panel();
         }
         this.biwuduijue.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.biwuduijue);
         this.biwuduijue.x = (GameConfig.sceneWidth - this.biwuduijue.width) / 2;
         this.biwuduijue.y = (GameConfig.sceneHeight - this.biwuduijue.height) / 2;
      }
      
      public function onCloseDuijue() : void
      {
         this.biwuduijue.onClose();
      }
      
      public function setPageList(param1:int, param2:int, param3:Boolean = false, param4:Boolean = false) : void
      {
         this.biwudahuiCanvas.setPageList(param1,param2,param3,param4);
      }
      
      public function setPageList_History(param1:int, param2:int, param3:Boolean = false, param4:Boolean = false) : void
      {
         this.historyCanvas.setPageList(param1,param2,param3,param4);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setAvaterXY(param1:Boolean, param2:int = 0, param3:int = 0) : void
      {
         this.biwudahuiCanvas.setAvaterXY(param1,param2,param3);
      }
   }
}

