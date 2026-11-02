package com.tgame.common.res.lianti
{
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   
   public class LiantiResManager
   {
      
      public static const MAX_LIANTI_LV:int = 8;
      
      private static var liantiResContainer:Object = new Object();
      
      public function LiantiResManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc3_:LiantiRes = null;
         var _loc4_:XML = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc4_ in _loc2_.lts.lt)
         {
            _loc3_ = new LiantiRes();
            _loc3_.f_id = _loc4_.@f_id;
            _loc3_.f_name = _loc4_.@f_name;
            _loc3_.f_desc = _loc4_.@f_desc;
            _loc3_.f_desc_tupo = _loc4_.@f_desc_tupo;
            _loc3_.f_hp = _loc4_.@f_hp;
            _loc3_.f_mp = _loc4_.@f_mp;
            _loc3_.f_sp = _loc4_.@f_sp;
            _loc3_.f_atk = _loc4_.@f_atk;
            _loc3_.f_def = _loc4_.@f_def;
            _loc3_.f_atk_speed = _loc4_.@f_atk_speed;
            _loc3_.f_move_speed = _loc4_.@f_move_speed;
            _loc3_.f_fjsh = _loc4_.@f_fjsh;
            _loc3_.f_shjm = _loc4_.@f_shjm;
            _loc3_.f_aq_jv = _loc4_.@f_aq_jv;
            _loc3_.f_tupo_need_goodsmodel = _loc4_.@f_tupo_need_goodsmodel;
            _loc3_.f_tupo_need_goodscount = _loc4_.@f_tupo_need_goodscount;
            _loc3_.f_tupo_show_probability = _loc4_.@f_tupo_show_probability;
            _loc3_.f_zhufu_max = _loc4_.@f_zhufu_max;
            _loc3_.f_food_goodsid = _loc4_.@f_food_goodsid;
            _loc3_.f_food_map = _loc4_.@f_food_map;
            _loc3_.f_food_monstername = _loc4_.@f_food_monstername;
            _loc3_.f_location = _loc4_.@f_location;
            liantiResContainer[_loc3_.f_id] = _loc3_;
         }
      }
      
      public static function getLiantiRes(param1:int) : LiantiRes
      {
         return liantiResContainer[param1];
      }
      
      public static function getLiantiMainDes(param1:int) : String
      {
         var _loc2_:LiantiRes = getLiantiRes(param1);
         if(_loc2_ == null)
         {
            return "";
         }
         var _loc3_:GoodsRes = GoodsResManager.getGoodsRes(_loc2_.f_food_goodsid);
         var _loc4_:String = "<u><font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\'event:goodsID#" + _loc3_.id_kind + "\'>【" + _loc3_.name + "】</a></font></u>";
         var _loc5_:String = "<u><font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\'event:findPath#" + _loc2_.f_location + ",-1\'>【" + _loc2_.f_food_map + "】【" + _loc2_.f_food_monstername + "】</a></font></u>";
         return LanResManager.getLanTextWords(LiantiResManager,"当前炼体境界描述",[_loc4_,_loc4_,_loc5_,_loc4_]);
      }
   }
}

