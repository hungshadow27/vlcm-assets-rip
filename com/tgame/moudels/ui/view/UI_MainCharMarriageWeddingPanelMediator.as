package com.tgame.moudels.ui.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.moudels.ui.UI_ApplicationFacade;
   import com.tgame.shell.view.components.MarriageWeddingPanel;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_MainCharMarriageWeddingPanelMediator extends Mediator
   {
      
      public static const NAME:String = "UI_MainCharMarriageWeddingPanelMediator";
      
      public function UI_MainCharMarriageWeddingPanelMediator()
      {
         super(NAME);
      }
      
      protected function get marriageWeddingPanel() : MarriageWeddingPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.marriageWeddingPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as MarriageWeddingPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [UI_ApplicationFacade.SHOW_MARRIAGE_WEDDING_PLANE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:DisplayObject = null;
         var _loc5_:Rectangle = null;
         var _loc6_:Rectangle = null;
         var _loc7_:Rectangle = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case UI_ApplicationFacade.SHOW_MARRIAGE_WEDDING_PLANE:
               if(!Fun.isVisible(this.marriageWeddingPanel))
               {
                  if(ReloginManager.isInKuafu)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,"跨服服务器中，禁用此功能");
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"跨服服务器中，禁用此功能");
                     return;
                  }
                  GameInstance.uiInstance.uiContainer.addChild(this.marriageWeddingPanel);
                  this.marriageWeddingPanel.visible = true;
                  _loc3_ = 50;
                  _loc4_ = viewComponent as DisplayObject;
                  _loc5_ = new Rectangle(0,0,GameConfig.sceneWidth,GameConfig.sceneHeight);
                  _loc6_ = _loc4_.getBounds(GameInstance.stage);
                  _loc7_ = _loc5_.intersection(_loc6_);
                  if(_loc7_.width < _loc3_ || _loc7_.height < _loc3_)
                  {
                     _loc4_.x = GameConfig.sceneWidth / 2 - _loc4_.width / 2;
                     _loc4_.y = GameConfig.sceneHeight / 2 - _loc4_.height / 2;
                  }
                  TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
                  TSoundManager.addPanelCloseSound(_loc4_);
               }
               else
               {
                  if(this.marriageWeddingPanel.parent)
                  {
                     this.marriageWeddingPanel.parent.removeChild(this.marriageWeddingPanel);
                  }
                  this.marriageWeddingPanel.visible = false;
               }
         }
      }
      
      public function ok() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:DisplayObject = null;
         var _loc3_:Rectangle = null;
         var _loc4_:Rectangle = null;
         var _loc5_:Rectangle = null;
         if(!Fun.isVisible(this.marriageWeddingPanel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.marriageWeddingPanel);
            this.marriageWeddingPanel.visible = true;
            _loc1_ = 50;
            _loc2_ = viewComponent as DisplayObject;
            _loc3_ = new Rectangle(0,0,GameConfig.sceneWidth,GameConfig.sceneHeight);
            _loc4_ = _loc2_.getBounds(GameInstance.stage);
            _loc5_ = _loc3_.intersection(_loc4_);
            if(_loc5_.width < _loc1_ || _loc5_.height < _loc1_)
            {
               _loc2_.x = GameConfig.sceneWidth / 2 - _loc2_.width / 2;
               _loc2_.y = GameConfig.sceneHeight / 2 - _loc2_.height / 2;
            }
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
            TSoundManager.addPanelCloseSound(_loc2_);
         }
         else
         {
            if(this.marriageWeddingPanel.parent)
            {
               this.marriageWeddingPanel.parent.removeChild(this.marriageWeddingPanel);
            }
            this.marriageWeddingPanel.visible = false;
         }
      }
   }
}

