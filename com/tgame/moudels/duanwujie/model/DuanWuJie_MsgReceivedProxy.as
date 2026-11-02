package com.tgame.moudels.duanwujie.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.duanwujie.view.DuanWuJie_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DuanWuJie_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "DuanWuJie_MsgReceivedProxy";
      
      private var _mediator:DuanWuJie_Mediator;
      
      public function DuanWuJie_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73702,73704,73706],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73702,73704,73706],NAME);
      }
      
      private function get mediator() : DuanWuJie_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(DuanWuJie_Mediator.NAME) as DuanWuJie_Mediator;
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
      
      public function received_73702(param1:ByteArray) : void
      {
         var _loc11_:Object = null;
         ZLog.add("73702：端午节面板信息返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc11_ = new Object();
            _loc11_.qiandao = Boolean(param1.readByte() == 1);
            _loc3_.push(_loc11_);
            _loc4_++;
         }
         var _loc5_:int = param1.readByte();
         var _loc6_:Boolean = Boolean(param1.readByte() == 1);
         var _loc7_:Boolean = Boolean(param1.readByte() == 1);
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         this.mediator.update(_loc3_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
      }
      
      public function received_73704(param1:ByteArray) : void
      {
         var _loc7_:Object = null;
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc7_ = new Object();
            _loc7_.goodid = param1.readInt();
            _loc7_.count = param1.readInt();
            _loc4_.push(_loc7_);
            _loc5_++;
         }
         var _loc6_:Boolean = Boolean(param1.readByte() == 1);
         this.mediator.jiangchi(_loc2_,_loc4_,_loc6_);
      }
      
      public function received_73706(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         ZLog.add("73706：排行榜数据返回");
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
         var _loc7_:Boolean = Boolean(param1.readByte());
         var _loc8_:int = param1.readInt();
         this.mediator.updateRank(_loc2_,_loc3_,_loc5_,_loc7_,_loc8_);
      }
   }
}

