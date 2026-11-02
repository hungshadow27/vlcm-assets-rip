package com.tgame.moudels.ui.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.moudels.ui.UI_ApplicationFacade;
   import com.tgame.shell.view.components.ButtonContainer;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_DazuoMediator extends Mediator
   {
      
      public static const NAME:String = "UI_DazuoMediator";
      
      public function UI_DazuoMediator()
      {
         super(NAME);
      }
      
      protected function get sitPanel() : ButtonContainer
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.buttonContainer);
            ResizeManager.resizeSitPanel();
         }
         return viewComponent as ButtonContainer;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [UI_ApplicationFacade.SHOW_DAZUO_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case UI_ApplicationFacade.SHOW_DAZUO_PANEL:
               if(!Fun.isVisible(this.sitPanel))
               {
                  if(ReloginManager.isInKuafu)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,"跨服服务器中，禁用此功能");
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"跨服服务器中，禁用此功能");
                     return;
                  }
                  GameInstance.uiInstance.uiContainer.addChildAt(this.sitPanel,0);
                  this.sitPanel.visible = true;
                  this.sitPanel.setType(GameInstance.mainCharData.isDiZi);
                  ResizeManager.resizeSitPanel();
               }
               else
               {
                  if(this.sitPanel.parent)
                  {
                     this.sitPanel.parent.removeChild(this.sitPanel);
                  }
                  this.sitPanel.visible = false;
               }
         }
      }
   }
}

