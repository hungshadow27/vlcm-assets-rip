package com.tgame.moudels.biwuzhaoqin.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BiWuZhaoQin_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "BiWuZhaoQin_MsgSenderProxy";
      
      public function BiWuZhaoQin_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_61501(param1:* = null) : void
      {
         ZLog.add("61501：比武招亲面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(61501,_loc2_);
      }
      
      public function send_61503(param1:* = null) : void
      {
         ZLog.add("61503：请入比武招亲场地");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(61503,_loc2_);
      }
      
      public function send_61505(param1:* = null) : void
      {
         ZLog.add("61505：提交抢绣球");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(61505,_loc2_);
      }
   }
}

