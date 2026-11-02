package com.tgame.common.res.instance
{
   public class InstanceResManager
   {
      
      private static var instanceResContainer:Object = new Object();
      
      public function InstanceResManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc3_:InstanceRes = null;
         var _loc4_:XML = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc4_ in _loc2_.instances.instance)
         {
            _loc3_ = new InstanceRes();
            _loc3_.instance_model_id = _loc4_.@instance_model_id;
            _loc3_.instance_name = _loc4_.instance_name;
            _loc3_.instance_type = _loc4_.@instance_type;
            _loc3_.lifecycle = _loc4_.@lifecycle;
            _loc3_.population_high_limit = _loc4_.@population_high_limit;
            _loc3_.population_lower_limit = _loc4_.@population_lower_limit;
            _loc3_.level_high_limit = _loc4_.@level_high_limit;
            _loc3_.level_lower_limit = _loc4_.@level_lower_limit;
            _loc3_.open_time_limite = _loc4_.@open_time_limite;
            _loc3_.enable = _loc4_.@enable;
            _loc3_.enter_count_limite = _loc4_.@enter_count_limite;
            _loc3_.instanceOpenTimeDescrip = _loc4_.instanceOpenTimeDescrip;
            _loc3_.weekdayshow = _loc4_.@weekdayshow;
            _loc3_.groupsum = _loc4_.@groupsum;
            _loc3_.maxcount = _loc4_.@maxcount;
            _loc3_.descpt = _loc4_.descpt;
            _loc3_.rewardgrade = _loc4_.@rewardgrade;
            _loc3_.team_limite = _loc4_.@team_limite;
            _loc3_.task_limite = _loc4_.@task_limite;
            _loc3_.good_limite = _loc4_.@good_limite;
            _loc3_.revive = _loc4_.@revive;
            _loc3_.transNpcID = _loc4_.@transNpcID;
            instanceResContainer[_loc3_.instance_model_id] = _loc3_;
         }
      }
      
      public static function getInstanceRes(param1:int) : InstanceRes
      {
         return instanceResContainer[param1];
      }
      
      public static function getInstanceTotal() : Array
      {
         var _loc1_:String = null;
         var _loc2_:Array = [];
         for(_loc1_ in instanceResContainer)
         {
            if(instanceResContainer[_loc1_] is InstanceRes)
            {
               _loc2_.push(instanceResContainer[_loc1_]);
            }
         }
         return _loc2_;
      }
   }
}

