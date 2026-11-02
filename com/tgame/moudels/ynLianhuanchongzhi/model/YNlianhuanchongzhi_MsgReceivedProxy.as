package com.tgame.moudels.ynLianhuanchongzhi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ynLianhuanchongzhi.view.YNlianhuanchongzhi_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNlianhuanchongzhi_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YNlianhuanchongzhi_MsgReceivedProxy";
      
      private var _mediator:YNlianhuanchongzhi_Mediator;
      
      public function YNlianhuanchongzhi_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([79652],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([79652],NAME);
      }
      
      private function get mediator() : YNlianhuanchongzhi_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YNlianhuanchongzhi_Mediator.NAME) as YNlianhuanchongzhi_Mediator;
         }
         return this._mediator;
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
      
      public function received_79652(param1:ByteArray) : void
      {
         var _loc7_:int = 0;
         var _loc12_:Object = null;
         ZLog.add("79652：返回连环充值面板");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readByte();
         var _loc6_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc12_ = new Object();
            _loc12_.day = param1.readByte();
            _loc12_.id = param1.readInt();
            _loc12_.state = param1.readByte();
            _loc6_.push(_loc12_);
            _loc7_++;
         }
         var _loc8_:int = param1.readByte();
         var _loc9_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < _loc8_)
         {
            _loc12_ = new Object();
            _loc12_.id = param1.readInt();
            _loc12_.num = param1.readInt();
            _loc9_.push(_loc12_);
            _loc7_++;
         }
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readByte();
         this.mediator.setData(_loc2_,_loc3_,_loc4_,_loc6_,_loc9_,_loc10_,_loc11_);
      }
   }
}

