package com.tgame.moudels.yuejinlun.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.yuejinlun.view.YueJinLun_Mediator;
   import com.tgame.moudels.yuejinlun.view.YueJinLun_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YueJinLun_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YueJinLun_MsgReceivedProxy";
      
      private var _main_Mediator:YueJinLun_Mediator;
      
      private var _target_Mediator:YueJinLun_TargetPanelMediator;
      
      public function YueJinLun_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74452,74454,74456],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74452,74454,74456],NAME);
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
      
      public function get main_Mediator() : YueJinLun_Mediator
      {
         if(!this._main_Mediator)
         {
            this._main_Mediator = facade.retrieveMediator(YueJinLun_Mediator.NAME) as YueJinLun_Mediator;
         }
         return this._main_Mediator;
      }
      
      public function get target_Mediator() : YueJinLun_TargetPanelMediator
      {
         if(!this._target_Mediator)
         {
            this._target_Mediator = facade.retrieveMediator(YueJinLun_TargetPanelMediator.NAME) as YueJinLun_TargetPanelMediator;
         }
         return this._target_Mediator;
      }
      
      public function received_74452(param1:ByteArray) : void
      {
         ZLog.add("74452：返回月金轮面板信息");
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
            this.main_Mediator.setYuejinlun(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
         }
         else
         {
            this.target_Mediator.setYuejinlun(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
         }
      }
      
      public function received_74454(param1:ByteArray) : void
      {
         ZLog.add("74454：返回月金轮领悟查询");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.main_Mediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_74456(param1:ByteArray) : void
      {
         ZLog.add("74456：返回月金轮领悟结果");
         var _loc2_:int = param1.readByte();
         this.main_Mediator.setTupoResult(_loc2_);
      }
   }
}

