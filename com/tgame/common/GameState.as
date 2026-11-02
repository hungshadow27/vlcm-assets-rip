package com.tgame.common
{
   import flash.utils.Dictionary;
   
   public class GameState
   {
      
      public static var loadThread1Complete:Boolean = false;
      
      public static var loadThread2Complete:Boolean = false;
      
      public static var hasSelectedChar:Boolean = false;
      
      public static var enterLineSucess:Boolean = false;
      
      public static var enterSceneSucess:Boolean = false;
      
      public static var fristEnterScene:Boolean = true;
      
      public static var switchServer:Boolean = false;
      
      public static var taskPlaneTabStatus:int = 0;
      
      public static var taskTrackerPlaneTabStatus:int = 1;
      
      public static var lastJumpTime:int = -1;
      
      public static var isFirst10108:Boolean = true;
      
      public static var enableHeartEffect:Boolean = false;
      
      public static var enableShuangxiuEffect:Boolean = false;
      
      public static var enableTishiMsg:Boolean = true;
      
      public static var xinshiDuihuan:int = 0;
      
      public static var gongneng101:Boolean = false;
      
      public static var gongneng102:Boolean = false;
      
      public static var gongneng103:Boolean = false;
      
      public static var gongneng104:Boolean = false;
      
      public static var gongneng105:Boolean = false;
      
      public static var gongneng106:Boolean = false;
      
      public static var gongneng107:Boolean = false;
      
      public static var gongneng108:Boolean = false;
      
      public static var gongneng109:Boolean = false;
      
      public static var gongneng110:Boolean = false;
      
      public static var gongneng111:Boolean = false;
      
      public static var gongneng112:Boolean = false;
      
      public static var gongneng113:Boolean = false;
      
      public static var gongneng114:Boolean = false;
      
      public static var gongneng150:Boolean = false;
      
      public static var gongneng151:Boolean = false;
      
      public static var gongneng152:Boolean = false;
      
      public static var gongneng153:Boolean = false;
      
      public static var gongneng154:Boolean = false;
      
      public static var gongneng155:Boolean = false;
      
      public static var gongneng156:Boolean = false;
      
      public static var gongneng157:Boolean = false;
      
      public static var gongneng158:Boolean = false;
      
      public static var gongneng159:Boolean = false;
      
      public static var gongneng160:Boolean = false;
      
      public static var gongneng161:Boolean = false;
      
      public static var gongneng162:Boolean = false;
      
      public static var gongneng163:Boolean = false;
      
      public static var gongneng164:Boolean = false;
      
      public static var gongneng165:Boolean = false;
      
      public static var gongneng166:Boolean = false;
      
      public static var gongneng1000:Boolean = false;
      
      public static var gongneng1001:Boolean = false;
      
      public static var tiaoguoBangzhu:Boolean = false;
      
      public static var gongneng2001:Boolean = false;
      
      public static var gongneng2002:Boolean = false;
      
      public static var gongneng2003:Boolean = false;
      
      public static var gongneng2004:Boolean = false;
      
      public static var gongneng2008:Boolean = false;
      
      public static var gongneng2009:Boolean = false;
      
      public static var gongneng2013:Boolean = false;
      
      public static var gongneng2014:Boolean = false;
      
      public static var gongneng2015:Boolean = false;
      
      public static var gongneng2016:Boolean = false;
      
      public static var gongneng2017:Boolean = false;
      
      public static var gongneng2018:Boolean = false;
      
      public static var gongneng2020:Boolean = false;
      
      public static var gongneng2019:Boolean = false;
      
      public static var gongneng2022:Boolean = false;
      
      public static var gongneng2023:Boolean = false;
      
      public static var gongneng2027:Boolean = false;
      
      public static var gongneng2024:Boolean = false;
      
      public static var gongneng2040:Boolean = false;
      
      public static var gongneng2026:Boolean = false;
      
      public static var gongneng2102:Boolean = false;
      
      public static var SPACE_TO_SKILL:Boolean = false;
      
      public static var dictMainStatus:Dictionary = new Dictionary();
      
      public static var dictTargetStatus:Dictionary = new Dictionary();
      
      public static var isMainCharChanged:Boolean = true;
      
      public static var xianJingDict:Dictionary = new Dictionary();
      
      public static var isDoubleFlyStatus:Boolean = false;
      
      public function GameState()
      {
         super();
      }
   }
}

