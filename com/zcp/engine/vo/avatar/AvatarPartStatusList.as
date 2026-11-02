package com.zcp.engine.vo.avatar
{
   import flash.utils.Dictionary;
   
   public class AvatarPartStatusList
   {
      
      private var _apds_dict:Dictionary;
      
      public function AvatarPartStatusList(param1:String, param2:XML)
      {
         var _loc3_:XML = null;
         var _loc4_:AvatarPartStatus = null;
         super();
         this._apds_dict = new Dictionary();
         for each(_loc3_ in param2.children())
         {
            _loc4_ = new AvatarPartStatus(param1,_loc3_);
            this._apds_dict[_loc4_.type] = _loc4_;
         }
      }
      
      public function getAvatarPardStatus(param1:String) : AvatarPartStatus
      {
         if(this._apds_dict != null && this._apds_dict.hasOwnProperty(param1))
         {
            return this._apds_dict[param1] as AvatarPartStatus;
         }
         return null;
      }
   }
}

