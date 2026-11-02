package com.tgame.common.vo.character
{
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.girl.GirlRes;
   import com.tgame.common.res.girl.GirlResManager;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.GirlAttributeInfo;
   import com.tgame.common.vo.character.info.GoodsInfo;
   import com.tgame.common.vo.character.info.SkillInfo;
   import com.zcp.engine.SceneCharacter;
   
   public class Girl extends BaseCharacter
   {
      
      public var attributeInfo:AttributeInfo = new AttributeInfo();
      
      public var res:GirlRes;
      
      public var masterID:int;
      
      public var masterName:String;
      
      private var _girlAttributeInfo:GirlAttributeInfo;
      
      private var _girlSkillInfo:SkillInfo;
      
      private var _girlGoodsInfo:GoodsInfo;
      
      public function Girl(param1:SceneCharacter, param2:int, param3:int = -1, param4:String = "")
      {
         super(param1);
         this.res = GirlResManager.getGirlRes(param2);
         this.masterID = param3;
         this.masterName = param4;
      }
      
      public function get girlAttributeInfo() : GirlAttributeInfo
      {
         if(this._girlAttributeInfo == null)
         {
            this._girlAttributeInfo = new GirlAttributeInfo();
         }
         return this._girlAttributeInfo;
      }
      
      public function get girlSkillInfo() : SkillInfo
      {
         if(this._girlSkillInfo == null)
         {
            this._girlSkillInfo = new SkillInfo();
         }
         return this._girlSkillInfo;
      }
      
      public function get girlGoodsInfo() : GoodsInfo
      {
         if(this._girlGoodsInfo == null)
         {
            this._girlGoodsInfo = new GoodsInfo();
         }
         return this._girlGoodsInfo;
      }
      
      public function getAvatarPath_Clothes() : String
      {
         return ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,this.res.id_m);
      }
   }
}

