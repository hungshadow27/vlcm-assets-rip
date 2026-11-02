package com.tgame.manager
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.MonsterType;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpeciaAvatarPartID;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.utils.DP_qixuan;
   import com.tgame.common.vo.character.BaseCharacter;
   import com.tgame.common.vo.character.Monster;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.avatar.AvatarPart;
   import com.zcp.engine.staticdata.AvatarPartID;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.tools.SceneCache;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.engine.vo.map.MapTile;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class AvatarManager
   {
      
      public static var body_AvatarID_by_AvatarType_dict:Dictionary = new Dictionary();
      
      public static var body_AvatarID_by_AvatarType_dict_Main:Dictionary = new Dictionary();
      
      public function AvatarManager()
      {
         super();
      }
      
      public static function updateSilingzhenAvatar(param1:SceneCharacter, param2:int) : void
      {
         var _loc3_:AvatarParamData = null;
         if(param2 > 0)
         {
            _loc3_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager["AVATAR_SILINGZHEN_" + param2]),AvatarPartType.MAGIC_RING);
            _loc3_.id = SpeciaAvatarPartID.SILINGZHEN;
            _loc3_.depth = OtherConst.SILINGZHEN_DEPTH;
            _loc3_.useSpecilizeXY = false;
            param1.loadAvatarPart(_loc3_);
         }
         else
         {
            param1.removeAvatarPartByID(SpeciaAvatarPartID.SILINGZHEN,false);
         }
      }
      
      public static function updateShensifuAvatar(param1:SceneCharacter, param2:int) : void
      {
         var _loc3_:AvatarParamData = null;
         if(param2 > 0)
         {
            _loc3_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager["AVATAR_SHENGSIFU_" + param2]),AvatarPartType.MAGIC_RING);
            _loc3_.id = SpeciaAvatarPartID.SHENGSIFU;
            _loc3_.useSpecilizeXY = false;
            param1.loadAvatarPart(_loc3_);
         }
         else
         {
            param1.removeAvatarPartByID(SpeciaAvatarPartID.SHENGSIFU,false);
         }
      }
      
      public static function updateFenTianNuQiAvatar(param1:SceneCharacter, param2:int) : void
      {
         var _loc3_:AvatarParamData = null;
         if(param2 > 0)
         {
            _loc3_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager["AVATAR_XISUIJING_" + param2]),AvatarPartType.MAGIC_RING);
            _loc3_.id = SpeciaAvatarPartID.FENTIANNUQI;
            _loc3_.useSpecilizeXY = false;
            param1.loadAvatarPart(_loc3_);
         }
         else
         {
            param1.removeAvatarPartByID(SpeciaAvatarPartID.FENTIANNUQI,false);
         }
      }
      
      public static function updateZhenLongqiHeiAvatar(param1:SceneCharacter, param2:int) : void
      {
         var _loc3_:AvatarParamData = null;
         if(param2 > 0)
         {
            _loc3_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager["AVATAR_ZHENLONGQI_HEI_" + param2]),AvatarPartType.MAGIC_RING);
            _loc3_.id = SpeciaAvatarPartID.ZHENLONGQI_HEI;
            _loc3_.useSpecilizeXY = false;
            param1.loadAvatarPart(_loc3_);
         }
         else
         {
            param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENLONGQI_HEI,false);
         }
      }
      
      public static function updateZhenLongqiBaiAvatar(param1:SceneCharacter, param2:int) : void
      {
         var _loc3_:AvatarParamData = null;
         if(param2 > 0)
         {
            _loc3_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager["AVATAR_ZHENLONGQI_BAI_" + param2]),AvatarPartType.MAGIC_RING);
            _loc3_.id = SpeciaAvatarPartID.ZHENLONGQI_BAI;
            _loc3_.useSpecilizeXY = false;
            param1.loadAvatarPart(_loc3_);
         }
         else
         {
            param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENLONGQI_BAI,false);
         }
      }
      
      public static function updateWuCaiXianZhenAvatar(param1:SceneCharacter, param2:int) : void
      {
         var _loc3_:AvatarParamData = null;
         if(param2 > 0)
         {
            _loc3_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager["AVATAR_WUCAIXIANZHEN_" + param2]),AvatarPartType.MAGIC_RING);
            _loc3_.id = SpeciaAvatarPartID.WUCAIXIANZHEN;
            _loc3_.useSpecilizeXY = false;
            param1.loadAvatarPart(_loc3_);
         }
         else
         {
            param1.removeAvatarPartByID(SpeciaAvatarPartID.WUCAIXIANZHEN,false);
         }
      }
      
      public static function updateJingmaiAvatar(param1:SceneCharacter, param2:int) : void
      {
         var _loc3_:AvatarParamData = null;
         if(param2 > 0)
         {
            _loc3_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager["AVATAR_JINGMAI_GUANTONG_" + param2]),AvatarPartType.MAGIC_RING);
            _loc3_.id = SpeciaAvatarPartID.JINGMAI_LEVEL;
            _loc3_.offsetOnMountY = OtherConst.RING_ONMOUNT_OFFSET_Y;
            _loc3_.sleepTime = 5 * 1000;
            param1.loadAvatarPart(_loc3_);
         }
         else
         {
            param1.removeAvatarPartByID(SpeciaAvatarPartID.JINGMAI_LEVEL,false);
         }
      }
      
      public static function updateJingmaiAvatar1(param1:SceneCharacter, param2:int) : void
      {
         var _loc3_:AvatarParamData = null;
         if(param2 > 0)
         {
            _loc3_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager["AVATAR_JINGMAI_GUANTONG_" + param2]),AvatarPartType.MAGIC_RING);
            _loc3_.id = SpeciaAvatarPartID.JINGMAI_LEVEL2;
            _loc3_.offsetOnMountY = OtherConst.RING_ONMOUNT_OFFSET_Y;
            _loc3_.sleepTime = 1 * 1000;
            param1.loadAvatarPart(_loc3_);
         }
         else
         {
            param1.removeAvatarPartByID(SpeciaAvatarPartID.JINGMAI_LEVEL2,false);
         }
      }
      
      public static function updateQixuanAvatar(param1:SceneCharacter, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var onAdd1:Function;
         var onAdd2:Function;
         var onAdd3:Function;
         var onAdd4:Function;
         var onAdd5:Function;
         var apd:AvatarParamData = null;
         var apd2:AvatarParamData = null;
         var apd3:AvatarParamData = null;
         var apd4:AvatarParamData = null;
         var apd5:AvatarParamData = null;
         var $qixuanSc:SceneCharacter = param1;
         var $qixuan1ID:int = param2;
         var $qixuan2ID:int = param3;
         var $qixuan3ID:int = param4;
         var $qixuan4ID:int = param5;
         var $qixuan5ID:int = param6;
         if($qixuan1ID > 0)
         {
            onAdd1 = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               if($qixuanSc.usable)
               {
                  return;
               }
               if(param2 != null)
               {
                  param2.correctAvatarPosition();
               }
               var _loc3_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_2);
               if(_loc3_ != null)
               {
                  (_loc3_.avatarParamData.dynamicPosition as DP_qixuan).an = 72;
                  _loc3_.correctAvatarPosition();
               }
               var _loc4_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_3);
               if(_loc4_ != null)
               {
                  (_loc4_.avatarParamData.dynamicPosition as DP_qixuan).an = 144;
                  _loc4_.correctAvatarPosition();
               }
               var _loc5_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_4);
               if(_loc5_ != null)
               {
                  (_loc5_.avatarParamData.dynamicPosition as DP_qixuan).an = 216;
                  _loc5_.correctAvatarPosition();
               }
               var _loc6_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_5);
               if(_loc6_ != null)
               {
                  (_loc6_.avatarParamData.dynamicPosition as DP_qixuan).an = 288;
                  _loc6_.correctAvatarPosition();
               }
            };
            apd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,$qixuan1ID),AvatarPartType.MAGIC_RING);
            apd.id = SpeciaAvatarPartID.QIXUAN_1;
            apd.offsetOnMountY = OtherConst.RING_ONMOUNT_OFFSET_Y;
            apd.dynamicPosition = new DP_qixuan(0);
            apd.extendCallBack(null,null,null,null,onAdd1);
            if(!$qixuanSc.hasSameAvatarPart(apd))
            {
               $qixuanSc.loadAvatarPart(apd);
            }
         }
         else
         {
            $qixuanSc.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_1,false);
         }
         if($qixuan2ID > 0)
         {
            onAdd2 = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               if(!$qixuanSc.usable)
               {
                  return;
               }
               if(param2 != null)
               {
                  param2.correctAvatarPosition();
               }
               var _loc3_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_1);
               if(_loc3_ != null)
               {
                  (_loc3_.avatarParamData.dynamicPosition as DP_qixuan).an = 0;
                  _loc3_.correctAvatarPosition();
               }
               var _loc4_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_3);
               if(_loc4_ != null)
               {
                  (_loc4_.avatarParamData.dynamicPosition as DP_qixuan).an = 144;
                  _loc4_.correctAvatarPosition();
               }
               var _loc5_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_4);
               if(_loc5_ != null)
               {
                  (_loc5_.avatarParamData.dynamicPosition as DP_qixuan).an = 216;
                  _loc5_.correctAvatarPosition();
               }
               var _loc6_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_5);
               if(_loc6_ != null)
               {
                  (_loc6_.avatarParamData.dynamicPosition as DP_qixuan).an = 288;
                  _loc6_.correctAvatarPosition();
               }
            };
            apd2 = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,$qixuan2ID),AvatarPartType.MAGIC_RING);
            apd2.id = SpeciaAvatarPartID.QIXUAN_2;
            apd2.offsetOnMountY = OtherConst.RING_ONMOUNT_OFFSET_Y;
            apd2.dynamicPosition = new DP_qixuan(72);
            apd2.extendCallBack(null,null,null,null,onAdd2);
            if(!$qixuanSc.hasSameAvatarPart(apd2))
            {
               $qixuanSc.loadAvatarPart(apd2);
            }
         }
         else
         {
            $qixuanSc.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_2,false);
         }
         if($qixuan3ID > 0)
         {
            onAdd3 = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               if($qixuanSc.usable)
               {
                  return;
               }
               if(param2 != null)
               {
                  param2.correctAvatarPosition();
               }
               var _loc3_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_1);
               if(_loc3_ != null)
               {
                  (_loc3_.avatarParamData.dynamicPosition as DP_qixuan).an = 0;
                  _loc3_.correctAvatarPosition();
               }
               var _loc4_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_2);
               if(_loc4_ != null)
               {
                  (_loc4_.avatarParamData.dynamicPosition as DP_qixuan).an = 72;
                  _loc4_.correctAvatarPosition();
               }
               var _loc5_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_4);
               if(_loc5_ != null)
               {
                  (_loc5_.avatarParamData.dynamicPosition as DP_qixuan).an = 216;
                  _loc5_.correctAvatarPosition();
               }
               var _loc6_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_5);
               if(_loc6_ != null)
               {
                  (_loc6_.avatarParamData.dynamicPosition as DP_qixuan).an = 288;
                  _loc6_.correctAvatarPosition();
               }
            };
            apd3 = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,$qixuan3ID),AvatarPartType.MAGIC_RING);
            apd3.id = SpeciaAvatarPartID.QIXUAN_3;
            apd3.offsetOnMountY = OtherConst.RING_ONMOUNT_OFFSET_Y;
            apd3.dynamicPosition = new DP_qixuan(144);
            apd3.extendCallBack(null,null,null,null,onAdd3);
            if(!$qixuanSc.hasSameAvatarPart(apd3))
            {
               $qixuanSc.loadAvatarPart(apd3);
            }
         }
         else
         {
            $qixuanSc.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_3,false);
         }
         if($qixuan4ID > 0)
         {
            onAdd4 = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               if($qixuanSc.usable)
               {
                  return;
               }
               if(param2 != null)
               {
                  param2.correctAvatarPosition();
               }
               var _loc3_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_1);
               if(_loc3_ != null)
               {
                  (_loc3_.avatarParamData.dynamicPosition as DP_qixuan).an = 0;
                  _loc3_.correctAvatarPosition();
               }
               var _loc4_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_2);
               if(_loc4_ != null)
               {
                  (_loc4_.avatarParamData.dynamicPosition as DP_qixuan).an = 72;
                  _loc4_.correctAvatarPosition();
               }
               var _loc5_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_3);
               if(_loc5_ != null)
               {
                  (_loc5_.avatarParamData.dynamicPosition as DP_qixuan).an = 144;
                  _loc5_.correctAvatarPosition();
               }
               var _loc6_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_5);
               if(_loc6_ != null)
               {
                  (_loc6_.avatarParamData.dynamicPosition as DP_qixuan).an = 288;
                  _loc6_.correctAvatarPosition();
               }
            };
            apd4 = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,$qixuan4ID),AvatarPartType.MAGIC_RING);
            apd4.id = SpeciaAvatarPartID.QIXUAN_4;
            apd4.offsetOnMountY = OtherConst.RING_ONMOUNT_OFFSET_Y;
            apd4.dynamicPosition = new DP_qixuan(216);
            apd4.extendCallBack(null,null,null,null,onAdd4);
            if(!$qixuanSc.hasSameAvatarPart(apd4))
            {
               $qixuanSc.loadAvatarPart(apd4);
            }
         }
         else
         {
            $qixuanSc.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_4,false);
         }
         if($qixuan5ID > 0)
         {
            onAdd5 = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               if($qixuanSc.usable)
               {
                  return;
               }
               if(param2 != null)
               {
                  param2.correctAvatarPosition();
               }
               var _loc3_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_1);
               if(_loc3_ != null)
               {
                  (_loc3_.avatarParamData.dynamicPosition as DP_qixuan).an = 0;
                  _loc3_.correctAvatarPosition();
               }
               var _loc4_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_2);
               if(_loc4_ != null)
               {
                  (_loc4_.avatarParamData.dynamicPosition as DP_qixuan).an = 72;
                  _loc4_.correctAvatarPosition();
               }
               var _loc5_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_3);
               if(_loc5_ != null)
               {
                  (_loc5_.avatarParamData.dynamicPosition as DP_qixuan).an = 144;
                  _loc5_.correctAvatarPosition();
               }
               var _loc6_:AvatarPart = $qixuanSc.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_4);
               if(_loc6_ != null)
               {
                  (_loc6_.avatarParamData.dynamicPosition as DP_qixuan).an = 216;
                  _loc6_.correctAvatarPosition();
               }
            };
            apd5 = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,$qixuan5ID),AvatarPartType.MAGIC_RING);
            apd5.id = SpeciaAvatarPartID.QIXUAN_5;
            apd5.offsetOnMountY = OtherConst.RING_ONMOUNT_OFFSET_Y;
            apd5.dynamicPosition = new DP_qixuan(288);
            apd5.extendCallBack(null,null,null,null,onAdd5);
            if(!$qixuanSc.hasSameAvatarPart(apd5))
            {
               $qixuanSc.loadAvatarPart(apd5);
            }
         }
         else
         {
            $qixuanSc.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_5,false);
         }
      }
      
      public static function updateSitAvatar(param1:SceneCharacter, param2:int) : void
      {
         var _loc3_:AvatarParamData = null;
         if(param2 > 0)
         {
            _loc3_ = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,param2),AvatarPartType.MAGIC_RING);
            _loc3_.id = SpeciaAvatarPartID.SIT;
            param1.loadAvatarPart(_loc3_);
         }
         else
         {
            param1.removeAvatarPartByID(SpeciaAvatarPartID.SIT,false);
         }
      }
      
      public static function dressAvatarData(param1:AvatarInfo, param2:int, param3:int, param4:int, param5:int = 0) : Array
      {
         var _loc6_:Array = [];
         if(param2 == ItemPositionRange.POSTION_YIFU)
         {
            if(param1.usingFashion <= 0)
            {
               if(param5 != 0)
               {
                  param1.longwenid = param5;
               }
               if(param1.isShowLongWenKeHua)
               {
                  param1.apd_body = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param1.longwenid));
                  param1.apd_mount_body = new AvatarParamData(ResPathManager.getAvatarPath_ClothesOnMount(ResPathManager.AVATAR_CLOTHES,param1.longwenid));
               }
               else
               {
                  param1.apd_body = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param3));
                  param1.apd_mount_body = new AvatarParamData(ResPathManager.getAvatarPath_ClothesOnMount(ResPathManager.AVATAR_CLOTHES,param3));
               }
               _loc6_.push(param1.apd_body.id,param1.apd_mount_body.id);
            }
         }
         else if(param2 == ItemPositionRange.POSTION_KUAPINGTAI_BIWU_SHIZHUANG)
         {
            if(param1.usingFashion > 0)
            {
               param1.apd_body = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param3));
               param1.apd_mount_body = new AvatarParamData(ResPathManager.getAvatarPath_ClothesOnMount(ResPathManager.AVATAR_CLOTHES,param3));
               _loc6_.push(param1.apd_body.id,param1.apd_mount_body.id);
            }
         }
         else if(param2 == ItemPositionRange.POSTION_WUQI)
         {
            param1.apd_weapon = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_weapon.id);
         }
         else if(param2 == ItemPositionRange.POSTION_BOW)
         {
            param1.apd_bow = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.BOW);
            param1.apd_mount_bow = new AvatarParamData(ResPathManager.getAvatarPath_ClothesOnMount(ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.BOW);
            _loc6_.push(param1.apd_bow.id,param1.apd_mount_bow.id);
         }
         else if(param2 == ItemPositionRange.POSTION_ZHENHUN)
         {
            param1.apd_zhenhun = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.ZHENHUN);
            param1.apd_mount_zhenhun = new AvatarParamData(ResPathManager.getAvatarPath_ClothesOnMount(ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.ZHENHUN);
            _loc6_.push(param1.apd_zhenhun.id,param1.apd_mount_zhenhun.id);
         }
         else if(param2 == ItemPositionRange.POSTION_QIBING)
         {
            if(param4 == 1)
            {
               param1.apd_mount_weapon = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            }
            else
            {
               param1.apd_mount_weapon = new AvatarParamData(ResPathManager.getAvatarPath_ClothesOnMount_weapon_female(ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            }
            _loc6_.push(param1.apd_mount_weapon.id);
         }
         if(OtherConst.texiaoBoolean)
         {
            return _loc6_;
         }
         if(param2 == ItemPositionRange.POSTION_YLZR)
         {
            param1.apd_ylzr = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_ylzr = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_ylzr.id,param1.apd_mount_ylzr.id);
         }
         else if(param2 == ItemPositionRange.POSTION_STDRJ)
         {
            param1.apd_xyj = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_xyj = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_xyj.id,param1.apd_mount_xyj.id);
         }
         else if(param2 == ItemPositionRange.POSTION_AOJIAN)
         {
            param1.apd_aojian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_aojian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_aojian.id,param1.apd_mount_aojian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_NB_WEAPON_ARR[0])
         {
            param1.apd_longyin = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_longyin = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_longyin.id,param1.apd_mount_longyin.id);
         }
         else if(param2 == ItemPositionRange.POSITION_NB_WEAPON_ARR[4])
         {
            param1.apd_liekong = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_liekong = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_liekong.id,param1.apd_mount_liekong.id);
         }
         else if(param2 == ItemPositionRange.POSITION_NB_WEAPON_ARR[3])
         {
            param1.apd_tianshang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_tianshang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_tianshang.id,param1.apd_mount_tianshang.id);
         }
         else if(param2 == ItemPositionRange.POSTION_SHENQI)
         {
            param1.apd_shenqi = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_shenqi = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_shenqi.id,param1.apd_mount_shenqi.id);
         }
         else if(param2 == ItemPositionRange.POSITION_NB_WEAPON_ARR[1])
         {
            param1.apd_quanshen = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_quanshen = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_quanshen.id,param1.apd_mount_quanshen.id);
         }
         else if(param2 == ItemPositionRange.POSITION_NB_WEAPON_ARR[2])
         {
            param1.apd_longya = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_longya = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_longya.id,param1.apd_mount_longya.id);
         }
         else if(param2 == ItemPositionRange.POSITION_NB_WEAPON_ARR[9])
         {
            param1.apd_potianren = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_potianren = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_potianren.id,param1.apd_mount_potianren.id);
         }
         else if(param2 == ItemPositionRange.POSITION_NB_WEAPON_ARR[7])
         {
            param1.apd_pangu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_pangu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_pangu.id,param1.apd_mount_pangu.id);
         }
         else if(param2 == ItemPositionRange.POSITION_NB_WEAPON_ARR[8])
         {
            param1.apd_xueyindao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_xueyindao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_xueyindao.id,param1.apd_mount_xueyindao.id);
         }
         else if(param2 == ItemPositionRange.POSTION_GJMY)
         {
            param1.apd_gjmy = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_gjmy = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_gjmy.id,param1.apd_mount_gjmy.id);
         }
         else if(param2 == ItemPositionRange.POSITION_LONGYA)
         {
            param1.apd_longya1 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_longya1 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_longya1.id,param1.apd_mount_longya1.id);
         }
         else if(param2 == ItemPositionRange.POSITION_YAYUEDAO)
         {
            param1.apd_yanyuedao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_yanyuedao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_yanyuedao.id,param1.apd_mount_yanyuedao.id);
         }
         else if(param2 == ItemPositionRange.POSITION_XUANTIEZHONGJIAN)
         {
            param1.apd_xuantiezhongjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_xuantiezhongjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_xuantiezhongjian.id,param1.apd_mount_xuantiezhongjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_GUANGMINGZHANG)
         {
            param1.apd_guangmingzhang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_guangmingzhang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_guangmingzhang.id,param1.apd_mount_guangmingzhang.id);
         }
         else if(param2 == ItemPositionRange.POSITION_HUIMIE)
         {
            param1.apd_huimie = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_huimie = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_huimie.id,param1.apd_mount_huimie.id);
         }
         else if(param2 == ItemPositionRange.POSITION_ZHUMOZHANG)
         {
            param1.apd_zhumozhang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_zhumozhang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_zhumozhang.id,param1.apd_mount_zhumozhang.id);
         }
         else if(param2 == ItemPositionRange.POSITION_CHIYAN)
         {
            param1.apd_chiyan = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_chiyan = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_chiyan.id,param1.apd_mount_chiyan.id);
         }
         else if(param2 == ItemPositionRange.POSITION_TIANJING)
         {
            param1.apd_tianjing = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_tianjing = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_tianjing.id,param1.apd_mount_tianjing.id);
         }
         else if(param2 == ItemPositionRange.POSITION_FENGTIANJI)
         {
            param1.apd_fengtianji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_fengtianji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_fengtianji.id,param1.apd_mount_fengtianji.id);
         }
         else if(param2 == ItemPositionRange.POSITION_HUOLONGDAO)
         {
            param1.apd_huolongdao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_huolongdao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_huolongdao.id,param1.apd_mount_huolongdao.id);
         }
         else if(param2 == ItemPositionRange.POSITION_TIANZHU)
         {
            param1.apd_tianzhu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_tianzhu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_tianzhu.id,param1.apd_mount_tianzhu.id);
         }
         else if(param2 == ItemPositionRange.POSITION_PANGUKAITIANFU)
         {
            param1.apd_pangukaitianfu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_pangukaitianfu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_pangukaitianfu.id,param1.apd_mount_pangukaitianfu.id);
         }
         else if(param2 == ItemPositionRange.POSITION_TIANDI)
         {
            param1.apd_tiandijian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_tiandijian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_tiandijian.id,param1.apd_mount_tiandijian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_HANQIBINGPO)
         {
            param1.apd_hanqibingpo = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_hanqibingpo = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_hanqibingpo.id,param1.apd_mount_hanqibingpo.id);
         }
         else if(param2 == ItemPositionRange.POSITION_JIANZUNLONGQUANJIAN)
         {
            param1.apd_jianzunlongquanjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_jianzunlongquanjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_jianzunlongquanjian.id,param1.apd_mount_jianzunlongquanjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_CHUANGSHI)
         {
            param1.apd_chuangshi = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_chuangshi = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_chuangshi.id,param1.apd_mount_chuangshi.id);
         }
         else if(param2 == ItemPositionRange.POSITION_SUILIESHIFU)
         {
            param1.apd_suilieshifu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_suilieshifu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_suilieshifu.id,param1.apd_mount_suilieshifu.id);
         }
         else if(param2 == ItemPositionRange.POSITION_MOYUAN)
         {
            param1.apd_moyuan = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_moyuan = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_moyuan.id,param1.apd_mount_moyuan.id);
         }
         else if(param2 == ItemPositionRange.POSITION_CHENGJIECHANGJI)
         {
            param1.apd_chengjiechangji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_chengjiechangji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_chengjiechangji.id,param1.apd_mount_chengjiechangji.id);
         }
         else if(param2 == ItemPositionRange.POSITION_TIANXIEJIAN)
         {
            param1.apd_tianxiejian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_tianxiejian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_tianxiejian.id,param1.apd_mount_tianxiejian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_JUNZIJIAN)
         {
            param1.apd_junzijian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_junzijian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_junzijian.id,param1.apd_mount_junzijian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_WANGZHEJIAN)
         {
            param1.apd_wangzhejian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_wangzhejian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_wangzhejian.id,param1.apd_mount_wangzhejian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_FENGBAODAO)
         {
            param1.apd_fengbaodao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_fengbaodao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_fengbaodao.id,param1.apd_mount_fengbaodao.id);
         }
         else if(param2 == ItemPositionRange.POSITION_FENGYUN)
         {
            param1.apd_fengyun = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_fengyun = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_fengyun.id,param1.apd_mount_fengyun.id);
         }
         else if(param2 == ItemPositionRange.POSITION_SHENGDAN2015)
         {
            param1.apd_shengdan2015 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_shengdan2015 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_shengdan2015.id,param1.apd_mount_shengdan2015.id);
         }
         else if(param2 == ItemPositionRange.POSITION_FENGSHA)
         {
            param1.apd_fengsha = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_fengsha = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_fengsha.id,param1.apd_mount_fengsha.id);
         }
         else if(param2 == ItemPositionRange.POSITION_FENGYIJIAN)
         {
            param1.apd_fengyijian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_fengyijian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_fengyijian.id,param1.apd_mount_fengyijian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_LEXINJI)
         {
            param1.apd_lexinji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_lexinji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_lexinji.id,param1.apd_mount_lexinji.id);
         }
         else if(param2 == ItemPositionRange.POSITION_FENGYINGJIAN)
         {
            param1.apd_fengyingjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_fengyingjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_fengyingjian.id,param1.apd_mount_fengyingjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_ZHENFENGJIAN)
         {
            param1.apd_zhenfengjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_zhenfengjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_zhenfengjian.id,param1.apd_mount_zhenfengjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_FENGYUNJIAN)
         {
            param1.apd_fengyunjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_fengyunjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_fengyunjian.id,param1.apd_mount_fengyunjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_BINGFENGJIAN)
         {
            param1.apd_bingfengjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_bingfengjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_bingfengjian.id,param1.apd_mount_bingfengjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_HONGLEIZHANGU)
         {
            param1.apd_hongleizhangu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_hongleizhangu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_hongleizhangu.id,param1.apd_mount_hongleizhangu.id);
         }
         else if(param2 == ItemPositionRange.POSITION_SANDENGGUFO)
         {
            param1.apd_sandenggufo = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_sandenggufo = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_sandenggufo.id,param1.apd_mount_sandenggufo.id);
         }
         else if(param2 == ItemPositionRange.POSITION_FONUJI)
         {
            param1.apd_fonuji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_fonuji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_fonuji.id,param1.apd_mount_fonuji.id);
         }
         else if(param2 == ItemPositionRange.POSITION_FENGYINJIAN)
         {
            param1.apd_fengyinjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_fengyinjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_fengyinjian.id,param1.apd_mount_fengyinjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_TIANMAJIAN)
         {
            param1.apd_tianmajian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_tianmajian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_tianmajian.id,param1.apd_mount_tianmajian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_WUHUNJIAN)
         {
            param1.apd_wuhunjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_wuhunjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_wuhunjian.id,param1.apd_mount_wuhunjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_ZHENTIANJIAN)
         {
            param1.apd_zhentianjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_zhentianjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_zhentianjian.id,param1.apd_mount_zhentianjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_TIANXUE)
         {
            param1.apd_tianxue = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_tianxue = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_tianxue.id,param1.apd_mount_tianxue.id);
         }
         else if(param2 == ItemPositionRange.POSITION_XIONGJIJIAN)
         {
            param1.apd_xiongjijian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_xiongjijian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_xiongjijian.id,param1.apd_mount_xiongjijian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_WUJINJIAN)
         {
            param1.apd_wujinjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_wujinjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_wujinjian.id,param1.apd_mount_wujinjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_SHUNTIANJIAN)
         {
            param1.apd_shuntianjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_shuntianjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_shuntianjian.id,param1.apd_mount_shuntianjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_WANGZHEQICANG)
         {
            param1.apd_wangzheqicang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_wangzheqicang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_wangzheqicang.id,param1.apd_mount_wangzheqicang.id);
         }
         else if(param2 == ItemPositionRange.POSITION_BIXUEJIAN)
         {
            param1.apd_bixuejian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_bixuejian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_bixuejian.id,param1.apd_mount_bixuejian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_WUYIJIAN)
         {
            param1.apd_wuyijian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_wuyijian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_wuyijian.id,param1.apd_mount_wuyijian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_SHIJIANSHENQI)
         {
            param1.apd_shijianshenqi = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_shijianshenqi = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_shijianshenqi.id,param1.apd_mount_shijianshenqi.id);
         }
         else if(param2 == ItemPositionRange.POSITION_QINGFENGJIAN)
         {
            param1.apd_qingfengjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_qingfengjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_qingfengjian.id,param1.apd_mount_qingfengjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_HUOLINJIAN)
         {
            param1.apd_huolinjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_huolinjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_huolinjian.id,param1.apd_mount_huolinjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_ZHUIHUNJI)
         {
            param1.apd_zhuihunji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_zhuihunji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_zhuihunji.id,param1.apd_mount_zhuihunji.id);
         }
         else if(param2 == ItemPositionRange.POSITION_BIYUDAO)
         {
            param1.apd_biyudao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_biyudao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_biyudao.id,param1.apd_mount_biyudao.id);
         }
         else if(param2 == ItemPositionRange.POSITION_WUWOZHANG)
         {
            param1.apd_wuwozhang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_wuwozhang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_wuwozhang.id,param1.apd_mount_wuwozhang.id);
         }
         else if(param2 == ItemPositionRange.POSITION_YEHUOHONGLIAN)
         {
            param1.apd_yehuohonglian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_yehuohonglian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_yehuohonglian.id,param1.apd_mount_yehuohonglian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_MINGYUEDAO)
         {
            param1.apd_mingyuedao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_mingyuedao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_mingyuedao.id,param1.apd_mount_mingyuedao.id);
         }
         else if(param2 == ItemPositionRange.POSITION_QINGFENGJIAN2)
         {
            param1.apd_qingfengjian2 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_qingfengjian2 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_qingfengjian2.id,param1.apd_mount_qingfengjian2.id);
         }
         else if(param2 == ItemPositionRange.POSITION_ZHIZUNJIAN)
         {
            param1.apd_zhizunjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_zhizunjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_zhizunjian.id,param1.apd_mount_zhizunjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_BAOLEIJI)
         {
            param1.apd_baoleiji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_baoleiji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_baoleiji.id,param1.apd_mount_baoleiji.id);
         }
         else if(param2 == ItemPositionRange.POSITION_MINGSHENGZHANG)
         {
            param1.apd_mingshengzhang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_mingshengzhang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_mingshengzhang.id,param1.apd_mount_mingshengzhang.id);
         }
         else if(param2 == ItemPositionRange.POSITION_ZUNSHIJIAN)
         {
            param1.apd_zunshijian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_zunshijian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_zunshijian.id,param1.apd_mount_zunshijian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_RENZHEZHANG)
         {
            param1.apd_renzhezhang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_renzhezhang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_renzhezhang.id,param1.apd_mount_renzhezhang.id);
         }
         else if(param2 == ItemPositionRange.POSITION_ZHIZHEJIAN)
         {
            param1.apd_zhizhejian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_zhizhejian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_zhizhejian.id,param1.apd_mount_zhizhejian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_YANGMINGJIAN)
         {
            param1.apd_yangmingjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_yangmingjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_yangmingjian.id,param1.apd_mount_yangmingjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_XIWANGJIAN)
         {
            param1.apd_xiwangjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_xiwangjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_xiwangjian.id,param1.apd_mount_xiwangjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_XUEJINGJIAN)
         {
            param1.apd_xuejingjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_xuejingjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_xuejingjian.id,param1.apd_mount_xuejingjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_XUANBINGJIAN)
         {
            param1.apd_xuanbingjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_xuanbingjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_xuanbingjian.id,param1.apd_mount_xuanbingjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_PINGANJIAN)
         {
            param1.apd_pinganjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_pinganjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_pinganjian.id,param1.apd_mount_pinganjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_QINGHUAJIAN)
         {
            param1.apd_qinghuajian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_qinghuajian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_qinghuajian.id,param1.apd_mount_qinghuajian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_YUXUJIAN)
         {
            param1.apd_yuxujian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_yuxujian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_yuxujian.id,param1.apd_mount_yuxujian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_YUQINGSHAN)
         {
            param1.apd_yuqingshan = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_yuqingshan = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_yuqingshan.id,param1.apd_mount_yuqingshan.id);
         }
         else if(param2 == ItemPositionRange.POSITION_HUOMODAO)
         {
            param1.apd_huomodao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_huomodao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_huomodao.id,param1.apd_mount_huomodao.id);
         }
         else if(param2 == ItemPositionRange.POSITION_YIHEJI)
         {
            param1.apd_yiheji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_yiheji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_yiheji.id,param1.apd_mount_yiheji.id);
         }
         else if(param2 == ItemPositionRange.POSITION_ERHEJIAN)
         {
            param1.apd_erhejian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_erhejian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_erhejian.id,param1.apd_mount_erhejian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_SANHEDAO)
         {
            param1.apd_sanhedao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_sanhedao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_sanhedao.id,param1.apd_mount_sanhedao.id);
         }
         else if(param2 == ItemPositionRange.POSITION_MIEHUSHAN)
         {
            param1.apd_miehushan = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_miehushan = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_miehushan.id,param1.apd_mount_miehushan.id);
         }
         else if(param2 == ItemPositionRange.POSITION_QINGMINGDAO)
         {
            param1.apd_qingmingdao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_qingmingdao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_qingmingdao.id,param1.apd_mount_qingmingdao.id);
         }
         else if(param2 == ItemPositionRange.POSITION_HUOXINGFU)
         {
            param1.apd_huoxingfu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_huoxingfu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_huoxingfu.id,param1.apd_mount_huoxingfu.id);
         }
         else if(param2 == ItemPositionRange.POSITION_SHENZAO)
         {
            param1.apd_shenzao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_shenzao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_shenzao.id,param1.apd_mount_shenzao.id);
         }
         else if(param2 == ItemPositionRange.POSITION_KAITIANGONG)
         {
            param1.apd_kaitiangong = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_kaitiangong = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_kaitiangong.id,param1.apd_mount_kaitiangong.id);
         }
         else if(param2 == ItemPositionRange.POSITION_YANWENFENGMO)
         {
            param1.apd_yanwenfenmo = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_yanwenfenmo = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_yanwenfenmo.id,param1.apd_mount_yanwenfenmo.id);
         }
         else if(param2 == ItemPositionRange.POSITION_LINGLONGZI)
         {
            param1.apd_linglongzi = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_linglongzi = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_linglongzi.id,param1.apd_mount_linglongzi.id);
         }
         else if(param2 == ItemPositionRange.POSITION_SHASHENJIAN)
         {
            param1.apd_shashenjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_shashenjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_shashenjian.id,param1.apd_mount_shashenjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_DUANQINGJI)
         {
            param1.apd_duanqingji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_duanqingji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_duanqingji.id,param1.apd_mount_duanqingji.id);
         }
         else if(param2 == ItemPositionRange.POSITION_NULONG)
         {
            param1.apd_nulong = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_nulong = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_nulong.id,param1.apd_mount_nulong.id);
         }
         else if(param2 == ItemPositionRange.POSITION_QINIAN)
         {
            param1.apd_qinian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_qinian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_qinian.id,param1.apd_mount_qinian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_ZHUXIAN)
         {
            param1.apd_zhuxian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_zhuxian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_zhuxian.id,param1.apd_mount_zhuxian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_HANBING)
         {
            param1.apd_hanbing = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_hanbing = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_hanbing.id,param1.apd_mount_hanbing.id);
         }
         else if(param2 == ItemPositionRange.POSITION_POSHAN)
         {
            param1.apd_poshan = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_poshan = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_poshan.id,param1.apd_mount_poshan.id);
         }
         else if(param2 == ItemPositionRange.POSITION_HAIYU)
         {
            param1.apd_haiyu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_haiyu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_haiyu.id,param1.apd_mount_haiyu.id);
         }
         else if(param2 == ItemPositionRange.POSITION_TIANMINGDAO)
         {
            param1.apd_tianmingdao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_tianmingdao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_tianmingdao.id,param1.apd_mount_tianmingdao.id);
         }
         else if(param2 == ItemPositionRange.POSITION_JINGTIANYIJI)
         {
            param1.apd_jingtianyiji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_jingtianyiji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_jingtianyiji.id,param1.apd_mount_jingtianyiji.id);
         }
         else if(param2 == ItemPositionRange.POSITION_JINGLEIJUEDAO)
         {
            param1.apd_jingleijuedao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_jingleijuedao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_jingleijuedao.id,param1.apd_mount_jingleijuedao.id);
         }
         else if(param2 == ItemPositionRange.POSITION_YINGXIONGJIAN)
         {
            param1.apd_yingxiongjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_yingxiongjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_yingxiongjian.id,param1.apd_mount_yingxiongjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_CHANGSHENGJIAN)
         {
            param1.apd_changshengjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_changshengjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_changshengjian.id,param1.apd_mount_changshengjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_GUIYINGGONG)
         {
            param1.apd_guiyinggong = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_guiyinggong = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_guiyinggong.id,param1.apd_mount_guiyinggong.id);
         }
         else if(param2 == ItemPositionRange.POSITION_JINGLEIZHANG)
         {
            param1.apd_jingleizhang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_jingleizhang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_jingleizhang.id,param1.apd_mount_jingleizhang.id);
         }
         else if(param2 == ItemPositionRange.POSITION_HUNDUN)
         {
            param1.apd_hundun = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_hundun = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_hundun.id,param1.apd_mount_hundun.id);
         }
         else if(param2 == ItemPositionRange.POSITION_DINGHUN)
         {
            param1.apd_dinghun = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_dinghun = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_dinghun.id,param1.apd_mount_dinghun.id);
         }
         else if(param2 == ItemPositionRange.POSITION_WUJI)
         {
            param1.apd_tiandiwuji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_tiandiwuji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_tiandiwuji.id,param1.apd_mount_tiandiwuji.id);
         }
         else if(param2 == ItemPositionRange.POSITION_HUOXINGJIAN)
         {
            param1.apd_huoxingjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_huoxingjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_huoxingjian.id,param1.apd_mount_huoxingjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_WANGZHEFU)
         {
            param1.apd_wangzhefu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_wangzhefu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_wangzhefu.id,param1.apd_mount_wangzhefu.id);
         }
         else if(param2 == ItemPositionRange.POSITION_DUOMINGDAO)
         {
            param1.apd_duomingdao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_duomingdao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_duomingdao.id,param1.apd_mount_duomingdao.id);
         }
         else if(param2 == ItemPositionRange.POSITION_XIAOSHEN)
         {
            param1.apd_xiaoshen = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_xiaoshen = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_xiaoshen.id,param1.apd_mount_xiaoshen.id);
         }
         else if(param2 == ItemPositionRange.POSITION_WANSHI)
         {
            param1.apd_wanshi = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_wanshi = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_wanshi.id,param1.apd_mount_wanshi.id);
         }
         else if(param2 == ItemPositionRange.POSITION_ZHONGQIU)
         {
            param1.apd_zhongqiu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_zhongqiu = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_zhongqiu.id,param1.apd_mount_zhongqiu.id);
         }
         else if(param2 == ItemPositionRange.POSITION_SHENJIAN)
         {
            param1.apd_shenjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_shenjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_shenjian.id,param1.apd_mount_shenjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_YUHUAZHANG)
         {
            param1.apd_yuhuazhang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_yuhuazhang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_yuhuazhang.id,param1.apd_mount_yuhuazhang.id);
         }
         else if(param2 == ItemPositionRange.POSITION_BANIANGONG)
         {
            param1.apd_baniangong = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_baniangong = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_baniangong.id,param1.apd_mount_baniangong.id);
         }
         else if(param2 == ItemPositionRange.POSITION_BANIANJIAN)
         {
            param1.apd_banianjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_banianjian = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_banianjian.id,param1.apd_mount_banianjian.id);
         }
         else if(param2 == ItemPositionRange.POSITION_BANIANJI)
         {
            param1.apd_banianji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_banianji = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_banianji.id,param1.apd_mount_banianji.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2019SHENDAN)
         {
            param1.apd_2019shendan = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2019shendan = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2019shendan.id,param1.apd_mount_2019shendan.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2019GENGZI)
         {
            param1.apd_2019gengzi = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2019gengzi = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2019gengzi.id,param1.apd_mount_2019gengzi.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2019FEIHUA)
         {
            param1.apd_2019feihua = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2019feihua = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2019feihua.id,param1.apd_mount_2019feihua.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2019XIONGWANG)
         {
            param1.apd_2019xiongwang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2019xiongwang = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2019xiongwang.id,param1.apd_mount_2019xiongwang.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020XUEHUAN)
         {
            param1.apd_2020xuehuan = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020xuehuan = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020xuehuan.id,param1.apd_mount_2020xuehuan.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BADAO)
         {
            param1.apd_2020badao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020badao = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020badao.id,param1.apd_mount_2020badao.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN01)
         {
            param1.apd_2020baojian01 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian01 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian01.id,param1.apd_mount_2020baojian01.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN02)
         {
            param1.apd_2020baojian02 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian02 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian02.id,param1.apd_mount_2020baojian02.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN03)
         {
            param1.apd_2020baojian03 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian03 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian03.id,param1.apd_mount_2020baojian03.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN04)
         {
            param1.apd_2020baojian04 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian04 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian04.id,param1.apd_mount_2020baojian04.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN05)
         {
            param1.apd_2020baojian05 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian05 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian05.id,param1.apd_mount_2020baojian05.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN06)
         {
            param1.apd_2020baojian06 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian06 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian06.id,param1.apd_mount_2020baojian06.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN07)
         {
            param1.apd_2020baojian07 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian07 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian07.id,param1.apd_mount_2020baojian07.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN08)
         {
            param1.apd_2020baojian08 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian08 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian08.id,param1.apd_mount_2020baojian08.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN09)
         {
            param1.apd_2020baojian09 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian09 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian09.id,param1.apd_mount_2020baojian09.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN10)
         {
            param1.apd_2020baojian10 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian10 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian10.id,param1.apd_mount_2020baojian10.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN11)
         {
            param1.apd_2020baojian11 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian11 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian11.id,param1.apd_mount_2020baojian11.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN12)
         {
            param1.apd_2020baojian12 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian12 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian12.id,param1.apd_mount_2020baojian12.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN13)
         {
            param1.apd_2020baojian13 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian13 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian13.id,param1.apd_mount_2020baojian13.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN14)
         {
            param1.apd_2020baojian14 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian14 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian14.id,param1.apd_mount_2020baojian14.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN15)
         {
            param1.apd_2020baojian15 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian15 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian15.id,param1.apd_mount_2020baojian15.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN16)
         {
            param1.apd_2020baojian16 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian16 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian16.id,param1.apd_mount_2020baojian16.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN17)
         {
            param1.apd_2020baojian17 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian17 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian17.id,param1.apd_mount_2020baojian17.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN18)
         {
            param1.apd_2020baojian18 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian18 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian18.id,param1.apd_mount_2020baojian18.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN19)
         {
            param1.apd_2020baojian19 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian19 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian19.id,param1.apd_mount_2020baojian19.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN20)
         {
            param1.apd_2020baojian20 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian20 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian20.id,param1.apd_mount_2020baojian20.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN21)
         {
            param1.apd_2020baojian21 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian21 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian21.id,param1.apd_mount_2020baojian21.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN22)
         {
            param1.apd_2020baojian22 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian22 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian22.id,param1.apd_mount_2020baojian22.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN23)
         {
            param1.apd_2020baojian23 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian23 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian23.id,param1.apd_mount_2020baojian23.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN24)
         {
            param1.apd_2020baojian24 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian24 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian24.id,param1.apd_mount_2020baojian24.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN25)
         {
            param1.apd_2020baojian25 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian25 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian25.id,param1.apd_mount_2020baojian25.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN26)
         {
            param1.apd_2020baojian26 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian26 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian26.id,param1.apd_mount_2020baojian26.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN27)
         {
            param1.apd_2020baojian27 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian27 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian27.id,param1.apd_mount_2020baojian27.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN28)
         {
            param1.apd_2020baojian28 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian28 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian28.id,param1.apd_mount_2020baojian28.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN29)
         {
            param1.apd_2020baojian29 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian29 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian29.id,param1.apd_mount_2020baojian29.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN30)
         {
            param1.apd_2020baojian30 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian30 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian30.id,param1.apd_mount_2020baojian30.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN31)
         {
            param1.apd_2020baojian31 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian31 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian31.id,param1.apd_mount_2020baojian31.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN32)
         {
            param1.apd_2020baojian32 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian32 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian32.id,param1.apd_mount_2020baojian32.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN33)
         {
            param1.apd_2020baojian33 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian33 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian33.id,param1.apd_mount_2020baojian33.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN34)
         {
            param1.apd_2020baojian34 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian34 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian34.id,param1.apd_mount_2020baojian34.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN35)
         {
            param1.apd_2020baojian35 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian35 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian35.id,param1.apd_mount_2020baojian35.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN36)
         {
            param1.apd_2020baojian36 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian36 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian36.id,param1.apd_mount_2020baojian36.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN37)
         {
            param1.apd_2020baojian37 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian37 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian37.id,param1.apd_mount_2020baojian37.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN38)
         {
            param1.apd_2020baojian38 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian38 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian38.id,param1.apd_mount_2020baojian38.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN39)
         {
            param1.apd_2020baojian39 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian39 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian39.id,param1.apd_mount_2020baojian39.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN40)
         {
            param1.apd_2020baojian40 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian40 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian40.id,param1.apd_mount_2020baojian40.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN41)
         {
            param1.apd_2020baojian41 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian41 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian41.id,param1.apd_mount_2020baojian41.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN42)
         {
            param1.apd_2020baojian42 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian42 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian42.id,param1.apd_mount_2020baojian42.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN43)
         {
            param1.apd_2020baojian43 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian43 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian43.id,param1.apd_mount_2020baojian43.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN44)
         {
            param1.apd_2020baojian44 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian44 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian44.id,param1.apd_mount_2020baojian44.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN45)
         {
            param1.apd_2020baojian45 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian45 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian45.id,param1.apd_mount_2020baojian45.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN46)
         {
            param1.apd_2020baojian46 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian46 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian46.id,param1.apd_mount_2020baojian46.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN47)
         {
            param1.apd_2020baojian47 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian47 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian47.id,param1.apd_mount_2020baojian47.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN48)
         {
            param1.apd_2020baojian48 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian48 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian48.id,param1.apd_mount_2020baojian48.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN49)
         {
            param1.apd_2020baojian49 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian49 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian49.id,param1.apd_mount_2020baojian49.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN50)
         {
            param1.apd_2020baojian50 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian50 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian50.id,param1.apd_mount_2020baojian50.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN51)
         {
            param1.apd_2020baojian51 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian51 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian51.id,param1.apd_mount_2020baojian51.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN52)
         {
            param1.apd_2020baojian52 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian52 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian52.id,param1.apd_mount_2020baojian52.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN53)
         {
            param1.apd_2020baojian53 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian53 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian53.id,param1.apd_mount_2020baojian53.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN54)
         {
            param1.apd_2020baojian54 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian54 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian54.id,param1.apd_mount_2020baojian54.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN55)
         {
            param1.apd_2020baojian55 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian55 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian55.id,param1.apd_mount_2020baojian55.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN56)
         {
            param1.apd_2020baojian56 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian56 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian56.id,param1.apd_mount_2020baojian56.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN57)
         {
            param1.apd_2020baojian57 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian57 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian57.id,param1.apd_mount_2020baojian57.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN58)
         {
            param1.apd_2020baojian58 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian58 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian58.id,param1.apd_mount_2020baojian58.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN59)
         {
            param1.apd_2020baojian59 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian59 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian59.id,param1.apd_mount_2020baojian59.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN60)
         {
            param1.apd_2020baojian60 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian60 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian60.id,param1.apd_mount_2020baojian60.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN61)
         {
            param1.apd_2020baojian61 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian61 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian61.id,param1.apd_mount_2020baojian61.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN62)
         {
            param1.apd_2020baojian62 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian62 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian62.id,param1.apd_mount_2020baojian62.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN63)
         {
            param1.apd_2020baojian63 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian63 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian63.id,param1.apd_mount_2020baojian63.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN64)
         {
            param1.apd_2020baojian64 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian64 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian64.id,param1.apd_mount_2020baojian64.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN65)
         {
            param1.apd_2020baojian65 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian65 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian65.id,param1.apd_mount_2020baojian65.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN66)
         {
            param1.apd_2020baojian66 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian66 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian66.id,param1.apd_mount_2020baojian66.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN67)
         {
            param1.apd_2020baojian67 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian67 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian67.id,param1.apd_mount_2020baojian67.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN68)
         {
            param1.apd_2020baojian68 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian68 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian68.id,param1.apd_mount_2020baojian68.id);
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN69)
         {
            param1.apd_2020baojian69 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            param1.apd_mount_2020baojian69 = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3),AvatarPartType.WEAPON);
            _loc6_.push(param1.apd_2020baojian69.id,param1.apd_mount_2020baojian69.id);
         }
         return _loc6_;
      }
      
      public static function taskOffAvatarData(param1:AvatarInfo, param2:int, param3:int, param4:int) : Array
      {
         var _loc5_:Array = [];
         if(param2 == ItemPositionRange.POSTION_YIFU || param2 == ItemPositionRange.POSTION_KUAPINGTAI_BIWU_SHIZHUANG)
         {
            if(param1.apd_body != null && param1.apd_body.sourcePath == ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_body.id);
               param1.apd_body = null;
            }
            if(param1.apd_mount_body != null && param1.apd_mount_body.sourcePath == ResPathManager.getAvatarPath_ClothesOnMount(ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_body.id);
               param1.apd_mount_body = null;
            }
         }
         else if(param2 == ItemPositionRange.POSTION_WUQI)
         {
            if(param1.apd_weapon != null && param1.apd_weapon.sourcePath == ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_weapon.id);
               param1.apd_weapon = null;
            }
         }
         else if(param2 == ItemPositionRange.POSTION_BOW)
         {
            if(param1.apd_bow != null && param1.apd_bow.sourcePath == ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_bow.id);
               param1.apd_bow = null;
            }
            if(param1.apd_mount_bow != null && param1.apd_mount_bow.sourcePath == ResPathManager.getAvatarPath_ClothesOnMount(ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_bow.id);
               param1.apd_mount_bow = null;
            }
         }
         else if(param2 == ItemPositionRange.POSTION_ZHENHUN)
         {
            if(param1.apd_zhenhun != null && param1.apd_zhenhun.sourcePath == ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_zhenhun.id);
               param1.apd_zhenhun = null;
            }
            if(param1.apd_mount_zhenhun != null && param1.apd_mount_zhenhun.sourcePath == ResPathManager.getAvatarPath_ClothesOnMount(ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_zhenhun.id);
               param1.apd_mount_zhenhun = null;
            }
         }
         else if(param2 == ItemPositionRange.POSTION_QIBING)
         {
            if(param4 == 1)
            {
               if(param1.apd_mount_weapon != null && param1.apd_mount_weapon.sourcePath == ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param3))
               {
                  _loc5_.push(param1.apd_mount_weapon.id);
                  param1.apd_mount_weapon = null;
               }
            }
            else if(param1.apd_mount_weapon != null && param1.apd_mount_weapon.sourcePath == ResPathManager.getAvatarPath_ClothesOnMount_weapon_female(ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_weapon.id);
               param1.apd_mount_weapon = null;
            }
         }
         if(OtherConst.texiaoBoolean)
         {
            return _loc5_;
         }
         if(param2 == ItemPositionRange.POSTION_YLZR)
         {
            if(param1.apd_ylzr != null && param1.apd_ylzr.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_ylzr.id);
               param1.apd_ylzr = null;
            }
            if(param1.apd_mount_ylzr != null && param1.apd_mount_ylzr.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_ylzr.id);
               param1.apd_mount_ylzr = null;
            }
         }
         else if(param2 == ItemPositionRange.POSTION_STDRJ)
         {
            if(param1.apd_xyj != null && param1.apd_xyj.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_xyj.id);
               param1.apd_xyj = null;
            }
            if(param1.apd_mount_xyj != null && param1.apd_mount_xyj.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_xyj.id);
               param1.apd_mount_xyj = null;
            }
         }
         else if(param2 == ItemPositionRange.POSTION_AOJIAN)
         {
            if(param1.apd_aojian != null && param1.apd_aojian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_aojian.id);
               param1.apd_aojian = null;
            }
            if(param1.apd_mount_aojian != null && param1.apd_mount_aojian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_aojian.id);
               param1.apd_mount_aojian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_NB_WEAPON_ARR[0])
         {
            if(param1.apd_longyin != null && param1.apd_longyin.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_longyin.id);
               param1.apd_longyin = null;
            }
            if(param1.apd_mount_longyin != null && param1.apd_mount_longyin.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_longyin.id);
               param1.apd_mount_longyin = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_NB_WEAPON_ARR[4])
         {
            if(param1.apd_liekong != null && param1.apd_liekong.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_liekong.id);
               param1.apd_liekong = null;
            }
            if(param1.apd_mount_liekong != null && param1.apd_mount_liekong.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_liekong.id);
               param1.apd_mount_liekong = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_NB_WEAPON_ARR[3])
         {
            if(param1.apd_tianshang != null && param1.apd_tianshang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_tianshang.id);
               param1.apd_tianshang = null;
            }
            if(param1.apd_mount_tianshang != null && param1.apd_mount_tianshang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_tianshang.id);
               param1.apd_mount_tianshang = null;
            }
         }
         else if(param2 == ItemPositionRange.POSTION_SHENQI)
         {
            if(param1.apd_shenqi != null && param1.apd_shenqi.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_shenqi.id);
               param1.apd_shenqi = null;
            }
            if(param1.apd_mount_shenqi != null && param1.apd_mount_shenqi.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_shenqi.id);
               param1.apd_mount_shenqi = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_NB_WEAPON_ARR[1])
         {
            if(param1.apd_quanshen != null && param1.apd_quanshen.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_quanshen.id);
               param1.apd_quanshen = null;
            }
            if(param1.apd_mount_quanshen != null && param1.apd_mount_quanshen.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_quanshen.id);
               param1.apd_mount_quanshen = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_NB_WEAPON_ARR[2])
         {
            if(param1.apd_longya != null && param1.apd_longya.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_longya.id);
               param1.apd_longya = null;
            }
            if(param1.apd_mount_longya != null && param1.apd_mount_longya.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_longya.id);
               param1.apd_mount_longya = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_NB_WEAPON_ARR[9])
         {
            if(param1.apd_potianren != null && param1.apd_potianren.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_potianren.id);
               param1.apd_potianren = null;
            }
            if(param1.apd_mount_potianren != null && param1.apd_mount_potianren.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_potianren.id);
               param1.apd_mount_potianren = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_NB_WEAPON_ARR[7])
         {
            if(param1.apd_pangu != null && param1.apd_pangu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_pangu.id);
               param1.apd_pangu = null;
            }
            if(param1.apd_mount_pangu != null && param1.apd_mount_pangu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_pangu.id);
               param1.apd_mount_pangu = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_NB_WEAPON_ARR[8])
         {
            if(param1.apd_xueyindao != null && param1.apd_xueyindao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_xueyindao.id);
               param1.apd_xueyindao = null;
            }
            if(param1.apd_mount_xueyindao != null && param1.apd_mount_xueyindao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_xueyindao.id);
               param1.apd_mount_xueyindao = null;
            }
         }
         else if(param2 == ItemPositionRange.POSTION_GJMY)
         {
            if(param1.apd_gjmy != null && param1.apd_gjmy.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_gjmy.id);
               param1.apd_gjmy = null;
            }
            if(param1.apd_mount_gjmy != null && param1.apd_mount_gjmy.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_gjmy.id);
               param1.apd_mount_gjmy = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_LONGYA)
         {
            if(param1.apd_longya1 != null && param1.apd_longya1.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_longya1.id);
               param1.apd_longya1 = null;
            }
            if(param1.apd_mount_longya1 != null && param1.apd_mount_longya1.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_longya1.id);
               param1.apd_mount_longya1 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_YAYUEDAO)
         {
            if(param1.apd_yanyuedao != null && param1.apd_yanyuedao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_yanyuedao.id);
               param1.apd_yanyuedao = null;
            }
            if(param1.apd_mount_yanyuedao != null && param1.apd_mount_yanyuedao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_yanyuedao.id);
               param1.apd_mount_yanyuedao = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_XUANTIEZHONGJIAN)
         {
            if(param1.apd_xuantiezhongjian != null && param1.apd_xuantiezhongjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_xuantiezhongjian.id);
               param1.apd_xuantiezhongjian = null;
            }
            if(param1.apd_mount_xuantiezhongjian != null && param1.apd_mount_xuantiezhongjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_xuantiezhongjian.id);
               param1.apd_mount_xuantiezhongjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_GUANGMINGZHANG)
         {
            if(param1.apd_guangmingzhang != null && param1.apd_guangmingzhang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_guangmingzhang.id);
               param1.apd_guangmingzhang = null;
            }
            if(param1.apd_mount_guangmingzhang != null && param1.apd_mount_guangmingzhang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_guangmingzhang.id);
               param1.apd_mount_guangmingzhang = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_HUIMIE)
         {
            if(param1.apd_huimie != null && param1.apd_huimie.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_huimie.id);
               param1.apd_huimie = null;
            }
            if(param1.apd_mount_huimie != null && param1.apd_mount_huimie.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_huimie.id);
               param1.apd_mount_huimie = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_ZHUMOZHANG)
         {
            if(param1.apd_zhumozhang != null && param1.apd_zhumozhang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_zhumozhang.id);
               param1.apd_zhumozhang = null;
            }
            if(param1.apd_mount_zhumozhang != null && param1.apd_mount_zhumozhang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_zhumozhang.id);
               param1.apd_mount_zhumozhang = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_CHIYAN)
         {
            if(param1.apd_chiyan != null && param1.apd_chiyan.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_chiyan.id);
               param1.apd_chiyan = null;
            }
            if(param1.apd_mount_chiyan != null && param1.apd_mount_chiyan.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_chiyan.id);
               param1.apd_mount_chiyan = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_TIANJING)
         {
            if(param1.apd_tianjing != null && param1.apd_tianjing.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_tianjing.id);
               param1.apd_tianjing = null;
            }
            if(param1.apd_mount_tianjing != null && param1.apd_mount_tianjing.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_tianjing.id);
               param1.apd_mount_tianjing = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_FENGTIANJI)
         {
            if(param1.apd_fengtianji != null && param1.apd_fengtianji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_fengtianji.id);
               param1.apd_fengtianji = null;
            }
            if(param1.apd_mount_fengtianji != null && param1.apd_mount_fengtianji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_fengtianji.id);
               param1.apd_mount_fengtianji = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_HUOLONGDAO)
         {
            if(param1.apd_huolongdao != null && param1.apd_huolongdao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_huolongdao.id);
               param1.apd_huolongdao = null;
            }
            if(param1.apd_mount_huolongdao != null && param1.apd_mount_huolongdao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_huolongdao.id);
               param1.apd_mount_huolongdao = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_TIANZHU)
         {
            if(param1.apd_tianzhu != null && param1.apd_tianzhu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_tianzhu.id);
               param1.apd_tianzhu = null;
            }
            if(param1.apd_mount_tianzhu != null && param1.apd_mount_tianzhu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_tianzhu.id);
               param1.apd_mount_tianzhu = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_PANGUKAITIANFU)
         {
            if(param1.apd_pangukaitianfu != null && param1.apd_pangukaitianfu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_pangukaitianfu.id);
               param1.apd_pangukaitianfu = null;
            }
            if(param1.apd_mount_pangukaitianfu != null && param1.apd_mount_pangukaitianfu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_pangukaitianfu.id);
               param1.apd_mount_pangukaitianfu = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_TIANDI)
         {
            if(param1.apd_tiandijian != null && param1.apd_tiandijian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_tiandijian.id);
               param1.apd_tiandijian = null;
            }
            if(param1.apd_mount_tiandijian != null && param1.apd_mount_tiandijian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_tiandijian.id);
               param1.apd_mount_tiandijian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_HANQIBINGPO)
         {
            if(param1.apd_hanqibingpo != null && param1.apd_hanqibingpo.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_hanqibingpo.id);
               param1.apd_hanqibingpo = null;
            }
            if(param1.apd_mount_hanqibingpo != null && param1.apd_mount_hanqibingpo.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_hanqibingpo.id);
               param1.apd_mount_hanqibingpo = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_JIANZUNLONGQUANJIAN)
         {
            if(param1.apd_jianzunlongquanjian != null && param1.apd_jianzunlongquanjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_jianzunlongquanjian.id);
               param1.apd_jianzunlongquanjian = null;
            }
            if(param1.apd_mount_jianzunlongquanjian != null && param1.apd_mount_jianzunlongquanjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_jianzunlongquanjian.id);
               param1.apd_mount_jianzunlongquanjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_CHUANGSHI)
         {
            if(param1.apd_chuangshi != null && param1.apd_chuangshi.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_chuangshi.id);
               param1.apd_chuangshi = null;
            }
            if(param1.apd_mount_chuangshi != null && param1.apd_mount_chuangshi.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_chuangshi.id);
               param1.apd_mount_chuangshi = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_SUILIESHIFU)
         {
            if(param1.apd_suilieshifu != null && param1.apd_suilieshifu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_suilieshifu.id);
               param1.apd_suilieshifu = null;
            }
            if(param1.apd_mount_suilieshifu != null && param1.apd_mount_suilieshifu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_suilieshifu.id);
               param1.apd_mount_suilieshifu = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_MOYUAN)
         {
            if(param1.apd_moyuan != null && param1.apd_moyuan.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_moyuan.id);
               param1.apd_moyuan = null;
            }
            if(param1.apd_mount_moyuan != null && param1.apd_mount_moyuan.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_moyuan.id);
               param1.apd_mount_moyuan = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_CHENGJIECHANGJI)
         {
            if(param1.apd_chengjiechangji != null && param1.apd_chengjiechangji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_chengjiechangji.id);
               param1.apd_chengjiechangji = null;
            }
            if(param1.apd_mount_chengjiechangji != null && param1.apd_mount_chengjiechangji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_chengjiechangji.id);
               param1.apd_mount_chengjiechangji = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_TIANXIEJIAN)
         {
            if(param1.apd_tianxiejian != null && param1.apd_tianxiejian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_tianxiejian.id);
               param1.apd_tianxiejian = null;
            }
            if(param1.apd_mount_tianxiejian != null && param1.apd_mount_tianxiejian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_tianxiejian.id);
               param1.apd_mount_tianxiejian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_JUNZIJIAN)
         {
            if(param1.apd_junzijian != null && param1.apd_junzijian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_junzijian.id);
               param1.apd_junzijian = null;
            }
            if(param1.apd_mount_junzijian != null && param1.apd_mount_junzijian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_junzijian.id);
               param1.apd_mount_junzijian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_WANGZHEJIAN)
         {
            if(param1.apd_wangzhejian != null && param1.apd_wangzhejian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_wangzhejian.id);
               param1.apd_wangzhejian = null;
            }
            if(param1.apd_mount_wangzhejian != null && param1.apd_mount_wangzhejian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_wangzhejian.id);
               param1.apd_mount_wangzhejian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_FENGBAODAO)
         {
            if(param1.apd_fengbaodao != null && param1.apd_fengbaodao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_fengbaodao.id);
               param1.apd_fengbaodao = null;
            }
            if(param1.apd_mount_fengbaodao != null && param1.apd_mount_fengbaodao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_fengbaodao.id);
               param1.apd_mount_fengbaodao = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_FENGYUN)
         {
            if(param1.apd_fengyun != null && param1.apd_fengyun.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_fengyun.id);
               param1.apd_fengyun = null;
            }
            if(param1.apd_mount_fengyun != null && param1.apd_mount_fengyun.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_fengyun.id);
               param1.apd_mount_fengyun = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_SHENGDAN2015)
         {
            if(param1.apd_shengdan2015 != null && param1.apd_shengdan2015.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_shengdan2015.id);
               param1.apd_shengdan2015 = null;
            }
            if(param1.apd_mount_shengdan2015 != null && param1.apd_mount_shengdan2015.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_shengdan2015.id);
               param1.apd_mount_shengdan2015 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_FENGSHA)
         {
            if(param1.apd_fengsha != null && param1.apd_fengsha.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_fengsha.id);
               param1.apd_fengsha = null;
            }
            if(param1.apd_mount_fengsha != null && param1.apd_mount_fengsha.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_fengsha.id);
               param1.apd_mount_fengsha = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_FENGYIJIAN)
         {
            if(param1.apd_fengyijian != null && param1.apd_fengyijian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_fengyijian.id);
               param1.apd_fengyijian = null;
            }
            if(param1.apd_mount_fengyijian != null && param1.apd_mount_fengyijian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_fengyijian.id);
               param1.apd_mount_fengyijian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_LEXINJI)
         {
            if(param1.apd_lexinji != null && param1.apd_lexinji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_lexinji.id);
               param1.apd_lexinji = null;
            }
            if(param1.apd_mount_lexinji != null && param1.apd_mount_lexinji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_lexinji.id);
               param1.apd_mount_lexinji = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_FENGYINGJIAN)
         {
            if(param1.apd_fengyingjian != null && param1.apd_fengyingjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_fengyingjian.id);
               param1.apd_fengyingjian = null;
            }
            if(param1.apd_mount_fengyingjian != null && param1.apd_mount_fengyingjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_fengyingjian.id);
               param1.apd_mount_fengyingjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_ZHENFENGJIAN)
         {
            if(param1.apd_zhenfengjian != null && param1.apd_zhenfengjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_zhenfengjian.id);
               param1.apd_zhenfengjian = null;
            }
            if(param1.apd_mount_zhenfengjian != null && param1.apd_mount_zhenfengjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_zhenfengjian.id);
               param1.apd_mount_zhenfengjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_FENGYUNJIAN)
         {
            if(param1.apd_fengyunjian != null && param1.apd_fengyunjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_fengyunjian.id);
               param1.apd_fengyunjian = null;
            }
            if(param1.apd_mount_fengyunjian != null && param1.apd_mount_fengyunjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_fengyunjian.id);
               param1.apd_mount_fengyunjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_BINGFENGJIAN)
         {
            if(param1.apd_bingfengjian != null && param1.apd_bingfengjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_bingfengjian.id);
               param1.apd_bingfengjian = null;
            }
            if(param1.apd_mount_bingfengjian != null && param1.apd_mount_bingfengjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_bingfengjian.id);
               param1.apd_mount_bingfengjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_HONGLEIZHANGU)
         {
            if(param1.apd_hongleizhangu != null && param1.apd_hongleizhangu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_hongleizhangu.id);
               param1.apd_hongleizhangu = null;
            }
            if(param1.apd_mount_hongleizhangu != null && param1.apd_mount_hongleizhangu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_hongleizhangu.id);
               param1.apd_mount_hongleizhangu = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_SANDENGGUFO)
         {
            if(param1.apd_sandenggufo != null && param1.apd_sandenggufo.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_sandenggufo.id);
               param1.apd_sandenggufo = null;
            }
            if(param1.apd_mount_sandenggufo != null && param1.apd_mount_sandenggufo.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_sandenggufo.id);
               param1.apd_mount_sandenggufo = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_FONUJI)
         {
            if(param1.apd_fonuji != null && param1.apd_fonuji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_fonuji.id);
               param1.apd_fonuji = null;
            }
            if(param1.apd_mount_fonuji != null && param1.apd_mount_fonuji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_fonuji.id);
               param1.apd_mount_fonuji = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_FENGYINJIAN)
         {
            if(param1.apd_fengyinjian != null && param1.apd_fengyinjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_fengyinjian.id);
               param1.apd_fengyinjian = null;
            }
            if(param1.apd_mount_fengyinjian != null && param1.apd_mount_fengyinjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_fengyinjian.id);
               param1.apd_mount_fengyinjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_TIANMAJIAN)
         {
            if(param1.apd_tianmajian != null && param1.apd_tianmajian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_tianmajian.id);
               param1.apd_tianmajian = null;
            }
            if(param1.apd_mount_tianmajian != null && param1.apd_mount_tianmajian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_tianmajian.id);
               param1.apd_mount_tianmajian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_WUHUNJIAN)
         {
            if(param1.apd_wuhunjian != null && param1.apd_wuhunjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_wuhunjian.id);
               param1.apd_wuhunjian = null;
            }
            if(param1.apd_mount_wuhunjian != null && param1.apd_mount_wuhunjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_wuhunjian.id);
               param1.apd_mount_wuhunjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_ZHENTIANJIAN)
         {
            if(param1.apd_zhentianjian != null && param1.apd_zhentianjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_zhentianjian.id);
               param1.apd_zhentianjian = null;
            }
            if(param1.apd_mount_zhentianjian != null && param1.apd_mount_zhentianjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_zhentianjian.id);
               param1.apd_mount_zhentianjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_TIANXUE)
         {
            if(param1.apd_tianxue != null && param1.apd_tianxue.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_tianxue.id);
               param1.apd_tianxue = null;
            }
            if(param1.apd_mount_tianxue != null && param1.apd_mount_tianxue.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_tianxue.id);
               param1.apd_mount_tianxue = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_XIONGJIJIAN)
         {
            if(param1.apd_xiongjijian != null && param1.apd_xiongjijian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_xiongjijian.id);
               param1.apd_xiongjijian = null;
            }
            if(param1.apd_mount_xiongjijian != null && param1.apd_mount_xiongjijian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_xiongjijian.id);
               param1.apd_mount_xiongjijian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_WUJINJIAN)
         {
            if(param1.apd_wujinjian != null && param1.apd_wujinjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_wujinjian.id);
               param1.apd_wujinjian = null;
            }
            if(param1.apd_mount_wujinjian != null && param1.apd_mount_wujinjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_wujinjian.id);
               param1.apd_mount_wujinjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_SHUNTIANJIAN)
         {
            if(param1.apd_shuntianjian != null && param1.apd_shuntianjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_shuntianjian.id);
               param1.apd_shuntianjian = null;
            }
            if(param1.apd_mount_shuntianjian != null && param1.apd_mount_shuntianjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_shuntianjian.id);
               param1.apd_mount_shuntianjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_WANGZHEQICANG)
         {
            if(param1.apd_wangzheqicang != null && param1.apd_wangzheqicang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_wangzheqicang.id);
               param1.apd_wangzheqicang = null;
            }
            if(param1.apd_mount_wangzheqicang != null && param1.apd_mount_wangzheqicang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_wangzheqicang.id);
               param1.apd_mount_wangzheqicang = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_BIXUEJIAN)
         {
            if(param1.apd_bixuejian != null && param1.apd_bixuejian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_bixuejian.id);
               param1.apd_bixuejian = null;
            }
            if(param1.apd_mount_bixuejian != null && param1.apd_mount_bixuejian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_bixuejian.id);
               param1.apd_mount_bixuejian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_WUYIJIAN)
         {
            if(param1.apd_wuyijian != null && param1.apd_wuyijian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_wuyijian.id);
               param1.apd_wuyijian = null;
            }
            if(param1.apd_mount_wuyijian != null && param1.apd_mount_wuyijian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_wuyijian.id);
               param1.apd_mount_wuyijian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_SHIJIANSHENQI)
         {
            if(param1.apd_shijianshenqi != null && param1.apd_shijianshenqi.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_shijianshenqi.id);
               param1.apd_shijianshenqi = null;
            }
            if(param1.apd_mount_shijianshenqi != null && param1.apd_mount_shijianshenqi.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_shijianshenqi.id);
               param1.apd_mount_shijianshenqi = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_QINGFENGJIAN)
         {
            if(param1.apd_qingfengjian != null && param1.apd_qingfengjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_qingfengjian.id);
               param1.apd_qingfengjian = null;
            }
            if(param1.apd_mount_qingfengjian != null && param1.apd_mount_qingfengjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_qingfengjian.id);
               param1.apd_mount_qingfengjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_HUOLINJIAN)
         {
            if(param1.apd_huolinjian != null && param1.apd_huolinjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_huolinjian.id);
               param1.apd_huolinjian = null;
            }
            if(param1.apd_mount_huolinjian != null && param1.apd_mount_huolinjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_huolinjian.id);
               param1.apd_mount_huolinjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_ZHUIHUNJI)
         {
            if(param1.apd_zhuihunji != null && param1.apd_zhuihunji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_zhuihunji.id);
               param1.apd_zhuihunji = null;
            }
            if(param1.apd_mount_zhuihunji != null && param1.apd_mount_zhuihunji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_zhuihunji.id);
               param1.apd_mount_zhuihunji = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_BIYUDAO)
         {
            if(param1.apd_biyudao != null && param1.apd_biyudao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_biyudao.id);
               param1.apd_biyudao = null;
            }
            if(param1.apd_mount_biyudao != null && param1.apd_mount_biyudao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_biyudao.id);
               param1.apd_mount_biyudao = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_WUWOZHANG)
         {
            if(param1.apd_wuwozhang != null && param1.apd_wuwozhang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_wuwozhang.id);
               param1.apd_wuwozhang = null;
            }
            if(param1.apd_mount_wuwozhang != null && param1.apd_mount_wuwozhang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_wuwozhang.id);
               param1.apd_mount_wuwozhang = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_YEHUOHONGLIAN)
         {
            if(param1.apd_yehuohonglian != null && param1.apd_yehuohonglian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_yehuohonglian.id);
               param1.apd_yehuohonglian = null;
            }
            if(param1.apd_mount_yehuohonglian != null && param1.apd_mount_yehuohonglian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_yehuohonglian.id);
               param1.apd_mount_yehuohonglian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_MINGYUEDAO)
         {
            if(param1.apd_mingyuedao != null && param1.apd_mingyuedao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mingyuedao.id);
               param1.apd_mingyuedao = null;
            }
            if(param1.apd_mount_mingyuedao != null && param1.apd_mount_mingyuedao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_mingyuedao.id);
               param1.apd_mount_mingyuedao = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_QINGFENGJIAN2)
         {
            if(param1.apd_qingfengjian2 != null && param1.apd_qingfengjian2.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_qingfengjian2.id);
               param1.apd_qingfengjian2 = null;
            }
            if(param1.apd_mount_qingfengjian2 != null && param1.apd_mount_qingfengjian2.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_qingfengjian2.id);
               param1.apd_mount_qingfengjian2 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_ZHIZUNJIAN)
         {
            if(param1.apd_zhizunjian != null && param1.apd_zhizunjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_zhizunjian.id);
               param1.apd_zhizunjian = null;
            }
            if(param1.apd_mount_zhizunjian != null && param1.apd_mount_zhizunjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_zhizunjian.id);
               param1.apd_mount_zhizunjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_BAOLEIJI)
         {
            if(param1.apd_baoleiji != null && param1.apd_baoleiji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_baoleiji.id);
               param1.apd_baoleiji = null;
            }
            if(param1.apd_mount_baoleiji != null && param1.apd_mount_baoleiji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_baoleiji.id);
               param1.apd_mount_baoleiji = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_MINGSHENGZHANG)
         {
            if(param1.apd_mingshengzhang != null && param1.apd_mingshengzhang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mingshengzhang.id);
               param1.apd_mingshengzhang = null;
            }
            if(param1.apd_mount_mingshengzhang != null && param1.apd_mount_mingshengzhang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_mingshengzhang.id);
               param1.apd_mount_mingshengzhang = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_ZUNSHIJIAN)
         {
            if(param1.apd_zunshijian != null && param1.apd_zunshijian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_zunshijian.id);
               param1.apd_zunshijian = null;
            }
            if(param1.apd_mount_zunshijian != null && param1.apd_mount_zunshijian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_zunshijian.id);
               param1.apd_mount_zunshijian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_RENZHEZHANG)
         {
            if(param1.apd_renzhezhang != null && param1.apd_renzhezhang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_renzhezhang.id);
               param1.apd_renzhezhang = null;
            }
            if(param1.apd_mount_renzhezhang != null && param1.apd_mount_renzhezhang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_renzhezhang.id);
               param1.apd_mount_renzhezhang = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_ZHIZHEJIAN)
         {
            if(param1.apd_zhizhejian != null && param1.apd_zhizhejian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_zhizhejian.id);
               param1.apd_zhizhejian = null;
            }
            if(param1.apd_mount_zhizhejian != null && param1.apd_mount_zhizhejian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_zhizhejian.id);
               param1.apd_mount_zhizhejian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_YANGMINGJIAN)
         {
            if(param1.apd_yangmingjian != null && param1.apd_yangmingjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_yangmingjian.id);
               param1.apd_yangmingjian = null;
            }
            if(param1.apd_mount_yangmingjian != null && param1.apd_mount_yangmingjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_yangmingjian.id);
               param1.apd_mount_yangmingjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_XIWANGJIAN)
         {
            if(param1.apd_xiwangjian != null && param1.apd_xiwangjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_xiwangjian.id);
               param1.apd_xiwangjian = null;
            }
            if(param1.apd_mount_xiwangjian != null && param1.apd_mount_xiwangjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_xiwangjian.id);
               param1.apd_mount_xiwangjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_XUEJINGJIAN)
         {
            if(param1.apd_xuejingjian != null && param1.apd_xuejingjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_xuejingjian.id);
               param1.apd_xuejingjian = null;
            }
            if(param1.apd_mount_xuejingjian != null && param1.apd_mount_xuejingjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_xuejingjian.id);
               param1.apd_mount_xuejingjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_XUANBINGJIAN)
         {
            if(param1.apd_xuanbingjian != null && param1.apd_xuanbingjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_xuanbingjian.id);
               param1.apd_xuanbingjian = null;
            }
            if(param1.apd_mount_xuanbingjian != null && param1.apd_mount_xuanbingjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_xuanbingjian.id);
               param1.apd_mount_xuanbingjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_PINGANJIAN)
         {
            if(param1.apd_pinganjian != null && param1.apd_pinganjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_pinganjian.id);
               param1.apd_pinganjian = null;
            }
            if(param1.apd_mount_pinganjian != null && param1.apd_mount_pinganjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_pinganjian.id);
               param1.apd_mount_pinganjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_QINGHUAJIAN)
         {
            if(param1.apd_qinghuajian != null && param1.apd_qinghuajian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_qinghuajian.id);
               param1.apd_qinghuajian = null;
            }
            if(param1.apd_mount_qinghuajian != null && param1.apd_mount_qinghuajian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_qinghuajian.id);
               param1.apd_mount_qinghuajian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_YUXUJIAN)
         {
            if(param1.apd_yuxujian != null && param1.apd_yuxujian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_yuxujian.id);
               param1.apd_yuxujian = null;
            }
            if(param1.apd_mount_yuxujian != null && param1.apd_mount_yuxujian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_yuxujian.id);
               param1.apd_mount_yuxujian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_YUQINGSHAN)
         {
            if(param1.apd_yuqingshan != null && param1.apd_yuqingshan.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_yuqingshan.id);
               param1.apd_yuqingshan = null;
            }
            if(param1.apd_mount_yuqingshan != null && param1.apd_mount_yuqingshan.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_yuqingshan.id);
               param1.apd_mount_yuqingshan = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_HUOMODAO)
         {
            if(param1.apd_huomodao != null && param1.apd_huomodao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_huomodao.id);
               param1.apd_huomodao = null;
            }
            if(param1.apd_mount_huomodao != null && param1.apd_mount_huomodao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_huomodao.id);
               param1.apd_mount_huomodao = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_YIHEJI)
         {
            if(param1.apd_yiheji != null && param1.apd_yiheji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_yiheji.id);
               param1.apd_yiheji = null;
            }
            if(param1.apd_mount_yiheji != null && param1.apd_mount_yiheji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_yiheji.id);
               param1.apd_mount_yiheji = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_ERHEJIAN)
         {
            if(param1.apd_erhejian != null && param1.apd_erhejian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_erhejian.id);
               param1.apd_erhejian = null;
            }
            if(param1.apd_mount_erhejian != null && param1.apd_mount_erhejian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_erhejian.id);
               param1.apd_mount_erhejian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_SANHEDAO)
         {
            if(param1.apd_sanhedao != null && param1.apd_sanhedao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_sanhedao.id);
               param1.apd_sanhedao = null;
            }
            if(param1.apd_mount_sanhedao != null && param1.apd_mount_sanhedao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_sanhedao.id);
               param1.apd_mount_sanhedao = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_MIEHUSHAN)
         {
            if(param1.apd_miehushan != null && param1.apd_miehushan.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_miehushan.id);
               param1.apd_miehushan = null;
            }
            if(param1.apd_mount_miehushan != null && param1.apd_mount_miehushan.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_miehushan.id);
               param1.apd_mount_miehushan = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_QINGMINGDAO)
         {
            if(param1.apd_qingmingdao != null && param1.apd_qingmingdao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_qingmingdao.id);
               param1.apd_qingmingdao = null;
            }
            if(param1.apd_mount_qingmingdao != null && param1.apd_mount_qingmingdao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_qingmingdao.id);
               param1.apd_mount_qingmingdao = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_HUOXINGFU)
         {
            if(param1.apd_huoxingfu != null && param1.apd_huoxingfu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_huoxingfu.id);
               param1.apd_huoxingfu = null;
            }
            if(param1.apd_mount_huoxingfu != null && param1.apd_mount_huoxingfu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_huoxingfu.id);
               param1.apd_mount_huoxingfu = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_KAITIANGONG)
         {
            if(param1.apd_kaitiangong != null && param1.apd_kaitiangong.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_kaitiangong.id);
               param1.apd_kaitiangong = null;
            }
            if(param1.apd_mount_kaitiangong != null && param1.apd_mount_kaitiangong.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_kaitiangong.id);
               param1.apd_mount_kaitiangong = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_YANWENFENGMO)
         {
            if(param1.apd_yanwenfenmo != null && param1.apd_yanwenfenmo.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_yanwenfenmo.id);
               param1.apd_yanwenfenmo = null;
            }
            if(param1.apd_mount_yanwenfenmo != null && param1.apd_mount_yanwenfenmo.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_yanwenfenmo.id);
               param1.apd_mount_yanwenfenmo = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_LINGLONGZI)
         {
            if(param1.apd_linglongzi != null && param1.apd_linglongzi.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_linglongzi.id);
               param1.apd_linglongzi = null;
            }
            if(param1.apd_mount_linglongzi != null && param1.apd_mount_linglongzi.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_linglongzi.id);
               param1.apd_mount_linglongzi = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_SHASHENJIAN)
         {
            if(param1.apd_shashenjian != null && param1.apd_shashenjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_shashenjian.id);
               param1.apd_shashenjian = null;
            }
            if(param1.apd_mount_shashenjian != null && param1.apd_mount_shashenjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_shashenjian.id);
               param1.apd_mount_shashenjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_DUANQINGJI)
         {
            if(param1.apd_duanqingji != null && param1.apd_duanqingji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_duanqingji.id);
               param1.apd_duanqingji = null;
            }
            if(param1.apd_mount_duanqingji != null && param1.apd_mount_duanqingji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_duanqingji.id);
               param1.apd_mount_duanqingji = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_NULONG)
         {
            if(param1.apd_nulong != null && param1.apd_nulong.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_nulong.id);
               param1.apd_nulong = null;
            }
            if(param1.apd_mount_nulong != null && param1.apd_mount_nulong.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_nulong.id);
               param1.apd_mount_nulong = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_QINIAN)
         {
            if(param1.apd_qinian != null && param1.apd_qinian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_qinian.id);
               param1.apd_qinian = null;
            }
            if(param1.apd_mount_qinian != null && param1.apd_mount_qinian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_qinian.id);
               param1.apd_mount_qinian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_ZHUXIAN)
         {
            if(param1.apd_zhuxian != null && param1.apd_zhuxian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_zhuxian.id);
               param1.apd_zhuxian = null;
            }
            if(param1.apd_mount_zhuxian != null && param1.apd_mount_zhuxian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_zhuxian.id);
               param1.apd_mount_zhuxian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_HANBING)
         {
            if(param1.apd_hanbing != null && param1.apd_hanbing.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_hanbing.id);
               param1.apd_hanbing = null;
            }
            if(param1.apd_mount_hanbing != null && param1.apd_mount_hanbing.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_hanbing.id);
               param1.apd_mount_hanbing = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_POSHAN)
         {
            if(param1.apd_poshan != null && param1.apd_poshan.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_poshan.id);
               param1.apd_poshan = null;
            }
            if(param1.apd_mount_poshan != null && param1.apd_mount_poshan.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_poshan.id);
               param1.apd_mount_poshan = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_HAIYU)
         {
            if(param1.apd_haiyu != null && param1.apd_haiyu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_haiyu.id);
               param1.apd_haiyu = null;
            }
            if(param1.apd_mount_haiyu != null && param1.apd_mount_haiyu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_haiyu.id);
               param1.apd_mount_haiyu = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_TIANMINGDAO)
         {
            if(param1.apd_tianmingdao != null && param1.apd_tianmingdao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_tianmingdao.id);
               param1.apd_tianmingdao = null;
            }
            if(param1.apd_mount_tianmingdao != null && param1.apd_mount_tianmingdao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_tianmingdao.id);
               param1.apd_mount_tianmingdao = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_JINGTIANYIJI)
         {
            if(param1.apd_jingtianyiji != null && param1.apd_jingtianyiji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_jingtianyiji.id);
               param1.apd_jingtianyiji = null;
            }
            if(param1.apd_mount_jingtianyiji != null && param1.apd_mount_jingtianyiji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_jingtianyiji.id);
               param1.apd_mount_jingtianyiji = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_JINGLEIJUEDAO)
         {
            if(param1.apd_jingleijuedao != null && param1.apd_jingleijuedao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_jingleijuedao.id);
               param1.apd_jingleijuedao = null;
            }
            if(param1.apd_mount_jingleijuedao != null && param1.apd_mount_jingleijuedao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_jingleijuedao.id);
               param1.apd_mount_jingleijuedao = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_YINGXIONGJIAN)
         {
            if(param1.apd_yingxiongjian != null && param1.apd_yingxiongjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_yingxiongjian.id);
               param1.apd_yingxiongjian = null;
            }
            if(param1.apd_mount_yingxiongjian != null && param1.apd_mount_yingxiongjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_yingxiongjian.id);
               param1.apd_mount_yingxiongjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_CHANGSHENGJIAN)
         {
            if(param1.apd_changshengjian != null && param1.apd_changshengjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_changshengjian.id);
               param1.apd_changshengjian = null;
            }
            if(param1.apd_mount_changshengjian != null && param1.apd_mount_changshengjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_changshengjian.id);
               param1.apd_mount_changshengjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_GUIYINGGONG)
         {
            if(param1.apd_guiyinggong != null && param1.apd_guiyinggong.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_guiyinggong.id);
               param1.apd_guiyinggong = null;
            }
            if(param1.apd_mount_guiyinggong != null && param1.apd_mount_guiyinggong.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_guiyinggong.id);
               param1.apd_mount_guiyinggong = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_JINGLEIZHANG)
         {
            if(param1.apd_jingleizhang != null && param1.apd_jingleizhang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_jingleizhang.id);
               param1.apd_jingleizhang = null;
            }
            if(param1.apd_mount_jingleizhang != null && param1.apd_mount_jingleizhang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_jingleizhang.id);
               param1.apd_mount_jingleizhang = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_HUNDUN)
         {
            if(param1.apd_hundun != null && param1.apd_hundun.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_hundun.id);
               param1.apd_hundun = null;
            }
            if(param1.apd_mount_hundun != null && param1.apd_mount_hundun.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_hundun.id);
               param1.apd_mount_hundun = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_DINGHUN)
         {
            if(param1.apd_dinghun != null && param1.apd_dinghun.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_dinghun.id);
               param1.apd_dinghun = null;
            }
            if(param1.apd_mount_dinghun != null && param1.apd_mount_dinghun.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_dinghun.id);
               param1.apd_mount_dinghun = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_WUJI)
         {
            if(param1.apd_tiandiwuji != null && param1.apd_tiandiwuji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_tiandiwuji.id);
               param1.apd_tiandiwuji = null;
            }
            if(param1.apd_mount_tiandiwuji != null && param1.apd_mount_tiandiwuji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_tiandiwuji.id);
               param1.apd_mount_tiandiwuji = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_HUOXINGJIAN)
         {
            if(param1.apd_huoxingjian != null && param1.apd_huoxingjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_huoxingjian.id);
               param1.apd_huoxingjian = null;
            }
            if(param1.apd_mount_huoxingjian != null && param1.apd_mount_huoxingjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_huoxingjian.id);
               param1.apd_mount_huoxingjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_WANGZHEFU)
         {
            if(param1.apd_wangzhefu != null && param1.apd_wangzhefu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_wangzhefu.id);
               param1.apd_wangzhefu = null;
            }
            if(param1.apd_mount_wangzhefu != null && param1.apd_mount_wangzhefu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_wangzhefu.id);
               param1.apd_mount_wangzhefu = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_DUOMINGDAO)
         {
            if(param1.apd_duomingdao != null && param1.apd_duomingdao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_duomingdao.id);
               param1.apd_duomingdao = null;
            }
            if(param1.apd_mount_duomingdao != null && param1.apd_mount_duomingdao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_duomingdao.id);
               param1.apd_mount_duomingdao = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_XIAOSHEN)
         {
            if(param1.apd_xiaoshen != null && param1.apd_xiaoshen.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_xiaoshen.id);
               param1.apd_xiaoshen = null;
            }
            if(param1.apd_mount_xiaoshen != null && param1.apd_mount_xiaoshen.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_xiaoshen.id);
               param1.apd_mount_xiaoshen = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_WANSHI)
         {
            if(param1.apd_wanshi != null && param1.apd_wanshi.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_wanshi.id);
               param1.apd_wanshi = null;
            }
            if(param1.apd_mount_wanshi != null && param1.apd_mount_wanshi.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_wanshi.id);
               param1.apd_mount_wanshi = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_ZHONGQIU)
         {
            if(param1.apd_zhongqiu != null && param1.apd_zhongqiu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_zhongqiu.id);
               param1.apd_zhongqiu = null;
            }
            if(param1.apd_mount_zhongqiu != null && param1.apd_mount_zhongqiu.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_zhongqiu.id);
               param1.apd_mount_zhongqiu = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_SHENJIAN)
         {
            if(param1.apd_shenjian != null && param1.apd_shenjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_shenjian.id);
               param1.apd_shenjian = null;
            }
            if(param1.apd_mount_shenjian != null && param1.apd_mount_shenjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_shenjian.id);
               param1.apd_mount_shenjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_YUHUAZHANG)
         {
            if(param1.apd_yuhuazhang != null && param1.apd_yuhuazhang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_yuhuazhang.id);
               param1.apd_yuhuazhang = null;
            }
            if(param1.apd_mount_yuhuazhang != null && param1.apd_mount_yuhuazhang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_yuhuazhang.id);
               param1.apd_mount_yuhuazhang = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_BANIANGONG)
         {
            if(param1.apd_baniangong != null && param1.apd_baniangong.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_baniangong.id);
               param1.apd_baniangong = null;
            }
            if(param1.apd_mount_baniangong != null && param1.apd_mount_baniangong.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_baniangong.id);
               param1.apd_mount_baniangong = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_BANIANJIAN)
         {
            if(param1.apd_banianjian != null && param1.apd_banianjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_banianjian.id);
               param1.apd_banianjian = null;
            }
            if(param1.apd_mount_banianjian != null && param1.apd_mount_banianjian.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_banianjian.id);
               param1.apd_mount_banianjian = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_BANIANJI)
         {
            if(param1.apd_banianji != null && param1.apd_banianji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_banianji.id);
               param1.apd_banianji = null;
            }
            if(param1.apd_mount_banianji != null && param1.apd_mount_banianji.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_banianji.id);
               param1.apd_mount_banianji = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2019SHENDAN)
         {
            if(param1.apd_2019shendan != null && param1.apd_2019shendan.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2019shendan.id);
               param1.apd_2019shendan = null;
            }
            if(param1.apd_mount_2019shendan != null && param1.apd_mount_2019shendan.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2019shendan.id);
               param1.apd_mount_2019shendan = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2019GENGZI)
         {
            if(param1.apd_2019gengzi != null && param1.apd_2019gengzi.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2019gengzi.id);
               param1.apd_2019gengzi = null;
            }
            if(param1.apd_mount_2019gengzi != null && param1.apd_mount_2019gengzi.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2019gengzi.id);
               param1.apd_mount_2019gengzi = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2019FEIHUA)
         {
            if(param1.apd_2019feihua != null && param1.apd_2019feihua.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2019feihua.id);
               param1.apd_2019feihua = null;
            }
            if(param1.apd_mount_2019feihua != null && param1.apd_mount_2019feihua.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2019feihua.id);
               param1.apd_mount_2019feihua = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2019XIONGWANG)
         {
            if(param1.apd_2019xiongwang != null && param1.apd_2019xiongwang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2019xiongwang.id);
               param1.apd_2019xiongwang = null;
            }
            if(param1.apd_mount_2019xiongwang != null && param1.apd_mount_2019xiongwang.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2019xiongwang.id);
               param1.apd_mount_2019xiongwang = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020XUEHUAN)
         {
            if(param1.apd_2020xuehuan != null && param1.apd_2020xuehuan.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020xuehuan.id);
               param1.apd_2020xuehuan = null;
            }
            if(param1.apd_mount_2020xuehuan != null && param1.apd_mount_2020xuehuan.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020xuehuan.id);
               param1.apd_mount_2020xuehuan = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BADAO)
         {
            if(param1.apd_2020badao != null && param1.apd_2020badao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020badao.id);
               param1.apd_2020badao = null;
            }
            if(param1.apd_mount_2020badao != null && param1.apd_mount_2020badao.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020badao.id);
               param1.apd_mount_2020badao = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN01)
         {
            if(param1.apd_2020baojian01 != null && param1.apd_2020baojian01.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian01.id);
               param1.apd_2020baojian01 = null;
            }
            if(param1.apd_mount_2020baojian01 != null && param1.apd_mount_2020baojian01.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian01.id);
               param1.apd_mount_2020baojian01 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN02)
         {
            if(param1.apd_2020baojian02 != null && param1.apd_2020baojian02.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian02.id);
               param1.apd_2020baojian02 = null;
            }
            if(param1.apd_mount_2020baojian02 != null && param1.apd_mount_2020baojian02.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian02.id);
               param1.apd_mount_2020baojian02 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN03)
         {
            if(param1.apd_2020baojian03 != null && param1.apd_2020baojian03.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian03.id);
               param1.apd_2020baojian03 = null;
            }
            if(param1.apd_mount_2020baojian03 != null && param1.apd_mount_2020baojian03.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian03.id);
               param1.apd_mount_2020baojian03 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN04)
         {
            if(param1.apd_2020baojian04 != null && param1.apd_2020baojian04.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian04.id);
               param1.apd_2020baojian04 = null;
            }
            if(param1.apd_mount_2020baojian04 != null && param1.apd_mount_2020baojian04.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian04.id);
               param1.apd_mount_2020baojian04 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN05)
         {
            if(param1.apd_2020baojian05 != null && param1.apd_2020baojian05.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian05.id);
               param1.apd_2020baojian05 = null;
            }
            if(param1.apd_mount_2020baojian05 != null && param1.apd_mount_2020baojian05.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian05.id);
               param1.apd_mount_2020baojian05 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN06)
         {
            if(param1.apd_2020baojian06 != null && param1.apd_2020baojian06.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian06.id);
               param1.apd_2020baojian06 = null;
            }
            if(param1.apd_mount_2020baojian06 != null && param1.apd_mount_2020baojian06.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian06.id);
               param1.apd_mount_2020baojian06 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN07)
         {
            if(param1.apd_2020baojian07 != null && param1.apd_2020baojian07.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian07.id);
               param1.apd_2020baojian07 = null;
            }
            if(param1.apd_mount_2020baojian07 != null && param1.apd_mount_2020baojian07.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian07.id);
               param1.apd_mount_2020baojian07 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN08)
         {
            if(param1.apd_2020baojian08 != null && param1.apd_2020baojian08.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian08.id);
               param1.apd_2020baojian08 = null;
            }
            if(param1.apd_mount_2020baojian08 != null && param1.apd_mount_2020baojian08.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian08.id);
               param1.apd_mount_2020baojian08 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN09)
         {
            if(param1.apd_2020baojian09 != null && param1.apd_2020baojian09.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian09.id);
               param1.apd_2020baojian09 = null;
            }
            if(param1.apd_mount_2020baojian09 != null && param1.apd_mount_2020baojian09.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian09.id);
               param1.apd_mount_2020baojian09 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN10)
         {
            if(param1.apd_2020baojian10 != null && param1.apd_2020baojian10.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian10.id);
               param1.apd_2020baojian10 = null;
            }
            if(param1.apd_mount_2020baojian10 != null && param1.apd_mount_2020baojian10.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian10.id);
               param1.apd_mount_2020baojian10 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN11)
         {
            if(param1.apd_2020baojian11 != null && param1.apd_2020baojian11.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian11.id);
               param1.apd_2020baojian11 = null;
            }
            if(param1.apd_mount_2020baojian11 != null && param1.apd_mount_2020baojian11.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian11.id);
               param1.apd_mount_2020baojian11 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN12)
         {
            if(param1.apd_2020baojian12 != null && param1.apd_2020baojian12.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian12.id);
               param1.apd_2020baojian12 = null;
            }
            if(param1.apd_mount_2020baojian12 != null && param1.apd_mount_2020baojian12.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian12.id);
               param1.apd_mount_2020baojian12 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN13)
         {
            if(param1.apd_2020baojian13 != null && param1.apd_2020baojian13.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian13.id);
               param1.apd_2020baojian13 = null;
            }
            if(param1.apd_mount_2020baojian13 != null && param1.apd_mount_2020baojian13.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian13.id);
               param1.apd_mount_2020baojian13 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN14)
         {
            if(param1.apd_2020baojian14 != null && param1.apd_2020baojian14.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian14.id);
               param1.apd_2020baojian14 = null;
            }
            if(param1.apd_mount_2020baojian14 != null && param1.apd_mount_2020baojian14.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian14.id);
               param1.apd_mount_2020baojian14 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN15)
         {
            if(param1.apd_2020baojian15 != null && param1.apd_2020baojian15.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian15.id);
               param1.apd_2020baojian15 = null;
            }
            if(param1.apd_mount_2020baojian15 != null && param1.apd_mount_2020baojian15.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian15.id);
               param1.apd_mount_2020baojian15 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN16)
         {
            if(param1.apd_2020baojian16 != null && param1.apd_2020baojian16.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian16.id);
               param1.apd_2020baojian16 = null;
            }
            if(param1.apd_mount_2020baojian16 != null && param1.apd_mount_2020baojian16.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian16.id);
               param1.apd_mount_2020baojian16 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN17)
         {
            if(param1.apd_2020baojian17 != null && param1.apd_2020baojian17.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian17.id);
               param1.apd_2020baojian17 = null;
            }
            if(param1.apd_mount_2020baojian17 != null && param1.apd_mount_2020baojian17.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian17.id);
               param1.apd_mount_2020baojian17 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN18)
         {
            if(param1.apd_2020baojian18 != null && param1.apd_2020baojian18.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian18.id);
               param1.apd_2020baojian18 = null;
            }
            if(param1.apd_mount_2020baojian18 != null && param1.apd_mount_2020baojian18.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian18.id);
               param1.apd_mount_2020baojian18 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN19)
         {
            if(param1.apd_2020baojian19 != null && param1.apd_2020baojian19.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian19.id);
               param1.apd_2020baojian19 = null;
            }
            if(param1.apd_mount_2020baojian19 != null && param1.apd_mount_2020baojian19.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian19.id);
               param1.apd_mount_2020baojian19 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN20)
         {
            if(param1.apd_2020baojian20 != null && param1.apd_2020baojian20.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian20.id);
               param1.apd_2020baojian20 = null;
            }
            if(param1.apd_mount_2020baojian20 != null && param1.apd_mount_2020baojian20.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian20.id);
               param1.apd_mount_2020baojian20 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN21)
         {
            if(param1.apd_2020baojian21 != null && param1.apd_2020baojian21.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian21.id);
               param1.apd_2020baojian21 = null;
            }
            if(param1.apd_mount_2020baojian21 != null && param1.apd_mount_2020baojian21.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian21.id);
               param1.apd_mount_2020baojian21 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN22)
         {
            if(param1.apd_2020baojian22 != null && param1.apd_2020baojian22.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian22.id);
               param1.apd_2020baojian22 = null;
            }
            if(param1.apd_mount_2020baojian22 != null && param1.apd_mount_2020baojian22.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian22.id);
               param1.apd_mount_2020baojian22 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN23)
         {
            if(param1.apd_2020baojian23 != null && param1.apd_2020baojian23.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian23.id);
               param1.apd_2020baojian23 = null;
            }
            if(param1.apd_mount_2020baojian23 != null && param1.apd_mount_2020baojian23.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian23.id);
               param1.apd_mount_2020baojian23 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN24)
         {
            if(param1.apd_2020baojian24 != null && param1.apd_2020baojian24.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian24.id);
               param1.apd_2020baojian24 = null;
            }
            if(param1.apd_mount_2020baojian24 != null && param1.apd_mount_2020baojian24.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian24.id);
               param1.apd_mount_2020baojian24 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN25)
         {
            if(param1.apd_2020baojian25 != null && param1.apd_2020baojian25.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian25.id);
               param1.apd_2020baojian25 = null;
            }
            if(param1.apd_mount_2020baojian25 != null && param1.apd_mount_2020baojian25.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian25.id);
               param1.apd_mount_2020baojian25 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN26)
         {
            if(param1.apd_2020baojian26 != null && param1.apd_2020baojian26.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian26.id);
               param1.apd_2020baojian26 = null;
            }
            if(param1.apd_mount_2020baojian26 != null && param1.apd_mount_2020baojian26.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian26.id);
               param1.apd_mount_2020baojian26 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN27)
         {
            if(param1.apd_2020baojian27 != null && param1.apd_2020baojian27.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian27.id);
               param1.apd_2020baojian27 = null;
            }
            if(param1.apd_mount_2020baojian27 != null && param1.apd_mount_2020baojian27.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian27.id);
               param1.apd_mount_2020baojian27 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN28)
         {
            if(param1.apd_2020baojian28 != null && param1.apd_2020baojian28.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian28.id);
               param1.apd_2020baojian28 = null;
            }
            if(param1.apd_mount_2020baojian28 != null && param1.apd_mount_2020baojian28.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian28.id);
               param1.apd_mount_2020baojian28 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN29)
         {
            if(param1.apd_2020baojian29 != null && param1.apd_2020baojian29.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian29.id);
               param1.apd_2020baojian29 = null;
            }
            if(param1.apd_mount_2020baojian29 != null && param1.apd_mount_2020baojian29.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian29.id);
               param1.apd_mount_2020baojian29 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN30)
         {
            if(param1.apd_2020baojian30 != null && param1.apd_2020baojian30.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian30.id);
               param1.apd_2020baojian30 = null;
            }
            if(param1.apd_mount_2020baojian30 != null && param1.apd_mount_2020baojian30.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian30.id);
               param1.apd_mount_2020baojian30 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN31)
         {
            if(param1.apd_2020baojian31 != null && param1.apd_2020baojian31.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian31.id);
               param1.apd_2020baojian31 = null;
            }
            if(param1.apd_mount_2020baojian31 != null && param1.apd_mount_2020baojian31.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian31.id);
               param1.apd_mount_2020baojian31 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN32)
         {
            if(param1.apd_2020baojian32 != null && param1.apd_2020baojian32.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian32.id);
               param1.apd_2020baojian32 = null;
            }
            if(param1.apd_mount_2020baojian32 != null && param1.apd_mount_2020baojian32.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian32.id);
               param1.apd_mount_2020baojian32 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN33)
         {
            if(param1.apd_2020baojian33 != null && param1.apd_2020baojian33.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian33.id);
               param1.apd_2020baojian33 = null;
            }
            if(param1.apd_mount_2020baojian33 != null && param1.apd_mount_2020baojian33.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian33.id);
               param1.apd_mount_2020baojian33 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN34)
         {
            if(param1.apd_2020baojian34 != null && param1.apd_2020baojian34.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian34.id);
               param1.apd_2020baojian34 = null;
            }
            if(param1.apd_mount_2020baojian34 != null && param1.apd_mount_2020baojian34.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian34.id);
               param1.apd_mount_2020baojian34 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN35)
         {
            if(param1.apd_2020baojian35 != null && param1.apd_2020baojian35.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian35.id);
               param1.apd_2020baojian35 = null;
            }
            if(param1.apd_mount_2020baojian35 != null && param1.apd_mount_2020baojian35.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian35.id);
               param1.apd_mount_2020baojian35 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN36)
         {
            if(param1.apd_2020baojian36 != null && param1.apd_2020baojian36.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian36.id);
               param1.apd_2020baojian36 = null;
            }
            if(param1.apd_mount_2020baojian36 != null && param1.apd_mount_2020baojian36.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian36.id);
               param1.apd_mount_2020baojian36 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN37)
         {
            if(param1.apd_2020baojian37 != null && param1.apd_2020baojian37.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian37.id);
               param1.apd_2020baojian37 = null;
            }
            if(param1.apd_mount_2020baojian37 != null && param1.apd_mount_2020baojian37.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian37.id);
               param1.apd_mount_2020baojian37 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN38)
         {
            if(param1.apd_2020baojian38 != null && param1.apd_2020baojian38.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian38.id);
               param1.apd_2020baojian38 = null;
            }
            if(param1.apd_mount_2020baojian38 != null && param1.apd_mount_2020baojian38.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian38.id);
               param1.apd_mount_2020baojian38 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN39)
         {
            if(param1.apd_2020baojian39 != null && param1.apd_2020baojian39.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian39.id);
               param1.apd_2020baojian39 = null;
            }
            if(param1.apd_mount_2020baojian39 != null && param1.apd_mount_2020baojian39.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian39.id);
               param1.apd_mount_2020baojian39 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN40)
         {
            if(param1.apd_2020baojian40 != null && param1.apd_2020baojian40.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian40.id);
               param1.apd_2020baojian40 = null;
            }
            if(param1.apd_mount_2020baojian40 != null && param1.apd_mount_2020baojian40.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian40.id);
               param1.apd_mount_2020baojian40 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN41)
         {
            if(param1.apd_2020baojian41 != null && param1.apd_2020baojian41.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian41.id);
               param1.apd_2020baojian41 = null;
            }
            if(param1.apd_mount_2020baojian41 != null && param1.apd_mount_2020baojian41.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian41.id);
               param1.apd_mount_2020baojian41 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN42)
         {
            if(param1.apd_2020baojian42 != null && param1.apd_2020baojian42.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian42.id);
               param1.apd_2020baojian42 = null;
            }
            if(param1.apd_mount_2020baojian42 != null && param1.apd_mount_2020baojian42.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian42.id);
               param1.apd_mount_2020baojian42 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN43)
         {
            if(param1.apd_2020baojian43 != null && param1.apd_2020baojian43.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian43.id);
               param1.apd_2020baojian43 = null;
            }
            if(param1.apd_mount_2020baojian43 != null && param1.apd_mount_2020baojian43.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian43.id);
               param1.apd_mount_2020baojian43 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN44)
         {
            if(param1.apd_2020baojian44 != null && param1.apd_2020baojian44.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian44.id);
               param1.apd_2020baojian44 = null;
            }
            if(param1.apd_mount_2020baojian44 != null && param1.apd_mount_2020baojian44.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian44.id);
               param1.apd_mount_2020baojian44 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN45)
         {
            if(param1.apd_2020baojian45 != null && param1.apd_2020baojian45.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian45.id);
               param1.apd_2020baojian45 = null;
            }
            if(param1.apd_mount_2020baojian45 != null && param1.apd_mount_2020baojian45.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian45.id);
               param1.apd_mount_2020baojian45 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN46)
         {
            if(param1.apd_2020baojian46 != null && param1.apd_2020baojian46.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian46.id);
               param1.apd_2020baojian46 = null;
            }
            if(param1.apd_mount_2020baojian46 != null && param1.apd_mount_2020baojian46.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian46.id);
               param1.apd_mount_2020baojian46 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN47)
         {
            if(param1.apd_2020baojian47 != null && param1.apd_2020baojian47.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian47.id);
               param1.apd_2020baojian47 = null;
            }
            if(param1.apd_mount_2020baojian47 != null && param1.apd_mount_2020baojian47.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian47.id);
               param1.apd_mount_2020baojian47 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN48)
         {
            if(param1.apd_2020baojian48 != null && param1.apd_2020baojian48.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian48.id);
               param1.apd_2020baojian48 = null;
            }
            if(param1.apd_mount_2020baojian48 != null && param1.apd_mount_2020baojian48.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian48.id);
               param1.apd_mount_2020baojian48 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN49)
         {
            if(param1.apd_2020baojian49 != null && param1.apd_2020baojian49.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian49.id);
               param1.apd_2020baojian49 = null;
            }
            if(param1.apd_mount_2020baojian49 != null && param1.apd_mount_2020baojian49.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian49.id);
               param1.apd_mount_2020baojian49 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN50)
         {
            if(param1.apd_2020baojian50 != null && param1.apd_2020baojian50.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian50.id);
               param1.apd_2020baojian50 = null;
            }
            if(param1.apd_mount_2020baojian50 != null && param1.apd_mount_2020baojian50.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian50.id);
               param1.apd_mount_2020baojian50 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN51)
         {
            if(param1.apd_2020baojian51 != null && param1.apd_2020baojian51.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian51.id);
               param1.apd_2020baojian51 = null;
            }
            if(param1.apd_mount_2020baojian51 != null && param1.apd_mount_2020baojian51.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian51.id);
               param1.apd_mount_2020baojian51 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN52)
         {
            if(param1.apd_2020baojian52 != null && param1.apd_2020baojian52.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian52.id);
               param1.apd_2020baojian52 = null;
            }
            if(param1.apd_mount_2020baojian52 != null && param1.apd_mount_2020baojian52.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian52.id);
               param1.apd_mount_2020baojian52 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN53)
         {
            if(param1.apd_2020baojian53 != null && param1.apd_2020baojian53.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian53.id);
               param1.apd_2020baojian53 = null;
            }
            if(param1.apd_mount_2020baojian53 != null && param1.apd_mount_2020baojian53.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian53.id);
               param1.apd_mount_2020baojian53 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN54)
         {
            if(param1.apd_2020baojian54 != null && param1.apd_2020baojian54.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian54.id);
               param1.apd_2020baojian54 = null;
            }
            if(param1.apd_mount_2020baojian54 != null && param1.apd_mount_2020baojian54.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian54.id);
               param1.apd_mount_2020baojian54 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN55)
         {
            if(param1.apd_2020baojian55 != null && param1.apd_2020baojian55.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian55.id);
               param1.apd_2020baojian55 = null;
            }
            if(param1.apd_mount_2020baojian55 != null && param1.apd_mount_2020baojian55.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian55.id);
               param1.apd_mount_2020baojian55 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN56)
         {
            if(param1.apd_2020baojian56 != null && param1.apd_2020baojian56.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian56.id);
               param1.apd_2020baojian56 = null;
            }
            if(param1.apd_mount_2020baojian56 != null && param1.apd_mount_2020baojian56.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian56.id);
               param1.apd_mount_2020baojian56 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN57)
         {
            if(param1.apd_2020baojian57 != null && param1.apd_2020baojian57.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian57.id);
               param1.apd_2020baojian57 = null;
            }
            if(param1.apd_mount_2020baojian57 != null && param1.apd_mount_2020baojian57.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian57.id);
               param1.apd_mount_2020baojian57 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN58)
         {
            if(param1.apd_2020baojian58 != null && param1.apd_2020baojian58.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian58.id);
               param1.apd_2020baojian58 = null;
            }
            if(param1.apd_mount_2020baojian58 != null && param1.apd_mount_2020baojian58.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian58.id);
               param1.apd_mount_2020baojian58 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN59)
         {
            if(param1.apd_2020baojian59 != null && param1.apd_2020baojian59.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian59.id);
               param1.apd_2020baojian59 = null;
            }
            if(param1.apd_mount_2020baojian59 != null && param1.apd_mount_2020baojian59.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian59.id);
               param1.apd_mount_2020baojian59 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN60)
         {
            if(param1.apd_2020baojian60 != null && param1.apd_2020baojian60.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian60.id);
               param1.apd_2020baojian60 = null;
            }
            if(param1.apd_mount_2020baojian60 != null && param1.apd_mount_2020baojian60.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian60.id);
               param1.apd_mount_2020baojian60 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN61)
         {
            if(param1.apd_2020baojian61 != null && param1.apd_2020baojian61.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian61.id);
               param1.apd_2020baojian61 = null;
            }
            if(param1.apd_mount_2020baojian61 != null && param1.apd_mount_2020baojian61.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian61.id);
               param1.apd_mount_2020baojian61 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN62)
         {
            if(param1.apd_2020baojian62 != null && param1.apd_2020baojian62.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian62.id);
               param1.apd_2020baojian62 = null;
            }
            if(param1.apd_mount_2020baojian62 != null && param1.apd_mount_2020baojian62.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian62.id);
               param1.apd_mount_2020baojian62 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN63)
         {
            if(param1.apd_2020baojian63 != null && param1.apd_2020baojian63.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian63.id);
               param1.apd_2020baojian63 = null;
            }
            if(param1.apd_mount_2020baojian63 != null && param1.apd_mount_2020baojian63.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian63.id);
               param1.apd_mount_2020baojian63 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN64)
         {
            if(param1.apd_2020baojian64 != null && param1.apd_2020baojian64.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian64.id);
               param1.apd_2020baojian64 = null;
            }
            if(param1.apd_mount_2020baojian64 != null && param1.apd_mount_2020baojian64.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian64.id);
               param1.apd_mount_2020baojian64 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN65)
         {
            if(param1.apd_2020baojian65 != null && param1.apd_2020baojian65.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian65.id);
               param1.apd_2020baojian65 = null;
            }
            if(param1.apd_mount_2020baojian65 != null && param1.apd_mount_2020baojian65.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian65.id);
               param1.apd_mount_2020baojian65 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN66)
         {
            if(param1.apd_2020baojian66 != null && param1.apd_2020baojian66.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian66.id);
               param1.apd_2020baojian66 = null;
            }
            if(param1.apd_mount_2020baojian66 != null && param1.apd_mount_2020baojian66.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian66.id);
               param1.apd_mount_2020baojian66 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN67)
         {
            if(param1.apd_2020baojian67 != null && param1.apd_2020baojian67.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian67.id);
               param1.apd_2020baojian67 = null;
            }
            if(param1.apd_mount_2020baojian67 != null && param1.apd_mount_2020baojian67.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian67.id);
               param1.apd_mount_2020baojian67 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN68)
         {
            if(param1.apd_2020baojian68 != null && param1.apd_2020baojian68.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian68.id);
               param1.apd_2020baojian68 = null;
            }
            if(param1.apd_mount_2020baojian68 != null && param1.apd_mount_2020baojian68.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian68.id);
               param1.apd_mount_2020baojian68 = null;
            }
         }
         else if(param2 == ItemPositionRange.POSITION_2020BAOJIAN69)
         {
            if(param1.apd_2020baojian69 != null && param1.apd_2020baojian69.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,false,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_2020baojian69.id);
               param1.apd_2020baojian69 = null;
            }
            if(param1.apd_mount_2020baojian69 != null && param1.apd_mount_2020baojian69.sourcePath == ResPathManager.getAvatarPath_Clothes_by_sexAndMount(param4,true,ResPathManager.AVATAR_CLOTHES,param3))
            {
               _loc5_.push(param1.apd_mount_2020baojian69.id);
               param1.apd_mount_2020baojian69 = null;
            }
         }
         return _loc5_;
      }
      
      public static function updateMainAvatar(param1:SceneCharacter, param2:Array = null, param3:Boolean = false) : void
      {
         var bc:BaseCharacter;
         var avatarInfo:AvatarInfo;
         var player:Player;
         var get_body_apd:Function;
         var get_mount_body_apd:Function;
         var $sc:SceneCharacter = param1;
         var $updateAvatarPartIDArr:Array = param2;
         var $inOnMountJump:Boolean = param3;
         if($sc == null || !$sc.usable)
         {
            return;
         }
         bc = $sc.data as BaseCharacter;
         if(bc == null)
         {
            return;
         }
         avatarInfo = bc.avatarInfo;
         if(avatarInfo.gengXin == false)
         {
            return;
         }
         player = $sc.data as Player;
         if(player != null)
         {
            if(avatarInfo.apd_body == null)
            {
               get_body_apd = function(param1:AvatarParamData):AvatarParamData
               {
                  if(param1 != null)
                  {
                     param1.id = SpeciaAvatarPartID.BODY;
                     param1.useType = 1;
                     param1.clearSameType = true;
                  }
                  return param1;
               };
               if(player.attributeInfo.getSex() == 1)
               {
                  avatarInfo.apd_body = get_body_apd(new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BORN_1)));
               }
               else
               {
                  avatarInfo.apd_body = get_body_apd(new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BORN_0)));
               }
            }
            if(avatarInfo.apd_mount_body == null)
            {
               get_mount_body_apd = function(param1:AvatarParamData):AvatarParamData
               {
                  if(param1 != null)
                  {
                     param1.id = SpeciaAvatarPartID.MOUNT_BODY;
                     param1.useType = 2;
                     param1.clearSameType = true;
                  }
                  return param1;
               };
               if(player.attributeInfo.getSex() == 1)
               {
                  avatarInfo.apd_mount_body = get_mount_body_apd(new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BORN_ONMOUNT_1)));
               }
               else
               {
                  avatarInfo.apd_mount_body = get_mount_body_apd(new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BORN_ONMOUNT_0)));
               }
            }
         }
         if($sc.isOnMount && ($sc.getStatus() != CharStatusType.DEATH && $sc.getStatus() != CharStatusType.SIT))
         {
            wearMount($sc,$updateAvatarPartIDArr,$inOnMountJump);
         }
         else
         {
            wearSingle($sc,$updateAvatarPartIDArr,$inOnMountJump);
         }
         if($sc == GameInstance.mainChar)
         {
            PipeManager.sendMsg(PipeConstants.UPDATE_MAINCHAR_AVATAR_IN_PLANE);
         }
      }
      
      private static function wearSingle(param1:SceneCharacter, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:AvatarInfo = null;
         var _loc5_:AvatarParamData = null;
         var _loc6_:int = 0;
         var _loc7_:Player = null;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:Boolean = false;
         var _loc12_:Goods = null;
         var _loc13_:Boolean = false;
         var _loc14_:int = 0;
         var _loc15_:AvatarParamData = null;
         var _loc16_:int = 0;
         _loc4_ = (param1.data as BaseCharacter).avatarInfo;
         param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
         param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
         param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
         param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
         _loc6_ = 1;
         if(param1.type == SceneCharacterType.PLAYER)
         {
            _loc6_ = (param1.data as Player).attributeInfo.getSex();
            _loc7_ = param1.data as Player;
            if(_loc4_.isZunrongWanbaoge)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.JINGMAI_LEVEL,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.SILINGZHEN,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.SHENGSIFU,false);
            }
            else if(_loc4_.isCiKe || _loc4_.isYouyong || _loc4_.isBiWuZhaoQinFeiDaDiao || _loc4_.isFuQiJingJiFeiDaDiao || _loc4_.isZhumozhang || _loc4_.isZhenggu || _loc4_.isHuanYingXiaDao || _loc4_.isLangRen > 0 || _loc4_.isDagoubang || _loc4_.isLingHu || _loc4_.isLvHaMa || _loc4_.isFanTongXianJue || isShowZhenYingAvatar(_loc4_.zhenYingHuanZhuang) || _loc4_.isCiKeTaoZhuang || _loc4_.isHuangChengShouWeiTaoZhuang || _loc4_.isYangguo || _loc4_.isXiaolongnv || _loc4_.isGuoXiang || _loc4_.isLiMoChou || _loc4_.isYinZhiPing || _loc4_.isLinghuchong || _loc4_.isRenyingying || _loc4_.isYuebuqun || _loc4_.isRenWoXing || _loc4_.isXuZhu || _loc4_.isDuanYu || _loc4_.isWangYuYan || _loc4_.isShuangRenFengXing_ZhongQiu || _loc4_.isYueTuHuanZhuang || _loc4_.isAZi || _loc4_.isQiaoFeng || _loc4_.isBailongjiang)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.JINGMAI_LEVEL,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.SILINGZHEN,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_1,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_2,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_3,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_4,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_5,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.SHENGSIFU,false);
            }
            else
            {
               AvatarManager.updateQixuanAvatar(param1,_loc7_.attributeInfo.qixuan1ID,_loc7_.attributeInfo.qixuan2ID,_loc7_.attributeInfo.qixuan3ID,_loc7_.attributeInfo.qixuan4ID,_loc7_.attributeInfo.qixuan5ID);
               AvatarManager.updateSilingzhenAvatar(param1,_loc7_.attributeInfo.silingzhenCount);
               AvatarManager.updateJingmaiAvatar(param1,_loc7_.jingmaiInfo.getOpenedJingmaiNum());
               AvatarManager.updateShensifuAvatar(param1,_loc7_.attributeInfo.shengsifuCount);
               AvatarManager.updateZhenLongqiHeiAvatar(param1,_loc7_.attributeInfo.zhenlongqiHeiCount);
               AvatarManager.updateZhenLongqiBaiAvatar(param1,_loc7_.attributeInfo.zhenlongqiBaiCount);
               AvatarManager.updateWuCaiXianZhenAvatar(param1,_loc7_.attributeInfo.wuCaiXianZhenCount);
            }
         }
         else if(param1.type == SceneCharacterType.FENSHEN)
         {
            _loc6_ = (param1.data as Player).attributeInfo.getSex();
            _loc7_ = param1.data as Player;
            if(_loc4_.isZunrongWanbaoge)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.JINGMAI_LEVEL,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.SILINGZHEN,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.SHENGSIFU,false);
            }
            else if(_loc4_.isCiKe || _loc4_.isYouyong || _loc4_.isBiWuZhaoQinFeiDaDiao || _loc4_.isZhumozhang || _loc4_.isFuQiJingJiFeiDaDiao || _loc4_.isZhenggu || _loc4_.isHuanYingXiaDao || _loc4_.isLangRen > 0 || _loc4_.isDagoubang || _loc4_.isLingHu || _loc4_.isLvHaMa || _loc4_.isFanTongXianJue || isShowZhenYingAvatar(_loc4_.zhenYingHuanZhuang) || _loc4_.isCiKeTaoZhuang || _loc4_.isYangguo || _loc4_.isXiaolongnv || _loc4_.isHuangChengShouWeiTaoZhuang || _loc4_.isGuoXiang || _loc4_.isLiMoChou || _loc4_.isYinZhiPing || _loc4_.isLinghuchong || _loc4_.isRenyingying || _loc4_.isRenWoXing || _loc4_.isXuZhu || _loc4_.isDuanYu || _loc4_.isWangYuYan || _loc4_.isAZi || _loc4_.isQiaoFeng || _loc4_.isYuebuqun || _loc4_.isFenshenHuanzhuang || _loc4_.isYueTuHuanZhuang)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.JINGMAI_LEVEL,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.SILINGZHEN,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_1,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_2,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_3,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_4,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_5,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.SHENGSIFU,false);
            }
            else
            {
               AvatarManager.updateQixuanAvatar(param1,_loc7_.attributeInfo.qixuan1ID,_loc7_.attributeInfo.qixuan2ID,_loc7_.attributeInfo.qixuan3ID,_loc7_.attributeInfo.qixuan4ID,_loc7_.attributeInfo.qixuan5ID);
               AvatarManager.updateSilingzhenAvatar(param1,_loc7_.attributeInfo.silingzhenCount);
               AvatarManager.updateJingmaiAvatar(param1,_loc7_.jingmaiInfo.getOpenedJingmaiNum());
               AvatarManager.updateShensifuAvatar(param1,_loc7_.attributeInfo.shengsifuCount);
               AvatarManager.updateZhenLongqiHeiAvatar(param1,_loc7_.attributeInfo.zhenlongqiHeiCount);
               AvatarManager.updateZhenLongqiBaiAvatar(param1,_loc7_.attributeInfo.zhenlongqiBaiCount);
               AvatarManager.updateWuCaiXianZhenAvatar(param1,_loc7_.attributeInfo.wuCaiXianZhenCount);
            }
         }
         if(param2 == null || param2.indexOf(SpeciaAvatarPartID.BODY) != -1)
         {
            if(isShowZhenYingAvatar(_loc4_.zhenYingHuanZhuang))
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,getZhenYingAvatarId(_loc4_.zhenYingHuanZhuang,SpeciaAvatarPartID.BODY,_loc6_),_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(isShowWangzhezhibangAvatar(_loc4_.wangzhezhibang))
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,getWangzhezhibangAvatarId(_loc4_.wangzhezhibang,SpeciaAvatarPartID.BODY,_loc6_),_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isFeixing && !_loc4_.isCiKe && !_loc4_.isDaHuanZhuang_QUANPINGBI)
            {
               if(!param3)
               {
                  if(_loc4_.apd_body)
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,int(_loc4_.apd_body.className.toLowerCase().replace(/^[a-z]+/,"")),_loc6_,_loc4_.isFeixing);
                  }
               }
               else if(_loc4_.isJingLeiQiang > 0)
               {
                  if(_loc4_.isJingLeiQiang == 1)
                  {
                     if(_loc6_ == 1)
                     {
                        _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_1_WUQI_ID,_loc6_,_loc4_.isFeixing);
                     }
                     else
                     {
                        _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_1_WUQI_ID_0,_loc6_,_loc4_.isFeixing);
                     }
                  }
                  else if(_loc4_.isJingLeiQiang == 2)
                  {
                     if(_loc6_ == 1)
                     {
                        _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_2_WUQI_ID,_loc6_,_loc4_.isFeixing);
                     }
                     else
                     {
                        _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_2_WUQI_ID_0,_loc6_,_loc4_.isFeixing);
                     }
                  }
                  else if(_loc4_.isJingLeiQiang == 3)
                  {
                     if(_loc6_ == 1)
                     {
                        _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_3_WUQI_ID,_loc6_,_loc4_.isFeixing);
                     }
                     else
                     {
                        _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_3_WUQI_ID_0,_loc6_,_loc4_.isFeixing);
                     }
                  }
                  else if(_loc4_.isJingLeiQiang == 4)
                  {
                     if(_loc6_ == 1)
                     {
                        _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_4_WUQI_ID,_loc6_,_loc4_.isFeixing);
                     }
                     else
                     {
                        _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_4_WUQI_ID_0,_loc6_,_loc4_.isFeixing);
                     }
                  }
                  else if(_loc4_.isJingLeiQiang == 5)
                  {
                     if(_loc6_ == 1)
                     {
                        _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_5_WUQI_ID,_loc6_,_loc4_.isFeixing);
                     }
                     else
                     {
                        _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_5_WUQI_ID_0,_loc6_,_loc4_.isFeixing);
                     }
                  }
                  else if(_loc4_.isJingLeiQiang == 6)
                  {
                     if(_loc6_ == 1)
                     {
                        _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_6_WUQI_ID,_loc6_,_loc4_.isFeixing);
                     }
                     else
                     {
                        _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_6_WUQI_ID_0,_loc6_,_loc4_.isFeixing);
                     }
                  }
                  else if(_loc4_.isJingLeiQiang == 7)
                  {
                     if(_loc6_ == 1)
                     {
                        _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_7_WUQI_ID,_loc6_,_loc4_.isFeixing);
                     }
                     else
                     {
                        _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_7_WUQI_ID_0,_loc6_,_loc4_.isFeixing);
                     }
                  }
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
                  if(!param1.hasSameAvatarPart(_loc5_))
                  {
                     param1.loadAvatarPart(_loc5_);
                  }
               }
               else if(_loc4_.apd_body)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,int(_loc4_.apd_body.className.toLowerCase().replace(/^[a-z]+/,"")),_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isYouyong)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YOUYONG_HUANZHUANG_ID_NAN,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YOUYONG_HUANZHUANG_ID_NV,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isDaHuanZhuang)
            {
               if(param1 == GameInstance.mainChar)
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict_Main[1];
               }
               else
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict[1];
               }
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,_loc8_[0],_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,_loc8_[0],_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isDaHuanZhuang_WUMA)
            {
               if(param1 == GameInstance.mainChar)
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict_Main[7];
               }
               else
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict[7];
               }
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,_loc8_[0],_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,_loc8_[0],_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isDaHuanZhuang_QUANPINGBI)
            {
               if(param1 == GameInstance.mainChar)
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict_Main[8];
               }
               else
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict[8];
               }
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,_loc8_[1],_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,_loc8_[2],_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isXiaoHuanZhuang)
            {
               if(param1 == GameInstance.mainChar)
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict_Main[2];
               }
               else
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict[2];
               }
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,_loc8_[1],_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,_loc8_[2],_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isZhumozhang)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.ZHUMOZHANG_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isShenjiangji)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.SHENJIANGJI);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.is255)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,255);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.is256)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,777839373);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.is257)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,777841143);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isBailongjiang)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.BAILONGJIANG);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isTianwang)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YN_TIANWANG_NAN,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YN_TIANWANG_NV,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isWuLinMengZhu)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,77783328,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,77783329,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isYingxiong)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YN_YINGXIONG_NAN,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YN_YINGXIONG_NV,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isYingxiong1)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,777843025,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isWANSHI)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,777838057,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isTianmajian)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YN_TIANMAJIAN_BIANSHE_ID,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isXiongjijian)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YN_XIONGJIJIAN_BIANJI_ID,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isXuanbingjian)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YN_XUANBINGJIAN_BIANJI_ID,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isCiKe)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CIKE_AVATAR_ID_1,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CIKE_AVATAR_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isHuanYingXiaDao)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CIKE_AVATAR_ID_1,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isWangZheXueSha)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.WANGZHEXUESHA_ID_NAN,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.WANGZHEXUESHA_ID_NV,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isZhenggu)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YURENJIE_AVATAR_ID_1,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YURENJIE_AVATAR_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isXinShouHuanZhuang)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CHUSHI_AVATAR_ID_1,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CHUSHI_AVATAR_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isJiGuanGuai)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.JIGUANGUAI_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isMingJieZhanShen)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.MINGJIEZHANSHEN_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isZhaoYun)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.ZHAOYUN_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isHeiAnMoJun)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.HEIANMOJUN_AVATAR_ID_1,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.HEIANMOJUN_AVATAR_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isHuGuoShenJiang)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.ZHAOYUN_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isHuangJinYinZhe)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.HUANGJINYINZHE_AVATAR_ID_1,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.HUANGJINYINZHE_AVATAR_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isZiLingShou)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.ZILINGSHOU_AVATAR_ID_1,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.ZILINGSHOU_AVATAR_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isZhaoYun_Jin)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.ZHAOYUN_JIN_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isZhaoMin)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.ZHAOMIN_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isBaoMeiRen)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.BAOMEIREN_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isJiaLouLuo)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.JIALOULUO_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isYinYangDaoRen)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YINYANGDAOREN_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isJiGong)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.JIGONG_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isLuoHan)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.LUOHAN_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isXiangYangDaJiang)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.XIANGYANGDAJIANG_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isShiHua)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.SHIHUA_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isXiongBa)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.XIONGBA_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isSanShengMu)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.SANSHENGMU_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isBingJingHu)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.BINGJINGHU_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isShaMoFeiYing)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.SHAMOFEIYING_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isTieShanGongZhu)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.TIESHANGONGZHU_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isBaiMianShuSheng)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.BAIMIANSHUSHENG_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isHongLianXianZi)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.HONGLIANXIANZI_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isChiYou)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CHIYOU_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isTianShiEMo)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.TIANSHIEMO_AVATAR_ID_1,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.TIANSHIEMO_AVATAR_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isYuFeng)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YUFENG_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isTianZhao)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.TIANZHAO_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isYingXiongShouWei)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YINGXIONGSHOUWEI_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isYangguo)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_YANGGUO);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isQiaoFeng)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_QIAOFENG);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isAZi)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_AZI);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isGuoXiang)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_GUOXIANG);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isLiMoChou)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_LIMOCHOU);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isYinZhiPing)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_YINZHIPING);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isXiaolongnv)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_XIAOLONGNV);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isLinghuchong)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_LINGHUCHONG);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isRenyingying)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_RENYINGYING);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isYuebuqun)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_YUEBUQUN);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isRenWoXing)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_RENWOXING);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isDuanYu)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_DUANYU);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isWangYuYan)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_WANGYUYAN);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isXuZhu)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_XUZHU);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isPoTian)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.POTIAN_AVATAR_ID_1,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.POTIAN_AVATAR_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isShanZei)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.SHANZEI_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isJianTiFengYin)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.JIANTIFENGYIN_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isDiLu)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.DILUMA_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isQiuQianCHi)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.QIUQIANCHI_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isMoLingZhiYuan)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.MOLINGZHIYUAN_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isKunShou)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KUNSHOU_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isYanMoNuPu)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YANMONUPU_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isJinJiaZhanChe)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.JINJIAZHANCHE_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isChangE)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CHANGE_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isMeiRenJi)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.MEIRENJI_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isBuSiJinShen)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.BUSIJINSHEN_ID_NAN,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.BUSIJINSHEN_ID_NV,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isQiLinAvatar)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.QILIN_AVATAR_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isHuXiaoShanLin)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.HUXIAOSHANLIN_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isLangRen > 0)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,getLangRenHuanZhuangId(_loc4_.isLangRen));
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isDagoubang)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.DAGOUBANG_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isLingHu)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.LINGHUHUANHUA_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isLvHaMa)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.LVHAMA_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isFanTongXianJue)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.FANTONGXIANJUE_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isZijinHuanzhuang)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.ZIJINHUANZHUANG_ID,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isQiXiHuanZhuang)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.QIXI_AVATAR_ID_1,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.QIXI_AVATAR_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isDagoubang)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.DAGOUBANG_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isLingHu)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.LINGHUHUANHUA_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isLvHaMa)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.LVHAMA_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isFanTongXianJue)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.FANTONGXIANJUE_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isLangRen > 0)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,getLangRenHuanZhuangId(_loc4_.isLangRen));
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isWanZhongZhuMu)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,getWanShiZhuMuAvatarId(SpeciaAvatarPartID.BODY,_loc6_),_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isRongYuHuanZhong)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.RONGYUHUANZHUANG_ID_NAN,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.RONGYUHUANZHUANG_ID_NV,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.apd_body != null)
            {
               if(!param1.hasSameAvatarPart(_loc4_.apd_body))
               {
                  param1.loadAvatarPart(_loc4_.apd_body);
               }
            }
            else
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
            }
         }
         if(param2 == null || param2.indexOf(SpeciaAvatarPartID.WEAPON) != -1)
         {
            _loc9_ = _loc4_.teshuWuqiArr();
            if(isShowZhenYingAvatar(_loc4_.zhenYingHuanZhuang))
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,getZhenYingAvatarId(_loc4_.zhenYingHuanZhuang,SpeciaAvatarPartID.WEAPON,_loc6_),_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(isShowWangzhezhibangAvatar(_loc4_.wangzhezhibang))
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,getWangzhezhibangAvatarId(_loc4_.wangzhezhibang,SpeciaAvatarPartID.WEAPON,_loc6_),_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isTuLongDao_1)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.TULONGDAO_1_WUQI_ID_1,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.TULONGDAO_1_WUQI_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isTuLongDao_2)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.TULONGDAO_2_WUQI_ID_1,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.TULONGDAO_2_WUQI_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isTuLongDao_3)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.TULONGDAO_3_WUQI_ID_1,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.TULONGDAO_3_WUQI_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isTuLongDao_4)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.TULONGDAO_4_WUQI_ID_1,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.TULONGDAO_4_WUQI_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isTuLongDao_5)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.TULONGDAO_5_WUQI_ID_1,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.TULONGDAO_5_WUQI_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.usingFashion == 2 && !_loc4_.isCiKe)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,getHuangZhuAvatarId(SpeciaAvatarPartID.WEAPON,_loc6_),_loc6_,true);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isFeixing && !_loc4_.isCiKe && !_loc4_.isDaHuanZhuang_QUANPINGBI)
            {
               _loc10_ = _loc4_.useIng_Weapon_id;
               _loc11_ = true;
               if(ReloginManager.isInGongcheng || ReloginManager.isInKuafu || ReloginManager.isInKuafu_To_biWuDaHui > 0 || _loc10_ == 0)
               {
                  _loc11_ = false;
               }
               _loc12_ = new Goods(_loc10_);
               if((Boolean(_loc12_)) && Boolean(_loc12_.res))
               {
                  _loc10_ = _loc12_.res.position;
               }
               else
               {
                  _loc11_ = false;
               }
               _loc13_ = true;
               if(_loc11_)
               {
                  _loc14_ = 0;
                  while(_loc14_ < _loc9_.length)
                  {
                     if(OtherConst.texiaoBoolean == false)
                     {
                        if(_loc9_[_loc14_][0] != null && _loc10_ == _loc9_[_loc14_][2])
                        {
                           _loc15_ = _loc9_[_loc14_][0];
                           _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,_loc12_.res.id_m,_loc6_,_loc4_.isFeixing,true);
                           if(!param1.hasSameAvatarPart(_loc5_))
                           {
                              param1.loadAvatarPart(_loc5_);
                           }
                           _loc13_ = false;
                           break;
                        }
                     }
                     _loc14_++;
                  }
                  if(_loc13_)
                  {
                     if(param1.isMainChar())
                     {
                        _loc10_ = _loc4_.useIng_Weapon_id = 0;
                        PipeManager.sendMsg(PipeConstants.SAVE_SHOW_JIAN,{"id":0});
                     }
                     else
                     {
                        _loc10_ = _loc4_.useIng_Weapon_id;
                     }
                     _loc11_ = false;
                  }
               }
               _loc13_ = true;
               if(!_loc11_)
               {
                  _loc14_ = 0;
                  while(_loc14_ < _loc9_.length)
                  {
                     if(OtherConst.texiaoBoolean == false)
                     {
                        if(_loc9_[_loc14_][0] != null)
                        {
                           _loc15_ = _loc9_[_loc14_][0];
                           _loc16_ = int(_loc15_.className.toLowerCase().replace(/^[a-z]+/,""));
                           if(ReloginManager.isInGongcheng || ReloginManager.isInKuafu || ReloginManager.isInKuafu_To_biWuDaHui > 0)
                           {
                              _loc16_--;
                           }
                           _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,_loc16_,_loc6_,_loc4_.isFeixing,true);
                           if(!param1.hasSameAvatarPart(_loc5_))
                           {
                              param1.loadAvatarPart(_loc5_);
                           }
                           _loc13_ = false;
                           break;
                        }
                     }
                     _loc14_++;
                  }
                  if(_loc13_)
                  {
                     if(_loc4_.apd_weapon != null)
                     {
                        _loc15_ = _loc4_.apd_weapon;
                        _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,int(_loc4_.apd_weapon.className.toLowerCase().replace(/^[a-z]+/,"")),_loc6_,_loc4_.isFeixing);
                        if(!param1.hasSameAvatarPart(_loc5_))
                        {
                           param1.loadAvatarPart(_loc5_);
                        }
                     }
                     else
                     {
                        param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
                     }
                  }
               }
               if(_loc4_.isBiWuZhaoQinXiuQiu)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.BIWUZHAOQIN_XIUQIU_ID,_loc6_,_loc4_.isFeixing);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
                  if(!param1.hasSameAvatarPart(_loc5_))
                  {
                     param1.loadAvatarPart(_loc5_);
                  }
               }
               else if(_loc4_.isRiYueShenJian)
               {
                  if(_loc6_ == 1)
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.RIYUESHENJIAN_AVATAR_ID_1,_loc6_,_loc4_.isFeixing);
                  }
                  else
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.RIYUESHENJIAN_AVATAR_ID_0,_loc6_,_loc4_.isFeixing);
                  }
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
                  if(!param1.hasSameAvatarPart(_loc5_))
                  {
                     param1.loadAvatarPart(_loc5_);
                  }
               }
               else if(_loc4_.isXiaLvTuMo)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.XIALVTUMO_WUQI_ID,_loc6_,_loc4_.isFeixing);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
                  if(!param1.hasSameAvatarPart(_loc5_))
                  {
                     param1.loadAvatarPart(_loc5_);
                  }
               }
               else if(_loc4_.isLiuXingLuo)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.LIUXINGLUO_WUQI_ID,_loc6_,_loc4_.isFeixing);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
                  if(!param1.hasSameAvatarPart(_loc5_))
                  {
                     param1.loadAvatarPart(_loc5_);
                  }
               }
               else if(_loc4_.isFengLei)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.FENGLEI_WUQI_ID,_loc6_,_loc4_.isFeixing);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
                  if(!param1.hasSameAvatarPart(_loc5_))
                  {
                     param1.loadAvatarPart(_loc5_);
                  }
               }
               else if(_loc4_.isXieLongMoJian)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.XIELONGMOJIAN_WUQI_ID,_loc6_,_loc4_.isFeixing);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
                  if(!param1.hasSameAvatarPart(_loc5_))
                  {
                     param1.loadAvatarPart(_loc5_);
                  }
               }
               else if(_loc4_.isXueWu)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.XUEWU_WUQI_ID,_loc6_,_loc4_.isFeixing);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
                  if(!param1.hasSameAvatarPart(_loc5_))
                  {
                     param1.loadAvatarPart(_loc5_);
                  }
               }
               else if(_loc4_.isJuLongZhiJi)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JULONGZHIJI_WUQI_ID,_loc6_,_loc4_.isFeixing);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
                  if(!param1.hasSameAvatarPart(_loc5_))
                  {
                     param1.loadAvatarPart(_loc5_);
                  }
               }
               else if(_loc4_.isSuiHunYinXue)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.SUIHUNYINXUE_WUQI_ID,_loc6_,_loc4_.isFeixing);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
                  if(!param1.hasSameAvatarPart(_loc5_))
                  {
                     param1.loadAvatarPart(_loc5_);
                  }
               }
               else if(_loc4_.isSuiHunZhiShang)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.SUIHUNZHISHANG_WUQI_ID,_loc6_,_loc4_.isFeixing);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
                  if(!param1.hasSameAvatarPart(_loc5_))
                  {
                     param1.loadAvatarPart(_loc5_);
                  }
               }
               else if(_loc4_.isHanGuang)
               {
                  if(_loc6_ == 1)
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.HANGUANG_WUQI_ID,_loc6_,_loc4_.isFeixing);
                  }
                  else
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.HANGUANG_WUQI_ID_0,_loc6_,_loc4_.isFeixing);
                  }
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
                  if(!param1.hasSameAvatarPart(_loc5_))
                  {
                     param1.loadAvatarPart(_loc5_);
                  }
               }
            }
            else if(_loc4_.isYouyong)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
            }
            else if(_loc4_.isShenjiangji)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
            }
            else if(_loc4_.is255 || _loc4_.is255)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
            }
            else if(_loc4_.isBailongjiang)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
            }
            else if(_loc4_.isTianwang)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
            }
            else if(_loc4_.isYingxiong || _loc4_.isYingxiong1 || _loc4_.isWANSHI)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
            }
            else if(_loc4_.isTianmajian)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
            }
            else if(_loc4_.isXiongjijian)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
            }
            else if(_loc4_.isXuanbingjian)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
            }
            else if(_loc4_.isCiKe)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.CIKE_WUQI_ID_1,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.CIKE_WUQI_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isWuQiHuanZhuang)
            {
               if(param1 == GameInstance.mainChar)
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict_Main[3];
               }
               else
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict[3];
               }
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,_loc8_[4],_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,_loc8_[6],_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isXuanYuanShenJian)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.XUANYUANSHENJIAN_WUQI_ID,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isMoJian)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.MOJIAN_WUQI_ID,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isMoDao)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.MODAO_WUQI_ID,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isBaJiaoShan)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.BAJIAOSHAN_WUQI_ID,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isXiaLvTuMo)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.XIALVTUMO_WUQI_ID,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isFengLei)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.FENGLEI_WUQI_ID,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isLiuXingLuo)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.LIUXINGLUO_WUQI_ID,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isXieLongMoJian)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.XIELONGMOJIAN_WUQI_ID,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isXueWu)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.XUEWU_WUQI_ID,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isJuLongZhiJi)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JULONGZHIJI_WUQI_ID,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isSuiHunYinXue)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.SUIHUNYINXUE_WUQI_ID,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isSuiHunZhiShang)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.SUIHUNZHISHANG_WUQI_ID,_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isHanGuang)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.HANGUANG_WUQI_ID,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.HANGUANG_WUQI_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isCiKeTaoZhuang)
            {
               if(_loc6_ == 1)
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CIKE_AVATAR_ID_1,_loc6_);
               }
               else
               {
                  _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CIKE_AVATAR_ID_0,_loc6_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isBiWuZhaoQinXiuQiu)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.BIWUZHAOQIN_XIUQIU_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isZhumozhang || _loc4_.isYangguo || _loc4_.isLiMoChou || _loc4_.isYinZhiPing || _loc4_.isGuoXiang || _loc4_.isLinghuchong || _loc4_.isRenyingying || _loc4_.isYuebuqun || _loc4_.isRenWoXing || _loc4_.isXuZhu || _loc4_.isDuanYu || _loc4_.isWangYuYan || _loc4_.isAZi || _loc4_.isQiaoFeng)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
            }
            else if(_loc4_.isJingLeiQiang > 0)
            {
               if(_loc4_.isJingLeiQiang == 1)
               {
                  if(_loc6_ == 1)
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_1_WUQI_ID,_loc6_);
                  }
                  else
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_1_WUQI_ID_0,_loc6_);
                  }
               }
               else if(_loc4_.isJingLeiQiang == 2)
               {
                  if(_loc6_ == 1)
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_2_WUQI_ID,_loc6_);
                  }
                  else
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_2_WUQI_ID_0,_loc6_);
                  }
               }
               else if(_loc4_.isJingLeiQiang == 3)
               {
                  if(_loc6_ == 1)
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_3_WUQI_ID,_loc6_);
                  }
                  else
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_3_WUQI_ID_0,_loc6_);
                  }
               }
               else if(_loc4_.isJingLeiQiang == 4)
               {
                  if(_loc6_ == 1)
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_4_WUQI_ID,_loc6_);
                  }
                  else
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_4_WUQI_ID_0,_loc6_);
                  }
               }
               else if(_loc4_.isJingLeiQiang == 5)
               {
                  if(_loc6_ == 1)
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_5_WUQI_ID,_loc6_);
                  }
                  else
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_5_WUQI_ID_0,_loc6_);
                  }
               }
               else if(_loc4_.isJingLeiQiang == 6)
               {
                  if(_loc6_ == 1)
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_6_WUQI_ID,_loc6_);
                  }
                  else
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_6_WUQI_ID_0,_loc6_);
                  }
               }
               else if(_loc4_.isJingLeiQiang == 7)
               {
                  if(_loc6_ == 1)
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_7_WUQI_ID,_loc6_);
                  }
                  else
                  {
                     _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,SpecialGoodsID.JINGLEIQIANG_7_WUQI_ID_0,_loc6_);
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isDaHuanZhuang || _loc4_.isDaHuanZhuang_WUMA || _loc4_.isDaHuanZhuang_QUANPINGBI)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
            }
            else
            {
               _loc10_ = _loc4_.useIng_Weapon_id;
               _loc11_ = true;
               if(ReloginManager.isInGongcheng || ReloginManager.isInKuafu || ReloginManager.isInKuafu_To_biWuDaHui > 0 || _loc10_ == 0)
               {
                  _loc11_ = false;
               }
               _loc12_ = new Goods(_loc10_);
               if((Boolean(_loc12_)) && Boolean(_loc12_.res))
               {
                  _loc10_ = _loc12_.res.position;
               }
               else
               {
                  _loc11_ = false;
               }
               _loc13_ = true;
               if(_loc11_)
               {
                  _loc14_ = 0;
                  while(_loc14_ < _loc9_.length)
                  {
                     if(OtherConst.texiaoBoolean == false)
                     {
                        if(_loc9_[_loc14_][0] != null && _loc10_ == _loc9_[_loc14_][2])
                        {
                           _loc5_ = _loc15_ = _loc9_[_loc14_][0];
                           if(!param1.hasSameAvatarPart(_loc5_))
                           {
                              param1.loadAvatarPart(_loc5_);
                           }
                           _loc13_ = false;
                           break;
                        }
                     }
                     _loc14_++;
                  }
                  if(_loc13_)
                  {
                     if(param1.isMainChar())
                     {
                        _loc10_ = _loc4_.useIng_Weapon_id = 0;
                        PipeManager.sendMsg(PipeConstants.SAVE_SHOW_JIAN,{"id":0});
                     }
                     else
                     {
                        _loc10_ = _loc4_.useIng_Weapon_id;
                     }
                     _loc11_ = false;
                  }
               }
               _loc13_ = true;
               if(!_loc11_)
               {
                  _loc14_ = 0;
                  while(_loc14_ < _loc9_.length)
                  {
                     if(OtherConst.texiaoBoolean == false)
                     {
                        if(_loc9_[_loc14_][0] != null)
                        {
                           _loc5_ = _loc15_ = _loc9_[_loc14_][0];
                           if(!param1.hasSameAvatarPart(_loc5_))
                           {
                              param1.loadAvatarPart(_loc5_);
                           }
                           _loc13_ = false;
                           break;
                        }
                     }
                     _loc14_++;
                  }
                  if(_loc13_)
                  {
                     if(_loc4_.apd_weapon != null)
                     {
                        _loc15_ = _loc4_.apd_weapon;
                        _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,int(_loc4_.apd_weapon.className.toLowerCase().replace(/^[a-z]+/,"")),_loc6_,_loc4_.isFeixing);
                        if(!param1.hasSameAvatarPart(_loc5_))
                        {
                           param1.loadAvatarPart(_loc5_);
                        }
                     }
                     else
                     {
                        param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
                     }
                  }
               }
            }
         }
         if(param2 == null || param2.indexOf(SpeciaAvatarPartID.BOW) != -1)
         {
            if(isShowZhenYingAvatar(_loc4_.zhenYingHuanZhuang))
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
               }
            }
            else if(isShowWangzhezhibangAvatar(_loc4_.wangzhezhibang))
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,getWangzhezhibangAvatarId(_loc4_.wangzhezhibang,SpeciaAvatarPartID.WEAPON,_loc6_),_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isFeixing && !_loc4_.isCiKe && !_loc4_.isZhumozhang && !_loc4_.isDaHuanZhuang_QUANPINGBI)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BOW,AvatarManager.getChiBangAvatarIdByType(_loc4_.isFeixing_huanzhuang_Id,_loc6_),_loc6_,_loc4_.isFeixing);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isFenshenHuanzhuang)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
               }
            }
            else if(_loc4_.isYangguo || _loc4_.isGuoXiang || _loc4_.isLiMoChou || _loc4_.isYinZhiPing || _loc4_.isLinghuchong || _loc4_.isRenyingying || _loc4_.isAZi || _loc4_.isQiaoFeng || _loc4_.isRenWoXing || _loc4_.isYuebuqun || _loc4_.isXuZhu || _loc4_.isDuanYu || _loc4_.isWangYuYan)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
               }
            }
            else if(_loc4_.isShenjiangji || _loc4_.is255 || _loc4_.is256 || _loc4_.is257)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
               }
            }
            else if(_loc4_.isBailongjiang)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
               }
            }
            else if(_loc4_.isTianwang)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
               }
            }
            else if(_loc4_.isYingxiong || _loc4_.isYingxiong1 || _loc4_.isWANSHI)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
               }
            }
            else if(_loc4_.isTianmajian)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
               }
            }
            else if(_loc4_.isXiongjijian)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
               }
            }
            else if(_loc4_.isXuanbingjian)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
               }
            }
            else if(_loc4_.isYouyong)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
               }
            }
            else if(_loc4_.isCiKe)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
               }
            }
            else if(_loc4_.isFuQiJingJiFeiDaDiao)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
               }
            }
            else if(_loc4_.isZhumozhang)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
               }
            }
            else if(_loc4_.isDaHuanZhuang || _loc4_.isDaHuanZhuang_WUMA || _loc4_.isDaHuanZhuang_QUANPINGBI)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
               }
            }
            else if(_loc4_.apd_bow != null)
            {
               if(!param1.hasSameAvatarPart(_loc4_.apd_bow))
               {
                  param1.loadAvatarPart(_loc4_.apd_bow);
               }
            }
            else
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
            }
         }
         if(param2 == null || param2.indexOf(SpeciaAvatarPartID.ZHENHUN) != -1)
         {
            if(isShowZhenYingAvatar(_loc4_.zhenYingHuanZhuang))
            {
               if(_loc4_.apd_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(isShowWangzhezhibangAvatar(_loc4_.wangzhezhibang))
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,getWangzhezhibangAvatarId(_loc4_.wangzhezhibang,SpeciaAvatarPartID.WEAPON,_loc6_),_loc6_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
               if(!param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isFeixing && !_loc4_.isCiKe && !_loc4_.isZhumozhang && !_loc4_.isDaHuanZhuang_QUANPINGBI)
            {
               _loc5_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.ZHENHUN,_loc4_.isFeixing_wuhun_Id,_loc6_,_loc4_.isFeixing);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               if(Boolean(_loc5_) && !param1.hasSameAvatarPart(_loc5_))
               {
                  param1.loadAvatarPart(_loc5_);
               }
            }
            else if(_loc4_.isFenshenHuanzhuang)
            {
               if(_loc4_.apd_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isYangguo || _loc4_.isGuoXiang || _loc4_.isLiMoChou || _loc4_.isYinZhiPing || _loc4_.isLinghuchong || _loc4_.isRenyingying || _loc4_.isAZi || _loc4_.isQiaoFeng || _loc4_.isRenWoXing || _loc4_.isYuebuqun || _loc4_.isXuZhu || _loc4_.isDuanYu || _loc4_.isWangYuYan)
            {
               if(_loc4_.apd_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isShenjiangji || _loc4_.is255 || _loc4_.is256 || _loc4_.is257)
            {
               if(_loc4_.apd_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isBailongjiang)
            {
               if(_loc4_.apd_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isTianwang)
            {
               if(_loc4_.apd_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isYingxiong || _loc4_.isYingxiong1 || _loc4_.isWANSHI)
            {
               if(_loc4_.apd_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isTianmajian)
            {
               if(_loc4_.apd_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isXiongjijian)
            {
               if(_loc4_.apd_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isXuanbingjian)
            {
               if(_loc4_.apd_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isYouyong)
            {
               if(_loc4_.apd_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isCiKe)
            {
               if(_loc4_.apd_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isFuQiJingJiFeiDaDiao)
            {
               if(_loc4_.apd_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isZhumozhang)
            {
               if(_loc4_.apd_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isDaHuanZhuang || _loc4_.isDaHuanZhuang_WUMA || _loc4_.isDaHuanZhuang_QUANPINGBI)
            {
               if(_loc4_.apd_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.apd_zhenhun != null)
            {
               if(!param1.hasSameAvatarPart(_loc4_.apd_zhenhun))
               {
                  param1.loadAvatarPart(_loc4_.apd_zhenhun);
               }
            }
            else
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
            }
         }
      }
      
      private static function wearMount(param1:SceneCharacter, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:AvatarInfo = null;
         var _loc5_:int = 0;
         var _loc6_:AvatarParamData = null;
         var _loc7_:Player = null;
         var _loc8_:Array = null;
         var _loc9_:AvatarParamData = null;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:Goods = null;
         var _loc14_:Boolean = false;
         var _loc15_:int = 0;
         var _loc16_:AvatarParamData = null;
         _loc4_ = (param1.data as BaseCharacter).avatarInfo;
         param1.removeAvatarPartByID(SpeciaAvatarPartID.BODY);
         param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
         param1.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
         _loc5_ = 1;
         if(param1.type == SceneCharacterType.PLAYER)
         {
            _loc5_ = (param1.data as Player).attributeInfo.getSex();
            _loc7_ = param1.data as Player;
            if(_loc4_.isZunrongWanbaoge)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.JINGMAI_LEVEL,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.SILINGZHEN,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.SHENGSIFU,false);
            }
            else if(_loc4_.isCiKe || isShowWangzhezhibangAvatar(_loc4_.wangzhezhibang) || _loc4_.isYouyong || _loc4_.isBiWuZhaoQinFeiDaDiao || _loc4_.isFuQiJingJiFeiDaDiao || _loc4_.isZhumozhang || _loc4_.isYangguo || _loc4_.isXiaolongnv || _loc4_.isZhenggu || _loc4_.isHuanYingXiaDao || _loc4_.isLangRen > 0 || _loc4_.isDagoubang || _loc4_.isLingHu || _loc4_.isLvHaMa || _loc4_.isFanTongXianJue || isShowZhenYingAvatar(_loc4_.zhenYingHuanZhuang) || _loc4_.isCiKeTaoZhuang || _loc4_.isHuangChengShouWeiTaoZhuang || _loc4_.isGuoXiang || _loc4_.isLiMoChou || _loc4_.isYinZhiPing || _loc4_.isLinghuchong || _loc4_.isRenyingying || _loc4_.isAZi || _loc4_.isQiaoFeng || _loc4_.isYuebuqun || _loc4_.isRenWoXing || _loc4_.isShuangRenFengXing_ZhongQiu || _loc4_.isYueTuHuanZhuang || _loc4_.isXuZhu || _loc4_.isDuanYu || _loc4_.isWangYuYan || _loc4_.isBailongjiang)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.JINGMAI_LEVEL,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.SILINGZHEN,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_1,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_2,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_3,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_4,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_5,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.SHENGSIFU,false);
            }
            else
            {
               AvatarManager.updateQixuanAvatar(param1,_loc7_.attributeInfo.qixuan1ID,_loc7_.attributeInfo.qixuan2ID,_loc7_.attributeInfo.qixuan3ID,_loc7_.attributeInfo.qixuan4ID,_loc7_.attributeInfo.qixuan5ID);
               AvatarManager.updateSilingzhenAvatar(param1,_loc7_.attributeInfo.silingzhenCount);
               AvatarManager.updateZhenLongqiHeiAvatar(param1,_loc7_.attributeInfo.zhenlongqiHeiCount);
               AvatarManager.updateZhenLongqiBaiAvatar(param1,_loc7_.attributeInfo.zhenlongqiBaiCount);
               AvatarManager.updateJingmaiAvatar(param1,_loc7_.jingmaiInfo.getOpenedJingmaiNum());
               AvatarManager.updateShensifuAvatar(param1,_loc7_.attributeInfo.shengsifuCount);
               AvatarManager.updateZhenLongqiHeiAvatar(param1,_loc7_.attributeInfo.zhenlongqiHeiCount);
               AvatarManager.updateZhenLongqiBaiAvatar(param1,_loc7_.attributeInfo.zhenlongqiBaiCount);
               AvatarManager.updateWuCaiXianZhenAvatar(param1,_loc7_.attributeInfo.wuCaiXianZhenCount);
            }
         }
         else if(param1.type == SceneCharacterType.FENSHEN)
         {
            _loc5_ = (param1.data as Player).attributeInfo.getSex();
            _loc7_ = param1.data as Player;
            if(_loc4_.isZunrongWanbaoge)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.JINGMAI_LEVEL,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.SILINGZHEN,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.SHENGSIFU,false);
            }
            else if(_loc4_.isCiKe || _loc4_.isYouyong || _loc4_.isBiWuZhaoQinFeiDaDiao || _loc4_.isZhumozhang || _loc4_.isFuQiJingJiFeiDaDiao || _loc4_.isZhenggu || _loc4_.isHuanYingXiaDao || _loc4_.isLangRen > 0 || _loc4_.isDagoubang || _loc4_.isLingHu || _loc4_.isLvHaMa || _loc4_.isFanTongXianJue || _loc4_.isYangguo || _loc4_.isXiaolongnv || isShowZhenYingAvatar(_loc4_.zhenYingHuanZhuang) || _loc4_.isCiKeTaoZhuang || _loc4_.isGuoXiang || _loc4_.isLiMoChou || _loc4_.isRenWoXing || _loc4_.isYinZhiPing || _loc4_.isLinghuchong || _loc4_.isRenyingying || _loc4_.isYuebuqun || _loc4_.isHuangChengShouWeiTaoZhuang || _loc4_.isYueTuHuanZhuang || _loc4_.isXuZhu || _loc4_.isDuanYu || _loc4_.isWangYuYan || _loc4_.isAZi || _loc4_.isQiaoFeng || _loc4_.isBailongjiang)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.JINGMAI_LEVEL,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.SILINGZHEN,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_1,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_2,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_3,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_4,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.QIXUAN_5,false);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.SHENGSIFU,false);
            }
            else
            {
               AvatarManager.updateQixuanAvatar(param1,_loc7_.attributeInfo.qixuan1ID,_loc7_.attributeInfo.qixuan2ID,_loc7_.attributeInfo.qixuan3ID,_loc7_.attributeInfo.qixuan4ID,_loc7_.attributeInfo.qixuan5ID);
               AvatarManager.updateSilingzhenAvatar(param1,_loc7_.attributeInfo.silingzhenCount);
               AvatarManager.updateJingmaiAvatar(param1,_loc7_.jingmaiInfo.getOpenedJingmaiNum());
               AvatarManager.updateShensifuAvatar(param1,_loc7_.attributeInfo.shengsifuCount);
               AvatarManager.updateZhenLongqiHeiAvatar(param1,_loc7_.attributeInfo.zhenlongqiHeiCount);
               AvatarManager.updateZhenLongqiBaiAvatar(param1,_loc7_.attributeInfo.zhenlongqiBaiCount);
               AvatarManager.updateWuCaiXianZhenAvatar(param1,_loc7_.attributeInfo.wuCaiXianZhenCount);
            }
         }
         if(param2 == null || param2.indexOf(SpeciaAvatarPartID.MOUNT) != -1)
         {
            if(_loc4_.apd_mount != null)
            {
               if(isShowZhenYingAvatar(_loc4_.zhenYingHuanZhuang))
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT,getZhenYingAvatarId(_loc4_.zhenYingHuanZhuang,SpeciaAvatarPartID.MOUNT,_loc5_),_loc5_);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(isShowWangzhezhibangAvatar(_loc4_.wangzhezhibang))
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT,getWangzhezhibangAvatarId(_loc4_.wangzhezhibang,SpeciaAvatarPartID.MOUNT,_loc5_),_loc5_);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(_loc4_.isFeixing && !_loc4_.isCiKe && !_loc4_.isDaHuanZhuang_QUANPINGBI)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
               }
               else if(_loc4_.isYouyong)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
               }
               else if(_loc4_.isZhumozhang)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
               }
               else if(_loc4_.isBailongjiang)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
               }
               else if(_loc4_.isShenjiangji)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT,SpecialGoodsID.SHENJIANGJI_MOUNT,_loc5_);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(_loc4_.is255 || _loc4_.is256 || _loc4_.is257)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
               }
               else if(_loc4_.isTianwang)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
               }
               else if(_loc4_.isYingxiong || _loc4_.isYingxiong1 || _loc4_.isWANSHI)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
               }
               else if(_loc4_.isTianmajian)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
               }
               else if(_loc4_.isXiongjijian)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
               }
               else if(_loc4_.isXuanbingjian)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
               }
               else if(_loc4_.isCiKe)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT,SpecialGoodsID.CIKE_MOUNT_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT,SpecialGoodsID.CIKE_MOUNT_ID_0,_loc5_);
                  }
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(_loc4_.isYangguo || _loc4_.isGuoXiang || _loc4_.isRenWoXing || _loc4_.isLiMoChou || _loc4_.isYinZhiPing || _loc4_.isLinghuchong || _loc4_.isRenyingying || _loc4_.isAZi || _loc4_.isQiaoFeng || _loc4_.isYuebuqun || _loc4_.isXuZhu || _loc4_.isDuanYu || _loc4_.isWangYuYan)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
               }
               else if(_loc4_.isXiaolongnv)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
               }
               else if(_loc4_.isHuangChengShouWeiTaoZhuang)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT,SpecialGoodsID.HUANGCHENGSHOUWEI_MOUNT_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT,SpecialGoodsID.HUANGCHENGSHOUWEI_MOUNT_ID_0,_loc5_);
                  }
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(_loc4_.isLangRen > 0 || _loc4_.isDagoubang || _loc4_.isLingHu || _loc4_.isLvHaMa || _loc4_.isFanTongXianJue || _loc4_.isMingJieZhanShen || _loc4_.isYanMoNuPu || _loc4_.isXiangYangDaJiang || _loc4_.isJiGong || _loc4_.isLuoHan || _loc4_.isShanZei || _loc4_.isJinJiaZhanChe || _loc4_.isYinYangDaoRen || _loc4_.isShiHua || _loc4_.isJiaLouLuo || _loc4_.isBaoMeiRen || _loc4_.isYingXiongShouWei || _loc4_.isTianZhao || _loc4_.isQiuQianCHi || _loc4_.isJianTiFengYin || _loc4_.isDiLu || _loc4_.isKunShou || _loc4_.isChiYou || _loc4_.isHongLianXianZi || _loc4_.isShaMoFeiYing || _loc4_.isMoLingZhiYuan || _loc4_.isBaiMianShuSheng || _loc4_.isYuFeng || _loc4_.isBingJingHu || _loc4_.isXiongBa || _loc4_.isSanShengMu || _loc4_.isBuSiJinShen || _loc4_.isDaHuanZhuang_WUMA || _loc4_.isDaHuanZhuang_QUANPINGBI)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
               }
               else if(_loc4_.isZuoQiHuanZhuang)
               {
                  if(param1 == GameInstance.mainChar)
                  {
                     _loc8_ = body_AvatarID_by_AvatarType_dict_Main[5];
                  }
                  else
                  {
                     _loc8_ = body_AvatarID_by_AvatarType_dict[5];
                  }
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT,_loc8_[7],_loc5_);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(_loc4_.usingFashion == 2)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
               }
               else if(!param1.hasSameAvatarPart(_loc4_.apd_mount))
               {
                  param1.loadAvatarPart(_loc4_.apd_mount);
               }
            }
            else
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT);
            }
         }
         if(param2 == null || param2.indexOf(SpeciaAvatarPartID.MOUNT_BODY) != -1)
         {
            if(isShowZhenYingAvatar(_loc4_.zhenYingHuanZhuang))
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,getZhenYingAvatarId(_loc4_.zhenYingHuanZhuang,SpeciaAvatarPartID.MOUNT_BODY,_loc5_),_loc5_);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,getZhenYingAvatarId(_loc4_.zhenYingHuanZhuang,SpeciaAvatarPartID.BODY,_loc5_),_loc5_);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(isShowWangzhezhibangAvatar(_loc4_.wangzhezhibang))
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,getWangzhezhibangAvatarId(_loc4_.wangzhezhibang,SpeciaAvatarPartID.MOUNT_BODY,_loc5_),_loc5_);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,getWangzhezhibangAvatarId(_loc4_.wangzhezhibang,SpeciaAvatarPartID.BODY,_loc5_),_loc5_);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isFeixing && !_loc4_.isCiKe && !_loc4_.isDaHuanZhuang_QUANPINGBI)
            {
               if(!param3)
               {
                  if(_loc4_.apd_mount_body != null)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,int(_loc4_.apd_mount_body.className.toLowerCase().replace(/^[a-z]+/,"")),_loc5_,_loc4_.isFeixing);
                  }
               }
               else
               {
                  if(_loc4_.apd_body != null)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,int(_loc4_.apd_body.className.toLowerCase().replace(/^[a-z]+/,"")),_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isWuLinMengZhu)
            {
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,77783328,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,77783329,_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,77783328,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,77783329,_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isYouyong)
            {
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.YOUYONG_HUANZHUANG_ID_NAN,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.YOUYONG_HUANZHUANG_ID_NV,_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YOUYONG_HUANZHUANG_ID_NAN,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YOUYONG_HUANZHUANG_ID_NV,_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isDaHuanZhuang)
            {
               if(param1 == GameInstance.mainChar)
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict_Main[1];
               }
               else
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict[1];
               }
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,_loc8_[0],_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,_loc8_[0],_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,_loc8_[0],_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,_loc8_[0],_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isDaHuanZhuang_WUMA)
            {
               if(param1 == GameInstance.mainChar)
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict_Main[7];
               }
               else
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict[7];
               }
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,_loc8_[0],_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,_loc8_[0],_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,_loc8_[0],_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,_loc8_[0],_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isDaHuanZhuang_QUANPINGBI)
            {
               if(param1 == GameInstance.mainChar)
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict_Main[8];
               }
               else
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict[8];
               }
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,_loc8_[1],_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,_loc8_[2],_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,_loc8_[1],_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,_loc8_[2],_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isXiaoHuanZhuang)
            {
               if(param1 == GameInstance.mainChar)
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict_Main[2];
               }
               else
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict[2];
               }
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,_loc8_[1],_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,_loc8_[2],_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,_loc8_[1],_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,_loc8_[2],_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isZhumozhang)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.ZHUMOZHANG_ID);
               if(_loc6_ == null)
               {
                  if(GameInstance.scene.blankAvatarParamData != null)
                  {
                     _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                  }
                  else
                  {
                     _loc6_ = null;
                  }
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isCiKeTaoZhuang)
            {
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.CIKE_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.CIKE_AVATAR_ID_0,_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CIKE_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CIKE_AVATAR_ID_0,_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isHuangChengShouWeiTaoZhuang)
            {
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.HUANGCHENGSHOUWEI_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.HUANGCHENGSHOUWEI_AVATAR_ID_0,_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.HUANGCHENGSHOUWEI_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.HUANGCHENGSHOUWEI_AVATAR_ID_0,_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isBailongjiang)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.BAILONGJIANG);
               if(_loc6_ == null)
               {
                  if(GameInstance.scene.blankAvatarParamData != null)
                  {
                     _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                  }
                  else
                  {
                     _loc6_ = null;
                  }
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isZhenggu)
            {
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.YURENJIE_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.YURENJIE_AVATAR_ID_0,_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YURENJIE_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YURENJIE_AVATAR_ID_0,_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isXinShouHuanZhuang)
            {
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.CHUSHI_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.CHUSHI_AVATAR_ID_0,_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CHUSHI_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CHUSHI_AVATAR_ID_0,_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isHuanYingXiaDao)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.CIKE_AVATAR_ID_1,_loc5_);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CIKE_AVATAR_ID_1,_loc5_);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isWangZheXueSha)
            {
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.WANGZHEXUESHA_ID_NAN,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.WANGZHEXUESHA_ID_NV,_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.WANGZHEXUESHA_ID_NAN,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.WANGZHEXUESHA_ID_NV,_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isJiGuanGuai)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.JIGUANGUAI_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.JIGUANGUAI_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isMingJieZhanShen)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.MINGJIEZHANSHEN_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.MINGJIEZHANSHEN_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isZhaoYun)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.ZHAOYUN_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.ZHAOYUN_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isHeiAnMoJun)
            {
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.HEIANMOJUN_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.HEIANMOJUN_AVATAR_ID_0,_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.HEIANMOJUN_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.HEIANMOJUN_AVATAR_ID_0,_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isHuGuoShenJiang)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.ZHAOYUN_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.ZHAOYUN_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isHuangJinYinZhe)
            {
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.HUANGJINYINZHE_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.HUANGJINYINZHE_AVATAR_ID_0,_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.HUANGJINYINZHE_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.HUANGJINYINZHE_AVATAR_ID_0,_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isZiLingShou)
            {
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.ZILINGSHOU_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.ZILINGSHOU_AVATAR_ID_0,_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.ZILINGSHOU_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.ZILINGSHOU_AVATAR_ID_0,_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isZhaoYun_Jin)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.ZHAOYUN_JIN_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.ZHAOYUN_JIN_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isZhaoMin)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.ZHAOMIN_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.ZHAOMIN_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isXiongBa)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.XIONGBA_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.XIONGBA_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isBaoMeiRen)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.BAOMEIREN_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.BAOMEIREN_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isJiaLouLuo)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.JIALOULUO_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.JIALOULUO_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isYinYangDaoRen)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.YINYANGDAOREN_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YINYANGDAOREN_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isJiGong)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.JIGONG_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.JIGONG_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isLuoHan)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.LUOHAN_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.LUOHAN_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isXiangYangDaJiang)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.XIANGYANGDAJIANG_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.XIANGYANGDAJIANG_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isShiHua)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.SHIHUA_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.SHIHUA_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isSanShengMu)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.SANSHENGMU_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.SANSHENGMU_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isBingJingHu)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.BINGJINGHU_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.BINGJINGHU_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isShaMoFeiYing)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.SHAMOFEIYING_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.SHAMOFEIYING_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isTieShanGongZhu)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.TIESHANGONGZHU_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.TIESHANGONGZHU_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isBaiMianShuSheng)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.BAIMIANSHUSHENG_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.BAIMIANSHUSHENG_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isHongLianXianZi)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.HONGLIANXIANZI_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.HONGLIANXIANZI_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isChiYou)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.CHIYOU_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CHIYOU_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isTianShiEMo)
            {
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.TIANSHIEMO_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.TIANSHIEMO_AVATAR_ID_0,_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.TIANSHIEMO_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.TIANSHIEMO_AVATAR_ID_0,_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isYuFeng)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.YUFENG_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YUFENG_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isTianZhao)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.TIANZHAO_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.TIANZHAO_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isYingXiongShouWei)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.YINGXIONGSHOUWEI_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YINGXIONGSHOUWEI_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isYangguo)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.KAPAI_YANGGUO);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_YANGGUO);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isAZi)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.KAPAI_AZI);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_AZI);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isQiaoFeng)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.KAPAI_QIAOFENG);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_QIAOFENG);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isGuoXiang)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.KAPAI_GUOXIANG);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_GUOXIANG);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isLiMoChou)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.KAPAI_LIMOCHOU);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_LIMOCHOU);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isYinZhiPing)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.KAPAI_YINZHIPING);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_YINZHIPING);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isXiaolongnv)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.KAPAI_XIAOLONGNV);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_XIAOLONGNV);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isLinghuchong)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.KAPAI_LINGHUCHONG);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_LINGHUCHONG);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isRenyingying)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.KAPAI_RENYINGYING);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_RENYINGYING);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isYuebuqun)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.KAPAI_YUEBUQUN);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_YUEBUQUN);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isRenWoXing)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.KAPAI_RENWOXING);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_RENWOXING);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isDuanYu)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.KAPAI_DUANYU);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_DUANYU);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isWangYuYan)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.KAPAI_WANGYUYAN);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_WANGYUYAN);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isXuZhu)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.KAPAI_XUZHU);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KAPAI_XUZHU);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isPoTian)
            {
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.POTIAN_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.POTIAN_AVATAR_ID_0,_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.POTIAN_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.POTIAN_AVATAR_ID_0,_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isShanZei)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.SHANZEI_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.SHANZEI_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isQiuQianCHi)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.QIUQIANCHI_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.QIUQIANCHI_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isMoLingZhiYuan)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.MOLINGZHIYUAN_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.MOLINGZHIYUAN_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isKunShou)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.KUNSHOU_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.KUNSHOU_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isYanMoNuPu)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.YANMONUPU_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YANMONUPU_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isJinJiaZhanChe)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.JINJIAZHANCHE_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.JINJIAZHANCHE_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isChangE)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.CHANGE_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CHANGE_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isJianTiFengYin)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.JIANTIFENGYIN_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.JIANTIFENGYIN_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isDiLu)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.DILUMA_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.DILUMA_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isMeiRenJi)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.MEIRENJI_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.MEIRENJI_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isBuSiJinShen)
            {
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.BUSIJINSHEN_ID_NAN,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.BUSIJINSHEN_ID_NV,_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.BUSIJINSHEN_ID_NAN,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.BUSIJINSHEN_ID_NV,_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isQiLinAvatar)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.QILIN_AVATAR_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.QILIN_AVATAR_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isHuXiaoShanLin)
            {
               if(!param3)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.HUXIAOSHANLIN_ID);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.HUXIAOSHANLIN_ID);
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isLangRen > 0)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,getLangRenHuanZhuangId(_loc4_.isLangRen));
               if(_loc6_ == null)
               {
                  if(GameInstance.scene.blankAvatarParamData != null)
                  {
                     _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                  }
                  else
                  {
                     _loc6_ = null;
                  }
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isShenjiangji)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.SHENJIANGJI);
               if(_loc6_ == null)
               {
                  if(GameInstance.scene.blankAvatarParamData != null)
                  {
                     _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                  }
                  else
                  {
                     _loc6_ = null;
                  }
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.is255)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,255);
               if(_loc6_ == null)
               {
                  if(GameInstance.scene.blankAvatarParamData != null)
                  {
                     _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                  }
                  else
                  {
                     _loc6_ = null;
                  }
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.is256)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,777839373);
               if(_loc6_ == null)
               {
                  if(GameInstance.scene.blankAvatarParamData != null)
                  {
                     _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                  }
                  else
                  {
                     _loc6_ = null;
                  }
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.is257)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,777841143);
               if(_loc6_ == null)
               {
                  if(GameInstance.scene.blankAvatarParamData != null)
                  {
                     _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                  }
                  else
                  {
                     _loc6_ = null;
                  }
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isTianwang)
            {
               if(_loc5_ == 1)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YN_TIANWANG_NAN,_loc5_);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YN_TIANWANG_NV,_loc5_);
               }
               if(_loc6_ == null)
               {
                  if(GameInstance.scene.blankAvatarParamData != null)
                  {
                     _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                  }
                  else
                  {
                     _loc6_ = null;
                  }
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isYingxiong)
            {
               if(_loc5_ == 1)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YN_YINGXIONG_NAN,_loc5_);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YN_YINGXIONG_NV,_loc5_);
               }
               if(_loc6_ == null)
               {
                  if(GameInstance.scene.blankAvatarParamData != null)
                  {
                     _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                  }
                  else
                  {
                     _loc6_ = null;
                  }
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isYingxiong1)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,777843025,_loc5_);
               if(_loc6_ == null)
               {
                  if(GameInstance.scene.blankAvatarParamData != null)
                  {
                     _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                  }
                  else
                  {
                     _loc6_ = null;
                  }
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isWANSHI)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,777838057,_loc5_);
               if(_loc6_ == null)
               {
                  if(GameInstance.scene.blankAvatarParamData != null)
                  {
                     _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                  }
                  else
                  {
                     _loc6_ = null;
                  }
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isTianmajian)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YN_TIANMAJIAN_BIANSHE_ID,_loc5_);
               if(_loc6_ == null)
               {
                  if(GameInstance.scene.blankAvatarParamData != null)
                  {
                     _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                  }
                  else
                  {
                     _loc6_ = null;
                  }
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isXiongjijian)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YN_XIONGJIJIAN_BIANJI_ID,_loc5_);
               if(_loc6_ == null)
               {
                  if(GameInstance.scene.blankAvatarParamData != null)
                  {
                     _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                  }
                  else
                  {
                     _loc6_ = null;
                  }
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isXuanbingjian)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.YN_XUANBINGJIAN_BIANJI_ID,_loc5_);
               if(_loc6_ == null)
               {
                  if(GameInstance.scene.blankAvatarParamData != null)
                  {
                     _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                  }
                  else
                  {
                     _loc6_ = null;
                  }
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isCiKe)
            {
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.CIKE_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.CIKE_AVATAR_ID_0,_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CIKE_AVATAR_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.CIKE_AVATAR_ID_0,_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isRongYuHuanZhong)
            {
               if(!param3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.RONGYUHUANZHUANG_ID_NAN,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,SpecialGoodsID.RONGYUHUANZHUANG_ID_NV,_loc5_);
                  }
               }
               else
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.RONGYUHUANZHUANG_ID_NAN,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,SpecialGoodsID.RONGYUHUANZHUANG_ID_NV,_loc5_);
                  }
                  if(_loc6_ == null)
                  {
                     if(GameInstance.scene.blankAvatarParamData != null)
                     {
                        _loc6_ = GameInstance.scene.blankAvatarParamData.clone();
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
                  if(_loc6_ != null)
                  {
                     _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc6_.useType = 2;
                     _loc6_.clearSameType = true;
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else
            {
               if(!param3)
               {
                  _loc9_ = _loc4_.apd_mount_body;
               }
               else
               {
                  if(_loc4_.apd_body != null)
                  {
                     _loc9_ = _loc4_.apd_body.clone();
                  }
                  else if(GameInstance.scene.blankAvatarParamData != null)
                  {
                     _loc9_ = GameInstance.scene.blankAvatarParamData.clone();
                  }
                  else
                  {
                     _loc9_ = null;
                  }
                  if(_loc9_ != null)
                  {
                     _loc9_.id = SpeciaAvatarPartID.MOUNT_BODY;
                     _loc9_.useType = 2;
                     _loc9_.clearSameType = true;
                  }
               }
               if(_loc9_ != null)
               {
                  if(!param1.hasSameAvatarPart(_loc9_))
                  {
                     param1.loadAvatarPart(_loc9_);
                  }
               }
               else
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BODY);
               }
            }
         }
         if(param2 == null || param2.indexOf(SpeciaAvatarPartID.MOUNT_WEAPON) != -1)
         {
            _loc10_ = _loc4_.teshuWuqiArr();
            if(isShowZhenYingAvatar(_loc4_.zhenYingHuanZhuang))
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,getZhenYingAvatarId(_loc4_.zhenYingHuanZhuang,SpeciaAvatarPartID.MOUNT_WEAPON,_loc5_),_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(isShowWangzhezhibangAvatar(_loc4_.wangzhezhibang))
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,getWangzhezhibangAvatarId(_loc4_.wangzhezhibang,SpeciaAvatarPartID.MOUNT_WEAPON,_loc5_),_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.usingFashion == 2 && !_loc4_.isCiKe)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,getHuangZhuAvatarId(SpeciaAvatarPartID.MOUNT_WEAPON,_loc5_),_loc5_,true);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isFeixing && !_loc4_.isCiKe && !_loc4_.isDaHuanZhuang_QUANPINGBI)
            {
               _loc11_ = _loc4_.useIng_Weapon_id;
               _loc12_ = true;
               if(ReloginManager.isInGongcheng || ReloginManager.isInKuafu || ReloginManager.isInKuafu_To_biWuDaHui > 0 || _loc11_ == 0)
               {
                  _loc12_ = false;
               }
               _loc13_ = new Goods(_loc11_);
               if((Boolean(_loc13_)) && Boolean(_loc13_.res))
               {
                  _loc11_ = _loc13_.res.position;
               }
               else
               {
                  _loc12_ = false;
               }
               _loc14_ = true;
               if(_loc12_)
               {
                  _loc15_ = 0;
                  while(_loc15_ < _loc10_.length)
                  {
                     if(OtherConst.texiaoBoolean == false)
                     {
                        if(_loc10_[_loc15_][1] != null && _loc11_ == _loc10_[_loc15_][2])
                        {
                           _loc16_ = _loc10_[_loc15_][1];
                           _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,_loc13_.res.id_m,_loc5_,_loc4_.isFeixing,true);
                           if(!param1.hasSameAvatarPart(_loc6_))
                           {
                              param1.loadAvatarPart(_loc6_);
                           }
                           _loc14_ = false;
                           break;
                        }
                     }
                     _loc15_++;
                  }
                  if(_loc14_)
                  {
                     if(param1.isMainChar())
                     {
                        _loc11_ = _loc4_.useIng_Weapon_id = 0;
                        PipeManager.sendMsg(PipeConstants.SAVE_SHOW_JIAN,{"id":0});
                     }
                     else
                     {
                        _loc11_ = _loc4_.useIng_Weapon_id;
                     }
                     _loc12_ = false;
                  }
               }
               _loc14_ = true;
               if(!_loc12_)
               {
                  _loc15_ = 0;
                  while(_loc15_ < _loc10_.length)
                  {
                     if(OtherConst.texiaoBoolean == false)
                     {
                        if(_loc10_[_loc15_][1] != null)
                        {
                           if(OtherConst.texiaoBoolean == false)
                           {
                              _loc16_ = _loc10_[_loc15_][1];
                              _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,int(_loc16_.className.toLowerCase().replace(/^[a-z]+/,"")),_loc5_,_loc4_.isFeixing,true);
                              if(!param1.hasSameAvatarPart(_loc6_))
                              {
                                 param1.loadAvatarPart(_loc6_);
                              }
                              _loc14_ = false;
                              break;
                           }
                        }
                     }
                     _loc15_++;
                  }
                  if(_loc14_)
                  {
                     if(_loc4_.apd_weapon != null)
                     {
                        _loc16_ = _loc4_.apd_weapon;
                        _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,int(_loc4_.apd_weapon.className.toLowerCase().replace(/^[a-z]+/,"")),_loc5_,_loc4_.isFeixing);
                        if(!param1.hasSameAvatarPart(_loc6_))
                        {
                           param1.loadAvatarPart(_loc6_);
                        }
                     }
                     else
                     {
                        param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
                     }
                  }
               }
               if(_loc4_.isBiWuZhaoQinXiuQiu)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.BIWUZHAOQIN_XIUQIU_ID,_loc5_,_loc4_.isFeixing);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(_loc4_.isRiYueShenJian)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.RIYUESHENJIAN_MOUNT_ID_1,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.RIYUESHENJIAN_MOUNT_ID_0,_loc5_);
                  }
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(_loc4_.isXiaLvTuMo)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.XIALVTUMO_WUQI_MOUNT_ID,_loc5_);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(_loc4_.isFengLei)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.FENGLEI_WUQI_MOUNT_ID,_loc5_);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(_loc4_.isXieLongMoJian)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.XIELONGMOJIAN_WUQI_MOUNT_ID,_loc5_);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(_loc4_.isLiuXingLuo)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.LIUXINGLUO_WUQI_MOUNT_ID,_loc5_);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(_loc4_.isXueWu)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.XUEWU_WUQI_MOUNT_ID,_loc5_);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(_loc4_.isJuLongZhiJi)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JULONGZHIJI_WUQI_MOUNT_ID,_loc5_);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(_loc4_.isSuiHunYinXue)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.SUIHUNYINXUE_WUQI_MOUNT_ID,_loc5_);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(_loc4_.isSuiHunZhiShang)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.SUIHUNZHISHANG_WUQI_MOUNT_ID,_loc5_);
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(_loc4_.isHanGuang)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.HANGUANG_WUQI_MOUNT_ID,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.HANGUANG_WUQI_MOUNT_ID_0,_loc5_);
                  }
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
               else if(_loc4_.isJingLeiQiang > 0)
               {
                  if(_loc4_.isJingLeiQiang == 1)
                  {
                     if(_loc5_ == 1)
                     {
                        _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_1_WUQI_MOUNT_ID,_loc5_,_loc4_.isFeixing,true);
                     }
                     else
                     {
                        _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_1_WUQI_MOUNT_ID_0,_loc5_,_loc4_.isFeixing);
                     }
                  }
                  else if(_loc4_.isJingLeiQiang == 2)
                  {
                     if(_loc5_ == 1)
                     {
                        _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_2_WUQI_MOUNT_ID,_loc5_,_loc4_.isFeixing,true);
                     }
                     else
                     {
                        _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_2_WUQI_MOUNT_ID_0,_loc5_,_loc4_.isFeixing);
                     }
                  }
                  else if(_loc4_.isJingLeiQiang == 3)
                  {
                     if(_loc5_ == 1)
                     {
                        _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_3_WUQI_MOUNT_ID,_loc5_,_loc4_.isFeixing,true);
                     }
                     else
                     {
                        _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_3_WUQI_MOUNT_ID_0,_loc5_,_loc4_.isFeixing);
                     }
                  }
                  else if(_loc4_.isJingLeiQiang == 4)
                  {
                     if(_loc5_ == 1)
                     {
                        _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_4_WUQI_MOUNT_ID,_loc5_,_loc4_.isFeixing,true);
                     }
                     else
                     {
                        _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_4_WUQI_MOUNT_ID_0,_loc5_,_loc4_.isFeixing);
                     }
                  }
                  else if(_loc4_.isJingLeiQiang == 5)
                  {
                     if(_loc5_ == 1)
                     {
                        _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_5_WUQI_MOUNT_ID,_loc5_,_loc4_.isFeixing,true);
                     }
                     else
                     {
                        _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_5_WUQI_MOUNT_ID_0,_loc5_,_loc4_.isFeixing);
                     }
                  }
                  else if(_loc4_.isJingLeiQiang == 6)
                  {
                     if(_loc5_ == 1)
                     {
                        _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_6_WUQI_MOUNT_ID,_loc5_,_loc4_.isFeixing,true);
                     }
                     else
                     {
                        _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_6_WUQI_MOUNT_ID_0,_loc5_,_loc4_.isFeixing);
                     }
                  }
                  else if(_loc4_.isJingLeiQiang == 7)
                  {
                     if(_loc5_ == 1)
                     {
                        _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_7_WUQI_MOUNT_ID,_loc5_,_loc4_.isFeixing,true);
                     }
                     else
                     {
                        _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_7_WUQI_MOUNT_ID_0,_loc5_,_loc4_.isFeixing);
                     }
                  }
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
                  if(!param1.hasSameAvatarPart(_loc6_))
                  {
                     param1.loadAvatarPart(_loc6_);
                  }
               }
            }
            else if(_loc4_.isYouyong)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
            }
            else if(_loc4_.isZhumozhang || _loc4_.isYangguo || _loc4_.isGuoXiang || _loc4_.isLiMoChou || _loc4_.isYinZhiPing || _loc4_.isLinghuchong || _loc4_.isRenyingying || _loc4_.isAZi || _loc4_.isQiaoFeng || _loc4_.isYuebuqun || _loc4_.isRenWoXing || _loc4_.isXuZhu || _loc4_.isDuanYu || _loc4_.isWangYuYan)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
            }
            else if(_loc4_.isShenjiangji || _loc4_.is255 || _loc4_.is256 || _loc4_.is257)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
            }
            else if(_loc4_.isBailongjiang)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
            }
            else if(_loc4_.isTianwang)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
            }
            else if(_loc4_.isYingxiong || _loc4_.isYingxiong1 || _loc4_.isWANSHI)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
            }
            else if(_loc4_.isTianmajian)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
            }
            else if(_loc4_.isXiongjijian)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
            }
            else if(_loc4_.isXuanbingjian)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
            }
            else if(_loc4_.isWuQiHuanZhuang)
            {
               if(param1 == GameInstance.mainChar)
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict_Main[3];
               }
               else
               {
                  _loc8_ = body_AvatarID_by_AvatarType_dict[3];
               }
               if(_loc5_ == 1)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,_loc8_[3],_loc5_);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,_loc8_[5],_loc5_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isDaHuanZhuang || _loc4_.isDaHuanZhuang_WUMA || _loc4_.isDaHuanZhuang_QUANPINGBI)
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
            }
            else if(_loc4_.isShuShanShenQi)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.SHUSHANSHENQI_WUQI_MOUNT_ID_1,_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isNiYan)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.NIYAN_WUQI_MOUNT_ID_1,_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isZiYinDao)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.ZIYINDAO_WUQI_MOUNT_ID,_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isRiYueShenJian)
            {
               if(_loc5_ == 1)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.RIYUESHENJIAN_MOUNT_ID_1,_loc5_);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.RIYUESHENJIAN_MOUNT_ID_0,_loc5_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isXuanYuanShenJian)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.XUANYUANSHENJIAN_WUQI_MOUNT_ID,_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isMoJian)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.MOJIAN_WUQI_MOUNT_ID,_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isMoDao)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.MODAO_WUQI_MOUNT_ID,_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isBaJiaoShan)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.BAJIAOSHAN_WUQI_MOUNT_ID,_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isXiaLvTuMo)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.XIALVTUMO_WUQI_MOUNT_ID,_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isFengLei)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.FENGLEI_WUQI_MOUNT_ID,_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isLiuXingLuo)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.LIUXINGLUO_WUQI_MOUNT_ID,_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isXieLongMoJian)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.XIELONGMOJIAN_WUQI_MOUNT_ID,_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isXueWu)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.XUEWU_WUQI_MOUNT_ID,_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isJuLongZhiJi)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JULONGZHIJI_WUQI_MOUNT_ID,_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isSuiHunYinXue)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.SUIHUNYINXUE_WUQI_MOUNT_ID,_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isSuiHunZhiShang)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.SUIHUNZHISHANG_WUQI_MOUNT_ID,_loc5_);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isHanGuang)
            {
               if(_loc5_ == 1)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.HANGUANG_WUQI_MOUNT_ID,_loc5_);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.HANGUANG_WUQI_MOUNT_ID_0,_loc5_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isCiKe)
            {
               if(_loc5_ == 1)
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.CIKE_WUQI_MOUNT_ID_1,_loc5_);
               }
               else
               {
                  _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.CIKE_WUQI_MOUNT_ID_0,_loc5_);
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isBiWuZhaoQinXiuQiu)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.BIWUZHAOQIN_XIUQIU_ID);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isJingLeiQiang > 0)
            {
               if(_loc4_.isJingLeiQiang == 1)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_1_WUQI_MOUNT_ID,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_1_WUQI_MOUNT_ID_0,_loc5_);
                  }
               }
               else if(_loc4_.isJingLeiQiang == 2)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_2_WUQI_MOUNT_ID,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_2_WUQI_MOUNT_ID_0,_loc5_);
                  }
               }
               else if(_loc4_.isJingLeiQiang == 3)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_3_WUQI_MOUNT_ID,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_3_WUQI_MOUNT_ID_0,_loc5_);
                  }
               }
               else if(_loc4_.isJingLeiQiang == 4)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_4_WUQI_MOUNT_ID,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_4_WUQI_MOUNT_ID_0,_loc5_);
                  }
               }
               else if(_loc4_.isJingLeiQiang == 5)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_5_WUQI_MOUNT_ID,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_5_WUQI_MOUNT_ID_0,_loc5_);
                  }
               }
               else if(_loc4_.isJingLeiQiang == 6)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_6_WUQI_MOUNT_ID,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_6_WUQI_MOUNT_ID_0,_loc5_);
                  }
               }
               else if(_loc4_.isJingLeiQiang == 7)
               {
                  if(_loc5_ == 1)
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_7_WUQI_MOUNT_ID,_loc5_);
                  }
                  else
                  {
                     _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,SpecialGoodsID.JINGLEIQIANG_7_WUQI_MOUNT_ID_0,_loc5_);
                  }
               }
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else
            {
               _loc11_ = _loc4_.useIng_Weapon_id;
               _loc12_ = true;
               if(ReloginManager.isInGongcheng || ReloginManager.isInKuafu || ReloginManager.isInKuafu_To_biWuDaHui > 0 || _loc11_ == 0)
               {
                  _loc12_ = false;
               }
               _loc13_ = new Goods(_loc11_);
               if((Boolean(_loc13_)) && Boolean(_loc13_.res))
               {
                  _loc11_ = _loc13_.res.position;
               }
               else
               {
                  _loc12_ = false;
               }
               _loc14_ = true;
               if(_loc12_)
               {
                  _loc15_ = 0;
                  while(_loc15_ < _loc10_.length)
                  {
                     if(OtherConst.texiaoBoolean == false)
                     {
                        if(_loc10_[_loc15_][1] != null && _loc11_ == _loc10_[_loc15_][2])
                        {
                           _loc6_ = _loc16_ = _loc10_[_loc15_][1];
                           if(!param1.hasSameAvatarPart(_loc6_))
                           {
                              param1.loadAvatarPart(_loc6_);
                           }
                           _loc14_ = false;
                           break;
                        }
                     }
                     _loc15_++;
                  }
                  if(_loc14_)
                  {
                     if(param1.isMainChar())
                     {
                        _loc11_ = _loc4_.useIng_Weapon_id = 0;
                        PipeManager.sendMsg(PipeConstants.SAVE_SHOW_JIAN,{"id":0});
                     }
                     else
                     {
                        _loc11_ = _loc4_.useIng_Weapon_id;
                     }
                     _loc12_ = false;
                  }
               }
               _loc14_ = true;
               if(!_loc12_)
               {
                  _loc15_ = 0;
                  while(_loc15_ < _loc10_.length)
                  {
                     if(OtherConst.texiaoBoolean == false)
                     {
                        if(_loc10_[_loc15_][1] != null)
                        {
                           _loc6_ = _loc16_ = _loc10_[_loc15_][1];
                           if(!param1.hasSameAvatarPart(_loc6_))
                           {
                              param1.loadAvatarPart(_loc6_);
                           }
                           _loc14_ = false;
                           break;
                        }
                     }
                     _loc15_++;
                  }
                  if(_loc14_)
                  {
                     if(_loc4_.apd_mount_weapon != null)
                     {
                        _loc16_ = _loc4_.apd_mount_weapon;
                        _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,int(_loc4_.apd_mount_weapon.className.toLowerCase().replace(/^[a-z]+/,"")),_loc5_,_loc4_.isFeixing);
                        if(!param1.hasSameAvatarPart(_loc6_))
                        {
                           param1.loadAvatarPart(_loc6_);
                        }
                     }
                     else
                     {
                        param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_WEAPON);
                     }
                  }
               }
            }
         }
         if(param2 == null || param2.indexOf(SpeciaAvatarPartID.MOUNT_BOW) != -1)
         {
            if(isShowZhenYingAvatar(_loc4_.zhenYingHuanZhuang))
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isFeixing && !_loc4_.isCiKe && !_loc4_.isZhumozhang && !_loc4_.isBailongjiang && !_loc4_.isDaHuanZhuang_QUANPINGBI)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BOW,AvatarManager.getChiBangAvatarIdByType(_loc4_.isFeixing_huanzhuang_Id,_loc5_),_loc5_,_loc4_.isFeixing);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isYouyong)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isCiKe)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isShenjiangji || _loc4_.is255 || _loc4_.is256 || _loc4_.is257)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isBailongjiang)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isTianwang)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isYingxiong || _loc4_.isYingxiong1 || _loc4_.isWANSHI)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isTianmajian)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isXiongjijian)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isXuanbingjian)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isZhumozhang)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isYangguo || _loc4_.isGuoXiang || _loc4_.isLiMoChou || _loc4_.isYinZhiPing || _loc4_.isLinghuchong || _loc4_.isRenWoXing || _loc4_.isRenyingying || _loc4_.isAZi || _loc4_.isQiaoFeng || _loc4_.isYuebuqun || _loc4_.isXuZhu || _loc4_.isDuanYu || _loc4_.isWangYuYan)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isXiaolongnv)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isHuanYingXiaDao)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isZhenggu)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isHuXiaoShanLin || _loc4_.isQiLinAvatar || _loc4_.isDagoubang || _loc4_.isLingHu || _loc4_.isLvHaMa || _loc4_.isFanTongXianJue || _loc4_.isJiGuanGuai || _loc4_.isBuSiJinShen || _loc4_.isMeiRenJi || _loc4_.isMingJieZhanShen || _loc4_.isZhaoYun || _loc4_.isZhaoYun_Jin || _loc4_.isShanZei || _loc4_.isQiuQianCHi || _loc4_.isYanMoNuPu || _loc4_.isXiangYangDaJiang || _loc4_.isLuoHan || _loc4_.isJiGong || _loc4_.isJianTiFengYin || _loc4_.isHuGuoShenJiang || _loc4_.isJinJiaZhanChe || _loc4_.isYinYangDaoRen || _loc4_.isJiaLouLuo || _loc4_.isShiHua || _loc4_.isBaoMeiRen || _loc4_.isYingXiongShouWei || _loc4_.isZhaoMin || _loc4_.isTianZhao || _loc4_.isKunShou || _loc4_.isChiYou || _loc4_.isHongLianXianZi || _loc4_.isShaMoFeiYing || _loc4_.isMoLingZhiYuan || _loc4_.isHeiAnMoJun || _loc4_.isTieShanGongZhu || _loc4_.isBaiMianShuSheng || _loc4_.isYuFeng || _loc4_.isBingJingHu || _loc4_.isXiongBa || _loc4_.isSanShengMu || _loc4_.isChangE || _loc4_.isDiLu || _loc4_.isLangRen > 0)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isZunrongWanbaoge)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isZijinHuanzhuang)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.isWanZhongZhuMu)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.usingFashion == 2 && !_loc4_.isRongYuHuanZhong)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BOW,AvatarManager.getChiBangAvatarIdByType(_loc4_.isFeixing_huanzhuang_Id,_loc5_),_loc5_,_loc4_.isFeixing);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isDaHuanZhuang || _loc4_.isDaHuanZhuang_WUMA || _loc4_.isDaHuanZhuang_QUANPINGBI)
            {
               if(_loc4_.apd_bow != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
               }
            }
            else if(_loc4_.apd_mount_bow != null)
            {
               if(!param1.hasSameAvatarPart(_loc4_.apd_mount_bow))
               {
                  param1.loadAvatarPart(_loc4_.apd_mount_bow);
               }
            }
            else
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.MOUNT_BOW);
            }
         }
         if(param2 == null || param2.indexOf(SpeciaAvatarPartID.ZHENHUN) != -1)
         {
            if(isShowZhenYingAvatar(_loc4_.zhenYingHuanZhuang))
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isFeixing && !_loc4_.isCiKe && !_loc4_.isZhumozhang && !_loc4_.isBailongjiang && !_loc4_.isDaHuanZhuang_QUANPINGBI)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.ZHENHUN,_loc4_.isFeixing_wuhun_Id,_loc5_,_loc4_.isFeixing);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isYouyong)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isCiKe)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isShenjiangji || _loc4_.is255 || _loc4_.is256 || _loc4_.is257)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isBailongjiang)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isTianwang)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isYingxiong || _loc4_.isYingxiong1 || _loc4_.isWANSHI)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isTianmajian)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isXiongjijian)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isXuanbingjian)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isZhumozhang)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isYangguo || _loc4_.isGuoXiang || _loc4_.isLiMoChou || _loc4_.isYinZhiPing || _loc4_.isLinghuchong || _loc4_.isRenWoXing || _loc4_.isRenyingying || _loc4_.isAZi || _loc4_.isQiaoFeng || _loc4_.isYuebuqun || _loc4_.isXuZhu || _loc4_.isDuanYu || _loc4_.isWangYuYan)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isXiaolongnv)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isHuanYingXiaDao)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isZhenggu)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isHuXiaoShanLin || _loc4_.isQiLinAvatar || _loc4_.isDagoubang || _loc4_.isLingHu || _loc4_.isLvHaMa || _loc4_.isFanTongXianJue || _loc4_.isJiGuanGuai || _loc4_.isBuSiJinShen || _loc4_.isMeiRenJi || _loc4_.isMingJieZhanShen || _loc4_.isZhaoYun || _loc4_.isZhaoYun_Jin || _loc4_.isShanZei || _loc4_.isQiuQianCHi || _loc4_.isYanMoNuPu || _loc4_.isXiangYangDaJiang || _loc4_.isLuoHan || _loc4_.isJiGong || _loc4_.isJianTiFengYin || _loc4_.isHuGuoShenJiang || _loc4_.isJinJiaZhanChe || _loc4_.isYinYangDaoRen || _loc4_.isJiaLouLuo || _loc4_.isShiHua || _loc4_.isBaoMeiRen || _loc4_.isYingXiongShouWei || _loc4_.isZhaoMin || _loc4_.isTianZhao || _loc4_.isKunShou || _loc4_.isChiYou || _loc4_.isHongLianXianZi || _loc4_.isShaMoFeiYing || _loc4_.isMoLingZhiYuan || _loc4_.isHeiAnMoJun || _loc4_.isTieShanGongZhu || _loc4_.isBaiMianShuSheng || _loc4_.isYuFeng || _loc4_.isBingJingHu || _loc4_.isXiongBa || _loc4_.isSanShengMu || _loc4_.isChangE || _loc4_.isDiLu || _loc4_.isLangRen > 0)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isZunrongWanbaoge)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isZijinHuanzhuang)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.isWanZhongZhuMu)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.usingFashion == 2 && !_loc4_.isRongYuHuanZhong)
            {
               _loc6_ = getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.ZHENHUN,_loc4_.isFeixing_wuhun_Id,_loc5_,_loc4_.isFeixing);
               param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               if(!param1.hasSameAvatarPart(_loc6_))
               {
                  param1.loadAvatarPart(_loc6_);
               }
            }
            else if(_loc4_.isDaHuanZhuang || _loc4_.isDaHuanZhuang_WUMA || _loc4_.isDaHuanZhuang_QUANPINGBI)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
               }
            }
            else if(_loc4_.apd_mount_bow != null)
            {
               if(_loc4_.apd_mount_zhenhun != null)
               {
                  if(!param1.hasSameAvatarPart(_loc4_.apd_mount_zhenhun))
                  {
                     param1.loadAvatarPart(_loc4_.apd_mount_zhenhun);
                  }
               }
            }
            else
            {
               param1.removeAvatarPartByID(SpeciaAvatarPartID.ZHENHUN);
            }
         }
      }
      
      public static function getAvatarParamDataByTypeAndId(param1:String, param2:int, param3:int = 1, param4:Boolean = false, param5:Boolean = false) : AvatarParamData
      {
         var _loc6_:AvatarParamData = null;
         switch(param1)
         {
            case SpeciaAvatarPartID.MOUNT:
               _loc6_ = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param2),AvatarPartType.MOUNT);
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT;
                  _loc6_.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.MOUNT);
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
                  _loc6_.useSpecilizeXY = false;
               }
               break;
            case SpeciaAvatarPartID.MOUNT_BODY:
               if(param4)
               {
                  _loc6_ = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_feixing(ResPathManager.AVATAR_CLOTHES,param2));
               }
               else
               {
                  _loc6_ = new AvatarParamData(ResPathManager.getAvatarPath_ClothesOnMount(ResPathManager.AVATAR_CLOTHES,param2));
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_BODY;
                  _loc6_.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.BODY);
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               break;
            case SpeciaAvatarPartID.BODY:
               if(param4)
               {
                  _loc6_ = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_feixing(ResPathManager.AVATAR_CLOTHES,param2));
               }
               else
               {
                  _loc6_ = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param2));
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.BODY;
                  _loc6_.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.BODY);
                  _loc6_.useType = 1;
                  _loc6_.clearSameType = true;
               }
               break;
            case SpeciaAvatarPartID.MOUNT_WEAPON:
               if(param4)
               {
                  if(param5)
                  {
                     _loc6_ = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndFeixing(param3,ResPathManager.AVATAR_CLOTHES,param2),AvatarPartType.WEAPON);
                  }
                  else
                  {
                     _loc6_ = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_feixing(ResPathManager.AVATAR_CLOTHES,param2),AvatarPartType.WEAPON);
                  }
               }
               else
               {
                  _loc6_ = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param2),AvatarPartType.WEAPON);
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_WEAPON;
                  _loc6_.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               break;
            case SpeciaAvatarPartID.WEAPON:
               if(param4)
               {
                  if(param5)
                  {
                     _loc6_ = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_by_sexAndFeixing(param3,ResPathManager.AVATAR_CLOTHES,param2),AvatarPartType.WEAPON);
                  }
                  else
                  {
                     _loc6_ = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_feixing(ResPathManager.AVATAR_CLOTHES,param2),AvatarPartType.WEAPON);
                  }
               }
               else
               {
                  _loc6_ = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param2),AvatarPartType.WEAPON);
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.WEAPON;
                  _loc6_.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
                  _loc6_.useType = 1;
                  _loc6_.clearSameType = true;
               }
               break;
            case SpeciaAvatarPartID.MOUNT_BOW:
               if(param4)
               {
                  _loc6_ = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_feixing(ResPathManager.AVATAR_CLOTHES,param2),AvatarPartType.BOW);
               }
               else
               {
                  _loc6_ = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param2),AvatarPartType.BOW);
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.MOUNT_BOW;
                  _loc6_.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.BOW);
                  _loc6_.useType = 2;
                  _loc6_.clearSameType = true;
               }
               break;
            case SpeciaAvatarPartID.BOW:
               if(param4)
               {
                  _loc6_ = new AvatarParamData(ResPathManager.getAvatarPath_Clothes_feixing(ResPathManager.AVATAR_CLOTHES,param2),AvatarPartType.BOW);
               }
               else
               {
                  _loc6_ = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,param2),AvatarPartType.BOW);
               }
               if(_loc6_ != null)
               {
                  _loc6_.id = SpeciaAvatarPartID.BOW;
                  _loc6_.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.BOW);
                  _loc6_.useType = 1;
                  _loc6_.clearSameType = true;
               }
         }
         return _loc6_;
      }
      
      public static function setHuangzhuangZhuangtai(param1:SceneCharacter, param2:Boolean = true) : void
      {
         var _loc3_:MapTile = null;
         var _loc4_:Boolean = false;
         _loc3_ = SceneCache.mapTiles[param1.tile_x + "_" + param1.tile_y];
         _loc4_ = false;
         if(_loc3_)
         {
            if((param1.data as BaseCharacter).avatarInfo.isYouyong != _loc3_.isYouyong)
            {
               _loc4_ = true;
            }
            else
            {
               _loc4_ = false;
            }
            if(param1.type == SceneCharacterType.PLAYER)
            {
               (param1.data as BaseCharacter).avatarInfo.isYouyong = _loc3_.isYouyong;
            }
            if(_loc4_)
            {
               if(param1.type == SceneCharacterType.PLAYER)
               {
                  if(param2)
                  {
                     AvatarManager.updateMainAvatar(param1);
                  }
                  if((param1.data as BaseCharacter).avatarInfo.isYouyong)
                  {
                     param1.hideAvatarPartByID(AvatarPartID.SHADOW);
                     param1.setSpeed(OtherConst.YOUYONG_SUDU);
                     if((param1.data as BaseCharacter).buffInfo.lianzhaoBuffName != "")
                     {
                        param1.hideAvatarPartByID((param1.data as BaseCharacter).buffInfo.lianzhaoBuffName);
                     }
                     if((param1.data as BaseCharacter).buffInfo.jingangFumojueBuffName != "")
                     {
                        param1.hideAvatarPartByID((param1.data as BaseCharacter).buffInfo.jingangFumojueBuffName);
                     }
                  }
                  else
                  {
                     param1.showAvatarPartByID(AvatarPartID.SHADOW);
                     param1.setSpeed((param1.data as Player).attributeInfo.mdx);
                     if((param1.data as BaseCharacter).buffInfo.lianzhaoBuffName != "")
                     {
                        param1.showAvatarPartByID((param1.data as BaseCharacter).buffInfo.lianzhaoBuffName);
                     }
                     if((param1.data as BaseCharacter).buffInfo.jingangFumojueBuffName != "")
                     {
                        param1.showAvatarPartByID((param1.data as BaseCharacter).buffInfo.jingangFumojueBuffName);
                     }
                  }
               }
               if(param1.type == SceneCharacterType.MONSTER)
               {
                  if((param1.data as Monster).res != null)
                  {
                     if((param1.data as Monster).res.type == MonsterType.BIAOCHE)
                     {
                        (param1.data as BaseCharacter).avatarInfo.isYouyong = _loc3_.isYouyong;
                        if((param1.data as BaseCharacter).avatarInfo.isYouyong)
                        {
                           param1.hideAvatarPartByID(AvatarPartID.SHADOW);
                           param1.visible = false;
                        }
                        else
                        {
                           param1.showAvatarPartByID(AvatarPartID.SHADOW);
                           param1.visible = true;
                           if(param2)
                           {
                              AvatarManager.updateMainAvatar(param1);
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      public static function getChiBangAvatarIdByType(param1:int, param2:int = -1) : int
      {
         switch(param1)
         {
            case 1:
               return SpeciaAvatarPartID.AVATAR_ID_TIANSHIZHIYI;
            case 2:
               return SpeciaAvatarPartID.AVATAR_ID_EMOZHIYI;
            case 3:
               return SpeciaAvatarPartID.AVATAR_ID_HUANGZHEZHIYI_CHIBANG;
            case 4:
               return SpeciaAvatarPartID.AVATAR_ID_MOLINGZHIYI;
            case 5:
               return SpeciaAvatarPartID.AVATAR_ID_HUADIEZHIYI;
            case 6:
               return SpeciaAvatarPartID.AVATAR_ID_RIJINLUN;
            case 7:
               return SpeciaAvatarPartID.AVATAR_ID_YUEJINLUN;
            case 8:
               return SpeciaAvatarPartID.AVATAR_ID_XUESEYUYI;
            case 9:
               return SpeciaAvatarPartID.AVATAR_ID_TIANSHENZHIYI;
            case 10:
               return SpeciaAvatarPartID.AVATAR_ID_XUESELUNHUI;
            case 11:
               return 777838151;
            case 12:
               return 777838132;
            case 13:
               return 777838093;
            case 14:
               return 777838091;
            case 15:
               return 777841938;
            case 16:
               return 777841882;
            case 17:
               return 777841790;
            case 18:
               return 777841644;
            case 19:
               return 777841515;
            case 20:
               return 777841444;
            case 21:
               return 777841240;
            case 22:
               return 777841081;
            case 23:
               return 777840908;
            case 24:
               return 777840548;
            case 101:
               if(param2 == 1)
               {
                  param2 = 777840529;
               }
               else
               {
                  param2 = 777837032;
               }
               return param2;
            case 102:
               if(param2 == 1)
               {
                  param2 = 777840531;
               }
               else
               {
                  param2 = 777837111;
               }
               return param2;
            case 103:
               if(param2 == 1)
               {
                  param2 = 777840535;
               }
               else
               {
                  param2 = 777837447;
               }
               return param2;
            case 104:
               if(param2 == 1)
               {
                  param2 = 777840533;
               }
               else
               {
                  param2 = 777836984;
               }
               return param2;
            case 105:
               return 777843587;
            case 777843965:
               return 777843965;
            case 106:
               return 777843965;
            case 107:
               return 777843967;
            case 108:
               return 777840548;
            case 109:
               return 777841644;
            case 110:
               return 777843761;
            case 111:
               return 777845614;
            case 112:
               return 777846265;
            case 113:
               return 777846054;
            case 114:
               return 777846403;
            case 115:
               return 777845838;
            case 116:
               return 777844454;
            case 117:
               return 777843969;
            case 118:
               return 777847355;
            case 119:
               return 777846677;
            case 120:
               return 777847499;
            default:
               return 0;
         }
      }
      
      public static function updateQixuanNum(param1:SceneCharacter, param2:int, param3:ByteArray) : void
      {
         var _loc4_:int = 0;
         (param1.data as Player).attributeInfo.qixuan1ID = 0;
         (param1.data as Player).attributeInfo.qixuan2ID = 0;
         (param1.data as Player).attributeInfo.qixuan3ID = 0;
         (param1.data as Player).attributeInfo.qixuan4ID = 0;
         (param1.data as Player).attributeInfo.qixuan5ID = 0;
         _loc4_ = 1;
         while(_loc4_ <= param2)
         {
            switch(_loc4_)
            {
               case 1:
                  (param1.data as Player).attributeInfo.qixuan1ID = param3.readInt();
                  break;
               case 2:
                  (param1.data as Player).attributeInfo.qixuan2ID = param3.readInt();
                  break;
               case 3:
                  (param1.data as Player).attributeInfo.qixuan3ID = param3.readInt();
                  break;
               case 4:
                  (param1.data as Player).attributeInfo.qixuan4ID = param3.readInt();
                  break;
               case 5:
                  (param1.data as Player).attributeInfo.qixuan5ID = param3.readInt();
            }
            _loc4_++;
         }
      }
      
      public static function getLangRenHuanZhuangId(param1:int) : int
      {
         switch(param1)
         {
            case 1:
               return 777834628;
            case 2:
               return 777834627;
            case 3:
               return 777834635;
            case 4:
               return 777834634;
            default:
               return 0;
         }
      }
      
      public static function getWanShiZhuMuAvatarId(param1:String, param2:int) : int
      {
         switch(param1)
         {
            case SpeciaAvatarPartID.MOUNT:
               if(param2 == 1)
               {
                  return SpeciaAvatarPartID.WANSHIZHUMU_MOUNT_ID_1;
               }
               return SpeciaAvatarPartID.WANSHIZHUMU_MOUNT_ID_0;
               break;
            case SpeciaAvatarPartID.MOUNT_BODY:
            case SpeciaAvatarPartID.BODY:
               if(param2 == 1)
               {
                  return SpeciaAvatarPartID.WANSHIZHUMU_BODY_AVATAR_ID_1;
               }
               return SpeciaAvatarPartID.WANSHIZHUMU_BODY_AVATAR_ID_0;
               break;
            case SpeciaAvatarPartID.MOUNT_WEAPON:
               if(param2 == 1)
               {
                  return SpeciaAvatarPartID.WANSHIZHUMU_WUQI_MOUNT_ID_1;
               }
               return SpeciaAvatarPartID.WANSHIZHUMU_WUQI_MOUNT_ID_0;
               break;
            case SpeciaAvatarPartID.WEAPON:
               if(param2 == 1)
               {
                  return SpeciaAvatarPartID.WANSHIZHUMU_WUQI_ID_1;
               }
               return SpeciaAvatarPartID.WANSHIZHUMU_WUQI_ID_0;
               break;
            default:
               return 0;
         }
      }
      
      public static function getAvatarIdByType(param1:int) : int
      {
         switch(param1)
         {
            case 132:
               return SpecialGoodsID.SHENGDAN_LU_MOUNT_ID;
            case 134:
               return SpecialGoodsID.SHENGDANJIE_SHENGDANXIONG;
            case 185:
               return SpecialGoodsID.RUISHOU_MOUNT_ID;
            case 214:
               return SpecialGoodsID.ZIJINXIANLU_MOUNT_ID;
            case 184:
               return SpecialGoodsID.ANHEIMOLONG_ID;
            case 186:
               return SpecialGoodsID.XIANGRUIZISHOU_ID;
            case 202:
               return SpecialGoodsID.CANGQIONGSHENDIAO_ID;
            case 205:
               return SpecialGoodsID.JIUTIANBAIDIAO_ID;
            case 210:
               return SpecialGoodsID.ZITIANDIAO_ID;
            case 216:
               return SpecialGoodsID.WANLINGSHENGLU_ID;
            case 217:
               return SpecialGoodsID.XINCHUNNIANSHOU_ID;
            case 218:
               return SpecialGoodsID.HESUIMOWANG_ID;
            case 223:
               return SpecialGoodsID.QICAIMUMA_ID;
            case 224:
               return SpecialGoodsID.CANGQIONGSHENYING_ID;
            case 235:
               return SpecialGoodsID.MOHUANXIYI_ID;
            case 236:
               return SpecialGoodsID.FEILONG_ID;
            case 237:
               return SpecialGoodsID.JINGUANGBAO_ID;
            case 239:
               return SpecialGoodsID.HUOFENGHUANG_ID;
            case 241:
               return SpecialGoodsID.LEITINGZHANJIANG_ID;
            case 247:
               return SpecialGoodsID.XUESEJINLONG_ID;
            case 256:
               return SpecialGoodsID.FENSEXIAOKEAI_ID;
            case 258:
               return SpecialGoodsID.TIANLONG_ID;
            case 260:
               return SpecialGoodsID.JINLONG_ID;
            case 261:
               return SpecialGoodsID.TIANMA_ID;
            case 262:
               return SpecialGoodsID.SHENMINGSHOU_ID;
            case 263:
               return SpecialGoodsID.MOYOUSHOU_ID;
            case 265:
               return SpecialGoodsID.LIWEN_ID;
            case 272:
               return SpecialGoodsID.CHIXUEMOLONG_ID;
            case 275:
               return SpecialGoodsID.JIN_XIYI_ID;
            case 277:
               return SpecialGoodsID.JIN_XINIU_ID;
            case 279:
               return SpecialGoodsID.RONGYANRUISHOU_ID;
            case 283:
               return SpecialGoodsID.QINGLUAN_ID;
            case 300:
               return SpecialGoodsID.YANMO_ID;
            case 305:
               return SpecialGoodsID.TUNTIANQUE_ID;
            case 309:
               return SpecialGoodsID.HUANLONG_ID;
            case 311:
               return SpecialGoodsID.LILONG_ID;
            case 313:
               return SpecialGoodsID.QIONGQI_ID;
            case 318:
               return SpecialGoodsID.LIEYANXUANMING_ID;
            case 324:
               return SpecialGoodsID.JIUTIANKUNPENG_ID;
            case 330:
               return SpecialGoodsID.YAZI_ID;
            case 331:
               return SpecialGoodsID.LONGZHIZI_ID;
            case 337:
               return SpecialGoodsID.XUANBINGCANGQIONG_ID;
            case 340:
               return SpecialGoodsID.XIEZHI_ID;
            case 347:
               return SpecialGoodsID.QIUNIU_ID;
            case 354:
               return SpecialGoodsID.TAOWU_ID;
            case 360:
               return SpecialGoodsID.HOU_ID;
            case 363:
               return SpecialGoodsID.GUICHE_ID;
            case 368:
               return SpecialGoodsID.DITING_ID;
            case 373:
               return SpecialGoodsID.LANSE_ID;
            case 7000:
               return SpecialGoodsID.SHENGDANLU_RED;
            case 7001:
               return SpecialGoodsID.SHENGDANLU_YELLOW;
            case 7002:
               return SpecialGoodsID.SHENGDANLU_BLUE;
            case 7003:
               return SpecialGoodsID.SHENGDANLU_GREEN;
            case 7004:
               return SpecialGoodsID.SHENGDANLU_WHITE;
            case 7005:
               return SpecialGoodsID.FANFANG_BLACK_nan;
            case 7006:
               return SpecialGoodsID.FANFANG_BLACK_nv;
            case 7007:
               return SpecialGoodsID.YN_JINLI;
            case 7008:
               return SpecialGoodsID.YN_JINLI;
            case 7009:
               return SpecialGoodsID.YN_BAILONGSHOU;
            case 7010:
               return SpecialGoodsID.YN_MUMA;
            case 7011:
               return SpecialGoodsID.YN_SHENDIAO;
            case 7012:
               return SpecialGoodsID.YN_HEIDIAO;
            case 7013:
               return SpecialGoodsID.YN_BAIDIAO;
            case 7014:
               return SpecialGoodsID.YN_ZIDIAO;
            case 7015:
               return SpecialGoodsID.YN_TIANQICANGLONG;
            case 7016:
               return SpecialGoodsID.YN_HUANGLONGHUANHUA;
            case 7017:
               return SpecialGoodsID.YN_HUANGHUHUANHUA;
            case 7018:
               return SpecialGoodsID.YN_HUANGFENGHUANHUA;
            case 7019:
               return SpecialGoodsID.YN_HUANGGUIHUANHUA;
            case 7020:
               return SpecialGoodsID.YN_DIANFENGSHOU_YAOLI;
            case 7021:
               return SpecialGoodsID.YN_DIANFENGSHOU_HUNDUN;
            case 7022:
               return SpecialGoodsID.YN_DIANFENGSHOU_BAIZE;
            case 7023:
               return SpecialGoodsID.YN_DIANFENGSHOU_BIFANG;
            case 7024:
               return SpecialGoodsID.YN_DIANFENGSHOU_HOU;
            case 7025:
               return SpecialGoodsID.YN_TAOTIE_HOU;
            case 7026:
               return SpecialGoodsID.YN_XUERENZUOQI;
            case 7027:
               return SpecialGoodsID.XIEZHI_ID;
            case 7028:
               return SpecialGoodsID.SHIZIZUOZUOQI_ID;
            case 7029:
               return 777835148;
            case 7030:
               return 777842820;
            case 7031:
               return 77783332;
            case 7032:
               return 777835314;
            case 7033:
               return 777843637;
            case 7034:
               return 777843647;
            case 7035:
               return 777836568;
            case 7036:
               return 777843002;
            case 7037:
               return 777843713;
            case 7038:
               return 777844267;
            case 7039:
               return 777843992;
            case 7040:
               return 777841322;
            case 7041:
               return 777844974;
            case 7042:
               return 777844884;
            case 7043:
               return 777843713;
            case 7044:
               return 777845047;
            case 7045:
               return 777835779;
            case 7046:
               return 777836308;
            case 7047:
               return 777845648;
            case 7048:
               return 777845225;
            case 7049:
               return 777845836;
            case 7050:
               return 777845933;
            case 7051:
               return 777842567;
            case 7052:
               return 777845376;
            case 7053:
               return 777844710;
            case 7054:
               return 777845204;
            case 7055:
               return 777847349;
            case 7056:
               return 777845209;
            case 7057:
               return 777840306;
            case 7058:
               return 777841880;
            case 7059:
               return 777846163;
            case 7060:
               return 777843127;
            case 7061:
               return 777847493;
            default:
               return 0;
         }
      }
      
      public static function isShowZhenYingAvatar(param1:int) : Boolean
      {
         switch(param1)
         {
            case 5:
            case 6:
               return true;
            default:
               return false;
         }
      }
      
      public static function getHuangZhuAvatarId(param1:String, param2:int) : int
      {
         return 0;
      }
      
      public static function getZhenYingAvatarId(param1:int, param2:String, param3:int) : int
      {
         if(param1 == 6)
         {
            switch(param2)
            {
               case SpeciaAvatarPartID.MOUNT:
                  if(param3 == 1)
                  {
                     return SpeciaAvatarPartID.AVATAR_ID_ZHENYIN_GONG_MOUNT_NAN;
                  }
                  return SpeciaAvatarPartID.AVATAR_ID_ZHENYIN_GONG_MOUNT_NV;
                  break;
               case SpeciaAvatarPartID.MOUNT_BODY:
               case SpeciaAvatarPartID.BODY:
                  if(param3 == 1)
                  {
                     return SpeciaAvatarPartID.AVATAR_ID_ZHENYIN_GONG_BODY_NAN;
                  }
                  return SpeciaAvatarPartID.AVATAR_ID_ZHENYIN_GONG_BODY_NV;
                  break;
               case SpeciaAvatarPartID.MOUNT_WEAPON:
                  if(param3 == 1)
                  {
                     return SpeciaAvatarPartID.AVATAR_ID_ZHENYIN_GONG_MOUNT_WEAPON_NAN;
                  }
                  return SpeciaAvatarPartID.AVATAR_ID_ZHENYIN_GONG_MOUNT_WEAPON_NV;
                  break;
               case SpeciaAvatarPartID.WEAPON:
                  if(param3 == 1)
                  {
                     return SpeciaAvatarPartID.AVATAR_ID_ZHENYIN_GONG_WEAPON_NAN;
                  }
                  return SpeciaAvatarPartID.AVATAR_ID_ZHENYIN_GONG_WEAPON_NV;
            }
         }
         else
         {
            param1 == 5;
         }
         switch(param2)
         {
            case SpeciaAvatarPartID.MOUNT:
               if(param3 == 1)
               {
                  return SpeciaAvatarPartID.AVATAR_ID_ZHENYIN_SOU_MOUNT_NAN;
               }
               return SpeciaAvatarPartID.AVATAR_ID_ZHENYIN_SOU_MOUNT_NV;
               break;
            case SpeciaAvatarPartID.MOUNT_BODY:
            case SpeciaAvatarPartID.BODY:
               if(param3 == 1)
               {
                  return SpeciaAvatarPartID.AVATAR_ID_ZHENYIN_SOU_BODY_NAN;
               }
               return SpeciaAvatarPartID.AVATAR_ID_ZHENYIN_SOU_BODY_NV;
               break;
            case SpeciaAvatarPartID.MOUNT_WEAPON:
               if(param3 == 1)
               {
                  return SpeciaAvatarPartID.AVATAR_ID_ZHENYIN_SOU_MOUNT_WEAPON_NAN;
               }
               return SpeciaAvatarPartID.AVATAR_ID_ZHENYIN_SOU_MOUNT_WEAPON_NV;
               break;
            case SpeciaAvatarPartID.WEAPON:
               if(param3 == 1)
               {
                  return SpeciaAvatarPartID.AVATAR_ID_ZHENYIN_SOU_WEAPON_NAN;
               }
               return SpeciaAvatarPartID.AVATAR_ID_ZHENYIN_SOU_WEAPON_NV;
               break;
            default:
               return 0;
         }
      }
      
      public static function isShowWangzhezhibangAvatar(param1:int) : Boolean
      {
         switch(param1)
         {
            case 1:
            case 2:
            case 3:
            case 4:
               return true;
            default:
               return false;
         }
      }
      
      public static function getWangzhezhibangAvatarId(param1:int, param2:String, param3:int) : int
      {
         if(param1 == 1)
         {
            switch(param2)
            {
               case SpeciaAvatarPartID.MOUNT_BODY:
               case SpeciaAvatarPartID.BODY:
                  if(param3 == 1)
                  {
                     return SpeciaAvatarPartID.AVATAR_ID_WANGZHEZHIBANG1_BODY_NAN;
                  }
                  return SpeciaAvatarPartID.AVATAR_ID_WANGZHEZHIBANG1_BODY_NV;
            }
         }
         else if(param1 == 2)
         {
            switch(param2)
            {
               case SpeciaAvatarPartID.MOUNT_BODY:
               case SpeciaAvatarPartID.BODY:
                  if(param3 == 1)
                  {
                     return SpeciaAvatarPartID.AVATAR_ID_WANGZHEZHIBANG2_BODY_NAN;
                  }
                  return SpeciaAvatarPartID.AVATAR_ID_WANGZHEZHIBANG2_BODY_NV;
            }
         }
         else if(param1 == 3)
         {
            switch(param2)
            {
               case SpeciaAvatarPartID.MOUNT_BODY:
               case SpeciaAvatarPartID.BODY:
                  if(param3 == 1)
                  {
                     return SpeciaAvatarPartID.AVATAR_ID_WANGZHEZHIBANG3_BODY_NAN;
                  }
                  return SpeciaAvatarPartID.AVATAR_ID_WANGZHEZHIBANG3_BODY_NV;
            }
         }
         else
         {
            param1 == 4;
         }
         switch(param2)
         {
            case SpeciaAvatarPartID.MOUNT_BODY:
            case SpeciaAvatarPartID.BODY:
               if(param3 == 1)
               {
                  return SpeciaAvatarPartID.AVATAR_ID_WANGZHEZHIBANG4_BODY_NAN;
               }
               return SpeciaAvatarPartID.AVATAR_ID_WANGZHEZHIBANG4_BODY_NV;
               break;
            default:
               switch(param2)
               {
                  case SpeciaAvatarPartID.MOUNT:
                     return SpeciaAvatarPartID.AVATAR_ID_WANGZHEZHIBANG_MOUNT;
                  case SpeciaAvatarPartID.MOUNT_WEAPON:
                     return SpeciaAvatarPartID.AVATAR_ID_WANGZHEZHIBANG_MOUNT_WEAPON;
                  case SpeciaAvatarPartID.WEAPON:
                     return SpeciaAvatarPartID.AVATAR_ID_WANGZHEZHIBANG_WEAPON;
                  default:
                     return 0;
               }
         }
      }
      
      public static function AddEar_By_200Zhuangbei(param1:SceneCharacter, param2:int, param3:int) : void
      {
         var _loc4_:String = null;
         var _loc5_:AvatarParamData = null;
         _loc4_ = param2 + "";
         if(param3 == 1)
         {
            _loc5_ = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,param2),AvatarPartType.MAGIC);
            _loc5_.id = _loc4_;
            _loc5_.repeat = 0;
            param1.loadAvatarPart(_loc5_);
         }
         else
         {
            param1.removeAvatarPartByID(_loc4_,false);
         }
      }
   }
}

