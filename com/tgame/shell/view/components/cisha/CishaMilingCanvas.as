package com.tgame.shell.view.components.cisha
{
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class CishaMilingCanvas extends FPanel
   {
      
      public static const UI_SHUAXIN_MILING_PANEL:String = "UI_SHUAXIN_MILING_PANEL";
      
      private var fc:FCanvas;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var refreshBtn:SecondButton;
      
      private var returnBtn:SecondButton;
      
      public function CishaMilingCanvas()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = false;
         width = 250;
         height = 300;
         titleText = LanResManager.getLanCommonTextWords("刺杀密令");
         this.fc = new FCanvas();
         this.fc.x = 10;
         this.fc.y = 2;
         this.fc.width = 230;
         this.fc.height = 80;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.fc = new FCanvas();
         this.fc.x = 10;
         this.fc.y = 81;
         this.fc.width = 230;
         this.fc.height = 143;
         this.fc.skin = "box";
         addChild(this.fc);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            width = 225;
            height = 75;
            x = 17;
            y = 5;
            wordWrap = true;
            htmlText = "<textformat leading=\'10\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("别说大姐不帮你，要看你敢不敢去！") + "<br>" + LanResManager.getLanCommonTextWords("拿人钱财替人消灾，你帮我杀了...") + "</font></textformat>";
         }
         addChild(this.fta1);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BLUE;
            x = 17;
            y = 90;
            htmlText = "";
         }
         addChild(this.fta2);
         this.refreshBtn = new SecondButton();
         this.refreshBtn.label = LanResManager.getLanCommonTextWords("五元宝刷新目标");
         addChild(this.refreshBtn);
         this.refreshBtn.x = 17;
         this.refreshBtn.y = 233;
         this.refreshBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.refreshBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家消耗5元宝可以刷新刺杀信息。") + "</font>";
         this.returnBtn = new SecondButton();
         this.returnBtn.label = LanResManager.getLanCommonTextWords("退出");
         addChild(this.returnBtn);
         this.returnBtn.x = 185;
         this.returnBtn.y = 233;
         this.returnBtn.addEventListener(MouseEvent.CLICK,this.onClose);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_SHUAXIN_MILING_PANEL));
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         if(this != null && this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setPanelNum(param1:String, param2:int, param3:String, param4:int, param5:String, param6:String, param7:int, param8:int) : void
      {
         this.fta2.htmlText = "<textformat leading=\'10\'>" + LanResManager.getLanCommonTextWords("姓名：") + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + " " + param1 + "<br></font>" + LanResManager.getLanCommonTextWords("等级：") + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + " " + param2 + "<br></font>" + LanResManager.getLanCommonTextWords("帮派：") + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + " " + param3 + "<br></font>" + LanResManager.getLanCommonTextWords("身在线数：") + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + " " + param4 + LanResManager.getLanCommonTextWords("区") + " " + (param5 == "" ? "" : "【" + param5 + "】") + "<br></font>" + LanResManager.getLanCommonTextWords("身在何处：") + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + " " + (param5 == "" ? LanResManager.getLanCommonTextWords("玩家不在线") : param6 + "  " + param7 + ":" + param8) + "</font>" + "</textformat>";
      }
   }
}

