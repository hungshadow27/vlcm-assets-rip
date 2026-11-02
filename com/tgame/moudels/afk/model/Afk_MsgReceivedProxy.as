package com.tgame.moudels.afk.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.afk.view.Afk_Mediator;
   import com.tgame.moudels.attribute.view.Attribute_TargetCharAttributePlaneMediator;
   import com.tgame.moudels.login.view.*;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Afk_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Attribute_MsgReceivedProxy";
      
      private var _afkMediator:Afk_Mediator;
      
      private var _targetCharAttributePlaneMediator:Attribute_TargetCharAttributePlaneMediator;
      
      public function Afk_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get afkMediator() : Afk_Mediator
      {
         if(!this._afkMediator)
         {
            this._afkMediator = facade.retrieveMediator(Afk_Mediator.NAME) as Afk_Mediator;
         }
         return this._afkMediator;
      }
      
      private function get targetCharAttributePlaneMediator() : Attribute_TargetCharAttributePlaneMediator
      {
         if(!this._targetCharAttributePlaneMediator)
         {
            this._targetCharAttributePlaneMediator = facade.retrieveMediator(Attribute_TargetCharAttributePlaneMediator.NAME) as Attribute_TargetCharAttributePlaneMediator;
         }
         return this._targetCharAttributePlaneMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([50592,50584,50582,50588,50590,50594],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([50592,50584,50582,50588,50590,50594],NAME);
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
      
      public function received_50592(param1:ByteArray) : void
      {
         ZLog.add("50592：接收主角挂机配置信息消息");
         GameInstance.mainCharData.afkInfo2.isSupplyHP = param1.readByte();
         GameInstance.mainCharData.afkInfo2.hpCount = param1.readByte();
         GameInstance.mainCharData.afkInfo2.hpType = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isSupplyMP = param1.readByte();
         GameInstance.mainCharData.afkInfo2.mpCount = param1.readByte();
         GameInstance.mainCharData.afkInfo2.mpType = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isSupplySP = param1.readByte();
         GameInstance.mainCharData.afkInfo2.spCount = param1.readByte();
         GameInstance.mainCharData.afkInfo2.spType = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoUseCharExp = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoUseCharZhenqi = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoUseMountExp = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoPickUpEquip = param1.readByte();
         GameInstance.mainCharData.afkInfo2.equipMenpai = param1.readByte();
         GameInstance.mainCharData.afkInfo2.equipLevel = param1.readInt();
         GameInstance.mainCharData.afkInfo2.equipPinZhi = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoPickUpTask = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoPickUpDrug = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoPickUpCaiLiao = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoPickUpOther = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoPickUpMoney = param1.readByte();
         GameInstance.mainCharData.afkInfo2.setCharSkill(param1.readInt());
         GameInstance.mainCharData.afkInfo2.setCharSkillArray();
         GameInstance.mainCharData.afkInfo2.setMountSkill(param1.readInt());
         GameInstance.mainCharData.afkInfo2.setMountSkillArray();
         GameInstance.mainCharData.afkInfo2.isAutoUseWuShenLinTi = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoUseZhanYiJiAng = param1.readByte();
         GameInstance.mainCharData.afkInfo2.afkRangeCount = param1.readByte();
         GameInstance.mainCharData.afkInfo2.afkTime = param1.readInt();
         GameInstance.mainCharData.afkInfo2.isAfkOverComeback = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isHideBoss = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoUseFlower = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoUseMountCaoLiao = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoUseHuoLiShenDan = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoUseDaMoShi = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoUseGeKongDuQi = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoUsePuDuCiHang = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoUseFuQiShouHu = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoUsePoXueKuangSha = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoUseNingXueLiHun = param1.readByte();
         GameInstance.mainCharData.afkInfo2.isAutoUseAllSKill = param1.readByte();
         this.afkMediator.initAFKConfig();
      }
      
      public function received_50584(param1:ByteArray) : void
      {
         ZLog.add("50584：接收开始/停止挂机成功消息");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.afkMediator.start();
         }
         else if(_loc2_ == 0)
         {
            this.afkMediator.stop();
         }
         else
         {
            NoticeManager.notify(NoticeManager.ALERT,param1.readUTF());
         }
      }
      
      public function received_50582(param1:ByteArray) : void
      {
         ZLog.add("50582：接收保存配置成功消息");
         var _loc2_:int = param1.readByte();
         this.afkMediator.saveSettingsOK(_loc2_);
      }
      
      public function received_50588(param1:ByteArray) : void
      {
         ZLog.add("50588：接收双倍计时打开或者关闭（反馈）消息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
      }
      
      public function received_50590(param1:ByteArray) : void
      {
         ZLog.add("50590：接收更新挂机剩余时间消息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         this.afkMediator.updateTime(_loc2_,_loc3_);
      }
      
      public function received_50594(param1:ByteArray) : void
      {
         ZLog.add("50594：接收挂机切换目标消息");
         var _loc2_:int = param1.readInt();
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(_loc2_,SceneCharacterType.MONSTER);
         if(!_loc3_)
         {
            return;
         }
         PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,_loc3_);
      }
   }
}

