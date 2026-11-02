package com.tgame.common.res.task
{
   public class TaskTalk
   {
      
      public var talkType:int;
      
      public var talkNpc:int;
      
      public var talk:String;
      
      public function TaskTalk()
      {
         super();
      }
      
      public function getTalk(param1:Boolean = true) : String
      {
         var _loc2_:String = this.talk;
         var _loc3_:RegExp = new RegExp("{([^}]*?)/([^}]*?)}","g");
         if(param1)
         {
            _loc2_ = _loc2_.replace(_loc3_,"$1");
         }
         else
         {
            _loc2_ = _loc2_.replace(_loc3_,"$2");
         }
         return _loc2_;
      }
   }
}

