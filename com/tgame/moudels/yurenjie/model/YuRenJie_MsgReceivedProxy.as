package com.tgame.moudels.yurenjie.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.yurenjie.view.YuRenJie_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YuRenJie_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YuRenJie_MsgReceivedProxy";
      
      private var _mediator:YuRenJie_Mediator;
      
      public function YuRenJie_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73132,73134],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73132,73134],NAME);
      }
      
      private function get mediator() : YuRenJie_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YuRenJie_Mediator.NAME) as YuRenJie_Mediator;
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
      
      public function received_73132(param1:ByteArray) : void
      {
         ZLog.add("73132：愚人节活动主面板信息返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:Boolean = Boolean(param1.readByte());
         this.mediator.update(_loc2_,_loc3_);
      }
      
      public function received_73134(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         ZLog.add("73134：排行榜数据返回");
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

