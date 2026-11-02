package com.tgame.moudels.wuduzhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.wuduzhen.view.WuDuZhen_Mediator;
   import com.tgame.moudels.wuduzhen.view.WuDuZhen_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WuDuZhen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "WuDuZhen_MsgReceivedProxy";
      
      private var _WuDuZhenMediator:WuDuZhen_Mediator;
      
      private var _targetWuDuZhenMediator:WuDuZhen_TargetPanelMediator;
      
      public function WuDuZhen_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      private function get WuDuZhenMediator() : WuDuZhen_Mediator
      {
         if(!this._WuDuZhenMediator)
         {
            this._WuDuZhenMediator = facade.retrieveMediator(WuDuZhen_Mediator.NAME) as WuDuZhen_Mediator;
         }
         return this._WuDuZhenMediator;
      }
      
      private function get targetWuDuZhenMediator() : WuDuZhen_TargetPanelMediator
      {
         if(!this._targetWuDuZhenMediator)
         {
            this._targetWuDuZhenMediator = facade.retrieveMediator(WuDuZhen_TargetPanelMediator.NAME) as WuDuZhen_TargetPanelMediator;
         }
         return this._targetWuDuZhenMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([72022,72024,72026],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([72022,72024,72026],NAME);
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
      
      public function received_72022(param1:ByteArray) : void
      {
         var _loc18_:Object = null;
         ZLog.add("72022：返回五毒阵数据信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc18_ = new Object();
            _loc18_.id = param1.readByte();
            _loc18_.lookid = param1.readByte();
            _loc18_.name = param1.readUTF();
            _loc18_.nowid = param1.readByte();
            _loc18_.shengming = param1.readDouble();
            _loc18_.maxShengming = param1.readDouble();
            _loc18_.neili = param1.readDouble();
            _loc18_.maxNeili = param1.readDouble();
            _loc18_.tili = param1.readDouble();
            _loc18_.maxTili = param1.readDouble();
            _loc18_.gongji = param1.readDouble();
            _loc18_.maxGongji = param1.readDouble();
            _loc18_.fangyu = param1.readDouble();
            _loc18_.maxFangyu = param1.readDouble();
            _loc5_.push(_loc18_);
            _loc6_++;
         }
         var _loc7_:Number = param1.readDouble();
         var _loc8_:Number = param1.readDouble();
         var _loc9_:Number = param1.readDouble();
         var _loc10_:Number = param1.readDouble();
         var _loc11_:Number = param1.readDouble();
         var _loc12_:int = param1.readInt();
         var _loc13_:Boolean = Boolean(param1.readByte() == 1);
         var _loc14_:int = param1.readInt();
         var _loc15_:Boolean = Boolean(param1.readByte() == 1);
         var _loc16_:Boolean = Boolean(param1.readByte() == 1);
         var _loc17_:Boolean = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.WuDuZhenMediator.setPanel(_loc3_,_loc5_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_);
         }
         else
         {
            this.targetWuDuZhenMediator.setPanel(_loc3_,_loc5_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_);
         }
      }
      
      public function received_72024(param1:ByteArray) : void
      {
         ZLog.add("72024：返回突破五毒阵面板");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         this.WuDuZhenMediator.setTupoPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
      }
      
      public function received_72026(param1:ByteArray) : void
      {
         ZLog.add("72026：返回突破五毒阵结果");
         var _loc2_:int = param1.readByte();
         this.WuDuZhenMediator.setTupoResult(_loc2_);
      }
   }
}

