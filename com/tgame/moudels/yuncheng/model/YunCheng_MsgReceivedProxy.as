package com.tgame.moudels.yuncheng.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.info.TeamInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.login.view.*;
   import com.tgame.moudels.yuncheng.view.YunCheng_Mediator;
   import com.tgame.moudels.yuncheng.view.YunCheng_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YunCheng_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YunCheng_MsgReceivedProxy";
      
      private var _msgSenderProxy:YunCheng_MsgSenderProxy;
      
      private var _YunChengMediator:YunCheng_Mediator;
      
      private var _YunChengTargetMediator:YunCheng_TargetMediator;
      
      public function YunCheng_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get msgSenderProxy() : YunCheng_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(YunCheng_MsgSenderProxy.NAME) as YunCheng_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function get yunChengMediator() : YunCheng_Mediator
      {
         if(!this._YunChengMediator)
         {
            this._YunChengMediator = facade.retrieveMediator(YunCheng_Mediator.NAME) as YunCheng_Mediator;
         }
         return this._YunChengMediator;
      }
      
      private function get yunChengTargetMediator() : YunCheng_TargetMediator
      {
         if(!this._YunChengTargetMediator)
         {
            this._YunChengTargetMediator = facade.retrieveMediator(YunCheng_TargetMediator.NAME) as YunCheng_TargetMediator;
         }
         return this._YunChengTargetMediator;
      }
      
      private function get myTeam() : TeamInfo
      {
         return GameInstance.mainCharData.teamInfo;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([54202,54204,54206],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([54202,54204,54206],NAME);
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
      
      public function received_54202(param1:ByteArray) : void
      {
         var _loc14_:Object = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc2_:ByteArray = param1;
         var _loc3_:Array = new Array();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readByte();
         var _loc6_:int = _loc2_.readByte();
         var _loc7_:int = 1;
         while(_loc7_ <= _loc6_)
         {
            _loc14_ = {};
            _loc14_.id = _loc2_.readByte();
            _loc14_.name = _loc2_.readUTF();
            _loc14_.zhuangtai = _loc2_.readByte();
            _loc15_ = _loc2_.readInt();
            _loc14_.go = new Goods(_loc15_);
            _loc14_.goodNums = _loc2_.readInt();
            _loc14_.qianti = _loc2_.readUTF();
            _loc14_.gongji = _loc2_.readDouble();
            _loc14_.fangyu = _loc2_.readDouble();
            _loc14_.shengming = _loc2_.readDouble();
            _loc14_.neili = _loc2_.readInt();
            _loc14_.tili = _loc2_.readInt();
            _loc14_.miaoshu = _loc2_.readUTF();
            _loc3_.push(_loc14_);
            _loc7_++;
         }
         var _loc8_:Boolean = Boolean(_loc2_.readByte() == 1);
         var _loc9_:Array = [];
         if(_loc8_)
         {
            _loc16_ = _loc2_.readDouble();
            _loc17_ = _loc2_.readDouble();
            _loc18_ = _loc2_.readDouble();
            _loc9_ = [_loc16_,_loc17_,_loc18_];
         }
         var _loc10_:int = _loc2_.readInt();
         var _loc11_:Number = _loc2_.readDouble();
         var _loc12_:Boolean = Boolean(_loc2_.readByte() == 1);
         var _loc13_:Boolean = Boolean(_loc2_.readByte() == 1);
         if(_loc4_ == -1)
         {
            this.yunChengMediator.updateYunChengPanel(_loc3_,_loc8_,_loc9_,_loc5_,_loc10_,_loc11_);
            this.yunChengMediator.setYunChengZuoQi(_loc12_,_loc13_);
         }
         else if(_loc4_ == GameInstance.lookPlayerID)
         {
            this.yunChengTargetMediator.updateYunChengPanel(_loc3_,_loc8_,_loc9_,_loc5_,_loc10_,_loc11_);
            this.yunChengTargetMediator.setYunChengZuoQi(_loc12_,_loc13_);
         }
      }
      
      public function received_54204(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:Boolean = Boolean(_loc2_.readByte() == 1);
         var _loc5_:Array = [];
         if(_loc4_)
         {
            _loc6_ = _loc2_.readDouble();
            _loc7_ = _loc2_.readDouble();
            _loc8_ = _loc2_.readDouble();
            _loc5_ = [_loc6_,_loc7_,_loc8_];
         }
         if(_loc3_ >= 1 && _loc3_ <= 12)
         {
            if(this.yunChengMediator.no == _loc3_)
            {
               this.yunChengMediator.refillYunChengData(_loc3_,_loc4_,_loc5_);
            }
         }
      }
   }
}

