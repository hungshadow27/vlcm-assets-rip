package com.tgame.moudels.ui.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.shell.view.components.huodong.LiandanluPanel;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_LianDanLuMediator extends Mediator
   {
      
      public static const NAME:String = "UI_LianDanLuMediator";
      
      public function UI_LianDanLuMediator()
      {
         super(NAME);
      }
      
      protected function get panel() : LiandanluPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.liandanluPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2 + 100;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as LiandanluPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
   }
}

