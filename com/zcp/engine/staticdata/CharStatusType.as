package com.zcp.engine.staticdata
{
   public class CharStatusType
   {
      
      public static const STAND:String = "stand";
      
      public static const WALK:String = "walk";
      
      public static const JUMP:String = "jump";
      
      public static const SIT:String = "sit";
      
      public static const ATTACK:String = "attack";
      
      public static const MOUNT_ATTACK:String = "mount_attack";
      
      public static const INJURED:String = "injured";
      
      public static const DEATH:String = "death";
      
      public function CharStatusType()
      {
         super();
      }
      
      public static function isOnly1Repeat(param1:String) : Boolean
      {
         if(param1 == STAND || param1 == WALK || param1 == SIT)
         {
            return false;
         }
         return true;
      }
   }
}

