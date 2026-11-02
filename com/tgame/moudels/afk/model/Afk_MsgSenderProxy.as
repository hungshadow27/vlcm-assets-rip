package com.tgame.moudels.afk.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.info.AfkInfo2;
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Afk_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Attribute_MsgSenderProxy";
      
      public function Afk_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_50581(param1:* = null) : void
      {
         ZLog.add("50581：发送保存战斗设定消息");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:AfkInfo2 = GameInstance.mainCharData.afkInfo2;
         _loc2_.writeByte(_loc3_.isSupplyHP);
         _loc2_.writeByte(_loc3_.hpCount);
         _loc2_.writeByte(_loc3_.hpType);
         _loc2_.writeByte(_loc3_.isSupplyMP);
         _loc2_.writeByte(_loc3_.mpCount);
         _loc2_.writeByte(_loc3_.mpType);
         _loc2_.writeByte(_loc3_.isSupplySP);
         _loc2_.writeByte(_loc3_.spCount);
         _loc2_.writeByte(_loc3_.spType);
         _loc2_.writeByte(_loc3_.isAutoUseCharExp);
         _loc2_.writeByte(_loc3_.isAutoUseCharZhenqi);
         _loc2_.writeByte(_loc3_.isAutoUseMountExp);
         _loc2_.writeByte(_loc3_.isAutoPickUpEquip);
         _loc2_.writeByte(_loc3_.equipMenpai);
         _loc2_.writeInt(_loc3_.equipLevel);
         _loc2_.writeByte(_loc3_.equipPinZhi);
         _loc2_.writeByte(_loc3_.isAutoPickUpTask);
         _loc2_.writeByte(_loc3_.isAutoPickUpDrug);
         _loc2_.writeByte(_loc3_.isAutoPickUpCaiLiao);
         _loc2_.writeByte(_loc3_.isAutoPickUpOther);
         _loc2_.writeByte(_loc3_.isAutoPickUpMoney);
         _loc2_.writeInt(_loc3_.isAutoUseCharSkill.id);
         if(_loc3_.isAutoUseMountSkill)
         {
            _loc2_.writeInt(_loc3_.isAutoUseMountSkill.id);
         }
         else
         {
            _loc2_.writeInt(0);
         }
         _loc2_.writeByte(_loc3_.isAutoUseWuShenLinTi);
         _loc2_.writeByte(_loc3_.isAutoUseZhanYiJiAng);
         _loc2_.writeByte(_loc3_.afkRangeCount);
         _loc2_.writeInt(_loc3_.afkTime);
         _loc2_.writeByte(_loc3_.isAfkOverComeback);
         _loc2_.writeByte(_loc3_.isHideBoss);
         _loc2_.writeByte(_loc3_.isAutoUseFlower);
         _loc2_.writeByte(_loc3_.isAutoUseMountCaoLiao);
         _loc2_.writeByte(_loc3_.isAutoUseHuoLiShenDan);
         _loc2_.writeByte(_loc3_.isAutoUseDaMoShi);
         _loc2_.writeByte(_loc3_.isAutoUseGeKongDuQi);
         _loc2_.writeByte(_loc3_.isAutoUsePuDuCiHang);
         _loc2_.writeByte(_loc3_.isAutoUseFuQiShouHu);
         _loc2_.writeByte(_loc3_.isAutoUsePoXueKuangSha);
         _loc2_.writeByte(_loc3_.isAutoUseNingXueLiHun);
         _loc2_.writeByte(_loc3_.isAutoUseAllSKill);
         NetWorkManager.sendMsg(50581,_loc2_);
      }
      
      public function send_50583(param1:* = null) : void
      {
         ZLog.add("50583：发送开始或停止挂机消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(50583,_loc2_);
      }
      
      public function send_50587(param1:* = null) : void
      {
         ZLog.add("50587：发送双倍计时打开或者关闭消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(50587,_loc2_);
      }
   }
}

