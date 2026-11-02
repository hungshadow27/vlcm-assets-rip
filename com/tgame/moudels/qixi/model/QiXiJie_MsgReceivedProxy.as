package com.tgame.moudels.qixi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.qixi.view.QiXiJie_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QiXiJie_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "QiXiJie_MsgReceivedProxy";
      
      private var _mediator:QiXiJie_Mediator;
      
      public function QiXiJie_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74302,74306],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74302,74306],NAME);
      }
      
      private function get mediator() : QiXiJie_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(QiXiJie_Mediator.NAME) as QiXiJie_Mediator;
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
      
      public function received_74302(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("74302：端午节面板信息返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = new Object();
            _loc6_.biaoshi = param1.readByte();
            _loc6_.id = param1.readInt();
            _loc6_.islingqu = Boolean(param1.readByte() == 1);
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         this.mediator.update(_loc2_,_loc4_);
      }
      
      public function received_74306(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         ZLog.add("74306：排行榜数据返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc9_ = new Object();
            _loc9_.mingci = param1.readInt();
            _loc9_.name = param1.readUTF();
            _loc9_.cishu = param1.readInt();
            _loc5_.push(_loc9_);
            _loc6_++;
         }
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mediator.updateRank(_loc2_,_loc3_,_loc5_,_loc7_,_loc8_);
      }
   }
}

