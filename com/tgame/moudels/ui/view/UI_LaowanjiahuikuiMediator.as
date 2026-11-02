package com.tgame.moudels.ui.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.moudels.ui.UI_ApplicationFacade;
   import com.tgame.shell.view.components.WanJiaHuiKuiPanel;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_LaowanjiahuikuiMediator extends Mediator
   {
      
      public static const NAME:String = "UI_LaowanjiahuikuiMediator";
      
      public function UI_LaowanjiahuikuiMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get panel() : WanJiaHuiKuiPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.wanjiahuikuiPanel);
            ResizeManager.resizeSitPanel();
         }
         return viewComponent as WanJiaHuiKuiPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [UI_ApplicationFacade.SHOW_WANJIAHUIKUI];
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
            case UI_ApplicationFacade.SHOW_WANJIAHUIKUI:
               if(!Fun.isVisible(this.panel))
               {
                  if(ReloginManager.isInKuafu)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,"跨服服务器中，禁用此功能");
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"跨服服务器中，禁用此功能");
                     return;
                  }
                  GameInstance.uiInstance.uiContainer.addChild(this.panel);
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
                  ResizeManager.resize();
               }
               else if(this.panel.parent)
               {
                  this.panel.parent.removeChild(this.panel);
               }
         }
      }
   }
}

