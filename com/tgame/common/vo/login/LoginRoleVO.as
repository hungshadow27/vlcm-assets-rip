package com.tgame.common.vo.login
{
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.vo.character.info.AvatarInfo;
   
   public class LoginRoleVO
   {
      
      public var roleID:int;
      
      public var nickName:String;
      
      public var headImg:String;
      
      public var level:int;
      
      public var partyID:int = 0;
      
      public var sex:int;
      
      public var isOnMount:Boolean = false;
      
      public var avatarInfo:AvatarInfo = new AvatarInfo();
      
      public function LoginRoleVO()
      {
         super();
      }
      
      public function getSex() : int
      {
         return PartyType.getSexByParty(this.partyID);
      }
   }
}

