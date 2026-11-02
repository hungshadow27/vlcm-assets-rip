package com.tgame.common.vo.item
{
   import com.zcp.common.cd.IItem;
   import flash.display.Bitmap;
   
   public class BaseItem implements IItem
   {
      
      public var id:int;
      
      public var roleID:int;
      
      public var mountID:int;
      
      public var girID:int;
      
      public var count:int = 0;
      
      public var enabled:Boolean = true;
      
      public var position:int = 0;
      
      public var position1:int = -1;
      
      private var _quickbarindex:int = -1;
      
      public var leavingCoolingtime:Number = 0;
      
      public function BaseItem(param1:int, param2:int = 0, param3:int = 0, param4:Number = 0)
      {
         super();
         this.id = param1;
         this.position = param2;
         this.quickbarindex = param3;
         this.leavingCoolingtime = param4;
      }
      
      public function set quickbarindex(param1:int) : void
      {
         this._quickbarindex = param1;
      }
      
      public function get quickbarindex() : int
      {
         return this._quickbarindex;
      }
      
      public function getID() : *
      {
         throw new Error("必须被覆盖");
      }
      
      public function getType() : int
      {
         throw new Error("必须被覆盖");
      }
      
      public function getCoolingtime() : int
      {
         throw new Error("必须被覆盖");
      }
      
      public function getPublicCoolingtime() : int
      {
         throw new Error("必须被覆盖");
      }
      
      public function getPublicCoolingtimeClass() : *
      {
         throw new Error("必须被覆盖");
      }
      
      public function getSmallICO(param1:int = 35, param2:int = 35) : Bitmap
      {
         throw new Error("必须被覆盖");
      }
      
      public function getBigICOPath() : String
      {
         throw new Error("必须被覆盖");
      }
      
      public function getAvatarPath_Clothes() : String
      {
         throw new Error("必须被覆盖");
      }
      
      public function getAvatarPath_ClothesOnMount() : String
      {
         throw new Error("必须被覆盖");
      }
      
      public function getAvatarPath_ClothesOnMount_weapon_female() : String
      {
         throw new Error("必须被覆盖");
      }
      
      public function getAvatarPath_Buff() : String
      {
         throw new Error("必须被覆盖");
      }
      
      public function getAvatarPath_Skill0() : String
      {
         throw new Error("必须被覆盖");
      }
      
      public function getAvatarPath_Skill1() : String
      {
         throw new Error("必须被覆盖");
      }
      
      public function getAvatarPath_Skill2() : String
      {
         throw new Error("必须被覆盖");
      }
      
      public function getAvatarPath_bag() : String
      {
         throw new Error("方法必须被覆盖");
      }
   }
}

