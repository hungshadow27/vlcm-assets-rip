package com.tgame.manager
{
   import com.tgame.common.net.socket.TSocket;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.manager.TimerManager;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class MsgReSendManager
   {
      
      private static var MAX_TRY_COUNT:int = 2;
      
      private static var MAX_WAIT_TIME:int = 15000;
      
      private static var viMsgDict:Dictionary = new Dictionary();
      
      private static var waitMsgDict:Dictionary = new Dictionary();
      
      private static var timerData:TimerData = TimerManager.createTimer(500,0,checkReSend,null,null,null,false);
      
      public function MsgReSendManager()
      {
         super();
      }
      
      private static function checkReSend() : void
      {
         var _loc1_:Object = null;
         var _loc2_:String = null;
         var _loc3_:int = getTimer();
         for(_loc2_ in waitMsgDict)
         {
            _loc1_ = waitMsgDict[_loc2_];
            if(_loc3_ - _loc1_.addTime >= MAX_WAIT_TIME)
            {
               NetWorkManager.sendMsg(_loc1_.sendCode,_loc1_.sendByteArray,_loc1_.sendSocket);
            }
         }
      }
      
      public static function init() : void
      {
         viMsgDict[10011] = 10012;
         viMsgDict[40209] = 40300;
         viMsgDict[10013] = 10014;
         viMsgDict[10019] = 10020;
         viMsgDict[30101] = 30102;
         viMsgDict[10111] = 51134;
      }
      
      public static function addWaitMsg(param1:int, param2:ByteArray, param3:TSocket) : Boolean
      {
         var _loc5_:Object = null;
         var _loc6_:String = null;
         return true;
      }
      
      public static function removeWaitMsg(param1:int) : void
      {
      }
   }
}

