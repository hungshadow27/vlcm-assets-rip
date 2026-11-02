package com.tgame.moudels.xunzhangduihuan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.xunzhangduihuan.view.XunZhangDuiHuan_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XunZhangDuiHuan_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XunZhangDuiHuan_MsgReceivedProxy";
      
      private var _xunZhangDuiHuan_Mediator:XunZhangDuiHuan_Mediator;
      
      public function XunZhangDuiHuan_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([59652,59656],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([59652,59656],NAME);
      }
      
      private function get xunZhangDuiHuanMediator() : XunZhangDuiHuan_Mediator
      {
         if(this._xunZhangDuiHuan_Mediator == null)
         {
            this._xunZhangDuiHuan_Mediator = facade.retrieveMediator(XunZhangDuiHuan_Mediator.NAME) as XunZhangDuiHuan_Mediator;
         }
         return this._xunZhangDuiHuan_Mediator;
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
      
      public function received_59652(param1:ByteArray) : void
      {
         var _loc7_:Object = null;
         ZLog.add("59652：初始化勋章兑换面板信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc7_ = {};
            _loc7_.id = param1.readInt();
            _loc7_.huode = param1.readByte();
            _loc3_.push(_loc7_);
            _loc4_++;
         }
         var _loc5_:int = param1.readInt();
         this.xunZhangDuiHuanMediator.pageNow = _loc5_;
         var _loc6_:int = param1.readInt();
         this.xunZhangDuiHuanMediator.pageTotal = _loc6_;
         this.xunZhangDuiHuanMediator.setXunzhangDuiHuanPanel(_loc3_);
         this.xunZhangDuiHuanMediator.setPageCount(_loc5_,_loc6_);
      }
      
      public function received_59656(param1:ByteArray) : void
      {
         ZLog.add("59656：领奖结果返回");
         var _loc2_:int = param1.readByte();
      }
   }
}

