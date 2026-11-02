package com.tgame.moudels.woderongyu.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.woderongyu.WoDeRongYu_ApplicationFacade;
   import com.tgame.moudels.woderongyu.model.WoDeRongYu_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WoDeRongYu_Mediator extends Mediator
   {
      
      public static const NAME:String = "WoDeRongYu_Mediator";
      
      private var _senderProxy:WoDeRongYu_MsgSenderProxy;
      
      public function WoDeRongYu_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : WoDeRongYu_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(WoDeRongYu_MsgSenderProxy.NAME) as WoDeRongYu_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get mainCharArrtibutePlane() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [WoDeRongYu_ApplicationFacade.GOODS_CHANGED];
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
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.WODERONGYU,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WODERONGYU_FANYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WODERONGYU_GUANZHU_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.WODERONGYU,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WODERONGYU_FANYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WODERONGYU_GUANZHU_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:uint = 0;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case CharAttribute.WODERONGYU:
               this.senderProxy.send_71025([-1,1]);
               break;
            case CharAttribute.UI_WODERONGYU_FANYE_CLICK:
               _loc3_ = uint(_loc2_.data);
               if(_loc3_ <= 0)
               {
                  _loc3_ = 51;
               }
               else if(_loc3_ >= 52)
               {
                  _loc3_ = 1;
               }
               this.senderProxy.send_71025([-1,_loc3_]);
               break;
            case CharAttribute.UI_WODERONGYU_GUANZHU_CLICK:
               _loc3_ = uint(_loc2_.data);
               this.senderProxy.send_71027(_loc3_);
         }
      }
      
      public function upDataPanel(param1:Object, param2:Array) : void
      {
         this.mainCharArrtibutePlane.showWoDeRongYu();
         this.mainCharArrtibutePlane.setWoDeRongYuInit(param1,param2);
         this.mainCharArrtibutePlane.setWoDeRongYuEnableFun(true);
      }
      
      public function upDataLongyuandian(param1:int) : void
      {
         this.mainCharArrtibutePlane.setLongyuandian(param1);
      }
   }
}

