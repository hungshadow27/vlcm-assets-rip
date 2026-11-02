package com.tgame.moudels.xunzhangyangcheng.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xunzhangyangcheng.model.XunZhangYangCheng_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XunZhangYangCheng_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "XunZhangYangCheng_TargetMediator";
      
      private var _msgSenderProxy:XunZhangYangCheng_MsgSenderProxy;
      
      public function XunZhangYangCheng_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get targetArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:int = _loc2_ as int;
         var _loc4_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      private function get msgSenderProxy() : XunZhangYangCheng_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(XunZhangYangCheng_MsgSenderProxy.NAME) as XunZhangYangCheng_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TargetAttribute.XUNZHANGYANGCHENG,xunZhangHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.XUNZHANGYANGCHENG,xunZhangHandle);
         });
      }
      
      private function xunZhangHandle(param1:Event = null) : void
      {
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         switch(_loc2_)
         {
            case CharAttribute.XUNZHANGYANGCHENG:
               this.msgSenderProxy.send_61461(GameInstance.lookPlayerID);
         }
      }
      
      public function setXunZhang(param1:Array) : void
      {
         this.targetArrtibutePlane.showXunZhangYangCheng();
         this.targetArrtibutePlane.setXunZhang(param1);
         this.targetArrtibutePlane.setBtn();
      }
   }
}

