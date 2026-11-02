package com.tgame.moudels.twitchGift.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.shell.view.components.TreasureMapPanel;
   
   public class TreasureMap_Advancefd_Mediator extends TreasureMap_Super_Mediator
   {
      
      public static const NAME:String = "TreasureMap_Advancefd_Mediator";
      
      public function TreasureMap_Advancefd_Mediator()
      {
         super(NAME);
         super.shovelType = SpecialGoodsID.ADVANCEFD_SHOVEL;
      }
      
      override protected function get treasureMapPanel() : TreasureMapPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.treasureMapPanel1);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as TreasureMapPanel;
      }
   }
}

