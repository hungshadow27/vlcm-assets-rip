package com.tgame.moudels.MonthSignIn.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.MonthSignIn.model.MonthSignIn_MsgSenderProxy;
   import com.tgame.shell.view.components.MonthSignIn;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class MonthSignIn_Mediator extends Mediator
   {
      
      public static const NAME:String = "MonthSignIn_Mediator";
      
      private var lingType:int;
      
      private var _senderProxy:MonthSignIn_MsgSenderProxy;
      
      public function MonthSignIn_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : MonthSignIn_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(MonthSignIn_MsgSenderProxy.NAME) as MonthSignIn_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get monthsigninPanel() : MonthSignIn
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.monthsignin);
         }
         return viewComponent as MonthSignIn;
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
         UIEventsRegisterManager.addUIRegisterEvent(MonthSignIn,function():void
         {
            monthsigninPanel.addEventListener(Event.ADDED_TO_STAGE,handler);
            monthsigninPanel.addEventListener(MonthSignIn.UI_SHOW_MONTHSIGNIN_PANEL,handler);
            monthsigninPanel.addEventListener(MonthSignIn.UI_REQUEST_REWARD_CLICK,handler);
            monthsigninPanel.addEventListener(MonthSignIn.UI_REQUEST_SIGNIN_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MonthSignIn,function():void
         {
            monthsigninPanel.removeEventListener(Event.ADDED_TO_STAGE,handler);
            monthsigninPanel.removeEventListener(MonthSignIn.UI_SHOW_MONTHSIGNIN_PANEL,handler);
            monthsigninPanel.removeEventListener(MonthSignIn.UI_REQUEST_REWARD_CLICK,handler);
            monthsigninPanel.addEventListener(MonthSignIn.UI_REQUEST_SIGNIN_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc4_:Object = null;
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.data;
         }
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               this.senderProxy.send_60421();
               break;
            case MonthSignIn.UI_SHOW_MONTHSIGNIN_PANEL:
               break;
            case MonthSignIn.UI_REQUEST_REWARD_CLICK:
               this.lingType = int(_loc3_.data);
               this.senderProxy.send_60423(_loc3_.data);
               break;
            case MonthSignIn.UI_REQUEST_SIGNIN_CLICK:
               this.senderProxy.send_60425();
         }
      }
      
      public function setGoods(param1:Array, param2:int, param3:int, param4:Boolean, param5:int) : void
      {
         var _loc8_:Goods = null;
         var _loc6_:Array = new Array();
         var _loc7_:int = 0;
         while(_loc7_ < param1.length)
         {
            _loc8_ = new Goods(param1[_loc7_].goid);
            _loc8_.count = int(param1[_loc7_].goNum);
            _loc6_.push(_loc8_);
            _loc7_++;
         }
         if(param2 > 0)
         {
            _loc8_ = new Goods(7372);
            _loc8_.count = param2;
            _loc6_.push(_loc8_);
         }
         this.monthsigninPanel.setItem(_loc6_,param3,param4,param5);
      }
      
      public function setValue(param1:int, param2:int) : void
      {
         this.monthsigninPanel.setValue(param1,param2);
      }
      
      public function setBtnEn(param1:Boolean) : void
      {
         this.monthsigninPanel.setBtnEn(param1);
      }
      
      public function setGetBtnEn(param1:Boolean) : void
      {
         this.monthsigninPanel.setGetBtnEn(this.lingType,param1);
      }
      
      public function initDay(param1:int, param2:Array, param3:int, param4:int) : void
      {
         this.monthsigninPanel.initDay(param1,param2,param3,param4);
      }
      
      public function showPanel() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.monthsignin))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MONTHSIGNIN_PANEL);
         }
      }
   }
}

