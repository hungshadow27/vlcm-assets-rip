package com.tgame.shell.view.components.cisha
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NoticeManager;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class CishaShuomingPanel extends FPanel
   {
      
      private var fta1:FTextArea;
      
      private var lingquBtn:SecondButton;
      
      public function CishaShuomingPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 290;
         height = 365 + 35;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         titleText = LanResManager.getLanCommonTextWords("刺杀说明");
         this.lingquBtn = new SecondButton();
         this.lingquBtn.label = LanResManager.getLanCommonTextWords("领取任务");
         addChild(this.lingquBtn);
         this.lingquBtn.x = 104;
         this.lingquBtn.y = 334;
         this.lingquBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 10;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("刺杀说明描述") + "</font></textformat>";
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
            case this.lingquBtn:
               if(GameConfig.wantEnterMapRes.id == 20303)
               {
                  NoticeManager.notify(NoticeManager.FOOT,"副本中无法接取刺杀任务！");
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"副本中无法接取刺杀任务！");
                  return;
               }
               MainCharSeachPathManager.mainCharWalk(1681);
               this.onClose(null);
         }
      }
      
      public function setType(param1:int) : void
      {
         this.lingquBtn.visible = param1 == 1;
      }
   }
}

