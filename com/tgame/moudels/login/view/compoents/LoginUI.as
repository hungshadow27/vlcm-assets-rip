package com.tgame.moudels.login.view.compoents
{
   import com.fireice.util.*;
   import com.tgame.common.GameConfig;
   import com.tgame.manager.TSoundManager;
   import com.tgame.moudels.login.view.compoents.ui.CreateCharPanel;
   import com.tgame.moudels.login.view.compoents.ui.LoginBackGroundCanvas;
   import com.tgame.moudels.login.view.compoents.ui.LoginPanel;
   import com.tgame.moudels.login.view.compoents.ui.RecoverPanel;
   import com.tgame.moudels.login.view.compoents.ui.SelectCharPanel;
   import com.tgame.moudels.login.view.compoents.ui.SelectLinePanel;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class LoginUI extends Sprite
   {
      
      public static const UI_LOGIN_SUBMIT:String = "ui.login.submit";
      
      public static const UI_LOGIN_SELECTLINE_OK:String = "ui.login.selectLine.ok";
      
      public static const UI_LOGIN_SELECTLINE_CANCEL:String = "ui.login.selectLine.cancel";
      
      public static const UI_LOGIN_SELECTCHAR_GET_CHAR_AVATER:String = "ui.login.selectChar.get.char.avater";
      
      public static const UI_LOGIN_SELECTCHAR_ENTER_GAME:String = "ui.login.seleceChar.enter.game";
      
      public static const UI_LOGIN_SELECTCHAR_SHOW_CREATECHARPANEL:String = "ui.login.selectChar.show.createCharPanel";
      
      public static const UI_LOGIN_SELECTCHAR_CREATE_CHAR:String = "ui.login.selectChar.create.char";
      
      public static const UI_LOGIN_SELECTCHAR_CREATE_CANCEL:String = "UI_LOGIN_SELECTCHAR_CREATE_CANCEL";
      
      public static const UI_LOGIN_SELECTCHAR_DELETE_CHAR:String = "ui.login.selectChar.delete.char";
      
      public static const UI_LOGIN_SELECTCHAR_SHOW_RECOVER_CHAR:String = "UI_LOGIN_SELECTCHAR_SHOW_RECOVER_CHAR";
      
      public static const UI_LOGIN_SELECTCHAR_RECOVER_CHAR:String = "UI_LOGIN_SELECTCHAR_RECOVER_CHAR";
      
      public static const UI_LOGIN_CREATECHAR_NAME_RANDOM:String = "UI_LOGIN_CREATECHAR_NAME_RANDOM";
      
      public static var objCache:Object = {};
      
      public static var bgX:int = 0;
      
      private var container:Sprite;
      
      private var loginPanel:LoginPanel;
      
      private var selectLine:SelectLinePanel;
      
      private var selectChar:SelectCharPanel;
      
      private var createChar:CreateCharPanel;
      
      private var recoverChar:RecoverPanel;
      
      private var backGroundLayer:LoginBackGroundCanvas;
      
      public function LoginUI()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.backGroundLayer = new LoginBackGroundCanvas();
         addChild(this.backGroundLayer);
         this.backGroundLayer.loadMap(1);
         this.container = new Sprite();
         addChild(this.container);
         TSoundManager.playDengluSound();
      }
      
      private function hideAll() : void
      {
         if(this.loginPanel)
         {
            if(this.loginPanel.parent)
            {
               this.loginPanel.parent.removeChild(this.loginPanel);
            }
            this.loginPanel.destory();
            this.loginPanel = null;
         }
         if(this.selectLine)
         {
            if(this.selectLine.parent)
            {
               this.selectLine.parent.removeChild(this.selectLine);
            }
            this.selectLine.destory();
            this.selectLine = null;
         }
         if(this.selectChar)
         {
            if(this.selectChar.parent)
            {
               this.selectChar.parent.removeChild(this.selectChar);
            }
            this.selectChar.destory();
            this.selectChar = null;
         }
         if(this.createChar)
         {
            if(this.createChar.parent)
            {
               this.createChar.parent.removeChild(this.createChar);
            }
            this.createChar.destory();
            this.createChar = null;
         }
         if(this.recoverChar)
         {
            if(this.recoverChar.parent)
            {
               this.recoverChar.parent.removeChild(this.recoverChar);
            }
            this.recoverChar.destory();
            this.recoverChar = null;
         }
      }
      
      public function showLoginPanel() : void
      {
         this.hideAll();
         if(this.loginPanel == null)
         {
            this.loginPanel = new LoginPanel();
         }
         this.container.addChild(this.loginPanel);
         this.loginPanel.visible = true;
         Tools.currentStage.focus = this.loginPanel.nameInput;
         this.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
      }
      
      public function showSelectLinePanel(param1:XML) : void
      {
         this.hideAll();
         if(this.selectLine == null)
         {
            this.selectLine = new SelectLinePanel();
         }
         this.container.addChild(this.selectLine);
         this.selectLine.visible = true;
         this.selectLine.dataProvider = param1;
         this.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
      }
      
      public function showSelectChar(param1:XML, param2:String) : void
      {
         this.hideAll();
         if(this.selectChar == null)
         {
            this.selectChar = new SelectCharPanel();
         }
         this.container.addChild(this.selectChar);
         this.selectChar.visible = true;
         this.selectChar.dataProvider = param1;
         this.selectChar.tipContent = param2;
         Tools.currentStage.focus = this.selectChar;
         this.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
      }
      
      public function addGameNotice(param1:String) : void
      {
         if(this.selectChar)
         {
            this.selectChar.tipContent = param1;
         }
      }
      
      public function set charAvatarImg(param1:BitmapData) : void
      {
      }
      
      public function showCreateChar(param1:Boolean = true) : void
      {
         this.hideAll();
         if(this.createChar == null)
         {
            this.createChar = new CreateCharPanel();
         }
         this.createChar.returnBtn.visible = param1;
         this.container.addChild(this.createChar);
         this.createChar.visible = true;
         this.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
      }
      
      public function showRecoverChar() : void
      {
         if(this.recoverChar == null)
         {
            this.recoverChar = new RecoverPanel();
         }
         this.container.addChild(this.recoverChar);
         this.recoverChar.visible = true;
         this.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
         this.recoverChar.x = (this.container.width - this.recoverChar.width) / 2;
         this.recoverChar.y = (this.container.height - this.recoverChar.height) / 2;
      }
      
      public function setRecoverData(param1:XML) : void
      {
         if(this.recoverChar == null)
         {
            this.recoverChar = new RecoverPanel();
         }
         this.recoverChar.setRolesData(param1);
      }
      
      public function setRandomName(param1:String) : void
      {
         if(this.createChar)
         {
            this.createChar.setRandomName(param1);
         }
      }
      
      public function resize(param1:int, param2:int) : void
      {
         var $w:int = param1;
         var $h:int = param2;
         if($w < 1000)
         {
            $w = 1000;
         }
         if($h < 580)
         {
            $h = 580;
         }
         with(graphics)
         {
            clear();
            beginBitmapFill(FBitmapDataBufferManager.getBD("ui.login.bg.tile"));
            drawRect(0,0,$w,$h);
            endFill();
         }
         this.container.x = (Tools.currentStage.stageWidth - 1000) / 2;
         this.container.y = (Tools.currentStage.stageHeight - 580) / 2;
      }
      
      public function stopRollingBG() : void
      {
         this.backGroundLayer.stop2Rollit();
         TSoundManager.stopBgSound();
      }
      
      public function destory() : void
      {
         FBitmapDataBufferManager.destory();
         this.backGroundLayer.destory();
         this.hideAll();
      }
   }
}

