package com.tgame.moudels.shibatongren.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ShiBaTongRen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "ShiBaTongRen_MsgSenderProxy";
      
      public function ShiBaTongRen_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_54501(param1:* = null) : void
      {
         ZLog.add("54501：十八铜人阵 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1.userID));
         _loc2_.writeByte(int(param1.skillID));
         NetWorkManager.sendMsg(54501,_loc2_);
      }
      
      public function send_54503(param1:* = null) : void
      {
         ZLog.add("54503：十八铜人阵 闯关查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(54503,_loc2_);
      }
      
      public function send_54505(param1:* = null) : void
      {
         ZLog.add("54505：十八铜人阵 申请闯关");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(54505,_loc2_);
      }
   }
}

