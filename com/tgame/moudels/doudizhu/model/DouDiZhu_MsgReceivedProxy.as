package com.tgame.moudels.doudizhu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.doudizhu.view.DouDiZhu_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DouDiZhu_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "DouDiZhu_MsgReceivedProxy";
      
      private var _mediator:DouDiZhu_Mediator;
      
      public function DouDiZhu_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73462,73464],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73462,73464],NAME);
      }
      
      private function get mediator() : DouDiZhu_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(DouDiZhu_Mediator.NAME) as DouDiZhu_Mediator;
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
      
      public function received_73462(param1:ByteArray) : void
      {
         ZLog.add("73462：风筝节面板信息返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:Boolean = Boolean(param1.readByte());
         this.mediator.update(_loc2_,_loc3_);
      }
      
      public function received_73464(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         ZLog.add("73464：排行榜数据返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc8_ = new Object();
            _loc8_.name = param1.readUTF();
            _loc8_.cishu = param1.readInt();
            _loc5_.push(_loc8_);
            _loc6_++;
         }
         var _loc7_:Boolean = Boolean(param1.readByte());
         this.mediator.updateRank(_loc2_,_loc3_,_loc5_,_loc7_);
      }
   }
}

