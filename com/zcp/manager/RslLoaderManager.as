package com.zcp.manager
{
   import com.zcp.common.loader.RslLoader;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.common.loader.vo.RslLoadingInfo;
   import com.zcp.common.log.ZLog;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.system.ApplicationDomain;
   import flash.utils.*;
   
   public class RslLoaderManager
   {
      
      private static var waitLoadList:Array = [];
      
      private static var loaderList:Array = [];
      
      public static var MAX_THREAD:int = 10;
      
      public function RslLoaderManager()
      {
         super();
         throw new Error("Can not New!");
      }
      
      public static function getClass(param1:String) : Class
      {
         if(param1 == null || param1 == "")
         {
            return null;
         }
         if(ApplicationDomain.currentDomain.hasDefinition(param1))
         {
            return ApplicationDomain.currentDomain.getDefinition(param1) as Class;
         }
         ZLog.add("RslLoaderManager.getClass: 类“" + param1 + "”不存在");
         return null;
      }
      
      public static function getBDClass(param1:String) : Class
      {
         if(param1 == null || param1 == "")
         {
            return null;
         }
         if(ApplicationDomain.currentDomain.hasDefinition(param1))
         {
            return ApplicationDomain.currentDomain.getDefinition(param1) as Class;
         }
         return null;
      }
      
      public static function getInstance(param1:String, ... rest) : *
      {
         var _loc3_:Class = getClass(param1);
         return getInstanceByClass(_loc3_,rest);
      }
      
      public static function getInstanceByClass(param1:Class, param2:Array) : *
      {
         var _loc3_:* = undefined;
         if(param1 == null)
         {
            return null;
         }
         var _loc4_:int = param2 ? int(param2.length) : 0;
         switch(_loc4_)
         {
            case 0:
               _loc3_ = new param1();
               break;
            case 1:
               _loc3_ = new param1(param2[0]);
               break;
            case 2:
               _loc3_ = new param1(param2[0],param2[1]);
               break;
            case 3:
               _loc3_ = new param1(param2[0],param2[1],param2[2]);
               break;
            case 4:
               _loc3_ = new param1(param2[0],param2[1],param2[2],param2[3]);
               break;
            case 5:
               _loc3_ = new param1(param2[0],param2[1],param2[2],param2[3],param2[4]);
               break;
            case 6:
               _loc3_ = new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5]);
               break;
            case 7:
               _loc3_ = new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6]);
               break;
            case 8:
               _loc3_ = new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7]);
               break;
            case 9:
               _loc3_ = new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8]);
               break;
            case 10:
               _loc3_ = new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9]);
               break;
            case 11:
               _loc3_ = new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10]);
               break;
            case 12:
               _loc3_ = new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11]);
               break;
            case 13:
               _loc3_ = new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12]);
               break;
            case 14:
               _loc3_ = new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12],param2[13]);
               break;
            case 15:
               _loc3_ = new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12],param2[13],param2[14]);
         }
         return _loc3_;
      }
      
      public static function load(param1:Array, param2:Function = null, param3:int = 0) : void
      {
         if(!param1 || param1.length == 0)
         {
            if(param2 != null)
            {
               param2();
            }
            return;
         }
         param1.sortOn("priority",Array.DESCENDING | Array.NUMERIC);
         var _loc4_:RslLoadingInfo = new RslLoadingInfo(param1,param2,param3);
         var _loc5_:RslLoader = getFreeLoader(_loc4_.priority);
         if(_loc5_ != null)
         {
            _loc5_.rslLoadingInfo = _loc4_;
            loadNext(_loc5_);
         }
         else
         {
            waitLoadList.push(_loc4_);
            waitLoadList.sortOn("priority",Array.DESCENDING | Array.NUMERIC);
         }
      }
      
      public static function lazyLoad(param1:Function = null, param2:Function = null, ... rest) : void
      {
         var loadList:Array;
         var $callBack:Function = param1;
         var $decode:Function = param2;
         var str:Array = rest;
         if(!str || str.length == 0)
         {
            if($callBack != null)
            {
               $callBack();
            }
            return;
         }
         loadList = str.map(function(param1:*, param2:int, param3:Array):LoadData
         {
            return new LoadData(String(param1),null,null,null,"","",0,$decode);
         });
         load(loadList,$callBack);
      }
      
      public static function cancelLoadByUrl(param1:String) : void
      {
         var _loc4_:RslLoader = null;
         var _loc5_:RslLoadingInfo = null;
         var _loc6_:int = 0;
         var _loc7_:* = 0;
         var _loc8_:LoadData = null;
         var _loc9_:RslLoadingInfo = null;
         var _loc10_:int = 0;
         var _loc11_:* = 0;
         var _loc12_:LoadData = null;
         var _loc2_:int = int(waitLoadList.length);
         var _loc3_:* = int(_loc2_ - 1);
         while(_loc3_ >= 0)
         {
            _loc5_ = waitLoadList[_loc3_];
            _loc6_ = int(_loc5_.loadList.length);
            _loc7_ = int(_loc6_ - 1);
            while(_loc7_ >= 0)
            {
               _loc8_ = _loc5_.loadList[_loc7_];
               if(_loc8_.url == param1)
               {
                  _loc5_.loadList.splice(_loc7_,1);
               }
               _loc7_--;
            }
            if(_loc5_.loadList.length == 0)
            {
               waitLoadList.splice(_loc3_,1);
            }
            _loc3_--;
         }
         for each(_loc4_ in loaderList)
         {
            _loc9_ = _loc4_.rslLoadingInfo;
            if(_loc9_ != null && _loc9_.loadList.length > 0)
            {
               _loc10_ = int(_loc9_.loadList.length);
               _loc11_ = int(_loc10_ - 1);
               while(_loc11_ >= 0)
               {
                  _loc12_ = _loc9_.loadList[_loc11_];
                  if(_loc12_.url == param1)
                  {
                     _loc9_.loadList.splice(_loc11_,1);
                  }
                  _loc11_--;
               }
               if(_loc4_.isLoading)
               {
                  if(_loc4_.rslLoadData.url == param1)
                  {
                     _loc4_.stop();
                     loadNext(_loc4_);
                  }
               }
            }
         }
      }
      
      public static function cancelLoadByUrlCallBack(param1:Function) : void
      {
         var _loc4_:RslLoader = null;
         var _loc5_:RslLoadingInfo = null;
         var _loc6_:int = 0;
         var _loc7_:* = 0;
         var _loc8_:LoadData = null;
         var _loc9_:RslLoadingInfo = null;
         var _loc10_:int = 0;
         var _loc11_:* = 0;
         var _loc12_:LoadData = null;
         var _loc2_:int = int(waitLoadList.length);
         var _loc3_:* = int(_loc2_ - 1);
         while(_loc3_ >= 0)
         {
            _loc5_ = waitLoadList[_loc3_];
            _loc6_ = int(_loc5_.loadList.length);
            _loc7_ = int(_loc6_ - 1);
            while(_loc7_ >= 0)
            {
               _loc8_ = _loc5_.loadList[_loc7_];
               if(_loc8_.onComplete == param1)
               {
                  _loc5_.loadList.splice(_loc7_,1);
               }
               _loc7_--;
            }
            if(_loc5_.loadList.length == 0)
            {
               waitLoadList.splice(_loc3_,1);
            }
            _loc3_--;
         }
         for each(_loc4_ in loaderList)
         {
            _loc9_ = _loc4_.rslLoadingInfo;
            if(_loc9_ != null && _loc9_.loadList.length > 0)
            {
               _loc10_ = int(_loc9_.loadList.length);
               _loc11_ = int(_loc10_ - 1);
               while(_loc11_ >= 0)
               {
                  _loc12_ = _loc9_.loadList[_loc11_];
                  if(_loc12_.onComplete == param1)
                  {
                     _loc9_.loadList.splice(_loc11_,1);
                  }
                  _loc11_--;
               }
               if(_loc4_.isLoading)
               {
                  if(_loc4_.rslLoadData.onComplete == param1)
                  {
                     _loc4_.stop();
                     loadNext(_loc4_);
                  }
               }
            }
         }
      }
      
      public static function cancelLoadByUrlAndUrlCallBack(param1:String, param2:Function) : void
      {
         var _loc5_:RslLoader = null;
         var _loc6_:RslLoadingInfo = null;
         var _loc7_:int = 0;
         var _loc8_:* = 0;
         var _loc9_:LoadData = null;
         var _loc10_:RslLoadingInfo = null;
         var _loc11_:int = 0;
         var _loc12_:* = 0;
         var _loc13_:LoadData = null;
         var _loc3_:int = int(waitLoadList.length);
         var _loc4_:* = int(_loc3_ - 1);
         while(_loc4_ >= 0)
         {
            _loc6_ = waitLoadList[_loc4_];
            _loc7_ = int(_loc6_.loadList.length);
            _loc8_ = int(_loc7_ - 1);
            while(_loc8_ >= 0)
            {
               _loc9_ = _loc6_.loadList[_loc8_];
               if(_loc9_.url == param1 && _loc9_.onComplete == param2)
               {
                  _loc6_.loadList.splice(_loc8_,1);
               }
               _loc8_--;
            }
            if(_loc6_.loadList.length == 0)
            {
               waitLoadList.splice(_loc4_,1);
            }
            _loc4_--;
         }
         for each(_loc5_ in loaderList)
         {
            _loc10_ = _loc5_.rslLoadingInfo;
            if(_loc10_ != null && _loc10_.loadList.length > 0)
            {
               _loc11_ = int(_loc10_.loadList.length);
               _loc12_ = int(_loc11_ - 1);
               while(_loc12_ >= 0)
               {
                  _loc13_ = _loc10_.loadList[_loc12_];
                  if(_loc13_.url == param1 && _loc13_.onComplete == param2)
                  {
                     _loc10_.loadList.splice(_loc12_,1);
                  }
                  _loc12_--;
               }
               if(_loc5_.isLoading)
               {
                  if(_loc5_.rslLoadData.url == param1 && _loc5_.rslLoadData.onComplete == param2)
                  {
                     _loc5_.stop();
                     loadNext(_loc5_);
                  }
               }
            }
         }
      }
      
      public static function cancelLoadByGroupCallBack(param1:Function) : void
      {
         var _loc4_:RslLoader = null;
         var _loc5_:RslLoadingInfo = null;
         var _loc6_:RslLoadingInfo = null;
         var _loc2_:int = int(waitLoadList.length);
         var _loc3_:* = int(_loc2_ - 1);
         while(_loc3_ >= 0)
         {
            _loc5_ = waitLoadList[_loc3_];
            if(_loc5_.callBack == param1)
            {
               waitLoadList.splice(_loc3_,1);
            }
            _loc3_--;
         }
         for each(_loc4_ in loaderList)
         {
            _loc6_ = _loc4_.rslLoadingInfo;
            if(_loc6_ != null && _loc6_.callBack == param1)
            {
               _loc6_.loadList.length = 0;
               if(_loc4_.isLoading)
               {
                  _loc4_.stop();
                  loadNext(_loc4_);
               }
            }
         }
      }
      
      private static function getFreeLoader(param1:int = 0) : RslLoader
      {
         var _loc2_:RslLoader = null;
         var _loc3_:RslLoader = null;
         for each(_loc2_ in loaderList)
         {
            if(!_loc2_.isLocked && !_loc2_.isLoading)
            {
               if(_loc2_.rslLoadingInfo == null || _loc2_.rslLoadingInfo.loadList.length == 0)
               {
                  return _loc2_;
               }
            }
         }
         if(loaderList.length < MAX_THREAD)
         {
            _loc2_ = new RslLoader();
            loaderList.push(_loc2_);
            return _loc2_;
         }
         for each(_loc2_ in loaderList)
         {
            if(_loc3_ == null || _loc3_.rslLoadingInfo.priority > _loc2_.rslLoadingInfo.priority)
            {
               _loc3_ = _loc2_;
            }
         }
         if(_loc3_.rslLoadingInfo.priority < param1)
         {
            _loc3_.stop();
            waitLoadList.push(_loc3_.rslLoadingInfo);
            waitLoadList.sortOn("priority",Array.DESCENDING | Array.NUMERIC);
            return _loc3_;
         }
         return null;
      }
      
      private static function loadNext(param1:RslLoader) : void
      {
         var _loc3_:RslLoadingInfo = null;
         if(param1.isLoading)
         {
            return;
         }
         if(param1.rslLoadingInfo.loadList.length == 0)
         {
            param1.isLocked = true;
            if(param1.rslLoadingInfo.callBack != null)
            {
               param1.rslLoadingInfo.callBack();
            }
            param1.isLocked = false;
            if(waitLoadList.length > 0)
            {
               _loc3_ = waitLoadList.shift();
               param1.rslLoadingInfo = _loc3_;
               loadNext(param1);
            }
            return;
         }
         var _loc2_:LoadData = param1.rslLoadingInfo.loadList[0] as LoadData;
         initLoadEvent(param1);
         param1.load(_loc2_);
      }
      
      private static function initLoadEvent(param1:RslLoader) : void
      {
         param1.addEventListener(Event.COMPLETE,rslLoaderHandler);
         param1.addEventListener(ProgressEvent.PROGRESS,rslLoaderHandler);
         param1.addEventListener(IOErrorEvent.IO_ERROR,rslLoaderHandler);
         param1.addEventListener(SecurityErrorEvent.SECURITY_ERROR,rslLoaderHandler);
      }
      
      private static function removeLoadEvent(param1:RslLoader) : void
      {
         param1.removeEventListener(Event.COMPLETE,rslLoaderHandler);
         param1.removeEventListener(ProgressEvent.PROGRESS,rslLoaderHandler);
         param1.removeEventListener(IOErrorEvent.IO_ERROR,rslLoaderHandler);
         param1.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,rslLoaderHandler);
      }
      
      private static function rslLoaderHandler(param1:Event) : void
      {
         var _loc2_:RslLoader = param1.target as RslLoader;
         var _loc3_:LoadData = _loc2_.rslLoadingInfo.loadList[0];
         switch(param1.type)
         {
            case Event.COMPLETE:
               removeLoadEvent(_loc2_);
               _loc2_.rslLoadingInfo.loadList.shift();
               if(_loc3_.onComplete != null)
               {
                  _loc2_.isLocked = true;
                  _loc3_.onComplete(_loc3_,param1);
                  _loc2_.isLocked = false;
               }
               loadNext(_loc2_);
               break;
            case ProgressEvent.PROGRESS:
               if(_loc3_.onUpdate != null)
               {
                  _loc2_.isLocked = true;
                  _loc3_.onUpdate(_loc3_,param1);
                  _loc2_.isLocked = false;
               }
               break;
            case IOErrorEvent.IO_ERROR:
            case SecurityErrorEvent.SECURITY_ERROR:
               ZLog.add("RslLoaderManager: 加载" + _loc3_.url + "失败");
               removeLoadEvent(_loc2_);
               _loc2_.rslLoadingInfo.loadList.shift();
               if(_loc3_.onError != null)
               {
                  _loc2_.isLocked = true;
                  _loc3_.onError(_loc3_,param1);
                  _loc2_.isLocked = false;
               }
               loadNext(_loc2_);
         }
      }
   }
}

