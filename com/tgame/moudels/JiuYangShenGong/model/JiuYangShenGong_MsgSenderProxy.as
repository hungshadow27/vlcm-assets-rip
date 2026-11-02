package com.tgame.moudels.JiuYangShenGong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JiuYangShenGong_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "JiuYangShenGong_MsgSenderProxy";
      
      public function JiuYangShenGong_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_53821(param1:* = null) : void
      {
         ZLog.add("53821：九阳 悟道信息请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53821,_loc2_);
      }
      
      public function send_53823(param1:* = null) : void
      {
         ZLog.add("53823：九阳悟道查询请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53823,_loc2_);
      }
      
      public function send_53825(param1:* = null) : void
      {
         ZLog.add("53825：九阳领悟请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53825,_loc2_);
      }
      
      public function send_53827(param1:* = null) : void
      {
         ZLog.add("53827：查看其它人九阳悟道信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53827,_loc2_);
      }
      
      public function send_53829(param1:* = null) : void
      {
         ZLog.add("53829：主角选定的打坐光环");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53829,_loc2_);
      }
      
      public function send_53831(param1:* = null) : void
      {
         ZLog.add("53831：请求激活九阳神功隐藏属性");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53831,_loc2_);
      }
   }
}

