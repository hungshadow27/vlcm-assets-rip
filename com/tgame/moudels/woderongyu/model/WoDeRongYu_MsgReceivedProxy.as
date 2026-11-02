package com.tgame.moudels.woderongyu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.woderongyu.view.WoDeRongYu_Mediator;
   import com.tgame.moudels.woderongyu.view.WoDeRongYu_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WoDeRongYu_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "WoDeRongYu_MsgReceivedProxy";
      
      private var _mianPanelMediator:WoDeRongYu_Mediator;
      
      private var _targetMediator:WoDeRongYu_TargetMediator;
      
      public function WoDeRongYu_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mianPanelMediator() : WoDeRongYu_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(WoDeRongYu_Mediator.NAME) as WoDeRongYu_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : WoDeRongYu_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(WoDeRongYu_TargetMediator.NAME) as WoDeRongYu_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([71026,71028],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([71026,71028],NAME);
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
            ZLog.add("协议号 " + _loc2_ + "不存在");
         }
      }
      
      public function received_71026(param1:ByteArray) : void
      {
         var _loc7_:Boolean = false;
         ZLog.add("71026：返回我的荣誉面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Object = new Object();
         _loc3_.shenglingnum = param1.readInt();
         _loc3_.biaoshi = param1.readByte();
         _loc3_.name = param1.readUTF();
         _loc3_.dengji = param1.readInt();
         _loc3_.jiacheng = param1.readInt();
         _loc3_.longyuandian = param1.readInt();
         _loc3_.dangqian = param1.readInt();
         _loc3_.zuida = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = Boolean(param1.readByte() == 1);
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.upDataPanel(_loc3_,_loc5_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_,_loc5_);
         }
      }
      
      public function received_71028(param1:ByteArray) : void
      {
         ZLog.add("71028：返回我的龙元点变化");
         var _loc2_:int = param1.readInt();
         this.mianPanelMediator.upDataLongyuandian(_loc2_);
      }
   }
}

