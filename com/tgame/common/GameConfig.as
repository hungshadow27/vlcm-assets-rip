package com.tgame.common
{
   import com.tgame.common.res.map.MapRes;
   import com.tgame.common.vo.login.LoginRoleVO;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class GameConfig
   {
      
      public static var sceneWidth:int;
      
      public static var sceneHeight:int;
      
      public static var fileBaseFolder:String;
      
      public static var program:String;
      
      public static var flashParameters:Object;
      
      public static var decode:Function;
      
      public static var activeServer:String;
      
      public static var resServer:String;
      
      public static var mailServer:String;
      
      public static var shopServer:String;
      
      public static var chatServerIP:String;
      
      public static var chatServerPort:int;
      
      public static var chatServerPortArr:Array;
      
      public static var loginServerIP:String;
      
      public static var loginServerPort:int;
      
      public static var loginServerPortArr:Array;
      
      public static var lineID:int;
      
      public static var lineName:String;
      
      public static var lineServerIP:String;
      
      public static var lineServerPort:int;
      
      public static var lineServerPortArr:Array;
      
      public static var skinXml:XML;
      
      public static var skinSwf:XML;
      
      public static var login:XML;
      
      public static var rsls:XMLList;
      
      public static var xmls:XMLList;
      
      public static var serverTime_onLogin:Number;
      
      public static var localTime_serverTime_D_value:Number;
      
      public static var sever_time_with_10106:String;
      
      public static var gameAccount:int;
      
      public static var loginAuth:String;
      
      public static var loginSign:String;
      
      public static var yunying_serverID:int;
      
      public static var yunying_userID:String;
      
      public static var loginRoleVO:LoginRoleVO;
      
      public static var isChenMi:int;
      
      public static var wantEnterMapRes:MapRes;
      
      public static var frameRate:int = 30;
      
      public static var test_userName:String = "";
      
      public static var test_passWord:String = "";
      
      public static var yunying_chongzhi:String = "";
      
      public static var idCardUrl:String = "";
      
      public static var gotoAdd:String = "";
      
      public static var gameNotice:String = "";
      
      public static var photoUpServer:String = "";
      
      public static var photoDownServer:String = "";
      
      public static var gongcheng_banghuiID_arr:Array = [];
      
      public static var xiangyangcheng_banghuiID:int = 0;
      
      public static var xiangyangcheng_bangzhuID:int = 0;
      
      public static var xiangyangcheng_shuilv:Number = 0;
      
      public static var xuanyuanjian_banghuiIDList:Array = [];
      
      public static var huangZhu_ID:int = 0;
      
      public function GameConfig()
      {
         super();
      }
      
      public static function chongzhi() : void
      {
         navigateToURL(new URLRequest(yunying_chongzhi),"_target");
      }
   }
}

