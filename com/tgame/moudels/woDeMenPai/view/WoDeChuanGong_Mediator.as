package com.tgame.moudels.woDeMenPai.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.woDeMenPai.model.WoDeMenPai_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WoDeChuanGong_Mediator extends Mediator
   {
      
      public static const NAME:String = "WoDeChuanGong_Mediator";
      
      private var avatar_zizeng:int = 0;
      
      private var _senderProxy:WoDeMenPai_MsgSenderProxy;
      
      public function WoDeChuanGong_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : WoDeMenPai_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(WoDeMenPai_MsgSenderProxy.NAME) as WoDeMenPai_MsgSenderProxy;
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
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.WODECHUANGONG,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUDECHUANGONG_START_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.WODECHUANGONG,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUDECHUANGONG_START_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case CharAttribute.WODECHUANGONG:
               this.senderProxy.send_72151(-1);
               break;
            case CharAttribute.UI_WUDECHUANGONG_START_CLICK:
               this.senderProxy.send_72153(_loc2_.data as int);
         }
      }
      
      public function setData(param1:int, param2:Array, param3:Array, param4:Array) : void
      {
         this.mainCharArrtibutePlane.showChuanGong();
         var _loc5_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param1,true);
         this.mainCharArrtibutePlane.setChuanGongInit(_loc5_,param2,param3,param4);
      }
      
      public function setResult(param1:int, param2:int, param3:int) : void
      {
         this.mainCharArrtibutePlane.setChuanGongResult(param1,param2,param3);
      }
   }
}

