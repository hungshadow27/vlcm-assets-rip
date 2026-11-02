package com.zcp.manager
{
   import br.com.stimuli.loading.BulkLoader;
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.zcp.common.loader.vo.LoadData;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   
   public class LoaderManager
   {
      
      private static var _defaultLoader:BulkLoader = new BulkLoader("default");
      
      public function LoaderManager()
      {
         super();
         throw new Event("静态类");
      }
      
      public static function creatNewLoader(param1:String, param2:Function = null, param3:Function = null, param4:Function = null, param5:int = 7, param6:int = 4) : BulkLoader
      {
         var _loc7_:BulkLoader = new BulkLoader(param1,param5,param6);
         if(param2 != null)
         {
            _loc7_.addEventListener(BulkLoader.COMPLETE,param2);
         }
         if(param3 != null)
         {
            _loc7_.addEventListener(BulkLoader.PROGRESS,param3);
         }
         if(param4 != null)
         {
            _loc7_.addEventListener(BulkLoader.ERROR,param4);
            _loc7_.addEventListener(IOErrorEvent.IO_ERROR,param4);
         }
         addLoaderEventListeners(_loc7_);
         return _loc7_;
      }
      
      public static function getDefaultLoader() : BulkLoader
      {
         return _defaultLoader;
      }
      
      public static function load(param1:Array, param2:BulkLoader = null, param3:Boolean = false) : BulkLoader
      {
         var _loc4_:LoadData = null;
         param2 ||= _defaultLoader;
         addLoaderEventListeners(param2);
         if(!param1 || param1.length == 0)
         {
            return param2;
         }
         if(param3)
         {
            loadNext(param2,param1);
         }
         else
         {
            for each(_loc4_ in param1)
            {
               loadNext(param2,[_loc4_]);
            }
         }
         if(param2.itemsTotal != 0 && !param2.isRunning)
         {
            param2.start();
         }
         return param2;
      }
      
      public static function lazyLoad(param1:Function = null, param2:BulkLoader = null, param3:Boolean = false, ... rest) : BulkLoader
      {
         var loadList:Array;
         var $onItemLoadComplete:Function = param1;
         var $loader:BulkLoader = param2;
         var $oneByOne:Boolean = param3;
         var str:Array = rest;
         $loader ||= _defaultLoader;
         if(!str || str.length == 0)
         {
            return $loader;
         }
         loadList = str.map(function(param1:*, param2:int, param3:Array):LoadData
         {
            return new LoadData(String(param1),$onItemLoadComplete);
         });
         return load(loadList,$loader,$oneByOne);
      }
      
      public static function cancelLoadByKey(param1:*, param2:BulkLoader = null) : void
      {
         param2 ||= _defaultLoader;
         param2.remove(param1,false);
      }
      
      public static function cancelLoadAll(param1:BulkLoader = null) : void
      {
         param1 ||= _defaultLoader;
         param1.removeAll();
      }
      
      private static function loadNext(param1:BulkLoader, param2:Array) : void
      {
         var loadItem:LoadingItem;
         var ld:LoadData = null;
         var $loader:BulkLoader = param1;
         var $oneByOneLoadDataArr:Array = param2;
         if(!$loader || !$oneByOneLoadDataArr || $oneByOneLoadDataArr.length == 0)
         {
            return;
         }
         ld = $oneByOneLoadDataArr.shift();
         if(ld == null)
         {
            return;
         }
         loadItem = $loader.add(ld.url,{"id":ld.key});
         loadItem.addEventListener(Event.COMPLETE,function(param1:Event):void
         {
            if(ld.onComplete != null)
            {
               ld.onComplete(param1);
            }
            loadNext($loader,$oneByOneLoadDataArr);
         });
         loadItem.addEventListener(ErrorEvent.ERROR,function(param1:ErrorEvent):void
         {
            if(ld.onError != null)
            {
               ld.onError(param1);
            }
            loadNext($loader,$oneByOneLoadDataArr);
         });
         if(ld.onUpdate != null)
         {
            loadItem.addEventListener(ProgressEvent.PROGRESS,ld.onUpdate);
         }
         $loader.loadNow(loadItem);
         changeItemPriority($loader,loadItem,ld.priority);
      }
      
      private static function changeItemPriority(param1:BulkLoader, param2:*, param3:int) : Boolean
      {
         if(!param1)
         {
            return false;
         }
         var _loc4_:LoadingItem = param1.get(param2);
         if(!_loc4_)
         {
            return false;
         }
         _loc4_._priority = param3;
         param1.sortItemsByPriority();
         return true;
      }
      
      private static function addLoaderEventListeners(param1:BulkLoader) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(BulkLoader.COMPLETE,loaderHandle,false,-int.MAX_VALUE);
         param1.addEventListener(BulkLoader.PROGRESS,loaderHandle,false,-int.MAX_VALUE);
         param1.addEventListener(BulkLoader.ERROR,loaderHandle,false,-int.MAX_VALUE);
         param1.addEventListener(IOErrorEvent.IO_ERROR,loaderHandle,false,-int.MAX_VALUE);
      }
      
      private static function loaderHandle(param1:*) : void
      {
         if(param1 == null || param1.type == null)
         {
            return;
         }
         switch(param1.type)
         {
            case BulkLoader.COMPLETE:
               BulkLoader(param1.target).removeAll();
               break;
            case BulkLoader.PROGRESS:
               break;
            case BulkLoader.ERROR:
            case IOErrorEvent.IO_ERROR:
               BulkLoader(param1.target).removeFailedItems();
         }
      }
   }
}

