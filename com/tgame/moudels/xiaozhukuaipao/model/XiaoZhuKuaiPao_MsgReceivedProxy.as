package com.tgame.moudels.xiaozhukuaipao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.xiaozhukuaipao.view.XiaoZhuKuaiPao_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XiaoZhuKuaiPao_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XiaoZhuKuaiPao_MsgReceivedProxy";
      
      private var _mediator:XiaoZhuKuaiPao_Mediator;
      
      public function XiaoZhuKuaiPao_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([79562],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([79562],NAME);
      }
      
      private function get mediator() : XiaoZhuKuaiPao_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(XiaoZhuKuaiPao_Mediator.NAME) as XiaoZhuKuaiPao_Mediator;
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
      
      public function received_79562(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc8_:Object = null;
         var _loc9_:int = 0;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Array = null;
         var _loc14_:int = 0;
         var _loc15_:Object = null;
         ZLog.add("79562：返回小猪详细信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc8_ = new Object();
            _loc8_.id = param1.readInt();
            _loc8_.lingquId = param1.readInt();
            _loc8_.jiangliShuLiang = param1.readInt();
            _loc8_.shuliang = param1.readInt();
            _loc8_.isLingqu = Boolean(param1.readByte() == 1);
            _loc4_.push(_loc8_);
            _loc5_++;
         }
         var _loc6_:int = param1.readInt();
         var _loc7_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc8_ = new Object();
            _loc8_.lingquId = param1.readInt();
            _loc9_ = param1.readInt();
            _loc10_ = [];
            _loc11_ = 0;
            while(_loc11_ < _loc9_)
            {
               _loc15_ = new Object();
               _loc15_.id = param1.readInt();
               _loc15_.jiangliShuLiang = param1.readInt();
               _loc10_.push(_loc15_);
               _loc11_++;
            }
            _loc8_.needArr = _loc10_;
            _loc12_ = param1.readInt();
            _loc13_ = [];
            _loc14_ = 0;
            while(_loc14_ < _loc12_)
            {
               _loc15_ = new Object();
               _loc15_.xiaozhuid = param1.readInt();
               _loc15_.shuliang = param1.readInt();
               _loc13_.push(_loc15_);
               _loc14_++;
            }
            _loc8_.jiangliArr = _loc13_;
            _loc8_.isLingqu = Boolean(param1.readByte() == 1);
            _loc7_.push(_loc8_);
            _loc5_++;
         }
         this.mediator.update(_loc4_,_loc7_);
      }
   }
}

