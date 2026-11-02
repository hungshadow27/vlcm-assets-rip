package com.tgame.common.vo.character.info
{
   import com.tgame.common.res.jingmai.XueweiRes;
   import com.tgame.common.res.jingmai.XueweiResManager;
   import com.tgame.common.staticdata.OtherConst;
   
   public class JingmaiInfo
   {
      
      private var _jingmai:Object = {};
      
      private var _qiHaiSta:Object = {};
      
      public var isZhenlong:Boolean;
      
      public function JingmaiInfo()
      {
         super();
      }
      
      public function clear() : void
      {
         this._jingmai = {};
         this._qiHaiSta = {};
      }
      
      public function openXuewei(param1:int, param2:Boolean) : void
      {
         var _loc3_:XueweiRes = XueweiResManager.getXueweiRes(param1,param2);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = _loc3_.jingmaiID;
         this._jingmai[_loc4_] = param1;
      }
      
      public function getOpenedXueweiIDByJingmaiID(param1:int) : int
      {
         return this._jingmai.hasOwnProperty(param1) ? int(parseInt(this._jingmai[param1])) : -1;
      }
      
      public function openJingmai(param1:int) : void
      {
         this._jingmai[param1] = param1 * 100 + 1;
      }
      
      public function isXueweiOpened(param1:int) : Boolean
      {
         var _loc2_:int = Math.floor(param1 / 100);
         var _loc3_:int = this.getOpenedXueweiIDByJingmaiID(_loc2_);
         return _loc3_ >= param1;
      }
      
      public function isJingmaiOpened(param1:int) : Boolean
      {
         return this._jingmai.hasOwnProperty(param1) ? parseInt(this._jingmai[param1]) % 100 == 1 : false;
      }
      
      public function getOpenedJingmaiIDArr() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         _loc2_ = 1;
         while(_loc2_ <= OtherConst.MAX_JINGMAI)
         {
            if(this.isJingmaiOpened(_loc2_))
            {
               _loc1_.push(_loc2_);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function getOpenedJingmaiNum() : int
      {
         var _loc1_:int = int(this.getOpenedJingmaiIDArr().length);
         if(this.isZhenlong)
         {
            _loc1_ += OtherConst.MAX_JINGMAI;
         }
         return _loc1_;
      }
      
      public function getOpenedXueweiNum() : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         _loc2_ = 1;
         while(_loc2_ <= OtherConst.MAX_JINGMAI)
         {
            if(this.isJingmaiOpened(_loc2_))
            {
               _loc1_ += XueweiResManager.getJingmai_xueweiNum(_loc2_);
            }
            else
            {
               _loc3_ = this.getOpenedXueweiIDByJingmaiID(_loc2_);
               if(_loc3_ != -1)
               {
                  _loc1_ += _loc3_ % 100 - 1;
               }
            }
            _loc2_++;
         }
         if(this.isZhenlong)
         {
            _loc1_ += OtherConst.MAX_XUEWEI;
         }
         return _loc1_;
      }
      
      public function setQiHaiSta(param1:int, param2:int) : void
      {
         this._qiHaiSta[param1] = param2;
      }
      
      public function getQiHaiSta(param1:int) : Boolean
      {
         return this._qiHaiSta[param1] == 1;
      }
   }
}

