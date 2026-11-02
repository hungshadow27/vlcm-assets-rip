package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.shell.view.components.newyear.CaiShenCanvas;
   import com.tgame.shell.view.components.newyear.ChunLianCanvas;
   import com.tgame.shell.view.components.newyear.NewYear_TiJiaoDuiLianPanel;
   import com.tgame.shell.view.components.newyear.QianDaoCanvas;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class NewYearPanel extends Sprite
   {
      
      public static const UI_REQUEST_CHUNLIANSONGHAOLI_PANEL:String = "UI_REQUEST_CHUNLIANSONGHAOLI_PANEL";
      
      public static const UI_LINGQUXUNZHANG_BTN:String = "UI_LINGQUXUNZHANG_BTN";
      
      public static const UI_TIJIAODUILIAN_BTN:String = "UI_TIJIAODUILIAN_BTN";
      
      public static const UI_CHUNLIANPANEL_TIJIAODUILIAN_CLICK:String = "UI_CHUNLIANPANEL_TIJIAODUILIAN_CLICK";
      
      public static const UI_CHUNLIANPANEL_TOKEN_PUT:String = "UI_CHUNLIANPANEL_TOKEN_PUT";
      
      public static const UI_CHUNLIANPANEL_DRAG_ENTER:String = "UI_CHUNLIANPANEL_DRAG_ENTER";
      
      public static const UI_CHUNLIANPANEL_TOKEN_CLICK:String = "UI_CHUNLIANPANEL_TOKEN_CLICK";
      
      public static const QIANDAOPANEL_CHOUJIANG_CLICK:String = "QIANDAOPANEL_CHOUJIANG_CLICK";
      
      public static const QIANDAOPANEL_XUNZHANG_CLICK:String = "QIANDAOPANEL_XUNZHANG_CLICK";
      
      public static const QIANDAOPANEL_GETINFO:String = "QIANDAOPANEL_GETINFO";
      
      public var tabBar:FTabBar;
      
      private var huodongCanvas:ChunLianCanvas;
      
      public var qianDaoCanvas:QianDaoCanvas;
      
      public var caiShenSongRuiShouCanvas:CaiShenCanvas;
      
      private var tijiaoPanel:NewYear_TiJiaoDuiLianPanel;
      
      private var closeBtn:FSimpleButton;
      
      private var qianDaoBtn:FSimpleButton;
      
      private var huodongBtn:FSimpleButton;
      
      private var ruiShouBtn:FSimpleButton;
      
      public function NewYearPanel()
      {
         super();
         this.qianDaoBtn = new FSimpleButton();
         this.qianDaoBtn.skin = "newyearQianDaoButton";
         this.qianDaoBtn.y = 172;
         this.qianDaoBtn.x = -64;
         this.qianDaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.qianDaoBtn);
         this.huodongBtn = new FSimpleButton();
         this.huodongBtn.skin = "newyearHuoDongButton";
         this.huodongBtn.y = 210;
         this.huodongBtn.x = -64;
         this.huodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.huodongBtn);
         this.ruiShouBtn = new FSimpleButton();
         this.ruiShouBtn.skin = "newyearRuiShouButton";
         this.ruiShouBtn.y = 248;
         this.ruiShouBtn.x = -64;
         this.ruiShouBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.ruiShouBtn);
         this.qianDaoCanvas = new QianDaoCanvas();
         this.qianDaoCanvas.$parent = this;
         addChild(this.qianDaoCanvas);
         this.qianDaoCanvas.x = 10;
         this.qianDaoCanvas.y = 22;
         this.huodongCanvas = new ChunLianCanvas();
         this.huodongCanvas.$parent = this;
         addChild(this.huodongCanvas);
         this.huodongCanvas.x = 10;
         this.huodongCanvas.y = 22;
         this.caiShenSongRuiShouCanvas = new CaiShenCanvas();
         this.caiShenSongRuiShouCanvas.$parent = this;
         addChild(this.caiShenSongRuiShouCanvas);
         this.caiShenSongRuiShouCanvas.x = 10;
         this.caiShenSongRuiShouCanvas.y = 22;
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "newyearCloseButton";
         addChild(this.closeBtn);
         this.closeBtn.x = 495;
         this.closeBtn.y = 36;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.huodongBtn.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
      }
      
      private function setPos() : void
      {
      }
      
      private function onClick(param1:Event) : void
      {
         switch(param1.target)
         {
            case this.qianDaoBtn:
               this.qianDaoBtn.skin = "newyearQianDaoSelectedButton";
               this.huodongBtn.skin = "newyearHuoDongButton";
               this.ruiShouBtn.skin = "newyearRuiShouButton";
               this.qianDaoCanvas.visible = true;
               this.huodongCanvas.visible = false;
               this.caiShenSongRuiShouCanvas.visible = false;
               dispatchEvent(new BaseEvent(QIANDAOPANEL_GETINFO));
               break;
            case this.huodongBtn:
               this.qianDaoBtn.skin = "newyearQianDaoButton";
               this.huodongBtn.skin = "newyearHuoDongSelectedButton";
               this.ruiShouBtn.skin = "newyearRuiShouButton";
               this.qianDaoCanvas.visible = false;
               this.huodongCanvas.visible = true;
               this.qianDaoCanvas.$parent = this;
               this.caiShenSongRuiShouCanvas.visible = false;
               dispatchEvent(new BaseEvent(UI_REQUEST_CHUNLIANSONGHAOLI_PANEL));
               break;
            case this.ruiShouBtn:
               this.qianDaoBtn.skin = "newyearQianDaoButton";
               this.huodongBtn.skin = "newyearHuoDongButton";
               this.ruiShouBtn.skin = "newyearRuiShouSelectedButton";
               this.qianDaoCanvas.visible = false;
               this.huodongCanvas.visible = false;
               this.caiShenSongRuiShouCanvas.visible = true;
         }
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         POPWindowManager.closeWindow();
      }
      
      public function setInit(param1:Array, param2:Boolean, param3:Boolean) : void
      {
         if(this.huodongCanvas.visible)
         {
            this.huodongCanvas.setInit(param1,param2,param3);
         }
      }
      
      public function setXL(param1:Array) : void
      {
         this.huodongCanvas.setXL(param1,true);
      }
      
      public function setMC() : void
      {
         if(!this.huodongCanvas.visible)
         {
            this.qianDaoBtn.skin = "newyearQianDaoButton";
            this.huodongBtn.skin = "newyearHuoDongSelectedButton";
            this.ruiShouBtn.skin = "newyearRuiShouButton";
            this.qianDaoCanvas.visible = false;
            this.huodongCanvas.visible = true;
            this.qianDaoCanvas.$parent = this;
            this.caiShenSongRuiShouCanvas.visible = false;
         }
         this.huodongCanvas.setMC();
      }
      
      public function showTijiaoPanel() : NewYear_TiJiaoDuiLianPanel
      {
         if(!this.tijiaoPanel)
         {
            this.tijiaoPanel = new NewYear_TiJiaoDuiLianPanel();
            this.tijiaoPanel.$parent = this;
         }
         this.tijiaoPanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.tijiaoPanel);
         return this.tijiaoPanel;
      }
      
      public function closeTijiaoPanel() : void
      {
         if(this.tijiaoPanel)
         {
            this.tijiaoPanel.onClose();
         }
      }
      
      public function setTijiaoNull() : void
      {
         if(Fun.isVisible(this.tijiaoPanel))
         {
            this.tijiaoPanel.setNull();
         }
         else
         {
            if(!this.tijiaoPanel)
            {
               this.tijiaoPanel = new NewYear_TiJiaoDuiLianPanel();
               this.tijiaoPanel.$parent = this;
            }
            this.tijiaoPanel.visible = true;
            GameInstance.uiInstance.uiContainer.addChild(this.tijiaoPanel);
         }
      }
      
      public function showQianDaoPanel(param1:Array, param2:Boolean) : void
      {
         this.qianDaoBtn.skin = "newyearQianDaoSelectedButton";
         this.huodongBtn.skin = "newyearHuoDongButton";
         this.ruiShouBtn.skin = "newyearRuiShouButton";
         this.qianDaoCanvas.visible = true;
         this.huodongCanvas.visible = false;
         this.caiShenSongRuiShouCanvas.visible = false;
         this.qianDaoCanvas.$parent = this;
         this.qianDaoCanvas.updata(param1,param2);
      }
      
      public function upDateHuojiang(param1:Array) : void
      {
         this.qianDaoCanvas.upDateHuojiang(param1);
      }
      
      public function chouJiangJieGuo(param1:Boolean) : void
      {
         this.qianDaoCanvas.chouJiangJieGuo(param1);
      }
      
      public function updataXunZhang(param1:Array) : void
      {
         this.qianDaoCanvas.updataXunZhang(param1);
      }
   }
}

