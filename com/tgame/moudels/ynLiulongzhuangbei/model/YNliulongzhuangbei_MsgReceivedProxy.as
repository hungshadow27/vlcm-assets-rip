package com.tgame.moudels.ynLiulongzhuangbei.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ynLiulongzhuangbei.view.YNliulongzhuangbeiTarget_Mediator;
   import com.tgame.moudels.ynLiulongzhuangbei.view.YNliulongzhuangbei_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNliulongzhuangbei_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YNliulongzhuangbei_MsgReceivedProxy";
      
      private var _mediator:YNliulongzhuangbei_Mediator;
      
      private var _targetmediator:YNliulongzhuangbeiTarget_Mediator;
      
      public function YNliulongzhuangbei_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([80482,83192,83362],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([80482,83192,83362],NAME);
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
      
      private function get mediator() : YNliulongzhuangbei_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YNliulongzhuangbei_Mediator.NAME) as YNliulongzhuangbei_Mediator;
         }
         return this._mediator;
      }
      
      private function get targetmediator() : YNliulongzhuangbeiTarget_Mediator
      {
         if(!this._targetmediator)
         {
            this._targetmediator = facade.retrieveMediator(YNliulongzhuangbeiTarget_Mediator.NAME) as YNliulongzhuangbeiTarget_Mediator;
         }
         return this._targetmediator;
      }
      
      public function received_80482(param1:ByteArray) : void
      {
         ZLog.add("80482：返回显示聚宝盆面板");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         this.mediator.setData(String(_loc2_),String(_loc3_));
      }
      
      public function received_83192(param1:ByteArray) : void
      {
         ZLog.add("83192：返回精灵气旋");
         var _loc2_:Object = new Object();
         _loc2_.playerID = param1.readInt();
         _loc2_.goodsID = param1.readInt();
         if(_loc2_.playerID == -1)
         {
            this.mediator.setYNJingLing(_loc2_);
         }
         else
         {
            this.targetmediator.setYNJingLing(_loc2_);
         }
      }
      
      public function received_83362(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("83362：返回归魂");
         var _loc2_:Object = new Object();
         _loc2_.playerID = param1.readInt();
         _loc2_.level = param1.readInt();
         _loc2_.num = param1.readInt();
         _loc2_.skillLevel = param1.readInt();
         _loc2_.numT = param1.readInt();
         _loc2_.bao = param1.readInt();
         _loc2_.shan = param1.readInt();
         _loc2_.wg = param1.readInt();
         _loc2_.wf = param1.readInt();
         var _loc3_:int = param1.readByte();
         _loc2_.arr = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.goodsID = param1.readInt();
            _loc5_.index = param1.readInt();
            _loc5_.isActve = param1.readByte();
            _loc2_.arr.push(_loc5_);
            _loc4_++;
         }
         _loc2_.selectedSkillId = param1.readInt();
         if(_loc2_.playerID == -1)
         {
            this.mediator.setYNGuiHun(_loc2_);
         }
         else
         {
            this.targetmediator.setYNGuiHun(_loc2_);
         }
      }
   }
}

