package com.tgame.common.vo.character
{
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.mount.MountRes;
   import com.tgame.common.res.mount.MountResManager;
   import com.tgame.common.vo.character.info.GoodsInfo;
   import com.tgame.common.vo.character.info.MountAttributeInfo;
   import com.tgame.common.vo.character.info.SkillInfo;
   import com.zcp.engine.SceneCharacter;
   import flash.display.Bitmap;
   
   public class Mount extends BaseCharacter
   {
      
      public var res:MountRes;
      
      public var masterID:int;
      
      public var masterName:String;
      
      private var _mountAttributeInfo:MountAttributeInfo;
      
      private var _mountGoodsInfo:GoodsInfo;
      
      private var _mountSkillInfo:SkillInfo;
      
      public function Mount(param1:SceneCharacter, param2:int, param3:int = -1, param4:String = "")
      {
         super(param1);
         this.res = MountResManager.getMountRes(param2);
         this.masterID = param3;
         this.masterName = param4;
      }
      
      public function get mountAttributeInfo() : MountAttributeInfo
      {
         if(this._mountAttributeInfo == null)
         {
            this._mountAttributeInfo = new MountAttributeInfo();
         }
         return this._mountAttributeInfo;
      }
      
      public function get mountGoodsInfo() : GoodsInfo
      {
         if(this._mountGoodsInfo == null)
         {
            this._mountGoodsInfo = new GoodsInfo();
         }
         return this._mountGoodsInfo;
      }
      
      public function get mountSkillInfo() : SkillInfo
      {
         if(this._mountSkillInfo == null)
         {
            this._mountSkillInfo = new SkillInfo();
         }
         return this._mountSkillInfo;
      }
      
      public function getSmallICO(param1:int = 35, param2:int = 35) : Bitmap
      {
         return ResPathManager.getSmallICO(this.res.id_ico,param1,param2);
      }
      
      public function getAvatarPath_Clothes() : String
      {
         return ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,this.res.id_m);
      }
   }
}

