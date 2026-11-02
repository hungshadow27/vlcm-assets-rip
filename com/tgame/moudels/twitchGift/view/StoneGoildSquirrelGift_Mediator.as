package com.tgame.moudels.twitchGift.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.shell.view.components.GoldSquirrelGiftPanel;
   
   public class StoneGoildSquirrelGift_Mediator extends BaseGoldSquirrelGift_Mediator
   {
      
      public static const NAME:String = "StoneGoildSquirrelGift_Mediator";
      
      public function StoneGoildSquirrelGift_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override protected function get squirrelGiftPanel() : GoldSquirrelGiftPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.goldSquirrelGiftPanel3014);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as GoldSquirrelGiftPanel;
      }
   }
}

