package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.BitmapFilter;
   import flash.filters.GlowFilter;
   import flash.text.*;
   import flash.utils.Timer;
   
   public class ShouYuanChouJiangPanel extends FPanel
   {
      
      public static const UI_KongMingLock_START_CLICK:String = "UI_KongMingLock_START_CLICK";
      
      public static const UI_KongMingLock_LINGJIANG_CLICK:String = "UI_KongMingLock_LINGJIANG_CLICK";
      
      public static const UI_KongMingLock_START_LINGJIANG_CLICK:String = "UI_KongMingLock_START_LINGJIANG_CLICK";
      
      public static const UI_KongMingLock_LINGJIANG_START_CLICK:String = "UI_KongMingLock_LINGJIANG_START_CLICK";
      
      public static const UI_KongMingLock_KEYILINGJIANG_CLICK:String = "UI_KongMingLock_KEYILINGJIANG_CLICK";
      
      public static const UI_KongMingLock_SHUAXIN_CLICK:String = "UI_KongMingLock_SHUAXIN_CLICK";
      
      private var StartBtn:SecondButton;
      
      private var LingjiangBtn:SecondButton;
      
      public var slots:Sprite;
      
      private var arrAggregate:Array;
      
      private var myTimer3:Timer;
      
      private var Ti:int = 0;
      
      private var result:int;
      
      private var lbtt1:FLabel;
      
      private var lbtt2:FLabel;
      
      private var bit:Bitmap;
      
      public var ZhuandongPd:Boolean;
      
      private var shuaXinBtn:SecondButton;
      
      private var csBtn:SecondButton;
      
      private var hasWeiLingQu:Boolean;
      
      private var xingYunFta:FTextArea;
      
      private var goodsId:int;
      
      private var newGoodsId:int;
      
      private var isShouYuanChouJiang:Boolean = false;
      
      private var lingQuPanel:ItemTiHuanPanel;
      
      public var mcSpr:Sprite;
      
      private var luckMc:MovieClip;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var luckCount:int;
      
      private var sd:int = 0;
      
      public function ShouYuanChouJiangPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         super();
         skin = "panel";
         showCloseButton = true;
         this.dragRestrict = false;
         width = 289;
         height = 315 + 30 + 10;
         titleText = LanResManager.getLanCommonTextWords("兽元武学");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         bg = new Bitmap();
         bg.name = "ui.kongminglock.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         this.bit = StaticValue.getBitmapByClassName("ui.jiemiJiangpin.txt");
         addChild(this.bit);
         this.bit.x = 90;
         this.bit.y = 82;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         this.StartBtn = new SecondButton();
         this.StartBtn.label = LanResManager.getLanCommonTextWords("开始");
         this.StartBtn.enabled = false;
         addChild(this.StartBtn);
         this.StartBtn.x = 156;
         this.StartBtn.y = 90;
         this.StartBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.LingjiangBtn = new SecondButton();
         this.LingjiangBtn.label = LanResManager.getLanCommonTextWords("领奖");
         this.LingjiangBtn.enabled = false;
         addChild(this.LingjiangBtn);
         this.LingjiangBtn.x = 156;
         this.LingjiangBtn.y = 120;
         this.LingjiangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shuaXinBtn = new SecondButton();
         this.shuaXinBtn.label = LanResManager.getLanCommonTextWords("刷新");
         this.shuaXinBtn.enabled = true;
         this.shuaXinBtn.visible = false;
         addChild(this.shuaXinBtn);
         this.shuaXinBtn.x = 156;
         this.shuaXinBtn.y = 150;
         this.shuaXinBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.xingYunFta = new FTextArea();
         with(this.xingYunFta)
         {
            x = 20;
            y = 305 - 40;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("幸运值：");
         }
         this.xingYunFta.visible = true;
         addChild(this.xingYunFta);
         this.mcSpr = new Sprite();
         this.mcSpr.x = 25;
         this.mcSpr.y = 280;
         addChild(this.mcSpr);
         this.mcSpr.addEventListener(MouseEvent.MOUSE_OVER,this.onTips);
         this.mcSpr.addEventListener(MouseEvent.MOUSE_OUT,this.onTips);
         this.slots = new Sprite();
         with(this.slots)
         {
            x = 20;
            y = 11;
            doubleClickEnabled = true;
         }
         addChild(this.slots);
      }
      
      private function onTips(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.mcSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onTips);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("首次修炼之后，每次点击开始将累计增加的幸运值，当幸运值到达时（最高为），将几率获得加成层的武学。") + "<br>" + LanResManager.getLanCommonTextWords("幸运值到达时，玩家获得层的武学后幸运值将被清空，从再开始累计。") + "</font>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.mcSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onTips);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var str:String = null;
         var e:MouseEvent = param1;
         switch(e.target)
         {
            case this.StartBtn:
               this.showSelectPanel(false);
               dispatchEvent(new BaseEvent(UI_KongMingLock_START_CLICK));
               break;
            case this.LingjiangBtn:
               if(this.isShouYuanChouJiang)
               {
                  if(this.goodsId > 0)
                  {
                     this.showSelectPanel(true);
                     this.lingQuPanel.setItem(new Goods(this.goodsId),new Goods(this.newGoodsId));
                  }
                  else
                  {
                     dispatchEvent(new BaseEvent(UI_KongMingLock_LINGJIANG_CLICK,"",3));
                  }
               }
               else
               {
                  dispatchEvent(new BaseEvent(UI_KongMingLock_LINGJIANG_CLICK));
               }
               break;
            case this.shuaXinBtn:
               this.showSelectPanel(false);
               if(this.hasWeiLingQu)
               {
                  str = LanResManager.getLanCommonTextWords("你的武学还没有领取是否要执行刷新功能？") + "<br><br><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("注:每次刷新将消耗5元宝。") + "</font><br>" + LanResManager.getLanCommonTextWords("刷新后已经抽中的武学将消失，为了避免损失请慎重使用。");
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        dispatchEvent(new BaseEvent(UI_KongMingLock_SHUAXIN_CLICK));
                     }
                  },true);
               }
               else
               {
                  dispatchEvent(new BaseEvent(UI_KongMingLock_SHUAXIN_CLICK));
               }
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.ZhuandongPd)
         {
            return;
         }
         if(this.hasWeiLingQu)
         {
            if(this.goodsId > 0)
            {
               this.showSelectPanel(true);
               this.lingQuPanel.setItem(new Goods(this.goodsId),new Goods(this.newGoodsId));
            }
            else
            {
               dispatchEvent(new BaseEvent(UI_KongMingLock_LINGJIANG_CLICK,"",3));
            }
         }
         else
         {
            POPWindowManager.closeWindow();
         }
      }
      
      private function Turn(param1:TimerEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(this.myTimer3)
         {
            this.myTimer3.stop();
         }
         var _loc2_:BitmapFilter = new GlowFilter(16776960);
         var _loc3_:Array = new Array();
         _loc3_.push(_loc2_);
         if(this.Ti > this.arrAggregate.length - 1)
         {
            this.Ti = 0;
         }
         this.arrAggregate[this.Ti].filters = _loc3_;
         var _loc4_:int = this.Ti;
         if(_loc4_ == 0)
         {
            _loc4_ = 15;
         }
         else
         {
            _loc4_--;
         }
         if(this.arrAggregate[_loc4_].filters != null)
         {
            this.arrAggregate[_loc4_].filters = null;
         }
         ++this.Ti;
         ++this.sd;
         if(this.sd < 8)
         {
            _loc5_ = int(250 - this.sd * 30);
            this.myTimer3 = new Timer(_loc5_,1);
            this.myTimer3.start();
            this.myTimer3.addEventListener(TimerEvent.TIMER,this.Turn);
         }
         else if(this.sd > 3 * 16 + this.result + 6 && this.sd < 4 * 16 + this.result)
         {
            _loc6_ = int((this.sd - (3 * 16 + this.result + 6) + 1) * 50);
            this.myTimer3 = new Timer(_loc6_,1);
            this.myTimer3.start();
            this.myTimer3.addEventListener(TimerEvent.TIMER,this.Turn);
         }
         else if(this.sd == 4 * 16 + this.result)
         {
            this.myTimer3.addEventListener(TimerEvent.TIMER_COMPLETE,this.TurnClose);
         }
         else
         {
            this.myTimer3 = new Timer(45,1);
            this.myTimer3.start();
            this.myTimer3.addEventListener(TimerEvent.TIMER,this.Turn);
         }
      }
      
      private function TurnClose(param1:TimerEvent) : void
      {
         this.myTimer3.stop();
         this.setResult();
      }
      
      private function setResult() : void
      {
         var _loc2_:ItemFace = null;
         if(this.arrAggregate == null)
         {
            return;
         }
         var _loc1_:Array = new Array();
         _loc1_.push(this.arrAggregate[this.result - 1]);
         _loc2_ = new ItemFace((_loc1_[0] as ItemFace).getBaseItem());
         _loc2_.x = 78;
         _loc2_.y = 92;
         this.slots.addChild(_loc2_);
         this.ZhuandongPd = false;
         dispatchEvent(new BaseEvent(UI_KongMingLock_KEYILINGJIANG_CLICK));
         this.hasWeiLingQu = true;
         this.newGoodsId = (_loc2_.getBaseItem() as Goods).id;
      }
      
      public function Nought() : void
      {
         this.StartBtn.enabled = false;
         this.LingjiangBtn.enabled = false;
         this.arrAggregate = new Array();
      }
      
      public function StartFun() : void
      {
         this.StartBtn.enabled = false;
         var _loc1_:int = 3 * 16 + this.result;
         this.myTimer3 = new Timer(350,1);
         this.myTimer3.start();
         this.myTimer3.addEventListener(TimerEvent.TIMER,this.Turn);
         this.ZhuandongPd = true;
      }
      
      public function KeyiLingjiang(param1:Boolean = true, param2:Boolean = true, param3:Boolean = true) : void
      {
         this.StartBtn.enabled = param1;
         this.LingjiangBtn.enabled = param2;
         this.shuaXinBtn.enabled = param3;
      }
      
      public function get startBtnEnabled() : Boolean
      {
         return this.StartBtn.enabled;
      }
      
      public function get lingjiangBtnEnabled() : Boolean
      {
         return this.LingjiangBtn.enabled;
      }
      
      public function setLingjiang() : void
      {
         var _loc1_:ItemFace = null;
         while(this.slots.numChildren > 0)
         {
            _loc1_ = this.slots.getChildAt(0) as ItemFace;
            this.slots.removeChildAt(0);
            _loc1_.destroy();
         }
         this.arrAggregate = new Array();
         this.StartBtn.enabled = false;
         this.LingjiangBtn.enabled = false;
      }
      
      public function setItem(param1:Array, param2:int, param3:Boolean, param4:String = "") : void
      {
         var _loc5_:ItemFace = null;
         var _loc6_:BaseItem = null;
         var _loc8_:BitmapFilter = null;
         var _loc9_:Array = null;
         this.titleText = LanResManager.getLanCommonTextWords("兽元武学");
         this.sd = 0;
         this.result = param2;
         this.arrAggregate = new Array();
         this.Ti = 0;
         while(this.slots.numChildren > 0)
         {
            _loc5_ = this.slots.getChildAt(0) as ItemFace;
            this.slots.removeChildAt(0);
            _loc5_.destroy();
         }
         var _loc7_:int = 0;
         while(_loc7_ < param1.length)
         {
            _loc6_ = param1[_loc7_];
            _loc5_ = new ItemFace(_loc6_);
            if(_loc7_ < 5)
            {
               _loc5_.x = _loc7_ * 54;
               _loc5_.y = 0;
            }
            else if(_loc7_ < 9)
            {
               _loc5_.x = 4 * 54;
               if(_loc7_ == 8)
               {
                  _loc5_.y = (_loc7_ - 4) * 52 - 1;
               }
               else
               {
                  _loc5_.y = (_loc7_ - 4) * 52;
               }
            }
            else if(_loc7_ < 13)
            {
               _loc5_.x = (12 - _loc7_) * 54;
               _loc5_.y = 4 * 52 - 1;
            }
            else if(_loc7_ < 16)
            {
               _loc5_.x = 0;
               _loc5_.y = (16 - _loc7_) * 52;
            }
            this.slots.addChild(_loc5_);
            this.arrAggregate.push(_loc5_);
            _loc7_++;
         }
         this.hasWeiLingQu = param3;
         if(param3)
         {
            this.setResult();
            if(this.slots.numChildren == 17)
            {
               _loc8_ = new GlowFilter(16776960);
               _loc9_ = new Array();
               _loc9_.push(_loc8_);
               if(this.arrAggregate[this.result - 1].filters != _loc9_)
               {
                  this.arrAggregate[this.result - 1].filters = _loc9_;
               }
            }
         }
         else
         {
            this.StartBtn.enabled = true;
         }
      }
      
      public function setDownResult(param1:Array, param2:Boolean, param3:String = "") : void
      {
         var _loc4_:ItemFace = null;
         var _loc5_:BaseItem = null;
         while(this.slots.numChildren > 0)
         {
            _loc4_ = this.slots.getChildAt(0) as ItemFace;
            this.slots.removeChildAt(0);
            _loc4_.destroy();
         }
         _loc5_ = param1[0];
         _loc4_ = new ItemFace(_loc5_);
         _loc4_.x = 78;
         _loc4_.y = 92;
         this.slots.addChild(_loc4_);
         this.ZhuandongPd = false;
         dispatchEvent(new BaseEvent(UI_KongMingLock_KEYILINGJIANG_CLICK));
         this.StartBtn.enabled = false;
         this.LingjiangBtn.enabled = true;
         this.hasWeiLingQu = true;
         this.newGoodsId = (_loc5_ as Goods).id;
      }
      
      public function setLingJiangResult() : void
      {
         var _loc1_:ItemFace = null;
         while(this.slots.numChildren > 0)
         {
            _loc1_ = this.slots.getChildAt(0) as ItemFace;
            this.slots.removeChildAt(0);
            _loc1_.destroy();
         }
         this.ZhuandongPd = false;
         this.StartBtn.enabled = false;
         this.LingjiangBtn.enabled = false;
         this.shuaXinBtn.enabled = true;
         this.hasWeiLingQu = false;
      }
      
      public function setShouYuanGongFa(param1:int = -1) : void
      {
         this.isShouYuanChouJiang = true;
         this.titleText = LanResManager.getLanCommonTextWords("兽元武学");
         if(this.bit != null && this.bit.parent != null)
         {
            this.bit.parent.removeChild(this.bit);
         }
         this.bit = StaticValue.getBitmapByClassName("ui.huoyueZhenpin.txt");
         addChild(this.bit);
         this.bit.x = 90;
         this.bit.y = 82;
         this.StartBtn.label = LanResManager.getLanCommonTextWords("开启");
         this.LingjiangBtn.label = LanResManager.getLanCommonTextWords("领取");
         this.shuaXinBtn.visible = true;
         this.goodsId = param1;
      }
      
      public function setXingYunZhi(param1:int = 0) : void
      {
         var loadUrl:String = null;
         var count:int = param1;
         count = count > 100 ? 100 : count;
         this.xingYunFta.htmlText = LanResManager.getLanCommonTextWords("幸运值：") + count + "%";
         this.luckCount = count;
         if(this.luckMc == null)
         {
            loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/mount/luck.swf";
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               luckMc = _loc2_.content as MovieClip;
               if(luckMc)
               {
                  luckMc.gotoAndStop(int(count / 5) + 1);
                  mcSpr.addChild(luckMc);
               }
            },null,false,loadUrl);
         }
         else
         {
            this.luckMc.gotoAndStop(int(count / 5) + 1);
         }
      }
      
      public function showSelectPanel(param1:Boolean) : void
      {
         if(this.lingQuPanel == null)
         {
            this.lingQuPanel = new ItemTiHuanPanel();
            this.lingQuPanel.$parent = this;
         }
         if(param1)
         {
            GameInstance.uiInstance.alertContainer.addChild(this.lingQuPanel);
            this.lingQuPanel.visible = true;
            this.lingQuPanel.x = GameConfig.sceneWidth / 2 - this.lingQuPanel.width / 2;
            this.lingQuPanel.y = GameConfig.sceneHeight / 2 - this.lingQuPanel.height / 2;
         }
         else if(this.lingQuPanel != null && this.lingQuPanel.parent != null)
         {
            this.lingQuPanel.parent.removeChild(this.lingQuPanel);
         }
      }
   }
}

