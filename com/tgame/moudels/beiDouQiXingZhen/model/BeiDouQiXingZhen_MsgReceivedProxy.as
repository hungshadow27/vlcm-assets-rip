package com.tgame.moudels.beiDouQiXingZhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.beiDouQiXingZhen.veiw.BeiDouQiXingZhen_Mediator;
   import com.tgame.moudels.beiDouQiXingZhen.veiw.BeiDouQiXingZhen_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BeiDouQiXingZhen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "BeiDouQiXingZhen_MsgReceivedProxy";
      
      private var _mainChar_Mediator:BeiDouQiXingZhen_Mediator;
      
      private var _targetMediator:BeiDouQiXingZhen_TargetPanelMediator;
      
      public function BeiDouQiXingZhen_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mainChar_Mediator() : BeiDouQiXingZhen_Mediator
      {
         if(!this._mainChar_Mediator)
         {
            this._mainChar_Mediator = facade.retrieveMediator(BeiDouQiXingZhen_Mediator.NAME) as BeiDouQiXingZhen_Mediator;
         }
         return this._mainChar_Mediator;
      }
      
      private function get targetPlaneMediator() : BeiDouQiXingZhen_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(BeiDouQiXingZhen_TargetPanelMediator.NAME) as BeiDouQiXingZhen_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([60302,60304,60308,60310],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([60302,60304,60308,60310],NAME);
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
      
      public function received_60302(param1:ByteArray) : void
      {
         var _loc18_:Object = null;
         ZLog.add("60302：返回请求玩家北斗七星阵详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc18_ = new Object();
            _loc18_.name = param1.readUTF();
            _loc18_.qianti = param1.readUTF();
            _loc18_.miaoshu = param1.readUTF();
            _loc18_.learn = param1.readByte();
            _loc18_.skill = param1.readInt();
            _loc18_.xiaoguo = param1.readUTF();
            _loc5_.push(_loc18_);
            _loc6_++;
         }
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         var _loc12_:int = param1.readInt();
         var _loc13_:int = param1.readInt();
         var _loc14_:Boolean = Boolean(param1.readByte());
         var _loc15_:Boolean = Boolean(param1.readByte());
         var _loc16_:Boolean = Boolean(param1.readByte());
         var _loc17_:Boolean = Boolean(param1.readByte());
         if(_loc2_ == -1)
         {
            this.mainChar_Mediator.setPanel(_loc3_,_loc4_,_loc5_,_loc7_,_loc8_,_loc11_,_loc9_,_loc10_,_loc13_,_loc12_,_loc14_,_loc15_,_loc16_,_loc17_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc3_,_loc4_,_loc5_,_loc7_,_loc8_,_loc11_,_loc9_,_loc10_,_loc13_,_loc12_,_loc14_,_loc15_,_loc16_,_loc17_);
         }
      }
      
      public function received_60304(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("60304：返回请求玩家北斗七星阵详细数据");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = new Object();
            _loc6_.skill = param1.readInt();
            _loc6_.status = param1.readByte();
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         this.mainChar_Mediator.setSkills(_loc2_,_loc4_);
      }
      
      public function received_60308(param1:ByteArray) : void
      {
         ZLog.add("60308：返回北斗七星阵请求突破数据");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         this.mainChar_Mediator.setTupoPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
      }
      
      public function received_60310(param1:ByteArray) : void
      {
         ZLog.add("60310: 返回突破北斗七星阵结果");
         var _loc2_:int = param1.readByte();
         this.mainChar_Mediator.setTupoResult(_loc2_);
      }
   }
}

