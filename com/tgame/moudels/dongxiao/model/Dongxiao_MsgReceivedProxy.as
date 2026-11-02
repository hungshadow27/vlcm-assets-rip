package com.tgame.moudels.dongxiao.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.dongxiao.model.vo.DongXiaoInfo;
   import com.tgame.moudels.dongxiao.view.Dongxiao_MaincharDongxiaoPlaneMediator;
   import com.tgame.moudels.dongxiao.view.Dongxiao_TargetCharDongxiaoPlaneMediator;
   import com.tgame.moudels.login.view.*;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Dongxiao_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Dongxiao_MsgReceivedProxy";
      
      private var isNo1Received10108:Boolean = true;
      
      private var _mainCharDongxiaoPlaneMediator:Dongxiao_MaincharDongxiaoPlaneMediator;
      
      private var _targetCharDongxiaoPlaneMediator:Dongxiao_TargetCharDongxiaoPlaneMediator;
      
      public function Dongxiao_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get mainCharDongxiaoPlaneMediator() : Dongxiao_MaincharDongxiaoPlaneMediator
      {
         if(!this._mainCharDongxiaoPlaneMediator)
         {
            this._mainCharDongxiaoPlaneMediator = facade.retrieveMediator(Dongxiao_MaincharDongxiaoPlaneMediator.NAME) as Dongxiao_MaincharDongxiaoPlaneMediator;
         }
         return this._mainCharDongxiaoPlaneMediator;
      }
      
      private function get targetCharDongxiaoPlaneMediator() : Dongxiao_TargetCharDongxiaoPlaneMediator
      {
         if(!this._targetCharDongxiaoPlaneMediator)
         {
            this._targetCharDongxiaoPlaneMediator = facade.retrieveMediator(Dongxiao_TargetCharDongxiaoPlaneMediator.NAME) as Dongxiao_TargetCharDongxiaoPlaneMediator;
         }
         return this._targetCharDongxiaoPlaneMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53802,53808],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53802,53808],NAME);
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
      
      public function received_53802(param1:ByteArray) : void
      {
         var _loc7_:Skill = null;
         ZLog.add("53802：返回洞箫整体信息");
         var _loc2_:int = param1.readInt();
         if(_loc2_ != GameInstance.mainChar.id && _loc2_ != GameInstance.lookPlayerID)
         {
            return;
         }
         var _loc3_:DongXiaoInfo = new DongXiaoInfo();
         _loc3_.isZhanyin = Boolean(param1.readByte() == 1);
         _loc3_.lv = param1.readByte();
         _loc3_.name = param1.readUTF();
         _loc3_.add_ap = param1.readInt();
         _loc3_.add_dp = param1.readInt();
         _loc3_.add_hp = param1.readInt();
         _loc3_.add_mp = param1.readInt();
         _loc3_.add_pp = param1.readInt();
         _loc3_.isOpen = param1.readByte() == 1;
         _loc3_.nowXiulian = param1.readInt();
         _loc3_.maxXiulian = param1.readInt();
         _loc3_.status = param1.readByte();
         _loc3_.des = param1.readUTF();
         _loc3_.skillArr = [];
         var _loc4_:int = param1.readByte();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = new Skill(param1.readInt());
            _loc7_.isLearn = param1.readByte();
            _loc3_.skillArr.push(_loc7_);
            _loc5_++;
         }
         if(_loc3_.status == 2 && _loc2_ == GameInstance.mainChar.id)
         {
            _loc3_.tupoGoodsID = param1.readInt();
            _loc3_.tupoGoodsCount = param1.readInt();
            _loc3_.jilv = param1.readInt();
            _loc3_.nowXingyun = param1.readInt();
            _loc3_.maxXingyun = param1.readInt();
            _loc3_.nextXiaoName = param1.readUTF();
         }
         _loc3_.visible = param1.readByte() == 1;
         _loc3_.isJihuo = param1.readByte();
         _loc3_.jihuoJindu = param1.readInt();
         if(_loc3_.jihuoJindu != -1)
         {
            _loc3_.addJihuoGongji = param1.readInt();
            _loc3_.addJihuoFangyu = param1.readInt();
            _loc3_.addJihuoShengming = param1.readInt();
            if(_loc2_ == GameInstance.mainChar.id)
            {
               this.mainCharDongxiaoPlaneMediator.initializeMainUI(_loc3_);
               if(_loc2_ == GameInstance.lookPlayerID)
               {
                  this.targetCharDongxiaoPlaneMediator.initializeMainUI(_loc3_);
               }
            }
            else
            {
               this.targetCharDongxiaoPlaneMediator.initializeMainUI(_loc3_);
            }
         }
         var _loc6_:int = param1.readByte();
         if(_loc2_ == GameInstance.mainChar.id)
         {
            this.mainCharDongxiaoPlaneMediator.received_dongxiaoInfo(_loc3_,_loc6_);
            if(_loc2_ == GameInstance.lookPlayerID)
            {
               this.targetCharDongxiaoPlaneMediator.received_dongxiaoInfo(_loc3_);
            }
         }
         else
         {
            this.targetCharDongxiaoPlaneMediator.received_dongxiaoInfo(_loc3_);
         }
      }
      
      public function received_53808(param1:ByteArray) : void
      {
         ZLog.add("53808：洞箫达到瓶颈，可突破(for新手引导)");
         this.mainCharDongxiaoPlaneMediator.received_canTupo();
      }
   }
}

