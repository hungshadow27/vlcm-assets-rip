package com.tgame.moudels.tuTengCard.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.tuTengCard.view.TuTengCade_TianJiSuo_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TuTengCade_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "TuTengCade_MsgReceivedProxy";
      
      private var _mediator:TuTengCade_TianJiSuo_Mediator;
      
      public function TuTengCade_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53024,53026],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53024,53026],NAME);
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
         }
         else
         {
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_53024(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Boolean = param1.readByte() == 0 ? false : true;
         if(_loc2_)
         {
            _loc3_ = param1.readShort();
         }
         this.mediator.isAddShuXing(_loc2_,_loc3_);
      }
      
      public function received_53026(param1:ByteArray) : void
      {
         var _loc2_:Boolean = param1.readByte() == 0 ? false : true;
         this.mediator.repShuXing(_loc2_);
      }
      
      private function get mediator() : TuTengCade_TianJiSuo_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(TuTengCade_TianJiSuo_Mediator.NAME) as TuTengCade_TianJiSuo_Mediator;
         }
         return this._mediator;
      }
   }
}

