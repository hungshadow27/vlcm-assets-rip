package com.tgame.moudels.dantiaowang.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.moudels.dantiaowang.DanTiaoWang_ApplicationFacade;
   import com.tgame.moudels.dantiaowang.model.DanTiaoWang_MsgSenderProxy;
   import com.tgame.shell.view.components.dantiaowang.DanTiaoWangShuomingPanel;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class DanTiaoWang_Mediator extends Mediator
   {
      
      public static const NAME:String = "DanTiaoWang_Mediator";
      
      private var _senderProxy:DanTiaoWang_MsgSenderProxy;
      
      public function DanTiaoWang_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : DanTiaoWang_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(DanTiaoWang_MsgSenderProxy.NAME) as DanTiaoWang_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get mainCharArrtibutePlane() : DanTiaoWangShuomingPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.danTiaoWang);
         }
         return viewComponent as DanTiaoWangShuomingPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DanTiaoWang_ApplicationFacade.DAN_TIAO_WANG];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case DanTiaoWang_ApplicationFacade.DAN_TIAO_WANG:
               this.showDanTiaoWangShuoMingPanel();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
      }
      
      private function mainCharArrtibutePlaneHandle(param1:Event) : void
      {
         var _loc2_:String = param1.type;
      }
      
      public function showDanTiaoWangShuoMingPanel() : void
      {
         GameInstance.uiInstance.mainUI.showDanTiaoWangShuomingPanel();
      }
      
      public function setDanTiaoWangList(param1:XML, param2:int, param3:int, param4:int) : void
      {
         GameInstance.uiInstance.mainUI.setDanTiaoWangInitialize(param1,param2,param3,param4);
         GameInstance.uiInstance.mainUI.setTrackVisible(false);
         GameInstance.uiInstance.mainUI.setImageLeadContainerVisible(false);
      }
      
      public function deleteDanTiaoWangList() : void
      {
         GameInstance.uiInstance.mainUI.removeDanTiaoWang();
         GameInstance.uiInstance.mainUI.setTrackVisible(true);
         GameInstance.uiInstance.mainUI.setImageLeadContainerVisible(true);
      }
   }
}

