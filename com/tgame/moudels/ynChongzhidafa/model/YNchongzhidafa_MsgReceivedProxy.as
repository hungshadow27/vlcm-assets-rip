package com.tgame.moudels.ynChongzhidafa.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ynChongzhidafa.view.YNchongzhidafa_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNchongzhidafa_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YNchongzhidafa_MsgReceivedProxy";
      
      private var _mediator:YNchongzhidafa_Mediator;
      
      public function YNchongzhidafa_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([80934],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([80934],NAME);
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
      
      private function get mediator() : YNchongzhidafa_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YNchongzhidafa_Mediator.NAME) as YNchongzhidafa_Mediator;
         }
         return this._mediator;
      }
      
      public function received_80934(param1:ByteArray) : void
      {
         ZLog.add("80934: 返回越南 充值大发面板信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_.push(param1.readByte());
            _loc4_++;
         }
         this.mediator.setBtnEn(_loc3_);
      }
   }
}

