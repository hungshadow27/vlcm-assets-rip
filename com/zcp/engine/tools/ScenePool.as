package com.zcp.engine.tools
{
   import com.zcp.common.pool.Pool;
   import com.zcp.manager.PoolManager;
   
   public class ScenePool
   {
      
      public static var sceneCharacterPool:Pool = PoolManager.creatPool("sceneCharacterPool",100);
      
      public static var avatarPool:Pool = PoolManager.creatPool("avatarPool",100);
      
      public static var avatarPartPool:Pool = PoolManager.creatPool("avatarPartPool",200);
      
      public static var attackFacePool:Pool = PoolManager.creatPool("attackFacePool",200);
      
      public static var headFacePool:Pool = PoolManager.creatPool("headFacePool",200);
      
      public function ScenePool()
      {
         super();
      }
   }
}

