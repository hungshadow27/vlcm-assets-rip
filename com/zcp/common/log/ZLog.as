package com.zcp.common.log
{
   import com.zcp.common.handler.HandlerThread;
   import com.zcp.manager.HandlerManager;
   import flash.text.TextField;
   
   public class ZLog
   {
      
      public static var max_log_num:Number;
      
      private static var _logArea:TextField;
      
      private static var _logNum:Number;
      
      private static const _logHt:HandlerThread = HandlerManager.creatNewHandlerThread();
      
      public static var enableLog:Boolean = true;
      
      public static var enableTrace:Boolean = true;
      
      public static var enableShowInLogArea:Boolean = false;
      
      public function ZLog()
      {
         super();
      }
      
      public static function init(param1:TextField = null, param2:int = 1000, param3:Boolean = true, param4:Boolean = false) : void
      {
         enableLog = true;
         max_log_num = param2;
         enableTrace = param3;
         enableShowInLogArea = param4;
         _logArea = param1;
         if(_logArea)
         {
            _logArea.text = "";
         }
         _logNum = 0;
      }
      
      public static function add(param1:*) : void
      {
         if(!enableLog)
         {
            return;
         }
         var _loc2_:String = param1 is Array && param1.length > 0 ? param1.slice(" ") : param1;
         if(enableTrace)
         {
            trace(_loc2_);
         }
         if(enableShowInLogArea && _logArea != null)
         {
            _logHt.push(doAdd,[_loc2_],10);
         }
      }
      
      private static function doAdd(param1:*) : void
      {
         var _loc2_:int = 0;
         if(enableShowInLogArea && _logArea != null)
         {
            _logArea.appendText(param1 + "\n");
            ++_logNum;
            while(_logNum > max_log_num)
            {
               _loc2_ = _logArea.text.indexOf("\r");
               _logArea.replaceText(0,_loc2_ != -1 ? int(_loc2_ + 1) : 0,"");
               --_logNum;
            }
         }
      }
   }
}

