package com.tgame.common.vo.login
{
   public class DisconnectInfo
   {
      
      public var userName:String;
      
      public var passWord:String;
      
      public var loginServerIP:String;
      
      public var yunying_serverID:int;
      
      public var yunying_userID:String;
      
      public var lineID:int;
      
      public var playerID:int;
      
      public var inAfk:int;
      
      public var disconnectTime:Number;
      
      public function DisconnectInfo()
      {
         super();
      }
      
      public static function fromObject(param1:Object) : DisconnectInfo
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:DisconnectInfo = new DisconnectInfo();
         _loc2_.userName = param1.userName;
         _loc2_.passWord = param1.passWord;
         _loc2_.loginServerIP = param1.loginServerIP;
         _loc2_.yunying_serverID = param1.yunying_serverID;
         _loc2_.yunying_userID = param1.yunying_userID;
         _loc2_.lineID = param1.lineID;
         _loc2_.playerID = param1.playerID;
         _loc2_.inAfk = param1.inAfk;
         _loc2_.disconnectTime = param1.disconnectTime;
         return _loc2_;
      }
   }
}

