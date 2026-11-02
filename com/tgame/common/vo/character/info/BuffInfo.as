package com.tgame.common.vo.character.info
{
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.vo.item.Buff;
   
   public class BuffInfo
   {
      
      private var bottomBuffCount:int;
      
      public var lianzhaoBuffName:String = "";
      
      public var jingangFumojueBuffName:String = "";
      
      public var buffArr:Array = [];
      
      public var bottomBuffArr:Array = [];
      
      public function BuffInfo()
      {
         super();
      }
      
      public function getBuff(param1:int) : Buff
      {
         var _loc2_:Buff = null;
         for each(_loc2_ in this.buffArr)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function hasBuff(param1:int) : Boolean
      {
         return this.getBuff(param1) != null;
      }
      
      public function hasBuffOfType(param1:int) : Boolean
      {
         var _loc2_:Buff = null;
         for each(_loc2_ in this.buffArr)
         {
            if(_loc2_.res.type == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function addBuff(param1:Buff) : void
      {
         if(this.buffArr.indexOf(param1) == -1)
         {
            this.buffArr.push(param1);
         }
      }
      
      public function removeBuff(param1:int) : void
      {
         var _loc2_:Buff = null;
         var _loc3_:int = 0;
         for each(_loc2_ in this.buffArr)
         {
            if(_loc2_.id == param1)
            {
               _loc3_ = this.buffArr.indexOf(_loc2_);
               this.buffArr.splice(_loc3_,1);
               break;
            }
         }
      }
      
      public function removeAllBuff() : void
      {
         this.buffArr.length = 0;
      }
      
      public function getBuffType(param1:int) : Boolean
      {
         var _loc2_:Buff = null;
         for each(_loc2_ in this.buffArr)
         {
            if(_loc2_.res.type == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getBottomBuff() : Array
      {
         var _loc3_:Buff = null;
         var _loc1_:Array = [];
         var _loc2_:Buff = this.getBuff(6001);
         if(!_loc2_)
         {
            _loc1_.push(new Buff(6001));
         }
         _loc2_ = this.getBuff(6003);
         if(!_loc2_)
         {
            _loc1_.push(new Buff(6003));
         }
         _loc2_ = this.getBuff(4100);
         if(!_loc2_)
         {
            _loc1_.push(new Buff(4100));
         }
         _loc2_ = null;
         for each(_loc3_ in this.buffArr)
         {
            if(OtherConst.isBanghuiBuff(_loc3_.id))
            {
               _loc2_ = _loc3_;
            }
         }
         if(!_loc2_)
         {
            _loc1_.push(new Buff(3001));
         }
         _loc2_ = this.getBuff(4200);
         if(!_loc2_)
         {
            _loc1_.push(new Buff(4200));
         }
         if(this.bottomBuffCount != _loc1_.length)
         {
            this.bottomBuffCount = _loc1_.length;
            return _loc1_;
         }
         return null;
      }
   }
}

