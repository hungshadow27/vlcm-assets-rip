package com.tgame.moudels.sanshiliushou.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.sanshiliushou.view.SanShiLiuShou_MaincharPlaneMediator;
   import com.tgame.moudels.sanshiliushou.view.SanShiLiuShou_TargetCharPlaneMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class SanShiLiuShou_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "SanShiLiuShou_MsgReceivedProxy";
      
      private var _mainChar_Mediator:SanShiLiuShou_MaincharPlaneMediator;
      
      private var _targetChar_Mediator:SanShiLiuShou_TargetCharPlaneMediator;
      
      public function SanShiLiuShou_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([60152,60154,60156],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([60152,60154,60156],NAME);
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
      
      public function get mainChar_Mediator() : SanShiLiuShou_MaincharPlaneMediator
      {
         if(!this._mainChar_Mediator)
         {
            this._mainChar_Mediator = facade.retrieveMediator(SanShiLiuShou_MaincharPlaneMediator.NAME) as SanShiLiuShou_MaincharPlaneMediator;
         }
         return this._mainChar_Mediator;
      }
      
      public function get targetChar_Mediator() : SanShiLiuShou_TargetCharPlaneMediator
      {
         if(!this._targetChar_Mediator)
         {
            this._targetChar_Mediator = facade.retrieveMediator(SanShiLiuShou_TargetCharPlaneMediator.NAME) as SanShiLiuShou_TargetCharPlaneMediator;
         }
         return this._targetChar_Mediator;
      }
      
      public function received_60152(param1:ByteArray) : void
      {
         ZLog.add("60152: 返回请求玩家36手详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readByte();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readByte();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         var _loc12_:int = param1.readInt();
         var _loc13_:Boolean = param1.readByte() == 1;
         var _loc14_:int = param1.readByte();
         var _loc15_:Boolean = param1.readByte() == 1;
         if(_loc2_ == -1)
         {
            this.mainChar_Mediator.setSanShiLiuShou(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc9_,_loc8_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_);
         }
         else
         {
            this.targetChar_Mediator.setSanShiLiuShou(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc9_,_loc8_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_);
         }
      }
      
      public function received_60154(param1:ByteArray) : void
      {
         ZLog.add("60154: 返回36手突破数据");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mainChar_Mediator.setTupoPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_60156(param1:ByteArray) : void
      {
         ZLog.add("60156: 返回突破36手结果");
         var _loc2_:int = param1.readByte();
         this.mainChar_Mediator.setTupoResult(_loc2_);
      }
   }
}

