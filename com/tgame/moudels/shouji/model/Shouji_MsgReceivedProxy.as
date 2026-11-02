package com.tgame.moudels.shouji.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.moudels.login.view.*;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Shouji_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Shouji_MsgReceivedProxy";
      
      private var _shoujiProxy:Shouji_ShoujiProxy;
      
      public function Shouji_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get shoujiProxy() : Shouji_ShoujiProxy
      {
         if(this._shoujiProxy == null)
         {
            this._shoujiProxy = facade.retrieveProxy(Shouji_ShoujiProxy.NAME) as Shouji_ShoujiProxy;
         }
         return this._shoujiProxy;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([50902,50904,50906],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([50902,50904,50906],NAME);
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
      
      public function received_50902(param1:ByteArray) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         ZLog.add("50902：主角收集信息初始化");
         var _loc2_:Array = [];
         var _loc5_:int = param1.readByte();
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = new Object();
            _loc3_ = [];
            _loc4_.arr = _loc3_;
            _loc4_.id = param1.readInt();
            _loc4_.isCom = param1.readByte();
            _loc7_ = param1.readByte();
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc3_.push([param1.readInt(),param1.readInt()]);
               _loc8_++;
            }
            _loc2_.push(_loc4_);
            _loc6_++;
         }
         this.shoujiProxy.init(_loc2_);
      }
      
      public function received_50904(param1:ByteArray) : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:String = null;
         ZLog.add("50904：一个收集完成");
         var _loc2_:Boolean = param1.readByte() == 1 ? true : false;
         if(_loc2_)
         {
            _loc3_ = new Object();
            _loc3_.id = param1.readInt();
            _loc3_.isCom = param1.readByte();
            _loc4_ = param1.readByte();
            _loc6_ = [];
            _loc3_.arr = _loc6_;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc6_.push([param1.readInt(),param1.readInt()]);
               _loc5_++;
            }
            this.shoujiProxy.updateObj(_loc3_);
         }
         else
         {
            _loc7_ = NetWorkManager.readGILMsg(param1);
            ZLog.add("50904：交收集失败");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc7_);
         }
      }
      
      public function received_50906(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         ZLog.add("50906：领取奖励完成");
         var _loc2_:Boolean = param1.readByte() == 1 ? true : false;
         if(_loc2_)
         {
            _loc3_ = param1.readInt();
            _loc4_ = [param1.readShort(),param1.readShort(),param1.readShort(),param1.readShort()];
            this.shoujiProxy.lingquSuccess(_loc3_,_loc4_);
         }
         else
         {
            _loc5_ = NetWorkManager.readGILMsg(param1);
            ZLog.add("50904：交收集失败");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc5_);
         }
      }
   }
}

