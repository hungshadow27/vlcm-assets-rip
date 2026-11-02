package com.tgame.common.res.sceneMonster
{
   public class SceneMonsterPointResManager
   {
      
      private static var sceneMonsterPointResContainer:Object = new Object();
      
      public function SceneMonsterPointResManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc3_:SceneMonsterPointRes = null;
         var _loc4_:XML = null;
         var _loc5_:MonsterPointRes = null;
         var _loc6_:XML = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc4_ in _loc2_.scene)
         {
            _loc3_ = new SceneMonsterPointRes();
            _loc3_.sceneId = int(Number(_loc4_.@id));
            _loc3_.monsterPoints = [];
            for each(_loc6_ in _loc4_.children())
            {
               _loc5_ = new MonsterPointRes();
               _loc5_.id = int(Number(_loc6_.@id));
               _loc5_.tileX = int(Number(_loc6_.@x));
               _loc5_.tileY = int(Number(_loc6_.@y));
               _loc3_.monsterPoints.push(_loc5_);
            }
            sceneMonsterPointResContainer[_loc3_.sceneId] = _loc3_;
         }
      }
      
      public static function getSceneMonsterPointRes(param1:int) : SceneMonsterPointRes
      {
         return sceneMonsterPointResContainer[param1];
      }
   }
}

