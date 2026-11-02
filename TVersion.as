package
{
   import com.tgame.common.res.lan.LanResManager;
   import flash.display.*;
   import flash.utils.Dictionary;
   
   public class TVersion extends Sprite
   {
      
      public static const LAN_CN:int = 1;
      
      public static const LAN_FAN:int = 104;
      
      public static const LAN_ML:int = 103;
      
      public static const LAN_YN:int = 1;
      
      public static const LAN_HY:int = 1;
      
      public static const LAN_XJP:int = 21;
      
      public static var VERSION:String = "26.10.02.01(yn)";
      
      public static var BANBENHAO:String = "1";
      
      private static var _resKeyBaseUrl:Dictionary = new Dictionary();
      
      private static var _resKeyVersion:Dictionary = new Dictionary();
      
      public function TVersion()
      {
         super();
      }
      
      public static function get VERSION_LAN() : int
      {
         return Number(BANBENHAO);
      }
      
      public static function get RMB() : String
      {
         switch(VERSION_LAN)
         {
            case LAN_CN:
               return "RMB";
            case LAN_ML:
               return "RM";
            case LAN_YN:
               return "RMB";
            case LAN_HY:
               return "RMB";
            case LAN_ML:
               return "RM";
            case LAN_FAN:
               return "昆侖幣";
            case LAN_XJP:
               return "太子币";
            default:
               return "RMB";
         }
      }
      
      public static function get RMB_2_YUANBAO() : int
      {
         switch(VERSION_LAN)
         {
            case LAN_CN:
               return 10;
            case LAN_ML:
               return 10;
            case LAN_FAN:
               return 10;
            case LAN_XJP:
               return 1;
            default:
               return 10;
         }
      }
      
      public static function addResKeyBaseUrlVersion(param1:String, param2:String, param3:int) : void
      {
         _resKeyBaseUrl[param1] = param2;
         _resKeyVersion[param1] = param3;
      }
      
      public static function getResBaseUrlByKey(param1:String) : String
      {
         return _resKeyBaseUrl[param1] || "";
      }
      
      public static function getResVersionByKey(param1:String) : int
      {
         return int(_resKeyVersion[param1]) || 0;
      }
      
      public static function getResUrlByKey(param1:String) : String
      {
         var _loc2_:String = getResBaseUrlByKey(param1);
         if(_loc2_ == "")
         {
            return "";
         }
         return _loc2_ + "?v=" + getResVersionByKey(param1);
      }
      
      public static function getPingTaiNameById(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 106:
               _loc2_ = LanResManager.getLanCommonTextWords("越南");
               break;
            case 108:
               _loc2_ = LanResManager.getLanCommonTextWords("越南-绿色版");
               break;
            case 110:
               _loc2_ = LanResManager.getLanCommonTextWords("越南szm");
               break;
            case 111:
               _loc2_ = LanResManager.getLanCommonTextWords("越南zp");
               break;
            case 112:
               _loc2_ = LanResManager.getLanCommonTextWords("越南yahoo");
         }
         return _loc2_;
      }
   }
}

