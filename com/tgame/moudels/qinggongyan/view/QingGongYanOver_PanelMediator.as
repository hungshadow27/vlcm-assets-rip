package com.tgame.moudels.qinggongyan.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.qinggongyan.QingGongYan_ApplicationFacade;
   import com.tgame.shell.view.components.QingGongYanOverPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QingGongYanOver_PanelMediator extends Mediator
   {
      
      public static const NAME:String = "QingGongYanOver_PanelMediator";
      
      public function QingGongYanOver_PanelMediator()
      {
         super(NAME);
      }
      
      public function get qinggongyanOverPanel() : QingGongYanOverPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.qinggongyanOverPanel);
         }
         return viewComponent as QingGongYanOverPanel;
      }
      
      override public function onRegister() : void
      {
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(QingGongYanOverPanel,function():void
         {
         });
         UIEventsRegisterManager.addUIRemovedEvent(QingGongYanOverPanel,function():void
         {
         });
      }
      
      override public function listNotificationInterests() : Array
      {
         return [QingGongYan_ApplicationFacade.SHOW_QINGGONGYAN_OVER];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Buff = null;
         switch(param1.getName())
         {
            case QingGongYan_ApplicationFacade.SHOW_QINGGONGYAN_OVER:
               if(!Fun.isVisible(this.qinggongyanOverPanel))
               {
                  GameInstance.uiInstance.uiContainer.addChild(this.qinggongyanOverPanel);
                  this.qinggongyanOverPanel.x = GameConfig.sceneWidth / 2 - this.qinggongyanOverPanel.width / 2;
                  this.qinggongyanOverPanel.y = GameConfig.sceneHeight / 2 - this.qinggongyanOverPanel.height / 2;
                  _loc2_ = GameInstance.mainCharData.buffInfo.getBuff(98001);
                  if(_loc2_ == null)
                  {
                     _loc2_ = new Buff(98001);
                     _loc2_.vipTime = " " + LanResManager.getLanCommonTextWords("无");
                  }
                  this.qinggongyanOverPanel.setBuff(_loc2_);
               }
         }
      }
      
      public function setPlayerAndNumber(param1:String, param2:int = -1) : void
      {
         this.qinggongyanOverPanel.setPlayerName(param1);
         this.qinggongyanOverPanel.setPlayerNumber(param2);
      }
      
      public function setNumber(param1:int) : void
      {
         this.qinggongyanOverPanel.setPlayerNumber(param1);
      }
      
      public function setPanel(param1:int) : void
      {
         this.qinggongyanOverPanel.setPanel(param1);
      }
   }
}

