package com.tgame.moudels.char.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.vo.character.BaseCharacter;
   import com.tgame.common.vo.character.Monster;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.HighEffectManager;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveCallBack;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Char_CharProxy extends Proxy
   {
      
      public static const NAME:String = "Char_CharProxy";
      
      public function Char_CharProxy(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
      }
      
      public function monsterTalk(param1:int, param2:int) : void
      {
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(param1,SceneCharacterType.MONSTER);
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:Array = Monster(_loc3_.data).res.talks;
         var _loc5_:String = _loc4_[param2 - 1];
         if(_loc5_ != null && _loc5_ != "")
         {
            _loc3_.setHeadFaceTalkText(_loc5_);
         }
      }
      
      public function monsterTalk1(param1:int, param2:String) : void
      {
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(param1,SceneCharacterType.MONSTER);
         if(!_loc3_)
         {
            return;
         }
         _loc3_.setHeadFaceTalkText(param2);
      }
      
      public function monsterWalk(param1:int, param2:ByteArray) : void
      {
         var $callBack:MoveCallBack;
         var monster:SceneCharacter = null;
         var new_onMoveThrough:Function = null;
         var $roleID:int = param1;
         var $data:ByteArray = param2;
         new_onMoveThrough = function(param1:SceneCharacter, param2:MapTile):void
         {
            AvatarManager.setHuangzhuangZhuangtai(monster);
         };
         monster = GameInstance.scene.getCharByID($roleID,SceneCharacterType.MONSTER);
         if(!monster)
         {
            return;
         }
         $callBack = new MoveCallBack();
         $callBack.onMoveThrough = new_onMoveThrough;
         monster.walk1($data,null,-1,0,$callBack);
      }
      
      public function mountWalk(param1:int, param2:ByteArray) : void
      {
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(param1,SceneCharacterType.MOUNT);
         if(!_loc3_)
         {
            return;
         }
         _loc3_.walk1(param2);
      }
      
      public function girlWalk(param1:int, param2:ByteArray) : void
      {
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(param1,SceneCharacterType.GIRL);
         if(!_loc3_)
         {
            return;
         }
         _loc3_.walk1(param2);
      }
      
      public function npcFriendWalk(param1:int, param2:ByteArray) : void
      {
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(param1,SceneCharacterType.NPC_FRIEND);
         if(!_loc3_)
         {
            return;
         }
         _loc3_.walk1(param2);
      }
      
      public function mountJump(param1:int, param2:Point, param3:Point) : void
      {
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(param1,SceneCharacterType.MOUNT);
         if(!_loc4_)
         {
            return;
         }
         _loc4_.setTileXY(param2.x,param2.y);
         _loc4_.lineTo(param3,OtherConst.MOUNT_JUMP_SPEED,true);
      }
      
      public function girlJump(param1:int, param2:Point, param3:Point, param4:Boolean, param5:Boolean) : void
      {
         var _loc6_:SceneCharacter = GameInstance.scene.getCharByID(param1,SceneCharacterType.GIRL);
         if(!_loc6_)
         {
            return;
         }
         if(!param4)
         {
            _loc6_.setTileXY(param2.x,param2.y);
         }
         MainCharSeachPathManager.charJump(_loc6_,param3,-1,0,null,param4,param5);
      }
      
      public function monsterJump(param1:int, param2:Point, param3:Point, param4:Boolean, param5:Boolean) : void
      {
         var _loc6_:SceneCharacter = GameInstance.scene.getCharByID(param1,SceneCharacterType.MONSTER);
         if(!_loc6_)
         {
            return;
         }
         if(!param4)
         {
            _loc6_.setTileXY(param2.x,param2.y);
         }
         MainCharSeachPathManager.charJump(_loc6_,param3,-1,0,null,param4,param5);
      }
      
      public function npcFriendJump(param1:int, param2:Point, param3:Point) : void
      {
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(param1,SceneCharacterType.NPC_FRIEND);
         if(!_loc4_)
         {
            return;
         }
         _loc4_.setTileXY(param2.x,param2.y);
         _loc4_.lineTo(param3,OtherConst.MOUNT_JUMP_SPEED,true);
      }
      
      public function charWalk(param1:int, param2:ByteArray) : void
      {
         var $callBack:MoveCallBack;
         var count:int;
         var char:SceneCharacter = null;
         var new_onMoveThrough:Function = null;
         var $roleID:int = param1;
         var $data:ByteArray = param2;
         new_onMoveThrough = function(param1:SceneCharacter, param2:MapTile):void
         {
            if(char.isOnMount)
            {
               if(Player(char.data).avatarInfo.isCiKe && count++ % 4 == 0)
               {
                  HighEffectManager.addGhost(char.getNowAvatarFaceList(),true);
               }
               if(Player(char.data).avatarInfo.isHuanYingXiaDao && count++ % 4 == 0)
               {
                  HighEffectManager.addGhost(char.getNowAvatarFaceList(),true);
               }
            }
            else
            {
               if(Player(char.data).avatarInfo.isCiKe && count++ % 2 == 0)
               {
                  HighEffectManager.addGhost(char.getNowAvatarFaceList(),true);
               }
               if(Player(char.data).avatarInfo.isHuanYingXiaDao && count++ % 2 == 0)
               {
                  HighEffectManager.addGhost(char.getNowAvatarFaceList(),true);
               }
            }
            if(param1.moveData.onDigun && count++ % 4 == 0)
            {
               HighEffectManager.addGhost(param1.getNowAvatarFaceList(),true);
            }
            AvatarManager.setHuangzhuangZhuangtai(char);
         };
         char = GameInstance.scene.getCharByID($roleID,SceneCharacterType.PLAYER);
         if(!char)
         {
            return;
         }
         $callBack = new MoveCallBack();
         $callBack.onMoveThrough = new_onMoveThrough;
         count = 0;
         char.walk1($data,null,-1,0,$callBack);
      }
      
      public function charJump(param1:int, param2:Point, param3:Point, param4:Boolean, param5:Boolean) : void
      {
         var _loc6_:SceneCharacter = GameInstance.scene.getCharByID(param1,SceneCharacterType.PLAYER);
         if(!_loc6_)
         {
            return;
         }
         if(!param4)
         {
            _loc6_.setTileXY(param2.x,param2.y);
         }
         MainCharSeachPathManager.charJump(_loc6_,param3,-1,0,null,param4,param5);
      }
      
      public function reviseTileXY(param1:int, param2:int, param3:int) : void
      {
         var _loc5_:AvatarInfo = null;
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(param1);
         if(_loc4_)
         {
            _loc4_.reviseTileXY(param2,param3);
            AvatarManager.setHuangzhuangZhuangtai(_loc4_);
            _loc5_ = (_loc4_.data as BaseCharacter).avatarInfo;
            if(_loc5_.isFeixing || _loc4_.isOnMount)
            {
               AvatarManager.updateMainAvatar(_loc4_);
            }
         }
      }
      
      public function stopToTileXY(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(param1);
         if(_loc4_)
         {
            _loc4_.stopMove();
            _loc4_.setTileXY(param2,param3);
         }
      }
      
      public function shunyiTileXY(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:SceneCharacter = GameInstance.scene.getCharByID(param2,param1);
         if(_loc5_)
         {
            _loc5_.setTileXY(param3,param4);
         }
      }
   }
}

