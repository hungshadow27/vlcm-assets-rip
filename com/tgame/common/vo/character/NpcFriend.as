package com.tgame.common.vo.character
{
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.npcFriend.NpcFriendRes;
   import com.tgame.common.res.npcFriend.NpcFriendResManager;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.SkillInfo;
   import com.zcp.engine.SceneCharacter;
   
   public class NpcFriend extends BaseCharacter
   {
      
      public var res:NpcFriendRes;
      
      public var masterID:int;
      
      public var masterName:String;
      
      private var _npcFriendAttributeInfo:AttributeInfo;
      
      private var _npcFriendSkillInfo:SkillInfo;
      
      public function NpcFriend(param1:SceneCharacter, param2:int, param3:int = -1, param4:String = "")
      {
         super(param1);
         this.res = NpcFriendResManager.getNpcFriendRes(param2);
         this.masterID = param3;
         this.masterName = param4;
      }
      
      public function get npcFriendAttributeInfo() : AttributeInfo
      {
         if(this._npcFriendAttributeInfo == null)
         {
            this._npcFriendAttributeInfo = new AttributeInfo();
         }
         return this._npcFriendAttributeInfo;
      }
      
      public function get npcFriendSkillInfo() : SkillInfo
      {
         if(this._npcFriendSkillInfo == null)
         {
            this._npcFriendSkillInfo = new SkillInfo();
         }
         return this._npcFriendSkillInfo;
      }
      
      public function getAvatarPath_Clothes() : String
      {
         return ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,this.res.id_m);
      }
   }
}

