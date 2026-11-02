package com.tgame.moudels.nitaCyclone.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class NitaCyclone_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "NitaCyclone_MsgSenderProxy";
      
      public function NitaCyclone_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_53151(param1:* = null) : void
      {
         ZLog.add("53151：丹田信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53151,_loc2_);
      }
      
      public function send_53153(param1:* = null) : void
      {
         ZLog.add("53153：丹田进阶信息请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53153,_loc2_);
      }
      
      public function send_53155(param1:* = null) : void
      {
         ZLog.add("53155：请求进阶");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53155,_loc2_);
      }
      
      public function send_53157(param1:* = null) : void
      {
         ZLog.add("53157：查看他人丹田");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53157,_loc2_);
      }
      
      public function send_53159(param1:* = null) : void
      {
         ZLog.add("53159：使用丹田武学丹学习技能");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53159,_loc2_);
      }
      
      public function send_53161(param1:* = null) : void
      {
         ZLog.add("53161：获取丹田武学丹学习技能信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53161,_loc2_);
      }
      
      public function send_53013(param1:* = null) : void
      {
         ZLog.add("53013：激活丹田隐藏属性");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53013,_loc2_);
      }
      
      public function send_53163(param1:* = null) : void
      {
         ZLog.add("53163：请求丹田激活进阶面板数据");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53163,_loc2_);
      }
      
      public function send_53165(param1:* = null) : void
      {
         ZLog.add("53165：请求丹田激活");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53165,_loc2_);
      }
      
      public function send_53169(param1:* = null) : void
      {
         ZLog.add("53169：越南特殊定制  气旋勾选状态 ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(53169,_loc2_);
      }
   }
}

