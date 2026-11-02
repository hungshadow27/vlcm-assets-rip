package com.tgame.moudels.ynZhuadayu.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ynZhuadayu.YNzhuadayu_ApplicationFacade;
   import com.tgame.moudels.ynZhuadayu.model.YNzhuadayu_MsgSendProxy;
   import com.tgame.shell.view.components.ynSpecial.YNzhuadayuPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNzhuadayu_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNzhuadayu_Mediator";
      
      private var _senderProxy:YNzhuadayu_MsgSendProxy;
      
      public function YNzhuadayu_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [YNzhuadayu_ApplicationFacade.SHOW_YNZHUADAYUPANEL];
      }
      
      private function get senderProxy() : YNzhuadayu_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YNzhuadayu_MsgSendProxy.NAME) as YNzhuadayu_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case YNzhuadayu_ApplicationFacade.SHOW_YNZHUADAYUPANEL:
               this.senderProxy.send_81231();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YNzhuadayuPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ynZhuadayuPanel);
         }
         return viewComponent as YNzhuadayuPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YNzhuadayuPanel,function():void
         {
            panel.addEventListener(YNzhuadayuPanel.YN_ZHUADAYUPANEL_QINGQIULINGJIANG_CLICK,onHandle);
            panel.addEventListener(YNzhuadayuPanel.YN_ZHUADAYUPANEL_QINGQIUZHUAYU_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNzhuadayuPanel,function():void
         {
            panel.removeEventListener(YNzhuadayuPanel.YN_ZHUADAYUPANEL_QINGQIULINGJIANG_CLICK,onHandle);
            panel.removeEventListener(YNzhuadayuPanel.YN_ZHUADAYUPANEL_QINGQIUZHUAYU_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case YNzhuadayuPanel.YN_ZHUADAYUPANEL_QINGQIUZHUAYU_CLICK:
               this.senderProxy.send_81233();
               break;
            case YNzhuadayuPanel.YN_ZHUADAYUPANEL_QINGQIULINGJIANG_CLICK:
               this.senderProxy.send_81235();
         }
      }
      
      public function setData(param1:int, param2:int, param3:Boolean, param4:Boolean) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
            this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
         this.panel.setData(param1,param2,param3,param4);
      }
   }
}

