package com.tgame.moudels.yitianjian.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.yitianjian.YNyitianjian_ApplicationFacade;
   import com.tgame.moudels.yitianjian.model.YNyitianjian_MsgSendProxy;
   import com.tgame.shell.view.components.utils.UITools;
   import com.tgame.shell.view.components.ynSpecial.YNyitianjianPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNyitianjian_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNyitianjian_Mediator";
      
      private var _senderProxy:YNyitianjian_MsgSendProxy;
      
      public function YNyitianjian_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [YNyitianjian_ApplicationFacade.SHOW_YNYITIANJIAN];
      }
      
      private function get senderProxy() : YNyitianjian_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YNyitianjian_MsgSendProxy.NAME) as YNyitianjian_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case YNyitianjian_ApplicationFacade.SHOW_YNYITIANJIAN:
               this.senderProxy.send_82291(_loc2_);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YNyitianjianPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ynYitianjianPanel);
         }
         return viewComponent as YNyitianjianPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YNyitianjianPanel,function():void
         {
            panel.addEventListener(YNyitianjianPanel.YTJ_JIHUO,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNyitianjianPanel,function():void
         {
            panel.removeEventListener(YNyitianjianPanel.YTJ_JIHUO,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case YNyitianjianPanel.YTJ_JIHUO:
               this.senderProxy.send_82293(param1.data);
         }
      }
      
      public function setData(param1:Array, param2:int) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            UITools.showPanel(this.panel);
         }
         this.panel.upData(param1,param2);
      }
   }
}

