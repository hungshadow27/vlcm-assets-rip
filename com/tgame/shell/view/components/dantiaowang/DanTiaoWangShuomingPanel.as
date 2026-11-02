package com.tgame.shell.view.components.dantiaowang
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.MainCharSeachPathManager;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class DanTiaoWangShuomingPanel extends FPanel
   {
      
      private var fta1:FTextArea;
      
      private var goBtn:SecondButton;
      
      public function DanTiaoWangShuomingPanel()
      {
         var fc:FCanvas = null;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 300;
         height = 370;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         titleText = LanResManager.getLanCommonTextWords("单挑王说明");
         this.goBtn = new SecondButton();
         this.goBtn.label = LanResManager.getLanCommonTextWords("前往争夺单挑王");
         addChild(this.goBtn);
         this.goBtn.x = 95;
         this.goBtn.y = 305;
         this.goBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 25 + 3;
            y = 10;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动时间：") + "12:00~12:30<br/><br/>" + LanResManager.getLanCommonTextWords("活动地点：所有线的襄阳府内") + "</font></textformat>";
         }
         addChild(this.fta1);
         fc = new FCanvas();
         fc.x = 20;
         fc.y = 75;
         fc.width = 260;
         fc.height = 195;
         fc.skin = "box";
         addChild(fc);
         fc.skin = "box_transparence";
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 25 + 3;
            y = 80;
            htmlText = "<textformat leading=\'4\'><font size=\'12\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动每天开启，为争夺单挑王的美誉而战。活动开启之际可以进入襄阳府内，击杀级以上的玩家来获得积分，活动结束将根据积分的高低颁发单挑王的美誉称号！你可以进行换线，来寻找适合你的战场，切记每一次换线你的积分将被清空。称号奖励每天将会清空，要想成为天天的单挑王，要用实力去征服所有人。") + "</font><font size=\'12\' color=\'" + StaticValue.RED_HTML + "\'>" + "<br/>    " + LanResManager.getLanCommonTextWords("注：持有单挑王称号将可以享受打怪经验、打坐真气、收集魔血的翻倍效果。") + "</font>" + "</textformat>";
         }
         addChild(this.fta1);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this != null && this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.goBtn:
               MainCharSeachPathManager.mainCharWalk(20028 + "," + 26 + "," + 60 + "," + 0);
               this.onClose(null);
         }
      }
      
      public function setType(param1:int) : void
      {
         this.goBtn.visible = param1 == 1;
      }
   }
}

