package com.tgame.common.vo.character.info
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.McBaseItem;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class GoodsInfo
   {
      
      public static const pageCount:int = 30;
      
      public var isLocked:Boolean = false;
      
      public var goodsBagKuaArr:Array;
      
      public var goodsBagArr:Array;
      
      public var goodsBagKuaJiangliArr:Array;
      
      public var goodsDepotArr:Array;
      
      public var goodsBodyArr:Array;
      
      public var goodsBodyDict:Dictionary;
      
      public var goodsRideArr:Array;
      
      public var goodsWalkShopArr:Array;
      
      public var goodsTradingNpcArr:Array;
      
      public var goodsTradingPlayerArr:Array;
      
      public var goodsMailArr:Array;
      
      public var goodsRepairArr:Array;
      
      public var goodsStrengtheningArr:Array;
      
      public var goodsZhanhundaiArr:Array;
      
      public var goodsMeirenArr:Array;
      
      public var YNsbtrArr:Array;
      
      public var guiHunArr:Array;
      
      public var goodsOfQuickBar:Array = [];
      
      public var skillsOfQuickBar:Array = [];
      
      public function GoodsInfo()
      {
         super();
         this.init([]);
      }
      
      public function get fullGoodsArr() : Array
      {
         return this.goodsBagArr.concat(this.goodsTradingNpcArr).concat(this.goodsTradingPlayerArr).concat(this.goodsMailArr).concat(this.goodsRepairArr).concat(this.goodsStrengtheningArr).concat(this.goodsDepotArr).concat(this.goodsWalkShopArr).concat(this.goodsBodyArr).concat(this.goodsBagKuaArr).concat(this.goodsBagKuaJiangliArr).concat(this.guiHunArr);
      }
      
      public function init(param1:Array) : void
      {
         if(!param1)
         {
            return;
         }
         this.goodsBagArr = param1;
         this.goodsTradingNpcArr = [];
         this.goodsTradingPlayerArr = [];
         this.goodsMailArr = [];
         this.goodsRepairArr = [];
         this.goodsStrengtheningArr = [];
         this.goodsDepotArr = [];
         this.goodsWalkShopArr = [];
         this.goodsBodyArr = [];
         this.goodsBodyDict = new Dictionary();
         this.goodsRideArr = [];
         this.goodsBagKuaArr = [];
         this.goodsZhanhundaiArr = [];
         this.goodsBagKuaJiangliArr = [];
         this.goodsMeirenArr = [];
         this.YNsbtrArr = [];
         this.guiHunArr = [];
      }
      
      public function getGoodsByPosition(param1:int) : Goods
      {
         var _loc3_:Goods = null;
         var _loc2_:Array = this.fullGoodsArr;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.position == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getMcByPosition(param1:int) : McBaseItem
      {
         var _loc3_:McBaseItem = null;
         var _loc2_:Array = this.fullGoodsArr;
         for each(_loc3_ in this.goodsZhanhundaiArr)
         {
            if(_loc3_.position == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getGoodsByQuickbarindex(param1:int) : Array
      {
         var _loc4_:Goods = null;
         var _loc2_:Array = [];
         var _loc3_:Array = this.fullGoodsArr;
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.quickbarindex == param1)
            {
               _loc2_.push(_loc4_);
            }
         }
         return _loc2_;
      }
      
      public function getGoodsNumByID(param1:int, param2:Boolean = false) : int
      {
         var _loc5_:Goods = null;
         var _loc3_:int = 0;
         var _loc4_:Array = param2 ? this.goodsBagArr : this.fullGoodsArr;
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.id == param1)
            {
               _loc3_ += _loc5_.count;
            }
         }
         return _loc3_;
      }
      
      public function getGoodsArrByID(param1:int, param2:Boolean = false) : Array
      {
         var _loc5_:Goods = null;
         var _loc3_:Array = [];
         var _loc4_:Array = param2 ? this.goodsBagArr : this.fullGoodsArr;
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.id == param1)
            {
               _loc3_.push(_loc5_);
            }
         }
         return _loc3_;
      }
      
      public function getFaceGoodsByID(param1:int, param2:Boolean = false, param3:Boolean = true, param4:int = 0) : Goods
      {
         var _loc5_:Goods = null;
         var _loc7_:Goods = null;
         if(param3)
         {
            _loc5_ = new Goods(param1);
            _loc5_.count = 0;
         }
         var _loc6_:Array = param2 ? this.goodsBagArr : this.fullGoodsArr;
         for each(_loc7_ in _loc6_)
         {
            if(_loc7_.id == param1)
            {
               if(_loc5_ == null)
               {
                  _loc5_ = new Goods(param1);
                  _loc5_.count = _loc7_.count;
               }
               else if(_loc7_.bind == 1 && (param4 == 1 || param4 == 0))
               {
                  _loc5_.count += _loc7_.count;
               }
               else if(_loc7_.bind == 0 && (param4 == 2 || param4 == 0))
               {
                  _loc5_.count += _loc7_.count;
               }
               else if(param4 == 0)
               {
                  _loc5_.count += _loc7_.count;
               }
            }
         }
         return _loc5_;
      }
      
      public function getBangDingFaceGoodsByID(param1:int, param2:Boolean, param3:Boolean = false) : Goods
      {
         var _loc4_:Goods = null;
         var _loc6_:Goods = null;
         _loc4_ = new Goods(param1);
         _loc4_.count = 0;
         var _loc5_:Array = param3 ? this.goodsBagArr : this.fullGoodsArr;
         for each(_loc6_ in _loc5_)
         {
            if(_loc6_.id == param1 && _loc6_.bind == param2 ? Boolean(1) : Boolean(0))
            {
               if(_loc4_ == null)
               {
                  _loc4_ = new Goods(param1);
                  _loc4_.count = _loc6_.count;
               }
               else
               {
                  _loc4_.count += _loc6_.count;
               }
            }
         }
         return _loc4_;
      }
      
      public function addGoods_batch(param1:Array) : void
      {
         var _loc2_:Goods = null;
         if(!param1)
         {
            return;
         }
         for each(_loc2_ in param1)
         {
            this.addGoods(_loc2_);
         }
      }
      
      public function updateGoods_batch(param1:Array) : void
      {
         var _loc2_:Goods = null;
         if(!param1)
         {
            return;
         }
         for each(_loc2_ in param1)
         {
            this.updateGoods(_loc2_);
         }
      }
      
      public function updateGoodsNumByPosition_batch(param1:Array) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!param1)
         {
            return;
         }
         for each(_loc2_ in param1)
         {
            _loc3_ = int(_loc2_[0]);
            _loc4_ = int(_loc2_[1]);
            this.updateGoodsNumByPosition(_loc3_,_loc4_);
         }
      }
      
      public function deleteGoodsByPosition_batch(param1:Array) : void
      {
         var _loc2_:int = 0;
         if(!param1)
         {
            return;
         }
         for each(_loc2_ in param1)
         {
            this.deleteGoodsByPosition(_loc2_);
         }
      }
      
      public function addGoods(param1:Goods) : void
      {
         var _loc3_:Goods = null;
         var _loc2_:Array = this.fullGoodsArr;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.position == param1.position)
            {
               if(_loc3_.id == param1.id)
               {
                  _loc3_.count += param1.count;
               }
               return;
            }
         }
         this.goodsBagArr.push(param1);
      }
      
      public function updateGoods(param1:Goods) : void
      {
         var _loc3_:Goods = null;
         var _loc2_:Array = this.fullGoodsArr;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.position == param1.position)
            {
               if(param1.count <= 0)
               {
                  this.deleteGoodsByPosition(param1.position);
               }
               else if(_loc3_.id == param1.id)
               {
                  _loc3_.count = param1.count;
               }
               else
               {
                  this.deleteGoodsByPosition(param1.position);
                  this.goodsBagArr.push(param1);
               }
               return;
            }
         }
         if(param1.count > 0)
         {
            this.goodsBagArr.push(param1);
         }
      }
      
      public function updateGoodsNumByPosition(param1:int, param2:int) : void
      {
         var _loc4_:Goods = null;
         var _loc3_:Array = this.fullGoodsArr;
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.position == param1)
            {
               if(param2 <= 0)
               {
                  this.deleteGoodsByPosition(param1);
               }
               else
               {
                  _loc4_.count = param2;
               }
               return;
            }
         }
      }
      
      public function deleteGoods(param1:*) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = this.goodsBagArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsTradingNpcArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsTradingPlayerArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsMailArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsRepairArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsStrengtheningArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsDepotArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsWalkShopArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsBodyArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               delete this.goodsBodyDict[param1.res.position];
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsRideArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsBagKuaArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsZhanhundaiArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsBagKuaJiangliArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsMeirenArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
      }
      
      public function deleteGoodsByPosition(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = this.goodsBagArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsTradingNpcArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsTradingPlayerArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsMailArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsRepairArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsStrengtheningArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsDepotArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsWalkShopArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsBodyArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               delete this.goodsBodyDict[param1];
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsRideArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsBagKuaArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsZhanhundaiArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as McBaseItem).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsBagKuaJiangliArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
         _loc2_ = this.goodsMeirenArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
      }
      
      public function pageBag(param1:int) : Array
      {
         var _loc7_:Goods = null;
         this.goodsBagArr.sortOn("position",Array.NUMERIC);
         var _loc2_:Array = [];
         var _loc3_:int = param1 * pageCount + ItemPositionRange.GOODS_IN_BAG_RANGE.x;
         var _loc4_:int = _loc3_ + pageCount;
         var _loc5_:int = int(this.goodsBagArr.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = this.goodsBagArr[_loc6_];
            if(_loc7_.position >= _loc3_)
            {
               if(_loc7_.position >= _loc4_)
               {
                  break;
               }
               _loc2_.push(_loc7_);
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      public function pageDepot(param1:int) : Array
      {
         var _loc7_:Goods = null;
         this.goodsDepotArr.sortOn("position",Array.NUMERIC);
         var _loc2_:Array = [];
         var _loc3_:int = param1 * pageCount + ItemPositionRange.GOODS_IN_STORAGE_RANGE.x;
         var _loc4_:int = _loc3_ + pageCount;
         var _loc5_:int = int(this.goodsDepotArr.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = this.goodsDepotArr[_loc6_];
            if(_loc7_.position >= _loc3_)
            {
               if(_loc7_.position >= _loc4_)
               {
                  break;
               }
               _loc2_.push(_loc7_);
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      public function findDrugGoods(param1:int) : Array
      {
         var _loc4_:Goods = null;
         var _loc2_:Array = [];
         var _loc3_:Array = this.fullGoodsArr;
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.res.kind == GoodsKind.K3 && _loc4_.res.drug_kind == param1 && !this.checkHas(_loc4_.id,_loc2_))
            {
               _loc2_.push(_loc4_);
            }
         }
         return _loc2_;
      }
      
      public function findBackpackDurabilityIsZoreGoods() : Array
      {
         var _loc3_:Goods = null;
         var _loc1_:Array = [];
         var _loc2_:Array = this.goodsBagArr;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.res.kind == GoodsKind.K2 && _loc3_.curr_durability == 0)
            {
               _loc1_.push(_loc3_);
            }
         }
         return _loc1_;
      }
      
      public function findBodyDurabilityIsZoreGoods() : Array
      {
         var _loc3_:Goods = null;
         var _loc1_:Array = [];
         var _loc2_:Array = this.goodsBodyArr;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.res.kind == GoodsKind.K2 && _loc3_.curr_durability == 0)
            {
               _loc1_.push(_loc3_);
            }
         }
         return _loc1_;
      }
      
      public function hasGoodsInBody(param1:int) : Goods
      {
         var _loc2_:Goods = null;
         for each(_loc2_ in this.goodsBodyArr)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function hasGoodsInBody200() : Boolean
      {
         var _loc2_:Goods = null;
         var _loc1_:Array = this.goodsBodyArr;
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_.res.limit_grade == 200)
            {
               return true;
            }
         }
         return false;
      }
      
      public function findDrugGoodsByBag(param1:int) : Array
      {
         var _loc4_:Goods = null;
         var _loc2_:Array = [];
         var _loc3_:Array = this.goodsBagArr;
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.res.kind == GoodsKind.K3 && _loc4_.res.drug_kind == param1 && !this.checkHas(_loc4_.id,_loc2_))
            {
               _loc2_.push(_loc4_);
            }
         }
         return _loc2_;
      }
      
      public function findGoodsByKind(param1:int) : Array
      {
         var _loc4_:Goods = null;
         var _loc2_:Array = this.fullGoodsArr;
         var _loc3_:Array = [];
         for each(_loc4_ in _loc2_)
         {
            if(_loc4_.res.kind == param1 && !this.checkHas(_loc4_.id,_loc3_))
            {
               _loc3_.push(_loc4_);
            }
         }
         return null;
      }
      
      private function checkHas(param1:int, param2:Array) : Boolean
      {
         var _loc3_:Goods = null;
         for each(_loc3_ in param2)
         {
            if(_loc3_.id == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function isBagFull() : Boolean
      {
         var _loc1_:AttributeInfo = GameInstance.mainCharData.attributeInfo;
         var _loc2_:GoodsInfo = GameInstance.mainCharData.goodsInfo;
         var _loc3_:int = _loc1_.bagCount * 30;
         if(_loc2_.goodsBagArr.length >= _loc3_)
         {
            return true;
         }
         return false;
      }
      
      public function get goodsBag_goodsKuafu() : Array
      {
         return this.goodsBagArr.concat(this.goodsBagKuaArr);
      }
      
      public function getGoodsByPosition_sbtr(param1:int) : Goods
      {
         var _loc3_:Goods = null;
         var _loc2_:Array = this.YNsbtrArr;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.position == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getGoodsByPosition_bag(param1:int) : Goods
      {
         var _loc3_:Goods = null;
         var _loc2_:Array = this.goodsBagArr;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.position == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getGoodsByPosition_Depot(param1:int) : Goods
      {
         var _loc3_:Goods = null;
         var _loc2_:Array = this.goodsDepotArr;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.position == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getGoodsByPosition_KuafuBag(param1:int) : Goods
      {
         var _loc3_:Goods = null;
         var _loc2_:Array = this.goodsBagKuaArr;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.position == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getGoodsByPosition_Body(param1:int) : Goods
      {
         var _loc3_:Goods = null;
         var _loc2_:Array = this.goodsBodyArr;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.position == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function deleteGoods_bag(param1:*) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = this.goodsBagArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
      }
      
      public function deleteGoods_Depot(param1:*) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = this.goodsDepotArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
      }
      
      public function deleteGoods_KuafuBag(param1:*) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = this.goodsBagKuaArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
      }
      
      public function deleteGoodsByPosition_Bag(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = this.goodsBagArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
      }
      
      public function deleteGoodsByPosition_Depot(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = this.goodsDepotArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
      }
      
      public function deleteGoodsByPosition_KuafuBag(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = this.goodsBagKuaArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
      }
      
      public function deleteGoodsByPosition_ZhanHunDai(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = this.goodsZhanhundaiArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
      }
      
      public function deleteGoodsByPosition_Body(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = this.goodsBodyArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
      }
      
      public function deleteGoodsByPosition_SBTR(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = this.YNsbtrArr;
         _loc3_ = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc2_[_loc4_] as Goods).position == param1)
            {
               _loc2_.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
      }
      
      public function findGoodsByYuanwu(param1:int) : Array
      {
         var _loc5_:Goods = null;
         var _loc6_:Array = null;
         var _loc2_:Array = this.findGoodsByYuanwuExp();
         var _loc3_:Array = this.goodsBagArr;
         var _loc4_:Array = [];
         if(_loc2_.length >= 5)
         {
            return _loc2_;
         }
         for each(_loc5_ in _loc3_)
         {
            if(_loc5_.res.kind == GoodsKind.K62 && !this.checkHas(_loc5_.id,_loc4_) && _loc5_.res.position == param1)
            {
               _loc6_ = this.getGoodsArrByID(_loc5_.id,true);
               if(_loc6_.length > 0)
               {
                  _loc4_ = _loc4_.concat(_loc6_);
               }
            }
         }
         _loc4_.sortOn("quality");
         return _loc2_.concat(_loc4_);
      }
      
      public function findGoodsByYuanwuExp() : Array
      {
         var _loc4_:Goods = null;
         var _loc5_:Array = null;
         var _loc1_:Array = [2922,2923,2924];
         var _loc2_:Array = this.goodsBagArr;
         var _loc3_:Array = [];
         for each(_loc4_ in _loc2_)
         {
            if(_loc1_.indexOf(_loc4_.id) >= 0)
            {
               if(_loc3_.indexOf(_loc4_) < 0)
               {
                  _loc5_ = this.getGoodsArrByID(_loc4_.id,true);
                  if(_loc5_.length > 0)
                  {
                     _loc3_ = _loc3_.concat(_loc5_);
                     _loc5_ = [];
                  }
               }
            }
         }
         _loc3_.sortOn("id");
         return _loc3_;
      }
      
      public function getNumInPoint(param1:Point) : int
      {
         var _loc6_:Goods = null;
         this.goodsBagArr.sortOn("position",Array.NUMERIC);
         var _loc2_:int = param1.x;
         var _loc3_:int = param1.y;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < this.goodsBagArr.length)
         {
            _loc6_ = this.goodsBagArr[_loc5_];
            if(_loc6_.position >= _loc2_ && _loc6_.position <= _loc3_)
            {
               _loc4_++;
            }
            else if(_loc6_.position > _loc3_)
            {
               break;
            }
            _loc5_++;
         }
         return _loc4_;
      }
   }
}

