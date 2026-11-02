package com.tgame.common.res.lan
{
   import flash.display.DisplayObject;
   import flash.utils.getQualifiedClassName;
   
   public class LanResManager
   {
      
      private static var lanNoticeResContainer:Object = new Object();
      
      private static var lanTextResContainer:Object = new Object();
      
      private static var lanOffsetResContainer:Object = new Object();
      
      private static var lanFontResContainer:Object = new Object();
      
      public function LanResManager()
      {
         super();
      }
      
      public static function parseLanNoticeRes(param1:String) : void
      {
         var _loc3_:XML = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc3_ in _loc2_.words.w)
         {
            _loc4_ = _loc3_.@k;
            _loc5_ = _loc3_.toString();
            _loc5_ = _loc5_.replace(/\\n/g,"\n");
            _loc5_ = _loc5_.replace(/\\\"/g,"\"");
            lanNoticeResContainer[_loc4_] = _loc5_;
         }
      }
      
      public static function getLanNotcieWords(param1:*, param2:Array = null) : String
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:RegExp = null;
         var _loc3_:String = lanNoticeResContainer[param1];
         if(param2 != null && param2.length > 0 && _loc3_ != null)
         {
            _loc5_ = int(param2.length);
            _loc4_ = 0;
            while(_loc4_ < _loc5_)
            {
               _loc6_ = new RegExp("\\$" + _loc4_);
               _loc3_ = _loc3_.replace(_loc6_,param2[_loc4_]);
               _loc4_++;
            }
         }
         return _loc3_ || "";
      }
      
      public static function parseLanTextRes(param1:String) : void
      {
         var _loc3_:XML = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         var _loc4_:XMLList = _loc2_.children().t;
         for each(_loc3_ in _loc4_)
         {
            _loc5_ = _loc3_.@k;
            _loc6_ = _loc3_.toString();
            _loc6_ = _loc6_.replace(/\\n/g,"\n");
            _loc6_ = _loc6_.replace(/\\\"/g,"\"");
            lanTextResContainer[_loc5_] = _loc6_;
         }
      }
      
      public static function getLanTextWords(param1:*, param2:*, param3:Array = null, param4:Boolean = true) : String
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:RegExp = null;
         var _loc5_:String = getQualifiedClassName(param1) + "#" + param2;
         var _loc6_:String = lanTextResContainer[_loc5_];
         if(param3 != null && param3.length > 0 && _loc6_ != null)
         {
            _loc8_ = int(param3.length);
            _loc7_ = 0;
            while(_loc7_ < _loc8_)
            {
               _loc9_ = new RegExp("\\$" + _loc7_);
               _loc6_ = _loc6_.replace(_loc9_,param3[_loc7_]);
               _loc7_++;
            }
         }
         _loc6_ ||= "";
         if(!param4)
         {
            _loc6_ = _loc6_.replace(/\<\>/g,"");
            _loc6_ = _loc6_.replace(/<\s*textformat\s*leading\s*=\s*[\'\"]+[\-\d]*[\'\"]+\s*>/gi,"");
            _loc6_ = _loc6_.replace(/<\s*\/\s*textformat\s*>/gi,"");
         }
         return _loc6_;
      }
      
      public static function getLanCommonTextWords(param1:String) : String
      {
         return lanTextResContainer[param1] || "";
      }
      
      public static function parseLanOffsetRes(param1:String) : void
      {
         var _loc3_:XML = null;
         var _loc4_:String = null;
         var _loc5_:LanOffsetData = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc3_ in _loc2_.offsets.o)
         {
            _loc4_ = _loc3_.@k;
            _loc5_ = new LanOffsetData();
            _loc5_.ox = _loc3_.@ox;
            _loc5_.oy = _loc3_.@oy;
            _loc5_.ow = _loc3_.@ow;
            _loc5_.oh = _loc3_.@oh;
            lanOffsetResContainer[_loc4_] = _loc5_;
         }
      }
      
      private static function getLanOffset(param1:*, param2:*) : LanOffsetData
      {
         var _loc3_:String = getQualifiedClassName(param1) + "#" + param2;
         var _loc4_:LanOffsetData = lanOffsetResContainer[_loc3_];
         return (_loc4_) || new LanOffsetData();
      }
      
      public static function updateDobj_lanOffset(param1:*, param2:*, param3:DisplayObject, param4:Boolean = true, param5:Boolean = true, param6:Boolean = false, param7:Boolean = false) : void
      {
         var _loc8_:LanOffsetData = getLanOffset(param1,param2);
         if(param4)
         {
            param3.x += _loc8_.ox;
         }
         if(param5)
         {
            param3.y += _loc8_.oy;
         }
         if(param6)
         {
            param3.width += _loc8_.ow;
         }
         if(param7)
         {
            param3.height += _loc8_.oh;
         }
      }
      
      public static function updateDobjArr_lanOffset(param1:*, param2:Array, param3:Boolean = true, param4:Boolean = true, param5:Boolean = false, param6:Boolean = false) : void
      {
         var _loc7_:Array = null;
         for each(_loc7_ in param2)
         {
            updateDobj_lanOffset(param1,_loc7_[0],_loc7_[1],param3,param4,param5,param6);
         }
      }
      
      public static function parseLanFontRes(param1:String) : void
      {
         var _loc3_:XML = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc3_ in _loc2_.fonts.f)
         {
            _loc4_ = _loc3_.@k;
            _loc5_ = _loc3_.toString();
            if(_loc5_ == "" || _loc5_ == "null")
            {
               _loc5_ = null;
            }
            lanFontResContainer[_loc4_] = _loc5_;
         }
      }
      
      public static function getLanFont(param1:*) : String
      {
         var _loc2_:String = lanFontResContainer[param1];
         return _loc2_ || null;
      }
   }
}

