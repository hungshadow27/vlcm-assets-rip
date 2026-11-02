package com.zcp.common.loader
{
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.common.loader.vo.RslLoadingInfo;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class RslLoader extends EventDispatcher
   {
      
      private var _loader:Loader;
      
      private var _urlLoader:URLLoader;
      
      private var _context:LoaderContext;
      
      public var isLocked:Boolean;
      
      public var isLoading:Boolean;
      
      public var rslLoadData:LoadData;
      
      public var rslLoadingInfo:RslLoadingInfo;
      
      public function RslLoader()
      {
         super();
         this._context = new LoaderContext();
         try
         {
            this._context["allowLoadBytesCodeExecution"] = true;
         }
         catch(e:Error)
         {
         }
         this._context.applicationDomain = ApplicationDomain.currentDomain;
         this._urlLoader = new URLLoader();
         this._urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
         this._loader = new Loader();
      }
      
      public function load(param1:LoadData) : void
      {
         this.isLoading = true;
         this.rslLoadData = param1;
         var _loc2_:URLRequest = new URLRequest(this.rslLoadData.url);
         _loc2_.method = URLRequestMethod.POST;
         this.initUrlLoadEvent();
         this._urlLoader.load(_loc2_);
      }
      
      public function stop() : void
      {
         this.removeUrlLoadEvent();
         try
         {
            this._urlLoader.close();
         }
         catch(e:Error)
         {
         }
         try
         {
            this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onComplete);
            this._loader.close();
         }
         catch(e:Error)
         {
         }
         this.isLoading = false;
      }
      
      private function initUrlLoadEvent() : void
      {
         this._urlLoader.addEventListener(ProgressEvent.PROGRESS,this.onUrlProgress);
         this._urlLoader.addEventListener(Event.COMPLETE,this.onUrlComplete);
         this._urlLoader.addEventListener(IOErrorEvent.IO_ERROR,this.onUrlError);
         this._urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onUrlError);
      }
      
      private function removeUrlLoadEvent() : void
      {
         this._urlLoader.removeEventListener(ProgressEvent.PROGRESS,this.onUrlProgress);
         this._urlLoader.removeEventListener(Event.COMPLETE,this.onUrlComplete);
         this._urlLoader.removeEventListener(IOErrorEvent.IO_ERROR,this.onUrlError);
         this._urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onUrlError);
      }
      
      private function onUrlComplete(param1:Event) : void
      {
         var _loc2_:ByteArray = param1.currentTarget.data;
         if(this.rslLoadData.decode != null)
         {
            _loc2_ = this.rslLoadData.decode(_loc2_);
         }
         _loc2_.position = 0;
         this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onComplete);
         this._loader.loadBytes(_loc2_,this._context);
      }
      
      private function onUrlProgress(param1:ProgressEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function onUrlError(param1:Event) : void
      {
         this.stop();
         dispatchEvent(param1);
      }
      
      private function onComplete(param1:Event) : void
      {
         this.stop();
         dispatchEvent(param1);
      }
   }
}

