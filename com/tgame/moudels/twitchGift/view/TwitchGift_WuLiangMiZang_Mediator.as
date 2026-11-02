package com.tgame.moudels.twitchGift.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.shell.view.components.KongMingLockPanel;
   
   public class TwitchGift_WuLiangMiZang_Mediator extends TwitchGift_Super_Mediator
   {
      
      public static const NAME:String = "TwitchGift_WuLiangMiZang_Mediator";
      
      public function TwitchGift_WuLiangMiZang_Mediator()
      {
         super(NAME);
      }
      
      override protected function get kongMingLockPanel() : KongMingLockPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.kongMingLockPanel4);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as KongMingLockPanel;
      }
      
      public function setWuliangMizang() : void
      {
         this.kongMingLockPanel.setWuliangMizang();
      }
   }
}

