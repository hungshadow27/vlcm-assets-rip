package com.tgame.shell.view.components.ynShijiebei
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   
   public class ShijiebeiJiangliPanel extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var ftDest:FTextArea;
      
      public function ShijiebeiJiangliPanel()
      {
         super();
         width = 290 + 30;
         height = 280;
         dragAble = true;
         showCloseButton = true;
         skin = "panel";
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 10;
         this.ft.width = 200;
         this.ft.height = 30;
         addChild(this.ft);
         this.ftDest = new FTextArea();
         this.ftDest.x = 20;
         this.ftDest.y = 40;
         this.ftDest.width = 300;
         this.ftDest.height = 370;
         this.ftDest.wordWrap = true;
         addChild(this.ftDest);
      }
      
      public function setType(param1:int, param2:int = 0) : void
      {
         if(param1 == 1)
         {
            this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\' size = \'14\'>" + LanResManager.getLanCommonTextWords("MIK足球排行榜奖励：");
            titleText = LanResManager.getLanCommonTextWords("MIK足球奖励");
            this.ftDest.htmlText = "<textformat leading=\'8\'><font size = \'14\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("第1名：傲神宝箱-飞龙 * 3") + "</font>" + "<br>" + "<font size = \'14\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("第2名：傲神宝箱-飞龙 * 2") + "</font>" + "<br>" + "<font size = \'14\' color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("第3名：傲神宝箱-飞龙 * 1") + "</font>" + "<br>" + "<font size = \'14\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("第4名：傲神碎片-飞龙 * 4") + "</font>" + "<br>" + "<font size = \'14\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("第5、6名：傲神碎片-飞龙 * 3") + "</font>" + "<br>" + "<font size = \'14\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("第7、8名：傲神碎片-飞龙 * 2") + "</font>" + "<br>" + "<font size = \'14\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("第9、10名：傲神碎片-飞龙 * 1") + "</font></textformat>";
         }
         else if(param1 == 2)
         {
            this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\' size = \'14\'>" + LanResManager.getLanCommonTextWords("狮子排行榜奖励：");
            titleText = LanResManager.getLanCommonTextWords("狮子奖励");
            this.ftDest.htmlText = "<textformat leading=\'8\'><font size = \'14\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("第1名：SEA Games金牌 28*1") + "</font>" + "<br>" + "<font size = \'14\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("第2名：SEA Games 28银牌*1") + "</font>" + "<br>" + "<font size = \'14\' color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("第3名：SEA Games 28铜牌*1") + "</font>" + "<br>" + "<font size = \'14\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("第4-10名：SEA Games 28勋章*1") + "</font></textformat>";
         }
         else if(param1 == 3)
         {
            this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\' size = \'14\'>" + LanResManager.getLanCommonTextWords("狮子每日排行榜奖励：");
            titleText = LanResManager.getLanCommonTextWords("狮子每日奖励");
            this.ftDest.htmlText = "<textformat leading=\'8\'><font size = \'14\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("第1名：傲神碎片-飞龙*6") + "</font>" + "<br>" + "<font size = \'14\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("第2名：傲神碎片-飞龙*4") + "</font>" + "<br>" + "<font size = \'14\' color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("第3名：傲神碎片-飞龙*2") + "</font></textformat>";
         }
      }
   }
}

