package com.tgame.moudels.moxuezhanchang.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.moxuezhanchang.MoXueZhanChang_ApplicationFacade;
   import com.tgame.moudels.moxuezhanchang.model.MoXueZhanChang_MsgSenderProxy;
   import com.tgame.shell.view.components.MoXueZhanChangPanel;
   import com.tgame.shell.view.components.utils.UITools;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class MoXueZhanChang_Mediator extends Mediator
   {
      
      public static const NAME:String = "MoXue_Mediator";
      
      private var _senderProxy:MoXueZhanChang_MsgSenderProxy;
      
      public function MoXueZhanChang_Mediator()
      {
         super(NAME);
      }
      
      public function get senderProxy() : MoXueZhanChang_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(MoXueZhanChang_MsgSenderProxy.NAME) as MoXueZhanChang_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get moxuezhanchangPanel() : MoXueZhanChangPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.moxuezhanchangPanel);
         }
         return viewComponent as MoXueZhanChangPanel;
      }
      
      override public function onRegister() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(MoXueZhanChangPanel,function():void
         {
            moxuezhanchangPanel.addEventListener(Event.ADDED_TO_STAGE,handle);
            moxuezhanchangPanel.addEventListener(MoXueZhanChangPanel.MOXUEZHANCHANG_JINRU_BTN_CLICK,handle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MoXueZhanChangPanel,function():void
         {
            moxuezhanchangPanel.removeEventListener(Event.ADDED_TO_STAGE,handle);
            moxuezhanchangPanel.removeEventListener(MoXueZhanChangPanel.MOXUEZHANCHANG_JINRU_BTN_CLICK,handle);
         });
      }
      
      override public function listNotificationInterests() : Array
      {
         return [MoXueZhanChang_ApplicationFacade.GET_MOXUEZHANCHANG_PANEL,MoXueZhanChang_ApplicationFacade.GET_FULIHUODONG_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case MoXueZhanChang_ApplicationFacade.GET_MOXUEZHANCHANG_PANEL:
               PipeManager.sendMsg(PipeConstants.SHOW_MOXUEZHANCHANG);
               break;
            case MoXueZhanChang_ApplicationFacade.GET_FULIHUODONG_PANEL:
               UITools.showPanel(GameInstance.uiInstance.fuLiHuoDongPanel);
         }
      }
      
      private function handle(param1:*) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Goods = null;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case MoXueZhanChangPanel.MOXUEZHANCHANG_JINRU_BTN_CLICK:
               this.senderProxy.send_71961();
         }
      }
   }
}

