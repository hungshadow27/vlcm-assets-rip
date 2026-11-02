package com.tgame.shell.view.components.shengxiaotiaozhan
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   
   public class ShengxiaotiaozhanTipPanel extends FPanel
   {
      
      private static const UI_SHENGXIAOTIAOZHANTIP_CLICK:String = "UI_SHENGXIAOTIAOZHANTIP_CLICK";
      
      private var ft:FTextArea;
      
      private var ftLingpai:FTextArea;
      
      private var ftYuanbao:FTextArea;
      
      private var btnOk:SecondButton;
      
      private var btnCancel:SecondButton;
      
      public function ShengxiaotiaozhanTipPanel()
      {
         super();
         width = 200;
         height = 170;
         dragAble = false;
         skin = "panel_btn";
         titleText = LanResManager.getLanCommonTextWords("生肖挑战确认");
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function init() : void
      {
         this.ftLingpai = new FTextArea();
         this.ftLingpai.x = 15;
         this.ftLingpai.y = 10;
         this.ftLingpai.htmlText = "";
         this.ftLingpai.height = 50;
         this.ftLingpai.width = 170;
         this.ftLingpai.wordWrap = true;
         addChild(this.ftLingpai);
         this.ftYuanbao = new FTextArea();
         this.ftYuanbao.x = 15;
         this.ftYuanbao.y = 55;
         this.ftYuanbao.htmlText = "";
         this.ftYuanbao.height = 50;
         this.ftYuanbao.width = 170;
         this.ftYuanbao.wordWrap = true;
         addChild(this.ftYuanbao);
         this.btnOk = new SecondButton();
         this.btnOk.x = 35;
         this.btnOk.y = 105;
         this.btnOk.label = LanResManager.getLanCommonTextWords("接受");
         this.btnOk.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnOk);
         this.btnCancel = new SecondButton();
         this.btnCancel.x = 105;
         this.btnCancel.y = 105;
         this.btnCancel.label = LanResManager.getLanCommonTextWords("拒绝");
         this.btnCancel.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnCancel);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnOk:
               PipeManager.sendMsg(PipeConstants.SEND_SHENGXIAOFUBENTIAOZHAN_CLICK);
               this.onClose();
               break;
            case this.btnCancel:
               this.onClose();
         }
      }
      
      public function setData(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:String = "";
         if(param1 > param2)
         {
            param1 = param2;
            _loc4_ = StaticValue.GREEN_HTML;
         }
         else
         {
            _loc4_ = StaticValue.RED_HTML;
         }
         this.ftLingpai.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次挑战需要消耗12生肖副本令") + "</font><font color=\'" + _loc4_ + "\'>" + param1 + "/" + param2 + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("个") + "</font>";
         if(param3 > 0)
         {
            this.ftYuanbao.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的副本令数量不足，是否消耗") + "</font><font color=\'" + StaticValue.RED_HTML + "\'>" + param3 + LanResManager.getLanCommonTextWords("元宝") + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("继续进入") + "</font>";
         }
         else
         {
            this.ftYuanbao.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的副本令充足，确定进入副本？") + "</font>";
         }
      }
   }
}

