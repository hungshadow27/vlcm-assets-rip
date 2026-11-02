package com.tgame.moudels.ui.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.moudels.ui.UI_ApplicationFacade;
   import com.tgame.shell.view.components.huodong.MenghuanSishengshouPanel;
   import com.zcp.common.utils.Fun;
   import flash.geom.Rectangle;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_SiLingZhenYinCangShuXing_Mediator extends Mediator
   {
      
      public static const NAME:String = "UI_SiLingZhenYinCangShuXing_Mediator";
      
      public function UI_SiLingZhenYinCangShuXing_Mediator()
      {
         super(NAME);
      }
      
      protected function get uiPanel() : MenghuanSishengshouPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.siLingZhenYinCangShuXingPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as MenghuanSishengshouPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [UI_ApplicationFacade.SHOW_SI_LIN_ZHEN_YIN_CANG_SHU_XING];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Rectangle = null;
         var _loc5_:Rectangle = null;
         var _loc6_:Rectangle = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case UI_ApplicationFacade.SHOW_SI_LIN_ZHEN_YIN_CANG_SHU_XING:
               if(!Fun.isVisible(this.uiPanel))
               {
                  GameInstance.uiInstance.uiContainer.addChild(this.uiPanel);
                  this.uiPanel.visible = true;
                  _loc3_ = 50;
                  _loc4_ = new Rectangle(0,0,GameConfig.sceneWidth,GameConfig.sceneHeight);
                  _loc5_ = this.uiPanel.getBounds(GameInstance.stage);
                  _loc6_ = _loc4_.intersection(_loc5_);
                  if(_loc6_.width < _loc3_ || _loc6_.height < _loc3_)
                  {
                     this.uiPanel.x = GameConfig.sceneWidth / 2 - this.uiPanel.width / 2;
                     this.uiPanel.y = GameConfig.sceneHeight / 2 - this.uiPanel.height / 2;
                  }
                  TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
                  TSoundManager.addPanelCloseSound(this.uiPanel);
               }
               else
               {
                  if(this.uiPanel.parent)
                  {
                     this.uiPanel.parent.removeChild(this.uiPanel);
                  }
                  this.uiPanel.visible = false;
               }
         }
      }
   }
}

