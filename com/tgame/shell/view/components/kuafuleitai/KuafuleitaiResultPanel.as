package com.tgame.shell.view.components.kuafuleitai
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class KuafuleitaiResultPanel extends FPanel
   {
      
      public static const LEAVE_LEITAI:String = "LEAVE_LEITAI";
      
      private var playerList:FList;
      
      private var scrollbar:FVScorllBar;
      
      private var leaveBtn:SmallButton;
      
      private var ftext:FTextArea;
      
      private var _timer:Timer;
      
      private var fc1:FCanvas;
      
      public function KuafuleitaiResultPanel()
      {
         var lb:FLabel;
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 305;
         height = 339;
         this.titleText = LanResManager.getLanCommonTextWords("比赛结果");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.fc1 = new FCanvas();
         this.fc1.width = 286;
         this.fc1.height = 270;
         this.fc1.x = 10;
         this.fc1.y = 2;
         this.fc1.skin = "box";
         addChild(this.fc1);
         lb = new FLabel();
         with(lb)
         {
            x = 22;
            y = 4;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("玩家名称");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 103;
            y = 4;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 153;
            y = 4;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("死亡次数");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 219;
            y = 4;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("击败玩家");
         }
         addChild(lb);
         this.playerList = new FList();
         this.playerList.itemRenderer = new KuafuleitaiResultItemRenderer();
         this.playerList.listHeight = 250;
         this.playerList.listWidth = 255;
         this.playerList.skin = "list";
         this.playerList.x = 20;
         this.playerList.y = 20;
         addChild(this.playerList);
         this.scrollbar = new FVScorllBar(this.playerList,250);
         this.scrollbar.x = 278;
         this.scrollbar.y = 20;
         addChild(this.scrollbar);
         this.leaveBtn = new SmallButton();
         this.leaveBtn.label = LanResManager.getLanCommonTextWords("离开擂台");
         this.leaveBtn.x = 127;
         this.leaveBtn.y = 274;
         this.leaveBtn.addEventListener(MouseEvent.CLICK,this.onLeaveClick);
         addChild(this.leaveBtn);
         this.ftext = new FTextArea();
         with(this.ftext)
         {
            x = 197;
            y = 276;
            filters = StaticValue.filter;
            textColor = StaticValue.RED;
            text = LanResManager.getLanCommonTextWords("倒计时：10秒");
         }
         addChild(this.ftext);
      }
      
      private function onLeaveClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(LEAVE_LEITAI));
      }
      
      private function onClose(param1:Event) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setResultList(param1:XML) : void
      {
         this.playerList.dataProvider = param1;
         this.scrollbar.update();
         this.startTimer();
      }
      
      public function setCountText(param1:String) : void
      {
         this.ftext.text = param1;
      }
      
      private function startTimer() : void
      {
         if(this._timer)
         {
            this._timer.reset();
         }
         this._timer = new Timer(1000,10);
         this._timer.addEventListener(TimerEvent.TIMER,this.onCloseTimer);
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onCloseTimerComplete);
         this._timer.start();
         this.ftext.text = LanResManager.getLanTextWords(this,"倒计时秒",[(this._timer.repeatCount - this._timer.currentCount).toString()]);
      }
      
      private function onCloseTimerComplete(param1:TimerEvent) : void
      {
         dispatchEvent(new BaseEvent(LEAVE_LEITAI));
      }
      
      private function onCloseTimer(param1:TimerEvent) : void
      {
         this.ftext.text = LanResManager.getLanTextWords(this,"倒计时秒",[(this._timer.repeatCount - this._timer.currentCount).toString()]);
      }
   }
}

