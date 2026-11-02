package com.tgame.moudels.dantiaowang.model
{
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.dantiaowang.view.DanTiaoWang_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DanTiaoWang_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "DanTiaoWang_MsgReceivedProxy";
      
      private var _danTiaoWang_Mediator:DanTiaoWang_Mediator;
      
      private var _msg_sender:DanTiaoWang_MsgSenderProxy;
      
      public function DanTiaoWang_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      public function get danTiaoWang_Mediator() : DanTiaoWang_Mediator
      {
         if(!this._danTiaoWang_Mediator)
         {
            this._danTiaoWang_Mediator = facade.retrieveMediator(DanTiaoWang_Mediator.NAME) as DanTiaoWang_Mediator;
         }
         return this._danTiaoWang_Mediator;
      }
      
      private function get msg_sender() : DanTiaoWang_MsgSenderProxy
      {
         if(!this._msg_sender)
         {
            this._msg_sender = facade.retrieveProxy(DanTiaoWang_MsgSenderProxy.NAME) as DanTiaoWang_MsgSenderProxy;
         }
         return this._msg_sender;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([60010],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([60010],NAME);
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
      
      public function received_60010(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:XML = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         var _loc13_:uint = 0;
         var _loc14_:XML = null;
         ZLog.add("60010：单挑王排行榜信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte() == 1);
         if(_loc3_)
         {
            _loc4_ = _loc2_.readByte();
            _loc5_ = <list/>;
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc10_ = _loc2_.readInt();
               _loc8_ = _loc2_.readInt();
               _loc11_ = _loc2_.readUTF();
               _loc12_ = _loc2_.readInt();
               if(_loc6_ == 0)
               {
                  _loc13_ = uint(StaticValue.RED);
               }
               else if(_loc6_ == 1)
               {
                  _loc13_ = uint(StaticValue.GREEN);
               }
               else if(_loc6_ == 2)
               {
                  _loc13_ = uint(StaticValue.ORANGE);
               }
               else if(_loc6_ == 3)
               {
                  _loc13_ = uint(StaticValue.YELLOW);
               }
               else
               {
                  _loc13_ = uint(StaticValue.WHITE);
               }
               _loc14_ = <node rank={_loc8_} qf={_loc10_} name={_loc11_} count={_loc12_} color={_loc13_}/>;
               _loc5_.appendChild(_loc14_);
               _loc6_++;
            }
            _loc7_ = _loc2_.readInt();
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readByte();
            this.danTiaoWang_Mediator.setDanTiaoWangList(_loc5_,_loc7_,_loc8_,_loc9_);
         }
         else
         {
            this.danTiaoWang_Mediator.deleteDanTiaoWangList();
         }
      }
   }
}

