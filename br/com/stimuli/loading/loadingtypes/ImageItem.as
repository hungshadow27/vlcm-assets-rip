package br.com.stimuli.loading.loadingtypes
{
   import br.com.stimuli.loading.BulkLoader;
   import flash.display.*;
   import flash.events.*;
   import flash.net.*;
   import flash.utils.*;
   
   public class ImageItem extends LoadingItem
   {
      
      public var loader:Loader;
      
      public function ImageItem(param1:URLRequest, param2:String, param3:String)
      {
         specificAvailableProps = [BulkLoader.CONTEXT];
         super(param1,param2,param3);
      }
      
      override public function onErrorHandler(param1:ErrorEvent) : void
      {
         super.onErrorHandler(param1);
      }
      
      override public function stop() : void
      {
         cleanListeners();
         try
         {
            if(loader)
            {
               loader.close();
            }
         }
         catch(e:Error)
         {
         }
         super.stop();
      }
      
      override public function load() : void
      {
         super.load();
         loader = new Loader();
         loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,onProgressHandler,false,0,true);
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onCompleteHandler,false,0,true);
         loader.contentLoaderInfo.addEventListener(Event.INIT,onInitHandler,false,0,true);
         loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onErrorHandler,false,100,true);
         loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityErrorHandler,false,0,true);
         loader.contentLoaderInfo.addEventListener(Event.OPEN,onStartedHandler,false,0,true);
         loader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,super.onHttpStatusHandler,false,0,true);
         try
         {
            loader.load(url,_context);
         }
         catch(e:SecurityError)
         {
            onSecurityErrorHandler(_createErrorEvent(e));
         }
      }
      
      override public function destroy() : void
      {
         stop();
         cleanListeners();
         _content = null;
         loader = null;
      }
      
      override public function _parseOptions(param1:Object) : Array
      {
         _context = param1[BulkLoader.CONTEXT] || null;
         return super._parseOptions(param1);
      }
      
      public function getDefinitionByName(param1:String) : Object
      {
         if(loader.contentLoaderInfo.applicationDomain.hasDefinition(param1))
         {
            return loader.contentLoaderInfo.applicationDomain.getDefinition(param1);
         }
         return null;
      }
      
      override public function isImage() : Boolean
      {
         return type == BulkLoader.TYPE_IMAGE;
      }
      
      override public function onCompleteHandler(param1:Event) : void
      {
         var evt:Event = param1;
         try
         {
            _content = loader.content;
            super.onCompleteHandler(evt);
         }
         catch(e:SecurityError)
         {
            _content = loader;
            super.onCompleteHandler(evt);
         }
      }
      
      override public function cleanListeners() : void
      {
         var _loc1_:Object = null;
         if(loader)
         {
            _loc1_ = loader.contentLoaderInfo;
            _loc1_.removeEventListener(ProgressEvent.PROGRESS,onProgressHandler,false);
            _loc1_.removeEventListener(Event.COMPLETE,onCompleteHandler,false);
            _loc1_.removeEventListener(Event.INIT,onInitHandler,false);
            _loc1_.removeEventListener(IOErrorEvent.IO_ERROR,onErrorHandler,false);
            _loc1_.removeEventListener(BulkLoader.OPEN,onStartedHandler,false);
            _loc1_.removeEventListener(HTTPStatusEvent.HTTP_STATUS,super.onHttpStatusHandler,false);
         }
      }
      
      override public function isSWF() : Boolean
      {
         return type == BulkLoader.TYPE_MOVIECLIP;
      }
      
      public function _onHttpStatusHandler(param1:HTTPStatusEvent) : void
      {
         _httpStatus = param1.status;
         dispatchEvent(param1);
      }
      
      public function onInitHandler(param1:Event) : void
      {
         dispatchEvent(param1);
      }
   }
}

