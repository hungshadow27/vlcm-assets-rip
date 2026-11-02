package com.tgame.shell.view.components.wangzhezhibang
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.util.FLoader;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class WangzhezhibangZhanchangGuizePanel extends FPanel
   {
      
      private var bg:DisplayObject;
      
      private var tz:Sprite;
      
      private var leaveBtn:SecondButton;
      
      public function WangzhezhibangZhanchangGuizePanel()
      {
         super();
         width = 575;
         height = 625;
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("比赛规则");
         skin = "panel_btn";
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function init() : void
      {
         this.bg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zhanchangguize_bg.jpg",556,547);
         this.bg.x = 9;
         this.bg.y = 0;
         addChild(this.bg);
         this.leaveBtn = new SecondButton();
         this.leaveBtn.label = LanResManager.getLanCommonTextWords("退出战场");
         this.leaveBtn.x = width / 2 - this.leaveBtn.width / 2;
         this.leaveBtn.y = 560;
         this.leaveBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.leaveBtn);
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         PipeManager.sendMsg(PipeConstants.LIKAI_KUAFU_LEITAI);
         GameInstance.uiInstance.mainUI.showWZZBGuizeButton(false);
         this.onClose();
      }
   }
}

