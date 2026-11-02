package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.TCursorManager;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.ZMath;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   import flash.utils.Timer;
   import gs.TweenLite;
   
   public class TreasureMapPanel extends FPanel
   {
      
      public static const UI_TreasureMap_SHOWSTOREHOUSE_CLICK:String = "UI_TreasureMap_SHOWSTOREHOUSE_CLICK";
      
      public static const UI_KongMingLock_START_CLICK:String = "UI_KongMingLock_START_CLICK";
      
      public static const UI_KongMingLock_LINGJIANG_CLICK:String = "UI_KongMingLock_LINGJIANG_CLICK";
      
      public static const UI_KongMingLock_START_LINGJIANG_CLICK:String = "UI_KongMingLock_START_LINGJIANG_CLICK";
      
      public static const UI_KongMingLock_LINGJIANG_START_CLICK:String = "UI_KongMingLock_LINGJIANG_START_CLICK";
      
      public static const UI_KongMingLock_KEYILINGJIANG_CLICK:String = "UI_KongMingLock_KEYILINGJIANG_CLICK";
      
      private var check1:FCheckBox;
      
      private var check2:FCheckBox;
      
      private var StartBtn:SecondButton;
      
      private var LingjiangBtn:SecondButton;
      
      private var ShowStorehouseBtn:SecondButton;
      
      private var arrow:Sprite;
      
      public var slots:Sprite;
      
      private var arrAggregate:Array;
      
      private var myTimer3:Timer;
      
      private var Ti:int = 0;
      
      private var result:int;
      
      private var tf:TextFormat;
      
      private var DemandShovel:FLabel;
      
      private var Shovel:FLabel;
      
      private var lb:FLabel;
      
      private var bgImg:DisplayObject;
      
      private var sfsc:Boolean;
      
      private var tishift:FTextArea;
      
      private var tieqiaoItem:ItemFace;
      
      private var leiji:int = 0;
      
      private var BgImgPd:Boolean = false;
      
      private var mc:MovieClip;
      
      public function TreasureMapPanel()
      {
         var giftContainer:FCanvas = null;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         this.dragRestrict = false;
         width = 453;
         height = 412;
         titleText = LanResManager.getLanCommonTextWords("普通藏宝图");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         giftContainer = new FCanvas();
         giftContainer.skin = "box";
         addChild(giftContainer);
         giftContainer.x = 10;
         giftContainer.y = 2;
         giftContainer.width = 434;
         giftContainer.height = 300;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.tishift = new FTextArea();
         with(this.tishift)
         {
            defaultTextFormat = tf;
            x = 0;
            y = 277;
            width = 450;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanCommonTextWords("传说在这里埋藏着16件前辈大侠留下的宝藏，静待着他的主人");
         }
         addChild(this.tishift);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 65;
            y = 317;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本次挖掘需要");
         }
         addChild(this.lb);
         this.DemandShovel = new FLabel();
         with(this.DemandShovel)
         {
            x = 65;
            y = 338;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("1把普通铁铲");
         }
         addChild(this.DemandShovel);
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 147;
         this.check1.y = 315;
         this.check1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 171;
            y = 317;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("挖掘后自动领走宝物");
         }
         addChild(this.lb);
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.x = 147;
         this.check2.y = 336;
         this.check2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 171;
            y = 338;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("领宝后自动开始挖掘");
         }
         addChild(this.lb);
         this.ShowStorehouseBtn = new SecondButton();
         this.ShowStorehouseBtn.label = LanResManager.getLanCommonTextWords("显示宝藏");
         addChild(this.ShowStorehouseBtn);
         this.ShowStorehouseBtn.x = 364;
         this.ShowStorehouseBtn.y = 312;
         this.ShowStorehouseBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.StartBtn = new SecondButton();
         this.StartBtn.label = LanResManager.getLanCommonTextWords("开挖");
         this.StartBtn.enabled = false;
         addChild(this.StartBtn);
         this.StartBtn.x = 364;
         this.StartBtn.y = 312;
         this.StartBtn.visible = false;
         this.StartBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.LingjiangBtn = new SecondButton();
         this.LingjiangBtn.label = LanResManager.getLanCommonTextWords("领宝");
         this.LingjiangBtn.enabled = false;
         addChild(this.LingjiangBtn);
         this.LingjiangBtn.x = 364;
         this.LingjiangBtn.y = 337;
         this.LingjiangBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.slots = new Sprite();
         with(this.slots)
         {
            x = 12;
            y = 4;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,430,296);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         addChild(this.slots);
         this.slots.addEventListener(MouseEvent.CLICK,this.onBgIngClick);
         this.slots.addEventListener(MouseEvent.MOUSE_MOVE,this.onBgIngOver);
         this.slots.addEventListener(MouseEvent.MOUSE_OVER,this.onBgIngOver);
         this.slots.addEventListener(MouseEvent.MOUSE_OUT,this.onBgIngOut);
         this.arrow = StaticValue.getMCByClassName("ui.map.worldmap.char");
         this.arrow.x = 400;
         this.arrow.y = 312;
         addChild(this.arrow);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.ShowStorehouseBtn:
               dispatchEvent(new BaseEvent(UI_TreasureMap_SHOWSTOREHOUSE_CLICK));
               break;
            case this.StartBtn:
               dispatchEvent(new BaseEvent(UI_KongMingLock_START_CLICK));
               break;
            case this.LingjiangBtn:
               dispatchEvent(new BaseEvent(UI_KongMingLock_LINGJIANG_CLICK));
         }
         switch(param1.currentTarget)
         {
            case this.check1:
               dispatchEvent(new BaseEvent(UI_KongMingLock_START_LINGJIANG_CLICK,"",this.check1.selectState ? true : false));
               break;
            case this.check2:
               dispatchEvent(new BaseEvent(UI_KongMingLock_LINGJIANG_START_CLICK,"",this.check2.selectState ? true : false));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         TCursorManager.showCursor(TCursorManager.CURSOR_MOREN);
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function setResult(param1:int, param2:int) : void
      {
         var tmx:int;
         var tmy:int;
         var ax:int;
         var ay:int;
         var item:ItemFace = null;
         var $ax:int = param1;
         var $ay:int = param2;
         if(this.arrAggregate == null)
         {
            return;
         }
         tmx = this.mouseX;
         tmy = this.mouseY;
         if(Boolean(this.mc) && this.mc.parent != null)
         {
            this.mc.parent.removeChild(this.mc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            mc = _loc2_.content as MovieClip;
            mc.x = $ax - mc.width / 2;
            mc.y = $ay - mc.height / 2;
            addChild(mc);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/wabao.swf");
         ax = $ax;
         ay = $ay;
         if(ax > 430 - 40)
         {
            ax = 430 - 50;
         }
         if(ay > 296 - 40)
         {
            ay = 296 - 50;
         }
         this.tishift.htmlText = LanResManager.getLanCommonTextWords("恭喜您获得宝物，请点击领宝按钮领走宝物");
         item = new ItemFace((this.arrAggregate[this.result - 1] as ItemFace).getBaseItem());
         item.x = ax;
         item.y = ay;
         this.BgImgPd = false;
         this.slots.addChild(item);
         dispatchEvent(new BaseEvent(UI_KongMingLock_KEYILINGJIANG_CLICK));
      }
      
      public function Nought() : void
      {
         this.StartBtn.enabled = false;
         this.arrow.visible = false;
         this.LingjiangBtn.enabled = false;
         this.arrAggregate = new Array();
      }
      
      public function StartFun() : void
      {
         this.StartBtn.enabled = false;
         this.arrow.visible = false;
         var _loc1_:int = 0;
         while(_loc1_ < 16)
         {
            TweenLite.to(this.arrAggregate[_loc1_],1,{
               "x":430 / 2 - 35 + ZMath.getRandomNumber(0,100),
               "y":296 / 2 - 35 + ZMath.getRandomNumber(0,100),
               "onComplete":this.onCom,
               "onCompleteParams":[_loc1_]
            });
            _loc1_++;
         }
      }
      
      private function onCom(param1:int) : void
      {
         TweenLite.to(this.arrAggregate[param1],1,{
            "alpha":0,
            "onComplete":this.onComBgClick
         });
      }
      
      private function onComBgClick() : void
      {
         var _loc1_:int = 0;
         ++this.leiji;
         if(this.leiji == 16)
         {
            this.BgImgPd = true;
            _loc1_ = 0;
            while(_loc1_ < 16)
            {
               this.arrAggregate[_loc1_].visible = false;
               _loc1_++;
            }
            this.tishift.htmlText = LanResManager.getLanCommonTextWords("宝物已散落至各处，请点击任意地点进行挖掘");
            if(this.check2.selectState)
            {
               this.setResult(ZMath.getRandomNumber(0,390),ZMath.getRandomNumber(0,256));
            }
         }
      }
      
      private function onBgIngClick(param1:MouseEvent) : void
      {
         if(this.BgImgPd)
         {
            TCursorManager.showCursor(TCursorManager.CURSOR_MOREN);
            this.setResult(param1.currentTarget.mouseX,param1.currentTarget.mouseY);
         }
      }
      
      private function onBgIngOver(param1:MouseEvent) : void
      {
         if(this.check2.selectState == false && this.BgImgPd)
         {
            TCursorManager.showCursor(TCursorManager.CURSOR_WABAOL);
         }
      }
      
      private function onBgIngOut(param1:MouseEvent) : void
      {
         TCursorManager.showCursor(TCursorManager.CURSOR_MOREN);
      }
      
      public function KeyiLingjiang(param1:Boolean = true, param2:Boolean = true, param3:Boolean = true) : void
      {
         this.StartBtn.enabled = param1;
         this.LingjiangBtn.enabled = param2;
         this.ShowStorehouseBtn.enabled = param3;
      }
      
      public function get startBtnEnabled() : Boolean
      {
         return this.StartBtn.enabled;
      }
      
      public function get lingjiangBtnEnabled() : Boolean
      {
         return this.LingjiangBtn.enabled;
      }
      
      public function get ShowStorehouseBtnEnabled() : Boolean
      {
         return this.ShowStorehouseBtn.enabled;
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
         this.BgImgPd = false;
         this.StartBtn.enabled = false;
         this.StartBtn.visible = false;
         this.ShowStorehouseBtn.visible = true;
         this.ShowStorehouseBtn.enabled = true;
         this.arrow.visible = true;
         this.LingjiangBtn.enabled = false;
      }
      
      public function setItem(param1:Array, param2:int, param3:Boolean, param4:String = "") : void
      {
         var _loc5_:ItemFace = null;
         var _loc6_:BaseItem = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         this.arrAggregate = new Array();
         this.Ti = 0;
         this.leiji = 0;
         while(this.slots.numChildren > 0)
         {
            _loc5_ = this.slots.getChildAt(0) as ItemFace;
            this.slots.removeChildAt(0);
            _loc5_.destroy();
         }
         this.tishift.htmlText = LanResManager.getLanCommonTextWords("传说在这里埋藏着16件前辈大侠留下的宝藏，静待着他的主人");
         if(param4 == LanResManager.getLanCommonTextWords("普通"))
         {
            this.titleText = LanResManager.getLanCommonTextWords("普通藏宝图");
         }
         else if(param4 == LanResManager.getLanCommonTextWords("珍稀"))
         {
            this.titleText = LanResManager.getLanCommonTextWords("珍稀藏宝图");
         }
         this.result = param2;
         var _loc7_:int = 0;
         while(_loc7_ < param1.length)
         {
            _loc6_ = param1[_loc7_];
            _loc5_ = new ItemFace(_loc6_);
            _loc8_ = _loc7_ % 4;
            _loc9_ = _loc7_ / 4;
            _loc10_ = ZMath.getRandomNumber(_loc8_ * (430 / 4),430 / 4 * (_loc8_ + 1) - 35);
            _loc11_ = ZMath.getRandomNumber(_loc9_ * (296 / 4),296 / 4 * (_loc9_ + 1) - 35);
            _loc5_.x = _loc10_;
            _loc5_.y = _loc11_;
            this.slots.addChild(_loc5_);
            this.arrAggregate.push(_loc5_);
            _loc7_++;
         }
         this.ShowStorehouseBtn.visible = false;
         this.StartBtn.visible = true;
         this.arrow.visible = true;
         this.sfsc = param3;
         if(param3)
         {
            this.setResult(ZMath.getRandomNumber(0,390),ZMath.getRandomNumber(0,256));
         }
         else
         {
            this.StartBtn.enabled = true;
            this.arrow.visible = true;
         }
      }
      
      public function setDownResult(param1:Array, param2:Boolean, param3:String = "") : void
      {
         var _loc4_:ItemFace = null;
         var _loc5_:BaseItem = null;
         _loc5_ = param1[0];
         while(this.slots.numChildren > 0)
         {
            _loc4_ = this.slots.getChildAt(0) as ItemFace;
            this.slots.removeChildAt(0);
            _loc4_.destroy();
         }
         if(param3 == LanResManager.getLanCommonTextWords("普通"))
         {
            this.titleText = LanResManager.getLanCommonTextWords("普通藏宝图");
         }
         else if(param3 == LanResManager.getLanCommonTextWords("珍稀"))
         {
            this.titleText = LanResManager.getLanCommonTextWords("珍稀藏宝图");
         }
         _loc4_ = new ItemFace(_loc5_);
         _loc4_.x = 430 / 2 - 35 + 10;
         _loc4_.y = 296 / 2 - 35 + 10;
         this.slots.addChild(_loc4_);
         this.BgImgPd = false;
         dispatchEvent(new BaseEvent(UI_KongMingLock_KEYILINGJIANG_CLICK));
         this.ShowStorehouseBtn.visible = false;
         this.StartBtn.enabled = false;
         this.arrow.visible = false;
         this.LingjiangBtn.enabled = true;
      }
      
      public function setDemandShovel(param1:int, param2:String) : void
      {
         if(param2 == LanResManager.getLanCommonTextWords("普通"))
         {
            this.DemandShovel.htmlText = param1 + LanResManager.getLanCommonTextWords("把普通铁铲");
         }
         else if(param2 == LanResManager.getLanCommonTextWords("珍稀"))
         {
            this.DemandShovel.htmlText = param1 + LanResManager.getLanCommonTextWords("把锋利铁铲");
         }
      }
      
      public function setShovel(param1:int, param2:int) : void
      {
         var imgLj:int;
         var aa:int = param1;
         var bb:int = param2;
         this.tishift.htmlText = LanResManager.getLanCommonTextWords("传说在这里埋藏着16件前辈大侠留下的宝藏，静待着他的主人");
         if(this.tieqiaoItem != null)
         {
            removeChild(this.tieqiaoItem);
         }
         this.tieqiaoItem = new ItemFace(new Goods(bb));
         this.tieqiaoItem.x = 22;
         this.tieqiaoItem.y = 318;
         addChild(this.tieqiaoItem);
         if(this.Shovel != null)
         {
            removeChild(this.Shovel);
         }
         this.Shovel = new FLabel();
         with(this.Shovel)
         {
            x = 30;
            y = 338;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = "";
         }
         this.Shovel.htmlText = String(aa);
         addChild(this.Shovel);
         if(this.bgImg != null)
         {
            removeChild(this.bgImg);
         }
         imgLj = Math.random() * 10;
         while(imgLj > 3)
         {
            imgLj = Math.random() * 10;
         }
         imgLj++;
         if(bb == 9011)
         {
            this.bgImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/treasureMapBg/elementary/treasureMap_bg_elementary_" + imgLj + ".jpg",430,296);
            this.titleText = LanResManager.getLanCommonTextWords("普通藏宝图");
         }
         else if(bb == 9012)
         {
            this.bgImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/treasureMapBg/superior/treasureMap_bg_superior_" + imgLj + ".jpg",430,296);
            this.titleText = LanResManager.getLanCommonTextWords("珍稀藏宝图");
         }
         this.bgImg.x = 12;
         this.bgImg.y = 4;
         addChildAt(this.bgImg,0);
         if(aa == 0)
         {
            this.ShowStorehouseBtn.enabled = false;
         }
      }
   }
}

