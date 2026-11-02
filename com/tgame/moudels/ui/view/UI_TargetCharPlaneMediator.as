package com.tgame.moudels.ui.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.moudels.ui.UI_ApplicationFacade;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_TargetCharPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "UI_TargetCharPlaneMediator";
      
      public function UI_TargetCharPlaneMediator()
      {
         super(NAME);
      }
      
      protected function get targetCharArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as TargetAttribute;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [UI_ApplicationFacade.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:DisplayObject = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case UI_ApplicationFacade.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE:
               if(!Fun.isVisible(this.targetCharArrtibutePlane))
               {
                  GameInstance.uiInstance.uiContainer.addChild(this.targetCharArrtibutePlane);
                  this.targetCharArrtibutePlane.visible = true;
                  _loc3_ = viewComponent as DisplayObject;
                  _loc3_.x = GameConfig.sceneWidth / 2 - 600 / 2;
                  _loc3_.y = GameConfig.sceneHeight / 2 - 450 / 2;
                  TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
                  TSoundManager.addPanelCloseSound(_loc3_);
               }
               else
               {
                  if(this.targetCharArrtibutePlane.parent)
                  {
                     this.targetCharArrtibutePlane.parent.removeChild(this.targetCharArrtibutePlane);
                  }
                  this.targetCharArrtibutePlane.visible = false;
               }
         }
      }
   }
}

