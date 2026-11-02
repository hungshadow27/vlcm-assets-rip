package game.net.loader
{
   import flash.display.DisplayObject;
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
   import flash.utils.getDefinitionByName;
   import game.vo.LoadData;
   
   public class RESLoader extends EventDispatcher
   {
      
      private var _urlLoader:URLLoader;
      
      private var _loader:Loader;
      
      private var _context:LoaderContext;
      
      public var isLocked:Boolean;
      
      public var isLoading:Boolean;
      
      public var rslLoadData:LoadData;
      
      public var rslLoadingInfo:RESGroupLoadingInfo;
      
      public var content:DisplayObject;
      
      public function RESLoader()
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
         trace("RESLoaderManager.getClass: 类“" + param1 + "”不存在");
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
      
      public function load(param1:LoadData) : void
      {
         this.isLoading = true;
         this.content = null;
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
         if(this.rslLoadData.dataFormat == LoadData.LOADER_DISPLAYOBJECT)
         {
            this._loader.loadBytes(_loc2_);
         }
         else
         {
            this._loader.loadBytes(_loc2_,this._context);
         }
      }
      
      private function onUrlProgress(param1:ProgressEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function onUrlError(param1:Event) : void
      {
         this.content = null;
         this.stop();
         dispatchEvent(param1);
      }
      
      private function onComplete(param1:Event) : void
      {
         this.content = this._loader.content;
         if(this.content != null)
         {
            if(this.rslLoadData.dataFormat == LoadData.LOADER_DISPLAYOBJECT && this.rslLoadData.container != null)
            {
               this.rslLoadData.container.addChild(this.content);
            }
         }
         this.stop();
         dispatchEvent(param1);
      }
   }
}

