package com.tgame.shell.view.components.tunshitiandi
{
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.moudels.tunShiTianDi.view.info.ShuXingJiaChen;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   
   public class TunShiTianDi_ZhenRongPanel extends FPanel
   {
      
      public static const SHOW_TUNSHITIANDI_DUIWUXINXI:String = "SHOW_TUNSHITIANDI_DUIWUXINXI";
      
      public static const SHOW_TUNSHITIANDI_XUANZE_CLICK:String = "SHOW_TUNSHITIANDI_XUANZE_CLICK";
      
      public static const SHOW_TUNSHITIANDI_SHUXING_CLICK:String = "SHOW_TUNSHITIANDI_SHUXING_CLICK";
      
      private var bg:DisplayObject;
      
      public var renWuSpr:Sprite;
      
      private var renwu0:DisplayObject;
      
      private var renwu1:DisplayObject;
      
      private var renwu2:DisplayObject;
      
      private var renwu3:DisplayObject;
      
      private var renwu4:DisplayObject;
      
      private var renwu5:DisplayObject;
      
      private var renwu6:DisplayObject;
      
      private var renwu7:DisplayObject;
      
      private var renwu8:DisplayObject;
      
      private var renwu9:DisplayObject;
      
      private var zhiye1:FTextArea;
      
      private var zhiye2:FTextArea;
      
      private var zhiye3:FTextArea;
      
      private var zhiye4:FTextArea;
      
      private var zhiye5:FTextArea;
      
      private var zhiye6:FTextArea;
      
      private var zhiye7:FTextArea;
      
      private var zhiye8:FTextArea;
      
      private var zhiye9:FTextArea;
      
      private var zhiye0:FTextArea;
      
      private var name1:FTextArea;
      
      private var name2:FTextArea;
      
      private var name3:FTextArea;
      
      private var name4:FTextArea;
      
      private var name5:FTextArea;
      
      private var name6:FTextArea;
      
      private var name7:FTextArea;
      
      private var name8:FTextArea;
      
      private var name9:FTextArea;
      
      private var name0:FTextArea;
      
      private var tfalign:TextFormat;
      
      private var tuijianBtn:SecondButton;
      
      private var xuanzeBtn:SecondButton;
      
      private var timer:Timer;
      
      private var timeFta:FTextArea;
      
      private var timerCount:int = 0;
      
      private var zhiyepanel:TunShiTianDi_ZhiYePanel;
      
      public function TunShiTianDi_ZhenRongPanel()
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         super();
         titleText = LanResManager.getLanCommonTextWords("吞食天地");
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = false;
         width = 685;
         height = 463;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/zhenrong.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.tfalign = new TextFormat();
         this.tfalign.align = "center";
         this.tuijianBtn = new SecondButton();
         addChild(this.tuijianBtn);
         this.tuijianBtn.x = 170;
         this.tuijianBtn.y = 395;
         this.tuijianBtn.label = LanResManager.getLanCommonTextWords("推荐职业");
         this.tuijianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.xuanzeBtn = new SecondButton();
         addChild(this.xuanzeBtn);
         this.xuanzeBtn.x = 447;
         this.xuanzeBtn.y = 395;
         this.xuanzeBtn.label = LanResManager.getLanCommonTextWords("选择职业");
         this.xuanzeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.renWuSpr = new Sprite();
         addChild(this.renWuSpr);
         var _loc1_:int = 0;
         while(_loc1_ < 10)
         {
            _loc2_ = _loc1_;
            _loc3_ = 0;
            if(_loc1_ > 4)
            {
               _loc2_ = _loc1_ - 5;
               _loc3_ = 1;
            }
            this["zhiye" + _loc1_] = new FTextArea();
            this["zhiye" + _loc1_].multiline = true;
            this["zhiye" + _loc1_].filters = StaticValue.filter;
            this["zhiye" + _loc1_].width = 110;
            this["zhiye" + _loc1_].height = 25;
            this["zhiye" + _loc1_].defaultTextFormat = this.tfalign;
            this["zhiye" + _loc1_].x = 70 + 120 * _loc2_;
            this["zhiye" + _loc1_].y = 60 + _loc3_ * 210;
            this["zhiye" + _loc1_].htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("请选择职业") + "</font>";
            addChild(this["zhiye" + _loc1_]);
            this["name" + _loc1_] = new FTextArea();
            this["name" + _loc1_].multiline = true;
            this["name" + _loc1_].filters = StaticValue.filter;
            this["name" + _loc1_].width = 110;
            this["name" + _loc1_].height = 25;
            this["name" + _loc1_].defaultTextFormat = this.tfalign;
            this["name" + _loc1_].x = 70 + 120 * _loc2_;
            this["name" + _loc1_].y = 120 + _loc3_ * 210;
            this["name" + _loc1_].htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("弟子名字") + "</font>";
            addChild(this["name" + _loc1_]);
            _loc1_++;
         }
         this.timeFta = new FTextArea();
         this.timeFta.filters = StaticValue.filter;
         this.timeFta.width = 200;
         this.timeFta.x = 300 + 100;
         this.timeFta.y = 185 - 8;
         this.timeFta.visible = true;
         addChild(this.timeFta);
      }
      
      public function onClose(param1:* = null) : void
      {
         while(this.renWuSpr.numChildren != 0)
         {
            this.renWuSpr.removeChildAt(0);
         }
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
         if(Boolean(this.timer) && this.timer.running)
         {
            this.timer.stop();
            this.timerCount = 100;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.tuijianBtn:
               this.dispatchEvent(new BaseEvent(SHOW_TUNSHITIANDI_XUANZE_CLICK,"",-1));
               break;
            case this.xuanzeBtn:
               if(!this.zhiyepanel)
               {
                  this.zhiyepanel = new TunShiTianDi_ZhiYePanel();
                  this.zhiyepanel._$parent = this;
                  this.zhiyepanel.x = (GameConfig.sceneWidth - this.zhiyepanel.width) / 2;
                  this.zhiyepanel.y = (GameConfig.sceneHeight - this.zhiyepanel.height) / 2;
               }
               POPWindowManager.showWindow(this.zhiyepanel);
               this.zhiyepanel.shezhi(1);
         }
      }
      
      public function setinitilizeUI(param1:Boolean, param2:int, param3:Array) : *
      {
         while(this.renWuSpr.numChildren != 0)
         {
            this.renWuSpr.removeChildAt(0);
         }
         this.tuijianBtn.enabled = !param1;
         this.xuanzeBtn.enabled = !param1;
         this.setPipei(param2);
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < param3.length)
         {
            if(param3[_loc6_].zhenYing == 0)
            {
               _loc4_.push(param3[_loc6_]);
            }
            else
            {
               _loc5_.push(param3[_loc6_]);
            }
            _loc6_++;
         }
         this.setZhenrong(_loc4_);
         this.setZhenrongLan(_loc5_);
      }
      
      public function setZhenrong(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(param1[_loc2_].zhiye <= 0)
            {
               this["zhiye" + _loc2_].visible = true;
               this["zhiye" + _loc2_].htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("请选择职业") + "</font>";
            }
            else
            {
               this["zhiye" + _loc2_].visible = true;
               this["zhiye" + _loc2_].htmlText = "";
               this["renwu" + _loc2_] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/" + param1[_loc2_].zhiye + ".swf");
               this["renwu" + _loc2_].x = 70 + 119 * _loc2_;
               this["renwu" + _loc2_].y = 10;
               this.renWuSpr.addChild(this["renwu" + _loc2_]);
            }
            this["name" + _loc2_].htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1[_loc2_].name + "</font>";
            _loc2_++;
         }
      }
      
      public function setZhenrongLan(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(param1[_loc2_].zhiye <= 0)
            {
               this["zhiye" + (_loc2_ + 5)].visible = true;
               this["zhiye" + (_loc2_ + 5)].htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("请选择职业") + "</font>";
            }
            else
            {
               this["zhiye" + (_loc2_ + 5)].visible = false;
               this["renwu" + (_loc2_ + 5)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/" + param1[_loc2_].zhiye + ".swf");
               this["renwu" + (_loc2_ + 5)].x = 70 + 119 * _loc2_;
               this["renwu" + (_loc2_ + 5)].y = 10 + 208;
               this.renWuSpr.addChild(this["renwu" + (_loc2_ + 5)]);
            }
            this["name" + (_loc2_ + 5)].htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1[_loc2_].name + "</font>";
            _loc2_++;
         }
      }
      
      public function setPipei(param1:int) : void
      {
         this.timeFta.htmlText = "";
         if(this.timer == null)
         {
            this.timer = new Timer(1000);
            this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
            this.timer.start();
            this.timerCount = param1;
         }
         else if(!this.timer.running)
         {
            this.timer.reset();
            this.timer.start();
            this.timerCount = param1;
         }
      }
      
      public function setAddValue(param1:ShuXingJiaChen) : void
      {
         this.zhiyepanel.setAddValue(param1);
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         --this.timerCount;
         this.timeFta.htmlText = "<font size=\'20\' color=\'" + StaticValue.RED_HTML + "\'>" + this.timerCount + LanResManager.getLanCommonTextWords("秒") + "</font>";
         if(this.timerCount <= 0)
         {
            this.timeFta.htmlText = "";
            this.timer.stop();
         }
      }
   }
}

