package com.tgame.common.vo.character.info.data
{
   import com.tgame.common.res.shouji.ShoujiRes;
   import com.tgame.common.res.shouji.ShoujiResManager;
   import com.tgame.common.res.task.vo.TaskTargetData;
   
   public class CharShoujiData
   {
      
      public var id:int;
      
      private var _targetGoods:Array;
      
      public var isComplete:int;
      
      public function CharShoujiData(param1:int)
      {
         super();
         this.id = param1;
         this._targetGoods = [];
         this.isComplete = 1;
      }
      
      public function get shoujiRes() : ShoujiRes
      {
         return ShoujiResManager.getShoujiRes(this.id);
      }
      
      public function set targetGoods(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc5_:TaskTargetData = null;
         var _loc6_:int = 0;
         var _loc3_:String = "";
         var _loc4_:int = int(param1.length);
         this._targetGoods = [];
         for each(_loc5_ in this.shoujiRes.targetGoods)
         {
            _loc6_ = this.getGoodTiJiaoCount(param1,_loc5_.id);
            if(_loc3_ != "")
            {
               _loc3_ += ",";
            }
            _loc3_ += _loc5_.id + "#" + _loc6_ + "#" + _loc5_.name + "#" + _loc5_.pos.toSplitString("_") + "#" + _loc5_.userData;
         }
         this._targetGoods = ShoujiResManager.getTargetGoodsArr(_loc3_);
      }
      
      private function getGoodTiJiaoCount(param1:Array, param2:int) : int
      {
         var _loc4_:int = 0;
         var _loc3_:int = int(param1.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(param1[_loc4_][0] == param2)
            {
               return param1[_loc4_][1];
            }
            _loc4_++;
         }
         return 0;
      }
      
      public function settargetGoodsStatic() : void
      {
         var _loc1_:TaskTargetData = null;
         var _loc3_:int = 0;
         this._targetGoods = [];
         var _loc2_:String = "";
         for each(_loc1_ in this.shoujiRes.targetGoods)
         {
            _loc3_ = 0;
            if(_loc2_ != "")
            {
               _loc2_ += ",";
            }
            _loc2_ += _loc1_.id + "#" + _loc3_ + "#" + _loc1_.name + "#" + _loc1_.pos.toSplitString("_") + "#" + _loc1_.userData;
         }
         this._targetGoods = ShoujiResManager.getTargetGoodsArr(_loc2_);
      }
      
      public function get targetGoods() : Array
      {
         return this._targetGoods;
      }
      
      public function getTargetGoods(param1:int) : TaskTargetData
      {
         var _loc3_:TaskTargetData = null;
         var _loc2_:Array = this.targetGoods;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.id == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getTargetProccess() : Array
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Array = this.targetGoods;
         for each(_loc2_ in _loc1_)
         {
            _loc3_ += _loc2_.count;
         }
         for each(_loc2_ in this.shoujiRes.targetGoods)
         {
            _loc4_ += _loc2_.count;
         }
         return [_loc3_,_loc4_];
      }
      
      public function readyTargetGoods(param1:int = -1) : Boolean
      {
         var _loc3_:TaskTargetData = null;
         var _loc4_:TaskTargetData = null;
         var _loc2_:ShoujiRes = this.shoujiRes;
         if(_loc2_.targetGoods.length == 0)
         {
            return true;
         }
         if(param1 != -1)
         {
            _loc3_ = _loc2_.getTargetGoods(param1);
            _loc4_ = this.getTargetGoods(param1);
            if(!_loc3_ || !_loc4_ || _loc4_.count < _loc3_.count)
            {
               return false;
            }
            return true;
         }
         for each(_loc3_ in _loc2_.targetGoods)
         {
            _loc4_ = this.getTargetGoods(_loc3_.id);
            if(!_loc4_ || _loc4_.count < _loc3_.count)
            {
               return false;
            }
         }
         return true;
      }
      
      public function nextTargetGoods() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:ShoujiRes = this.shoujiRes;
         for each(_loc2_ in _loc1_.targetGoods)
         {
            _loc3_ = this.getTargetGoods(_loc2_.id);
            if(!_loc3_ || _loc3_.count < _loc2_.count)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}

