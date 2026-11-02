package com.tgame.shell.view.components.BossRefurbish
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   
   public class XiangYangZhanChangGuiZeCanvas extends Sprite
   {
      
      private var ft:FTextArea;
      
      private var _title:FTextArea;
      
      private var closeBtn:FSimpleButton;
      
      private var bgImg:F9GridBitmap;
      
      private var tz:Sprite;
      
      public function XiangYangZhanChangGuiZeCanvas()
      {
         var _loc1_:FCanvas = null;
         super();
         _loc1_ = new FCanvas();
         _loc1_.skin = "canvas1";
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 650;
         _loc1_.height = 400;
         addChild(_loc1_);
         this.bgImg = Tools.get9GridBitmpByName("biwuDahui_bg");
         this.bgImg.width = 635;
         this.bgImg.height = 380;
         addChild(this.bgImg);
         this.bgImg.x = 8;
         this.bgImg.y = 10;
         this._title = new FTextArea();
         this._title.text = LanResManager.getLanCommonTextWords("【襄阳战场规则】");
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.color = 15975788;
         this._title.setTextFormat(_loc2_);
         addChild(this._title);
         this._title.x = width / 2 - this._title.width / 2;
         this._title.y = 19;
         this.ft = new FTextArea();
         this.ft.x = 30;
         this.ft.y = 50;
         this.ft.wordWrap = true;
         this.ft.width = 510;
         this.ft.height = 300;
         this.ft.filters = StaticValue.filter;
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.htmlText = "<textformat leading=\'6\'>" + "1." + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("【跨服襄阳战场】") + "</font>" + LanResManager.getLanCommonTextWords(",每周五，周日开启，当天玩家可进入最多两次；") + "<br>" + LanResManager.getLanCommonTextWords("2.传入地图后，玩家自动传送至") + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("【宋军阵营】") + "</font>" + LanResManager.getLanCommonTextWords("或") + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("【蒙军阵营】") + "</font>" + LanResManager.getLanCommonTextWords("的") + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("【出生点】") + "</font><br>" + LanResManager.getLanCommonTextWords("3.传入地图后， 2分钟为战斗准备时间，传送点不开放，不得进入战场；") + "<br>" + LanResManager.getLanCommonTextWords("4.战斗准备时间结束后，可进入战场；") + "<br>" + LanResManager.getLanCommonTextWords("5.同阵营的玩家可在战场中组队；") + "<br>" + LanResManager.getLanCommonTextWords("6.玩家可以抢夺中心的") + "<font color=\'" + StaticValue
         .GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("【炮台】") + "</font>" + LanResManager.getLanCommonTextWords("来轰炸对方的阵营；") + "<br>" + LanResManager.getLanCommonTextWords("7.玩家可以点击人物头像下方的") + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("【实时战况】") + "</font>" + LanResManager.getLanCommonTextWords("键，查看当前战况；") + "<br>" + LanResManager.getLanCommonTextWords("8.在双方的") + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("【前锋营】") + "</font>" + LanResManager.getLanCommonTextWords("会刷出先锋/统领头目；") + "<br>" + LanResManager.getLanCommonTextWords("9.先锋/统领头目被敌方玩家击败后，会给敌方所有士兵和玩家增加buff效果；") + "<br>" + LanResManager.getLanCommonTextWords("10.当3个头目全部被击败后，唤出一方") + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("大将/元帅") + "</font>" + "；" + "<br>" + LanResManager.getLanCommonTextWords("11.任何一方的") + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager
         .getLanCommonTextWords("大将/元帅阵亡") + "</font>" + LanResManager.getLanCommonTextWords("，战场结束，停止刷怪，同时发出公告，公告发出后，30秒后将玩家传回原服务器。") + "<br>" + LanResManager.getLanCommonTextWords("12.在规定的时间内，如未将敌方的") + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("大将/元帅") + "</font>" + LanResManager.getLanCommonTextWords("击杀，则按照积分来判定胜负；") + "<br>" + LanResManager.getLanCommonTextWords("13.传回原服务器后，系统会提示您") + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("‘领取襄阳城防御战奖励’") + "</font><br>" + LanResManager.getLanCommonTextWords("14.在襄阳城新添加NPC") + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("【跨服襄阳战场使者】") + "</font>" + LanResManager.getLanCommonTextWords("，可以在该NPC处用积分兑换奖励") + "<br>" + LanResManager.getLanCommonTextWords("15.如中途退出者，30分钟不得再次报名参加") + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("【跨服襄阳战场】") + "</font>" + "。" + "</textformat>";
         addChild(this.ft);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = 630;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.tz = new Sprite();
         this.tz.graphics.beginFill(0,0);
         this.tz.graphics.drawRect(0,0,630,40);
         this.tz.graphics.endFill();
         this.tz.width = 630;
         this.tz.height = 40;
         this.tz.x = 0;
         this.tz.y = 0;
         this.tz.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDowns);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseReleaseds);
         addChild(this.tz);
      }
      
      private function mouseDowns(param1:MouseEvent) : void
      {
         this.parent.setChildIndex(this,parent.numChildren - 1);
         this.startDrag(false,new Rectangle(0,0,Tools.currentStage.stageWidth - this.width,Tools.currentStage.stageHeight - this.height));
      }
      
      private function mouseReleaseds(param1:MouseEvent) : void
      {
         this.stopDrag();
      }
      
      public function onClose(param1:MouseEvent = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

