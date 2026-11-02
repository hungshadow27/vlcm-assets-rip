package com.tgame.moudels.jileizhi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.jileizhi.view.JiLeiZhi_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JiLeiZhi_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "MonthSignIn_MsgReceivedProxy";
      
      private var _jileizhiMediator:JiLeiZhi_Mediator;
      
      public function JiLeiZhi_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      private function get jileizhiMediator() : JiLeiZhi_Mediator
      {
         if(!this._jileizhiMediator)
         {
            this._jileizhiMediator = facade.retrieveMediator(JiLeiZhi_Mediator.NAME) as JiLeiZhi_Mediator;
         }
         return this._jileizhiMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([12132,12134],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([12132,12134],NAME);
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
      
      public function received_12132(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         ZLog.add("12132：返回积累值兑换面板");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc8_ = new Object();
            _loc8_.id = param1.readByte();
            _loc8_.goodid = param1.readInt();
            _loc8_.num = param1.readInt();
            _loc8_.desc = param1.readUTF();
            _loc8_.price = param1.readInt();
            _loc3_.push(_loc8_);
            _loc4_++;
         }
         var _loc5_:int = param1.readInt();
         var _loc6_:String = param1.readUTF();
         var _loc7_:String = param1.readUTF();
         this.jileizhiMediator.showPanel();
         this.jileizhiMediator.setInit(_loc3_,_loc5_,_loc6_,_loc7_);
      }
      
      public function received_60424(param1:ByteArray) : void
      {
         ZLog.add("12134：返回积累值兑换结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
         }
      }
   }
}

