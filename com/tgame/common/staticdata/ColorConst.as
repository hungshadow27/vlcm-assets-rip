package com.tgame.common.staticdata
{
   public class ColorConst
   {
      
      public static const RED_NAME_COLOR:uint = 16711680;
      
      public static const MAINCHAR_NICK_NAME_COLOR:uint = 16776960;
      
      public static const MAINCHAR_TITLE_COLOR:uint = 4059383;
      
      public static const MAINCHAR_BANGHUI_COLOR:uint = 4059383;
      
      public static const PLAYER_SELECT_NICK_NAME_COLOR:uint = 16711680;
      
      public static const PLAYER_TEAM_NICK_NAME_COLOR:uint = 2003199;
      
      public static const PLAYER_PARTY_NICK_NAME_COLOR:uint = 65280;
      
      public static const PLAYER_NICK_NAME_COLOR:uint = 16777215;
      
      public static const PLAYER_TITLE_COLOR:uint = 4059383;
      
      public static const PLAYER_BANGHUI_COLOR:uint = 4059383;
      
      public static const NPC_NICK_NAME_COLOR:uint = 16777215;
      
      public static const NPC_INFO_COLOR:uint = 65280;
      
      public static const NPC_BELONG_COLOR:uint = 255;
      
      public static const MONSTER_NICK_NAME_LOW_COLOR2:uint = 8424071;
      
      public static const MONSTER_NICK_NAME_LOW_COLOR:uint = 16777215;
      
      public static const MONSTER_NICK_NAME_COLOR:uint = 51543;
      
      public static const MONSTER_NICK_NAME_HIGH_COLOR:uint = 16750866;
      
      public static const MONSTER_NICK_NAME_HIGH_COLOR2:uint = 16711680;
      
      public static const PET_NICK_NAME_COLOR:uint = 3987711;
      
      public static const MOUNT_NICK_NAME_COLOR:uint = 3987711;
      
      public static const GIRL_NICK_NAME_COLOR:uint = 3987711;
      
      public static const NPC_FRIEND_NICK_NAME_COLOR:uint = 3987711;
      
      public static const TRANSPORT_NICK_NAME_COLOR:uint = 16777215;
      
      public static const TRANSPORT_LEVEL_COLOR:uint = 16776960;
      
      public static const FRIEND_MONSTER_NAME_COLOR:uint = 65280;
      
      public static const ENEMY_MONSTER_NAME_COLOR:uint = 16711680;
      
      public static const BANGQI_NAME_COLOR:uint = 65280;
      
      public static const BANGQI_SUOSHU_COLOR:uint = 16777215;
      
      public static const YOULONGZHIREN_NAME_COLOR:uint = 65280;
      
      public static const HUNYAN7_NAME_COLOR:uint = 16777215;
      
      public static const SHENFU_NAME_COLOR:uint = 16777215;
      
      public static const CLT_SHOU_COLOR:uint = 28864;
      
      public static const CLT_GONG_COLOR:uint = 12582912;
      
      public static const CLT_ZHONG_COLOR:uint = 16750848;
      
      public static const LJT_CHIJIAN_COLOR:uint = 28864;
      
      public static const LJT_WEICHIJIAN_COLOR:uint = 12582912;
      
      public static const VS3V3_HUANG_COLOR:uint = 16776960;
      
      public static const VS3V3_LAN_COLOR:uint = 2003199;
      
      public static const NAMECOLOR_RED_COLOR:uint = 16711680;
      
      public static const NAMECOLOR_BLUE_COLOR:uint = 2003199;
      
      public function ColorConst()
      {
         super();
      }
      
      public static function tranStrTo16(param1:String) : uint
      {
         return parseInt(param1.replace("#","0x"));
      }
      
      public static function tran16ToStr(param1:uint) : String
      {
         return "#" + param1.toString(16);
      }
   }
}

