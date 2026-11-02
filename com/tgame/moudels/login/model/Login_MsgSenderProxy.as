package com.tgame.moudels.login.model
{
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Login_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Login_MsgSenderProxy";
      
      public function Login_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_10011(param1:* = null) : void
      {
         ZLog.add("10011：登陆");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1[0]);
         _loc2_.writeUTF(param1[1]);
         NetWorkManager.sendMsg(10011,_loc2_,NetWorkManager.loginSocket);
      }
      
      public function send_40209(param1:* = null) : void
      {
         ZLog.add("40209：获取分线列表");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(40209,_loc2_,NetWorkManager.loginSocket);
      }
      
      public function send_10013(param1:* = null) : void
      {
         ZLog.add("10013：获取角色列表");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10013,_loc2_,NetWorkManager.loginSocket);
      }
      
      public function send_10015(param1:* = null) : void
      {
         ZLog.add("10015：发送创建角色消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1.nickName);
         _loc2_.writeByte(param1.party);
         _loc2_.writeByte(HeadResChange.headResChangeToInt(param1.headImg));
         _loc2_.writeByte(param1.sex);
         NetWorkManager.sendMsg(10015,_loc2_,NetWorkManager.loginSocket);
      }
      
      public function send_10017(param1:* = null) : void
      {
         ZLog.add("10017：发送删除角色消息,角色ID：" + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10017,_loc2_,NetWorkManager.loginSocket);
      }
      
      public function send_10009(param1:* = null) : void
      {
         ZLog.add("10017：发送请求随机名字：" + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(10009,_loc2_,NetWorkManager.loginSocket);
      }
      
      public function send_56001(param1:* = null) : void
      {
         ZLog.add("56001：请求角色恢复面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(56001,_loc2_,NetWorkManager.loginSocket);
      }
      
      public function send_56003(param1:* = null) : void
      {
         ZLog.add("56003：请求角色恢复");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(56003,_loc2_,NetWorkManager.loginSocket);
      }
   }
}

