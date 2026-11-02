package com.tgame.moudels.rijinlun.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.rijinlun.view.Rijinlun_MainMediator;
   import com.tgame.moudels.rijinlun.view.Rijinlun_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Rijinlun_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Rijinlun_MsgReceivedProxy";
      
      private var _main_Mediator:Rijinlun_MainMediator;
      
      private var _target_Mediator:Rijinlun_TargetMediator;
      
      public function Rijinlun_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74322,74324,74326],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74322,74324,74326],NAME);
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
      
      public function get main_Mediator() : Rijinlun_MainMediator
      {
         if(!this._main_Mediator)
         {
            this._main_Mediator = facade.retrieveMediator(Rijinlun_MainMediator.NAME) as Rijinlun_MainMediator;
         }
         return this._main_Mediator;
      }
      
      public function get target_Mediator() : Rijinlun_TargetMediator
      {
         if(!this._target_Mediator)
         {
            this._target_Mediator = facade.retrieveMediator(Rijinlun_TargetMediator.NAME) as Rijinlun_TargetMediator;
         }
         return this._target_Mediator;
      }
      
      public function received_74322(param1:ByteArray) : void
      {
         ZLog.add("74322：返回日金轮面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:String = param1.readUTF();
         var _loc6_:String = param1.readUTF();
         var _loc7_:String = param1.readUTF();
         var _loc8_:int = param1.readByte();
         var _loc9_:String = param1.readUTF();
         if(_loc2_ == -1)
         {
            this.main_Mediator.setRijinlun(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
         }
         else
         {
            this.target_Mediator.setRijinlun(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
         }
      }
      
      public function received_74324(param1:ByteArray) : void
      {
         ZLog.add("74324：返回日金轮领悟查询");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.main_Mediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_74326(param1:ByteArray) : void
      {
         ZLog.add("74326：返回日金轮领悟结果");
         var _loc2_:int = param1.readByte();
         this.main_Mediator.setTupoResult(_loc2_);
      }
   }
}

