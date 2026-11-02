package com.tgame.shell.view.components.active
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.GiftPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.*;
   import flash.utils.Timer;
   
   public class GuajiList extends FListCellRenderer
   {
      
      public static var _$parent:DisplayObject;
      
      private var nameLabel:FTextArea;
      
      private var timeLabel:FTextArea;
      
      private var lqBtn:SecondButton;
      
      private var ybLabel:FTextArea;
      
      private var timerNum:Number;
      
      private var timer:Timer;
      
      public function GuajiList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var onTimer:Function = null;
         var setTimer:Function = function(param1:int):void
         {
            timerNum = param1 / 1000;
            if(timerNum > 0)
            {
               if(timer)
               {
                  timer.reset();
                  timer.start();
               }
               else
               {
                  timer = new Timer(1000);
                  timer.addEventListener(TimerEvent.TIMER,onTimer);
                  timer.start();
               }
            }
            else
            {
               lqBtn.label = LanResManager.getLanCommonTextWords("领取奖励");
               ybLabel.visible = false;
               timeLabel.htmlText = "0:0";
            }
         };
         onTimer = function(param1:TimerEvent):void
         {
            --timerNum;
            if(timerNum <= 1)
            {
               timer.stop();
               timer.removeEventListener(TimerEvent.TIMER,onTimer);
               timer = null;
               lqBtn.label = LanResManager.getLanCommonTextWords("领取奖励");
               ybLabel.visible = false;
            }
            else if(ActiveFubenPKCanvas.tupoBo == false)
            {
               timer.stop();
               timer.removeEventListener(TimerEvent.TIMER,onTimer);
               timer = null;
            }
            else
            {
               lqBtn.label = LanResManager.getLanCommonTextWords("立即完成");
               ybLabel.visible = true;
            }
            timeLabel.htmlText = Math.floor(timerNum / 60) + ":" + Math.floor(timerNum % 60);
         };
         _height = 39;
         this.nameLabel = new FTextArea();
         with(this.nameLabel)
         {
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = data.name;
            x = 2;
            y = 12;
         }
         addChild(this.nameLabel);
         this.lqBtn = new SecondButton();
         addChild(this.lqBtn);
         this.lqBtn.x = 145;
         this.lqBtn.y = 10;
         this.lqBtn.label = LanResManager.getLanCommonTextWords("立即完成");
         this.lqBtn.name = data.gjId;
         this.lqBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.ybLabel = new FTextArea();
         with(this.ybLabel)
         {
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("消耗") + data.yuanbao + LanResManager.getLanCommonTextWords("元宝");
            x = 223;
            y = 12;
            visible = false;
         }
         addChild(this.ybLabel);
         this.timeLabel = new FTextArea();
         with(this.timeLabel)
         {
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
            x = 99;
            y = 12;
         }
         addChild(this.timeLabel);
         setTimer(data.time);
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         switch((param1.target as SecondButton).label)
         {
            case LanResManager.getLanCommonTextWords("立即完成"):
               _$parent.dispatchEvent(new BaseEvent(GiftPanel.UI_LIJIWANCHENG_LINGQUJIANGLI_BTN_CLICK,"",[param1.currentTarget.name,0]));
               break;
            case LanResManager.getLanCommonTextWords("领取奖励"):
               _$parent.dispatchEvent(new BaseEvent(GiftPanel.UI_LIJIWANCHENG_LINGQUJIANGLI_BTN_CLICK,"",[param1.currentTarget.name,1]));
         }
      }
   }
}

