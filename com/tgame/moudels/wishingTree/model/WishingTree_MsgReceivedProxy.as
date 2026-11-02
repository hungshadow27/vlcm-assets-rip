package com.tgame.moudels.wishingTree.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.wishingTree.view.WishingTree_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WishingTree_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "WishingTree_MsgReceivedProxy";
      
      private var _wishingTreeMediator:WishingTree_Mediator;
      
      public function WishingTree_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      private function get wishingTreeMediator() : WishingTree_Mediator
      {
         if(!this._wishingTreeMediator)
         {
            this._wishingTreeMediator = facade.retrieveMediator(WishingTree_Mediator.NAME) as WishingTree_Mediator;
         }
         return this._wishingTreeMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73032,73034,73036,73038,73042],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73032,73034,73036,73038,73042],NAME);
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
      
      public function received_73032(param1:ByteArray) : void
      {
         ZLog.add("73032：返回许愿树面板信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readByte();
         var _loc8_:int = param1.readInt();
         this.wishingTreeMediator.setinit(_loc2_,_loc3_,_loc6_,_loc4_,_loc5_,_loc8_,_loc7_);
      }
      
      public function received_73034(param1:ByteArray) : void
      {
         ZLog.add("73034：返回浇水成功");
         var _loc2_:Boolean = param1.readByte() == 1 ? true : false;
         if(_loc2_)
         {
            this.wishingTreeMediator.LoadingBar();
         }
      }
      
      public function received_73036(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("73036：返回好友浇水面板");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = new Object();
            _loc5_.id = param1.readInt();
            _loc5_.name = param1.readUTF();
            _loc5_.state = param1.readByte();
            _loc5_.treeID = param1.readInt();
            _loc5_.x = param1.readInt();
            _loc5_.y = param1.readInt();
            _loc5_.sceneID = param1.readInt();
            _loc5_.desc = param1.readUTF();
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.wishingTreeMediator.initFri(_loc3_);
      }
      
      public function received_73038(param1:ByteArray) : void
      {
         ZLog.add("73038：返回玩家浇水记录");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = _loc2_.lastIndexOf(";");
         if(_loc3_ == _loc2_.length - 1)
         {
            _loc2_ = _loc2_.substr(0,_loc2_.length - 1);
         }
         this.wishingTreeMediator.initRec(_loc2_);
      }
      
      public function received_73042(param1:ByteArray) : void
      {
         ZLog.add("73042：返回许愿树位置");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         this.wishingTreeMediator.gotoTree(_loc5_,_loc3_,_loc4_,_loc2_);
      }
   }
}

