package com.tgame.moudels.twitchGift.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.shell.view.components.KongMingLockPanel;
   
   public class HuangJinBaoXiang_Mediator extends TwitchGift_Super_Mediator
   {
      
      public static const NAME:String = "HuangJinBaoXiang_Mediator";
      
      public function HuangJinBaoXiang_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override protected function get kongMingLockPanel() : KongMingLockPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.kongMingLockPanel5);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as KongMingLockPanel;
      }
      
      public function setWuliangMizang() : void
      {
         this.kongMingLockPanel.setZhijin();
      }
   }
}

