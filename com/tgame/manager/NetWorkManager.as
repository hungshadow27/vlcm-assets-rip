package com.tgame.manager
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.net.socket.TSocket;
   import com.tgame.common.res.lan.LanResManager;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.observer.Observer;
   import com.zcp.common.observer.ObserverThread;
   import flash.events.Event;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class NetWorkManager
   {
      
      private static var shijian:int;
      
      private static var shangci_shijian:int;
      
      public static var loginSocket:TSocket = new TSocket();
      
      public static var chatSocket:TSocket = new TSocket();
      
      public static var lineSocket:TSocket = new TSocket();
      
      private static const importantMessageList:Array = [10052,10020,30000];
      
      private static var sleepModeRenderTime:int = 1000 / 10;
      
      private static var inSleepMode:Boolean = false;
      
      private static var lastRunTime:int = 0;
      
      private static var _msgObserverThread:ObserverThread = new ObserverThread();
      
      public function NetWorkManager()
      {
         super();
      }
      
      public static function init() : void
      {
         GameInstance.stage.addEventListener(Event.ENTER_FRAME,runReceiveMsgs);
      }
      
      private static function isImportantMessage(param1:int) : Boolean
      {
         return importantMessageList.indexOf(param1) != -1;
      }
      
      public static function checkImportantMsg(param1:int, param2:ByteArray) : Boolean
      {
         var _loc3_:Array = null;
         if(isImportantMessage(param1))
         {
            if(param1 == 10020)
            {
               while(TSocket.serverMsgArr.length > 0)
               {
                  _loc3_ = TSocket.serverMsgArr.shift();
                  receiveMsg(_loc3_[0],_loc3_[1]);
               }
            }
            receiveMsg(param1,param2);
            return false;
         }
         return true;
      }
      
      private static function runReceiveMsgs(param1:Event) : void
      {
         var _loc3_:Array = null;
         var _loc2_:int = getTimer();
         inSleepMode = _loc2_ - lastRunTime > sleepModeRenderTime;
         lastRunTime = _loc2_;
         if(inSleepMode)
         {
            while(TSocket.serverMsgArr.length > 0)
            {
               _loc3_ = TSocket.serverMsgArr.shift();
               receiveMsg(_loc3_[0],_loc3_[1]);
            }
         }
         else
         {
            while(TSocket.serverMsgArr.length > 0)
            {
               _loc3_ = TSocket.serverMsgArr.shift();
               receiveMsg(_loc3_[0],_loc3_[1]);
               if(getTimer() - _loc2_ >= 5)
               {
                  break;
               }
            }
         }
      }
      
      public static function startHeart() : void
      {
         GameInstance.stage.addEventListener(Event.ENTER_FRAME,heartHandle);
      }
      
      public static function stopHeart() : void
      {
         GameInstance.stage.removeEventListener(Event.ENTER_FRAME,heartHandle);
      }
      
      private static function heartHandle(param1:Event = null) : void
      {
         shijian = getTimer() / 1000;
         MovieMonitor.aaaaaa = shijian;
         if(shijian - shangci_shijian >= 20)
         {
            shangci_shijian = shijian;
            MovieMonitor.aaaaaa2 = shangci_shijian;
            if(loginSocket.connected)
            {
               sendMsg(40301,new ByteArray(),loginSocket);
            }
            if(chatSocket.connected)
            {
               sendMsg(40301,new ByteArray(),chatSocket);
            }
            if(lineSocket.connected)
            {
               sendMsg(40301,new ByteArray(),lineSocket);
            }
         }
      }
      
      public static function connectLogin() : void
      {
         loginSocket.doConnect(GameConfig.loginServerIP,GameConfig.loginServerPort);
      }
      
      public static function connectChat() : void
      {
         chatSocket.doConnect(GameConfig.chatServerIP,GameConfig.chatServerPort);
      }
      
      public static function connectLine() : void
      {
         lineSocket.doConnect(GameConfig.lineServerIP,GameConfig.lineServerPort);
      }
      
      public static function readGILMsg(param1:ByteArray) : String
      {
         var _loc4_:int = 0;
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc5_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_.push(param1.readUTF());
            _loc4_++;
         }
         var _loc6_:String = LanResManager.getLanNotcieWords(_loc2_,_loc5_);
         if(_loc6_ == "")
         {
            ZLog.add("没有找到对应的国际化提示内容:" + _loc2_);
            return LanResManager.getLanCommonTextWords("提示码：") + _loc2_;
         }
         return _loc6_;
      }
      
      public static function registerMsg(param1:int, param2:Function, param3:*) : void
      {
         var _loc4_:Observer = new Observer(param2,param3);
         _msgObserverThread.registerObserver(param1,_loc4_);
      }
      
      public static function registerMsgs(param1:Array, param2:Function, param3:*) : void
      {
         var _loc4_:* = undefined;
         for each(_loc4_ in param1)
         {
            registerMsg(_loc4_,param2,param3);
         }
      }
      
      public static function removeMsg(param1:int, param2:*) : void
      {
         _msgObserverThread.removeObserver(param1,param2);
      }
      
      public static function removeMsgs(param1:Array, param2:*) : void
      {
         var _loc3_:* = undefined;
         for each(_loc3_ in param1)
         {
            removeMsg(_loc3_,param2);
         }
      }
      
      public static function receiveMsg(param1:int, param2:ByteArray) : void
      {
         ZLog.add("收到消息：" + param1);
         MsgReSendManager.removeWaitMsg(param1);
         var _loc3_:ByteArray = param1 >= 10000 ? decodeData(param2) : param2;
         var _loc4_:Notification = new Notification(param1,_loc3_);
         _msgObserverThread.notifyObservers(_loc4_);
      }
      
      public static function sendMsg(param1:int, param2:ByteArray, param3:TSocket = null) : void
      {
         var _loc4_:TSocket = null;
         var _loc5_:ByteArray = null;
         ZLog.add("发送消息：" + param1);
         if(MsgReSendManager.addWaitMsg(param1,param2,param3))
         {
            _loc4_ = param3 || lineSocket;
            _loc5_ = param1 >= 10000 ? encodeData(param2) : param2;
            _loc4_.doSend(param1,_loc5_);
         }
      }
      
      private static function decodeData(param1:ByteArray) : ByteArray
      {
         var _loc2_:ByteArray = new ByteArray();
         while(param1.bytesAvailable)
         {
            _loc2_.writeByte(~param1.readByte());
         }
         _loc2_.position = 0;
         return _loc2_;
      }
      
      private static function encodeData(param1:ByteArray) : ByteArray
      {
         param1.position = 0;
         var _loc2_:ByteArray = new ByteArray();
         while(param1.bytesAvailable)
         {
            _loc2_.writeByte(~param1.readByte());
         }
         _loc2_.position = 0;
         return _loc2_;
      }
      
      public static function receiveLocalMsg(param1:int, param2:ByteArray) : void
      {
         ZLog.add("接收本地调试消息：" + param1);
         var _loc3_:Notification = new Notification(param1,param2);
         _msgObserverThread.notifyObservers(_loc3_);
      }
   }
}

