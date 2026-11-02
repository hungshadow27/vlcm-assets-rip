package com.tgame.moudels.yn2016xingyunzhuanpan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.yn2016xingyunzhuanpan.view.YN2016xingyunzhuanpan_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YN2016xingyunzhuanpan_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YN2016xingyunzhuanpan_MsgReceivedProxy";
      
      private var _mediator:YN2016xingyunzhuanpan_Mediator;
      
      public function YN2016xingyunzhuanpan_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([81062,81064,81070],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([81062,81064,81070],NAME);
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
      
      private function get mediator() : YN2016xingyunzhuanpan_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YN2016xingyunzhuanpan_Mediator.NAME) as YN2016xingyunzhuanpan_Mediator;
         }
         return this._mediator;
      }
      
      public function received_81062(param1:ByteArray) : void
      {
         var _loc16_:Object = null;
         ZLog.add("81062: 返回幸运转盘面板信息");
         var _loc2_:Array = [];
         var _loc3_:int = param1.readByte();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc16_ = new Object();
            _loc16_.goodsIndex = param1.readInt();
            _loc16_.goodsID = param1.readInt();
            _loc2_.push(_loc16_);
            _loc4_++;
         }
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:Array = [];
         var _loc11_:int = 0;
         while(_loc11_ < _loc9_)
         {
            _loc16_ = new Object();
            _loc16_.goodsIndex = param1.readInt();
            _loc16_.goodsID = param1.readInt();
            _loc16_.jileizhi = param1.readInt();
            _loc10_.push(_loc16_);
            _loc11_++;
         }
         var _loc12_:String = param1.readUTF();
         var _loc13_:String = param1.readUTF();
         var _loc14_:Boolean = param1.readByte() == 1 ? true : false;
         var _loc15_:int = -1;
         if(_loc14_)
         {
            _loc15_ = param1.readInt();
         }
         this.mediator.setData(_loc2_,_loc5_,_loc6_,_loc7_,_loc8_,_loc10_,_loc12_,_loc13_,_loc14_,_loc15_);
      }
      
      public function received_81064(param1:ByteArray) : void
      {
         ZLog.add("81064: 返回抽奖结果");
         var _loc2_:int = param1.readByte();
         this.mediator.setJiangli(_loc2_);
      }
      
      public function received_81070(param1:ByteArray) : void
      {
         ZLog.add("81070: 返回记录");
         var _loc2_:int = param1.readByte();
         var _loc3_:String = param1.readUTF();
         this.mediator.setJilu(_loc2_,_loc3_);
      }
   }
}

