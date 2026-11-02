package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
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
   
   public class QianchuiBailianFuzengPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var fta:FTextArea;
      
      private var duanzaoFta:FTextArea;
      
      private var jingyanFta:FTextArea;
      
      private var shuxingFta:FTextArea;
      
      private var jiangliBtn:SecondButton;
      
      private var jingyanBtn:SecondButton;
      
      private var arrAggregate:Array;
      
      public var slots:Sprite;
      
      private var myTimer3:Timer;
      
      private var zqZd:int = 0;
      
      private var Ti:int = 0;
      
      private var result:int = 0;
      
      private var zhuanquanSyc:int = 0;
      
      private var zhuanquanDq:int = 0;
      
      private var sd:int = 0;
      
      private var mc:MovieClip;
      
      public function QianchuiBailianFuzengPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         super();
         skin = "panel";
         dragAble = false;
         this.dragRestrict = false;
         width = 392;
         height = 363;
         titleText = LanResManager.getLanCommonTextWords("锻造附赠");
         bg = new Bitmap();
         bg.name = "ui.qianchuibailian.fuzeng.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 15;
            y = 10;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"当前活动期间每次锻造均会有锻造值、经验值以及各种珍稀道具赠送。",[StaticValue.GREEN_HTML]) + "</textformat>";
         }
         addChild(this.fta);
         this.slots = new Sprite();
         with(this.slots)
         {
            x = 26;
            y = 88;
         }
         addChild(this.slots);
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 213;
            y = 88;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GOLD;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("今日获得锻造值：");
         }
         addChild(this.fta);
         this.duanzaoFta = new FTextArea();
         with(this.duanzaoFta)
         {
            x = 218;
            y = 108;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.duanzaoFta);
         this.jiangliBtn = new SecondButton();
         this.jiangliBtn.label = LanResManager.getLanCommonTextWords("锻造值换奖励");
         addChild(this.jiangliBtn);
         this.jiangliBtn.x = 228;
         this.jiangliBtn.y = 130;
         this.jiangliBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 213;
            y = 165;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GOLD;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("今日锻造经验值：");
         }
         addChild(this.fta);
         this.jingyanFta = new FTextArea();
         with(this.jingyanFta)
         {
            x = 218;
            y = 186;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.jingyanFta);
         this.jingyanBtn = new SecondButton();
         this.jingyanBtn.label = LanResManager.getLanCommonTextWords("领取锻造经验");
         addChild(this.jingyanBtn);
         this.jingyanBtn.x = 228;
         this.jingyanBtn.y = 210;
         this.jingyanBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.shuxingFta = new FTextArea();
         with(this.shuxingFta)
         {
            x = 30;
            y = 260;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.shuxingFta);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.jiangliBtn:
               this.$parent.dispatchEvent(new BaseEvent(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_HUANJIANGLI_CLICK));
               break;
            case this.jingyanBtn:
               this.$parent.dispatchEvent(new BaseEvent(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_LINGQU_JINGYAN_CLICK));
         }
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
         this.myTimer3.addEventListener(TimerEvent.TIMER,this.Turn);
         this.myTimer3.start();
      }
      
      private function setResult() : void
      {
         if(this.arrAggregate == null || this.arrAggregate.length == 0)
         {
            return;
         }
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
         (this.arrAggregate[this.zhuanquanDq] as ItemFace).showGiftSelect(false);
         (this.arrAggregate[this.result - 1] as ItemFace).showGiftSelect(true);
      }
      
      public function StartFun() : void
      {
         this.myTimer3 = new Timer(350,1);
         this.myTimer3.start();
         this.myTimer3.addEventListener(TimerEvent.TIMER,this.Turn);
      }
      
      public function setFuzengDuanzaozhi(param1:int, param2:int) : void
      {
         this.duanzaoFta.htmlText = String(param1);
         this.jingyanFta.htmlText = String(param2);
      }
      
      public function setFuzengShuxing(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.shuxingFta.htmlText = "<textformat leading=\'6\'>" + param1 + "：<br>" + LanResManager.getLanCommonTextWords("附赠奖励：") + param2 + LanResManager.getLanCommonTextWords("；附赠锻造值：") + param3 + LanResManager.getLanCommonTextWords("；附赠锻造经验：") + param4 + "</textformat>";
      }
      
      public function setFuzengGoods(param1:Array, param2:int) : void
      {
         var _loc3_:ItemFace = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         while(this.slots.numChildren > 0)
         {
            this.slots.removeChildAt(0);
         }
         if(param1.length <= 0)
         {
            return;
         }
         this.zqZd = 0;
         this.Ti = 0;
         this.arrAggregate = new Array();
         this.result = param2;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = new ItemFace(param1[_loc4_]);
            _loc5_ = _loc4_ % 4;
            _loc6_ = _loc4_ / 4;
            _loc7_ = _loc5_ * 38;
            _loc8_ = _loc6_ * 38;
            _loc3_.x = _loc7_;
            _loc3_.y = _loc8_;
            this.slots.addChild(_loc3_);
            this.arrAggregate.push(_loc3_);
            _loc4_++;
         }
         this.StartFun();
      }
      
      public function TurnClose(param1:TimerEvent = null) : void
      {
         this.myTimer3.stop();
         this.setResult();
      }
   }
}

