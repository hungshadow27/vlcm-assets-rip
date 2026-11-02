package com.tgame.moudels.ynJubaopen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ynJubaopen.view.YNjubaopen_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNjubaopen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YNjubaopen_MsgReceivedProxy";
      
      private var _mediator:YNjubaopen_Mediator;
      
      public function YNjubaopen_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73602],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73602],NAME);
      }
      
      private function get mediator() : YNjubaopen_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YNjubaopen_Mediator.NAME) as YNjubaopen_Mediator;
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
      
      public function received_73602(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         ZLog.add("73602：返回显示聚宝盆面板");
         var _loc2_:int = param1.readByte();
         var _loc3_:String = param1.readUTF();
         var _loc4_:String = param1.readUTF();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:Array = [];
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            _loc9_ = new Object();
            _loc9_.desc = param1.readUTF();
            _loc9_.state = param1.readInt();
            _loc7_.push(_loc9_);
            _loc8_++;
         }
         this.mediator.setPanelData(_loc2_,_loc3_,_loc4_,_loc5_,_loc7_);
      }
   }
}

