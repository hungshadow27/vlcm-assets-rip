package com.tgame.common.res.silingzhen
{
   public class SiLingZhenResManager
   {
      
      private static var siLingZhenObj:Object = {};
      
      public function SiLingZhenResManager()
      {
         super();
      }
      
      public static function parseRes(param1:Object) : void
      {
         var _loc3_:XML = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc3_ in _loc2_.lingzhens.lingzhen)
         {
            siLingZhenObj[String(_loc3_.@type) + "_" + String(_loc3_.@grade)] = {
               "zhenFaName":String(_loc3_.name),
               "btnid":int(_loc3_.@ico_swfid),
               "avatarid":int(_loc3_.@beast_swfid),
               "gongji":int(_loc3_.@attack),
               "fangyu":int(_loc3_.@defence),
               "hp":int(_loc3_.@maxhp),
               "hurtjianmian":int(_loc3_.@shjm),
               "hurtfantan":int(_loc3_.@shft),
               "hushifanyu":int(_loc3_.@hsfy),
               "gongjizhengqiang":int(_loc3_.@attack_add),
               "tupo_show_lv":int(_loc3_.@tupo_show_lv),
               "zhenqi":int(_loc3_.@zhenqi),
               "cailiao_num":int(_loc3_.@cailiao_num),
               "cailiao_id":int(_loc3_.@cailiao_id),
               "limit_zufu":int(_loc3_.@limit_zufu)
            };
         }
      }
      
      public static function getSiLingZhenData(param1:int, param2:int) : Object
      {
         if(siLingZhenObj[param1 + "_" + param2] == undefined || siLingZhenObj[param1 + "_" + param2] == null)
         {
            return {};
         }
         return siLingZhenObj[param1 + "_" + param2];
      }
   }
}

