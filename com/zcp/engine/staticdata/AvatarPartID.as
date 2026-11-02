package com.zcp.engine.staticdata
{
   public class AvatarPartID
   {
      
      public static const BLANK:String = "BLANK";
      
      public static const SHADOW:String = "SHADOW";
      
      public static const SELECTED:String = "SELECTED";
      
      public static const MOUSE:String = "MOUSE";
      
      public function AvatarPartID()
      {
         super();
      }
      
      public static function isValidID(param1:String) : Boolean
      {
         if(param1 == null || param1 == "" || isDefaultKey(param1))
         {
            return false;
         }
         return true;
      }
      
      public static function isDefaultKey(param1:String) : Boolean
      {
         if(param1 == BLANK || param1 == SHADOW || param1 == SELECTED || param1 == MOUSE)
         {
            return true;
         }
         return false;
      }
   }
}

