package game
{
   import game.net.RESLoadManager;
   
   public class UIConfig
   {
      
      private static var _resRootURL:String = "../";
      
      public static var decode:Function = null;
      
      public function UIConfig()
      {
         super();
      }
      
      public static function set ResRootURL(param1:String) : void
      {
         if(param1.charAt(param1.length - 1) !== "/")
         {
            param1 += "/";
         }
         _resRootURL = param1;
      }
      
      public static function get ResRootURL() : String
      {
         return _resRootURL;
      }
      
      public static function set ResType(param1:String) : void
      {
         RESLoadManager.RES_TYPE = "." + param1.toLowerCase();
      }
      
      public static function get ResType() : String
      {
         return RESLoadManager.RES_TYPE.slice(1);
      }
   }
}

