package com.tgame.moudels.kuafuLeitai.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.kuafuLeitai.view.KuafuLeitai_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class KuafuLeitai_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Kuafuzhan_MsgReceivedProxy";
      
      private var _kuafuleitai_Mediator:KuafuLeitai_Mediator;
      
      public function KuafuLeitai_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get kuafuleitai_Mediator() : KuafuLeitai_Mediator
      {
         if(!this._kuafuleitai_Mediator)
         {
            this._kuafuleitai_Mediator = facade.retrieveMediator(KuafuLeitai_Mediator.NAME) as KuafuLeitai_Mediator;
         }
         return this._kuafuleitai_Mediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([54552,54554,54556],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([54552,54554,54556],NAME);
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
      
      public function received_54552(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("54552：返回擂台标签");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = new Object();
            _loc6_.id = _loc2_.readByte();
            _loc6_.name = _loc2_.readUTF();
            _loc6_.miaoshu = _loc2_.readUTF();
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         this.kuafuleitai_Mediator.setBiaoqian(_loc4_);
      }
      
      public function received_54554(param1:ByteArray) : void
      {
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:XML = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         ZLog.add("54554：返回擂台信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:XML = <list/>;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc7_ = _loc2_.readInt();
            _loc8_ = _loc2_.readUTF();
            _loc9_ = _loc2_.readByte();
            _loc10_ = <node label={_loc8_} id={_loc7_} isfull={_loc9_}/>;
            _loc4_.appendChild(_loc10_);
            _loc5_++;
         }
         var _loc6_:int = _loc2_.readInt();
         if(_loc6_ == -1)
         {
            _loc11_ = _loc2_.readDouble();
            _loc12_ = _loc2_.readDouble();
            this.kuafuleitai_Mediator.settime2(_loc11_,_loc12_);
         }
         else
         {
            this.kuafuleitai_Mediator.settime1(_loc6_);
         }
         this.kuafuleitai_Mediator.setData(_loc4_);
      }
      
      public function received_54556(param1:ByteArray) : void
      {
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:XML = null;
         ZLog.add("54556：比赛结果信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:XML = <list/>;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = _loc2_.readUTF();
            _loc7_ = _loc2_.readInt();
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readInt();
            _loc10_ = <node playerName={_loc6_} level={_loc7_} deathCount={_loc8_} beatCount={_loc9_}/>;
            _loc4_.appendChild(_loc10_);
            _loc5_++;
         }
         this.kuafuleitai_Mediator.setJieguo(_loc4_);
      }
   }
}

