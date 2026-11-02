package com.tgame.common
{
   import com.tgame.common.staticdata.ColorConst;
   import com.tgame.common.ui.UIInstance;
   import com.tgame.common.vo.character.Girl;
   import com.tgame.common.vo.character.Mount;
   import com.tgame.common.vo.character.NpcFriend;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.PurePlayer;
   import com.zcp.engine.Scene;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import flash.display.Stage;
   import flash.utils.Dictionary;
   
   public class GameInstance
   {
      
      public static var stage:Stage;
      
      public static var app:TGame;
      
      public static var scene:Scene;
      
      private static var _mainChar:SceneCharacter;
      
      private static var _lockOnChar:SceneCharacter;
      
      private static var _mouseOnChar:SceneCharacter;
      
      private static var _lookPlayerData:PurePlayer;
      
      private static var _peioPlayerData:PurePlayer;
      
      public static var readyJieHunID:int;
      
      public static var uiInstance:UIInstance = new UIInstance();
      
      public static var lastLockPlayerID:int = -1;
      
      private static var _lookPlayerID:int = -1;
      
      private static var _peioPlayerID:int = -1;
      
      public static var tabSelectArr:Array = [];
      
      public static var lookBanghuiID:int = 0;
      
      public static var npcTishiDict:Dictionary = new Dictionary();
      
      public static var npcTupianTishiDict:Dictionary = new Dictionary();
      
      public function GameInstance()
      {
         super();
      }
      
      public static function get mainChar() : SceneCharacter
      {
         if(_mainChar == null)
         {
            _mainChar = GameInstance.scene.mainChar;
            _mainChar.data = new Player(_mainChar);
         }
         return _mainChar;
      }
      
      public static function get mainCharData() : Player
      {
         return mainChar.data as Player;
      }
      
      public static function get lockOnChar() : SceneCharacter
      {
         return _lockOnChar;
      }
      
      public static function set lockOnChar(param1:SceneCharacter) : void
      {
         _lockOnChar = param1;
         GameInstance.scene.setSelectedCharacter(_lockOnChar);
         if(_lockOnChar != null && _lockOnChar.type == SceneCharacterType.PLAYER)
         {
            lastLockPlayerID = _lockOnChar.id;
         }
         else
         {
            lastLockPlayerID = -1;
         }
      }
      
      public static function get mouseOnChar() : SceneCharacter
      {
         return _mouseOnChar;
      }
      
      public static function set mouseOnChar(param1:SceneCharacter) : void
      {
         var _loc3_:Mount = null;
         var _loc4_:NpcFriend = null;
         var _loc5_:Girl = null;
         var _loc2_:SceneCharacter = _mouseOnChar;
         _mouseOnChar = param1;
         GameInstance.scene.setMouseOnCharacter(_mouseOnChar);
         if(_loc2_ != null && _loc2_.type == SceneCharacterType.MOUNT)
         {
            _loc2_.setHeadFaceNickName(_loc2_.name,ColorConst.MOUNT_NICK_NAME_COLOR);
         }
         if(_mouseOnChar != null && _mouseOnChar.type == SceneCharacterType.MOUNT)
         {
            _loc3_ = _mouseOnChar.data as Mount;
            _mouseOnChar.setHeadFaceNickName(_mouseOnChar.name + "(" + _loc3_.masterName + ")",ColorConst.MOUNT_NICK_NAME_COLOR);
         }
         if(_loc2_ != null && _loc2_.type == SceneCharacterType.NPC_FRIEND)
         {
            _loc2_.setHeadFaceNickName(_loc2_.name,ColorConst.NPC_FRIEND_NICK_NAME_COLOR);
         }
         if(_mouseOnChar != null && _mouseOnChar.type == SceneCharacterType.NPC_FRIEND)
         {
            _loc4_ = _mouseOnChar.data as NpcFriend;
            _mouseOnChar.setHeadFaceNickName(_mouseOnChar.name + "(" + _loc4_.masterName + ")",ColorConst.NPC_FRIEND_NICK_NAME_COLOR);
         }
         if(_loc2_ != null && _loc2_.type == SceneCharacterType.GIRL)
         {
            _loc2_.setHeadFaceNickName(_loc2_.name,ColorConst.GIRL_NICK_NAME_COLOR);
         }
         if(_mouseOnChar != null && _mouseOnChar.type == SceneCharacterType.GIRL)
         {
            _loc5_ = _mouseOnChar.data as Girl;
            _mouseOnChar.setHeadFaceNickName(_mouseOnChar.name + "(" + _loc5_.masterName + ")",ColorConst.GIRL_NICK_NAME_COLOR);
         }
      }
      
      public static function get lookPlayerID() : int
      {
         return _lookPlayerID;
      }
      
      public static function set lookPlayerID(param1:int) : void
      {
         if(_lookPlayerID != param1)
         {
            _lookPlayerID = param1;
            if(_lookPlayerID > 0)
            {
               _lookPlayerData = new PurePlayer();
               _lookPlayerData.id = _lookPlayerID;
            }
            else
            {
               _lookPlayerData = null;
            }
         }
      }
      
      public static function get lookPlayerData() : PurePlayer
      {
         return _lookPlayerData;
      }
      
      public static function get peioPlayerID() : int
      {
         return _peioPlayerID;
      }
      
      public static function set peioPlayerID(param1:int) : void
      {
         if(_peioPlayerID != param1)
         {
            _peioPlayerID = param1;
            if(_peioPlayerID > 0)
            {
               _peioPlayerData = new PurePlayer();
               _peioPlayerData.id = _peioPlayerID;
            }
            else
            {
               _peioPlayerData = null;
            }
         }
      }
      
      public static function get peioPlayerData() : PurePlayer
      {
         return _peioPlayerData;
      }
   }
}

