package com.tgame.moudels.ui.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.moudels.ui.UI_ApplicationFacade;
   import com.tgame.shell.view.components.QingRenJie_ChaXunWanJiaPanel;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_QingRenJieChaKanWanJia_Mediator extends Mediator
   {
      
      public static const NAME:String = "UI_QingRenJieChaKanWanJia_Mediator";
      
      public function UI_QingRenJieChaKanWanJia_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get QINGRENJIECHAKAN() : QingRenJie_ChaXunWanJiaPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.qingrenjieChaXunWanJiaPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as QingRenJie_ChaXunWanJiaPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [UI_ApplicationFacade.SHOW_QINGRENJIESONGHUA_PLANE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:DisplayObject = null;
         var _loc6_:Rectangle = null;
         var _loc7_:Rectangle = null;
         var _loc8_:Rectangle = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case UI_ApplicationFacade.SHOW_QINGRENJIESONGHUA_PLANE:
               _loc3_ = Number(_loc2_);
               if(!Fun.isVisible(this.QINGRENJIECHAKAN))
               {
                  GameInstance.uiInstance.uiContainer.addChild(this.QINGRENJIECHAKAN);
                  this.QINGRENJIECHAKAN.setType(_loc3_);
                  this.QINGRENJIECHAKAN.visible = true;
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

