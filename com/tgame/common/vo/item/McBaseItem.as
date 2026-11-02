package com.tgame.common.vo.item
{
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.staticdata.CoolingType;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class McBaseItem extends Goods
   {
      
      public var name:String;
      
      public var shuliang:int;
      
      public var dengji:int;
      
      public var dangqianJingyan:int = -1;
      
      public var zuidaJingyan:int;
      
      public var tunshiJingyan:int;
      
      public var miaoshu:String = "";
      
      public var jiage:int = -1;
      
      public var isSuoding:int;
      
      public var daojuId:int;
      
      public var zhuangbeiId:int = -1;
      
      public var zhuangbeiWeizhi:int = -1;
      
      public function McBaseItem(param1:int, param2:int = 0, param3:int = 0, param4:Number = 0)
      {
         super(param1,param2,param3,param4);
         res = GoodsResManager.getGoodsRes(id);
      }
      
      override public function getSmallICO(param1:int = 35, param2:int = 35) : Bitmap
      {
         return ResPathManager.getSmallICO(res.id_ico,param1,param2);
      }
      
      override public function getAvatarPath_Buff() : String
      {
         return ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,res.id_e0);
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
         return 0;
      }
      
      override public function getPublicCoolingtime() : int
      {
         return 0;
      }
      
      override public function getPublicCoolingtimeClass() : *
      {
         return 0;
      }
      
      public function getMc(param1:int, param2:Function) : Sprite
      {
         return ResPathManager.getSmallMc(param1,param2);
      }
      
      public function shanchuMcShiyong(param1:int, param2:String) : void
      {
         ResPathManager.shanchuMcShiyong(param1,param2);
      }
   }
}

