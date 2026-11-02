package com.tgame.moudels.tianFu.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.tianFu.model.TianFu_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TianFu_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "TianFu_TargetPanelMediator";
      
      public var lookUserId:int;
      
      private var _senderProxy:TianFu_MsgSenderProxy;
      
      public function TianFu_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : TianFu_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(TianFu_MsgSenderProxy.NAME) as TianFu_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get targetArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TargetAttribute.GETTIANFU,handler);
            targetArrtibutePlane.addEventListener(TargetAttribute.TIANFU_XIANGQIAN_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.GETTIANFU,handler);
            targetArrtibutePlane.removeEventListener(TargetAttribute.TIANFU_XIANGQIAN_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case TargetAttribute.GETTIANFU:
               this.senderProxy.send_58257(GameInstance.lookPlayerID);
               break;
            case TargetAttribute.TIANFU_XIANGQIAN_CLICK:
               if(!ReloginManager.isInKuafu)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TIANFU_XIANGQIAN,GameInstance.lookPlayerID);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"跨服服务器屏蔽此功能");
                  NoticeManager.notify(NoticeManager.FOOT,"跨服服务器屏蔽此功能");
               }
         }
      }
      
      public function setData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:int, param10:Boolean, param11:Boolean) : void
      {
         if(param1 != GameInstance.lookPlayerID)
         {
            return;
         }
         this.targetArrtibutePlane.showTianFu();
         this.targetArrtibutePlane.setTianFuData(false,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         this.targetArrtibutePlane.setTianFuJiHuo(GameState.dictTargetStatus[40730]);
      }
      
      public function setGoods(param1:Array) : void
      {
         this.targetArrtibutePlane.setTianFuGoods(param1);
      }
      
      public function isHuanZhuang(param1:Boolean) : void
      {
         this.targetArrtibutePlane.tianfu_huanzhuang(param1);
      }
   }
}

