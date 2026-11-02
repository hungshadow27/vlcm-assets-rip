package com.tgame.shell.view.components.shengxiaotiaozhan
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.utils.Fun;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ShengxiaotiaozhanSuccess extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var ftCs:FTextArea;
      
      private var ftTime:FTextArea;
      
      private var lbTime:FLabel;
      
      private var bit:Bitmap;
      
      private var img:DisplayObject;
      
      private var sprGo:Sprite;
      
      public function ShengxiaotiaozhanSuccess()
      {
         super();
         width = 200;
         height = 200;
         dragAble = false;
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function init() : void
      {
         this.ft = new FTextArea();
         this.ft.x = 70;
         this.ft.y = 10;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\' size=\'16\'>" + LanResManager.getLanCommonTextWords("挑战成功") + "</font>";
         addChild(this.ft);
         this.ftCs = new FTextArea();
         this.ftCs.x = 20;
         this.ftCs.y = 40;
         this.ftCs.htmlText = "";
         this.ftCs.width = 160;
         addChild(this.ftCs);
         var _loc1_:Bitmap = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc1_.x = 100 - 20;
         _loc1_.y = 65;
         addChild(_loc1_);
         this.sprGo = new Sprite();
         this.sprGo.x = 102 - 20;
         this.sprGo.y = 67;
         addChild(this.sprGo);
         this.ft = new FTextArea();
         this.ft.x = 40;
         this.ft.y = 110;
         this.ft.width = 140;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请在挑战界面领取奖励！") + "</font>";
         addChild(this.ft);
         this.lbTime = new FLabel();
         this.lbTime.x = 100;
         this.lbTime.y = 130;
         this.lbTime.width = 10;
         this.lbTime.textColor = StaticValue.RED;
         this.lbTime.text = "5";
         addChild(this.lbTime);
         this.ft = new FTextArea();
         this.ft.x = 55;
         this.ft.y = 130;
         this.ft.width = 50;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您将在") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 110;
         this.ft.y = 130;
         this.ft.width = 70;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("秒后退出") + "</font>";
         addChild(this.ft);
      }
      
      private function setTime() : void
      {
         var time:Timer = null;
         var i:int = 0;
         var tiFun:Function = null;
         tiFun = function():void
         {
            --i;
            lbTime.text = String(i);
            if(i <= 0)
            {
               PipeManager.sendMsg(PipeConstants.SEND_SHENGXIAOTIAOZHAN_LEAVE);
               time.removeEventListener(TimerEvent.TIMER,tiFun);
               time.stop();
               time = null;
               onClose();
               if(Fun.isVisible(GameInstance.uiInstance.shengxiaoRightSpr))
               {
                  GameInstance.uiInstance.shengxiaoRightSpr.onclose();
               }
            }
         };
         time = new Timer(1000,6);
         time.start();
         time.addEventListener(TimerEvent.TIMER,tiFun);
         i = 6;
      }
      
      public function setData(param1:int, param2:int, param3:int) : void
      {
         this.ftCs.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您已成功挑战十二生肖第") + param1 + LanResManager.getLanCommonTextWords("级") + "！</font>";
         while(this.sprGo.numChildren > 0)
         {
            this.sprGo.removeChildAt(0);
         }
         var _loc4_:Goods = new Goods(param2);
         _loc4_.count = param3;
         var _loc5_:ItemFace = new ItemFace(_loc4_);
         this.sprGo.addChild(_loc5_);
         this.setTime();
      }
   }
}

