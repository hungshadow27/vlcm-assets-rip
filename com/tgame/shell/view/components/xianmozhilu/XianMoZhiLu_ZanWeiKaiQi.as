package com.tgame.shell.view.components.xianmozhilu
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.Sprite;
   
   public class XianMoZhiLu_ZanWeiKaiQi extends Sprite
   {
      
      private var button:NewSkinButton;
      
      public function XianMoZhiLu_ZanWeiKaiQi()
      {
         super();
         var _loc1_:Sprite = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/weikaiqi_1.swf") as Sprite;
         _loc1_.y = 32;
         addChild(_loc1_);
         var _loc2_:Sprite = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/weikaiqi_2.swf") as Sprite;
         _loc2_.x = 100;
         addChild(_loc2_);
         var _loc3_:Sprite = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/xianwei.swf") as Sprite;
         _loc3_.x = 216;
         _loc3_.y = 32;
         addChild(_loc3_);
      }
      
      public function setData(param1:Object) : void
      {
      }
      
      public function getGoodsNumByGoodsID(param1:int) : int
      {
         return GameInstance.mainCharData.goodsInfo.getGoodsNumByID(param1,true);
      }
   }
}

