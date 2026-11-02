package com.tgame.common.res.city
{
   public class CityResManager
   {
      
      public static var cityXML:XML;
      
      public function CityResManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         cityXML = XML(param1);
      }
   }
}

