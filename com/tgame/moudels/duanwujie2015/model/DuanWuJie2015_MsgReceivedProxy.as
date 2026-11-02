package com.tgame.moudels.duanwujie2015.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.duanwujie2015.view.DuanWuJie2015_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DuanWuJie2015_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "DuanWuJie2015_MsgReceivedProxy";
      
      private var _mediator:DuanWuJie2015_Mediator;
      
      public function DuanWuJie2015_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([79462,79466],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([79462,79466],NAME);
      }
      
      private function get mediator() : DuanWuJie2015_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(DuanWuJie2015_Mediator.NAME) as DuanWuJie2015_Mediator;
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
      
      public function received_79462(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc11_:Object = null;
         var _loc12_:int = 0;
         ZLog.add("79462：端午节面板信息返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc11_ = new Object();
            _loc11_.id = param1.readInt();
            _loc11_.count = param1.readInt();
            _loc11_.isLingqu = param1.readByte();
            _loc11_.dianshu = param1.readInt();
            _loc4_.push(_loc11_);
            _loc5_++;
         }
         var _loc6_:Boolean = Boolean(param1.readByte() == 1);
         var _loc7_:int = param1.readInt();
         var _loc8_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc7_)
         {
            _loc12_ = param1.readInt();
            _loc8_.push(_loc12_);
            _loc5_++;
         }
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         this.mediator.update(_loc2_,_loc4_,_loc6_,_loc8_,_loc9_,_loc10_);
      }
      
      public function received_79466(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         ZLog.add("79466：排行榜数据返回");
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

