package com.tgame.moudels.xingyunzhuanzhuanle.model
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.xingyunzhuanzhuanle.view.XingYunZhuanZhuanLe_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XingYunZhuanZhuanLe_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XingYunZhuanZhuanLe_MsgReceivedProxy";
      
      private var _yuanPan_Mediator:XingYunZhuanZhuanLe_Mediator;
      
      public var attStringArr1:Array = ["攻击","防御","暴击","闪避","生命","内力","体力","武功层","武防","战纹"];
      
      public var attStringArr2:Array = ["+10000000","+10000000","+100000","+100000","+100000000","+100000000","+100000000","+50","+10","+1"];
      
      public function XingYunZhuanZhuanLe_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([82632,82634],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([82632,82634],NAME);
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
      
      private function get yuanPan_Mediator() : XingYunZhuanZhuanLe_Mediator
      {
         if(!this._yuanPan_Mediator)
         {
            this._yuanPan_Mediator = facade.retrieveMediator(XingYunZhuanZhuanLe_Mediator.NAME) as XingYunZhuanZhuanLe_Mediator;
         }
         return this._yuanPan_Mediator;
      }
      
      public function received_82632(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("82632：返回顶峰转盘初始化消息");
         var _loc2_:Object = new Object();
         _loc2_.count = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = 0;
         _loc2_.arr1 = new Array();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.att = LanResManager.getLanCommonTextWords(this.attStringArr1[_loc4_]) + this.attStringArr2[_loc4_];
            _loc5_.count = param1.readInt();
            _loc5_.value = param1.readDouble();
            _loc2_.arr1.push(_loc5_);
            _loc4_++;
         }
         _loc3_ = param1.readInt();
         _loc4_ = 0;
         _loc2_.arr2 = new Array();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.goodId = param1.readInt();
            _loc5_.count = param1.readInt();
            _loc5_.id = param1.readInt();
            _loc2_.arr2.push(_loc5_);
            _loc4_++;
         }
         _loc2_.isRecieved = param1.readByte();
         _loc2_.currIndex = 0;
         if(_loc2_.isRecieved)
         {
            _loc2_.currIndex = param1.readInt();
         }
         this.yuanPan_Mediator.setData(_loc2_);
      }
      
      public function received_82634(param1:ByteArray) : void
      {
         ZLog.add("82634：返回抽奖结果");
         var _loc2_:Object = new Object();
         _loc2_.index = param1.readInt();
         _loc2_.count = param1.readInt();
         this.yuanPan_Mediator.setResult(_loc2_);
      }
   }
}

