package com.tgame.moudels.woDeMenPai.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WoDeMenPai_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "WoDeMenPai_MsgSenderProxy";
      
      public static var isMain:Boolean = true;
      
      public function WoDeMenPai_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_72101(param1:* = null) : void
      {
         ZLog.add("72101\t\t请求玩家门派信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(72101,_loc2_);
      }
      
      public function send_72103(param1:* = null) : void
      {
         ZLog.add("72103\t\t请求创建门派");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         NetWorkManager.sendMsg(72103,_loc2_);
      }
      
      public function send_72105(param1:* = null) : void
      {
         ZLog.add("72105\t\t请求贡献金票/元宝");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeDouble(param1);
         NetWorkManager.sendMsg(72105,_loc2_);
      }
      
      public function send_72107(param1:* = null) : void
      {
         ZLog.add("72107\t\t请求弟子出战,收回或者复活");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(72107,_loc2_);
      }
      
      public function send_72109(param1:* = null) : void
      {
         ZLog.add("72109\t\t切换到弟子");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(72109,_loc2_);
      }
      
      public function send_72151(param1:* = null) : void
      {
         ZLog.add("72151\t\t请求玩家传功信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(72151,_loc2_);
      }
      
      public function send_72153(param1:* = null) : void
      {
         ZLog.add("72153\t\t玩家请求开始传功");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(72153,_loc2_);
      }
      
      public function send_72113(param1:* = null) : void
      {
         ZLog.add("72113\t\t弟子请求复活主角");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(72113,_loc2_);
      }
   }
}

