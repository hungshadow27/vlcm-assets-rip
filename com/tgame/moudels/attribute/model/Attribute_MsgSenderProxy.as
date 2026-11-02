package com.tgame.moudels.attribute.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Attribute_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Attribute_MsgSenderProxy";
      
      public function Attribute_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_50601(param1:* = null) : void
      {
         ZLog.add("50601：发送主角加点");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeDouble(param1[0]);
         _loc2_.writeDouble(param1[1]);
         _loc2_.writeDouble(param1[2]);
         _loc2_.writeDouble(param1[3]);
         NetWorkManager.sendMsg(50601,_loc2_);
      }
      
      public function send_20107(param1:* = null) : void
      {
         ZLog.add("20107：发送主角获取其他角色详细消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(20107,_loc2_);
      }
      
      public function send_50215(param1:* = null) : void
      {
         ZLog.add("50215：发送请求TA的经脉");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(50215,_loc2_);
      }
      
      public function send_53011() : void
      {
         ZLog.add("53011：请求激活肉体金身");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53011,_loc1_);
      }
      
      public function send_53811(param1:* = null) : void
      {
         ZLog.add("53811：请求激活洞箫隐藏属性");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53811,_loc2_);
      }
      
      public function send_53813(param1:* = null) : void
      {
         ZLog.add("53813：请求总勋章信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(53813,_loc2_);
      }
      
      public function send_57501(param1:* = null) : void
      {
         ZLog.add("57501\t\t请求激活属性信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(57501,_loc2_);
      }
      
      public function send_52351(param1:* = null) : void
      {
         ZLog.add("52351\t\t请求切换玉佩位置道具显示");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(52351,_loc2_);
      }
      
      public function send_52355(param1:* = null) : void
      {
         ZLog.add("52355\t\t确认更换道具");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeShort(param1[1]);
         NetWorkManager.sendMsg(52355,_loc2_);
      }
   }
}

