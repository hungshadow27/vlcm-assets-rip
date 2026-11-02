package com.zcp.engine.staticdata
{
   public class SceneCharacterType
   {
      
      public static const DUMMY:int = 0;
      
      public static const BAG:int = 11;
      
      public static const PLAYER:int = 1;
      
      public static const NPC_FRIEND:int = 4;
      
      public static const MOUNT:int = 3;
      
      public static const MONSTER:int = 2;
      
      public static const NPC:int = 6;
      
      public static const TRANSPORT:int = 7;
      
      public static const GIRL:int = 8;
      
      public static const FENSHEN:int = 9;
      
      private static const defautDepthArr:Array = [[BAG,-int.MAX_VALUE + 1],[TRANSPORT,-int.MAX_VALUE]];
      
      private static const defautLoadPriority:Array = [[DUMMY,1],[BAG,5],[PLAYER,8],[NPC_FRIEND,6],[MOUNT,7],[MONSTER,2],[NPC,3],[TRANSPORT,4],[GIRL,9],[FENSHEN,10]];
      
      public function SceneCharacterType()
      {
         super();
      }
      
      public static function getDefaultDepth(param1:int) : int
      {
         var _loc2_:Array = null;
         for each(_loc2_ in defautDepthArr)
         {
            if(_loc2_[0] == param1)
            {
               return _loc2_[1];
            }
         }
         return 0;
      }
      
      public static function getDefaultLoadPriority(param1:int) : int
      {
         var _loc2_:Array = null;
         for each(_loc2_ in defautLoadPriority)
         {
            if(_loc2_[0] == param1)
            {
               return _loc2_[1];
            }
         }
         return 0;
      }
   }
}

