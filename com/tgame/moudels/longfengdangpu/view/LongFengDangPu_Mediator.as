package com.tgame.moudels.longfengdangpu.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.longfengdangpu.LongFengDangPu_ApplicationFacade;
   import com.tgame.moudels.longfengdangpu.model.LongFengDangPu_MsgSendProxy;
   import com.tgame.shell.view.components.longfengdangpu.LongFengDangPuPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class LongFengDangPu_Mediator extends Mediator
   {
      
      public static const NAME:String = "LongFengDangPu_Mediator";
      
      private var _senderProxy:LongFengDangPu_MsgSendProxy;
      
      public function LongFengDangPu_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : LongFengDangPu_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(LongFengDangPu_MsgSendProxy.NAME) as LongFengDangPu_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [LongFengDangPu_ApplicationFacade.GET_LONGFENGDANGPU_PANEL,LongFengDangPu_ApplicationFacade.LONGFENGDANGPU_BUY];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case LongFengDangPu_ApplicationFacade.GET_LONGFENGDANGPU_PANEL:
               this.senderProxy.send_79421();
               this.senderProxy.send_79423(9);
               this.panel.setBtn(0);
               break;
            case LongFengDangPu_ApplicationFacade.LONGFENGDANGPU_BUY:
               this.senderProxy.send_79427(_loc2_);
         }
      }
      
      public function get panel() : LongFengDangPuPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.longfengdangpuiPanel);
         }
         return viewComponent as LongFengDangPuPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(LongFengDangPuPanel,function():void
         {
            panel.addEventListener(LongFengDangPuPanel.UI_LONGFENGDANGPU_GETDANGPU,onHandle);
            panel.addEventListener(LongFengDangPuPanel.UI_LONGFENGDANGPU_GETSOUSUO,onHandle);
            panel.addEventListener(LongFengDangPuPanel.UI_LONGFENGDANGPU_GOUMAI,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(LongFengDangPuPanel,function():void
         {
            panel.removeEventListener(LongFengDangPuPanel.UI_LONGFENGDANGPU_GETDANGPU,onHandle);
            panel.removeEventListener(LongFengDangPuPanel.UI_LONGFENGDANGPU_GETSOUSUO,onHandle);
            panel.removeEventListener(LongFengDangPuPanel.UI_LONGFENGDANGPU_GOUMAI,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:Array = null;
         switch(param1.type)
         {
            case LongFengDangPuPanel.UI_LONGFENGDANGPU_GETDANGPU:
               this.senderProxy.send_79423(param1.data as int);
               break;
            case LongFengDangPuPanel.UI_LONGFENGDANGPU_GETSOUSUO:
               this.senderProxy.send_79425(param1.data as String);
               break;
            case LongFengDangPuPanel.UI_LONGFENGDANGPU_GOUMAI:
               _loc2_ = param1.data as Array;
               PipeManager.sendMsg(PipeConstants.SHOW_GOODS_BUY,_loc2_);
         }
      }
      
      public function update(param1:Number, param2:Number) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.longfengdangpuiPanel))
         {
            PipeManager.sendMsg(PipeConstants.GET_LONGFENGDANGPU_PANEL);
         }
         GameInstance.uiInstance.longfengdangpuiPanel.upDataJintiao(param1,param2);
      }
      
      public function updateItem(param1:Array) : void
      {
         this.panel.initItem(param1);
      }
      
      public function updateiSousuo(param1:Array) : void
      {
         this.panel.initSouSuo(param1);
      }
   }
}

