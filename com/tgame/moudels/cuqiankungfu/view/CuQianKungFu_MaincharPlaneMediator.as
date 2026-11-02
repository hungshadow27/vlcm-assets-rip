package com.tgame.moudels.cuqiankungfu.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.cuqiankungfu.model.CuQianKungFu_MsgSenderProxy;
   import com.tgame.moudels.cuqiankungfu.model.info.CuQianKungFuVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class CuQianKungFu_MaincharPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "CuQianKungFu_MaincharPlaneMediator";
      
      private var vo:CuQianKungFuVO;
      
      private var typeZF:int;
      
      private var curZF:int;
      
      private const MAX_ZHAOSHI_COUNT:int = 49;
      
      private var _senderProxy:CuQianKungFu_MsgSenderProxy;
      
      public function CuQianKungFu_MaincharPlaneMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : CuQianKungFu_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(CuQianKungFu_MsgSenderProxy.NAME) as CuQianKungFu_MsgSenderProxy;
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETCUQIANKUNGFU,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CUQIANKUNGFU_CHALLENGE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CUQIANKUNGFU_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CUQIANKUNGFU_XIAYIYE_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETCUQIANKUNGFU,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CUQIANKUNGFU_CHALLENGE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CUQIANKUNGFU_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CUQIANKUNGFU_XIAYIYE_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:int = 0;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case CharAttribute.GETCUQIANKUNGFU:
               this.senderProxy.send_73451([-1,0]);
               break;
            case CharAttribute.UI_CUQIANKUNGFU_SHANGYIYE_CLICK:
               this.senderProxy.send_73451([-1,this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1]);
               break;
            case CharAttribute.UI_CUQIANKUNGFU_XIAYIYE_CLICK:
               this.senderProxy.send_73451([-1,this.vo.nowLookingID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowLookingID + 1]);
               break;
            case CharAttribute.UI_CUQIANKUNGFU_CHALLENGE_CLICK:
               _loc3_ = _loc2_.data as int;
               this.senderProxy.send_73453(_loc3_);
         }
      }
      
      public function upDataPanel(param1:CuQianKungFuVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showCuqiankungfu();
         this.mainCharArrtibutePlane.setCuqiankungfuInit(this.vo);
         this.mainCharArrtibutePlane.setCuQianKungFuJinduNum(this.vo.nowChallenge,this.vo.maxChallenge,0,this.vo.isFire);
      }
      
      public function upDateCuqiankungfuLVComplete(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.mainCharArrtibutePlane.showFeedBackPanel(param1,param2,param3,param4,param5,param6);
         if(param1 == 1)
         {
            this.senderProxy.send_73451([-1,0]);
         }
      }
   }
}

