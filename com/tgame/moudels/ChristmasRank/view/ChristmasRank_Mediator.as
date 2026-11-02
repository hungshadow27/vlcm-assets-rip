package com.tgame.moudels.ChristmasRank.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.shell.view.components.ChristmasRank.ChristmasRankCanvas;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ChristmasRank_Mediator extends Mediator
   {
      
      public static const NAME:String = "ChristmasRank_Mediator";
      
      public function ChristmasRank_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
      }
      
      override public function onRemove() : void
      {
      }
      
      public function get panel() : ChristmasRankCanvas
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.christmasRankCanvas);
         }
         return viewComponent as ChristmasRankCanvas;
      }
      
      public function showPanel(param1:Array) : void
      {
         GameInstance.uiInstance.mainUI.showChristmasRank(param1);
         GameInstance.uiInstance.mainUI.setTrackVisible(false);
         GameInstance.uiInstance.mainUI.setImageLeadContainerVisible(false);
      }
      
      public function hidePanel() : void
      {
         GameInstance.uiInstance.mainUI.hideChristmasRank();
         GameInstance.uiInstance.mainUI.setTrackVisible(true);
         GameInstance.uiInstance.mainUI.setImageLeadContainerVisible(true);
      }
   }
}

