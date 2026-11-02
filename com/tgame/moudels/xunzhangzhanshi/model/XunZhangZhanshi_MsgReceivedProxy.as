package com.tgame.moudels.xunzhangzhanshi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.xunzhangzhanshi.view.XunZhangZhanshi_Huodong_TargetMediator;
   import com.tgame.moudels.xunzhangzhanshi.view.XunZhangZhanshi_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XunZhangZhanshi_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XunZhangZhanshi_MsgReceivedProxy";
      
      private var _xunZhang_Mediator:XunZhangZhanshi_Mediator;
      
      private var _targetXunZhang_Mediator:XunZhangZhanshi_Huodong_TargetMediator;
      
      public function XunZhangZhanshi_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([81610],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([81610],NAME);
      }
      
      private function get xunZhangMediator() : XunZhangZhanshi_Mediator
      {
         if(this._xunZhang_Mediator == null)
         {
            this._xunZhang_Mediator = facade.retrieveMediator(XunZhangZhanshi_Mediator.NAME) as XunZhangZhanshi_Mediator;
         }
         return this._xunZhang_Mediator;
      }
      
      private function get targetXunZhangMediator() : XunZhangZhanshi_Huodong_TargetMediator
      {
         if(this._targetXunZhang_Mediator == null)
         {
            this._targetXunZhang_Mediator = facade.retrieveMediator(XunZhangZhanshi_Huodong_TargetMediator.NAME) as XunZhangZhanshi_Huodong_TargetMediator;
         }
         return this._targetXunZhang_Mediator;
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
      
      public function received_81610(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         ZLog.add("81610：初始化勋章展示面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc8_ = {};
            _loc8_.id = param1.readInt();
            _loc8_.huode = param1.readByte();
            _loc4_.push(_loc8_);
            _loc5_++;
         }
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         if(_loc2_ == -1)
         {
            this.xunZhangMediator.pageNow = _loc6_;
            this.xunZhangMediator.pageTotal = _loc7_;
            this.xunZhangMediator.setXunzhangDuiHuanPanel(_loc4_);
            this.xunZhangMediator.setPageCount(_loc6_,_loc7_);
         }
         else
         {
            this.targetXunZhangMediator.pageNow = _loc6_;
            this.targetXunZhangMediator.pageTotal = _loc7_;
            this.targetXunZhangMediator.setXunzhangDuiHuanPanel(_loc4_);
            this.targetXunZhangMediator.setPageCount(_loc6_,_loc7_);
         }
      }
   }
}

