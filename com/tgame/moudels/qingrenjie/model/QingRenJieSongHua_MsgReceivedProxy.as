package com.tgame.moudels.qingrenjie.model
{
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.qingrenjie.view.QingRenJieSongHua_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QingRenJieSongHua_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "QingRenJieSongHua_MsgReceivedProxy";
      
      public function QingRenJieSongHua_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([72702,72704],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([72702,72704],NAME);
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
      
      private function get qingrenjiesonghuaMediator() : QingRenJieSongHua_Mediator
      {
         return facade.retrieveMediator(QingRenJieSongHua_Mediator.NAME) as QingRenJieSongHua_Mediator;
      }
      
      public function received_72702(param1:ByteArray) : void
      {
         var _loc7_:Object = null;
         ZLog.add("72702\t\t返回玩家列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readShort();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:Array = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = new Object();
            _loc7_.id = param1.readInt();
            _loc7_.playerName = param1.readUTF();
            _loc7_.level = param1.readShort();
            _loc7_.party = PartyType.getName(param1.readByte());
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         this.qingrenjiesonghuaMediator.wanjiaList(_loc5_,_loc3_);
      }
      
      public function received_72704(param1:ByteArray) : void
      {
         ZLog.add("72704\t\t返回送花面板信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:String = _loc2_.readUTF();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:String = _loc2_.readUTF();
         var _loc6_:int = _loc2_.readByte();
         this.qingrenjiesonghuaMediator.songhuaMianban(_loc3_,_loc4_,_loc5_,_loc6_);
      }
   }
}

