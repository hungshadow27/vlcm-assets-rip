package com.tgame.common.vo.character
{
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.monster.MonsterRes;
   import com.tgame.common.res.monster.MonsterResManager;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.zcp.engine.SceneCharacter;
   
   public class Monster extends BaseCharacter
   {
      
      public var attributeInfo:AttributeInfo = new AttributeInfo();
      
      public var res:MonsterRes;
      
      public function Monster(param1:SceneCharacter, param2:int)
      {
         super(param1);
         this.res = MonsterResManager.getMonsterRes(param2);
      }
      
      public function getAvatarPath_Clothes() : String
      {
         return ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,this.res.id_m);
      }
   }
}

