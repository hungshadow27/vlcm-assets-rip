package com.tgame.common.res.JiuYangShenGong
{
   public class JiuYangShenGongManager
   {
      
      public static var jysgResContainer:Object = new Object();
      
      public function JiuYangShenGongManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc3_:XML = null;
         var _loc4_:JiuYangShenGongRes = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc3_ in _loc2_.jysgs.jysg)
         {
            _loc4_ = new JiuYangShenGongRes();
            _loc4_.id = _loc3_.@id;
            _loc4_.dzeffect_id = _loc3_.@dzeffect_id;
            _loc4_.degree = _loc3_.degree;
            _loc4_.degree_xj = _loc3_.degree_xj;
            _loc4_.rich_level = _loc3_.rich_level;
            _loc4_.sub_desc = _loc3_.sub_desc;
            _loc4_.name = _loc3_.name;
            _loc4_.main_desc = _loc3_.main_desc;
            _loc4_.ico = int(_loc3_.@ico_id) || 50000;
            jysgResContainer[_loc4_.id] = _loc4_;
         }
      }
      
      public static function getJiuYangShenGongRes(param1:String) : JiuYangShenGongRes
      {
         if(jysgResContainer.hasOwnProperty(param1))
         {
         }
         return jysgResContainer[param1] as JiuYangShenGongRes;
      }
   }
}

