package com.tgame.common.net.socket
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.errors.IOError;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   
   public class TSocket extends Socket
   {
      
      public static const serverMsgArr:Array = [];
      
      private static var BUFFER_MAX_LENGTH:int = 100000;
      
      private static var MSG_HEAD_MARK:uint = 127;
      
      public var host:String = null;
      
      public var port:uint = 0;
      
      private var msgHead:ByteArray = new ByteArray();
      
      private var bufferByteArray:ByteArray = new ByteArray();
      
      public function TSocket(param1:String = null, param2:int = 0, param3:uint = 127)
      {
         MSG_HEAD_MARK = param3;
         this.msgHead.writeShort(MSG_HEAD_MARK);
         this.addListeners();
         if(this.host != null)
         {
            super();
            this.doConnect(param1,param2);
         }
      }
      
      public function doConnect(param1:String, param2:int = 0) : void
      {
         this.host = param1;
         this.port = param2;
         this.connect(this.host,this.port);
      }
      
      public function doSend(param1:uint, param2:ByteArray) : void
      {
         var sendBytes:ByteArray;
         var $msgCode:uint = param1;
         var $dataArr:ByteArray = param2;
         $dataArr.position = 0;
         sendBytes = new ByteArray();
         this.writeMsgHead(2 + 2 + 4 + $dataArr.length);
         sendBytes.writeBytes(this.msgHead);
         sendBytes.writeInt($msgCode);
         sendBytes.writeBytes($dataArr);
         try
         {
            this.writeBytes(sendBytes);
            flush();
         }
         catch(e:IOError)
         {
            ZLog.add(e.toString());
         }
      }
      
      private function writeMsgHead(param1:uint) : void
      {
         this.msgHead.position = 2;
         this.msgHead.writeShort(param1);
      }
      
      private function addListeners() : void
      {
         if(!hasEventListener(Event.CLOSE))
         {
            addEventListener(Event.CLOSE,this.closeHandler);
            addEventListener(Event.CONNECT,this.connectHandler);
            addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
            addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityErrorHandler);
            addEventListener(ProgressEvent.SOCKET_DATA,this.socketDataHandler);
         }
      }
      
      private function closeHandler(param1:Event) : void
      {
         var _loc2_:TSocketEvent = new TSocketEvent(TSocketEvent.CLOSE);
         dispatchEvent(_loc2_);
      }
      
      private function connectHandler(param1:Event) : void
      {
         var _loc2_:TSocketEvent = new TSocketEvent(TSocketEvent.LOGIN_SUCCESS);
         dispatchEvent(_loc2_);
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         var _loc2_:TSocketEvent = new TSocketEvent(TSocketEvent.LOGIN_FAILURE);
         dispatchEvent(_loc2_);
      }
      
      private function securityErrorHandler(param1:SecurityErrorEvent) : void
      {
         var _loc2_:TSocketEvent = new TSocketEvent(TSocketEvent.LOGIN_FAILURE);
         dispatchEvent(_loc2_);
      }
      
      private function socketDataHandler(param1:ProgressEvent) : void
      {
         var _loc2_:ByteArray = null;
         readBytes(this.bufferByteArray,this.bufferByteArray.length,bytesAvailable);
         if(this.bufferByteArray.length > BUFFER_MAX_LENGTH)
         {
            _loc2_ = new ByteArray();
            this.bufferByteArray.readBytes(_loc2_,0,this.bufferByteArray.bytesAvailable);
            this.bufferByteArray.position = 0;
            this.bufferByteArray.length = 0;
            _loc2_.readBytes(this.bufferByteArray,0,_loc2_.bytesAvailable);
         }
         this.readSocketData();
      }
      
      private function readSocketData() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:ByteArray = null;
         var _loc5_:int = 0;
         while(this.bufferByteArray.bytesAvailable > 4)
         {
            _loc1_ = int(this.bufferByteArray.position);
            _loc2_ = this.bufferByteArray.readShort();
            if(_loc2_ == MSG_HEAD_MARK)
            {
               _loc3_ = this.bufferByteArray.readShort();
               if(_loc3_ - 4 > this.bufferByteArray.bytesAvailable)
               {
                  this.bufferByteArray.position = _loc1_;
                  return;
               }
               _loc4_ = new ByteArray();
               this.bufferByteArray.readBytes(_loc4_,0,_loc3_ - 4);
               _loc5_ = _loc4_.readInt();
               if(NetWorkManager.checkImportantMsg(_loc5_,_loc4_))
               {
                  serverMsgArr.push([_loc5_,_loc4_]);
               }
            }
         }
      }
   }
}

