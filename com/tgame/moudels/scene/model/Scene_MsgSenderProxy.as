package com.tgame.moudels.scene.model
{
   import com.tgame.common.GameConfig;
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Scene_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Scene_MsgSenderProxy";
      
      public function Scene_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_10105(param1:* = null) : void
      {
         ZLog.add("10105：请求进入分线服务器");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(GameConfig.gameAccount);
         _loc2_.writeInt(GameConfig.loginRoleVO.roleID);
         _loc2_.writeUTF(GameConfig.loginAuth);
         _loc2_.writeUTF(GameConfig.loginSign);
         _loc2_.writeByte(GameConfig.lineID);
         NetWorkManager.sendMsg(10105,_loc2_);
      }
      
      public function send_30101(param1:* = null) : void
      {
         ZLog.add("30101：发送进入聊天服务器");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(GameConfig.lineID);
         _loc2_.writeInt(GameConfig.loginRoleVO.roleID);
         _loc2_.writeUTF(GameConfig.loginRoleVO.nickName);
         _loc2_.writeInt(GameConfig.gameAccount);
         _loc2_.writeUTF(GameConfig.loginAuth);
         _loc2_.writeUTF(GameConfig.loginSign);
         NetWorkManager.sendMsg(30101,_loc2_,NetWorkManager.chatSocket);
      }
      
      public function send_10019(param1:* = null) : void
      {
         var ba:ByteArray;
         var key:String;
         var password:String;
         var $data:* = param1;
         var getPassword:Function = function(param1:String, param2:String):String
         {
            return ZMD5.calculate(param1 + param2);
         };
         var getKey:Function = function(param1:String, param2:String):String
         {
            return ZMD5.calculate(param1 + param2 + "4728!!_rd#$@sfdhpp++!}{fff");
         };
         ZLog.add("10019：发送请求进入场景");
         ba = new ByteArray();
         key = getKey(GameConfig.sever_time_with_10106,String(GameConfig.loginRoleVO.roleID));
         password = getPassword(GameConfig.sever_time_with_10106,key);
         ba.writeUTF(GameConfig.sever_time_with_10106);
         ba.writeUTF(password);
         NetWorkManager.sendMsg(10019,ba);
      }
      
      public function send_10021(param1:* = null) : void
      {
         ZLog.add("10021：发送加载场景地图成功消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeDouble(getTimer());
         NetWorkManager.sendMsg(10021,_loc2_);
      }
   }
}

