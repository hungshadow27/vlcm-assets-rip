package com.tgame.moudels.XiangLong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XiangLong_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XiangLong_MsgSenderProxy";
      
      public function XiangLong_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_51901(param1:* = null) : void
      {
         ZLog.add("51901：降龙十八掌 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(51901,_loc2_);
      }
      
      public function send_51903(param1:* = null) : void
      {
         ZLog.add("51903：降龙十八掌 领悟面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(51903,_loc2_);
      }
      
      public function send_51905(param1:* = null) : void
      {
         ZLog.add("51905：降龙十八掌 申请领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(51905,_loc2_);
      }
      
      public function send_51907(param1:* = null) : void
      {
         ZLog.add("51907：降龙十八掌 他人面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(51907,_loc2_);
      }
      
      public function send_51909(param1:* = null) : void
      {
         ZLog.add("51909：降龙十八掌 附加技能 移除");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(51909,_loc2_);
      }
      
      public function send_51911(param1:* = null) : void
      {
         ZLog.add("51911：降龙十八掌 附加技能 替换");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1.pos));
         _loc2_.writeInt(int(param1.skillID));
         NetWorkManager.sendMsg(51911,_loc2_);
      }
   }
}

