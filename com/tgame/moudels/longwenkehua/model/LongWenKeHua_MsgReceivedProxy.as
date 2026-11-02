package com.tgame.moudels.longwenkehua.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.longwenkehua.view.LongWenKeHua_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class LongWenKeHua_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "LongYaJueXing_MsgReceivedProxy";
      
      private var _mainPanelMediator:LongWenKeHua_Mediator;
      
      public function LongWenKeHua_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : LongWenKeHua_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(LongWenKeHua_Mediator.NAME) as LongWenKeHua_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([72452,72454,72456],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([72452,72454,72456],NAME);
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
      
      public function received_72454(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         ZLog.add("72454：龙纹刻画返回");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         if(_loc2_ == 1 && Boolean(_loc3_))
         {
            _loc4_ = param1.readByte();
         }
         this.mainPanelMediator.showJinDu(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_72452(param1:ByteArray) : void
      {
         ZLog.add("72452：返回装备龙纹刻画进度");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_.push(param1.readByte());
            _loc5_++;
         }
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:Number = param1.readDouble();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         var _loc12_:int = param1.readInt();
         var _loc13_:int = param1.readByte();
         this.mainPanelMediator.setPanel(_loc2_,_loc3_,_loc4_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_);
      }
   }
}

