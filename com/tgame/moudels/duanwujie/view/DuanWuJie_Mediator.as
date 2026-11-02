package com.tgame.moudels.duanwujie.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.duanwujie.DuanWuJie_ApplicationFacade;
   import com.tgame.moudels.duanwujie.model.DuanWuJie_MsgSendProxy;
   import com.tgame.shell.view.components.duanwujie.DuanWuJiePanel;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class DuanWuJie_Mediator extends Mediator
   {
      
      public static const NAME:String = "DuanWuJie_Mediator";
      
      private var _senderProxy:DuanWuJie_MsgSendProxy;
      
      public function DuanWuJie_Mediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DuanWuJie_ApplicationFacade.GET_DUANWUJIE_PANEL];
      }
      
      private function get senderProxy() : DuanWuJie_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(DuanWuJie_MsgSendProxy.NAME) as DuanWuJie_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case DuanWuJie_ApplicationFacade.GET_DUANWUJIE_PANEL:
               this.senderProxy.send_73701();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : DuanWuJiePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.duanwujiePanel);
         }
         return viewComponent as DuanWuJiePanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(DuanWuJiePanel,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.addEventListener(DuanWuJiePanel.UI_GETXUNZHANG,onHandle);
            panel.addEventListener(DuanWuJiePanel.UI_DUANWUJIE_PAIHANG,onHandle);
            panel.addEventListener(DuanWuJiePanel.UI_DUANWUJIE_JIANGCHI,onHandle);
            panel.addEventListener(DuanWuJiePanel.UI_DUANWUJIE_QIANDAO,onHandle);
            panel.addEventListener(DuanWuJiePanel.UI_DUANWUJIE_DUIHUAN,onHandle);
            panel.addEventListener(DuanWuJiePanel.UI_DUANWUJIE_TIJIAO,onHandle);
            panel.addEventListener(DuanWuJiePanel.UI_DUANWUJIE_GETJIANGLI,onHandle);
            panel.addEventListener(DuanWuJiePanel.UI_DUANWUJIE_GETMUMA,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(DuanWuJiePanel,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.removeEventListener(DuanWuJiePanel.UI_GETXUNZHANG,onHandle);
            panel.removeEventListener(DuanWuJiePanel.UI_DUANWUJIE_PAIHANG,onHandle);
            panel.removeEventListener(DuanWuJiePanel.UI_DUANWUJIE_JIANGCHI,onHandle);
            panel.removeEventListener(DuanWuJiePanel.UI_DUANWUJIE_QIANDAO,onHandle);
            panel.removeEventListener(DuanWuJiePanel.UI_DUANWUJIE_DUIHUAN,onHandle);
            panel.removeEventListener(DuanWuJiePanel.UI_DUANWUJIE_TIJIAO,onHandle);
            panel.removeEventListener(DuanWuJiePanel.UI_DUANWUJIE_GETJIANGLI,onHandle);
            panel.removeEventListener(DuanWuJiePanel.UI_DUANWUJIE_GETMUMA,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.guanbi();
               break;
            case DuanWuJiePanel.UI_GETXUNZHANG:
               this.senderProxy.send_73709();
               break;
            case DuanWuJiePanel.UI_DUANWUJIE_QIANDAO:
               this.senderProxy.send_73707(param1.data as int);
               break;
            case DuanWuJiePanel.UI_DUANWUJIE_PAIHANG:
               this.senderProxy.send_73705(param1.data as int);
               break;
            case DuanWuJiePanel.UI_DUANWUJIE_JIANGCHI:
               this.senderProxy.send_73703(param1.data as int);
               break;
            case DuanWuJiePanel.UI_DUANWUJIE_DUIHUAN:
               this.senderProxy.send_73711(param1.data as int);
               break;
            case DuanWuJiePanel.UI_DUANWUJIE_TIJIAO:
               this.senderProxy.send_73713(param1.data as int);
               break;
            case DuanWuJiePanel.UI_DUANWUJIE_GETJIANGLI:
               this.senderProxy.send_73715(param1.data as int);
               break;
            case DuanWuJiePanel.UI_DUANWUJIE_GETMUMA:
               this.senderProxy.send_73717(param1.data as int);
         }
      }
      
      public function update(param1:Array, param2:int, param3:Boolean, param4:Boolean, param5:int, param6:int, param7:int) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_DUANWUJIE_PANEL);
         if(Fun.isVisible(GameInstance.uiInstance.duanwujiePanel))
         {
            GameInstance.uiInstance.duanwujiePanel.update(param1,param2,param3,param4,param5,param6,param7);
         }
      }
      
      public function jiangchi(param1:int, param2:Array, param3:Boolean) : void
      {
         this.panel.setJiangchi(param1,param2,param3);
      }
      
      public function updateRank(param1:int, param2:int, param3:Array, param4:Boolean, param5:int) : void
      {
         this.panel.setPaihang(param1,param2,param3,param4,param5);
      }
      
      private function guanbi() : void
      {
      }
   }
}

