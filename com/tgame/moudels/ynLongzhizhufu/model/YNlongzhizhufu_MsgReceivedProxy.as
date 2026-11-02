package com.tgame.moudels.ynLongzhizhufu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ynLongzhizhufu.view.YNlongzhizhufu_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNlongzhizhufu_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YNlongzhizhufu_MsgReceivedProxy";
      
      private var _mediator:YNlongzhizhufu_Mediator;
      
      public function YNlongzhizhufu_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74882],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74882],NAME);
      }
      
      private function get mediator() : YNlongzhizhufu_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YNlongzhizhufu_Mediator.NAME) as YNlongzhizhufu_Mediator;
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
      
      public function received_74882(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc9_:Object = null;
         ZLog.add("74882：返回龙之祝福面板信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc9_ = new Object();
            _loc9_.id = param1.readInt();
            _loc9_.price = param1.readInt();
            _loc3_.push(_loc9_);
            _loc4_++;
         }
         var _loc5_:int = param1.readByte();
         var _loc6_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc9_ = new Object();
            _loc9_.name = param1.readInt();
            _loc9_.id = param1.readInt();
            _loc9_.state = param1.readByte();
            _loc6_.push(_loc9_);
            _loc4_++;
         }
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mediator.setData(_loc3_,_loc6_,_loc7_,_loc8_);
      }
   }
}

