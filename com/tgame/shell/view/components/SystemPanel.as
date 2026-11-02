package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.shell.view.components.system.BugSubmissionCanvas;
   import com.tgame.shell.view.components.system.KeyboardShortcutsCanvas;
   import com.tgame.shell.view.components.system.SystemSetupCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   
   public class SystemPanel extends FPanel
   {
      
      public static const UI_SYSTEM_SETUP_SHOW:String = "UI_SYSTEM_SETUP_SHOW";
      
      public static const UI_SYSTEM_KEYBOARDSHORTCUTS_SHOW:String = "UI_SYSTEM_KEYBOARDSHORTCUTS_SHOW";
      
      public static const UI_SYSTEM_BUGSUBMIS_SHOW:String = "UI_SYSTEM_BUGSUBMIS_SHOW";
      
      public static const UI_SYSTEM_SETUP_CHECK_SHOW:String = "UI_SYSTEM_SETUP_CHECK_SHOW";
      
      public static const UI_SYSTEM_BUGSUBMIS_ONLINESERVICE_SHOW:String = "UI_SYSTEM_BUGSUBMIS_ONLINESERVICE_SHOW";
      
      public static const UI_SYSTEM_BUGSUBMIS_SUB_SHOW:String = "UI_SYSTEM_BUGSUBMIS_SUB_SHOW";
      
      public static const UI_SYSTEM_BUGSUBMIS_CANCE_SHOW:String = "UI_SYSTEM_BUGSUBMIS_CANCE_SHOW";
      
      private var systemsetupCanvas:SystemSetupCanvas;
      
      private var keyboardshortcutsCanvas:KeyboardShortcutsCanvas;
      
      private var bugsubmissionCanvas:BugSubmissionCanvas;
      
      private var tabBar:FTabBar;
      
      public function SystemPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 476;
         height = 413;
         this.titleText = LanResManager.getLanCommonTextWords("系统设置");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.systemsetupCanvas = new SystemSetupCanvas();
         this.systemsetupCanvas.$parent = this;
         addChild(this.systemsetupCanvas);
         this.systemsetupCanvas.x = 10;
         this.systemsetupCanvas.y = 20;
         this.keyboardshortcutsCanvas = new KeyboardShortcutsCanvas();
         this.keyboardshortcutsCanvas.$parent = this;
         addChild(this.keyboardshortcutsCanvas);
         this.keyboardshortcutsCanvas.x = 10;
         this.keyboardshortcutsCanvas.y = 20;
         this.keyboardshortcutsCanvas.visible = false;
         this.bugsubmissionCanvas = new BugSubmissionCanvas();
         this.bugsubmissionCanvas.$parent = this;
         addChild(this.bugsubmissionCanvas);
         this.bugsubmissionCanvas.x = 10;
         this.bugsubmissionCanvas.y = 20;
         this.bugsubmissionCanvas.visible = false;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.systemsetupCanvas.bgImg);
         _loc1_.push(this.keyboardshortcutsCanvas.bgImg);
         _loc1_.push(this.bugsubmissionCanvas.bgImg);
         this.DynamicManageImages = _loc1_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("系统设置"),this.onClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("快捷键"),this.onClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("系统设置"):
               this.showSystemSetup();
               dispatchEvent(new BaseEvent(UI_SYSTEM_SETUP_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("快捷键"):
               this.showKeyboardShortcuts();
               dispatchEvent(new BaseEvent(UI_SYSTEM_KEYBOARDSHORTCUTS_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("BUG提交"):
               this.showBugSubmission();
               dispatchEvent(new BaseEvent(UI_SYSTEM_BUGSUBMIS_SHOW));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function showSystemSetup() : void
      {
         this.systemsetupCanvas.visible = true;
         this.keyboardshortcutsCanvas.visible = false;
         this.bugsubmissionCanvas.visible = false;
      }
      
      public function showKeyboardShortcuts() : void
      {
         this.systemsetupCanvas.visible = false;
         this.keyboardshortcutsCanvas.visible = true;
         this.bugsubmissionCanvas.visible = false;
      }
      
      public function showBugSubmission() : void
      {
         this.systemsetupCanvas.visible = false;
         this.keyboardshortcutsCanvas.visible = false;
         this.bugsubmissionCanvas.visible = true;
      }
      
      public function SystemSetupSetInitialize(param1:Dictionary) : void
      {
         this.systemsetupCanvas.SetInitialize(param1);
      }
      
      public function BugSubmissSetInitialize() : void
      {
         this.bugsubmissionCanvas.SetInitialize();
      }
      
      public function BugSubmissRelieve() : void
      {
         this.bugsubmissionCanvas.Relieve();
      }
   }
}

