package game.net
{
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.utils.*;
   import game.net.loader.RESLoader;
   import game.vo.LoadData;
   
   public class RESLoadManager
   {
      
      private static var waitLoadList:Array = [];
      
      private static var loaderList:Array = [];
      
      public static var MAX_THREAD:int = 10;
      
      public static var RES_TYPE:String = ".swf";
      
      public function RESLoadManager()
      {
         super();
         throw new Error("Can not New!");
      }
      
      public static function load(param1:LoadData) : void
      {
         var _loc2_:RESLoader = getFreeLoader(param1.priority);
         if(_loc2_ != null)
         {
            loadNext(_loc2_,param1);
         }
         else
         {
            waitLoadList.push(param1);
            waitLoadList.sortOn("priority",Array.DESCENDING | Array.NUMERIC);
         }
      }
      
      public static function lazyLoad(param1:String, param2:String = null, param3:Function = null, param4:DisplayObjectContainer = null, param5:Function = null, param6:int = 0) : void
      {
         var _loc7_:LoadData = new LoadData(param1,param5,null,null,"","",param6,param2,param3,param4);
         load(_loc7_);
      }
      
      public static function cancelLoadByUrl(param1:String) : void
      {
         var _loc4_:RESLoader = null;
         var _loc5_:LoadData = null;
         var _loc2_:int = int(waitLoadList.length);
         var _loc3_:* = int(_loc2_ - 1);
         while(_loc3_ >= 0)
         {
            _loc5_ = waitLoadList[_loc3_];
            if(_loc5_.url == param1)
            {
               waitLoadList.splice(_loc3_,1);
            }
            _loc3_--;
         }
         for each(_loc4_ in loaderList)
         {
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
      
      public static function cancelLoadByUrlCallBack(param1:Function) : void
      {
         var _loc4_:RESLoader = null;
         var _loc5_:LoadData = null;
         var _loc2_:int = int(waitLoadList.length);
         var _loc3_:* = int(_loc2_ - 1);
         while(_loc3_ >= 0)
         {
            _loc5_ = waitLoadList[_loc3_];
            if(_loc5_.onComplete == param1)
            {
               waitLoadList.splice(_loc3_,1);
            }
            _loc3_--;
         }
         for each(_loc4_ in loaderList)
         {
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
      
      public static function cancelLoadByUrlAndUrlCallBack(param1:String, param2:Function) : void
      {
         var _loc5_:RESLoader = null;
         var _loc6_:LoadData = null;
         var _loc3_:int = int(waitLoadList.length);
         var _loc4_:* = int(_loc3_ - 1);
         while(_loc4_ >= 0)
         {
            _loc6_ = waitLoadList[_loc4_];
            if(_loc6_.url == param1 && _loc6_.onComplete == param2)
            {
               waitLoadList.splice(_loc4_,1);
            }
            _loc4_--;
         }
         for each(_loc5_ in loaderList)
         {
            if(_loc5_.isLoading)
            {
               if(_loc5_.rslLoadData.url == param1 && _loc6_.onComplete == param2)
               {
                  _loc5_.stop();
                  loadNext(_loc5_);
               }
            }
         }
      }
      
      private static function getFreeLoader(param1:int = 0) : RESLoader
      {
         var _loc2_:RESLoader = null;
         var _loc3_:RESLoader = null;
         for each(_loc2_ in loaderList)
         {
            if(!_loc2_.isLocked && !_loc2_.isLoading)
            {
               if(_loc2_.rslLoadData == null)
               {
                  return _loc2_;
               }
            }
         }
         if(loaderList.length < MAX_THREAD)
         {
            _loc2_ = new RESLoader();
            loaderList.push(_loc2_);
            return _loc2_;
         }
         for each(_loc2_ in loaderList)
         {
            if(_loc3_ == null || _loc3_.rslLoadData.priority > _loc2_.rslLoadData.priority)
            {
               _loc3_ = _loc2_;
            }
         }
         if(_loc3_.rslLoadData.priority < param1)
         {
            _loc3_.stop();
            waitLoadList.push(_loc3_.rslLoadData);
            waitLoadList.sortOn("priority",Array.DESCENDING | Array.NUMERIC);
            return _loc3_;
         }
         return null;
      }
      
      private static function loadNext(param1:RESLoader, param2:LoadData = null) : void
      {
         var _loc3_:LoadData = null;
         if(param1.isLoading)
         {
            return;
         }
         if(param2 != null)
         {
            _loc3_ = param2;
         }
         else if(waitLoadList.length > 0)
         {
            _loc3_ = waitLoadList.shift();
         }
         if(_loc3_ != null)
         {
            initLoadEvent(param1);
            param1.load(_loc3_);
         }
      }
      
      private static function initLoadEvent(param1:RESLoader) : void
      {
         param1.addEventListener(Event.COMPLETE,rslLoaderHandler);
         param1.addEventListener(ProgressEvent.PROGRESS,rslLoaderHandler);
         param1.addEventListener(IOErrorEvent.IO_ERROR,rslLoaderHandler);
         param1.addEventListener(SecurityErrorEvent.SECURITY_ERROR,rslLoaderHandler);
      }
      
      private static function removeLoadEvent(param1:RESLoader) : void
      {
         param1.removeEventListener(Event.COMPLETE,rslLoaderHandler);
         param1.removeEventListener(ProgressEvent.PROGRESS,rslLoaderHandler);
         param1.removeEventListener(IOErrorEvent.IO_ERROR,rslLoaderHandler);
         param1.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,rslLoaderHandler);
      }
      
      private static function rslLoaderHandler(param1:Event) : void
      {
         var _loc2_:RESLoader = param1.target as RESLoader;
         switch(param1.type)
         {
            case Event.COMPLETE:
               removeLoadEvent(_loc2_);
               if(_loc2_.rslLoadData.onComplete != null)
               {
                  _loc2_.isLocked = true;
                  _loc2_.rslLoadData.onComplete(_loc2_.rslLoadData,param1);
                  _loc2_.isLocked = false;
               }
               _loc2_.rslLoadData = null;
               loadNext(_loc2_);
               break;
            case ProgressEvent.PROGRESS:
               if(_loc2_.rslLoadData.onUpdate != null)
               {
                  _loc2_.isLocked = true;
                  _loc2_.rslLoadData.onUpdate(_loc2_.rslLoadData,param1);
                  _loc2_.isLocked = false;
               }
               break;
            case IOErrorEvent.IO_ERROR:
            case SecurityErrorEvent.SECURITY_ERROR:
               trace("ClassLoaderManager: 加载" + _loc2_.rslLoadData.url + "失败");
               removeLoadEvent(_loc2_);
               if(_loc2_.rslLoadData.onError != null)
               {
                  _loc2_.isLocked = true;
                  _loc2_.rslLoadData.onError(_loc2_.rslLoadData,param1);
                  _loc2_.isLocked = false;
               }
               _loc2_.rslLoadData = null;
               loadNext(_loc2_);
         }
      }
   }
}

