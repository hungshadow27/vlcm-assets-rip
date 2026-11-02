package com.tgame.common.res.baguazhang
{
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   
   public class BaGuaZhangRESManager
   {
      
      public static const MAX_LIANTI_LV:int = 8;
      
      public static const nameArr:Array = [LanResManager.getLanCommonTextWords("八卦掌一式"),LanResManager.getLanCommonTextWords("八卦掌二式"),LanResManager.getLanCommonTextWords("八卦掌三式"),LanResManager.getLanCommonTextWords("八卦掌四式"),LanResManager.getLanCommonTextWords("八卦掌五式"),LanResManager.getLanCommonTextWords("八卦掌六式"),LanResManager.getLanCommonTextWords("八卦掌七式"),LanResManager.getLanCommonTextWords("八卦掌八式")];
      
      private static var liantiResContainer:Object = new Object();
      
      public function BaGuaZhangRESManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc3_:BaGuaZhangRes = null;
         var _loc4_:XML = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc4_ in _loc2_.baguazhangs.baguazhang)
         {
            _loc3_ = new BaGuaZhangRes();
            _loc3_.f_id = _loc4_.@id;
            _loc3_.f_name = _loc4_.name;
            _loc3_.f_desc = _loc4_.desc;
            _loc3_.f_desc_tupo = _loc4_.desc_tupo;
            _loc3_.f_hp = _loc4_.@hp;
            _loc3_.f_mp = _loc4_.@mp;
            _loc3_.f_sp = _loc4_.@sp;
            _loc3_.f_atk = _loc4_.@atk;
            _loc3_.f_def = _loc4_.@def;
            _loc3_.f_move_speed = _loc4_.@crt;
            _loc3_.f_atk_speed = _loc4_.@dodge;
            _loc3_.f_fjsh = _loc4_.@aqms;
            _loc3_.f_shjm = _loc4_.@gjms;
            _loc3_.f_aq_jv = 0;
            _loc3_.f_tupo_need_goodsmodel = _loc4_.@tupo_need_goodsmodel;
            _loc3_.f_tupo_need_goodscount = _loc4_.@tupo_need_goodscount;
            _loc3_.f_tupo_show_probability = _loc4_.@tupo_show_probability;
            _loc3_.f_zhufu_max = _loc4_.@zhufu_max;
            _loc3_.f_food_goodsid = _loc4_.@food_goodsid;
            _loc3_.f_food_map = _loc4_.food_map;
            _loc3_.f_food_monstername = _loc4_.food_monstername;
            _loc3_.f_location = _loc4_.@location;
            _loc3_.f_desc2 = _loc4_.desc2;
            liantiResContainer[_loc3_.f_id] = _loc3_;
         }
      }
      
      public static function getLiantiRes(param1:int) : BaGuaZhangRes
      {
         return liantiResContainer[param1];
      }
      
      public static function getLiantiMainDes(param1:int) : String
      {
         var _loc2_:BaGuaZhangRes = getLiantiRes(param1);
         if(_loc2_ == null)
         {
            return "";
         }
         var _loc3_:GoodsRes = GoodsResManager.getGoodsRes(_loc2_.f_food_goodsid);
         var _loc4_:String = "<u><font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\'event:goodsID#" + _loc3_.id_kind + "\'>【" + _loc3_.name + "】</a></font></u>";
         return "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + nameArr[param1 - 1] + "：</font>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + _loc2_.f_name + "</font><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您可以学习") + "</font>" + _loc4_ + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("来增加人物属性") + "</font>";
      }
   }
}

