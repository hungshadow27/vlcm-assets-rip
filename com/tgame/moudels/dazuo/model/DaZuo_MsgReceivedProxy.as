package com.tgame.moudels.dazuo.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.SitManager;
   import com.tgame.moudels.dazuo.view.DaZuo_DaZuoMediator;
   import com.tgame.moudels.dazuo.view.DaZuo_LiaoShangMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DaZuo_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "DaZuo_MsgReceivedProxy";
      
      private var _daZuoMediator:DaZuo_DaZuoMediator;
      
      private var _msgSenderProxy:DaZuo_MsgSenderProxy;
      
      private var _liaoShangMediator:DaZuo_LiaoShangMediator;
      
      public function DaZuo_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([50508,50512,50520,50522],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([50508,50512,50520,50522],NAME);
      }
      
      private function get daZuoMediator() : DaZuo_DaZuoMediator
      {
         if(this._daZuoMediator == null)
         {
            this._daZuoMediator = facade.retrieveMediator(DaZuo_DaZuoMediator.NAME) as DaZuo_DaZuoMediator;
         }
         return this._daZuoMediator;
      }
      
      private function get liaoShangMediator() : DaZuo_LiaoShangMediator
      {
         if(this._liaoShangMediator == null)
         {
            this._liaoShangMediator = facade.retrieveMediator(DaZuo_LiaoShangMediator.NAME) as DaZuo_LiaoShangMediator;
         }
         return this._liaoShangMediator;
      }
      
      private function get msgSenderProxy() : DaZuo_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(DaZuo_MsgSenderProxy.NAME) as DaZuo_MsgSenderProxy;
         }
         return this._msgSenderProxy;
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
      
      public function received_50508(param1:ByteArray) : void
      {
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         ZLog.add("50508：返回双修玩家查询 ");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readShort();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = param1.readInt();
            _loc8_ = param1.readUTF();
            _loc9_ = param1.readShort();
            _loc10_ = param1.readByte();
            _loc5_.push([_loc7_,_loc8_,_loc9_,_loc10_]);
            _loc6_++;
         }
         if(_loc2_ == 1)
         {
            this.daZuoMediator.received_shuangxiu_query(_loc3_,_loc5_);
         }
         else
         {
            this.liaoShangMediator.received_shuangxiu_query(_loc3_,_loc5_);
         }
      }
      
      public function received_50512(param1:ByteArray) : void
      {
         ZLog.add("50512：收到双修请求 ");
         var _loc2_:Object = {};
         var _loc3_:int = param1.readByte();
         _loc2_.id = param1.readInt();
         _loc2_.name = param1.readUTF();
         _loc2_.lv = param1.readShort();
         _loc2_.bangpai = param1.readUTF();
         _loc2_.party = param1.readByte();
         if(_loc3_ == 1)
         {
            this.daZuoMediator.received_shuangxiu_request(_loc2_);
         }
         else
         {
            this.liaoShangMediator.received_shuangxiu_request(_loc2_);
         }
      }
      
      public function received_50520(param1:ByteArray) : void
      {
         var _loc12_:Boolean = false;
         ZLog.add("50520：玩家打坐视野内广播 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(_loc3_ == 2)
         {
            _loc4_ = param1.readInt();
            _loc5_ = param1.readShort();
            _loc6_ = param1.readShort();
            _loc12_ = Boolean(param1.readByte() == 1);
            if(_loc12_)
            {
               _loc7_ = param1.readInt();
            }
         }
         var _loc11_:Boolean = Boolean(param1.readByte() == 1);
         if(_loc11_)
         {
            _loc8_ = param1.readInt();
            _loc9_ = param1.readShort();
            _loc10_ = param1.readShort();
         }
         SitManager.setCharSitStatus(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc8_,_loc9_,_loc10_,_loc7_);
      }
      
      public function received_50522(param1:ByteArray) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Boolean = false;
         ZLog.add("50522：玩家疗伤视野内广播 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = 0;
         if(_loc3_ == 1)
         {
            _loc7_ = param1.readInt();
            _loc8_ = param1.readShort();
            _loc9_ = param1.readShort();
            _loc10_ = Boolean(param1.readByte() == 1);
            if(_loc10_)
            {
               _loc4_ = param1.readInt();
            }
         }
         var _loc5_:Boolean = Boolean(param1.readByte() == 1);
         var _loc6_:int = 0;
         if(_loc5_)
         {
            _loc6_ = param1.readInt();
         }
         SitManager.setCharLiaoshangStatus(_loc2_,_loc3_,_loc7_,_loc8_,_loc9_,_loc6_,_loc4_);
      }
   }
}

