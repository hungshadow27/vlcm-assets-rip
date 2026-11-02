package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class YNzhizuozongziPanel extends FPanel
   {
      
      public static const UI_LABAJIE_ZHIZUO_CLICK:String = "UI_LABAJIE_ZHIZUO_CLICK";
      
      public static const UI_LABAJIE_LINGJIANG_CLICK:String = "UI_LABAJIE_LINGJIANG_CLICK";
      
      private var yifang:FTextArea;
      
      private var lb1:FLabel;
      
      private var lb2:FLabel;
      
      private var lb3:FLabel;
      
      private var lb4:FLabel;
      
      private var lb5:FLabel;
      
      private var doBtn:SecondButton;
      
      private var bg1:DisplayObject;
      
      private var yuanliaoContainer:Sprite;
      
      private var lbTime:FLabel;
      
      private var CjBar:ColorBar;
      
      private var countDownLb:FLabel;
      
      private var myTimer:Timer;
      
      private var Ti:int;
      
      private var spr:Sprite;
      
      private var spr1:Sprite;
      
      private var cas:FCanvas;
      
      public function YNzhizuozongziPanel()
      {
         super();
         skin = "panel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 286;
         height = 217;
         titleText = LanResManager.getLanCommonTextWords("制作粽子");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/2015chunjie/zhizuozongzi_bg.swf");
         this.bg1.x = 2 + 6 + 1;
         this.bg1.y = 2;
         addChild(this.bg1);
         this.init();
      }
      
      private function setinit() : void
      {
         var bit:Bitmap;
         var ft:FTextArea;
         titleText = LanResManager.getLanCommonTextWords("做饭");
         this.cas = new FCanvas();
         this.cas.skin = "box";
         this.cas.x = 10;
         this.cas.y = 2;
         this.cas.height = 90;
         this.cas.width = 265;
         addChild(this.cas);
         this.spr = new Sprite();
         this.spr.x = 0;
         this.spr.y = 0;
         this.cas.addChild(this.spr);
         bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         bit.x = 15 + 10;
         bit.y = 25;
         this.spr.addChild(bit);
         bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         bit.x = 75 + 10;
         bit.y = 25;
         this.spr.addChild(bit);
         bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         bit.x = 135 + 10;
         bit.y = 25;
         this.spr.addChild(bit);
         bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         bit.x = 195 + 10;
         bit.y = 25;
         this.spr.addChild(bit);
         ft = new FTextArea();
         ft.x = 10;
         ft.y = 5;
         ft.htmlText = LanResManager.getLanCommonTextWords("你拥有的物品：");
         ft.textColor = StaticValue.GREEN;
         ft.width = 150;
         this.spr.addChild(ft);
         ft = new FTextArea();
         ft.x = 10;
         ft.y = 105;
         ft.htmlText = LanResManager.getLanCommonTextWords("兑换后将得到的物品：");
         ft.textColor = StaticValue.GREEN;
         ft.width = 150;
         this.spr.addChild(ft);
         bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         bit.x = 150 + 40;
         bit.y = 95;
         this.spr.addChild(bit);
         this.yifang = new FTextArea();
         this.spr.addChild(this.yifang);
         this.yifang.width = 305;
         this.yifang.x = 20 + 70 + 30;
         this.yifang.y = 5;
         this.yifang.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>（0/5）</font>";
         this.lb1 = new FLabel();
         with(this.lb1)
         {
            x = 45 - 13 + 10;
            y = 65;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "0";
         }
         this.spr.addChild(this.lb1);
         this.lb2 = new FLabel();
         with(this.lb2)
         {
            x = 90 + 10;
            y = 65;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "0";
         }
         this.spr.addChild(this.lb2);
         this.lb3 = new FLabel();
         with(this.lb3)
         {
            x = 160 - 12 + 10;
            y = 65;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "0";
         }
         this.spr.addChild(this.lb3);
         this.lb4 = new FLabel();
         with(this.lb4)
         {
            x = 225 - 16 + 10;
            y = 65;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "0";
         }
         this.spr.addChild(this.lb4);
         this.doBtn = new SecondButton();
         this.doBtn.label = LanResManager.getLanCommonTextWords("做饭");
         addChild(this.doBtn);
         this.doBtn.x = 115;
         this.doBtn.y = 188 - 18 - 18;
         this.doBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.spr1 = new Sprite();
         addChild(this.spr1);
         with(this.spr1)
         {
            x = 10;
            y = 2;
         }
      }
      
      private function init() : void
      {
         this.yifang = new FTextArea();
         addChild(this.yifang);
         this.yifang.width = 305;
         this.yifang.x = 20 + 70 + 30;
         this.yifang.y = 30 - 11;
         this.yifang.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>（0/5）</font>";
         this.yuanliaoContainer = new Sprite();
         addChild(this.yuanliaoContainer);
         with(this.yuanliaoContainer)
         {
            x = 17;
            y = 60 - 18;
         }
         this.lb1 = new FLabel();
         with(this.lb1)
         {
            x = 40;
            y = 80;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "0";
         }
         addChild(this.lb1);
         this.lb2 = new FLabel();
         with(this.lb2)
         {
            x = 88;
            y = 80;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "0";
         }
         addChild(this.lb2);
         this.lb3 = new FLabel();
         with(this.lb3)
         {
            x = 140;
            y = 80;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "0";
         }
         addChild(this.lb3);
         this.lb4 = new FLabel();
         with(this.lb4)
         {
            x = 188;
            y = 80;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "0";
         }
         addChild(this.lb4);
         this.lb5 = new FLabel();
         with(this.lb5)
         {
            x = 240;
            y = 80;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "0";
         }
         addChild(this.lb5);
         this.doBtn = new SecondButton();
         this.doBtn.label = LanResManager.getLanCommonTextWords("烹饪");
         addChild(this.doBtn);
         this.doBtn.x = 125;
         this.doBtn.y = 188 - 18 - 18;
         this.doBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.CjBar = new ColorBar(5,160,7,false);
         addChild(this.CjBar);
         this.CjBar.x = 81;
         this.CjBar.y = 152 - 38 + 2;
         this.CjBar.setValue(0,10);
         this.lbTime = new FLabel();
         with(this.lbTime)
         {
            x = 49;
            y = 152 - 4;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("时间");
         }
         addChild(this.lbTime);
         this.countDownLb = new FLabel();
         with(this.countDownLb)
         {
            x = 49 + 70 - 30 + 15;
            y = 152 - 38 - 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.countDownLb);
         this.myTimer = new Timer(1000);
         this.myTimer.addEventListener(TimerEvent.TIMER,this.countDownFun);
         this.myTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.timerComlete);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.myTimer)
         {
            this.myTimer.stop();
         }
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.doBtn:
               this.dispatchEvent(new BaseEvent(UI_LABAJIE_ZHIZUO_CLICK));
         }
      }
      
      public function setInitialize() : void
      {
         var _loc2_:ItemFace = null;
         var _loc4_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:FLabel = null;
         var _loc7_:Goods = null;
         var _loc1_:Array = [740058,740059,740060,740061,740062];
         while(this.yuanliaoContainer.numChildren > 0)
         {
            this.yuanliaoContainer.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc4_ < _loc1_.length)
         {
            _loc5_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc1_[_loc4_],true);
            _loc6_ = this["lb" + (_loc4_ + 1)] as FLabel;
            if(_loc5_.count > 0)
            {
               _loc6_.text = String(_loc5_.count);
               if(_loc5_.count >= 5)
               {
                  _loc3_++;
               }
            }
            else
            {
               _loc6_.text = "0";
            }
            _loc7_ = new Goods(_loc1_[_loc4_]);
            _loc7_.count = 88;
            _loc2_ = new ItemFace(_loc7_);
            _loc2_.setShowCount(true);
            _loc2_.x = 8 + _loc4_ * 50;
            this.yuanliaoContainer.addChild(_loc2_);
            _loc4_++;
         }
         this.yifang.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>（" + _loc3_ + "/5）</font>";
         if(_loc3_ < 5)
         {
            this.doBtn.enabled = false;
         }
         else
         {
            this.doBtn.enabled = true;
         }
         this.doBtn.label = LanResManager.getLanCommonTextWords("烹饪");
         this.countDownLb.text = " ";
         this.CjBar.setValue(0,3);
      }
      
      private function countDownFun(param1:TimerEvent) : void
      {
         --this.Ti;
         if(this.Ti == 0)
         {
            this.doBtn.label = LanResManager.getLanCommonTextWords("烹饪");
            this.doBtn.x = 125;
            this.doBtn.enabled = true;
            this.countDownLb.text = " ";
            this.CjBar.setValue(0,3);
         }
         else
         {
            this.countDownLb.text = LanResManager.getLanCommonTextWords("剩余时间") + "：" + String(this.Ti) + LanResManager.getLanCommonTextWords("秒");
            this.doBtn.enabled = false;
            this.doBtn.label = LanResManager.getLanCommonTextWords("烹饪中");
            this.doBtn.x = 120;
            this.CjBar.setValue(this.Ti,3);
         }
      }
      
      private function timerComlete(param1:TimerEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[14]);
         if(this.myTimer)
         {
            this.myTimer.stop();
         }
      }
      
      public function setTime(param1:int, param2:int = 0) : void
      {
         this.setInitialize();
         if(param2 == 0)
         {
            return;
         }
         if(param1 < 0)
         {
            this.myTimer.stop();
            this.myTimer.reset();
            this.Ti = 0;
            this.doBtn.label = LanResManager.getLanCommonTextWords("烹饪");
            this.doBtn.x = 125;
            this.doBtn.enabled = true;
            this.countDownLb.text = " ";
         }
         else if(param1 == 0)
         {
            this.myTimer.stop();
            this.myTimer.reset();
            this.doBtn.label = LanResManager.getLanCommonTextWords("烹饪");
            this.doBtn.x = 125;
            this.doBtn.enabled = true;
            this.countDownLb.text = " ";
            this.CjBar.setValue(0,3);
         }
         else
         {
            this.Ti = param1;
            this.doBtn.label == LanResManager.getLanCommonTextWords("烹饪中");
            this.doBtn.x = 120;
            this.doBtn.enabled = false;
            this.CjBar.setValue(this.Ti,3);
            this.myTimer.stop();
            this.myTimer.reset();
            this.myTimer.repeatCount = this.Ti;
            this.myTimer.start();
         }
      }
      
      public function setInitialize1() : void
      {
         var _loc2_:ItemFace = null;
         var _loc4_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:FLabel = null;
         var _loc1_:Array = [723051,723052,723053,723054];
         while(this.spr1.numChildren > 0)
         {
            this.spr1.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc4_ < _loc1_.length)
         {
            _loc5_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc1_[_loc4_],true);
            _loc6_ = this["lb" + (_loc4_ + 1)] as FLabel;
            if(_loc5_.count > 0)
            {
               _loc6_.text = String(_loc5_.count);
               _loc3_++;
            }
            else
            {
               _loc6_.text = "0";
            }
            _loc2_ = new ItemFace(new Goods(_loc1_[_loc4_]));
            _loc2_.setShowCount(false);
            _loc2_.x = 25 + _loc4_ * 60 + 2;
            _loc2_.y = 27;
            this.spr1.addChild(_loc2_);
            _loc4_++;
         }
         this.yifang.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>（" + _loc3_ + "/4）</font>";
         if(_loc3_ < 4)
         {
            this.doBtn.enabled = false;
         }
         else
         {
            this.doBtn.enabled = true;
         }
         _loc2_ = new ItemFace(new Goods(723055));
         _loc2_.setShowCount(false);
         _loc2_.x = 152 + 40;
         _loc2_.y = 97;
         this.spr1.addChild(_loc2_);
         this.doBtn.label = LanResManager.getLanCommonTextWords("制作");
      }
   }
}

