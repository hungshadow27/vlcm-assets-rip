package com.tgame.moudels.ui.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.moudels.ui.UI_ApplicationFacade;
   import com.tgame.shell.view.components.huangjinshu.HuangJinShuPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_HuangJinShuMediator extends Mediator
   {
      
      public static const NAME:String = "UI_HuangJinShuMediator";
      
      public function UI_HuangJinShuMediator()
      {
         super(NAME);
      }
      
      protected function get wishingTreePanel() : HuangJinShuPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.huangjinshuPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - (viewComponent as HuangJinShuPanel).panelWidth / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - (viewComponent as HuangJinShuPanel).panelHeight / 2;
         }
         return viewComponent as HuangJinShuPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [UI_ApplicationFacade.SHOW_HUANGJINSHU_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case UI_ApplicationFacade.SHOW_HUANGJINSHU_PANEL:
               if(!Fun.isVisible(this.wishingTreePanel))
               {
                  GameInstance.uiInstance.uiContainer.addChild(this.wishingTreePanel);
                  this.wishingTreePanel.visible = true;
                  TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
                  TSoundManager.addPanelCloseSound(this.wishingTreePanel);
               }
               else
               {
                  if(this.wishingTreePanel.parent)
                  {
                     this.wishingTreePanel.parent.removeChild(this.wishingTreePanel);
                  }
                  this.wishingTreePanel.visible = false;
               }
         }
      }
   }
}

