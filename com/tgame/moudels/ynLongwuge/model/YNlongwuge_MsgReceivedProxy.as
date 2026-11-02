package com.tgame.moudels.ynLongwuge.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ynLongwuge.model.info.YNlongwugeVO;
   import com.tgame.moudels.ynLongwuge.view.YNlongwuge_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNlongwuge_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YNlongwuge_MsgReceivedProxy";
      
      private var _mediator:YNlongwuge_Mediator;
      
      public function YNlongwuge_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([79882,79886,79888,79890,79892],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([79882,79886,79888,79890,79892],NAME);
      }
      
      private function get mediator() : YNlongwuge_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YNlongwuge_Mediator.NAME) as YNlongwuge_Mediator;
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
      
      public function received_79882(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         ZLog.add("79882：返回龙武阁钱监面板信息");
         var _loc2_:YNlongwugeVO = new YNlongwugeVO();
         _loc2_.playerID = param1.readInt();
         _loc2_.type = 1;
         _loc2_.level = param1.readInt();
         _loc2_.ccsd = param1.readInt();
         _loc2_.jpcl = param1.readInt();
         _loc2_.dqsy = param1.readInt();
         _loc2_.ljsy = param1.readInt();
         _loc2_.nmsl = param1.readInt();
         _loc2_.nmID = param1.readInt();
         _loc2_.nmGNUM = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = new Object();
            _loc7_ = param1.readInt();
            _loc6_.level = _loc7_;
            _loc6_.ccsd = param1.readInt();
            _loc6_.jpcl = param1.readInt();
            _loc6_.kcsx = param1.readInt();
            _loc6_.copper = param1.readDouble();
            _loc6_.yb = param1.readInt();
            _loc6_.gid = param1.readInt();
            _loc6_.gnum = param1.readInt();
            if(_loc7_ == _loc2_.level && _loc2_.level != 10)
            {
               _loc2_.sjxhtb = int(_loc6_.copper);
               _loc2_.sjxhyb = int(_loc6_.yb);
               _loc2_.sjxhwp = int(_loc6_.gid);
               _loc2_.sjxhsl = int(_loc6_.gnum);
            }
            if(_loc7_ == _loc2_.level + 1 && _loc7_ != 10)
            {
               _loc2_.next_ccsd = int(_loc6_.ccsd);
               _loc2_.next_jpcl = int(_loc6_.jpcl);
               _loc2_.next_kcsx = int(_loc6_.kcsx);
            }
            if(_loc2_.level == 10 && _loc7_ == 9)
            {
               _loc2_.sjxhwp = int(_loc6_.gid);
            }
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         if(_loc2_.level == 10)
         {
            _loc2_.next_ccsd = _loc2_.ccsd;
            _loc2_.next_jpcl = _loc2_.jpcl;
            _loc2_.next_kcsx = _loc2_.ljsy;
         }
         _loc2_.qjArr = _loc4_;
         this.mediator.setQianjianData(_loc2_);
      }
      
      public function received_79888(param1:ByteArray) : void
      {
         ZLog.add("79888：返回增加农民结果");
         var _loc2_:int = param1.readInt();
         this.mediator.updateFarmer(_loc2_);
      }
      
      public function received_79890(param1:ByteArray) : void
      {
         ZLog.add("79890：返回龙武阁四圣兽面板信息");
         var _loc2_:YNlongwugeVO = new YNlongwugeVO();
         _loc2_.playerID = param1.readInt();
         _loc2_.type = param1.readByte();
         _loc2_.level = param1.readInt();
         _loc2_.sysx = param1.readUTF();
         _loc2_.next_sysx = param1.readUTF();
         _loc2_.sjxhtb = param1.readDouble();
         _loc2_.sjxhyb = param1.readInt();
         _loc2_.sjxhwp = param1.readInt();
         _loc2_.sjxhsl = param1.readInt();
         this.mediator.setSishengshouData(_loc2_);
      }
   }
}

