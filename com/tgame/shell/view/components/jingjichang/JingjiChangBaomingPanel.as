package com.tgame.shell.view.components.jingjichang
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.instanceportal.InstancePortalProcessionListPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.*;
   import flash.utils.Timer;
   
   public class JingjiChangBaomingPanel extends FPanel
   {
      
      public static const UI_JINGJIBAOMING_ACCEDEBTN:String = "UI_JINGJIBAOMING_ACCEDEBTN";
      
      public static const UI_JINGJIBAOMING_REFUSEBTN:String = "UI_INSTANCEPORTAL_REFUSEBTN";
      
      private var lb:FLabel;
      
      private var fta:FTextArea;
      
      private var flabel1:FLabel;
      
      private var flabel2:FLabel;
      
      private var flabel3:FLabel;
      
      private var flabel4:FLabel;
      
      private var flabel5:FLabel;
      
      private var ftextarea1:FTextArea;
      
      public var accedeBtn:SecondButton;
      
      public var refuseBtn:SecondButton;
      
      private var headIco:Bitmap;
      
      private var countDownNmuber:int;
      
      private var fbmc:FTextArea;
      
      private var intervalId:int;
      
      private var processionlist:InstancePortalProcessionListPanel;
      
      private var daojishiTimer:Timer;
      
      private var daojishiNum:int = 5;
      
      public function JingjiChangBaomingPanel()
      {
         super();
         dragAble = true;
         this.skin = "sceondPanel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 308;
         height = 265;
         this.initPanel();
      }
      
      private function initPanel() : void
      {
         var v:Vector.<Bitmap>;
         var bg:Bitmap = null;
         titleText = LanResManager.getLanCommonTextWords("竞技场报名");
         bg = new Bitmap();
         bg.name = "ui.instance.portal.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 70;
            y = 16;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("队长") + "：";
         }
         addChild(this.lb);
         this.flabel1 = new FLabel();
         with(this.flabel1)
         {
            x = 124;
            y = 16;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.flabel1);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 206;
            y = 16;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级") + "：";
         }
         addChild(this.lb);
         this.flabel2 = new FLabel();
         with(this.flabel2)
         {
            x = 243;
            y = 16;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.flabel2);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 70;
            y = 43;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮派") + "：";
         }
         addChild(this.lb);
         this.flabel3 = new FLabel();
         with(this.flabel3)
         {
            x = 124;
            y = 43;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.flabel3);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 206;
            y = 43;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("门派") + "：";
         }
         addChild(this.lb);
         this.flabel4 = new FLabel();
         with(this.flabel4)
         {
            x = 243;
            y = 43;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.flabel4);
         this.fbmc = new FTextArea();
         with(this.fbmc)
         {
            x = 12;
            y = 81;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            fbmc.text = LanResManager.getLanCommonTextWords("邀请您与他一起参与跨服竞技场");
         }
         addChild(this.fbmc);
         this.fta = new FTextArea();
         with(this.fta)
         {
            multiline = true;
            wordWrap = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 101;
            width = 270;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'0.1\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("报名后您将会随机遇到来自于其他区服玩家的战斗") + "</font><br>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("在竞技场中您将获得声望与人物经验。声望可用于兑换声望商店中的装备与商城道具.") + "</font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("建议您打开“征服”面板，将需要进入竞技场的药品拖入跨服背包中，否则进入跨服后将无药可用.") + "</font></textformat>";
         }
         addChild(this.fta);
         this.ftextarea1 = new FTextArea();
         with(this.ftextarea1)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 105;
            y = 110;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ftextarea1);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 20;
            y = 180;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("请问您是否同意传送");
         }
         addChild(this.lb);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 200;
            y = 180;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("倒计时") + "：";
         }
         addChild(this.lb);
         this.flabel5 = new FLabel();
         with(this.flabel5)
         {
            x = 265;
            y = 180;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = "15";
         }
         addChild(this.flabel5);
         this.accedeBtn = new SecondButton();
         this.accedeBtn.label = LanResManager.getLanCommonTextWords("同意");
         addChild(this.accedeBtn);
         this.accedeBtn.x = 70;
         this.accedeBtn.y = 209;
         this.accedeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.refuseBtn = new SecondButton();
         this.refuseBtn.label = LanResManager.getLanCommonTextWords("拒绝");
         addChild(this.refuseBtn);
         this.refuseBtn.x = 190;
         this.refuseBtn.y = 209;
         this.refuseBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.headIco = new Bitmap(new BitmapData(60,60,true,0));
         addChild(this.headIco);
         this.headIco.width = this.headIco.height = 48;
         this.headIco.x = 23;
         this.headIco.y = 13;
         this.showProcessionListPanel();
         this.daojishiTimer = new Timer(1000);
         this.daojishiTimer.addEventListener(TimerEvent.TIMER,this.daojishiHandler);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.accedeBtn:
               dispatchEvent(new BaseEvent(UI_JINGJIBAOMING_ACCEDEBTN));
               break;
            case this.refuseBtn:
               dispatchEvent(new BaseEvent(UI_JINGJIBAOMING_REFUSEBTN));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_JINGJIBAOMING_REFUSEBTN));
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function showProcessionListPanel() : void
      {
         if(this.processionlist == null)
         {
            this.processionlist = new InstancePortalProcessionListPanel();
         }
         addChild(this.processionlist);
         this.processionlist.x = 308;
         this.processionlist.y = -25;
      }
      
      public function initBaomingInfo(param1:String, param2:String, param3:int, param4:String, param5:String) : void
      {
         var _loc6_:Bitmap = StaticValue.getBitmapByClassName(param1);
         if(_loc6_)
         {
            this.headIco.bitmapData = _loc6_.bitmapData;
         }
         if(param2.charAt(0) == "[" && param2.indexOf("]") != -1)
         {
            this.flabel1.text = param2.split("]")[1];
         }
         else
         {
            this.flabel1.text = param2;
         }
         this.flabel2.text = String(param3);
         this.flabel3.text = param4;
         this.flabel4.text = param5;
      }
      
      private function daojishiHandler(param1:TimerEvent) : void
      {
         this.flabel5.text = String(this.daojishiNum);
         if(this.daojishiNum == 0)
         {
            this.daojishiTimer.removeEventListener(TimerEvent.TIMER,this.daojishiHandler);
            this.daojishiTimer.stop();
            this.daojishiTimer = null;
            dispatchEvent(new BaseEvent(UI_JINGJIBAOMING_REFUSEBTN));
            return;
         }
         --this.daojishiNum;
      }
      
      public function setCountDownFun(param1:int) : void
      {
         this.flabel5.text = String(param1);
      }
      
      public function setMemberArr(param1:Array) : void
      {
         this.processionlist.giftList.dataProvider = param1;
      }
      
      public function setPanelType(param1:int = 0) : void
      {
         switch(param1)
         {
            case 0:
               this.fta.htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"报名后您将会随机遇到来自于其他区服玩家的战",[StaticValue.ORANGE_HTML,StaticValue.BlUE50_HTML,StaticValue.RED_HTML]) + "</textformat>";
               this.fbmc.text = LanResManager.getLanCommonTextWords("邀请您与他一起参与跨服3v3竞技场");
               titleText = LanResManager.getLanCommonTextWords("竞技场报名");
               break;
            case 1:
               titleText = LanResManager.getLanCommonTextWords("夫妻竞技报名");
               this.fbmc.text = LanResManager.getLanCommonTextWords("邀请您与TA一起参与跨服夫妻竞技场");
               this.fta.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("报名后您将会随机遇到来自于其他区服玩家的战斗") + "<br>" + "</font><font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("在竞技场中您将获得夫妻声望与人物经验。声望") + "<br>" + LanResManager.getLanCommonTextWords("可用于兑换夫妻声望商店中的装备与商城道具.") + "<br>" + "</font><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("建议您打开“征服”面板，将需要进入竞技场的药品") + "<br>" + LanResManager.getLanCommonTextWords("拖入跨服背包中，否则进入跨服后将无药可用") + "</textformat>";
         }
      }
   }
}

