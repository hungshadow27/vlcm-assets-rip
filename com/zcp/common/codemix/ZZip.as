package com.zcp.common.codemix
{
   import flash.utils.ByteArray;
   import nochump.util.zip.ZipEntry;
   import nochump.util.zip.ZipFile;
   
   public class ZZip
   {
      
      public function ZZip()
      {
         super();
      }
      
      public static function extractTextFiles(param1:ByteArray, param2:Function = null) : Array
      {
         var _loc6_:int = 0;
         var _loc7_:ZipEntry = null;
         var _loc3_:ByteArray = param1;
         var _loc4_:Array = [];
         var _loc5_:ZipFile = new ZipFile(_loc3_);
         var _loc8_:int = int(_loc5_.entries.length);
         _loc6_ = 0;
         while(_loc6_ < _loc8_)
         {
            _loc7_ = _loc5_.entries[_loc6_];
            _loc3_ = _loc5_.getInput(_loc7_);
            if(param2 != null)
            {
               _loc3_ = param2(_loc3_);
            }
            _loc3_.position = 0;
            _loc4_.push([_loc7_.name,_loc3_.readUTFBytes(_loc3_.bytesAvailable)]);
            _loc6_++;
         }
         return _loc4_;
      }
      
      public static function extractFristTextFileContent(param1:ByteArray, param2:Function = null) : String
      {
         var _loc3_:Array = extractTextFiles(param1,param2);
         if(Boolean(_loc3_) && _loc3_.length > 0)
         {
            return _loc3_[0][1];
         }
         return "";
      }
   }
}

