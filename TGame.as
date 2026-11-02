package
{
   import com.asQuery.$;
   import com.asQuery.ASQueryConfig;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.FacadeManager;
   import com.tgame.manager.KeyboardManager;
   import com.tgame.manager.MsgReSendManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.SitManager;
   import com.tgame.manager.TSoundManager;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.display.StageAlign;
   import flash.display.StageQuality;
   import flash.display.StageScaleMode;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.system.Security;
   import flash.system.SecurityPanel;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   
   [SWF(width="500", height="375", backgroundColor="#000000", frameRate="24")]
   public class TGame extends Sprite
   {
      
      public var sceneContainer:Sprite;
      
      public var bloodContainer:Sprite;
      
      public var uiContainer:Sprite;
      
      public var alertContainer:Sprite;
      
      public var toolTipContainer:Sprite;
      
      public var letterContainer:Sprite;
      
      public function TGame()
      {
         super();
         this.callJavaScriptAPI("inited",[]);
         this.startup(stage,root.loaderInfo.parameters,null);
         ExternalInterface.addCallback("flashSetting",this.flashSetting);
      }
      
      public function callJavaScriptAPI(param1:String, param2:Array) : void
      {
         ExternalInterface.call(param1,param2);
      }
      
      public function flashSetting(param1:String = "") : void
      {
         Security.showSettings(SecurityPanel.LOCAL_STORAGE);
      }
      
      public function initMenu() : void
      {
         var _loc1_:ContextMenu = new ContextMenu();
         var _loc2_:ContextMenuItem = new ContextMenuItem("V " + TVersion.VERSION,false,false);
         _loc1_.customItems.push(_loc2_);
         _loc1_.hideBuiltInItems();
         this.contextMenu = _loc1_;
      }
      
      public function initStage(param1:Stage) : void
      {
         param1.scaleMode = StageScaleMode.NO_SCALE;
         param1.align = StageAlign.TOP_LEFT;
         param1.quality = StageQuality.LOW;
         param1.frameRate = GameConfig.frameRate;
      }
      
      public function initContainer() : void
      {
         this.sceneContainer = new Sprite();
         this.addChild(this.sceneContainer);
         this.bloodContainer = new Sprite();
         this.addChild(this.bloodContainer);
         this.bloodContainer.mouseChildren = false;
         this.bloodContainer.mouseEnabled = false;
         this.uiContainer = new Sprite();
         this.addChild(this.uiContainer);
         this.uiContainer.mouseChildren = false;
         this.uiContainer.addEventListener(MouseEvent.MOUSE_OVER,function(param1:MouseEvent):void
         {
            uiContainer.mouseChildren = true;
            uiContainer.tabChildren = true;
            uiContainer.tabEnabled = true;
         });
         this.uiContainer.addEventListener(MouseEvent.MOUSE_OUT,function(param1:MouseEvent):void
         {
            uiContainer.mouseChildren = false;
            uiContainer.tabChildren = false;
            uiContainer.tabEnabled = false;
         });
         this.alertContainer = new Sprite();
         this.addChild(this.alertContainer);
         this.alertContainer.mouseEnabled = false;
         this.toolTipContainer = new Sprite();
         this.addChild(this.toolTipContainer);
         this.toolTipContainer.mouseChildren = false;
         this.toolTipContainer.mouseEnabled = false;
         this.letterContainer = new Sprite();
         this.addChild(this.letterContainer);
         this.letterContainer.mouseChildren = false;
         this.letterContainer.mouseEnabled = false;
      }
      
      public function startup(param1:Stage, param2:Object = null, param3:Function = null) : void
      {
         if(param1 == null)
         {
            return;
         }
         $(this).ready(this.initASQuery);
         this.initMenu();
         this.initStage(param1);
         this.initContainer();
         GameInstance.stage = param1;
         GameInstance.app = this;
         GameInstance.uiInstance.bloodContainer = this.bloodContainer;
         GameInstance.uiInstance.uiContainer = this.uiContainer;
         GameInstance.uiInstance.alertContainer = this.alertContainer;
         GameInstance.uiInstance.toolTipContainer = this.toolTipContainer;
         GameInstance.uiInstance.letterContainer = this.letterContainer;
         TLog.init(param1,false);
         ResizeManager.init();
         KeyboardManager.init();
         MsgReSendManager.init();
         NetWorkManager.init();
         TSoundManager.init();
         SitManager.init();
         ReloginManager.init();
         FacadeManager.startupFacade(PipeConstants.STARTUP_SHELL,{
            "parameters":param2,
            "decode":param3
         });
      }
      
      protected function initASQuery() : void
      {
         ASQueryConfig.stage = stage;
      }
   }
}

