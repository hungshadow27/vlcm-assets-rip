package com.tgame.moudels.ui.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.moudels.ui.UI_ApplicationFacade;
   import com.tgame.shell.view.components.aojianzhuzao.AoJianZhuZaoPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_AoJianZhuZaoMediator extends Mediator
   {
      
      public static const NAME:String = "UI_AoJianZhuZaoMediator";
      
      public function UI_AoJianZhuZaoMediator()
      {
         super(NAME);
      }
      
      protected function get aoJianZhuZaoPanel() : AoJianZhuZaoPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.aoJianZhuZaoPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - (viewComponent as AoJianZhuZaoPanel).panelWidth / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - (viewComponent as AoJianZhuZaoPanel).panelHeight / 2;
         }
         return viewComponent as AoJianZhuZaoPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [UI_ApplicationFacade.SHOW_AOJIANDUANZAO_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case UI_ApplicationFacade.SHOW_AOJIANDUANZAO_PANEL:
               if(!Fun.isVisible(this.aoJianZhuZaoPanel))
               {
                  GameInstance.uiInstance.uiContainer.addChild(this.aoJianZhuZaoPanel);
                  this.aoJianZhuZaoPanel.visible = true;
                  this.aoJianZhuZaoPanel.reset();
                  TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
                  TSoundManager.addPanelCloseSound(this.aoJianZhuZaoPanel);
                  this.openBackpack();
               }
               else
               {
                  if(this.aoJianZhuZaoPanel.parent)
                  {
                     this.aoJianZhuZaoPanel.parent.removeChild(this.aoJianZhuZaoPanel);
                  }
                  this.aoJianZhuZaoPanel.visible = false;
               }
         }
      }
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.aoJianZhuZaoPanel,GameInstance.uiInstance.backpack);
      }
   }
}

