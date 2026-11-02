package com.tgame.moudels.qingrenjiesonghuabang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.qingrenjiesonghuabang.view.QingRenJieSongHuaBang_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QingRenJieSongHuaBang_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "QingRenJieSongHuaBang_MsgReceivedProxy";
      
      public function QingRenJieSongHuaBang_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([72708],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([72708],NAME);
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
      
      private function get qingrenjiesonghuaBangMediator() : QingRenJieSongHuaBang_Mediator
      {
         return facade.retrieveMediator(QingRenJieSongHuaBang_Mediator.NAME) as QingRenJieSongHuaBang_Mediator;
      }
      
      public function received_72708(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         ZLog.add("72708\t\t返回玩家列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:Number = _loc2_.readDouble();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readByte();
         var _loc7_:Array = [];
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            _loc9_ = new Object();
            _loc9_.paiming = param1.readInt();
            _loc9_.id = param1.readInt();
            _loc9_.name = param1.readUTF();
            _loc9_.num = param1.readDouble();
            _loc7_.push(_loc9_);
            _loc8_++;
         }
         this.qingrenjiesonghuaBangMediator.setSonghuabang(_loc7_,_loc3_,_loc4_,_loc5_);
      }
   }
}

