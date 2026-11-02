package com.tgame.common.res
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.loader.DobjLoadManager;
   import com.zcp.loader.loader.DobjLoader;
   import com.zcp.loader.vo.LoadData_new;
   import com.zcp.manager.LoaderManager;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.Dictionary;
   
   public class ResPathManager
   {
      
      private static var DEFAULT_BD:BitmapData;
      
      private static const PREFIX_ICO:String = "icon_";
      
      public static const PREFIX_MID:String = "mid";
      
      public static const PREFIX_MID_MOUNT:String = "midm";
      
      public static const PREFIX_MID_FEMALE:String = "midf";
      
      public static const PREFIX_EID:String = "eid";
      
      public static const PREFIX_MIDW:String = "midw";
      
      public static const PREFIX_MIDFW:String = "midfw";
      
      public static const PREFIX_SOUND:String = "sound_";
      
      public static const AVATAR_CLOTHES:String = "res/data/avatar/clothes/$.";
      
      public static const AVATAR_EFFECT:String = "res/data/avatar/effect/$.";
      
      public static const AVATAR_MAP_SLIPCOVER:String = "res/data/avatar/effect/eid$.";
      
      public static const AVATAR_BLANK:String = "res/data/avatar/effect/eid2501.";
      
      public static const AVATAR_BORN_1:String = "res/data/avatar/clothes/mid158.";
      
      public static const AVATAR_BORN_0:String = "res/data/avatar/clothes/mid151.";
      
      public static const AVATAR_BORN_ONMOUNT_1:String = "res/data/avatar/clothes/midm158.";
      
      public static const AVATAR_BORN_ONMOUNT_0:String = "res/data/avatar/clothes/midm151.";
      
      public static const AVATAR_BODY_TIP:String = "res/data/avatar/effect/eid2500.";
      
      public static const AVATAR_AUTO_FLY_MOUNT:String = "res/data/avatar/clothes/mid777833.";
      
      public static const AVATAR_SHADOW:String = "res/data/avatar/effect/eid2483.";
      
      public static const AVATAR_SELECT:String = "res/data/avatar/effect/eid2482.";
      
      public static const AVATAR_CURSOR_CLICK:String = "res/data/avatar/effect/eid2484.";
      
      public static const AVATAR_LEVEL_UP:String = "res/data/avatar/effect/eid2475.";
      
      public static const AVATAR_RELIVE:String = "res/data/avatar/effect/eid2475.";
      
      public static const AVATAR_BAOWU:String = "res/data/avatar/effect/eid2271.";
      
      public static const AVATAR_BAGUAZHANG:String = "res/data/avatar/effect/eid10355.";
      
      public static const ZHENLONGQI_HEI:String = "res/data/avatar/effect/eid10649.";
      
      public static const AVATAR_LUOYINGBINFEN_DELAY:String = "res/data/avatar/effect/eid10614.";
      
      public static const AVATAR_XUEWEI_DELAY:String = "res/data/avatar/effect/eid2880.";
      
      public static const AVATAR_XUEWEI_OPEN:String = "res/data/avatar/effect/eid2881.";
      
      public static const AVATAR_JINGMAI_OPEN:String = "res/data/avatar/effect/eid2881.";
      
      public static const AVATAR_JINGMAI_GUANTONG_1:String = "res/data/avatar/effect/eid2492.";
      
      public static const AVATAR_JINGMAI_GUANTONG_2:String = "res/data/avatar/effect/eid2493.";
      
      public static const AVATAR_JINGMAI_GUANTONG_3:String = "res/data/avatar/effect/eid2494.";
      
      public static const AVATAR_JINGMAI_GUANTONG_4:String = "res/data/avatar/effect/eid2495.";
      
      public static const AVATAR_JINGMAI_GUANTONG_5:String = "res/data/avatar/effect/eid2496.";
      
      public static const AVATAR_JINGMAI_GUANTONG_6:String = "res/data/avatar/effect/eid2497.";
      
      public static const AVATAR_JINGMAI_GUANTONG_7:String = "res/data/avatar/effect/eid2498.";
      
      public static const AVATAR_JINGMAI_GUANTONG_8:String = "res/data/avatar/effect/eid2499.";
      
      public static const AVATAR_JINGMAI_GUANTONG_9:String = "res/data/avatar/effect/eid2492.";
      
      public static const AVATAR_JINGMAI_GUANTONG_10:String = "res/data/avatar/effect/eid2493.";
      
      public static const AVATAR_JINGMAI_GUANTONG_11:String = "res/data/avatar/effect/eid2494.";
      
      public static const AVATAR_JINGMAI_GUANTONG_12:String = "res/data/avatar/effect/eid2495.";
      
      public static const AVATAR_JINGMAI_GUANTONG_13:String = "res/data/avatar/effect/eid2496.";
      
      public static const AVATAR_JINGMAI_GUANTONG_14:String = "res/data/avatar/effect/eid2497.";
      
      public static const AVATAR_JINGMAI_GUANTONG_15:String = "res/data/avatar/effect/eid2498.";
      
      public static const AVATAR_JINGMAI_GUANTONG_16:String = "res/data/avatar/effect/eid2499.";
      
      public static const AVATAR_JINGMAI_GUANTONG_20:String = "res/data/avatar/effect/eid10753.";
      
      public static const AVATAR_BAOSHI_OPEN:String = "res/data/avatar/effect/eid10365.";
      
      public static const AVATAR_MOUNT_ZHAOHUAN_ALL:String = "res/data/avatar/effect/eid10465.";
      
      public static const AVATAR_MOUNT_ZHAOHUAN_ONE:String = "res/data/avatar/effect/eid10464.";
      
      public static const AVATAR_SILINGZHEN_1:String = "res/data/avatar/effect/eid10339.";
      
      public static const AVATAR_SILINGZHEN_2:String = "res/data/avatar/effect/eid10340.";
      
      public static const AVATAR_SILINGZHEN_3:String = "res/data/avatar/effect/eid10341.";
      
      public static const AVATAR_SILINGZHEN_4:String = "res/data/avatar/effect/eid10342.";
      
      public static const AVATAR_SILINGZHEN_5:String = "res/data/avatar/effect/eid10694.";
      
      public static const AVATAR_SILINGZHEN_6:String = "res/data/avatar/effect/eid10695.";
      
      public static const AVATAR_SILINGZHEN_7:String = "res/data/avatar/effect/eid10696.";
      
      public static const AVATAR_SILINGZHEN_8:String = "res/data/avatar/effect/eid10697.";
      
      public static const AVATAR_SILINGZHEN_9:String = "res/data/avatar/effect/eid10757.";
      
      public static const AVATAR_SILINGZHEN_10:String = "res/data/avatar/effect/eid10782.";
      
      public static const AVATAR_SHENGSIFU_1:String = "res/data/avatar/effect/eid10580.";
      
      public static const AVATAR_SHENGSIFU_2:String = "res/data/avatar/effect/eid10579.";
      
      public static const AVATAR_SHENGSIFU_3:String = "res/data/avatar/effect/eid10581.";
      
      public static const AVATAR_ZHENLONGQI_BAI_1:String = "res/data/avatar/effect/eid10636.";
      
      public static const AVATAR_ZHENLONGQI_BAI_2:String = "res/data/avatar/effect/eid10637.";
      
      public static const AVATAR_ZHENLONGQI_BAI_3:String = "res/data/avatar/effect/eid10638.";
      
      public static const AVATAR_ZHENLONGQI_BAI_4:String = "res/data/avatar/effect/eid10639.";
      
      public static const AVATAR_ZHENLONGQI_BAI_5:String = "res/data/avatar/effect/eid10640.";
      
      public static const AVATAR_ZHENLONGQI_HEI_1:String = "res/data/avatar/effect/eid10641.";
      
      public static const AVATAR_ZHENLONGQI_HEI_2:String = "res/data/avatar/effect/eid10642.";
      
      public static const AVATAR_ZHENLONGQI_HEI_3:String = "res/data/avatar/effect/eid10643.";
      
      public static const AVATAR_ZHENLONGQI_HEI_4:String = "res/data/avatar/effect/eid10644.";
      
      public static const AVATAR_ZHENLONGQI_HEI_5:String = "res/data/avatar/effect/eid10645.";
      
      public static const AVATAR_XISUIJING_1:String = "res/data/avatar/effect/eid10685.";
      
      public static const AVATAR_XISUIJING_2:String = "res/data/avatar/effect/eid10686.";
      
      public static const AVATAR_XISUIJING_3:String = "res/data/avatar/effect/eid10687.";
      
      public static const AVATAR_XISUIJING_4:String = "res/data/avatar/effect/eid10688.";
      
      public static const AVATAR_WUCAIXIANZHEN_1:String = "res/data/avatar/effect/eid10606.";
      
      public static const AVATAR_WUCAIXIANZHEN_2:String = "res/data/avatar/effect/eid10607.";
      
      public static const AVATAR_WUCAIXIANZHEN_3:String = "res/data/avatar/effect/eid10608.";
      
      public static const AVATAR_WUCAIXIANZHEN_4:String = "res/data/avatar/effect/eid10609.";
      
      public static const AVATAR_WUCAIXIANZHEN_5:String = "res/data/avatar/effect/eid10610.";
      
      public static const YUENAN_CHUNJIEBIANPAO:String = "res/data/mc/YN2015chunjie/bianpao.";
      
      public static const AVATAR_LIAOSHANG:String = "res/data/avatar/effect/eid10311.";
      
      public static const AVATAR_BEILIAOSHANG:String = "res/data/avatar/effect/eid10312.";
      
      public static const AVATAR_MONSTER_JINGYING:String = "res/data/avatar/effect/eid2883.";
      
      public static const AVATAR_MONSTER_BOSS:String = "res/data/avatar/effect/eid2879.";
      
      public static const AVATAR_BOSS_DEATH_DELAY:String = "res/data/avatar/effect/eid2880.";
      
      public static const AVATAR_BOSS_DEATH_LIUSHI_DELAY:String = "res/data/avatar/effect/eid10424.";
      
      public static const AVATAR_BOSS_DEATH_CAISHEN_DELAY:String = "res/data/avatar/effect/eid10586.";
      
      public static const AVATAR_TELPORT:String = "res/data/avatar/effect/eid$.";
      
      public static const AVATAR_TELPORT_OPEND:String = "res/data/avatar/effect/eid2472.";
      
      public static const AVATAR_TELPORT_CLOSED:String = "res/data/avatar/effect/eid2473.";
      
      public static const AVATAR_TELPORT_FUBEN:String = "res/data/avatar/effect/eid2474.";
      
      public static const AVATAR_NPC_TASK_STATUS_1:String = "res/data/avatar/effect/eid2481.";
      
      public static const AVATAR_NPC_TASK_STATUS_2:String = "res/data/avatar/effect/eid2479.";
      
      public static const AVATAR_NPC_TASK_STATUS_3:String = "res/data/avatar/effect/eid2478.";
      
      public static const AVATAR_NPC_TASK_STATUS_4:String = "res/data/avatar/effect/eid2476.";
      
      public static const AVATAR_TASK_HANDIN:String = "res/data/avatar/effect/eid2759.";
      
      public static const AVATAR_JIADIAN:String = "res/data/avatar/effect/eid10117.";
      
      public static const AVATAR_LIANZHAN_SELF:String = "res/data/avatar/effect/eid10153.";
      
      public static const AVATAR_LIANZHAN_MONSTER:String = "res/data/avatar/effect/eid10155.";
      
      public static const AVATAR_LIANZHAN_BUFF:String = "res/data/avatar/effect/eid10160.";
      
      public static const buyu1:String = "res/data/avatar/effect/eid10617.";
      
      public static const buyu2:String = "res/data/avatar/effect/eid10616.";
      
      public static const AVATAR_BAG_COPPER_1:String = "res/data/avatar/effect/eid2828.";
      
      public static const AVATAR_BAG_COPPER_2:String = "res/data/avatar/effect/eid2829.";
      
      public static const AVATAR_BAG_COPPER_3:String = "res/data/avatar/effect/eid2830.";
      
      public static const ZHANHUNDAI_MC_PATH:String = "res/data/mc/zhanhun/";
      
      public static const AVATAR_PAODAN_NUPAO_DANDAO:String = "res/data/avatar/effect/eid10162.";
      
      public static const AVATAR_PAODAN_NUPAO_JIZHONG:String = "res/data/avatar/effect/eid10163.";
      
      public static const AVATAR_PAODAN_HUOPAO_DANDAO:String = "res/data/avatar/effect/eid10165.";
      
      public static const AVATAR_PAODAN_HUOPAO_JIZHONG:String = "res/data/avatar/effect/eid10164.";
      
      public static const MAP_CONFIG:String = "res/data/maps/$.";
      
      public static const MAP_SMALL:String = "res/smallMap/$.jpg";
      
      public static const MAP_ZONE_DIR:String = "res/data/map1/$/";
      
      public static const ICO_SMALL:String = "res/data/ico_jpg/icon_$.";
      
      public static const ICO_BIG:String = "res/data/ico_big/ico$.";
      
      public static const ZHANWEN_ITEM_TIP:String = "res/ui/zhanwen/$.";
      
      public static const SOUND_BG:String = "res/data/sound/bgsound$.mp3";
      
      public static const SOUND_MAINCHAR_WALK:int = 2447;
      
      public static const SOUND_MAINCHAR_WALK_ONMOUNT:int = 3325;
      
      public static const SOUND_MAINCHAR_HEART:int = 3218;
      
      public static const SOUND_PICKUP_MONEY:int = 3350;
      
      public static const SOUND_MAINCHAR_ATTACK_STRONG_1:int = 3339;
      
      public static const SOUND_MAINCHAR_ATTACK_STRONG_0:int = 3336;
      
      public static const SOUND_MAINCHAR_INJURED_1:int = 3337;
      
      public static const SOUND_MAINCHAR_INJURED_0:int = 3334;
      
      public static const SOUND_MAINCHAR_DEATH_1:int = 3338;
      
      public static const SOUND_MAINCHAR_DEATH_0:int = 3335;
      
      public static const SOUND_UI_OPEN:int = 3345;
      
      public static const SOUND_UI_CLOSE:int = 3344;
      
      public static const SOUND_UI_MONEY_COME:int = 3350;
      
      public static const SOUND_UI_MONEY_GO:int = 3347;
      
      public static const SOUND_UI_DRUG_USE:int = 3343;
      
      public static const SOUND_UI_EQUIP_REPAIR:int = 3348;
      
      public static const SOUND_UI_EQUIP_STRONG_SU:int = 3352;
      
      public static const SOUND_UI_EQUIP_STRONG_FA:int = 3351;
      
      public static const SOUND_UI_HECHENG_SU:int = 3346;
      
      public static const SOUND_UI_PEIDAI_WUQI_SU:int = 2460;
      
      public static const SOUND_UI_PEIDAI_HUJU_SU:int = 2461;
      
      public static const SOUND_UI_PEIDAI_SHIPIN_SU:int = 2462;
      
      public static const SOUND_UI_TUOXIA_ZHUANBEI_SU:int = 2467;
      
      public static const AVATAR_ZHUANSHENG_1:String = "res/data/avatar/effect/eid11462.";
      
      public static const AVATAR_ZHUANSHENG_2:String = "res/data/avatar/effect/eid11463.";
      
      public static const AVATAR_ZHUANSHENG_3:String = "res/data/avatar/effect/eid11464.";
      
      public static const AVATAR_ZHUANSHENG_4:String = "res/data/avatar/effect/eid11465.";
      
      public static const AVATAR_ZHUANSHENG_5:String = "res/data/avatar/effect/eid11466.";
      
      public static const AVATAR_ZHUANSHENG_6:String = "res/data/avatar/effect/eid11467.";
      
      public static const AVATAR_ZHUANSHENG_7:String = "res/data/avatar/effect/eid11468.";
      
      public static const AVATAR_ZHUANSHENG_8:String = "res/data/avatar/effect/eid11469.";
      
      private static var LOAD_ICO_LV:int = int.MAX_VALUE / 2;
      
      private static var ICO_CACH:Dictionary = new Dictionary();
      
      private static var MC_CACH:Object = new Object();
      
      private static var MAX_COUNT:int = 200;
      
      public function ResPathManager()
      {
         super();
      }
      
      public static function get eName_XML() : String
      {
         return GameConfig.decode == null ? "xml" : "tsze";
      }
      
      public static function get eName_SWF() : String
      {
         return GameConfig.decode == null ? "swf" : "tse";
      }
      
      public static function get highEffect_flower_list() : Array
      {
         var _loc1_:String = "higheffect.flower.f";
         return [_loc1_ + "1",_loc1_ + "2",_loc1_ + "3",_loc1_ + "4",_loc1_ + "5",_loc1_ + "6",_loc1_ + "7",_loc1_ + "8",_loc1_ + "9",_loc1_ + "10",_loc1_ + "11",_loc1_ + "13",_loc1_ + "14",_loc1_ + "16"];
      }
      
      public static function get highEffect_flower_path() : String
      {
         return GameConfig.fileBaseFolder + "res/data/higheffect/flower." + eName_SWF;
      }
      
      public static function get highEffect_fenFlower_path() : String
      {
         return GameConfig.fileBaseFolder + "res/data/higheffect/fenflower." + eName_SWF;
      }
      
      public static function get highEffect_fenFlower_list() : Array
      {
         var _loc1_:String = "higheffect.flower.f";
         return [_loc1_ + "1",_loc1_ + "2",_loc1_ + "3",_loc1_ + "4",_loc1_ + "5",_loc1_ + "6",_loc1_ + "7",_loc1_ + "8",_loc1_ + "9",_loc1_ + "10",_loc1_ + "11",_loc1_ + "12",_loc1_ + "13",_loc1_ + "14",_loc1_ + "15",_loc1_ + "16",_loc1_ + "17",_loc1_ + "18",_loc1_ + "19",_loc1_ + "20",_loc1_ + "21",_loc1_ + "22",_loc1_ + "23",_loc1_ + "24"];
      }
      
      public static function get flowerKuang_path() : Array
      {
         var _loc1_:String = GameConfig.fileBaseFolder + "res/ui/UIditu/qingrenjiexianhua/flowerKuang";
         return [_loc1_ + "1.png",_loc1_ + "2.png",_loc1_ + "3.png"];
      }
      
      public static function get highEffect_yuanbao_list() : Array
      {
         var _loc1_:String = "higheffect.yuanbao.f";
         return [_loc1_ + "1",_loc1_ + "2",_loc1_ + "3",_loc1_ + "4",_loc1_ + "5",_loc1_ + "6",_loc1_ + "7",_loc1_ + "8",_loc1_ + "9",_loc1_ + "10",_loc1_ + "11",_loc1_ + "12",_loc1_ + "13",_loc1_ + "14"];
      }
      
      public static function get highEffect_yuanbao_path() : String
      {
         return GameConfig.fileBaseFolder + "res/data/higheffect/yuanbao." + eName_SWF;
      }
      
      public static function get highEffect_shitou_list() : Array
      {
         var _loc1_:String = "higheffect.shitou.f";
         return [_loc1_ + "3",_loc1_ + "4",_loc1_ + "5",_loc1_ + "6",_loc1_ + "7",_loc1_ + "8",_loc1_ + "9",_loc1_ + "10",_loc1_ + "11",_loc1_ + "12",_loc1_ + "13"];
      }
      
      public static function get highEffect_shitou_path() : String
      {
         return GameConfig.fileBaseFolder + "res/data/higheffect/shitou." + eName_SWF;
      }
      
      public static function get highEffect_xuehua_list() : Array
      {
         var _loc1_:String = "higheffect.xuehua.f";
         return [_loc1_ + "1",_loc1_ + "2",_loc1_ + "3",_loc1_ + "4",_loc1_ + "5",_loc1_ + "6",_loc1_ + "7",_loc1_ + "8",_loc1_ + "9",_loc1_ + "10",_loc1_ + "11",_loc1_ + "12"];
      }
      
      public static function get highEffect_xuehua_path() : String
      {
         return GameConfig.fileBaseFolder + "res/data/higheffect/xuehua." + eName_SWF;
      }
      
      public static function get highEffect_fenYanhua_path() : String
      {
         return GameConfig.fileBaseFolder + "res/data/higheffect/fenflower." + eName_SWF;
      }
      
      public static function get highEffect_fenYanhua_list() : Array
      {
         var _loc1_:String = "higheffect.flower.f";
         return [_loc1_ + "1",_loc1_ + "2",_loc1_ + "3",_loc1_ + "4",_loc1_ + "5",_loc1_ + "6",_loc1_ + "7",_loc1_ + "8",_loc1_ + "9",_loc1_ + "10",_loc1_ + "11",_loc1_ + "12",_loc1_ + "13",_loc1_ + "14",_loc1_ + "15",_loc1_ + "16",_loc1_ + "17",_loc1_ + "18",_loc1_ + "19",_loc1_ + "20",_loc1_ + "21",_loc1_ + "22",_loc1_ + "23",_loc1_ + "24"];
      }
      
      public static function get YanhuaKuang_path() : Array
      {
         var _loc1_:String = GameConfig.fileBaseFolder + "res/ui/UIditu/qingrenjiexianhua/flowerKuang";
         return [_loc1_ + "1.png",_loc1_ + "2.png",_loc1_ + "3.png"];
      }
      
      private static function getICOClassName(param1:int) : String
      {
         return PREFIX_ICO + param1;
      }
      
      public static function getSoundClassName(param1:int) : String
      {
         return PREFIX_SOUND + param1;
      }
      
      public static function getClothesAvatarPackage(param1:int) : String
      {
         return PREFIX_MID + param1;
      }
      
      public static function getClothesAvatarPackage_feixing(param1:int) : String
      {
         return PREFIX_MIDW + param1;
      }
      
      public static function getClothesOnMountAvatarPackage(param1:int) : String
      {
         return PREFIX_MID_MOUNT + param1;
      }
      
      public static function getClothesOnMount_weapon_female_AvatarPackage(param1:int) : String
      {
         return PREFIX_MID_FEMALE + param1;
      }
      
      public static function getClothes_by_sexAndMount_AvatarPackage(param1:int, param2:Boolean, param3:int) : String
      {
         if(param1 == 1)
         {
            if(param2)
            {
               return PREFIX_MID + param3;
            }
            return PREFIX_MID + (param3 + 1);
         }
         if(param2)
         {
            return PREFIX_MID_FEMALE + param3;
         }
         return PREFIX_MID_FEMALE + (param3 + 1);
      }
      
      public static function getClothes_by_sexAndFeixing_AvatarPackage(param1:int, param2:int) : String
      {
         if(param1 == 1)
         {
            return PREFIX_MIDW + (param2 + 1);
         }
         return PREFIX_MIDFW + (param2 + 1);
      }
      
      public static function getEffectAvatarPackage(param1:int) : String
      {
         return PREFIX_EID + param1;
      }
      
      private static function getICOBitmapData(param1:int) : BitmapData
      {
         var _loc2_:String = getICOClassName(param1);
         return RslLoaderManager.getInstance(_loc2_,100,100);
      }
      
      public static function getSmallICO(param1:int, param2:int = 35, param3:int = 35) : Bitmap
      {
         var loadSmallMapComplete:Function;
         var huanchunId:String = null;
         var $bm:Bitmap = null;
         var url:String = null;
         var ld:LoadData_new = null;
         var $icoID:int = param1;
         var ICO_WIDTH:int = param2;
         var ICO_HEIGHT:int = param3;
         if(ICO_WIDTH == 65 && ICO_HEIGHT == 65 || ICO_WIDTH == 60 && ICO_HEIGHT == 60)
         {
            huanchunId = $icoID + "_d";
         }
         else
         {
            huanchunId = String($icoID);
         }
         if(DEFAULT_BD == null)
         {
            DEFAULT_BD = RslLoaderManager.getInstance("ui.item.0");
         }
         $bm = new Bitmap();
         $bm.bitmapData = DEFAULT_BD.clone();
         $bm.width = ICO_WIDTH;
         $bm.height = ICO_HEIGHT;
         if(ICO_CACH.hasOwnProperty(String(huanchunId)))
         {
            $bm.bitmapData = (ICO_CACH[String(huanchunId)] as BitmapData).clone();
            $bm.width = ICO_WIDTH;
            $bm.height = ICO_HEIGHT;
         }
         else
         {
            loadSmallMapComplete = function(param1:LoadData_new, param2:Event):void
            {
               var _loc3_:Bitmap = (param2.target as DobjLoader).content as Bitmap;
               if(_loc3_)
               {
                  if(!ICO_CACH.hasOwnProperty(String(huanchunId)))
                  {
                     ICO_CACH[String(huanchunId)] = _loc3_.bitmapData;
                  }
                  $bm.bitmapData = _loc3_.bitmapData.clone();
                  $bm.width = ICO_WIDTH;
                  $bm.height = ICO_HEIGHT;
               }
            };
            if(ICO_WIDTH == 65 && ICO_HEIGHT == 65 || ICO_WIDTH == 60 && ICO_HEIGHT == 60)
            {
               url = getBigICOPath($icoID);
            }
            else
            {
               url = getSmallICOPath($icoID);
            }
            ld = new LoadData_new(url,loadSmallMapComplete,null,null,"","",LOAD_ICO_LV,LoadData_new.LOADER_DISPLAYOBJECT);
            DobjLoadManager.load(ld);
         }
         return $bm;
      }
      
      public static function getSmallMc(param1:int, param2:Function) : Sprite
      {
         var o:Object;
         var _spr:Sprite = null;
         var _mc:MovieClip = null;
         var myCopy:MovieClip = null;
         var McId:String = null;
         var loadMc:Function = null;
         var item:Object = null;
         var $mcId:int = param1;
         var setMc:Function = param2;
         loadMc = function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            var _loc3_:MovieClip = _loc2_.content as MovieClip;
            var _loc4_:int = 0;
            while(_loc4_ < MC_CACH[String($mcId)].length)
            {
               if(MC_CACH[String($mcId)][_loc4_].name == McId)
               {
                  MC_CACH[String($mcId)][_loc4_].mc = _loc3_;
               }
               _loc4_++;
            }
            while(_spr.numChildren > 0)
            {
               _spr.removeChildAt(0);
            }
            _spr.addChild(_loc3_);
         };
         _spr = new Sprite();
         if(MC_CACH[String($mcId)] != null)
         {
            for each(item in MC_CACH[String($mcId)])
            {
               if(item.isShiyong == false)
               {
                  while(_spr.numChildren > 0)
                  {
                     _spr.removeChildAt(0);
                  }
                  _mc = item.mc;
                  _spr.addChild(_mc);
                  item.isShiyong = true;
                  setMc(item.name);
                  return _spr;
               }
            }
            LoaderManager.lazyLoad(loadMc,null,false,GameConfig.fileBaseFolder + ZHANHUNDAI_MC_PATH + $mcId + ".swf");
         }
         else
         {
            LoaderManager.lazyLoad(loadMc,null,false,GameConfig.fileBaseFolder + ZHANHUNDAI_MC_PATH + $mcId + ".swf");
         }
         _mc = StaticValue.getMCByClassName("ui.zhanhun.moren.mc") as MovieClip;
         _spr.addChild(_mc);
         if(!MC_CACH.hasOwnProperty(String($mcId)))
         {
            MC_CACH[String($mcId)] = new Array();
         }
         o = new Object();
         o.isShiyong = true;
         o.mc = _mc;
         o.name = String(MC_CACH[String($mcId)].length);
         McId = o.name;
         MC_CACH[String($mcId)].push(o);
         setMc(o.name);
         return _spr;
      }
      
      public static function shanchuMcShiyong(param1:int, param2:String) : void
      {
         var _loc3_:int = 0;
         if(MC_CACH.hasOwnProperty(String(param1)))
         {
            _loc3_ = 0;
            while(_loc3_ < MC_CACH[String(param1)].length)
            {
               if(MC_CACH[String(param1)][_loc3_].name == param2)
               {
                  MC_CACH[String(param1)][_loc3_].isShiyong = false;
               }
               _loc3_++;
            }
         }
      }
      
      private static function getSmallICOPath(param1:int, param2:String = "$") : String
      {
         var _loc3_:String = null;
         var _loc4_:RegExp = new RegExp("\\" + param2,"g");
         _loc3_ = ICO_SMALL.replace(_loc4_,param1);
         _loc3_ = GameConfig.fileBaseFolder + _loc3_;
         return _loc3_ + "jpg";
      }
      
      public static function getBigICOPath(param1:int, param2:String = "$") : String
      {
         var _loc3_:String = null;
         var _loc4_:RegExp = new RegExp("\\" + param2,"g");
         _loc3_ = ICO_BIG.replace(_loc4_,param1);
         _loc3_ = GameConfig.fileBaseFolder + _loc3_;
         return _loc3_ + "png";
      }
      
      public static function getZhanWenImg(param1:String, param2:String = "$") : String
      {
         var _loc3_:String = null;
         var _loc4_:RegExp = new RegExp("\\" + param2,"g");
         _loc3_ = ZHANWEN_ITEM_TIP.replace(_loc4_,param1);
         _loc3_ = GameConfig.fileBaseFolder + _loc3_;
         return _loc3_ + "png";
      }
      
      public static function getBgSoundPath(param1:int = 0, param2:String = "$") : String
      {
         var _loc3_:String = null;
         var _loc4_:RegExp = new RegExp("\\" + param2,"g");
         _loc3_ = SOUND_BG.replace(_loc4_,param1);
         return GameConfig.fileBaseFolder + _loc3_;
      }
      
      public static function getAvatarPath_Clothes(param1:String, param2:int = 0, param3:String = "$") : String
      {
         var _loc4_:String = null;
         var _loc5_:String = getClothesAvatarPackage(param2);
         var _loc6_:RegExp = new RegExp("\\" + param3,"g");
         _loc4_ = param1.replace(_loc6_,_loc5_);
         _loc4_ = GameConfig.fileBaseFolder + _loc4_;
         return _loc4_ + eName_SWF;
      }
      
      public static function getAvatarPath_ClothesOnMount(param1:String, param2:int = 0, param3:String = "$") : String
      {
         var _loc4_:String = null;
         var _loc5_:String = getClothesOnMountAvatarPackage(param2);
         var _loc6_:RegExp = new RegExp("\\" + param3,"g");
         _loc4_ = param1.replace(_loc6_,_loc5_);
         _loc4_ = GameConfig.fileBaseFolder + _loc4_;
         return _loc4_ + eName_SWF;
      }
      
      public static function getAvatarPath_ClothesOnMount_weapon_female(param1:String, param2:int = 0, param3:String = "$") : String
      {
         var _loc4_:String = null;
         var _loc5_:String = getClothesOnMount_weapon_female_AvatarPackage(param2);
         var _loc6_:RegExp = new RegExp("\\" + param3,"g");
         _loc4_ = param1.replace(_loc6_,_loc5_);
         _loc4_ = GameConfig.fileBaseFolder + _loc4_;
         return _loc4_ + eName_SWF;
      }
      
      public static function getAvatarPath_Clothes_by_sexAndMount(param1:int, param2:Boolean, param3:String, param4:int = 0, param5:String = "$") : String
      {
         var _loc6_:String = null;
         var _loc7_:String = getClothes_by_sexAndMount_AvatarPackage(param1,param2,param4);
         var _loc8_:RegExp = new RegExp("\\" + param5,"g");
         _loc6_ = param3.replace(_loc8_,_loc7_);
         _loc6_ = GameConfig.fileBaseFolder + _loc6_;
         return _loc6_ + eName_SWF;
      }
      
      public static function getAvatarPath_Clothes_feixing(param1:String, param2:int = 0, param3:String = "$") : String
      {
         var _loc4_:String = null;
         var _loc5_:String = getClothesAvatarPackage_feixing(param2);
         var _loc6_:RegExp = new RegExp("\\" + param3,"g");
         _loc4_ = param1.replace(_loc6_,_loc5_);
         _loc4_ = GameConfig.fileBaseFolder + _loc4_;
         return _loc4_ + eName_SWF;
      }
      
      public static function getAvatarPath_Clothes_by_sexAndFeixing(param1:int, param2:String, param3:int = 0, param4:String = "$") : String
      {
         var _loc5_:String = null;
         var _loc6_:String = getClothes_by_sexAndFeixing_AvatarPackage(param1,param3);
         var _loc7_:RegExp = new RegExp("\\" + param4,"g");
         _loc5_ = param2.replace(_loc7_,_loc6_);
         _loc5_ = GameConfig.fileBaseFolder + _loc5_;
         return _loc5_ + eName_SWF;
      }
      
      public static function getAvatarPath_Effect(param1:String, param2:int = 0, param3:String = "$") : String
      {
         var _loc4_:String = null;
         var _loc5_:String = getEffectAvatarPackage(param2);
         var _loc6_:RegExp = new RegExp("\\" + param3,"g");
         _loc4_ = param1.replace(_loc6_,_loc5_);
         _loc4_ = GameConfig.fileBaseFolder + _loc4_;
         return _loc4_ + eName_SWF;
      }
      
      public static function getAvatarPath_Others(param1:String, param2:int = 0, param3:String = "$") : String
      {
         var _loc4_:String = null;
         var _loc5_:String = String(param2);
         var _loc6_:RegExp = new RegExp("\\" + param3,"g");
         _loc4_ = param1.replace(_loc6_,_loc5_);
         _loc4_ = GameConfig.fileBaseFolder + _loc4_;
         return _loc4_ + eName_SWF;
      }
      
      public static function getProgramPath_SWF(param1:String, param2:String = "$program") : String
      {
         var _loc3_:String = null;
         var _loc4_:RegExp = new RegExp("\\" + param2,"g");
         _loc3_ = param1.replace(_loc4_,GameConfig.program);
         _loc3_ = GameConfig.fileBaseFolder + _loc3_;
         return _loc3_.replace(".swf","." + eName_SWF);
      }
      
      public static function getProgramPath_XML(param1:String, param2:String = "$program") : String
      {
         var _loc3_:String = null;
         var _loc4_:RegExp = new RegExp("\\" + param2,"g");
         _loc3_ = param1.replace(_loc4_,GameConfig.program);
         _loc3_ = GameConfig.fileBaseFolder + _loc3_;
         return _loc3_.replace(".xml","." + eName_XML);
      }
      
      public static function liPaoKuang_path(param1:int) : Array
      {
         var _loc2_:String = null;
         if(param1 == 1)
         {
            _loc2_ = GameConfig.fileBaseFolder + "res/data/mc/effect/lipao/1/";
            return [_loc2_ + "1.png"];
         }
         _loc2_ = GameConfig.fileBaseFolder + "res/data/mc/effect/lipao/2/";
         return [_loc2_ + "1.png",_loc2_ + "2.png"];
      }
   }
}

