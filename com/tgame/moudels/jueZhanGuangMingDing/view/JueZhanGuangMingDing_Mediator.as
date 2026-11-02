package com.tgame.moudels.jueZhanGuangMingDing.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.jueZhanGuangMingDing.model.JueZhanGuangMingDing_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class JueZhanGuangMingDing_Mediator extends Mediator
   {
      
      public static const NAME:String = "JueZhanGuangMingDing_Mediator";
      
      private var _senderProxy:JueZhanGuangMingDing_MsgSenderProxy;
      
      public function JueZhanGuangMingDing_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : JueZhanGuangMingDing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(JueZhanGuangMingDing_MsgSenderProxy.NAME) as JueZhanGuangMingDing_MsgSenderProxy;
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.JUEZHANGUANGMINGDING,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.JUEZHANGUANGMINGDING,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case CharAttribute.JUEZHANGUANGMINGDING:
               this.senderProxy.send_70701(-1);
         }
      }
      
      public function upDataPanel(param1:Object) : void
      {
         this.mainCharArrtibutePlane.showJueZhanGuangMingDing();
         this.mainCharArrtibutePlane.setJueZhanGuangMingDingInit(param1);
         var _loc2_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_JUEZHANGUANGMINGDING1] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_JUEZHANGUANGMINGDING1]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_JUEZHANGUANGMINGDING2] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_JUEZHANGUANGMINGDING2]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_JUEZHANGUANGMINGDING3] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_JUEZHANGUANGMINGDING3]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_JUEZHANGUANGMINGDING4] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_JUEZHANGUANGMINGDING4]);
         }
         this.mainCharArrtibutePlane.set_JueZhanGuangMingDing(_loc2_);
      }
   }
}

