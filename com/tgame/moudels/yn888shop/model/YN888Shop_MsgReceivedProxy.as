package com.tgame.moudels.yn888shop.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.yn888shop.view.YN888Shop_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YN888Shop_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YN888Shop_MsgReceivedProxy";
      
      private var _mediator:YN888Shop_Mediator;
      
      public function YN888Shop_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73852],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73852],NAME);
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
      
      private function get mediator() : YN888Shop_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YN888Shop_Mediator.NAME) as YN888Shop_Mediator;
         }
         return this._mediator;
      }
      
      public function received_73852(param1:ByteArray) : void
      {
         var _loc6_:Array = null;
         var _loc7_:Object = null;
         var _loc8_:int = 0;
         var _loc9_:Object = null;
         ZLog.add("73852：返回世界杯排行榜信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = [];
            _loc7_ = new Object();
            _loc7_.lv = param1.readInt();
            _loc7_.num = param1.readByte();
            _loc8_ = 0;
            while(_loc8_ < _loc7_.num)
            {
               _loc9_ = new Object();
               _loc9_.id = param1.readInt();
               _loc9_.name = param1.readUTF();
               _loc9_.gid = param1.readInt();
               _loc9_.count = param1.readInt();
               _loc9_.price = param1.readInt();
               _loc9_.ty = param1.readByte();
               _loc6_.push(_loc9_);
               _loc8_++;
            }
            _loc7_.obj = _loc6_;
            _loc4_.push(_loc7_);
            _loc5_++;
         }
         this.mediator.setData(_loc2_,_loc4_);
      }
   }
}

