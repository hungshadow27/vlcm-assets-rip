package com.tgame.moudels.emozhiyi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class EMoZhiYi_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "EMoZhiYi_MsgSenderProxy";
      
      public function EMoZhiYi_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_70501(param1:* = null) : void
      {
         ZLog.add("70501：请求玩家翅膀详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(70501,_loc2_);
      }
      
      public function send_70503(param1:* = null) : void
      {
         ZLog.add("70503：玩家请求翅膀突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70503,_loc2_);
      }
      
      public function send_70505(param1:* = null) : void
      {
         ZLog.add("70505\t\t请求突破翅膀");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70505,_loc2_);
      }
   }
}

