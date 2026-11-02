package com.tgame.moudels.xinnianyasuiqian.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.moudels.xinnianyasuiqian.Xinnianyasuiqian_ApplicationFacade;
   import com.tgame.shell.view.components.xinnianyasuiqian.Xinnianyasuiqian_ChaXunWanJiaPanel;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_XinnianyasuiqianKanWanJia_Mediator extends Mediator
   {
      
      public static const NAME:String = "UI_XinnianyasuiqianKanWanJia_Mediator";
      
      public function UI_XinnianyasuiqianKanWanJia_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get QINGRENJIECHAKAN() : Xinnianyasuiqian_ChaXunWanJiaPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xinnianyasuiqianChaXunWanJiaPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as Xinnianyasuiqian_ChaXunWanJiaPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Xinnianyasuiqian_ApplicationFacade.SHOW_XINIANYASUIQIANCHAKAN_PLANE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         var _loc4_:DisplayObject = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Xinnianyasuiqian_ApplicationFacade.SHOW_XINIANYASUIQIANCHAKAN_PLANE:
               _loc3_ = Number(_loc2_);
               if(!Fun.isVisible(this.QINGRENJIECHAKAN))
               {
                  GameInstance.uiInstance.uiContainer.addChild(this.QINGRENJIECHAKAN);
                  this.QINGRENJIECHAKAN.setType(_loc3_);
                  this.QINGRENJIECHAKAN.visible = true;
                  _loc4_ = viewComponent as DisplayObject;
                  _loc4_.x = GameConfig.sceneWidth / 2 - _loc4_.width / 2;
                  _loc4_.y = GameConfig.sceneHeight / 2 - _loc4_.height / 2;
               }
               else
               {
                  if(this.QINGRENJIECHAKAN.parent)
                  {
                     this.QINGRENJIECHAKAN.parent.removeChild(this.QINGRENJIECHAKAN);
                  }
                  this.QINGRENJIECHAKAN.visible = false;
               }
         }
      }
   }
}

