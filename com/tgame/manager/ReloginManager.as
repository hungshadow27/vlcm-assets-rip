package com.tgame.manager
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.login.DisconnectInfo;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.net.SharedObject;
   
   public class ReloginManager
   {
      
      private static var _disconnectInfoObj:SharedObject;
      
      public static var isDing:Boolean = false;
      
      public static var isInGongcheng:Boolean = false;
      
      public static var isInKuafu:Boolean = false;
      
      public static var isKuafu3v3Baominging:Boolean = false;
      
      public static var isInKuafu_To_biWuDaHui:int = 0;
      
      public static var isXiangYangZhanChangBaominging:Boolean = false;
      
      public function ReloginManager()
      {
         super();
      }
      
      public static function init() : void
      {
         try
         {
            _disconnectInfoObj = SharedObject.getLocal("disconnect");
         }
         catch(e:Error)
         {
         }
         addUserEvent();
      }
      
      private static function addUserEvent() : void
      {
         GameInstance.stage.addEventListener(MouseEvent.MOUSE_DOWN,clearInfo_disconnect);
         GameInstance.stage.addEventListener(KeyboardEvent.KEY_DOWN,clearInfo_disconnect);
      }
      
      private static function removeUserEvent() : void
      {
         GameInstance.stage.removeEventListener(MouseEvent.MOUSE_DOWN,clearInfo_disconnect);
         GameInstance.stage.removeEventListener(KeyboardEvent.KEY_DOWN,clearInfo_disconnect);
      }
      
      public static function getInfo_disconnect() : DisconnectInfo
      {
         try
         {
            return DisconnectInfo.fromObject(_disconnectInfoObj.data.disconnectInfo);
         }
         catch(e:Error)
         {
            return null;
         }
      }
      
      public static function isDisconnectRelogin() : Boolean
      {
         var disconnectInfo:DisconnectInfo = null;
         try
         {
            disconnectInfo = getInfo_disconnect();
            if(disconnectInfo == null)
            {
               return false;
            }
            if(disconnectInfo.loginServerIP == GameConfig.loginServerIP && disconnectInfo.yunying_serverID == GameConfig.yunying_serverID && disconnectInfo.yunying_userID == GameConfig.yunying_userID && GameConfig.serverTime_onLogin - disconnectInfo.disconnectTime <= 3600 * 1000)
            {
               return true;
            }
            return false;
         }
         catch(e:Error)
         {
            return false;
         }
      }
      
      public static function clearInfo_disconnect(param1:* = null) : void
      {
         try
         {
            delete _disconnectInfoObj.data.disconnectInfo;
         }
         catch(e:Error)
         {
         }
         removeUserEvent();
      }
      
      private static function saveInfo_disconnect(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:String, param8:String) : void
      {
         var _loc9_:DisconnectInfo = null;
         try
         {
            if(isDing)
            {
               return;
            }
            _loc9_ = new DisconnectInfo();
            _loc9_.loginServerIP = param1;
            _loc9_.yunying_serverID = param2;
            _loc9_.yunying_userID = param3;
            _loc9_.lineID = param4;
            _loc9_.playerID = param5;
            _loc9_.inAfk = param6;
            _loc9_.disconnectTime = new Date().getTime() - GameConfig.localTime_serverTime_D_value;
            _loc9_.userName = param7;
            _loc9_.passWord = param8;
            _disconnectInfoObj.data.disconnectInfo = _loc9_;
            _disconnectInfoObj.flush();
         }
         catch(e:Error)
         {
         }
      }
      
      public static function autoReLoad() : void
      {
         saveInfo_disconnect(GameConfig.loginServerIP,GameConfig.yunying_serverID,GameConfig.yunying_userID,GameConfig.lineID,GameConfig.loginRoleVO.roleID,GameInstance.mainCharData.afkInfo2.isStart ? 1 : 0,GameConfig.test_userName,GameConfig.test_passWord);
         if(ExternalInterface.available)
         {
            ExternalInterface.call("reload");
         }
      }
   }
}

