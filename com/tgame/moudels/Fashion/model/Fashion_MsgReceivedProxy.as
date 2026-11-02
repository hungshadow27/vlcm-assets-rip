package com.tgame.moudels.Fashion.model
{
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.Fashion.view.Fashion_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Fashion_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Fashion_MsgReceivedProxy";
      
      private var _fashion_Mediator:Fashion_Mediator;
      
      public function Fashion_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73322,73324,73326],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73322,73324,73326],NAME);
      }
      
      public function get fashion_Mediator() : Fashion_Mediator
      {
         if(!this._fashion_Mediator)
         {
            this._fashion_Mediator = facade.retrieveMediator(Fashion_Mediator.NAME) as Fashion_Mediator;
         }
         return this._fashion_Mediator;
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
            ZLog.add("协议号 " + _loc2_ + "不存在");
         }
      }
      
      public function received_73322(param1:ByteArray) : void
      {
         var _loc7_:Goods = null;
         ZLog.add("73322：返回时装面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = new Goods(param1.readInt());
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         this.fashion_Mediator.setInit(_loc2_,_loc3_,_loc5_);
      }
      
      public function received_73324(param1:ByteArray) : void
      {
         ZLog.add("73324：返回试穿时装");
         var _loc2_:String = param1.readUTF();
         this.fashion_Mediator.setValue(_loc2_);
      }
      
      public function received_73326(param1:ByteArray) : void
      {
         ZLog.add("73326：返回保存结果");
         var _loc2_:int = param1.readByte();
      }
   }
}

