package com.tgame.moudels.wuxingquan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Wuxingquan_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Wuxingquan_MsgSenderProxy";
      
      public function Wuxingquan_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_54301(param1:* = null) : void
      {
         ZLog.add("54301：五行拳 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(54301,_loc2_);
      }
      
      public function send_54303(param1:* = null) : void
      {
         ZLog.add("54303：五行拳查询请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(54303,_loc2_);
      }
      
      public function send_54305(param1:* = null) : void
      {
         ZLog.add("54305：五行拳领悟请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(54305,_loc2_);
      }
      
      public function send_54307(param1:* = null) : void
      {
         ZLog.add("54307：查看其它人五行拳信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(54307,_loc2_);
      }
   }
}

