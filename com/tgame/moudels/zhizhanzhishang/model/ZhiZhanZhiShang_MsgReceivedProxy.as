package com.tgame.moudels.zhizhanzhishang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.zhizhanzhishang.view.ZhiZhanZhiShangLingJiang_Mediator;
   import com.tgame.moudels.zhizhanzhishang.view.ZhiZhanZhiShangTip_Mediator;
   import com.tgame.moudels.zhizhanzhishang.view.ZhiZhanZhiShang_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ZhiZhanZhiShang_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ZhiZhanZhiShang_MsgReceivedProxy";
      
      private var _zzzsMediator:ZhiZhanZhiShang_Mediator;
      
      private var _tipMediator:ZhiZhanZhiShangTip_Mediator;
      
      private var _lingJiangMediator:ZhiZhanZhiShangLingJiang_Mediator;
      
      private var _msgSenderProxy:ZhiZhanZhiShang_MsgSenderProxy;
      
      public function ZhiZhanZhiShang_MsgReceivedProxy()
      {
         super(NAME,data);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([59006,59052,59054,59056,59058,59010,59008],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([59006,59052,59054,59056,59058,59010,59008],NAME);
      }
      
      private function get zzzsMediator() : ZhiZhanZhiShang_Mediator
      {
         if(this._zzzsMediator == null)
         {
            this._zzzsMediator = facade.retrieveMediator(ZhiZhanZhiShang_Mediator.NAME) as ZhiZhanZhiShang_Mediator;
         }
         return this._zzzsMediator;
      }
      
      private function get tipMediator() : ZhiZhanZhiShangTip_Mediator
      {
         if(this._tipMediator == null)
         {
            this._tipMediator = facade.retrieveMediator(ZhiZhanZhiShangTip_Mediator.NAME) as ZhiZhanZhiShangTip_Mediator;
         }
         return this._tipMediator;
      }
      
      private function get lingJiangMediator() : ZhiZhanZhiShangLingJiang_Mediator
      {
         if(this._lingJiangMediator == null)
         {
            this._lingJiangMediator = facade.retrieveMediator(ZhiZhanZhiShangLingJiang_Mediator.NAME) as ZhiZhanZhiShangLingJiang_Mediator;
         }
         return this._lingJiangMediator;
      }
      
      private function get msgSenderProxy() : ZhiZhanZhiShang_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveMediator(ZhiZhanZhiShang_MsgSenderProxy.NAME) as ZhiZhanZhiShang_MsgSenderProxy;
         }
         return this._msgSenderProxy;
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
      
      public function received_59006(param1:ByteArray) : void
      {
         ZLog.add("59006：接收止战之殇结束后领取奖励面板");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readDouble();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.lingJiangMediator.setPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_59008(param1:ByteArray) : void
      {
         ZLog.add("59008：止战之殇有未领取奖励提示");
         this.lingJiangMediator.lingqu();
      }
      
      public function received_59052(param1:ByteArray) : void
      {
         ZLog.add("59052：止战之殇 收到击鼓页面信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         this.zzzsMediator.setZhuWeiPanel(_loc2_,_loc3_);
      }
      
      public function received_59054(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         ZLog.add("59054：止战之殇 收到击鼓");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            _loc3_ = param1.readByte();
            _loc4_ = param1.readInt();
            this.zzzsMediator.setZhuWeiResult(_loc4_,_loc3_);
         }
      }
      
      public function received_59058(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         ZLog.add("59058：止战之殇 收到历史战况");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:Array = [];
         while(_loc7_ < _loc4_)
         {
            _loc6_ = new Object();
            _loc6_.time = param1.readUTF();
            _loc6_.type = param1.readByte();
            _loc6_.killNum = param1.readInt();
            _loc6_.killHurt = param1.readDouble();
            _loc6_.count = param1.readInt();
            _loc5_.push(_loc6_);
            _loc7_++;
         }
         this.zzzsMediator.setHistory(_loc2_,_loc3_,_loc5_);
      }
      
      public function received_59010(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         ZLog.add("59010：止战之殇战场左上角信息提示");
         var _loc2_:Boolean = param1.readByte() == 1;
         if(_loc2_)
         {
            _loc3_ = param1.readInt();
            _loc4_ = param1.readInt();
            _loc5_ = param1.readInt();
            this.tipMediator.setTip(_loc2_,_loc3_,_loc4_,_loc5_);
         }
         else
         {
            this.tipMediator.setTip(_loc2_,0,0,0);
         }
      }
   }
}

