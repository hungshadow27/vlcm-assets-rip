package com.tgame.moudels.xunzhangyangcheng.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xunzhangyangcheng.model.XunZhangYangCheng_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XunZhangYangCheng_Mediator extends Mediator
   {
      
      public static const NAME:String = "XunZhangYangCheng_Mediator";
      
      private var _msgSenderProxy:XunZhangYangCheng_MsgSenderProxy;
      
      public function XunZhangYangCheng_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get mainCharArrtibutePlane() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
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
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(CharAttribute.XUNZHANGYANGCHENG,xunZhangHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XUNZHANGYANGCHENG_LINGQU_CLICK,xunZhangHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XUNZHANGYANGCHENG_YANGCHENG_CLICK,xunZhangHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.XUNZHANGYANGCHENG,xunZhangHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XUNZHANGYANGCHENG_LINGQU_CLICK,xunZhangHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XUNZHANGYANGCHENG_YANGCHENG_CLICK,xunZhangHandle);
         });
      }
      
      private function xunZhangHandle(param1:Event = null) : void
      {
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         switch(_loc2_)
         {
            case CharAttribute.XUNZHANGYANGCHENG:
               this.msgSenderProxy.send_61461(-1);
               break;
            case CharAttribute.UI_XUNZHANGYANGCHENG_LINGQU_CLICK:
               this.msgSenderProxy.send_61463();
               break;
            case CharAttribute.UI_XUNZHANGYANGCHENG_YANGCHENG_CLICK:
               this.msgSenderProxy.send_61465();
         }
      }
      
      public function setXunZhang(param1:Array) : void
      {
         this.mainCharArrtibutePlane.showXunZhangYangCheng();
         this.mainCharArrtibutePlane.setXunZhang(param1);
      }
      
      public function setShowItem(param1:Array) : void
      {
         this.mainCharArrtibutePlane.setShowItem(param1);
      }
   }
}

