package com.tgame.moudels.yitianjian.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.yitianjian.view.YNyitianjian_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNyitianjian_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YNyitianjian_MsgReceivedProxy";
      
      private var _mediator:YNyitianjian_Mediator;
      
      public function YNyitianjian_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([82292],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([82292],NAME);
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
      
      public function received_82292(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("82292：返回倚天剑面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc6_ = new Object();
            _loc6_.itemId = param1.readInt();
            _loc6_.isJihuo = param1.readInt();
            _loc6_.isPeidai = param1.readInt();
            _loc3_.push(_loc6_);
            _loc4_++;
         }
         var _loc5_:int = param1.readInt();
         this.mediator.setData(_loc3_,_loc5_);
      }
      
      private function get mediator() : YNyitianjian_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YNyitianjian_Mediator.NAME) as YNyitianjian_Mediator;
         }
         return this._mediator;
      }
   }
}

