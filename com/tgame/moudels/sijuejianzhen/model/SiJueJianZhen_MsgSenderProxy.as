package com.tgame.moudels.sijuejianzhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class SiJueJianZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "SiJueJianZhen_MsgSenderProxy";
      
      public function SiJueJianZhen_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_78501(param1:* = null) : void
      {
         ZLog.add("78501：请求玩家四绝剑阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(78501,_loc2_);
      }
      
      public function send_78503(param1:* = null) : void
      {
         ZLog.add("78503：请求四绝剑阵突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(78503,_loc2_);
      }
      
      public function send_78505(param1:* = null) : void
      {
         ZLog.add("78505：请求玩家四绝剑阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(78505,_loc2_);
      }
   }
}

