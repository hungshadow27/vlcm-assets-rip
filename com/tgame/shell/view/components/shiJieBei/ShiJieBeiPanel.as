package com.tgame.shell.view.components.shiJieBei
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.moudels.shiJieBei.model.info.ShiJieBeiVO;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class ShiJieBeiPanel extends FPanel
   {
      
      public static const UI_SHIJIEBEI_SHOW_GUANJUNJINGCAI:String = "UI_SHIJIEBEI_SHOW_GUANJUNJINGCAI";
      
      public static const UI_SHIJIEBEI_SHOW_SHENGFUJINGCAI:String = "UI_SHIJIEBEI_SHOW_SHENGFUJINGCAI";
      
      public static const UI_SHIJIEBEI_SHENGFUJINGCAI_SHOW_XIAZHU:String = "UI_SHIJIEBEI_SHENGFUJINGCAI_SHOW_XIAZHU";
      
      public static const UI_SHIJIEBEI_SHENGFUJINGCAI_XIAZHU_OK:String = "UI_SHIJIEBEI_SHENGFUJINGCAI_XIAZHU_OK";
      
      public static const UI_SHIJIEBEI_SHENGFUJINGCAI_XIAZHU_LINGQU:String = "UI_SHIJIEBEI_SHENGFUJINGCAI_XIAZHU_LINGQU";
      
      public static const UI_SHIJIEBEI_GUANJUNJINGCAI_LINGJIANG:String = "UI_SHIJIEBEI_GUANJUNJINGCAI_LINGJIANG";
      
      public static const UI_SHIJIEBEI_GUANJUNJINGCAI_XIAZHU_XIAZHU:String = "UI_SHIJIEBEI_GUANJUNJINGCAI_XIAZHU_XUAZHU";
      
      private var guanjunjingcai:GuanJunJingCai;
      
      private var shengfujingcai:ShengFuJingCai;
      
      public var tabBar:FTabBar;
      
      public var shuoMingBtn:SecondButton;
      
      private var shuoMingCanvas:DisplayObject;
      
      public function ShiJieBeiPanel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 740 + 39;
         height = 587 + 20;
         titleText = LanResManager.getLanCommonTextWords("世界杯之夜");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.guanjunjingcai = new GuanJunJingCai();
         this.guanjunjingcai.$parent = this;
         this.guanjunjingcai.visible = false;
         addChild(this.guanjunjingcai);
         this.guanjunjingcai.x = 10;
         this.guanjunjingcai.y = 22;
         this.shengfujingcai = new ShengFuJingCai();
         this.shengfujingcai.setParent(this);
         this.shengfujingcai.visible = false;
         addChild(this.shengfujingcai);
         this.shengfujingcai.x = 10;
         this.shengfujingcai.y = 22;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("冠军竞猜"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("胜负竞猜"),this.onTabClick);
         addChild(this.tabBar);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.shuoMingBtn = new SecondButton();
         addChild(this.shuoMingBtn);
         this.shuoMingBtn.x = 360;
         this.shuoMingBtn.y = 540;
         this.shuoMingBtn.label = LanResManager.getLanCommonTextWords("玩法说明");
         this.shuoMingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shuoMingBtn.visible = false;
         this.shuoMingCanvas = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijiebei/shuoming.swf");
         this.shuoMingCanvas.x = 739 + 30 + 10;
         this.shuoMingCanvas.y = 0;
         this.shuoMingCanvas.visible = false;
         addChild(this.shuoMingCanvas);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shuoMingBtn:
               this.shuoMingCanvas.visible = !this.shuoMingCanvas.visible;
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         this.guanjunjingcai.showXiaZhuCanvas(false);
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("冠军竞猜"):
               this.shuoMingCanvas.visible = false;
               this.shuoMingBtn.visible = false;
               this.showZhengZhanSiFang();
               dispatchEvent(new BaseEvent(UI_SHIJIEBEI_SHOW_GUANJUNJINGCAI));
               break;
            case LanResManager.getLanCommonTextWords("胜负竞猜"):
               this.shuoMingCanvas.visible = false;
               this.shuoMingBtn.visible = true;
               this.showJiangShanSheJi();
               dispatchEvent(new BaseEvent(UI_SHIJIEBEI_SHOW_SHENGFUJINGCAI));
         }
      }
      
      public function showZhengZhanSiFang(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("冠军竞猜"));
         }
         this.guanjunjingcai.visible = true;
         this.shengfujingcai.visible = false;
      }
      
      public function showJiangShanSheJi(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("胜负竞猜"));
         }
         this.shengfujingcai.visible = true;
         this.guanjunjingcai.visible = false;
      }
      
      public function setJiangCaiPanel(param1:Array) : void
      {
         this.shengfujingcai.setInitialize(param1);
      }
      
      public function setGuanJunPanel(param1:ShiJieBeiVO) : void
      {
         this.guanjunjingcai.setInitialize(param1);
      }
   }
}

