package com.zcp.engine.vo.avatar
{
   import com.zcp.manager.RslLoaderManager;
   import com.zcp.manager.TimerManager;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class AvatarImgData
   {
      
      private var _dir07654:BitmapData;
      
      private var _dir123:BitmapData;
      
      private var _isOldWay:Boolean;
      
      private var _dir123Dict:Dictionary;
      
      public var useNum:int;
      
      public function AvatarImgData(param1:AvatarPartStatus, param2:String, param3:Boolean)
      {
         var w07654:Number = NaN;
         var h07654:Number = NaN;
         var w123:Number = NaN;
         var h123:Number = NaN;
         var m:Matrix = null;
         var time:int = 0;
         var wantCreatList:Array = null;
         var a:int = 0;
         var creat123:Function = null;
         var a765:int = 0;
         var f:int = 0;
         var apd765:AvatarPartData = null;
         var key:String = null;
         var $aps:AvatarPartStatus = param1;
         var $key:String = param2;
         var $only1LogicAngel:Boolean = param3;
         super();
         this.useNum = 1;
         this._isOldWay = $aps.isOldWay;
         this._dir07654 = RslLoaderManager.getInstance($key,1,1);
         if(this._dir07654 != null)
         {
            if(!$only1LogicAngel)
            {
               if(this._isOldWay)
               {
                  w07654 = this._dir07654.width;
                  h07654 = this._dir07654.height;
                  w123 = w07654;
                  h123 = h07654 * 3 / 5;
                  m = new Matrix();
                  m.scale(-1,1);
                  m.translate(w123,-h07654 / 5);
                  this._dir123 = new BitmapData(w123,h123,true,0);
                  this._dir123.draw(this._dir07654,m,null,null,new Rectangle(0,0,w123,h123));
               }
               else
               {
                  creat123 = function():void
                  {
                     var _loc1_:Array = null;
                     var _loc2_:String = null;
                     var _loc3_:AvatarPartData = null;
                     var _loc4_:Number = NaN;
                     var _loc5_:Number = NaN;
                     var _loc6_:Matrix = null;
                     var _loc7_:BitmapData = null;
                     var _loc8_:int = 0;
                     while(wantCreatList.length > 0)
                     {
                        _loc1_ = wantCreatList.shift();
                        _loc2_ = _loc1_[0];
                        _loc3_ = _loc1_[1];
                        _loc4_ = _loc3_.width;
                        _loc5_ = _loc3_.height;
                        _loc6_ = new Matrix();
                        _loc6_.scale(-1,1);
                        _loc6_.translate(_loc3_.sx + _loc4_,-_loc3_.sy);
                        _loc7_ = new BitmapData(_loc4_,_loc5_,true,0);
                        _loc7_.draw(_dir07654,_loc6_,null,null,new Rectangle(0,0,_loc4_,_loc5_));
                        _dir123Dict[_loc2_] = _loc7_;
                        if(wantCreatList.length > 0)
                        {
                           _loc8_ = getTimer();
                           if(_loc8_ - time >= 5)
                           {
                              time = _loc8_;
                              TimerManager.createOneOffTimer(1,1,creat123);
                              break;
                           }
                        }
                     }
                  };
                  this._dir123Dict = new Dictionary();
                  time = getTimer();
                  wantCreatList = [];
                  a = 1;
                  while(a <= 3)
                  {
                     a765 = a;
                     if(a == 1)
                     {
                        a765 = 7;
                     }
                     else if(a == 2)
                     {
                        a765 = 6;
                     }
                     else if(a == 3)
                     {
                        a765 = 5;
                     }
                     f = 0;
                     while(f < $aps.frame)
                     {
                        apd765 = $aps.getAvatarPartData(a765,f);
                        if(apd765 != null)
                        {
                           key = a + "_" + f;
                           wantCreatList[wantCreatList.length] = [key,apd765];
                        }
                        f++;
                     }
                     a++;
                  }
                  creat123();
               }
            }
         }
      }
      
      public function getBitmapData(param1:int, param2:int) : BitmapData
      {
         var _loc3_:String = null;
         if(param1 == 0 || param1 >= 4)
         {
            return this._dir07654;
         }
         if(this._isOldWay)
         {
            return this._dir123;
         }
         _loc3_ = param1 + "_" + param2;
         if(this._dir123Dict != null && this._dir123Dict.hasOwnProperty(_loc3_))
         {
            return this._dir123Dict[_loc3_] as BitmapData;
         }
         return null;
      }
      
      public function dispose() : void
      {
         var _loc1_:String = null;
         var _loc2_:BitmapData = null;
         if(this._dir07654 != null)
         {
            this._dir07654.dispose();
            this._dir07654 = null;
         }
         if(this._dir123 != null)
         {
            this._dir123.dispose();
            this._dir123 = null;
         }
         if(this._dir123Dict != null)
         {
            for(_loc1_ in this._dir123Dict)
            {
               _loc2_ = this._dir123Dict[_loc1_];
               _loc2_.dispose();
               _loc2_ = null;
               delete this._dir123Dict[_loc1_];
            }
         }
      }
   }
}

