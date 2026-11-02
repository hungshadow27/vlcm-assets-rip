package com.tgame.common.res.npc
{
   import com.tgame.common.res.BaseResID;
   import com.zcp.common.utils.ZMath;
   
   public class NpcRes extends BaseResID
   {
      
      public var name:String;
      
      public var nickname:String;
      
      public var sceneid:int;
      
      public var x:int;
      
      public var y:int;
      
      public var findX:int;
      
      public var findY:int;
      
      public var direction:int;
      
      public var can_redirect:int;
      
      public var simpleTalk:Array;
      
      public var randomTalk:Array;
      
      public var npctype:int;
      
      public var shop_type:int;
      
      public var functions:Array;
      
      public var function_task:Array = [];
      
      public var function_shop:Array = [];
      
      public var function_transfer:Array = [];
      
      public var function_activity:Array = [];
      
      public function NpcRes()
      {
         super();
      }
      
      public function getOneNpcSimpleTalk(param1:Boolean = true) : String
      {
         var _loc2_:String = this.simpleTalk.length > 0 ? this.simpleTalk[ZMath.getRandomNumber(0,this.simpleTalk.length - 1)] : "";
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
      
      public function getOneNpcRandomTalk(param1:Boolean = true) : String
      {
         var _loc2_:String = this.randomTalk.length > 0 ? this.randomTalk[ZMath.getRandomNumber(0,this.randomTalk.length - 1)] : "";
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
      
      public function findNeedJump() : Boolean
      {
         return this.findX != this.x || this.findY != this.y;
      }
   }
}

