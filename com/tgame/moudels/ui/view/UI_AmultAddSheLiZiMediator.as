package com.tgame.moudels.ui.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.moudels.ui.UI_ApplicationFacade;
   import com.tgame.shell.view.components.SheliziEnchasePanel;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_AmultAddSheLiZiMediator extends Mediator
   {
      
      public static const NAME:String = "UI_AmultAddSheLiZiMediator";
      
      public function UI_AmultAddSheLiZiMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get amultAddSheLiZiPanel() : SheliziEnchasePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.sheliziEnchasePanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as SheliziEnchasePanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [UI_ApplicationFacade.SHOW_AMULT_ADD_SHELIZI,UI_ApplicationFacade.CLOSE_AMULT_ADD_SHELIZI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:DisplayObject = null;
         var _loc4_:Rectangle = null;
         var _loc5_:Rectangle = null;
         var _loc6_:Rectangle = null;
         switch(param1.getName())
         {
            case UI_ApplicationFacade.SHOW_AMULT_ADD_SHELIZI:
               if(!Fun.isVisible(this.amultAddSheLiZiPanel))
               {
                  if(ReloginManager.isInKuafu)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,"跨服服务器中，禁用此功能");
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"跨服服务器中，禁用此功能");
                     return;
                  }
                  OtherConst.closePanel(this.amultAddSheLiZiPanel);
                  GameInstance.uiInstance.uiContainer.addChild(this.amultAddSheLiZiPanel);
                  this.amultAddSheLiZiPanel.visible = true;
                  _loc2_ = 50;
                  _loc3_ = viewComponent as DisplayObject;
                  _loc4_ = new Rectangle(0,0,GameConfig.sceneWidth,GameConfig.sceneHeight);
                  _loc5_ = _loc3_.getBounds(GameInstance.stage);
                  _loc6_ = _loc4_.intersection(_loc5_);
                  if(_loc6_.width < _loc2_ || _loc6_.height < _loc2_)
                  {
                     _loc3_.x = GameConfig.sceneWidth / 2 - _loc3_.width / 2;
                     _loc3_.y = GameConfig.sceneHeight / 2 - _loc3_.height / 2;
                  }
                  TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
                  TSoundManager.addPanelCloseSound(_loc3_);
               }
               break;
            case UI_ApplicationFacade.CLOSE_AMULT_ADD_SHELIZI:
               if(this.amultAddSheLiZiPanel.parent)
               {
                  this.amultAddSheLiZiPanel.parent.removeChild(this.amultAddSheLiZiPanel);
               }
               this.amultAddSheLiZiPanel.visible = false;
               ResizeManager.hideDoublePanel();
         }
      }
   }
}

