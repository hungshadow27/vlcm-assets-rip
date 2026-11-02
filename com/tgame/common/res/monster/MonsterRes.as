package com.tgame.common.res.monster
{
   import com.tgame.common.res.BaseResID;
   
   public class MonsterRes extends BaseResID
   {
      
      public var name:String;
      
      public var headFaceStr:String = "";
      
      public var type:int;
      
      public var Hp_max:int;
      
      public var Mp_max:int;
      
      public var level:int;
      
      public var talks:Array;
      
      public function MonsterRes()
      {
         super();
      }
   }
}

