package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.*;
   import flash.text.*;
   import flash.utils.Timer;
   
   public class Party_task_InvitePanel extends FPanel
   {
      
      public static const UI_PARTYTASK_JIEQURENWU_CLICK:String = "UI_PARTYTASK_JIEQURENWU_CLICK";
      
      public static const UI_PARTYTASK_JIEQURENWU_CLICK_OK:String = "UI_PARTYTASK_JIEQURENWU_CLICK_OK";
      
      private var goodsBg:Sprite;
      
      private var goodsTx:Bitmap;
      
      private var curGoodId:int;
      
      public var bgImg:Bitmap;
      
      public var pathBgImg:Bitmap;
      
      public var pathImg:Bitmap;
      
      private var ftCont:FTextArea;
      
      private var ftPrise:FTextArea;
      
      private var ftTimer:FTextArea;
      
      private var tCount:int = 60;
      
      private var timer:Timer;
      
      private var v:Vector.<Bitmap>;
      
      private var btnAccept:SecondButton;
      
      private var btnCancel:SecondButton;
      
      private var pathBg:Sprite;
      
      public function Party_task_InvitePanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 583;
         height = 300;
         this.titleText = LanResManager.getLanCommonTextWords("帮会日常运镖任务邀请");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.party.task.yaoqing.ui";
         this.bgImg.x = 9;
         this.bgImg.y = 3;
         addChild(this.bgImg);
         this.v = new Vector.<Bitmap>();
         this.v.push(this.bgImg);
         this.DynamicManageImages = this.v;
         this.btnAccept = new SecondButton();
         with(this.btnAccept)
         {
            x = 150;
            y = 235;
            label = LanResManager.getLanCommonTextWords("接取任务");
            addEventListener(MouseEvent.CLICK,onAcceptClick);
         }
         addChild(this.btnAccept);
         this.btnCancel = new SecondButton();
         with(this.btnCancel)
         {
            x = 371;
            y = 235;
            label = LanResManager.getLanCommonTextWords("取消");
            addEventListener(MouseEvent.CLICK,onCancelClick);
         }
         addChild(this.btnCancel);
         this.initUI();
      }
      
      private function initUI() : void
      {
         var ft:FTextArea;
         this.pathBg = new Sprite();
         addChild(this.pathBg);
         this.ftCont = new FTextArea();
         with(this.ftCont)
         {
            x = 315;
            y = 5;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("帮会日常运镖邀请") + "：<br>" + LanResManager.getLanCommonTextWords("本帮主接取了帮会日常运镖任务") + "，<br>" + LanResManager.getLanCommonTextWords("希望您能够参加帮会日常运镖任务") + "。";
         }
         addChild(this.ftCont);
         ft = new FTextArea();
         with(ft)
         {
            x = 318;
            y = 60;
            width = 260;
            height = 60;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("完成任务奖励") + "：";
         }
         addChild(ft);
         this.ftPrise = new FTextArea();
         with(this.ftPrise)
         {
            x = 348;
            y = 75;
            width = 260;
            height = 60;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("经验") + "xxx    " + LanResManager.getLanCommonTextWords("铜币") + "xxx <br>" + LanResManager.getLanCommonTextWords("真气") + "  " + LanResManager.getLanCommonTextWords("选取一件道具");
         }
         addChild(this.ftPrise);
         this.ftTimer = new FTextArea();
         with(this.ftTimer)
         {
            x = 318;
            y = 205;
            width = 260;
            height = 20;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("接取任务倒计时") + ":XX" + LanResManager.getLanCommonTextWords("秒");
         }
         addChild(this.ftTimer);
         this.goodsBg = new Sprite();
         this.goodsBg.x = 315;
         this.goodsBg.y = ft.y + ft.height - 3;
         addChild(this.goodsBg);
         while(!Goods.prototype)
         {
         }
         this.setPath(1);
      }
      
      public function setPath(param1:int) : void
      {
         var _loc2_:String = null;
         var _loc3_:Bitmap = null;
         while(this.pathBg.numChildren)
         {
            this.pathBg.removeChildAt(0);
         }
         switch(param1)
         {
            case 1:
               _loc2_ = "ui.party.task.yaoqing.2";
               break;
            case 2:
               _loc2_ = "ui.party.task.yaoqing.1";
               break;
            case 3:
               _loc2_ = "ui.party.task.yaoqing.3";
         }
         _loc3_ = StaticValue.getBitmapByClassName(_loc2_);
         this.pathBg.addChild(_loc3_);
         _loc3_.x = 12;
         _loc3_.y = 6;
      }
      
      public function setBangzhu(param1:String) : void
      {
         this.ftCont.htmlText = LanResManager.getLanCommonTextWords("帮会日常运镖邀请") + "：<br>" + LanResManager.getLanCommonTextWords("本帮主") + param1 + LanResManager.getLanCommonTextWords("接取了帮会日常运镖任务") + "，<br>" + LanResManager.getLanCommonTextWords("希望您能够参加帮会日常运镖任务") + "。";
      }
      
      public function setPrise(param1:int, param2:int, param3:int) : void
      {
         this.ftPrise.htmlText = LanResManager.getLanCommonTextWords("经验") + " " + param1 + "   " + LanResManager.getLanCommonTextWords("铜币") + " " + param2 + " <br>" + LanResManager.getLanCommonTextWords("真气") + " " + param3 + "  " + LanResManager.getLanCommonTextWords("选取一件道具");
      }
      
      public function initGoodsList(param1:Array) : void
      {
         var _loc3_:ItemFace = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(this.goodsBg.numChildren)
         {
            this.goodsBg.removeChildAt(0);
         }
         var _loc2_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = _loc4_ % 6;
            _loc6_ = _loc4_ / 6;
            _loc3_ = new ItemFace(param1[_loc4_] as Goods);
            _loc3_.name = _loc4_.toString();
            this.goodsBg.addChild(_loc3_);
            _loc3_.x = _loc5_ * 43 + 2;
            _loc3_.y = _loc6_ * 42 + 2;
            _loc4_++;
         }
      }
      
      public function setTimer(param1:int) : void
      {
         this.tCount = param1;
         this.timer = new Timer(1000,60);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this.timer.start();
      }
      
      public function popGeren(param1:int) : void
      {
         var str:String = null;
         var str1:String = null;
         var type:int = param1;
         switch(type)
         {
            case 1:
               str = "<font color=\'" + StaticValue.WHITE + "\'>" + LanResManager.getLanCommonTextWords("您现在处于个人运镖状态") + "，<br>" + LanResManager.getLanCommonTextWords("您确认放弃此次个人运镖任务") + "，<br>" + LanResManager.getLanCommonTextWords("参加帮会日常运镖任务吗") + "？" + "</font>";
               FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
               FAlert.show(str,"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     dispatchEvent(new BaseEvent(Party_task_InvitePanel.UI_PARTYTASK_JIEQURENWU_CLICK_OK,"",1));
                  }
                  else
                  {
                     dispatchEvent(new BaseEvent(Party_task_InvitePanel.UI_PARTYTASK_JIEQURENWU_CLICK_OK,"",0));
                  }
               });
               break;
            case 2:
               str1 = "<font color=\'" + StaticValue.WHITE + "\'>" + LanResManager.getLanCommonTextWords("您现在处于副本中") + "，<br>" + LanResManager.getLanCommonTextWords("您确认离开副本") + "，<br>" + LanResManager.getLanCommonTextWords("参加此次帮会日常运镖任务吗") + "？" + "</font>";
               FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
               FAlert.show(str1,"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     dispatchEvent(new BaseEvent(Party_task_InvitePanel.UI_PARTYTASK_JIEQURENWU_CLICK_OK,"",1));
                  }
                  else
                  {
                     dispatchEvent(new BaseEvent(Party_task_InvitePanel.UI_PARTYTASK_JIEQURENWU_CLICK_OK,"",0));
                  }
               });
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         --this.tCount;
         this.ftTimer.htmlText = LanResManager.getLanCommonTextWords("接取任务倒计时") + ":" + this.tCount + LanResManager.getLanCommonTextWords("秒");
         if(this.tCount <= 0)
         {
            this.ftTimer.htmlText = LanResManager.getLanCommonTextWords("超时");
            this.timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this.timer.stop();
         }
      }
      
      private function onItemClick(param1:int) : Function
      {
         var n:int = param1;
         var fun:Function = function(param1:MouseEvent):void
         {
            curGoodId = n;
            goodsTx = new Bitmap();
            var _loc2_:int = n % 6;
            var _loc3_:int = n / 6;
            goodsTx.x = _loc2_ * 43;
            goodsTx.y = _loc3_ * 42;
         };
         return fun;
      }
      
      private function onAcceptClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_PARTYTASK_JIEQURENWU_CLICK,"",1));
      }
      
      private function onCancelClick(param1:MouseEvent) : void
      {
         this.onClose();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         dispatchEvent(new BaseEvent(UI_PARTYTASK_JIEQURENWU_CLICK,"",0));
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

