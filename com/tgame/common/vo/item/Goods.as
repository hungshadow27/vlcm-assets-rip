package com.tgame.common.vo.item
{
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.staticdata.CoolingType;
   import com.tgame.common.staticdata.ItemPositionRange;
   import flash.display.Bitmap;
   
   public class Goods extends BaseItem
   {
      
      public var res:GoodsRes;
      
      public var quality:int = 1;
      
      public var bind:int = 0;
      
      public var curr_durability:int = -1;
      
      public var hole_number:int = 0;
      
      public var strengthen_grade:int = 0;
      
      public var strengthen_total:int;
      
      public var is_show:int = 1;
      
      public var is_use:int = 0;
      
      public var duration:int = 0;
      
      public var base_desc:String;
      
      public var addition_desc:String;
      
      public var gems:String;
      
      public var saleCopper:int;
      
      public var saleGold:int;
      
      public var isNext:Boolean = false;
      
      public var isFullStar:int;
      
      public var isJiPin:int;
      
      public var hushenfuIndex:int;
      
      public var order_limit_grade:int;
      
      public var order_position:int;
      
      public var order_popsinger:int;
      
      public var isTuteng:int;
      
      public var isBaoshiTOP:int;
      
      public var isNiuBi:int;
      
      public var isFullTianshen:int;
      
      public var isFullStone:int;
      
      public var isFullLongStone:int;
      
      public var isSiShengShou:int;
      
      public var isShowDestroyPanel:Boolean = false;
      
      public function Goods(param1:int, param2:int = 0, param3:int = 0, param4:Number = 0, param5:int = -99)
      {
         super(param1,param2,param3,param4);
         this.res = GoodsResManager.getGoodsRes(id);
         roleID = param5;
      }
      
      override public function getSmallICO(param1:int = 35, param2:int = 35) : Bitmap
      {
         if(param1 == 65 && param2 == 65)
         {
            return ResPathManager.getSmallICO(this.res.id_ico_big,param1,param2);
         }
         return ResPathManager.getSmallICO(this.res.id_ico,param1,param2);
      }
      
      override public function getBigICOPath() : String
      {
         return ResPathManager.getBigICOPath(this.res.id_ico_big);
      }
      
      override public function getAvatarPath_Clothes() : String
      {
         return ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,this.res.id_m);
      }
      
      override public function getAvatarPath_ClothesOnMount() : String
      {
         return ResPathManager.getAvatarPath_ClothesOnMount(ResPathManager.AVATAR_CLOTHES,this.res.id_m);
      }
      
      override public function getAvatarPath_ClothesOnMount_weapon_female() : String
      {
         return ResPathManager.getAvatarPath_ClothesOnMount_weapon_female(ResPathManager.AVATAR_CLOTHES,this.res.id_m);
      }
      
      override public function getAvatarPath_bag() : String
      {
         return ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,this.res.id_bag);
      }
      
      override public function getID() : *
      {
         return this.getType() + "_" + id;
      }
      
      override public function getType() : int
      {
         return CoolingType.GOODS;
      }
      
      override public function getCoolingtime() : int
      {
         return this.res.coolingtime;
      }
      
      override public function getPublicCoolingtime() : int
      {
         return this.res.public_time;
      }
      
      override public function getPublicCoolingtimeClass() : *
      {
         return this.getType() + "_" + this.res.public_type;
      }
      
      public function inBag() : Boolean
      {
         return ItemPositionRange.inBag(position);
      }
      
      public function inBody() : Boolean
      {
         return ItemPositionRange.inBody(position);
      }
   }
}

