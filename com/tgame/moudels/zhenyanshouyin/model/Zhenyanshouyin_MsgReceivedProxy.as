package com.tgame.moudels.zhenyanshouyin.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.zhenyanshouyin.view.Zhenyanshouyin_Mediator;
   import com.tgame.moudels.zhenyanshouyin.view.Zhenyanshouyin_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Zhenyanshouyin_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Zhenyanshouyin_MsgReceivedProxy";
      
      private var _zhenyanshouyin_Mediator:Zhenyanshouyin_Mediator;
      
      private var _targetMediator:Zhenyanshouyin_TargetPanelMediator;
      
      public function Zhenyanshouyin_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function get zhenyanshouyin_Mediator() : Zhenyanshouyin_Mediator
      {
         if(!this._zhenyanshouyin_Mediator)
         {
            this._zhenyanshouyin_Mediator = facade.retrieveMediator(Zhenyanshouyin_Mediator.NAME) as Zhenyanshouyin_Mediator;
         }
         return this._zhenyanshouyin_Mediator;
      }
      
      private function get targetPlaneMediator() : Zhenyanshouyin_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(Zhenyanshouyin_TargetPanelMediator.NAME) as Zhenyanshouyin_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73302,73304],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73302,73304],NAME);
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
      
      public function received_73302(param1:ByteArray) : void
      {
         var _loc16_:Object = null;
         ZLog.add("73302：返回真言手印面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:String = param1.readUTF();
         var _loc5_:int = param1.readByte();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:Number = param1.readDouble();
         var _loc9_:Number = param1.readDouble();
         var _loc10_:Number = param1.readDouble();
         var _loc11_:Number = param1.readDouble();
         var _loc12_:Number = param1.readDouble();
         var _loc13_:int = param1.readByte();
         var _loc14_:Array = [];
         var _loc15_:int = 0;
         while(_loc15_ < _loc13_)
         {
            _loc16_ = new Object();
            _loc16_.skillID = param1.readInt();
            _loc16_.skillName = param1.readUTF();
            _loc16_.skillDesc = param1.readUTF();
            _loc16_.skillBO = param1.readByte();
            _loc14_.push(_loc16_);
            _loc15_++;
         }
         if(_loc2_ == -1)
         {
            this.zhenyanshouyin_Mediator.setData(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc14_);
         }
         else
         {
            this.targetPlaneMediator.setData(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc14_);
         }
      }
      
      public function received_73304(param1:ByteArray) : void
      {
         ZLog.add("73304： 返回真言手印领悟结果");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         this.zhenyanshouyin_Mediator.setTupoResult(_loc2_,_loc3_,_loc4_);
      }
   }
}

