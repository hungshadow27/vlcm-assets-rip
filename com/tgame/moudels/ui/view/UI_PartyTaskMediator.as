package com.tgame.moudels.ui.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.BangzhongZhiwu;
   import com.tgame.manager.TSoundManager;
   import com.tgame.moudels.ui.UI_ApplicationFacade;
   import com.tgame.shell.view.components.Party_taskPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_PartyTaskMediator extends Mediator
   {
      
      public static const NAME:String = "UI_PartyTaskMediator";
      
      public function UI_PartyTaskMediator()
      {
         super(NAME);
      }
      
      protected function get uiPanel() : Party_taskPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.partyTaskPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as Party_taskPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [UI_ApplicationFacade.SHOW_PARTY_TASK_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case UI_ApplicationFacade.SHOW_PARTY_TASK_PANEL:
               if(!Fun.isVisible(this.uiPanel))
               {
                  GameInstance.uiInstance.uiContainer.addChild(this.uiPanel);
                  this.uiPanel.setIsBangZhu(GameInstance.mainCharData.banghuiInfo.zhiwu == BangzhongZhiwu.ZW1);
                  this.uiPanel.visible = true;
                  this.uiPanel.x = GameConfig.sceneWidth / 2 - 680 / 2;
                  this.uiPanel.y = GameConfig.sceneHeight / 2 - 380 / 2;
                  TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
                  TSoundManager.addPanelCloseSound(this.uiPanel);
               }
               else
               {
                  if(this.uiPanel.parent)
                  {
                     this.uiPanel.parent.removeChild(this.uiPanel);
                  }
                  this.uiPanel.visible = false;
               }
         }
      }
   }
}

