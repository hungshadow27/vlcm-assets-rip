package com.tgame.moudels.aojianzhengba.model
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.aojianzhengba.view.AojianZhengba_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class AojianZhengba_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "AojianZhengba_MsgReceivedProxy";
      
      private var _aojianZhengba_Mediator:AojianZhengba_Mediator;
      
      private var _msg_sender:AojianZhengba_MsgSenderProxy;
      
      public function AojianZhengba_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      public function get aojianZhengba_Mediator() : AojianZhengba_Mediator
      {
         if(!this._aojianZhengba_Mediator)
         {
            this._aojianZhengba_Mediator = facade.retrieveMediator(AojianZhengba_Mediator.NAME) as AojianZhengba_Mediator;
         }
         return this._aojianZhengba_Mediator;
      }
      
      private function get msg_sender() : AojianZhengba_MsgSenderProxy
      {
         if(!this._msg_sender)
         {
            this._msg_sender = facade.retrieveProxy(AojianZhengba_MsgSenderProxy.NAME) as AojianZhengba_MsgSenderProxy;
         }
         return this._msg_sender;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([57902,57904],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([57902,57904],NAME);
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
      
      public function received_57902(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:uint = 0;
         var _loc9_:String = null;
         var _loc10_:XML = null;
         ZLog.add("57902：收到跨服服务器列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:XML = <list/>;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = _loc2_.readByte();
            _loc7_ = _loc2_.readInt();
            _loc9_ = "";
            if(_loc7_ < 100)
            {
               _loc8_ = uint(StaticValue.GREEN_STRONG);
            }
            else if(_loc7_ >= 100 && _loc7_ < 150)
            {
               _loc8_ = uint(StaticValue.GREEN);
            }
            else if(_loc7_ >= 150 && _loc7_ < 200)
            {
               _loc8_ = uint(StaticValue.YELLOW);
            }
            else if(_loc7_ >= 200 && _loc7_ < 250)
            {
               _loc8_ = uint(StaticValue.RED);
            }
            else if(_loc7_ >= 250)
            {
               _loc8_ = uint(StaticValue.RED);
            }
            _loc9_ = LanResManager.getLanCommonTextWords("场地") + _loc6_;
            _loc10_ = <node label={_loc9_} id={_loc6_} color={_loc8_}/>;
            _loc4_.appendChild(_loc10_);
            _loc5_++;
         }
         this.aojianZhengba_Mediator.showZhengbaLineSelectPanel(_loc4_);
      }
      
      public function received_57904(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:XML = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:uint = 0;
         var _loc12_:int = 0;
         var _loc13_:String = null;
         var _loc14_:XML = null;
         ZLog.add("57904：傲剑争霸排行榜信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte() == 1);
         if(_loc3_)
         {
            _loc4_ = _loc2_.readByte();
            _loc5_ = <list/>;
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc7_ = _loc2_.readInt();
               _loc8_ = _loc2_.readUTF();
               _loc9_ = _loc2_.readInt();
               _loc10_ = _loc2_.readInt();
               _loc13_ = "";
               if(_loc6_ == 0)
               {
                  _loc11_ = uint(StaticValue.RED);
               }
               else if(_loc6_ == 1)
               {
                  _loc11_ = uint(StaticValue.GREEN);
               }
               else if(_loc6_ == 2)
               {
                  _loc11_ = uint(StaticValue.ORANGE);
               }
               else if(_loc6_ == 3)
               {
                  _loc11_ = uint(StaticValue.YELLOW);
               }
               else if(_loc6_ == 4)
               {
                  _loc11_ = uint(StaticValue.WHITE);
               }
               _loc13_ = LanResManager.getLanCommonTextWords("场地") + _loc9_;
               _loc12_ = _loc6_ + 1;
               _loc14_ = <node mc={_loc12_} name={_loc8_} qf={_loc7_} field={_loc13_} count={_loc10_} color={_loc11_}/>;
               _loc5_.appendChild(_loc14_);
               _loc6_++;
            }
            this.aojianZhengba_Mediator.setZhengbaList(_loc5_);
         }
         else
         {
            this.aojianZhengba_Mediator.deldteZhengbaList();
         }
      }
   }
}

