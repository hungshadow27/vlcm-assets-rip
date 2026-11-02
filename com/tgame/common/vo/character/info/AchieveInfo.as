package com.tgame.common.vo.character.info
{
   import com.tgame.common.res.achieve.AchieveRes;
   import com.tgame.common.res.achieve.AchieveResManager;
   import com.tgame.common.vo.character.info.data.AchieveData;
   import flash.utils.Dictionary;
   
   public class AchieveInfo
   {
      
      private var _achieveDict:Dictionary = new Dictionary();
      
      private var _titleArr:Array = [];
      
      private var _currentTitle:String = "";
      
      public function AchieveInfo()
      {
         super();
      }
      
      public function hasAchieve(param1:int) : Boolean
      {
         return this.getAchieve(param1) != null;
      }
      
      public function getAchieve(param1:int) : AchieveData
      {
         return this._achieveDict[param1];
      }
      
      public function getKindAchieves(param1:int) : Array
      {
         var _loc3_:AchieveData = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this._achieveDict)
         {
            if(_loc3_.achieveRes != null)
            {
               if(_loc3_.achieveRes.kind == param1)
               {
                  _loc2_.push(_loc3_);
               }
            }
         }
         return _loc2_;
      }
      
      public function setKindAchieves(param1:Array) : void
      {
         var _loc2_:AchieveData = null;
         for each(_loc2_ in param1)
         {
            this._achieveDict[_loc2_.id] = _loc2_;
         }
      }
      
      public function getCurrentTitle() : String
      {
         return this._currentTitle;
      }
      
      public function setCurrentTitle(param1:int) : void
      {
         var _loc2_:AchieveRes = null;
         if(param1 <= 0)
         {
            this._currentTitle = "";
         }
         else
         {
            _loc2_ = AchieveResManager.getAchieveRes(param1);
            if(_loc2_ != null)
            {
               this._currentTitle = _loc2_.title;
            }
            else
            {
               this._currentTitle = "";
            }
         }
      }
      
      public function getTitles() : Array
      {
         return this._titleArr;
      }
      
      public function setTitles(param1:Array) : void
      {
         this._titleArr = param1;
      }
      
      public function addTitle(param1:int) : void
      {
         if(this._titleArr.indexOf(param1) != -1)
         {
            return;
         }
         this._titleArr.push(param1);
      }
   }
}

