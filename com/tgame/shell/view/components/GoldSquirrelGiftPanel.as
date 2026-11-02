package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.ZMath;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.*;
   import flash.utils.Timer;
   
   public class GoldSquirrelGiftPanel extends FPanel
   {
      
      public static const UI_TreasureMap_SHOWSTOREHOUSE_CLICK:String = "UI_TreasureMap_SHOWSTOREHOUSE_CLICK";
      
      public static const UI_KongMingLock_START_CLICK:String = "UI_KongMingLock_START_CLICK";
      
      public static const UI_KongMingLock_LINGJIANG_CLICK:String = "UI_KongMingLock_LINGJIANG_CLICK";
      
      public static const UI_KongMingLock_DUIHUANLIJIN_CLICK:String = "UI_KongMingLock_DUIHUANLIJIN_CLICK";
      
      public static const UI_KongMingLock_START_LINGJIANG_CLICK:String = "UI_KongMingLock_START_LINGJIANG_CLICK";
      
      public static const UI_KongMingLock_LINGJIANG_START_CLICK:String = "UI_KongMingLock_LINGJIANG_START_CLICK";
      
      public static const UI_KongMingLock_KEYILINGJIANG_CLICK:String = "UI_KongMingLock_KEYILINGJIANG_CLICK";
      
      public static const UI_SQUIRRELGIFTPANEL_LANBTN_CLICK:String = "UI_SQUIRRELGIFTPANEL_LANBTN_CLICK";
      
      public static const UI_SQUIRRELGIFTPANEL_LVBTN_CLICK:String = "UI_SQUIRRELGIFTPANEL_LVBTN_CLICK";
      
      public static const UI_SQUIRRELGIFTPANEL_ZIBTN_CLICK:String = "UI_SQUIRRELGIFTPANEL_ZIBTN_CLICK";
      
      private var check1:FCheckBox;
      
      private var check2:FCheckBox;
      
      private var StartBtn:SecondButton;
      
      private var LingjiangBtn:SecondButton;
      
      private var ShowStorehouseBtn:SecondButton;
      
      private var StopBtn:SecondButton;
      
      private var DhljBtn:SecondButton;
      
      public var slots:Sprite;
      
      private var arrAggregate:Array;
      
      private var myTimer3:Timer;
      
      private var Ti:int = 0;
      
      private var result:int;
      
      private var tf:TextFormat;
      
      private var Shovel:FLabel;
      
      private var lb:FLabel;
      
      private var bgImg:DisplayObject;
      
      private var sfsc:Boolean;
      
      private var tieqiaoItem:ItemFace;
      
      private var guo:FTextArea;
      
      private var fta:FTextArea;
      
      private var LanBtn:FSimpleButton;
      
      private var LvBtn:FSimpleButton;
      
      private var ZiBtn:FSimpleButton;
      
      private var zfBar:ColorBar;
      
      private var Zhufuzhilb:FLabel;
      
      private var jpzfzFlb:FLabel;
      
      private var jpzfzMouseStr:String;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var sd:int = 0;
      
      private var zhuanquanSyc:int = 0;
      
      private var zhuanquanDq:int = 0;
      
      private var mc:MovieClip;
      
      private var zqZd:int = 0;
      
      private var BtnSp:Sprite;
      
      public function GoldSquirrelGiftPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var tf:TextFormat;
         var img1:Bitmap;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         this.dragRestrict = false;
         width = 392;
         height = 363;
         titleText = LanResManager.getLanCommonTextWords("寻宝");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.squirrel.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
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
         tf = new TextFormat();
         tf.align = "center";
         this.guo = new FTextArea();
         with(this.guo)
         {
            width = 365;
            height = 50;
            x = 15;
            y = 7;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("您打开的是【金榛子】兑奖界面") + "<br>" + "</font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("该榛子内含：16颗修为丹，其中八颗为：神武修为丹") + "</font>" + "</textformat>";
         }
         addChild(this.guo);
         this.fta = new FTextArea();
         with(this.fta)
         {
            width = 365;
            height = 50;
            x = 15;
            y = 52;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("请点显示宝贝按钮开始兑奖，出现奖品后点“停”选中奖品") + "。<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("最后领取奖品到包裹中（请在兑奖前至少留出一个背包空格）") + "</font>" + "</textformat>";
         }
         addChild(this.fta);
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 22;
         this.check1.y = 295;
         this.check1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.check1.visible = false;
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 44;
            y = 297;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("兑换后自动领走宝物");
         }
         addChild(this.lb);
         this.lb.visible = false;
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.x = 173;
         this.check2.y = 295;
         this.check2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.check2.visible = false;
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 195;
            y = 297;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("领宝后自动开始下轮兑换");
         }
         addChild(this.lb);
         this.lb.visible = false;
         img1 = StaticValue.getBitmapByClassName("ui.squirrel");
         addChild(img1);
         img1.scaleX = 0.9;
         img1.scaleY = 0.9;
         img1.x = 253;
         img1.y = 103;
         this.ShowStorehouseBtn = new SecondButton();
         this.ShowStorehouseBtn.label = LanResManager.getLanCommonTextWords("显示宝贝");
         this.ShowStorehouseBtn.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"没有领走礼品",["<br></font><font color=\'" + StaticValue.GREEN_HTML + "\'>"]) + "<br></font></textformat>";
         addChild(this.ShowStorehouseBtn);
         this.ShowStorehouseBtn.x = 277;
         this.ShowStorehouseBtn.y = 236;
         this.ShowStorehouseBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.ShowStorehouseBtn.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击显示宝贝按钮后开始使用榛子兑换奖品") + "</font></textformat>";
         this.StartBtn = new SecondButton();
         this.StartBtn.label = LanResManager.getLanCommonTextWords("开始");
         this.StartBtn.enabled = false;
         addChild(this.StartBtn);
         this.StartBtn.x = 277;
         this.StartBtn.y = 236;
         this.StartBtn.visible = false;
         this.StartBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.StartBtn.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击开始按钮后，将进入宝贝筛选流程") + "</font></textformat>";
         this.StopBtn = new SecondButton();
         this.StopBtn.label = LanResManager.getLanCommonTextWords("停");
         this.StopBtn.enabled = false;
         addChild(this.StopBtn);
         this.StopBtn.x = 277;
         this.StopBtn.y = 236;
         this.StopBtn.visible = false;
         this.StopBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.StopBtn.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"点击停按钮") + "</font></textformat>";
         this.LingjiangBtn = new SecondButton();
         this.LingjiangBtn.label = LanResManager.getLanCommonTextWords("领宝");
         this.LingjiangBtn.enabled = false;
         addChild(this.LingjiangBtn);
         this.LingjiangBtn.x = 277;
         this.LingjiangBtn.y = 236;
         this.LingjiangBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.LingjiangBtn.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将奖品领取到您的包裹中，从而获得奖品") + "</font></textformat>";
         this.DhljBtn = new SecondButton();
         this.DhljBtn.label = LanResManager.getLanCommonTextWords("兑换礼金");
         this.DhljBtn.enabled = false;
         addChild(this.DhljBtn);
         this.DhljBtn.x = 277;
         this.DhljBtn.y = 260;
         this.DhljBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.DhljBtn.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动期间您可以将您不想要的奖品兑换为30礼金") + "<br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanTextWords(this,"兑换信息1") + "<font></font></textformat>";
         this.DhljBtn.visible = false;
         this.slots = new Sprite();
         with(this.slots)
         {
            x = 1;
            y = 4;
         }
         addChild(this.slots);
         this.LanBtn = new FSimpleButton();
         this.LanBtn.skin = "pinecone_blue";
         addChild(this.LanBtn);
         this.LanBtn.x = 280;
         this.LanBtn.y = 198;
         this.LanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.LanBtn.toolTip = "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("用【蓝榛子】跟寻宝鼠兑奖") + "</font>";
         this.LanBtn.visible = false;
         this.LvBtn = new FSimpleButton();
         this.LvBtn.skin = "pinecone_green";
         addChild(this.LvBtn);
         this.LvBtn.x = 305;
         this.LvBtn.y = 198;
         this.LvBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.LvBtn.toolTip = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("用【绿榛子】跟寻宝鼠兑奖") + "</font>";
         this.LvBtn.visible = false;
         this.ZiBtn = new FSimpleButton();
         this.ZiBtn.skin = "pinecone_purple";
         addChild(this.ZiBtn);
         this.ZiBtn.x = 330;
         this.ZiBtn.y = 198;
         this.ZiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ZiBtn.toolTip = "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanCommonTextWords("用【紫榛子】跟寻宝鼠兑奖") + "</font>";
         this.ZiBtn.visible = false;
      }
      
      private function onMouseTip4(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.jpzfzFlb.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip4);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.jpzfzMouseStr);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.jpzfzFlb.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip4);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 4;
         this.tipCanvas.y = mouseY + 4;
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
            case this.StopBtn:
               this.StopBtn.enabled = true;
               this.LingjiangBtn.enabled = true;
               this.DhljBtn.enabled = true;
               this.LingjiangBtn.visible = true;
               this.myTimer3.addEventListener(TimerEvent.TIMER_COMPLETE,this.TurnClose);
               break;
            case this.LingjiangBtn:
               dispatchEvent(new BaseEvent(UI_KongMingLock_LINGJIANG_CLICK));
               break;
            case this.DhljBtn:
               dispatchEvent(new BaseEvent(UI_KongMingLock_DUIHUANLIJIN_CLICK));
               break;
            case this.LanBtn:
               dispatchEvent(new BaseEvent(UI_SQUIRRELGIFTPANEL_LANBTN_CLICK));
               break;
            case this.LvBtn:
               dispatchEvent(new BaseEvent(UI_SQUIRRELGIFTPANEL_LVBTN_CLICK));
               break;
            case this.ZiBtn:
               dispatchEvent(new BaseEvent(UI_SQUIRRELGIFTPANEL_ZIBTN_CLICK));
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
         if(this.myTimer3)
         {
            this.myTimer3.stop();
         }
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function TurnClose(param1:TimerEvent) : void
      {
         this.myTimer3.stop();
         this.setResult();
      }
      
      private function Turn(param1:TimerEvent) : void
      {
         if(this.myTimer3)
         {
            this.myTimer3.stop();
         }
         ++this.zqZd;
         if(this.Ti > this.arrAggregate.length - 1)
         {
            this.Ti = 0;
         }
         if(this.arrAggregate.length > 0)
         {
            (this.arrAggregate[this.zhuanquanDq] as ItemFace).showGiftSelect(false);
            this.zhuanquanDq = ZMath.getRandomNumber(0,15);
            while(this.zhuanquanDq == this.zhuanquanSyc)
            {
               this.zhuanquanDq = ZMath.getRandomNumber(0,15);
            }
            this.zhuanquanSyc = this.zhuanquanDq;
            (this.arrAggregate[this.zhuanquanDq] as ItemFace).showGiftSelect(true);
         }
         var _loc2_:int = this.Ti;
         if(_loc2_ == 0)
         {
            _loc2_ = 15;
         }
         else
         {
            _loc2_--;
         }
         ++this.Ti;
         ++this.sd;
         this.myTimer3 = new Timer(45,1);
         if(this.check1.selectState)
         {
            if(this.zqZd > 10)
            {
               this.StopBtn.enabled = false;
               this.LingjiangBtn.enabled = true;
               this.DhljBtn.enabled = true;
               this.LingjiangBtn.visible = true;
               this.myTimer3.addEventListener(TimerEvent.TIMER_COMPLETE,this.TurnClose);
               this.myTimer3.start();
            }
            else
            {
               this.myTimer3.addEventListener(TimerEvent.TIMER,this.Turn);
               this.myTimer3.start();
            }
         }
         else
         {
            this.myTimer3.addEventListener(TimerEvent.TIMER,this.Turn);
            this.myTimer3.start();
         }
      }
      
      private function setResult() : void
      {
         var item:ItemFace = null;
         if(this.arrAggregate == null || this.arrAggregate.length == 0)
         {
            return;
         }
         item = new ItemFace((this.arrAggregate[this.result - 1] as ItemFace).getBaseItem());
         item.x = 192;
         item.y = 210;
         if(Boolean(this.mc) && this.mc.parent != null)
         {
            this.mc.parent.removeChild(this.mc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            mc = _loc2_.content as MovieClip;
            mc.x = 192 - mc.width / 2;
            mc.y = 210 - mc.height / 2;
            addChild(mc);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/wabao.swf");
         this.StopBtn.enabled = false;
         (this.arrAggregate[this.zhuanquanDq] as ItemFace).showGiftSelect(false);
         (this.arrAggregate[this.result - 1] as ItemFace).showGiftSelect(true);
         this.slots.addChild(item);
         dispatchEvent(new BaseEvent(UI_KongMingLock_KEYILINGJIANG_CLICK));
      }
      
      public function Nought() : void
      {
         this.StartBtn.enabled = false;
         this.LingjiangBtn.enabled = false;
         this.DhljBtn.enabled = false;
         this.LingjiangBtn.visible = false;
         this.arrAggregate = new Array();
      }
      
      public function StartFun() : void
      {
         this.StartBtn.enabled = false;
         this.StartBtn.visible = false;
         this.StopBtn.visible = true;
         this.StopBtn.enabled = true;
         var _loc1_:int = 3 * 16 + this.result;
         this.myTimer3 = new Timer(350,1);
         this.myTimer3.start();
         this.myTimer3.addEventListener(TimerEvent.TIMER,this.Turn);
      }
      
      public function KeyiLingjiang(param1:Boolean = true, param2:Boolean = true, param3:Boolean = true, param4:Boolean = true) : void
      {
         this.StartBtn.enabled = param1;
         this.LingjiangBtn.enabled = param2;
         this.ShowStorehouseBtn.enabled = param3;
         this.StopBtn.enabled = param4;
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
      
      public function get StopBtnEnabled() : Boolean
      {
         return this.StopBtn.enabled;
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
         this.StartBtn.visible = false;
         this.ShowStorehouseBtn.visible = true;
         this.ShowStorehouseBtn.enabled = true;
         this.StopBtn.visible = false;
         this.StopBtn.enabled = false;
         this.LingjiangBtn.enabled = false;
         this.DhljBtn.enabled = false;
         this.LingjiangBtn.visible = false;
         this.LvBtn.enabled = true;
         this.LanBtn.enabled = true;
         this.ZiBtn.enabled = true;
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
         while(this.slots.numChildren > 0)
         {
            _loc5_ = this.slots.getChildAt(0) as ItemFace;
            this.slots.removeChildAt(0);
            _loc5_.destroy();
         }
         this.LanBtn.enabled = false;
         this.LvBtn.enabled = false;
         this.ZiBtn.enabled = false;
         this.sd = 0;
         this.result = param2;
         var _loc7_:int = 0;
         while(_loc7_ < param1.length)
         {
            _loc6_ = param1[_loc7_];
            _loc5_ = new ItemFace(_loc6_);
            _loc8_ = _loc7_ % 4;
            _loc9_ = _loc7_ / 4;
            _loc10_ = 20 + _loc8_ * 38;
            _loc11_ = 110 + _loc9_ * 38;
            _loc5_.x = _loc10_;
            _loc5_.y = _loc11_;
            this.slots.addChild(_loc5_);
            this.arrAggregate.push(_loc5_);
            _loc7_++;
         }
         this.ShowStorehouseBtn.visible = false;
         this.StartBtn.visible = true;
         this.sfsc = param3;
         if(param3)
         {
            this.setResult();
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
         _loc5_ = param1[0];
         while(this.slots.numChildren > 0)
         {
            _loc4_ = this.slots.getChildAt(0) as ItemFace;
            this.slots.removeChildAt(0);
            _loc4_.destroy();
         }
         _loc4_ = new ItemFace(_loc5_);
         _loc4_.x = 192;
         _loc4_.y = 210;
         this.slots.addChild(_loc4_);
         this.LvBtn.enabled = false;
         this.LanBtn.enabled = false;
         this.ZiBtn.enabled = false;
         dispatchEvent(new BaseEvent(UI_KongMingLock_KEYILINGJIANG_CLICK));
         this.ShowStorehouseBtn.visible = false;
         this.StartBtn.enabled = false;
         this.StartBtn.visible = false;
         this.StopBtn.enabled = false;
         this.LingjiangBtn.enabled = true;
         this.DhljBtn.enabled = true;
         this.LingjiangBtn.visible = true;
      }
      
      public function setShovel(param1:int, param2:Goods, param3:String = "") : void
      {
         if(this.tieqiaoItem != null)
         {
            removeChild(this.tieqiaoItem);
         }
         this.tieqiaoItem = new ItemFace(param2);
         this.tieqiaoItem.x = 193;
         this.tieqiaoItem.y = 138;
         addChild(this.tieqiaoItem);
         if(this.BtnSp != null)
         {
            this.BtnSp.graphics.clear();
         }
         this.zqZd = 0;
         if(param3 == LanResManager.getLanCommonTextWords("蓝榛子"))
         {
            this.BtnSp = new Sprite();
            this.BtnSp.graphics.lineStyle(1,6057067,1);
            this.BtnSp.graphics.drawRect(0,0,20,24);
            this.BtnSp.graphics.endFill();
            this.BtnSp.x = 278;
            this.BtnSp.y = 198;
         }
         else if(param3 == LanResManager.getLanCommonTextWords("蓝榛子"))
         {
            this.BtnSp = new Sprite();
            this.BtnSp.graphics.lineStyle(1,6057067,1);
            this.BtnSp.graphics.drawRect(0,0,20,24);
            this.BtnSp.graphics.endFill();
            this.BtnSp.x = 303;
            this.BtnSp.y = 198;
         }
         else if(param3 == LanResManager.getLanCommonTextWords("紫榛子"))
         {
            this.BtnSp = new Sprite();
            this.BtnSp.graphics.lineStyle(1,6057067,1);
            this.BtnSp.graphics.drawRect(0,0,20,24);
            this.BtnSp.graphics.endFill();
            this.BtnSp.x = 328;
            this.BtnSp.y = 198;
         }
         this.LvBtn.enabled = true;
         this.LanBtn.enabled = true;
         this.ZiBtn.enabled = true;
         if(param1 == 0)
         {
            this.tieqiaoItem.filters = Tools.blackWhiteFilter;
            this.ShowStorehouseBtn.enabled = false;
            if(param3 == LanResManager.getLanCommonTextWords("蓝榛子"))
            {
               this.LanBtn.enabled = false;
            }
            else if(param3 == LanResManager.getLanCommonTextWords("绿榛子"))
            {
               this.LvBtn.enabled = false;
            }
            else if(param3 == LanResManager.getLanCommonTextWords("紫榛子"))
            {
               this.ZiBtn.enabled = false;
            }
            this.BtnSp.graphics.clear();
         }
         else
         {
            this.ShowStorehouseBtn.enabled = true;
         }
      }
      
      public function isShowDhljBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.DhljBtn.visible = true;
         }
         else
         {
            this.DhljBtn.visible = false;
         }
      }
      
      public function setBenediction(param1:int, param2:String) : void
      {
      }
      
      public function setJinsongguoStr(param1:String) : void
      {
         this.guo.htmlText = param1;
      }
   }
}

