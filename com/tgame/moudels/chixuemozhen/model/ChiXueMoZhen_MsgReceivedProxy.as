package com.tgame.moudels.chixuemozhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.chixuemozhen.view.ChiXueMoZhen_MaincharPlaneMediator;
   import com.tgame.moudels.chixuemozhen.view.ChiXueMoZhen_TargetCharPlaneMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ChiXueMoZhen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ChiXueMoZhen_MsgReceivedProxy";
      
      private var _mainChiXueMoZhen_Mediator:ChiXueMoZhen_MaincharPlaneMediator;
      
      private var _targetChiXueMoZhen_Mediator:ChiXueMoZhen_TargetCharPlaneMediator;
      
      public function ChiXueMoZhen_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([59752,59754,59756],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([59752,59754,59756],NAME);
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
      
      public function get mainChiXueMoZhen_Mediator() : ChiXueMoZhen_MaincharPlaneMediator
      {
         if(!this._mainChiXueMoZhen_Mediator)
         {
            this._mainChiXueMoZhen_Mediator = facade.retrieveMediator(ChiXueMoZhen_MaincharPlaneMediator.NAME) as ChiXueMoZhen_MaincharPlaneMediator;
         }
         return this._mainChiXueMoZhen_Mediator;
      }
      
      public function get targetChiXueMoZhen_Mediator() : ChiXueMoZhen_TargetCharPlaneMediator
      {
         if(!this._targetChiXueMoZhen_Mediator)
         {
            this._targetChiXueMoZhen_Mediator = facade.retrieveMediator(ChiXueMoZhen_TargetCharPlaneMediator.NAME) as ChiXueMoZhen_TargetCharPlaneMediator;
         }
         return this._targetChiXueMoZhen_Mediator;
      }
      
      public function received_59752(param1:ByteArray) : void
      {
         var _loc26_:Object = null;
         ZLog.add("59752: 返回请求玩家赤血魔阵详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readByte();
         var _loc6_:String = param1.readUTF();
         var _loc7_:int = param1.readByte();
         var _loc8_:int = param1.readByte();
         var _loc9_:Array = [];
         var _loc10_:int = 0;
         while(_loc10_ < _loc8_)
         {
            _loc26_ = new Object();
            _loc26_.index = param1.readByte();
            _loc26_.goodsId = param1.readInt();
            _loc26_.num = param1.readInt();
            _loc9_.push(_loc26_);
            _loc10_++;
         }
         var _loc11_:int = param1.readInt();
         var _loc12_:int = param1.readInt();
         var _loc13_:int = param1.readInt();
         var _loc14_:int = param1.readInt();
         var _loc15_:int = param1.readInt();
         var _loc16_:Boolean = param1.readByte() == 1;
         var _loc17_:int = param1.readInt();
         var _loc18_:Boolean = param1.readByte() == 1;
         var _loc19_:int = param1.readInt();
         var _loc20_:Boolean = Boolean(param1.readByte() == 1);
         var _loc21_:int = param1.readInt();
         var _loc22_:Boolean = Boolean(param1.readByte() == 1);
         var _loc23_:Boolean = Boolean(param1.readByte() == 1);
         var _loc24_:Boolean = Boolean(param1.readByte() == 1);
         var _loc25_:Boolean = Boolean(param1.readByte() == 1);
         _loc19_ /= 100;
         if(_loc2_ == -1)
         {
            this.mainChiXueMoZhen_Mediator.setChiXueMoZhen(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc9_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc21_,_loc22_,_loc23_,_loc24_,_loc25_);
         }
         else
         {
            this.targetChiXueMoZhen_Mediator.setChiXueMoZhen(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc9_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc21_,_loc22_,_loc23_,_loc24_,_loc25_);
         }
      }
      
      public function received_59754(param1:ByteArray) : void
      {
         ZLog.add("59754: 返回赤血魔阵突破数据");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readByte();
         this.mainChiXueMoZhen_Mediator.setTupoPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
      }
      
      public function received_59756(param1:ByteArray) : void
      {
         ZLog.add("59756: 返回突破赤血魔阵结果");
         var _loc2_:int = param1.readByte();
         this.mainChiXueMoZhen_Mediator.setTupoResult(_loc2_);
      }
   }
}

