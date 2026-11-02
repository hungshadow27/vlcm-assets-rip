package com.tgame.moudels.yurenjie.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.yurenjie.YuRenJie_ApplicationFacade;
   import com.tgame.moudels.yurenjie.model.YuRenJie_MsgSenderProxy;
   import com.tgame.shell.view.components.yurenjie.YuRenJiePanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YuRenJie_Mediator extends Mediator
   {
      
      public static const NAME:String = "YuRenJie_Mediator";
      
      private var _senderProxy:YuRenJie_MsgSenderProxy;
      
      public function YuRenJie_Mediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [YuRenJie_ApplicationFacade.GET_YURENJIE_PANEL];
      }
      
      private function get senderProxy() : YuRenJie_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YuRenJie_MsgSenderProxy.NAME) as YuRenJie_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case YuRenJie_ApplicationFacade.GET_YURENJIE_PANEL:
               this.senderProxy.send_73131();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YuRenJiePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.yurenjiePanel);
         }
         return viewComponent as YuRenJiePanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YuRenJiePanel,function():void
         {
            panel.addEventListener(YuRenJiePanel.UI_GETXUNZHANG,onHandle);
            panel.addEventListener(YuRenJiePanel.UI_LOOKRANK,onHandle);
            panel.addEventListener(YuRenJiePanel.UI_GETZHANPAO,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YuRenJiePanel,function():void
         {
            panel.removeEventListener(YuRenJiePanel.UI_GETXUNZHANG,onHandle);
            panel.removeEventListener(YuRenJiePanel.UI_GETXUNZHANG,onHandle);
            panel.removeEventListener(YuRenJiePanel.UI_GETZHANPAO,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case YuRenJiePanel.UI_GETXUNZHANG:
               this.senderProxy.send_73139();
               break;
            case YuRenJiePanel.UI_LOOKRANK:
               this.senderProxy.send_73133(param1.data as int);
               break;
            case YuRenJiePanel.UI_GETZHANPAO:
               this.senderProxy.send_73137();
         }
      }
      
      public function update(param1:int, param2:Boolean) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_YURENJIE_PANEL);
         GameInstance.uiInstance.yurenjiePanel.update(param1,param2);
      }
      
      public function updateRank(param1:int, param2:int, param3:Array, param4:Boolean) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.yurenjierankPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_YURENJIE_RANK_PANEL);
         }
         ResizeManager.showDoublePanel(GameInstance.uiInstance.yurenjiePanel,GameInstance.uiInstance.yurenjierankPanel);
         GameInstance.uiInstance.yurenjierankPanel.updateRank(param1,param2,param3,param4);
      }
   }
}

