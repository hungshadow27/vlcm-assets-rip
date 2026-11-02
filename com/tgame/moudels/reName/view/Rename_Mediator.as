package com.tgame.moudels.reName.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.reName.Rename_ApplicationFacade;
   import com.tgame.moudels.reName.model.Rename_MsgSendProxy;
   import com.tgame.shell.view.components.YNRenamePanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Rename_Mediator extends Mediator
   {
      
      public static const NAME:String = "Rename_Mediator";
      
      private var _senderProxy:Rename_MsgSendProxy;
      
      public function Rename_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Rename_ApplicationFacade.SHOW_RENAME_PANEL];
      }
      
      private function get senderProxy() : Rename_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Rename_MsgSendProxy.NAME) as Rename_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Rename_ApplicationFacade.SHOW_RENAME_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.renamePanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_RENAME_PANEL);
               }
               this.panel.setData(GameInstance.mainChar.name);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YNRenamePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.renamePanel);
         }
         return viewComponent as YNRenamePanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YNRenamePanel,function():void
         {
            panel.addEventListener(YNRenamePanel.UI_RENAMEPANEL_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNRenamePanel,function():void
         {
            panel.removeEventListener(YNRenamePanel.UI_RENAMEPANEL_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case YNRenamePanel.UI_RENAMEPANEL_CLICK:
               PipeManager.sendMsg(PipeConstants.SEND_RENAME,param1.data);
         }
      }
   }
}

