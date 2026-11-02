package com.tgame.common.vo.character.info
{
   import com.tgame.common.res.shouji.ShoujiRes;
   import com.tgame.common.res.shouji.ShoujiResManager;
   import com.tgame.common.vo.character.info.data.CharShoujiData;
   import flash.utils.Dictionary;
   
   public class ShoujiInfo
   {
      
      public var shoujiDict:Dictionary;
      
      public function ShoujiInfo()
      {
         super();
      }
      
      public function init(param1:Array) : void
      {
         var _loc2_:CharShoujiData = null;
         var _loc3_:Object = null;
         var _loc4_:ShoujiRes = null;
         this.shoujiDict = new Dictionary();
         var _loc5_:Array = ShoujiResManager.getAllShoujiResArr();
         for each(_loc4_ in _loc5_)
         {
            _loc2_ = new CharShoujiData(_loc4_.id);
            _loc3_ = this.getObj(param1,_loc4_.id);
            if(_loc3_)
            {
               _loc2_.isComplete = _loc3_.isCom;
               if(_loc2_.isComplete == 1)
               {
                  _loc2_.targetGoods = _loc3_.arr;
               }
               else
               {
                  _loc2_.settargetGoodsStatic();
               }
            }
            else
            {
               _loc2_.isComplete = 1;
               _loc2_.settargetGoodsStatic();
            }
            _loc4_ = _loc2_.shoujiRes;
            if(this.shoujiDict.hasOwnProperty(_loc4_.grade))
            {
               this.shoujiDict[_loc4_.grade].push(_loc2_);
            }
            else
            {
               this.shoujiDict[_loc4_.grade] = [_loc2_];
            }
         }
      }
      
      private function getObj(param1:Array, param2:int) : Object
      {
         var _loc3_:Object = null;
         for each(_loc3_ in param1)
         {
            if(_loc3_.id == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function updateObj(param1:Object) : void
      {
         var _loc2_:CharShoujiData = this.getShouji(param1.id);
         _loc2_.isComplete = param1.isCom;
         if(_loc2_.isComplete == 1)
         {
            _loc2_.targetGoods = param1.arr;
         }
         else
         {
            _loc2_.settargetGoodsStatic();
         }
      }
      
      public function updateSuccess(param1:int) : void
      {
         var _loc2_:CharShoujiData = this.getShouji(param1);
         _loc2_.isComplete = 2;
      }
      
      public function getShouji(param1:int) : CharShoujiData
      {
         var _loc2_:Array = null;
         var _loc3_:CharShoujiData = null;
         loop0:
         for each(_loc2_ in this.shoujiDict)
         {
            var _loc6_:int = 0;
            var _loc7_:* = _loc2_;
            do
            {
               for each(_loc3_ in _loc7_)
               {
               }
               continue loop0;
            }
            while(_loc3_.id != param1);
            return _loc3_;
         }
         return null;
      }
      
      public function isEndShouji(param1:int) : Boolean
      {
         var _loc2_:CharShoujiData = this.getShouji(param1);
         if(_loc2_ == null || !_loc2_.isComplete)
         {
            return false;
         }
         return true;
      }
   }
}

