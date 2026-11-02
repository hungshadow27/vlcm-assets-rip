package com.tgame.moudels.baguazhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.baguazhen.view.BaGuaZhen_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BaGuaZhen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "BaGuaZhen_MsgReceivedProxy";
      
      private var _mainChar_Mediator:BaGuaZhen_Mediator;
      
      public function BaGuaZhen_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mainChar_Mediator() : BaGuaZhen_Mediator
      {
         if(!this._mainChar_Mediator)
         {
            this._mainChar_Mediator = facade.retrieveMediator(BaGuaZhen_Mediator.NAME) as BaGuaZhen_Mediator;
         }
         return this._mainChar_Mediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([81832],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([81832],NAME);
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
      
      public function received_81832(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("81832\t\t八卦阵信息返回");
         var _loc2_:Object = new Object();
         _loc2_.arr = new Array();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.index = param1.readByte();
            _loc5_.name = param1.readUTF();
            _loc5_.isJiHuo = param1.readByte();
            _loc5_.tiaojian = param1.readUTF();
            _loc5_.shuxing1 = param1.readDouble();
            _loc5_.shuxing2 = param1.readDouble();
            _loc5_.shuxing3 = param1.readDouble();
            _loc5_.xiaoguo = param1.readUTF();
            _loc2_.arr.push(_loc5_);
            _loc4_++;
         }
         _loc2_.currIndex = param1.readByte();
         this.mainChar_Mediator.setBaGuaZhenData(_loc2_);
      }
   }
}

