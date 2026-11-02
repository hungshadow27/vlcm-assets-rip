package com.tgame.common.res.jingmai
{
   public class XueweiResManager
   {
      
      private static var xueweiResContainer:Object = new Object();
      
      private static var xueweiResContainer_zhenlong:Object = new Object();
      
      private static var jingmaiRes_xueweiNum:Object = new Object();
      
      public function XueweiResManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc3_:XueweiRes = null;
         var _loc4_:XML = null;
         var _loc5_:int = 0;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc4_ in _loc2_.RECORD)
         {
            _loc3_ = new XueweiRes();
            _loc3_.f_id = parseInt(_loc4_.f_id);
            _loc3_.f_name = _loc4_.f_name;
            _loc3_.f_hp_add = parseInt(_loc4_.f_hp_add);
            _loc3_.f_mp_add = parseInt(_loc4_.f_mp_add);
            _loc3_.f_sp_add = parseInt(_loc4_.f_sp_add);
            _loc3_.f_attack_add = parseInt(_loc4_.f_attack_add);
            _loc3_.f_defence_add = parseInt(_loc4_.f_defence_add);
            _loc3_.f_dodge_add = parseInt(_loc4_.f_dodge_add);
            _loc3_.f_crt_add = parseInt(_loc4_.f_crt_add);
            _loc3_.f_need_zhenqi = parseInt(_loc4_.f_need_zhenqi);
            _loc3_.f_odds = parseInt(_loc4_.f_odds);
            xueweiResContainer[_loc3_.f_id] = _loc3_;
            _loc5_ = Math.floor(_loc3_.f_id / 100);
            if(!jingmaiRes_xueweiNum.hasOwnProperty(_loc5_))
            {
               jingmaiRes_xueweiNum[_loc5_] = 0;
            }
            else
            {
               jingmaiRes_xueweiNum[_loc5_] += 1;
            }
         }
      }
      
      public static function parseRes_zhenlong(param1:String) : void
      {
         var _loc3_:XueweiRes = null;
         var _loc4_:XML = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc4_ in _loc2_.RECORD)
         {
            _loc3_ = new XueweiRes();
            _loc3_.f_id = parseInt(_loc4_.f_id);
            _loc3_.f_name = _loc4_.f_name;
            _loc3_.f_hp_add = parseInt(_loc4_.f_hp_add);
            _loc3_.f_mp_add = parseInt(_loc4_.f_mp_add);
            _loc3_.f_sp_add = parseInt(_loc4_.f_sp_add);
            _loc3_.f_attack_add = parseInt(_loc4_.f_attack_add);
            _loc3_.f_defence_add = parseInt(_loc4_.f_defence_add);
            _loc3_.f_dodge_add = parseInt(_loc4_.f_dodge_add);
            _loc3_.f_crt_add = parseInt(_loc4_.f_crt_add);
            _loc3_.f_need_zhenqi = parseInt(_loc4_.f_need_zhenqi);
            _loc3_.f_odds = parseInt(_loc4_.f_odds);
            _loc3_.f_goodmodel_id = parseInt(_loc4_.f_goodmodel_id);
            _loc3_.f_goodmodel_count = parseInt(_loc4_.f_goodmodel_count);
            xueweiResContainer_zhenlong[_loc3_.f_id] = _loc3_;
         }
      }
      
      public static function getXueweiRes(param1:int, param2:Boolean) : XueweiRes
      {
         return param2 ? xueweiResContainer_zhenlong[param1] : xueweiResContainer[param1];
      }
      
      public static function getJingmaiRes(param1:int, param2:Boolean) : XueweiRes
      {
         return param2 ? xueweiResContainer_zhenlong[param1 * 100 + 1] : xueweiResContainer[param1 * 100 + 1];
      }
      
      public static function getJingmai_xueweiNum(param1:int) : int
      {
         return jingmaiRes_xueweiNum[param1];
      }
      
      public static function getXueweiResByName(param1:String, param2:Boolean) : XueweiRes
      {
         var _loc3_:XueweiRes = null;
         var _loc4_:Object = param2 ? xueweiResContainer_zhenlong : xueweiResContainer;
         for each(_loc3_ in _loc4_)
         {
            if(_loc3_.f_name == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
   }
}

