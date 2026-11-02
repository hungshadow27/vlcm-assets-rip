package com.tgame.moudels.fengzhengjie.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.fengzhengjie.view.FengZhengJie_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class FengZhengJie_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "FengZhengJie_MsgReceivedProxy";
      
      private var _mediator:FengZhengJie_Mediator;
      
      public function FengZhengJie_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73252,73254,73260],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73252,73254,73260],NAME);
      }
      
      private function get mediator() : FengZhengJie_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(FengZhengJie_Mediator.NAME) as FengZhengJie_Mediator;
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
      
      public function received_73252(param1:ByteArray) : void
      {
         ZLog.add("73252：风筝节面板信息返回");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:Boolean = Boolean(param1.readByte());
         var _loc6_:Boolean = Boolean(param1.readByte());
         var _loc7_:Boolean = Boolean(param1.readByte());
         this.mediator.update(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
      }
      
      public function received_73254(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         ZLog.add("73254：排行榜数据返回");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc9_ = new Object();
            _loc9_.name = param1.readUTF();
            _loc9_.cishu = param1.readInt();
            _loc6_.push(_loc9_);
            _loc7_++;
         }
         var _loc8_:Boolean = Boolean(param1.readByte());
         this.mediator.updateRank(_loc2_,_loc3_,_loc4_,_loc6_,_loc8_);
      }
      
      public function received_73260(param1:ByteArray) : void
      {
         ZLog.add("73260：赠送风筝成功返回");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         this.mediator.showAddQingmuzhiPanel(_loc2_,_loc3_);
      }
   }
}

