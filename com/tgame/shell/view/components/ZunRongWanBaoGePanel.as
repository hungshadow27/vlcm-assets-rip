package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.zunrongwanbaoge.ZunRongWanBaoGeBaoShiFace;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   
   public class ZunRongWanBaoGePanel extends FPanel
   {
      
      public static const UI_ZUNRONGWANBAOGE_BAOSHIJIANSHANG_OK_BTN_CLICK:String = "UI_ZUNRONGWANBAOGE_BAOSHIJIANSHANG_OK_BTN_CLICK";
      
      private var lb:FLabel;
      
      private var jianbaoling:FTextArea;
      
      private var jianbaolingNum:FTextArea;
      
      private var buyBtn:SecondButton;
      
      private var okBtn:SecondButton;
      
      private var timerTxt:FTextArea;
      
      private var tf:TextFormat = new TextFormat();
      
      private var baoShiFaceArr:Array = new Array();
      
      private var timer:Timer = new Timer(1000);
      
      private var timerNum:int;
      
      public function ZunRongWanBaoGePanel()
      {
         var _loc1_:FTextArea = null;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 641;
         height = 564;
         this.titleText = LanResManager.getLanCommonTextWords("宝石鉴赏");
         this.addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tf.size = 15;
         this.tf.bold = true;
         this.lb = new FLabel();
         this.lb.x = 40;
         this.lb.y = 5;
         this.lb.filters = StaticValue.filter;
         this.lb.textColor = StaticValue.YELLOW;
         this.lb.text = LanResManager.getLanCommonTextWords("倍奖励倍奖励倍奖励倍奖励");
         this.lb.setTextFormat(this.tf);
         addChild(this.lb);
         this.jianbaoling = new FTextArea();
         this.jianbaoling.x = 350;
         this.jianbaoling.y = 500;
         this.jianbaoling.textColor = StaticValue.YELLOW;
         this.jianbaoling.filters = StaticValue.filter;
         this.jianbaoling.text = LanResManager.getLanCommonTextWords("剩余通天鉴：");
         this.addChild(this.jianbaoling);
         this.jianbaolingNum = new FTextArea();
         this.jianbaolingNum.x = this.jianbaoling.x + 80;
         this.jianbaolingNum.y = this.jianbaoling.y;
         this.jianbaolingNum.textColor = StaticValue.YELLOW;
         this.jianbaolingNum.filters = StaticValue.filter;
         this.jianbaolingNum.text = "99999999";
         this.addChild(this.jianbaolingNum);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 520;
         this.okBtn.y = 442 + 20;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lb = new FLabel();
         this.lb.x = 479;
         this.lb.y = 244;
         this.lb.filters = StaticValue.filter;
         this.lb.textColor = StaticValue.YELLOW;
         this.lb.text = LanResManager.getLanCommonTextWords("本次鉴宝剩余时间");
         this.lb.setTextFormat(this.tf);
         addChild(this.lb);
         this.timerTxt = new FTextArea();
         this.timerTxt.x = 479 + 35;
         this.timerTxt.y = 244 + 30;
         this.timerTxt.filters = StaticValue.filter;
         this.timerTxt.textColor = StaticValue.YELLOW;
         this.timerTxt.text = LanResManager.getLanCommonTextWords("分秒");
         this.timerTxt.setTextFormat(this.tf);
         addChild(this.timerTxt);
         _loc1_ = new FTextArea();
         _loc1_.x = 479;
         _loc1_.y = 328 - 23;
         _loc1_.multiline = true;
         _loc1_.wordWrap = true;
         _loc1_.width = 140;
         _loc1_.height = 155;
         _loc1_.filters = StaticValue.filter;
         _loc1_.textColor = StaticValue.RED;
         _loc1_.text = LanResManager.getLanCommonTextWords("注意：每次下注需要消耗道具《通天鉴》，需要在鉴宝时间结束之前点击确定才能使下注成功，剩余时间为0时，本界面将自动关闭");
         _loc1_.setTextFormat(this.tf);
         addChild(_loc1_);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         switch(param1.target)
         {
            case this.okBtn:
               _loc2_ = new Array();
               _loc3_ = new Array();
               _loc4_ = new Array();
               _loc5_ = new Array();
               _loc6_ = 0;
               while(_loc6_ < this.baoShiFaceArr.length)
               {
                  if(int(this.baoShiFaceArr[_loc6_].yaZhuNum.text) > 0)
                  {
                     if(this.baoShiFaceArr[_loc6_].beishu == 10)
                     {
                        _loc2_.push(this.baoShiFaceArr[_loc6_].type);
                        _loc2_.push(int(this.baoShiFaceArr[_loc6_].yaZhuNum.text));
                     }
                     else if(this.baoShiFaceArr[_loc6_].beishu == 5)
                     {
                        _loc3_.push(this.baoShiFaceArr[_loc6_].type);
                        _loc3_.push(int(this.baoShiFaceArr[_loc6_].yaZhuNum.text));
                     }
                     else if(this.baoShiFaceArr[_loc6_].beishu == 2.5)
                     {
                        _loc4_.push(this.baoShiFaceArr[_loc6_].type);
                        _loc4_.push(int(this.baoShiFaceArr[_loc6_].yaZhuNum.text));
                     }
                     else if(this.baoShiFaceArr[_loc6_].beishu == 2)
                     {
                        _loc5_.push(this.baoShiFaceArr[_loc6_].type);
                        _loc5_.push(int(this.baoShiFaceArr[_loc6_].yaZhuNum.text));
                     }
                  }
                  _loc6_++;
               }
               this.dispatchEvent(new BaseEvent(UI_ZUNRONGWANBAOGE_BAOSHIJIANSHANG_OK_BTN_CLICK,"",{
                  "info1":_loc2_,
                  "info2":_loc3_,
                  "info3":_loc4_,
                  "info4":_loc5_
               }));
         }
      }
      
      private function setShowBaoShi(param1:Number, param2:int, param3:Array) : void
      {
         var _loc4_:ZunRongWanBaoGeBaoShiFace = null;
         var _loc5_:Array = new Array();
         var _loc6_:int = 0;
         switch(param1)
         {
            case 2:
               _loc6_ = 0;
               while(_loc6_ < param3.length)
               {
                  _loc5_ = [];
                  _loc5_.push(param3[_loc6_],param3[_loc6_ + 1],param3[_loc6_ + 2],param3[_loc6_ + 3],param3[_loc6_ + 4]);
                  _loc4_ = new ZunRongWanBaoGeBaoShiFace(_loc5_);
                  _loc4_.x = 478;
                  _loc4_.y = 25 + 15.5 * _loc6_;
                  _loc4_.type = param3[_loc6_ + 5];
                  _loc4_.beishu = param1;
                  this.addChild(_loc4_);
                  this.baoShiFaceArr.push(_loc4_);
                  _loc6_ += 6;
               }
               break;
            case 2.5:
               _loc6_ = 0;
               while(_loc6_ < param3.length)
               {
                  _loc5_ = [];
                  _loc5_.push(param3[_loc6_],param3[_loc6_ + 1],param3[_loc6_ + 2],param3[_loc6_ + 3]);
                  _loc4_ = new ZunRongWanBaoGeBaoShiFace(_loc5_);
                  _loc4_.x = 315;
                  _loc4_.y = 25 + 18.5 * _loc6_;
                  _loc4_.type = param3[_loc6_ + 4];
                  _loc4_.beishu = param1;
                  this.addChild(_loc4_);
                  this.baoShiFaceArr.push(_loc4_);
                  _loc6_ += 5;
               }
               break;
            case 5:
               _loc6_ = 0;
               while(_loc6_ < param3.length)
               {
                  _loc5_ = [];
                  _loc5_.push(param3[_loc6_],param3[_loc6_ + 1]);
                  _loc4_ = new ZunRongWanBaoGeBaoShiFace(_loc5_);
                  _loc4_.x = 152;
                  _loc4_.y = 25 + 31 * _loc6_;
                  _loc4_.type = param3[_loc6_ + 2];
                  _loc4_.beishu = param1;
                  this.addChild(_loc4_);
                  this.baoShiFaceArr.push(_loc4_);
                  _loc6_ += 3;
               }
               break;
            case 10:
               _loc6_ = 0;
               while(_loc6_ < param3.length)
               {
                  _loc5_ = [];
                  _loc5_.push(param3[_loc6_]);
                  _loc4_ = new ZunRongWanBaoGeBaoShiFace(_loc5_);
                  _loc4_.x = 12;
                  _loc4_.y = 25 + 23 * _loc6_;
                  _loc4_.type = param3[_loc6_ + 1];
                  _loc4_.beishu = param1;
                  this.addChild(_loc4_);
                  this.baoShiFaceArr.push(_loc4_);
                  _loc6_ += 2;
               }
         }
      }
      
      private function clear() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.baoShiFaceArr.length)
         {
            if(this.baoShiFaceArr[_loc1_].parent)
            {
               this.baoShiFaceArr[_loc1_].parent.removeChild(this.baoShiFaceArr[_loc1_]);
            }
            _loc1_++;
         }
         this.baoShiFaceArr = [];
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this.timerNum -= 1000;
         if(this.timerNum <= 0)
         {
            this.timerNum = 0;
            this.timer.stop();
            if(parent != null)
            {
               parent.removeChild(this);
            }
         }
         this.timerTxt.text = Math.floor(this.timerNum / 1000 / 60) % 60 + LanResManager.getLanCommonTextWords("分") + Math.floor(this.timerNum / 1000 % 60) + LanResManager.getLanCommonTextWords("秒");
         this.timerTxt.setTextFormat(this.tf);
      }
      
      public function setBaoShiInfo(param1:Array) : void
      {
         this.clear();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.setShowBaoShi(param1[_loc2_].beishu,param1[_loc2_].type,param1[_loc2_].info);
            _loc2_++;
         }
      }
      
      public function setTimer(param1:int) : void
      {
         this.timerNum = param1;
         this.timerTxt.text = Math.floor(this.timerNum / 1000 / 60) % 60 + LanResManager.getLanCommonTextWords("分") + Math.floor(this.timerNum / 1000 % 60) + LanResManager.getLanCommonTextWords("秒");
         this.timerTxt.setTextFormat(this.tf);
         if(this.timerNum >= 1000)
         {
            this.timer.reset();
            this.timer.start();
         }
      }
      
      public function setJianBaoLingNum(param1:int) : void
      {
         this.jianbaolingNum.text = String(param1);
      }
   }
}

