package com.zcp.manager
{
   import com.zcp.common.cd.CDFace;
   import com.zcp.common.cd.IItem;
   import com.zcp.common.cd.IItemFace;
   import com.zcp.common.pool.Pool;
   import flash.events.Event;
   
   public class CDFaceManager
   {
      
      private static var itemFaces:Array = [];
      
      private static var parentCDFaces:Array = [];
      
      private static var cdFacePool:Pool = PoolManager.creatPool("cdFacePool",100);
      
      public function CDFaceManager()
      {
         super();
         throw new Event("静态类");
      }
      
      public static function registerItemFace_batch(param1:Array) : void
      {
         var _loc3_:IItemFace = null;
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         var _loc2_:Boolean = false;
         for each(_loc3_ in param1)
         {
            if(itemFaces.indexOf(_loc3_) == -1)
            {
               itemFaces.push(_loc3_);
               _loc2_ = true;
            }
         }
         if(_loc2_)
         {
            updateCDFaces();
         }
      }
      
      public static function registerItemFace(param1:IItemFace) : void
      {
         if(itemFaces.indexOf(param1) != -1)
         {
            return;
         }
         itemFaces.push(param1);
         updateCDFaces();
      }
      
      public static function removeItemFace(param1:IItemFace) : void
      {
         var _loc3_:CDFace = null;
         var _loc4_:CDFace = null;
         var _loc2_:int = itemFaces.indexOf(param1);
         if(_loc2_ != -1)
         {
            itemFaces.splice(_loc2_,1);
            _loc3_ = param1.getCDFace();
            _loc4_ = _loc3_.parentCDFace;
            if(_loc4_ != null)
            {
               _loc4_.removeBindingChild(_loc3_);
            }
         }
      }
      
      public static function isCooling(param1:*) : Boolean
      {
         var _loc2_:CDFace = null;
         for each(_loc2_ in parentCDFaces)
         {
            if(_loc2_.userData.itemID == param1)
            {
               if(_loc2_.getLosttime() > 0)
               {
                  return true;
               }
               return false;
            }
         }
         return false;
      }
      
      public static function cdPlay(param1:*, param2:int, param3:int, param4:int = 0, param5:int = 0, param6:Array = null, param7:Array = null) : void
      {
         var _loc10_:IItemFace = null;
         var _loc11_:IItem = null;
         var _loc12_:CDFace = null;
         var _loc13_:* = undefined;
         if(param1 == null)
         {
            return;
         }
         var _loc8_:CDFace = cdFacePool.createObj(CDFace,1,1,cdComplete) as CDFace;
         _loc8_.userData = {
            "itemID":param1,
            "publicIncidence":[],
            "publicExceptItems":[param1]
         };
         var _loc9_:CDFace = cdFacePool.createObj(CDFace,1,1,cdComplete) as CDFace;
         _loc9_.userData = {
            "itemID":null,
            "publicIncidence":param6,
            "publicExceptItems":[param1]
         };
         for each(_loc10_ in itemFaces)
         {
            _loc11_ = _loc10_.getItem();
            _loc12_ = _loc10_.getCDFace();
            _loc13_ = _loc11_.getID();
            if(param2 > 0 && _loc13_ != null && _loc13_ == param1)
            {
               _loc8_.addBindingChild(_loc12_);
            }
            else if(param4 > 0 && (!param6 || param6.indexOf(_loc11_.getPublicCoolingtimeClass()) != -1) && (!param7 || param7.indexOf(_loc13_) == -1) && _loc12_.getLosttime() <= (param4 - param5) / 1000)
            {
               _loc9_.addBindingChild(_loc12_);
            }
         }
         if(param2 > 0 && _loc8_.userData.itemID != null)
         {
            cdStart(_loc8_,param2 / 1000,param3 / 1000,false);
         }
         if(param4 > 0 && (_loc9_.userData.publicIncidence == null || _loc9_.userData.publicIncidence.length > 0))
         {
            cdStart(_loc9_,param4 / 1000,param5 / 1000,true);
         }
      }
      
      private static function updateCDFaces() : void
      {
         var tempArr:Array;
         if(!parentCDFaces || parentCDFaces.length == 0)
         {
            return;
         }
         parentCDFaces.forEach(function(param1:*, param2:int, param3:Array):void
         {
            param1.stop(false);
         });
         tempArr = parentCDFaces;
         parentCDFaces = [];
         tempArr.forEach(function(param1:*, param2:int, param3:Array):void
         {
            cdPlay(param1.userData.itemID,param1.cd * 1000,param1.now * 1000,param1.cd * 1000,param1.now * 1000,param1.userData.publicIncidence,param1.userData.publicExceptItems);
            cdFacePool.disposeObj(param1);
         });
      }
      
      private static function cdStart(param1:CDFace, param2:Number, param3:Number = 0, param4:Boolean = false) : void
      {
         var _loc5_:* = 0;
         var _loc6_:CDFace = null;
         if(!param4)
         {
            _loc5_ = int(parentCDFaces.length);
            while(_loc5_-- > 0)
            {
               _loc6_ = parentCDFaces[_loc5_];
               if(_loc6_.userData.itemID == param1.userData.itemID)
               {
                  cdComplete(_loc6_);
               }
            }
         }
         if(parentCDFaces.indexOf(param1) == -1)
         {
            parentCDFaces.push(param1);
         }
         param1.play(param2,param3);
      }
      
      private static function cdComplete(param1:CDFace) : void
      {
         var _loc2_:int = parentCDFaces.indexOf(param1);
         if(_loc2_ != -1)
         {
            parentCDFaces.splice(_loc2_,1);
         }
         cdFacePool.disposeObj(param1);
      }
   }
}

