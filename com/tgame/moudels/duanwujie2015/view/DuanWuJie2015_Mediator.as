package com.tgame.moudels.duanwujie2015.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.duanwujie2015.DuanWuJie2015_ApplicationFacade;
   import com.tgame.moudels.duanwujie2015.model.DuanWuJie2015_MsgSendProxy;
   import com.tgame.shell.view.components.duanwujie2015.DuanWuJie2015Panel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class DuanWuJie2015_Mediator extends Mediator
   {
      
      public static const NAME:String = "DuanWuJie2015_Mediator";
      
      private var _senderProxy:DuanWuJie2015_MsgSendProxy;
      
      public function DuanWuJie2015_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : DuanWuJie2015_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(DuanWuJie2015_MsgSendProxy.NAME) as DuanWuJie2015_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DuanWuJie2015_ApplicationFacade.GET_DUANWUJIE2015_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case DuanWuJie2015_ApplicationFacade.GET_DUANWUJIE2015_PANEL:
               this.senderProxy.send_79461();
               this.senderProxy.send_79465(1);
         }
      }
      
      public function get panel() : DuanWuJie2015Panel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.duanwujie2015Panel);
         }
         return viewComponent as DuanWuJie2015Panel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(DuanWuJie2015Panel,function():void
         {
            panel.addEventListener(DuanWuJie2015Panel.UI_DUANWUJIE2015_PAIHANG,onHandle);
            panel.addEventListener(DuanWuJie2015Panel.UI_DUANWUJIE2015_GETJIANGLI,onHandle);
            panel.addEventListener(DuanWuJie2015Panel.UI_DUANWUJIE2015_GETPAIHANGJIANGLI,onHandle);
            panel.addEventListener(DuanWuJie2015Panel.UI_DUANWUJIE2015_GETTIJIAO,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(DuanWuJie2015Panel,function():void
         {
            panel.removeEventListener(DuanWuJie2015Panel.UI_DUANWUJIE2015_PAIHANG,onHandle);
            panel.removeEventListener(DuanWuJie2015Panel.UI_DUANWUJIE2015_GETJIANGLI,onHandle);
            panel.removeEventListener(DuanWuJie2015Panel.UI_DUANWUJIE2015_GETPAIHANGJIANGLI,onHandle);
            panel.removeEventListener(DuanWuJie2015Panel.UI_DUANWUJIE2015_GETTIJIAO,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case DuanWuJie2015Panel.UI_DUANWUJIE2015_PAIHANG:
               this.senderProxy.send_79465(param1.data as int);
               break;
            case DuanWuJie2015Panel.UI_DUANWUJIE2015_GETJIANGLI:
               this.senderProxy.send_79463();
               break;
            case DuanWuJie2015Panel.UI_DUANWUJIE2015_GETPAIHANGJIANGLI:
               this.senderProxy.send_79467();
               break;
            case DuanWuJie2015Panel.UI_DUANWUJIE2015_GETTIJIAO:
               this.senderProxy.send_79469(param1.data as int);
         }
      }
      
      public function update(param1:int, param2:Array, param3:Boolean, param4:Array, param5:int, param6:int) : void
      {
         if(Fun.isVisible(GameInstance.uiInstance.duanwujie2015Panel))
         {
            GameInstance.uiInstance.duanwujie2015Panel.update(param1,param2,param3,param4,param5,param6);
         }
      }
      
      public function updateRank(param1:int, param2:int, param3:Array, param4:Boolean, param5:int) : void
      {
         this.panel.setPaihang(param1,param2,param3,param4,param5);
      }
   }
}

