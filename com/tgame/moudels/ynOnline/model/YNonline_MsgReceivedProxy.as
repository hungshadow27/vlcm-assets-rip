package com.tgame.moudels.ynOnline.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ynOnline.view.YNonline_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNonline_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YNonline_MsgReceivedProxy";
      
      private var _mediator:YNonline_Mediator;
      
      public function YNonline_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74272],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74272],NAME);
      }
      
      private function get mediator() : YNonline_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YNonline_Mediator.NAME) as YNonline_Mediator;
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
      
      public function received_74272(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         ZLog.add("74272：返回在线奖励面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc8_ = new Object();
            _loc8_.id = param1.readByte();
            _loc8_.desc = param1.readUTF();
            _loc8_.gid = param1.readInt();
            _loc8_.gnum = param1.readInt();
            _loc8_.state = param1.readByte();
            _loc4_.push(_loc8_);
            _loc5_++;
         }
         var _loc6_:String = param1.readUTF();
         var _loc7_:String = param1.readUTF();
         this.mediator.setData(_loc6_,_loc2_,_loc4_,_loc7_);
      }
   }
}

