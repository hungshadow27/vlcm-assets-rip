package com.tgame.moudels.emozhiyi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.chiBang.view.YuLingHeCheng_mediator;
   import com.tgame.moudels.emozhiyi.model.info.EMoZhiYiVo;
   import com.tgame.moudels.emozhiyi.view.EMoZhiYi_MainMediator;
   import com.tgame.moudels.emozhiyi.view.EMoZhiYi_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class EMoZhiYi_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "EMoZhiYi_MsgReceivedProxy";
      
      private var _main_Mediator:EMoZhiYi_MainMediator;
      
      private var _target_Mediator:EMoZhiYi_TargetMediator;
      
      private var _heCheng_Mediator:YuLingHeCheng_mediator;
      
      public function EMoZhiYi_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([70502,70504,70506],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([70502,70504,70506],NAME);
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
      
      public function get main_Mediator() : EMoZhiYi_MainMediator
      {
         if(!this._main_Mediator)
         {
            this._main_Mediator = facade.retrieveMediator(EMoZhiYi_MainMediator.NAME) as EMoZhiYi_MainMediator;
         }
         return this._main_Mediator;
      }
      
      public function get target_Mediator() : EMoZhiYi_TargetMediator
      {
         if(!this._target_Mediator)
         {
            this._target_Mediator = facade.retrieveMediator(EMoZhiYi_TargetMediator.NAME) as EMoZhiYi_TargetMediator;
         }
         return this._target_Mediator;
      }
      
      public function get heCheng_Mediator() : YuLingHeCheng_mediator
      {
         if(!this._heCheng_Mediator)
         {
            this._heCheng_Mediator = facade.retrieveMediator(YuLingHeCheng_mediator.NAME) as YuLingHeCheng_mediator;
         }
         return this._heCheng_Mediator;
      }
      
      public function received_70502(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("70502: 返回玩家翅膀详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:EMoZhiYiVo = new EMoZhiYiVo();
         _loc3_.userID = _loc2_;
         _loc3_.lookId = param1.readByte();
         _loc3_.nowId = param1.readByte();
         _loc3_.goodsName = param1.readUTF();
         _loc3_.sum = param1.readByte();
         _loc3_.nameArr = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.sum)
         {
            _loc5_ = new Object();
            _loc5_.name = param1.readUTF();
            _loc5_.miaoshu = param1.readUTF();
            _loc3_.nameArr.push(_loc5_);
            _loc4_++;
         }
         _loc3_.shengMing = param1.readInt();
         _loc3_.maxShengMing = param1.readInt();
         _loc3_.tiLi = param1.readInt();
         _loc3_.maxTiLi = param1.readInt();
         _loc3_.gongJi = param1.readInt();
         _loc3_.maxGongJi = param1.readInt();
         _loc3_.fangYu = param1.readInt();
         _loc3_.maxFangYu = param1.readInt();
         _loc3_.baoJi = param1.readInt();
         _loc3_.maxBaoJi = param1.readInt();
         _loc3_.shanBi = param1.readInt();
         _loc3_.maxShanBi = param1.readInt();
         _loc3_.skillId = param1.readInt();
         _loc3_.isLearned = param1.readByte() == 1;
         _loc3_.skillId2 = param1.readInt();
         _loc3_.isLearned2 = param1.readByte() == 1;
         _loc3_.isShow = param1.readByte() == 1;
         if(_loc2_ == -1)
         {
            this.main_Mediator.setEMoZhiYi(_loc3_);
         }
         else
         {
            this.target_Mediator.setEMoZhiYi(_loc3_);
         }
      }
      
      public function received_70504(param1:ByteArray) : void
      {
         ZLog.add("70504: 返回翅膀突破数据");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.main_Mediator.setTupoPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_70506(param1:ByteArray) : void
      {
         ZLog.add("70506: 返回突破翅膀结果");
         var _loc2_:int = param1.readByte();
         this.main_Mediator.setTupoResult(_loc2_);
      }
   }
}

