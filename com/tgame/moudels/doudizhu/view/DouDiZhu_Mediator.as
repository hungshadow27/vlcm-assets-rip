package com.tgame.moudels.doudizhu.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.doudizhu.DouDiZhu_ApplicationFacade;
   import com.tgame.moudels.doudizhu.model.DouDiZhu_MsgSendProxy;
   import com.tgame.shell.view.components.wuyidoudizhu.DouDiZhuPanel;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class DouDiZhu_Mediator extends Mediator
   {
      
      public static const NAME:String = "DouDiZhu_Mediator";
      
      private var _senderProxy:DouDiZhu_MsgSendProxy;
      
      public function DouDiZhu_Mediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DouDiZhu_ApplicationFacade.GET_DOUDIZHU_PANEL];
      }
      
      private function get senderProxy() : DouDiZhu_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(DouDiZhu_MsgSendProxy.NAME) as DouDiZhu_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case DouDiZhu_ApplicationFacade.GET_DOUDIZHU_PANEL:
               this.senderProxy.send_73461();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : DouDiZhuPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.doudizhuPanel);
         }
         return viewComponent as DouDiZhuPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(DouDiZhuPanel,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.addEventListener(DouDiZhuPanel.UI_GETXUNZHANG,onHandle);
            panel.addEventListener(DouDiZhuPanel.UI_LOOKRANK,onHandle);
            panel.addEventListener(DouDiZhuPanel.UI_GETMEIREN,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(DouDiZhuPanel,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.removeEventListener(DouDiZhuPanel.UI_GETXUNZHANG,onHandle);
            panel.removeEventListener(DouDiZhuPanel.UI_LOOKRANK,onHandle);
            panel.removeEventListener(DouDiZhuPanel.UI_GETMEIREN,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.guanbi();
               break;
            case DouDiZhuPanel.UI_GETXUNZHANG:
               this.senderProxy.send_73465();
               break;
            case DouDiZhuPanel.UI_LOOKRANK:
               if(!Fun.isVisible(GameInstance.uiInstance.doudizhurankPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_DOUDIZHU_RANK_PANEL);
               }
               this.senderProxy.send_73463(param1.data as int);
               break;
            case DouDiZhuPanel.UI_GETMEIREN:
               this.senderProxy.send_73467();
         }
      }
      
      public function update(param1:int, param2:Boolean) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_DOUDIZHU_PANEL);
         if(Fun.isVisible(GameInstance.uiInstance.doudizhuPanel))
         {
            GameInstance.uiInstance.doudizhuPanel.update(param1,param2);
         }
      }
      
      public function updateRank(param1:int, param2:int, param3:Array, param4:Boolean) : void
      {
         if(Fun.isVisible(GameInstance.uiInstance.doudizhurankPanel))
         {
            ResizeManager.showDoublePanel(GameInstance.uiInstance.doudizhuPanel,GameInstance.uiInstance.doudizhurankPanel);
            GameInstance.uiInstance.doudizhurankPanel.updateRank(param1,param2,param3,param4);
         }
      }
      
      private function guanbi() : void
      {
         GameInstance.uiInstance.doudizhurankPanel.guanbi();
      }
   }
}

