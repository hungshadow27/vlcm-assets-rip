package com.tgame.shell.view.components
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
   
   public class KuaFuZhanChangPanel extends FPanel
   {
      
      public static const UI_XIANGYANGZHANCHANGBAOMING_ACCEDEBTN:String = "UI_XIANGYANGZHANCHANGBAOMING_ACCEDEBTN";
      
      public static const UI_XIANGYANGZHANCHANG_REFUSEBTN:String = "UI_XIANGYANGZHANCHANG_REFUSEBTN";
      
      private var lb:FLabel;
      
      private var fta:FTextArea;
      
      private var ft_dz:FLabel;
      
      private var ft_lv:FLabel;
      
      private var ft_bp:FLabel;
      
      private var ft_mp:FLabel;
      
      private var ft_djs:FLabel;
      
      private var ftextarea1:FTextArea;
      
      public var btn_ok:SecondButton;
      
      public var btn_cancel:SecondButton;
      
      private var headIco:Bitmap;
      
      private var countDownNmuber:int;
      
      private var fbmc:FTextArea;
      
      private var intervalId:int;
      
      private var processionlist:InstancePortalProcessionListPanel;
      
      private var daojishiTimer:Timer;
      
      private var daojishiNum:int = 5;
      
      public function KuaFuZhanChangPanel()
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
         this.Title = StaticValue.getBitmapByClassName("ui.jingjichang.title");
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
            x = 76;
            y = 17;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("队长") + "：";
         }
         addChild(this.lb);
         this.ft_dz = new FLabel();
         with(this.ft_dz)
         {
            x = 124;
            y = 17;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.ft_dz);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 203;
            y = 17;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级") + "：";
         }
         addChild(this.lb);
         this.ft_lv = new FLabel();
         with(this.ft_lv)
         {
            x = 243;
            y = 17;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.ft_lv);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 76;
            y = 43;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮派") + "：";
         }
         addChild(this.lb);
         this.ft_bp = new FLabel();
         with(this.ft_bp)
         {
            x = 124;
            y = 43;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.ft_bp);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 203;
            y = 43;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("门派") + "：";
         }
         addChild(this.lb);
         this.ft_mp = new FLabel();
         with(this.ft_mp)
         {
            x = 243;
            y = 43;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.ft_mp);
         this.fbmc = new FTextArea();
         with(this.fbmc)
         {
            x = 25;
            y = 81;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            fbmc.text = LanResManager.getLanCommonTextWords("邀请您进入跨服襄阳战场");
         }
         addChild(this.fbmc);
         this.fta = new FTextArea();
         with(this.fta)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 104;
            width = 308;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanTextWords(this,"襄阳地势险要，自古以来皆为兵家必争之地。南宋宝佑五年，蒙古灭金国，平内乱。蒙古大汗蒙哥于第二年出兵攻宋，襄阳作为南宋抵抗蒙古军队的边隆重镇首当其冲。宋、蒙两军纷纷广发募兵令号召各路豪杰前来助阵。襄阳军情告急，大战一触即发！") + "</textformat>";
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
            text = LanResManager.getLanTextWords(this,"请问您是否同意传送？");
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
         this.ft_djs = new FLabel();
         with(this.ft_djs)
         {
            x = 265;
            y = 180;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("15");
         }
         addChild(this.ft_djs);
         this.btn_ok = new SecondButton();
         this.btn_ok.label = LanResManager.getLanCommonTextWords("同意");
         addChild(this.btn_ok);
         this.btn_ok.x = 70;
         this.btn_ok.y = 209;
         this.btn_ok.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn_cancel = new SecondButton();
         this.btn_cancel.label = LanResManager.getLanCommonTextWords("拒绝");
         addChild(this.btn_cancel);
         this.btn_cancel.x = 190;
         this.btn_cancel.y = 209;
         this.btn_cancel.addEventListener(MouseEvent.CLICK,this.onClick);
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
            case this.btn_ok:
               dispatchEvent(new BaseEvent(UI_XIANGYANGZHANCHANGBAOMING_ACCEDEBTN));
               break;
            case this.btn_cancel:
               dispatchEvent(new BaseEvent(UI_XIANGYANGZHANCHANG_REFUSEBTN));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_XIANGYANGZHANCHANG_REFUSEBTN));
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
            this.ft_dz.text = param2.split("]")[1];
         }
         else
         {
            this.ft_dz.text = param2;
         }
         this.ft_lv.text = String(param3);
         this.ft_bp.text = param4;
         this.ft_mp.text = param5;
      }
      
      private function daojishiHandler(param1:TimerEvent) : void
      {
         this.ft_djs.text = String(this.daojishiNum);
         if(this.daojishiNum == 0)
         {
            this.daojishiTimer.removeEventListener(TimerEvent.TIMER,this.daojishiHandler);
            this.daojishiTimer.stop();
            this.daojishiTimer = null;
            dispatchEvent(new BaseEvent(UI_XIANGYANGZHANCHANG_REFUSEBTN));
            return;
         }
         --this.daojishiNum;
      }
      
      public function setCountDownFun(param1:int) : void
      {
         this.ft_djs.text = String(param1);
      }
      
      public function setMemberArr(param1:Array) : void
      {
         this.processionlist.giftList.dataProvider = param1;
      }
   }
}

