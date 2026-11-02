package com.tgame.moudels.yn2016newyear.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.yn2016newyear.view.YN2016newyear_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YN2016newyear_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YN2016newyear_MsgReceivedProxy";
      
      private var _mediator:YN2016newyear_Mediator;
      
      public function YN2016newyear_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([80924,80928],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([80924,80928],NAME);
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
      
      private function get mediator() : YN2016newyear_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YN2016newyear_Mediator.NAME) as YN2016newyear_Mediator;
         }
         return this._mediator;
      }
      
      public function received_80924(param1:ByteArray) : void
      {
         ZLog.add("80924：返回彩果面板信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_.push(param1.readByte());
            _loc4_++;
         }
         var _loc5_:Boolean = param1.readByte() == 1 ? true : false;
         var _loc6_:Boolean = param1.readByte() == 1 ? true : false;
         this.mediator.setCGData(_loc3_,_loc5_,_loc6_);
      }
      
      public function received_80928(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Object = null;
         ZLog.add("80928：返回在线领奖面板信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc6_ = {};
            _loc6_.day = _loc4_ + 1;
            _loc6_.goodarr = [];
            _loc7_ = param1.readByte();
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc9_ = {};
               _loc9_.id = param1.readInt();
               _loc9_.count = param1.readInt();
               _loc6_.goodarr.push(_loc9_);
               _loc8_++;
            }
            _loc6_.enabled = param1.readByte() == 1 ? true : false;
            _loc3_.push(_loc6_);
            _loc4_++;
         }
         var _loc5_:int = param1.readInt();
         this.mediator.setOnline(_loc3_,_loc5_);
      }
   }
}

