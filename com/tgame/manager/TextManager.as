package com.tgame.manager
{
   public class TextManager
   {
      
      public function TextManager()
      {
         super();
      }
      
      public static function getXMLText(param1:String) : String
      {
         return param1.replace(/</g,"&lt;").replace(/\"/g,"&quot;").replace(/\'/g,"&apos;");
      }
      
      public static function getSBCSLength(param1:String) : int
      {
         return param1.replace(/[^\x00-\xFF]/g,"aa").length;
      }
   }
}

