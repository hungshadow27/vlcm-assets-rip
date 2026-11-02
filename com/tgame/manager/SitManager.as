package com.tgame.manager
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpeciaAvatarPartID;
   import com.tgame.common.vo.character.BaseCharacter;
   import com.tgame.common.vo.character.Player;
   import com.zcp.common.utils.Fun;
   import com.zcp.common.utils.ZMath;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.SceneRender;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.staticdata.RestType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.utils.Transformer;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class SitManager
   {
      
      private static var _charDict:Dictionary = new Dictionary();
      
      private static var _charShuangxiuDict:Dictionary = new Dictionary();
      
      private static const A:Number = 8;
      
      private static const W:Number = 0.003;
      
      private static const Q:Number = 0;
      
      private static const K:Number = -A / 2 - 5;
      
      private var isGirl:Boolean;
      
      public function SitManager()
      {
         super();
      }
      
      private static function addToSinShuangxiu(param1:int, param2:SceneCharacter, param3:SceneCharacter = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         removeFromSinShuangxiu(param2);
         if(param3 != null)
         {
            removeFromSinShuangxiu(param3);
         }
         _charDict[param2] = 1;
         if(param3 != null)
         {
            _charDict[param3] = 1;
         }
         var _loc4_:Array = _charShuangxiuDict[param1];
         if(_loc4_ == null)
         {
            _loc4_ = [param2];
            if(param3 != null)
            {
               _loc4_.push(param3);
            }
            _charShuangxiuDict[param1] = _loc4_;
         }
         else
         {
            _loc4_.push(param2);
            if(param3 != null)
            {
               _loc4_.push(param3);
            }
         }
         param2.specilize_x = param2.piexl_x;
         param2.specilize_y = param2.piexl_y;
         if(param3 != null)
         {
            param3.specilize_x = param3.piexl_x;
            param3.specilize_y = param3.piexl_y;
         }
         (param2.data as BaseCharacter).shuangxiu_oldX = param2.piexl_x;
         (param2.data as BaseCharacter).shuangxiu_oldY = param2.piexl_y;
         if(param3 != null)
         {
            (param3.data as BaseCharacter).shuangxiu_oldX = param3.piexl_x;
            (param3.data as BaseCharacter).shuangxiu_oldY = param3.piexl_y;
         }
      }
      
      public static function removeFromSinShuangxiu(param1:SceneCharacter) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return;
         }
         if(_charDict[param1] != 1)
         {
            return;
         }
         delete _charDict[param1];
         for(_loc2_ in _charShuangxiuDict)
         {
            _loc3_ = _charShuangxiuDict[_loc2_];
            _loc4_ = _loc3_.indexOf(param1);
            if(_loc4_ != -1)
            {
               _loc3_.splice(_loc4_,1);
               if(_loc3_.length == 0)
               {
                  delete _charShuangxiuDict[_loc2_];
               }
               break;
            }
         }
      }
      
      public static function removeAllFromSinShuangxiu() : void
      {
         _charDict = new Dictionary();
         _charShuangxiuDict = new Dictionary();
      }
      
      private static function getDisY(param1:Number) : Number
      {
         return A * Math.sin(W * param1 + Q) + K;
      }
      
      public static function init() : void
      {
         GameInstance.stage.addEventListener(Event.ENTER_FRAME,updateSinShuangxiu);
      }
      
      private static function updateSinShuangxiu(param1:Event) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:SceneCharacter = null;
         var _loc8_:BaseCharacter = null;
         var _loc2_:int = SceneRender.nowTime;
         for(_loc3_ in _charShuangxiuDict)
         {
            _loc4_ = _charShuangxiuDict[_loc3_];
            if(_loc4_ == null)
            {
               delete _charShuangxiuDict[_loc3_];
            }
            else
            {
               _loc5_ = int(_loc3_);
               _loc6_ = getDisY(_loc2_ - _loc5_);
               for each(_loc7_ in _loc4_)
               {
                  if(_loc7_.usable)
                  {
                     _loc8_ = _loc7_.data as BaseCharacter;
                     if(_loc8_ != null)
                     {
                        _loc7_.specilize_y = _loc8_.shuangxiu_oldY + _loc6_;
                     }
                     else
                     {
                        removeFromSinShuangxiu(_loc7_);
                     }
                  }
                  else
                  {
                     removeFromSinShuangxiu(_loc7_);
                  }
               }
            }
         }
      }
      
      public static function setCharSitStatus(param1:int, param2:int, param3:int = 0, param4:int = 0, param5:int = 0, param6:int = 0, param7:int = 0, param8:int = 0, param9:int = 0) : void
      {
         var _loc12_:SceneCharacter = null;
         var _loc13_:SceneCharacter = null;
         var _loc14_:Number = NaN;
         var _loc15_:int = 0;
         var _loc10_:SceneCharacter = GameInstance.scene.getCharByID(param1,SceneCharacterType.PLAYER);
         var _loc11_:SceneCharacter = GameInstance.scene.getCharByID(param6,SceneCharacterType.GIRL);
         if(_loc10_ == null)
         {
            return;
         }
         if(param2 == RestType.COMMON)
         {
            setCharSit0Avatar(_loc10_,_loc11_);
            if(_loc10_.isMainChar())
            {
               mainChar_sit_common();
            }
            removeFromSinShuangxiu(_loc10_);
            return;
         }
         if(param2 == RestType.SIT)
         {
            if(_loc11_)
            {
               _loc10_.faceToCharacter(_loc11_);
            }
            setCharSit1Avatar(_loc10_,_loc11_);
            if(_loc10_.isMainChar())
            {
               mainChar_sit_dazuo();
            }
            if(_loc11_)
            {
               _loc10_.faceToCharacter(_loc11_);
               _loc11_.faceToCharacter(_loc10_);
            }
         }
         else if(param2 == RestType.DOUBLE_SIT)
         {
            _loc14_ = ZMath.getTowPointsAngle(new Point(_loc10_.piexl_x,_loc10_.tile_y),new Point(param4,param5));
            _loc15_ = Transformer.transAngle2LogicAngle(_loc14_);
            _loc12_ = GameInstance.scene.getCharByID(param3,SceneCharacterType.PLAYER);
            _loc13_ = GameInstance.scene.getCharByID(param9,SceneCharacterType.GIRL);
            if(_loc12_)
            {
               _loc10_.faceToCharacter(_loc12_);
            }
            else
            {
               _loc10_.faceToTile(param4,param5);
            }
            setCharSit2Avatar(_loc10_,_loc11_);
            if(_loc10_.isMainChar())
            {
               mainChar_sit_shuangxiu();
            }
            if(_loc12_)
            {
               _loc12_.faceToCharacter(_loc10_);
               setCharSit2Avatar(_loc12_,_loc13_);
               if(_loc12_.isMainChar())
               {
                  mainChar_sit_shuangxiu();
               }
               addToSinShuangxiu(SceneRender.nowTime,_loc10_,_loc12_);
            }
            else
            {
               removeFromSinShuangxiu(_loc10_);
            }
         }
      }
      
      public static function updateCharSitAvatar(param1:SceneCharacter) : void
      {
         var _loc2_:AvatarParamData = null;
         if(param1.getStatus() == CharStatusType.SIT)
         {
            _loc2_ = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,(param1.data as Player).attributeInfo.sitAvartID),AvatarPartType.MAGIC_RING);
            _loc2_.id = SpeciaAvatarPartID.SIT;
            param1.loadAvatarPart(_loc2_);
         }
      }
      
      private static function setCharSit0Avatar(param1:SceneCharacter, param2:SceneCharacter) : void
      {
         param1.restStatus = RestType.COMMON;
         param1.removeAvatarPartByID(SpeciaAvatarPartID.SIT);
         if(param1.getStatus() == CharStatusType.SIT)
         {
            param1.playTo(CharStatusType.STAND);
         }
         param1.showAvatarPartsByType(AvatarPartType.WEAPON);
         param1.showAvatarPartsByType(AvatarPartType.BOW);
         if(param2 != null)
         {
            param2.restStatus = RestType.COMMON;
            if(param2.getStatus() == CharStatusType.SIT)
            {
               param2.playTo(CharStatusType.STAND);
            }
         }
      }
      
      private static function setCharSit1Avatar(param1:SceneCharacter, param2:SceneCharacter) : void
      {
         param1.restStatus = RestType.SIT;
         param1.stopMove();
         if(param1.getStatus() != CharStatusType.SIT)
         {
            param1.playTo(CharStatusType.SIT);
            param1.hideAvatarPartsByType(AvatarPartType.WEAPON);
            param1.hideAvatarPartsByType(AvatarPartType.BOW);
            AvatarManager.updateSitAvatar(param1,(param1.data as Player).attributeInfo.sitAvartID);
         }
         if(param2 != null)
         {
            param2.restStatus = RestType.SIT;
            param2.stopMove();
            if(param2.getStatus() != CharStatusType.SIT)
            {
               param2.playTo(CharStatusType.SIT);
            }
            param2.setTileXY(param1.tile_x + 2,param2.tile_y);
         }
      }
      
      private static function setCharSit2Avatar(param1:SceneCharacter, param2:SceneCharacter) : void
      {
         param1.restStatus = RestType.DOUBLE_SIT;
         param1.stopMove();
         if(param1.getStatus() != CharStatusType.SIT)
         {
            param1.playTo(CharStatusType.SIT);
            param1.hideAvatarPartsByType(AvatarPartType.WEAPON);
            param1.hideAvatarPartsByType(AvatarPartType.BOW);
            AvatarManager.updateSitAvatar(param1,(param1.data as Player).attributeInfo.sitAvartID);
         }
         if(param2 != null)
         {
            param2.restStatus = RestType.COMMON;
            param2.stopMove();
            if(param2.getStatus() != CharStatusType.STAND)
            {
               param2.playTo(CharStatusType.STAND);
            }
         }
      }
      
      private static function mainChar_sit_common() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._shuangXiu_SearchPlayerPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_SHUANGXIU_PANEL);
         }
         if(Fun.isVisible(GameInstance.uiInstance._buttonContainer))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_DAZUO_PANEL);
         }
         PipeManager.sendMsg(PipeConstants.REMOVE_BUFF,[OtherConst.BUFF_DAZUO,SceneCharacterType.PLAYER,GameInstance.mainChar.id]);
         PipeManager.sendMsg(PipeConstants.REMOVE_BUFF,[OtherConst.BUFF_SHUANGXIU,SceneCharacterType.PLAYER,GameInstance.mainChar.id]);
         HighEffectManager.liziXuanwo_stop();
      }
      
      private static function mainChar_sit_dazuo() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._buttonContainer))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_DAZUO_PANEL);
         }
         if(GameInstance.mainCharData.afkInfo2.isStart)
         {
            PipeManager.sendMsg(PipeConstants.AFK_START,0);
         }
         PipeManager.sendMsg(PipeConstants.ADD_BUFF,[OtherConst.BUFF_DAZUO,SceneCharacterType.PLAYER,GameInstance.mainChar.id,0,0,0,0,0]);
         PipeManager.sendMsg(PipeConstants.REMOVE_BUFF,[OtherConst.BUFF_SHUANGXIU,SceneCharacterType.PLAYER,GameInstance.mainChar.id]);
         HighEffectManager.liziXuanwo_stop();
      }
      
      private static function mainChar_sit_shuangxiu() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._buttonContainer))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_DAZUO_PANEL);
         }
         if(GameInstance.mainCharData.afkInfo2.isStart)
         {
            PipeManager.sendMsg(PipeConstants.AFK_START,0);
         }
         PipeManager.sendMsg(PipeConstants.REMOVE_BUFF,[OtherConst.BUFF_DAZUO,SceneCharacterType.PLAYER,GameInstance.mainChar.id]);
         PipeManager.sendMsg(PipeConstants.ADD_BUFF,[OtherConst.BUFF_SHUANGXIU,SceneCharacterType.PLAYER,GameInstance.mainChar.id,0,0,0,0,0]);
         if(GameState.enableShuangxiuEffect)
         {
            HighEffectManager.lixiXuanwo_start();
         }
      }
      
      public static function setCharLiaoshangStatus(param1:int, param2:int, param3:int = 0, param4:int = 0, param5:int = 0, param6:int = 0, param7:int = 0) : void
      {
         var _loc9_:SceneCharacter = null;
         var _loc12_:Boolean = false;
         var _loc13_:int = 0;
         var _loc14_:AvatarParamData = null;
         var _loc15_:Point = null;
         var _loc16_:Point = null;
         var _loc8_:SceneCharacter = GameInstance.scene.getCharByID(param1);
         var _loc10_:SceneCharacter = GameInstance.scene.getCharByID(param6,SceneCharacterType.GIRL);
         var _loc11_:SceneCharacter = GameInstance.scene.getCharByID(param7,SceneCharacterType.GIRL);
         if(_loc10_ != null)
         {
            _loc10_.restStatus = RestType.COMMON;
            _loc10_.stopMove();
            if(_loc10_.getStatus() != CharStatusType.STAND)
            {
               _loc10_.playTo(CharStatusType.STAND);
            }
         }
         if(_loc11_ != null)
         {
            _loc11_.restStatus = RestType.COMMON;
            _loc11_.stopMove();
            if(_loc11_.getStatus() != CharStatusType.STAND)
            {
               _loc11_.playTo(CharStatusType.STAND);
            }
         }
         if(param2 == 0)
         {
            if(_loc8_ != null)
            {
               _loc8_.removeAvatarPartByID(SpeciaAvatarPartID.LIAOSHANG);
               _loc8_.removeAvatarPartByID(SpeciaAvatarPartID.BEILIAOSHANG);
               if(_loc8_.isMainChar())
               {
                  mainChar_liaoshang_common();
               }
            }
         }
         else if(param2 == 1 || param2 == 2)
         {
            _loc12_ = false;
            if(param2 == 2)
            {
               _loc12_ = true;
               param2 = 1;
               _loc13_ = param3;
               param3 = param1;
               param1 = _loc13_;
            }
            _loc9_ = GameInstance.scene.getCharByID(param3);
            if(_loc8_ != null)
            {
               _loc8_.removeAvatarPartByID(SpeciaAvatarPartID.BEILIAOSHANG);
               _loc14_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_LIAOSHANG),AvatarPartType.MAGIC_RING);
               _loc14_.id = SpeciaAvatarPartID.LIAOSHANG;
               _loc8_.loadAvatarPart(_loc14_);
               if(_loc8_.isMainChar())
               {
                  mainChar_liaoshang_liaoshang();
               }
               if(_loc9_ != null)
               {
                  _loc8_.faceToCharacter(_loc9_);
               }
               else if(!_loc12_)
               {
                  _loc8_.faceToTile(param4,param5);
               }
            }
            if(_loc9_ != null)
            {
               _loc9_.removeAvatarPartByID(SpeciaAvatarPartID.LIAOSHANG);
               _loc14_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BEILIAOSHANG),AvatarPartType.MAGIC_RING);
               _loc14_.id = SpeciaAvatarPartID.BEILIAOSHANG;
               _loc9_.loadAvatarPart(_loc14_);
               if(_loc9_.isMainChar())
               {
                  mainChar_liaoshang_beiliaoshang();
               }
               if(_loc9_.restStatus != RestType.DOUBLE_SIT)
               {
                  if(_loc8_ != null)
                  {
                     _loc15_ = ZMath.getRotPoint(new Point(_loc8_.piexl_x,_loc8_.piexl_y),new Point(_loc9_.piexl_x,_loc9_.piexl_y),180);
                     _loc9_.faceTo(_loc15_.x,_loc15_.y);
                  }
                  else if(!_loc12_)
                  {
                     _loc16_ = ZMath.getRotPoint(new Point(param4,param5),new Point(_loc9_.tile_x,_loc9_.tile_y),180);
                     _loc9_.faceTo(_loc15_.x,_loc15_.y);
                  }
               }
            }
         }
      }
      
      private static function mainChar_liaoshang_common() : void
      {
         GameInstance.mainCharData.attributeInfo.liaoshangStatus = 0;
         PipeManager.sendMsg(PipeConstants.REMOVE_BUFF,[OtherConst.BUFF_LIAOSHANG,SceneCharacterType.PLAYER,GameInstance.mainChar.id]);
         PipeManager.sendMsg(PipeConstants.REMOVE_BUFF,[OtherConst.BUFF_BEILIAOSHANG,SceneCharacterType.PLAYER,GameInstance.mainChar.id]);
      }
      
      private static function mainChar_liaoshang_liaoshang() : void
      {
         GameInstance.mainCharData.attributeInfo.liaoshangStatus = 1;
         PipeManager.sendMsg(PipeConstants.ADD_BUFF,[OtherConst.BUFF_LIAOSHANG,SceneCharacterType.PLAYER,GameInstance.mainChar.id,0,0,0,0,0]);
         PipeManager.sendMsg(PipeConstants.REMOVE_BUFF,[OtherConst.BUFF_BEILIAOSHANG,SceneCharacterType.PLAYER,GameInstance.mainChar.id]);
      }
      
      private static function mainChar_liaoshang_beiliaoshang() : void
      {
         GameInstance.mainCharData.attributeInfo.liaoshangStatus = 2;
         PipeManager.sendMsg(PipeConstants.REMOVE_BUFF,[OtherConst.BUFF_LIAOSHANG,SceneCharacterType.PLAYER,GameInstance.mainChar.id]);
         PipeManager.sendMsg(PipeConstants.ADD_BUFF,[OtherConst.BUFF_BEILIAOSHANG,SceneCharacterType.PLAYER,GameInstance.mainChar.id,0,0,0,0,0]);
      }
   }
}

