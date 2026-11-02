package com.tgame.common.staticdata
{
   import com.tgame.common.res.lan.LanResManager;
   
   public class DrugsKind
   {
      
      public static const HP:int = 1;
      
      public static const MP:int = 2;
      
      public static const SP:int = 3;
      
      public function DrugsKind()
      {
         super();
      }
      
      public static function getTypeName(param1:int, param2:int, param3:String = "") : String
      {
         var _loc4_:String = null;
         if(param2 >= 0)
         {
            _loc4_ = "" + param2;
         }
         else
         {
            param2 = -1 * param2;
            _loc4_ = "" + param2 + "%";
         }
         var _loc5_:String = param3;
         var _loc6_:String = "       ";
         switch(param1)
         {
            case 1:
               _loc5_ = LanResManager.getLanCommonTextWords("增加攻击力") + _loc6_ + _loc4_;
               break;
            case 2:
               _loc5_ = LanResManager.getLanCommonTextWords("增加防御力") + _loc6_ + _loc4_;
               break;
            case 3:
               _loc5_ = LanResManager.getLanCommonTextWords("增加暴击") + _loc6_ + _loc4_;
               break;
            case 4:
               _loc5_ = LanResManager.getLanCommonTextWords("增加闪避") + _loc6_ + _loc4_;
               break;
            case 5:
               _loc5_ = LanResManager.getLanCommonTextWords("增加攻击速度") + _loc6_ + _loc4_;
               break;
            case 6:
               _loc5_ = LanResManager.getLanCommonTextWords("增加移动速度") + _loc6_ + _loc4_;
               break;
            case 7:
               _loc5_ = LanResManager.getLanCommonTextWords("增加生命上限值") + _loc6_ + _loc4_;
               break;
            case 8:
               _loc5_ = LanResManager.getLanCommonTextWords("增加内力上限值") + _loc6_ + _loc4_;
               break;
            case 9:
               _loc5_ = LanResManager.getLanCommonTextWords("增加体力上限值") + _loc6_ + _loc4_;
               break;
            case 10:
               _loc5_ = LanResManager.getLanCommonTextWords("增加潜能点个数") + _loc6_ + _loc4_;
               break;
            case 11:
               _loc5_ = LanResManager.getLanCommonTextWords("增加等级") + _loc6_ + _loc4_;
               break;
            case 12:
               _loc5_ = LanResManager.getLanCommonTextWords("增加经验") + _loc6_ + _loc4_;
               break;
            case 13:
               _loc5_ = LanResManager.getLanCommonTextWords("增加坐骑经验") + _loc6_ + _loc4_;
               break;
            case 14:
               _loc5_ = LanResManager.getLanCommonTextWords("增加真气储量") + _loc6_ + _loc4_;
               break;
            case 15:
               _loc5_ = LanResManager.getLanCommonTextWords("增加战场声望") + _loc6_ + _loc4_;
               break;
            case 16:
               _loc5_ = LanResManager.getLanCommonTextWords("恢复生命值") + _loc6_ + _loc4_;
               break;
            case 17:
               _loc5_ = LanResManager.getLanCommonTextWords("恢复内力值") + _loc6_ + _loc4_;
               break;
            case 18:
               _loc5_ = LanResManager.getLanCommonTextWords("恢复体力值") + _loc6_ + _loc4_;
               break;
            case 19:
               _loc5_ = LanResManager.getLanCommonTextWords("恢复坐骑活力") + _loc6_ + _loc4_;
               break;
            case 20:
               _loc5_ = LanResManager.getLanCommonTextWords("解除全部负面状态") + _loc6_ + _loc4_;
               break;
            case 21:
               _loc5_ = LanResManager.getLanCommonTextWords("双倍经验获得") + _loc6_ + _loc4_;
               break;
            case 22:
               _loc5_ = LanResManager.getLanCommonTextWords("双倍真气储量获得") + _loc6_ + _loc4_;
               break;
            case 23:
               _loc5_ = LanResManager.getLanCommonTextWords("双倍坐骑经验获得") + _loc6_ + _loc4_;
               break;
            case 66:
               _loc5_ = LanResManager.getLanCommonTextWords("增加魔兽等级") + _loc6_ + _loc4_;
         }
         return _loc5_;
      }
   }
}

