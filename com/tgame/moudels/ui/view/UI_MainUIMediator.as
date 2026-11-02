package com.tgame.moudels.ui.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.ResizeManager;
   import com.tgame.moudels.ui.UI_ApplicationFacade;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_MainUIMediator extends Mediator
   {
      
      public static const NAME:String = "UI_MainUIMediator";
      
      public function UI_MainUIMediator(param1:String = null, param2:Object = null)
      {
         super(param1,param2);
      }
      
      protected function get mainUI() : MainUI
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.mainUI);
            ResizeManager.resize();
         }
         return viewComponent as MainUI;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [UI_ApplicationFacade.SHOW_MAINUI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case UI_ApplicationFacade.SHOW_MAINUI:
               if(!Fun.isVisible(this.mainUI))
               {
                  GameInstance.uiInstance.uiContainer.addChildAt(this.mainUI,0);
                  this.mainUI.visible = true;
               }
               else
               {
                  if(this.mainUI.parent)
                  {
                     this.mainUI.parent.removeChild(this.mainUI);
                  }
                  this.mainUI.visible = false;
               }
         }
      }
   }
}

