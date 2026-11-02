package com.tgame.moudels.fabao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.fabao.view.Fabao_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Fabao_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Fabao_MsgReceivedProxy";
      
      private var _mediator:Fabao_Mediator;
      
      public function Fabao_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73632,73634,73638,73640,73642,73648],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73632,73634,73638,73640,73642,73648],NAME);
      }
      
      private function get mediator() : Fabao_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(Fabao_Mediator.NAME) as Fabao_Mediator;
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
      
      public function received_73632(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:int = 0;
         var _loc12_:Array = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:Object = null;
         ZLog.add("73632：返回法宝面板信息");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 0)
         {
            this.mediator.fabaoTip();
         }
         else
         {
            _loc3_ = param1.readInt();
            _loc4_ = param1.readInt();
            _loc5_ = param1.readUTF();
            _loc6_ = param1.readInt();
            _loc7_ = param1.readUTF();
            _loc8_ = param1.readUTF();
            _loc9_ = param1.readUTF();
            _loc10_ = param1.readUTF();
            _loc11_ = param1.readInt();
            _loc12_ = [];
            _loc13_ = 0;
            while(_loc13_ < _loc11_)
            {
               _loc16_ = new Object();
               _loc16_.id = param1.readInt();
               _loc16_.bo = param1.readByte();
               _loc12_.push(_loc16_);
               _loc13_++;
            }
            _loc14_ = param1.readByte();
            _loc15_ = param1.readInt();
            this.mediator.setData(_loc3_,_loc4_,_loc8_,_loc9_,_loc10_,_loc12_,_loc6_,_loc7_,_loc14_,_loc15_);
         }
      }
      
      public function received_73634(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("73634:返回法宝列表");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = new Object();
            _loc6_.id = param1.readInt();
            _loc6_.name = param1.readUTF();
            _loc6_.icoID = param1.readInt();
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         this.mediator.refreshList(_loc4_);
      }
      
      public function received_73638(param1:ByteArray) : void
      {
         ZLog.add("73638：返回法宝修炼面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:String = param1.readUTF();
         var _loc5_:int = param1.readInt();
         var _loc6_:String = param1.readUTF();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         var _loc12_:int = param1.readInt();
         this.mediator.setUpData(_loc4_,_loc6_,_loc9_,_loc10_,_loc11_,_loc12_,_loc7_,_loc8_,_loc3_,_loc2_,_loc5_);
      }
      
      public function received_73640(param1:ByteArray) : void
      {
         ZLog.add("73640：返回修炼结果");
         var _loc2_:int = param1.readByte();
         this.mediator.upDateLVComplete(_loc2_);
      }
      
      public function received_73642(param1:ByteArray) : void
      {
         ZLog.add("73642：返回灵力面板信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readByte();
         this.mediator.setLingliPanel(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_73648(param1:ByteArray) : void
      {
         ZLog.add("73648：返回灵力值满100W提示");
      }
   }
}

