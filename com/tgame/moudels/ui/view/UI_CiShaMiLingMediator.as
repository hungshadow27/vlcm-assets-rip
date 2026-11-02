package com.tgame.moudels.ui.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.moudels.ui.UI_ApplicationFacade;
   import com.tgame.shell.view.components.cisha.CishaJiangliPanel;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_CiShaMiLingMediator extends Mediator
   {
      
      public static const NAME:String = "UI_CiShaMiLingMediator";
      
      public function UI_CiShaMiLingMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get ciShajiangLiPanel() : CishaJiangliPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ciShaJiangliPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as CishaJiangliPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [UI_ApplicationFacade.SHOW_CISHA_OK_PANEL];
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
            case UI_ApplicationFacade.SHOW_CISHA_OK_PANEL:
               if(!Fun.isVisible(this.ciShajiangLiPanel))
               {
                  if(ReloginManager.isInKuafu)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("暂无数据"),false);
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("暂无数据"),false);
                     return;
                  }
                  GameInstance.uiInstance.uiContainer.addChild(this.ciShajiangLiPanel);
                  this.ciShajiangLiPanel.visible = true;
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
                  if(this.ciShajiangLiPanel.parent)
                  {
                     this.ciShajiangLiPanel.parent.removeChild(this.ciShajiangLiPanel);
                  }
                  this.ciShajiangLiPanel.visible = false;
               }
         }
      }
   }
}

