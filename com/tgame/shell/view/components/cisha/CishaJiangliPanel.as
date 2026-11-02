package com.tgame.shell.view.components.cisha
{
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class CishaJiangliPanel extends FPanel
   {
      
      public static const UI_CISHAOK_PANEL_LINGQU:String = "UI_CISHAOK_PANEL_LINGQU";
      
      public var fta1:FTextArea;
      
      public var fta2:FTextArea;
      
      public var lqBtn:SecondButton;
      
      public function CishaJiangliPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = false;
         width = 350;
         height = 200;
         titleText = LanResManager.getLanCommonTextWords("刺杀成功");
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            wordWrap = true;
            width = 317;
            height = 40;
            x = 15;
            y = 25;
            htmlText = "";
         }
         addChild(this.fta1);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 85;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("碎银子：可以在地下钱庄兑换相应数额的金票") + "</font></textformat>";
         }
         addChild(this.fta2);
         this.lqBtn = new SecondButton();
         this.lqBtn.label = LanResManager.getLanCommonTextWords("确定领取");
         addChild(this.lqBtn);
         this.lqBtn.x = (this.width - this.lqBtn.width) / 2;
         this.lqBtn.y = (this.height - this.lqBtn.height) / 2 + 48;
         this.lqBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_CISHAOK_PANEL_LINGQU));
         this.onClose();
      }
      
      private function onClose() : void
      {
         if(this != null && this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setJiangliNum(param1:int) : void
      {
         this.fta1.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("你已成功完成了【刺杀密令】的任务，现在确定要领取刺杀成功的奖励") + param1 + LanResManager.getLanCommonTextWords("碎银子吗？") + "</font></textformat>";
      }
   }
}

