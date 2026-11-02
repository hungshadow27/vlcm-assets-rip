package com.tgame.shell.view.components.BossRefurbish
{
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.conquerPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class XiangYangZhanChangCanvas extends Sprite
   {
      
      private var ft:FTextArea;
      
      public var $parent:DisplayObject;
      
      private var guizheShuomingBtn:SecondButton;
      
      private var baomingBtn:SecondButton;
      
      private var gotoagain:SecondButton;
      
      public var guizheShuoming:XiangYangZhanChangGuiZeCanvas;
      
      private var baoguoBtn:SecondButton;
      
      private var bg:DisplayObject;
      
      private var rankBtn:SecondButton;
      
      public function XiangYangZhanChangCanvas()
      {
         super();
         this.bg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/zhanchang.jpg",588,256);
         this.bg.x = 0;
         this.bg.y = 0;
         addChild(this.bg);
         this.ft = new FTextArea();
         this.ft.x = 15;
         this.ft.y = 262;
         this.ft.wordWrap = true;
         this.ft.width = 570;
         this.ft.filters = StaticValue.filter;
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("襄阳地势险要，自古以来皆为兵家必争之地。");
         this.ft.setTextFormat(new TextFormat(null,13));
         addChild(this.ft);
         this.guizheShuomingBtn = new SecondButton();
         this.guizheShuomingBtn.label = LanResManager.getLanCommonTextWords("战场说明及介绍");
         addChild(this.guizheShuomingBtn);
         this.guizheShuomingBtn.x = 370;
         this.guizheShuomingBtn.y = 353;
         this.guizheShuomingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.baoguoBtn = new SecondButton();
         this.baoguoBtn.label = LanResManager.getLanCommonTextWords("跨服包裹");
         addChild(this.baoguoBtn);
         this.baoguoBtn.x = 280;
         this.baoguoBtn.y = 353;
         this.baoguoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.baomingBtn = new SecondButton();
         this.baomingBtn.label = LanResManager.getLanCommonTextWords("报名参加跨服襄阳战场");
         addChild(this.baomingBtn);
         this.baomingBtn.x = 10;
         this.baomingBtn.y = 353;
         this.baomingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.gotoagain = new SecondButton();
         this.gotoagain.label = LanResManager.getLanCommonTextWords("再次进入战场");
         addChild(this.gotoagain);
         this.gotoagain.x = 160;
         this.gotoagain.y = 353;
         this.gotoagain.addEventListener(MouseEvent.CLICK,this.onClick);
         this.rankBtn = new SecondButton();
         this.rankBtn.label = LanResManager.getLanCommonTextWords("排行榜");
         addChild(this.rankBtn);
         this.rankBtn.x = 500;
         this.rankBtn.y = 353;
         this.rankBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.guizheShuomingBtn:
               this.showGuize();
               break;
            case this.baoguoBtn:
               this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_XIANGYANGZHANCHANG_BAOGUOSHOUYIQUHUI_BTN_CLICK));
               break;
            case this.baomingBtn:
               this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_XIANGYANGZHANCHANG_BAOMING));
               break;
            case this.gotoagain:
               this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_XIANGYANGZHANCHANG_AGAIN));
               break;
            case this.rankBtn:
               this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_YN_XIANGYANGZHANCHANGRANK));
         }
      }
      
      public function showGuize() : void
      {
         if(!this.guizheShuoming)
         {
            this.guizheShuoming = new XiangYangZhanChangGuiZeCanvas();
         }
         this.guizheShuoming.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.guizheShuoming);
         this.guizheShuoming.x = (GameConfig.sceneWidth - this.guizheShuoming.width) / 2;
         this.guizheShuoming.y = (GameConfig.sceneHeight - this.guizheShuoming.height) / 2;
      }
      
      public function onCloseGuize() : void
      {
         this.guizheShuoming.onClose();
      }
   }
}

