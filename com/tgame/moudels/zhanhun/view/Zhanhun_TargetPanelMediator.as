package com.tgame.moudels.zhanhun.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zhanhun.model.Zhanhun_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Zhanhun_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Zhanhun_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:Zhanhun_MsgSenderProxy;
      
      public function Zhanhun_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : Zhanhun_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Zhanhun_MsgSenderProxy.NAME) as Zhanhun_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.GETZHANHUN,requestTargetWuXingZhiRenInfoHandler);
            targetArrtibutePlane.addEventListener(TargetAttribute.UI_ZHUANGBEI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.GETZHANHUN,requestTargetWuXingZhiRenInfoHandler);
            targetArrtibutePlane.removeEventListener(TargetAttribute.UI_ZHUANGBEI_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:int = 0;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case TargetAttribute.UI_ZHUANGBEI_CLICK:
               _loc3_ = _loc2_.data as int;
               this.lookPlayerID = GameInstance.lookPlayerID;
               this.senderProxy.send_55831([this.lookPlayerID,_loc3_]);
         }
      }
      
      private function requestTargetWuXingZhiRenInfoHandler(param1:Event) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_55831([GameInstance.lookPlayerID,1]);
      }
      
      public function setData() : void
      {
         this.targetArrtibutePlane.showZhanhun();
      }
      
      public function setZhanhunBtn(param1:int) : void
      {
         this.targetArrtibutePlane.setZhanhunBtn(param1);
      }
      
      public function setShuxingVis(param1:Boolean) : void
      {
         this.targetArrtibutePlane.setShuxingVis(param1);
      }
      
      public function setZhanhunItem(param1:McBaseItem, param2:int) : void
      {
         this.targetArrtibutePlane.setZhanhunItem(param1,param2);
      }
      
      public function setZhanhunDakong(param1:int) : void
      {
         this.targetArrtibutePlane.setZhanhunDakong(param1);
      }
      
      public function setZhanhunShuxingNum(param1:int, param2:Array) : void
      {
         this.targetArrtibutePlane.setZhanhunShuxingNum(param1,param2);
      }
      
      public function isZhanHunHuanZhuang(param1:Boolean) : void
      {
         this.targetArrtibutePlane.isZhanHunHuanZhuang(param1);
      }
      
      public function setBtnEnbale() : void
      {
         this.targetArrtibutePlane.setBtnEnbale();
      }
   }
}

