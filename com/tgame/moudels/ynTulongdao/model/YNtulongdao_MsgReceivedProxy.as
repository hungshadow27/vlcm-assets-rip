package com.tgame.moudels.ynTulongdao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ynTulongdao.view.YNtulongdao_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNtulongdao_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YNtulongdao_MsgReceivedProxy";
      
      private var _mediator:YNtulongdao_Mediator;
      
      public function YNtulongdao_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([81122],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([81122],NAME);
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
      
      private function get mediator() : YNtulongdao_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YNtulongdao_Mediator.NAME) as YNtulongdao_Mediator;
         }
         return this._mediator;
      }
      
      public function received_81122(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("81122：返回屠龙刀面板信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc6_ = new Object();
            _loc6_.index = param1.readByte();
            _loc6_.gid = param1.readInt();
            _loc6_.state = param1.readByte();
            _loc6_.have = param1.readByte();
            _loc3_.push(_loc6_);
            _loc4_++;
         }
         var _loc5_:int = param1.readByte();
         this.mediator.setData(_loc3_,_loc5_);
      }
   }
}

