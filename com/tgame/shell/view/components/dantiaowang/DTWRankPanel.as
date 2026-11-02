package com.tgame.shell.view.components.dantiaowang
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.text.*;
   
   public class DTWRankPanel extends FCanvas
   {
      
      private var rankCanvas:DTWRankCanvas;
      
      private var ft:FTextArea;
      
      private var ftNum:FTextArea;
      
      private var ftRank:FTextArea;
      
      public function DTWRankPanel()
      {
         super();
         this.skin = "box";
         width = 300;
         height = 145 + 23 * 5 + 130;
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 100;
            y = 10;
            width = 100;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat><font size=\'16\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("单挑排行榜") + "</font></textformat>";
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 10;
            y = 30;
            width = 100;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "<textformat><font size=\'12\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("你的战斗信息：") + "</font></textformat>";
         }
         addChild(this.ft);
         this.ftNum = new FTextArea();
         with(this.ftNum)
         {
            x = 10;
            y = 50;
            width = 100;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "<textformat><font size=\'12\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("击杀人数：") + "</font></textformat>";
         }
         addChild(this.ftNum);
         this.ftRank = new FTextArea();
         with(this.ftRank)
         {
            x = 10;
            y = 70;
            width = 100;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "<textformat><font size=\'12\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前排位：") + "</font></textformat>";
         }
         addChild(this.ftRank);
         this.rankCanvas = new DTWRankCanvas();
         this.rankCanvas.x = 0;
         this.rankCanvas.y = 100;
         addChild(this.rankCanvas);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 10;
            y = this.height - 20;
            width = 100;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "<textformat><font size=\'12\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("只显示前10名玩家的战斗信息") + "</font></textformat>";
         }
         addChild(this.ft);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setInitialize(param1:XML, param2:int, param3:int, param4:int) : void
      {
         if(param4 == 1)
         {
            this.ftNum.htmlText = "<textformat><font size=\'12\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("击杀人数：") + param2 + "</font></textformat>";
         }
         else
         {
            this.ftNum.htmlText = "<textformat><font size=\'12\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("战利品数：") + param2 + "</font></textformat>";
         }
         this.ftRank.htmlText = "<textformat><font size=\'12\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前排位：") + param3 + "</font></textformat>";
         this.rankCanvas.setInitialize(param1,param4);
      }
   }
}

