package com.tgame.moudels.ui.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.moudels.ui.UI_ApplicationFacade;
   import com.tgame.shell.view.components.SystemPanel;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_MainCharSettingsMediator extends Mediator
   {
      
      public static const NAME:String = "UI_MainCharSettingsMediator";
      
      public function UI_MainCharSettingsMediator()
      {
         super(NAME);
      }
      
      protected function get settingsPanel() : SystemPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.settingsPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.panelWidth / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.panelHeight / 2;
         }
         return viewComponent as SystemPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [UI_ApplicationFacade.SHOW_SETTINGS_PANEL_TAB];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:DisplayObject = null;
         var _loc5_:Rectangle = null;
         var _loc6_:Rectangle = null;
         var _loc7_:Rectangle = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case UI_ApplicationFacade.SHOW_SETTINGS_PANEL_TAB:
               if(!GameInstance.mainCharData.isDiZi && !Fun.isVisible(this.settingsPanel))
               {
                  GameInstance.uiInstance.uiContainer.addChild(this.settingsPanel);
                  this.settingsPanel.visible = true;
                  _loc3_ = 50;
                  _loc4_ = viewComponent as DisplayObject;
                  _loc5_ = new Rectangle(0,0,GameConfig.sceneWidth,GameConfig.sceneHeight);
                  _loc6_ = _loc4_.getBounds(GameInstance.stage);
                  _loc7_ = _loc5_.intersection(_loc6_);
                  if(_loc7_.width < _loc3_ || _loc7_.height < _loc3_)
                  {
                     _loc4_.x = GameConfig.sceneWidth / 2 - _loc4_.width / 2;
                     _loc4_.y = GameConfig.sceneHeight / 2 - _loc4_.height / 2;
                  }
                  TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
                  TSoundManager.addPanelCloseSound(_loc4_);
               }
               else
               {
                  if(this.settingsPanel.parent)
                  {
                     this.settingsPanel.parent.removeChild(this.settingsPanel);
                  }
                  this.settingsPanel.visible = false;
               }
         }
      }
   }
}

