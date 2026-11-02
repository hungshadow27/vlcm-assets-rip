package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class MoXueZhanChangPanel extends FPanel
   {
      
      public static const MOXUEZHANCHANG_JINRU_BTN_CLICK:String = "MOXUEZHANCHANG_JINRU_BTN_CLICK";
      
      private var ft:FTextArea;
      
      private var bg:DisplayObject;
      
      private var btn:SecondButton;
      
      public function MoXueZhanChangPanel()
      {
         super();
         width = 500 + 5;
         height = 485;
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("魔血战场");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function init() : void
      {
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 10;
         this.ft.width = 470;
         this.ft.wordWrap = true;
         this.ft.height = 60;
         this.ft.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("魔血战将携带大量魔血降临！！玩家每二、周五、周日全天24小时可凭魔血战场令自由进入，战场内可任意厮杀，为了荣誉，战吧！战场只在一线开启！") + "</font></textformat>";
         addChild(this.ft);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/moxuezhanchang/bg.swf");
         this.bg.x = 10;
         this.bg.y = 50;
         addChild(this.bg);
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 285 + 20 + 5;
         this.ft.width = 470;
         this.ft.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动玩法：") + "<br>" + LanResManager.getLanCommonTextWords("1、玩家战斗力大于等于60000，并且开启赤血魔阵阵法才可以进入。") + "<br>" + LanResManager.getLanCommonTextWords("2、玩家进入战场将消耗魔血战场令一个，死亡后直接回城。") + "<br>" + LanResManager.getLanCommonTextWords("3、玩家进入战场将获得15秒无敌准备时间。") + "<br>" + "4、" + LanResManager.getLanCommonTextWords("战场中每次刷新30只魔怪，完全被击杀后，等待15分钟才可以刷新下一轮。") + "</font></textformat>";
         addChild(this.ft);
         this.btn = new SecondButton();
         this.btn.x = width / 2 - this.btn.width / 2;
         this.btn.y = 410 - 20 + 25 + 5;
         this.btn.label = LanResManager.getLanCommonTextWords("进入战场");
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(MOXUEZHANCHANG_JINRU_BTN_CLICK));
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

