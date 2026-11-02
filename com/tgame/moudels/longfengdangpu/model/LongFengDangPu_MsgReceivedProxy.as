package com.tgame.moudels.longfengdangpu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.longfengdangpu.view.LongFengDangPu_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class LongFengDangPu_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "LongFengChaLou_MsgReceivedProxy";
      
      private var _mediator:LongFengDangPu_Mediator;
      
      public function LongFengDangPu_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([79422,79424,79426],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([79422,79424,79426],NAME);
      }
      
      private function get mediator() : LongFengDangPu_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(LongFengDangPu_Mediator.NAME) as LongFengDangPu_Mediator;
         }
         return this._mediator;
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
         }
         else
         {
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_79422(param1:ByteArray) : void
      {
         ZLog.add("79422：龙凤当铺面板信息返回");
         var _loc2_:Number = param1.readDouble();
         var _loc3_:int = param1.readDouble();
         this.mediator.update(_loc2_,_loc3_);
      }
      
      public function received_79424(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("79424：当铺信息返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = new Object();
            _loc5_.id = param1.readInt();
            _loc5_.price = param1.readInt();
            _loc5_.type = param1.readByte() == 1;
            _loc5_.hot = param1.readByte();
            _loc5_.max = param1.readInt();
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.mediator.updateItem(_loc3_);
      }
      
      public function received_79426(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("79426：搜索信息返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = new Object();
            _loc5_.id = param1.readInt();
            _loc5_.price = param1.readInt();
            _loc5_.type = param1.readByte() == 1;
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.mediator.updateiSousuo(_loc3_);
      }
   }
}

