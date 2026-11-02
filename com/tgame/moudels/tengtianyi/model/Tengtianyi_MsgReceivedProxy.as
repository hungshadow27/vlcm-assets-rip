package com.tgame.moudels.tengtianyi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.tengtianyi.model.info.TengtianyiVo;
   import com.tgame.moudels.tengtianyi.view.Tengtianyi_MainMediator;
   import com.tgame.moudels.tengtianyi.view.Tengtianyi_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Tengtianyi_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Tengtianyi_MsgReceivedProxy";
      
      private var _main_Mediator:Tengtianyi_MainMediator;
      
      private var _target_Mediator:Tengtianyi_TargetMediator;
      
      public function Tengtianyi_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([81682,81684,81686],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([81682,81684,81686],NAME);
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
      
      public function get main_Mediator() : Tengtianyi_MainMediator
      {
         if(!this._main_Mediator)
         {
            this._main_Mediator = facade.retrieveMediator(Tengtianyi_MainMediator.NAME) as Tengtianyi_MainMediator;
         }
         return this._main_Mediator;
      }
      
      public function get target_Mediator() : Tengtianyi_TargetMediator
      {
         if(!this._target_Mediator)
         {
            this._target_Mediator = facade.retrieveMediator(Tengtianyi_TargetMediator.NAME) as Tengtianyi_TargetMediator;
         }
         return this._target_Mediator;
      }
      
      public function received_81682(param1:ByteArray) : void
      {
         ZLog.add("81682: 返回玩家翅膀详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:TengtianyiVo = new TengtianyiVo();
         _loc3_.userID = _loc2_;
         _loc3_.lookId = param1.readByte();
         _loc3_.nowId = param1.readByte();
         _loc3_.sum = param1.readByte();
         _loc3_.gongJi = param1.readDouble();
         _loc3_.fangYu = param1.readDouble();
         _loc3_.baoJi = param1.readDouble();
         _loc3_.shanBi = param1.readDouble();
         _loc3_.shengMing = param1.readDouble();
         _loc3_.neili = param1.readDouble();
         _loc3_.tiLi = param1.readDouble();
         var _loc4_:int = param1.readByte();
         _loc3_.skillId = param1.readInt();
         _loc3_.isLearned = param1.readByte() == 1;
         _loc3_.skillId2 = param1.readInt();
         _loc3_.isLearned2 = param1.readByte() == 1;
         _loc3_.isShow = param1.readByte() == 1;
         _loc3_.CurXingXing = param1.readInt();
         _loc3_.MaxXingXing = param1.readInt();
         _loc3_.check1 = param1.readByte();
         _loc3_.check2 = param1.readByte();
         _loc3_.check3 = param1.readByte();
         _loc3_.check4 = param1.readByte();
         if(_loc2_ == -1)
         {
            this.main_Mediator.setTengtianyi(_loc3_);
         }
         else
         {
            this.target_Mediator.setTengtianyi(_loc3_);
         }
      }
      
      public function received_81684(param1:ByteArray) : void
      {
         ZLog.add("81684: 返回翅膀突破数据");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.main_Mediator.setTupoPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_81686(param1:ByteArray) : void
      {
         ZLog.add("81686: 返回突破翅膀结果");
         var _loc2_:int = param1.readByte();
         this.main_Mediator.setTupoResult(_loc2_);
      }
   }
}

