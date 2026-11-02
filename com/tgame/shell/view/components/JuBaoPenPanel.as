package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class JuBaoPenPanel extends FPanel
   {
      
      public static const UI_JUBAOPEN_LINGQU_CLICK:String = "UI_JUBAOPEN_LINGQU_CLICK";
      
      private var ftaTime:FTextArea;
      
      private var ftaFaLiJinPiao:FTextArea;
      
      private var lingQuBtn:SecondButton;
      
      private var fb2:FTextArea;
      
      public function JuBaoPenPanel()
      {
         var bg:DisplayObject;
         var fb1:FTextArea;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 578;
         height = 348;
         titleText = LanResManager.getLanCommonTextWords("聚宝盆");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/jubaopen/ui.jubaopen.bg.swf");
         bg.x = 8;
         addChild(bg);
         this.ftaTime = new FTextArea();
         with(this.ftaTime)
         {
            x = 330;
            y = 40;
            width = 270;
            height = 50;
            textColor = StaticValue.SKY_BLUE;
            filters = StaticValue.filter;
            wordWrap = true;
            htmlText = "";
         }
         addChild(this.ftaTime);
         this.fb2 = new FTextArea();
         with(this.fb2)
         {
            x = 317 - 2;
            y = 110 + 8;
            width = 250;
            height = 150;
            textColor = StaticValue.SKY_BLUE;
            filters = StaticValue.filter;
            wordWrap = true;
            htmlText = "";
         }
         addChild(this.fb2);
         fb1 = new FTextArea();
         fb1 = new FTextArea();
         with(fb1)
         {
            x = 340;
            y = 220;
            width = 60;
            height = 20;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            wordWrap = false;
            htmlText = LanResManager.getLanCommonTextWords("返利金票：");
         }
         addChild(fb1);
         this.ftaFaLiJinPiao = new FTextArea();
         with(this.ftaFaLiJinPiao)
         {
            x = 400;
            y = 220;
            width = 94;
            height = 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.ftaFaLiJinPiao);
         this.lingQuBtn = new SecondButton();
         this.lingQuBtn.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.lingQuBtn);
         this.lingQuBtn.x = 450;
         this.lingQuBtn.y = 263;
         this.lingQuBtn.addEventListener(MouseEvent.CLICK,this.onOK);
      }
      
      private function onOK(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.lingQuBtn:
               dispatchEvent(new BaseEvent(UI_JUBAOPEN_LINGQU_CLICK));
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setDate(param1:String, param2:String, param3:Number, param4:int) : void
      {
         this.ftaTime.htmlText = "<textformat leading=\'10\'>" + LanResManager.getLanCommonTextWords("活动时间：") + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "</font><br>" + LanResManager.getLanCommonTextWords("领奖时间：") + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param2 + "</font></textformat>";
         this.ftaFaLiJinPiao.htmlText = String(param3);
         this.fb2.htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("聚宝盆：玩家拥有此物品，只要在活动时间商城消费，所花费的元宝（金票）都将有") + param4 + "%" + LanResManager.getLanCommonTextWords("的金额存入聚宝盆中，并且玩家可在领取时间领取已经存入聚宝盆的金票奖励（获得的金票奖励 = 活动期间商城消费元宝（金票）数") + "×" + param4 + "%" + " " + LanResManager.getLanCommonTextWords("金票返还将四舍五入") + "）" + "</textformat>";
      }
   }
}

