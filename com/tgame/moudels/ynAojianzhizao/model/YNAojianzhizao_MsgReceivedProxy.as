package com.tgame.moudels.ynAojianzhizao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ynAojianzhizao.view.YNAojianzhizao_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNAojianzhizao_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YNAojianzhizao_MsgReceivedProxy";
      
      private var _mediator:YNAojianzhizao_Mediator;
      
      public function YNAojianzhizao_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74052],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74052],NAME);
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
      
      private function get mediator() : YNAojianzhizao_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YNAojianzhizao_Mediator.NAME) as YNAojianzhizao_Mediator;
         }
         return this._mediator;
      }
      
      public function received_74052(param1:ByteArray) : void
      {
         ZLog.add("74052：返回傲剑制造面板");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         this.mediator.showAojianzhizao2(_loc2_,_loc3_,_loc4_,_loc5_);
      }
   }
}

