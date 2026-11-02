package com.tgame.shell.view.components
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.BitmapFilter;
   import flash.filters.GlowFilter;
   import flash.utils.Timer;
   
   public class KongMingLockPanel extends FPanel
   {
      
      public static const UI_KongMingLock_START_CLICK:String = "UI_KongMingLock_START_CLICK";
      
      public static const UI_KongMingLock_LINGJIANG_CLICK:String = "UI_KongMingLock_LINGJIANG_CLICK";
      
      public static const UI_KongMingLock_START_LINGJIANG_CLICK:String = "UI_KongMingLock_START_LINGJIANG_CLICK";
      
      public static const UI_KongMingLock_LINGJIANG_START_CLICK:String = "UI_KongMingLock_LINGJIANG_START_CLICK";
      
      public static const UI_KongMingLock_KEYILINGJIANG_CLICK:String = "UI_KongMingLock_KEYILINGJIANG_CLICK";
      
      private var check1:FCheckBox;
      
      private var check2:FCheckBox;
      
      private var StartBtn:SecondButton;
      
      private var LingjiangBtn:SecondButton;
      
      public var slots:Sprite;
      
      private var arrAggregate:Array;
      
      private var myTimer1:Timer;
      
      private var myTimer2:Timer;
      
      private var myTimer3:Timer;
      
      private var Ti:int = 0;
      
      private var result:int;
      
      private var lbtt1:FLabel;
      
      private var lbtt2:FLabel;
      
      private var bit:Bitmap;
      
      public var ZhuandongPd:Boolean;
      
      private var csBtn:SecondButton;
      
      private var sd:int = 0;
      
      public function KongMingLockPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var lb:FLabel = null;
         this.myTimer1 = new Timer(1000);
         this.myTimer2 = new Timer(1000);
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         this.dragRestrict = false;
         width = 289;
         height = 305;
         titleText = LanResManager.getLanCommonTextWords("孔明锁");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
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
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 91;
         this.check1.y = 147;
         this.check1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lbtt1 = new FLabel();
         with(this.lbtt1)
         {
            x = 115;
            y = 149;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("开奖后自动领奖");
         }
         addChild(this.lbtt1);
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.x = 91;
         this.check2.y = 167;
         this.check2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lbtt2 = new FLabel();
         with(this.lbtt2)
         {
            x = 115;
            y = 169;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("领奖后自动开始");
         }
         addChild(this.lbtt2);
         this.slots = new Sprite();
         with(this.slots)
         {
            x = 20;
            y = 11;
            doubleClickEnabled = true;
         }
         addChild(this.slots);
         this.myTimer1.addEventListener(TimerEvent.TIMER,this.setLingjiangTimer);
         this.myTimer2.addEventListener(TimerEvent.TIMER,this.setResultTimer);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
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
         if(parent != null)
         {
            this.parent.removeChild(this);
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
      
      private function setResultTimer(param1:TimerEvent) : void
      {
         this.myTimer2.stop();
         var _loc2_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < 16)
         {
            _loc2_.push(new Goods(20001 + _loc3_));
            _loc3_++;
         }
         this.setItem(_loc2_,int(Math.random() * 10) + 1,true,LanResManager.getLanCommonTextWords("天机锁"));
         this.StartFun();
      }
      
      private function setLingjiangTimer(param1:TimerEvent) : void
      {
         this.myTimer1.stop();
         this.setLingjiang();
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
      
      public function KeyiLingjiang(param1:Boolean = true, param2:Boolean = true) : void
      {
         this.StartBtn.enabled = param1;
         this.LingjiangBtn.enabled = param2;
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
         if(param4 == LanResManager.getLanCommonTextWords("天机锁"))
         {
            this.titleText = LanResManager.getLanCommonTextWords("天机锁");
         }
         else if(param4 == LanResManager.getLanCommonTextWords("孔明锁"))
         {
            this.titleText = LanResManager.getLanCommonTextWords("孔明锁");
         }
         else if(param4 == LanResManager.getLanCommonTextWords("成就礼盒"))
         {
            this.titleText = LanResManager.getLanCommonTextWords("成就福袋");
         }
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
         if(param3 == LanResManager.getLanCommonTextWords("天机锁"))
         {
            this.titleText = LanResManager.getLanCommonTextWords("天机锁");
         }
         else if(param3 == LanResManager.getLanCommonTextWords("孔明锁"))
         {
            this.titleText = LanResManager.getLanCommonTextWords("孔明锁");
         }
         else if(param3 == LanResManager.getLanCommonTextWords("成就礼盒"))
         {
            this.titleText = LanResManager.getLanCommonTextWords("成就福袋");
         }
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
      }
      
      public function setWuliangMizang() : void
      {
         this.titleText = LanResManager.getLanCommonTextWords("无量秘藏");
         if(this.bit != null && this.bit.parent != null)
         {
            this.bit.parent.removeChild(this.bit);
         }
         this.bit = StaticValue.getBitmapByClassName("ui.mizangZhenpin.txt");
         addChild(this.bit);
         this.bit.x = 90;
         this.bit.y = 82;
         this.StartBtn.label = LanResManager.getLanCommonTextWords("开启");
         this.LingjiangBtn.label = LanResManager.getLanCommonTextWords("领取");
         this.check1.visible = false;
         this.check2.visible = false;
         this.lbtt1.visible = false;
         this.lbtt2.visible = false;
      }
      
      public function setZhuanshi() : void
      {
         this.titleText = LanResManager.getLanCommonTextWords("钻石宝箱");
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
         this.check1.visible = false;
         this.check2.visible = false;
         this.lbtt1.visible = false;
         this.lbtt2.visible = false;
      }
      
      public function setZhijin() : void
      {
         this.titleText = LanResManager.getLanCommonTextWords("紫金宝箱");
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
         this.check1.visible = false;
         this.check2.visible = false;
         this.lbtt1.visible = false;
         this.lbtt2.visible = false;
      }
   }
}

