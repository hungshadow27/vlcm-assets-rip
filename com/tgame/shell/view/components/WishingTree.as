package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class WishingTree extends FPanel
   {
      
      public static const UI_XUNZHANG_BTN_CLICK:String = "UI_XUNZHANG_BTN_CLICK";
      
      public static const UI_JIAOSHUI_BTN_CLICK:String = "UI_JIAOSHUI_BTN_CLICK";
      
      public static const UI_FRIENDLIST_CLICK:String = "UI_FRIENDLIST_CLICK";
      
      public static const UI_HAOYOUJIAOSHUI_BTN_CLICK:String = "UI_HAOYOUJIAOSHUI_BTN_CLICK";
      
      public static const UI_FRIEND_RECORD_BTN_CLICK:String = "UI_FRIEND_RECORD_BTN_CLICK";
      
      public static const UI_WISHINGTREECLOSE_CLICK:String = "UI_WISHINGTREECLOSE_CLICK";
      
      private var bgTree:DisplayObject;
      
      private var bgspr:Sprite;
      
      private var tree:DisplayObject;
      
      private var treespr:Sprite;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array = [];
      
      private var bloodMcSpr:Sprite;
      
      private var water:DisplayObject;
      
      private var waterspr:Sprite;
      
      private var xzbit:Bitmap;
      
      private var xzitem:ItemFace;
      
      private var bar:ColorBar;
      
      private var ft:FTextArea;
      
      private var xzBtn:SecondButton;
      
      private var waterBtn:SecondButton;
      
      private var friBtn:SecondButton;
      
      private var treeID:int;
      
      private var gongMc:MovieClip;
      
      private var loadUrl:String;
      
      private var gongMcSpr:Sprite;
      
      private var barFT:FTextArea;
      
      public function WishingTree()
      {
         super();
         width = 455;
         height = 500;
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("许愿树");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_WISHINGTREECLOSE_CLICK));
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.bgspr = new Sprite();
         this.bgspr.x = 10;
         this.bgspr.y = 0;
         addChild(this.bgspr);
         this.bgTree = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wishingTree/bg.swf");
         this.bgTree.x = 0;
         this.bgTree.y = 0;
         this.bgspr.addChild(this.bgTree);
         this.treespr = new Sprite();
         this.treespr.x = 10;
         this.treespr.y = 0;
         addChild(this.treespr);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 10 - 40;
         this.bloodMcSpr.y = 45;
         addChild(this.bloodMcSpr);
         this.tree = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wishingTree/1.swf");
         this.tree.x = 0;
         this.tree.y = 0;
         this.treespr.addChild(this.tree);
         this.waterspr = new Sprite();
         this.waterspr.x = 380;
         this.waterspr.y = 265;
         addChild(this.waterspr);
         this.xzbit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.xzbit.x = 30;
         this.xzbit.y = 375;
         addChild(this.xzbit);
         this.xzBtn = new SecondButton();
         this.xzBtn.x = 20;
         this.xzBtn.y = 420;
         this.xzBtn.label = LanResManager.getLanCommonTextWords("领取勋章");
         addChild(this.xzBtn);
         this.xzBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft = new FTextArea();
         this.ft.x = 110;
         this.ft.y = 380;
         this.ft.wordWrap = true;
         this.ft.width = 230;
         this.ft.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当小树苗成长为参天大树，便可领取2014年植树节纪念勋章。") + "<br>" + LanResManager.getLanCommonTextWords("每次浇水可以增加许愿树成长值60点。") + "<br>" + LanResManager.getLanCommonTextWords("浇水1小时后，方可再次浇水。") + "</font></textformat>";
         addChild(this.ft);
         this.waterBtn = new SecondButton();
         this.waterBtn.x = 350;
         this.waterBtn.y = 385;
         this.waterBtn.label = LanResManager.getLanCommonTextWords("前往浇水");
         addChild(this.waterBtn);
         this.waterBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.friBtn = new SecondButton();
         this.friBtn.x = 350;
         this.friBtn.y = 415;
         this.friBtn.label = LanResManager.getLanCommonTextWords("好友浇水");
         addChild(this.friBtn);
         this.friBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.gongMcSpr = new Sprite();
         this.gongMcSpr.x = 20;
         this.gongMcSpr.y = 340 + 5;
         addChild(this.gongMcSpr);
         this.barFT = new FTextArea();
         this.barFT.filters = Tools.blackWhiteFilter;
         this.barFT.x = 198;
         this.barFT.y = 345;
         addChild(this.barFT);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.xzBtn:
               dispatchEvent(new BaseEvent(UI_XUNZHANG_BTN_CLICK));
               break;
            case this.friBtn:
               dispatchEvent(new BaseEvent(UI_HAOYOUJIAOSHUI_BTN_CLICK));
               break;
            case this.waterBtn:
               dispatchEvent(new BaseEvent(UI_JIAOSHUI_BTN_CLICK,"",this.treeID));
         }
      }
      
      private function setJDT(param1:int) : void
      {
         this.gongMc = StaticValue.getMCByClassName("ui.watertree.loadingbar") as MovieClip;
         this.gongMcSpr.addChild(this.gongMc);
         this.gongMc.x = 0;
         this.gongMc.y = 0;
         this.gongMc.gotoAndStop(param1);
      }
      
      public function setInit(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var go:Goods;
         var loadUrl:String = null;
         var lv:int = param1;
         var state:int = param2;
         var goodID:int = param3;
         var now:int = param4;
         var max:int = param5;
         var treeid:int = param6;
         var goodBO:int = param7;
         this.setJDT(now / 70);
         this.barFT.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + now + "/" + max + "</font>";
         go = new Goods(goodID);
         this.xzitem = new ItemFace(go);
         this.xzitem.x = 32;
         this.xzitem.y = 377;
         addChild(this.xzitem);
         if(goodBO == 0)
         {
            this.xzitem.filters = Tools.blackWhiteFilter;
            this.xzBtn.enabled = false;
         }
         else
         {
            this.xzitem.filters = [];
            this.xzBtn.enabled = true;
         }
         this.treeID = treeid;
         if(this.treespr.numChildren > 0)
         {
            this.treespr.removeChildAt(0);
         }
         if(this.waterspr.numChildren > 0)
         {
            this.waterspr.removeChildAt(0);
         }
         if(state == 1)
         {
            this.water = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wishingTree/happy.swf");
         }
         else
         {
            this.water = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wishingTree/cry.swf");
         }
         this.water.x = 0;
         this.water.y = 0;
         this.waterspr.addChild(this.water);
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/wishingTree/" + lv + ".swf";
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         if(this.mcObj[lv] != null)
         {
            this.bloodMc = this.mcObj[lv];
            this.bloodMc.play();
            this.bloodMcSpr.addChild(this.bloodMc);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(bloodMc) && bloodMc.parent != null)
               {
                  bloodMc.stop();
                  bloodMc.parent.removeChild(bloodMc);
               }
               while(bloodMcSpr.numChildren > 0)
               {
                  bloodMcSpr.removeChildAt(0);
               }
               bloodMc = _loc2_.content as MovieClip;
               mcObj[lv] = bloodMc;
               if(bloodMc)
               {
                  bloodMcSpr.addChild(bloodMc);
               }
            },null,false,loadUrl);
         }
      }
   }
}

