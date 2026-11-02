package com.tgame.common.res.combo
{
   public class ComboResManager
   {
      
      private static var comboXML:XML;
      
      public function ComboResManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         comboXML = XML(param1);
      }
      
      public static function getComboXML(param1:int) : XML
      {
         var _loc2_:int = 0;
         var _loc3_:XMLList = comboXML.children();
         var _loc4_:int = _loc3_.length();
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            if(param1.toString() == _loc3_[_loc2_].@id)
            {
               return _loc3_[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
   }
}

