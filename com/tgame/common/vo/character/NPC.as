package com.tgame.common.vo.character
{
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.npc.NpcRes;
   import com.tgame.common.res.npc.NpcResManager;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.zcp.engine.SceneCharacter;
   
   public class NPC extends BaseCharacter
   {
      
      public var attributeInfo:AttributeInfo = new AttributeInfo();
      
      public var res:NpcRes;
      
      public function NPC(param1:SceneCharacter, param2:int)
      {
         super(param1);
         this.res = NpcResManager.getNpcRes(param2);
      }
      
      public function getBigICOPath() : String
      {
         return ResPathManager.getBigICOPath(this.res.id_ico_big);
      }
      
      public function getAvatarPath_Clothes() : String
      {
         return ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,this.res.id_m);
      }
   }
}

