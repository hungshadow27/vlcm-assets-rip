package com.tgame.moudels.ynHuangdaoZhuanpan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ynHuangdaoZhuanpan.view.YNhuangdaozhuanpanTarget_Mediator;
   import com.tgame.moudels.ynHuangdaoZhuanpan.view.YNhuangdaozhuanpan_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNhuangdaozhuanpan_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YNhuangdaozhuanpan_MsgReceivedProxy";
      
      private var _mediator:YNhuangdaozhuanpan_Mediator;
      
      private var _mediatorTaren:YNhuangdaozhuanpanTarget_Mediator;
      
      public function YNhuangdaozhuanpan_MsgReceivedProxy()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74276],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74276],NAME);
      }
      
      private function get mediator() : YNhuangdaozhuanpan_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YNhuangdaozhuanpan_Mediator.NAME) as YNhuangdaozhuanpan_Mediator;
         }
         return this._mediator;
      }
      
      private function get mediatorTaren() : YNhuangdaozhuanpanTarget_Mediator
      {
         if(!this._mediatorTaren)
         {
            this._mediatorTaren = facade.retrieveMediator(YNhuangdaozhuanpanTarget_Mediator.NAME) as YNhuangdaozhuanpanTarget_Mediator;
         }
         return this._mediatorTaren;
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
      
      public function received_74276(param1:ByteArray) : void
      {
         ZLog.add("74276：返回勋章面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         while(_loc8_ < _loc4_)
         {
            _loc5_[_loc8_] = param1.readByte();
            if(_loc5_[_loc8_] == 1)
            {
               _loc7_++;
            }
            if(_loc3_ == 3)
            {
               _loc6_[_loc8_] = param1.readInt();
            }
            if(_loc3_ == 4)
            {
               _loc6_[_loc8_] = param1.readInt();
            }
            _loc8_++;
         }
         if(_loc2_ == -1)
         {
            if(_loc3_ == 1)
            {
               this.mediator.showCharAttribute_Huangdao(_loc2_,_loc5_,_loc7_);
            }
            else if(_loc3_ == 2)
            {
               this.mediator.showCharAttribute_Zhuanpan(_loc2_,_loc5_,_loc7_);
            }
            else if(_loc3_ == 3)
            {
               this.mediator.showCharAttribute_WZZB(_loc2_,_loc5_,_loc7_,_loc6_);
            }
            else if(_loc3_ == 4)
            {
               this.mediator.showCharAttribute_FSZB(_loc2_,_loc5_,_loc7_,_loc6_);
            }
         }
         else if(_loc3_ == 1)
         {
            this.mediatorTaren.showCharAttribute_Huangdao(_loc2_,_loc5_,_loc7_);
         }
         else if(_loc3_ == 2)
         {
            this.mediatorTaren.showCharAttribute_Zhuanpan(_loc2_,_loc5_,_loc7_);
         }
         else if(_loc3_ == 3)
         {
            this.mediatorTaren.showCharAttribute_WZZB(_loc2_,_loc5_,_loc7_,_loc6_);
         }
         else if(_loc3_ == 3)
         {
            this.mediatorTaren.showCharAttribute_FSZB(_loc2_,_loc5_,_loc7_,_loc6_);
         }
      }
   }
}

