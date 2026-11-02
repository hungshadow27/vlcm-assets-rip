package com.tgame.common.res.shouji
{
   import com.tgame.common.res.task.vo.TaskTargetData;
   import com.tgame.common.res.task.vo.TaskTargetPos;
   
   public class ShoujiResManager
   {
      
      private static var shoujiResContainer:Object = new Object();
      
      public function ShoujiResManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc3_:ShoujiRes = null;
         var _loc4_:XML = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc4_ in _loc2_.goods_dcs.goods_dc)
         {
            _loc3_ = new ShoujiRes();
            _loc3_.id = _loc4_.@id;
            _loc3_.name = _loc4_.name;
            _loc3_.grade = _loc4_.@grade;
            _loc3_.rewardDesc = _loc4_.rewardDesc;
            _loc3_.targetGoods = getTargetGoodsArr(_loc4_.@targetGoods);
            shoujiResContainer[_loc3_.id] = _loc3_;
         }
      }
      
      public static function getShoujiRes(param1:int) : ShoujiRes
      {
         return shoujiResContainer[param1];
      }
      
      public static function getAllShoujiResArr() : Array
      {
         var _loc2_:ShoujiRes = null;
         var _loc1_:Array = [];
         for each(_loc2_ in shoujiResContainer)
         {
            _loc1_.push(_loc2_);
         }
         _loc1_.sortOn("grade",Array.NUMERIC);
         return _loc1_;
      }
      
      public static function getTargetGoodsArr(param1:String, param2:Boolean = true) : Array
      {
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc7_:TaskTargetData = null;
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "null" || param1 == "undefined")
         {
            return [];
         }
         param1 = param1.replace(/^,(.+)$/,"$1").replace(/^(.+),$/,"$1");
         var _loc3_:Array = [];
         var _loc4_:Array = param1.split(",");
         for each(_loc6_ in _loc4_)
         {
            _loc5_ = _loc6_.split("#");
            _loc7_ = new TaskTargetData(_loc5_[0],int(Number(_loc5_[1])),_loc5_[2],null,param2 ? TaskTargetPos.fromSplitString(_loc5_[3],"_") : new TaskTargetPos(0,0,0,0));
            _loc7_.userData = _loc5_[4];
            _loc3_.push(_loc7_);
         }
         return _loc3_;
      }
   }
}

