package com.tgame.moudels.ui.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.moudels.ui.UI_ApplicationFacade;
   import com.tgame.shell.view.components.InfoQueryPanel;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_MainCharConcernMsgMediator extends Mediator
   {
      
      public static var NAME:String = "UI_MainCharConcernMsgMediator";
      
      public function UI_MainCharConcernMsgMediator()
      {
         super(NAME);
      }
      
      protected function get getpanel() : InfoQueryPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.infoQueryPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as InfoQueryPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [UI_ApplicationFacade.SHOW_INFOQUERY_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:DisplayObject = null;
         var _loc6_:Rectangle = null;
         var _loc7_:Rectangle = null;
         var _loc8_:Rectangle = null;
         var _loc2_:Object = param1.getBody();
         var _loc3_:Function = _loc2_ as Function;
         switch(param1.getName())
         {
            case UI_ApplicationFacade.SHOW_INFOQUERY_PANEL:
               if(!Fun.isVisible(this.getpanel))
               {
                  if(ReloginManager.isInKuafu)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,"跨服服务器中，禁用此功能");
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"跨服服务器中，禁用此功能");
                     return;
                  }
                  GameInstance.uiInstance.uiContainer.addChild(this.getpanel);
                  this.getpanel.visible = true;
                  _loc4_ = 50;
                  _loc5_ = viewComponent as DisplayObject;
                  _loc6_ = new Rectangle(0,0,GameConfig.sceneWidth,GameConfig.sceneHeight);
                  _loc7_ = _loc5_.getBounds(GameInstance.stage);
                  _loc8_ = _loc6_.intersection(_loc7_);
                  if(_loc8_.width < _loc4_ || _loc8_.height < _loc4_)
                  {
                     _loc5_.x = GameConfig.sceneWidth / 2 - _loc5_.width / 2;
                     _loc5_.y = GameConfig.sceneHeight / 2 - _loc5_.height / 2;
                  }
                  TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
                  TSoundManager.addPanelCloseSound(_loc5_);
               }
               else
               {
                  if(this.getpanel.parent)
                  {
                     this.getpanel.parent.removeChild(this.getpanel);
                  }
                  this.getpanel.visible = false;
               }
         }
      }
   }
}

