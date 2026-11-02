package com.tgame.moudels.jinchantuoqiao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.jinchantuoqiao.view.JinChanTuoQiao_Mediator;
   import com.tgame.moudels.jinchantuoqiao.view.JinChanTuoQiao_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JinChanTuoQiao_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "JinChanTuoQiao_MsgReceivedProxy";
      
      private var _mianPanelMediator:JinChanTuoQiao_Mediator;
      
      private var _targetMediator:JinChanTuoQiao_TargetMediator;
      
      public function JinChanTuoQiao_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mianPanelMediator() : JinChanTuoQiao_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(JinChanTuoQiao_Mediator.NAME) as JinChanTuoQiao_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : JinChanTuoQiao_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(JinChanTuoQiao_TargetMediator.NAME) as JinChanTuoQiao_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([60482,60484,60486],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([60482,60484,60486],NAME);
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
      
      public function received_60482(param1:ByteArray) : void
      {
         ZLog.add("60482：返回玩家金蝉脱壳详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:String = param1.readUTF();
         var _loc5_:int = param1.readInt();
         var _loc6_:Boolean = param1.readByte() == 1;
         var _loc7_:int = param1.readByte();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         var _loc12_:int = param1.readInt();
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_,_loc4_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc5_,_loc6_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc3_,_loc4_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc5_,_loc6_);
         }
      }
      
      public function received_60484(param1:ByteArray) : void
      {
         ZLog.add("60484：返回金蝉脱壳突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mianPanelMediator.setTupoPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_60486(param1:ByteArray) : void
      {
         ZLog.add("60486: 返回突破金蝉脱壳结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

