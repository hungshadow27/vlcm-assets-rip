package game.vo
{
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.ApplicationDomain;
   import game.UIConfig;
   import game.display.ScaleBitmapData;
   import game.net.RESLoadManager;
   import game.net.loader.RESLoader;
   
   public class imgVO
   {
      
      public static const DEFAULT_BACKGROUP_COLOR:uint = 1549556828;
      
      public static const LOAD_COMPLETE:String = "LOAD_COMPLETE";
      
      public var imgName:String;
      
      private var w:int;
      
      private var h:int;
      
      private var _bitmapdata:BitmapData;
      
      private var s9Grid:Rectangle;
      
      private var callBacks:Vector.<Function>;
      
      protected var isLoad:Boolean;
      
      private var THIS:* = this;
      
      public function imgVO(param1:String, param2:int, param3:int)
      {
         super();
         this.imgName = param1;
         this.w = param2;
         this.h = param3;
         this.isLoad = false;
      }
      
      private static function Name2URL(param1:String) : String
      {
         return param1.split(".").join("/");
      }
      
      public function is9Grid() : Boolean
      {
         return this.s9Grid != null;
      }
      
      public function getScaleBitmapdata(param1:Rectangle, param2:Function) : ScaleBitmapData
      {
         if(!this.validGrid(param1))
         {
            throw new Error("九宫格参数不正确！！");
         }
         return new ScaleBitmapData(this.getBitmapdata(param2),param1);
      }
      
      private function validGrid(param1:Rectangle) : Boolean
      {
         return param1.right <= this.w && param1.bottom <= this.h;
      }
      
      public function get bitmapdata() : BitmapData
      {
         if(!this._bitmapdata)
         {
            this._bitmapdata = new BitmapData(this.w,this.h,true,DEFAULT_BACKGROUP_COLOR);
            this.load();
         }
         try
         {
            this._bitmapdata.width;
         }
         catch(error:Error)
         {
            _bitmapdata = new BitmapData(w,h,true,DEFAULT_BACKGROUP_COLOR);
            isLoad = false;
            load();
         }
         return this._bitmapdata;
      }
      
      public function getBitmapdata(param1:Function) : BitmapData
      {
         var _loc2_:BitmapData = this.bitmapdata;
         this.addCallBack(param1);
         return _loc2_;
      }
      
      protected function addCallBack(param1:Function) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.isLoad)
         {
            param1();
            return;
         }
         if(!this.callBacks)
         {
            this.callBacks = new Vector.<Function>();
         }
         this.callBacks.push(param1);
      }
      
      protected function runCallBack() : void
      {
         var _loc1_:Function = null;
         if(!this.callBacks)
         {
            return;
         }
         while(this.callBacks.length)
         {
            _loc1_ = this.callBacks.shift();
            _loc1_();
         }
         this.callBacks = null;
      }
      
      public function set bitmapdata(param1:BitmapData) : void
      {
         if(!param1)
         {
            return;
         }
         if(this._bitmapdata)
         {
            this._bitmapdata.lock();
            this._bitmapdata.fillRect(new Rectangle(0,0,this._bitmapdata.width,this._bitmapdata.height),0);
            this._bitmapdata.copyPixels(param1,new Rectangle(0,0,param1.width,param1.height),new Point(),null,null,true);
            this._bitmapdata.unlock();
         }
         else
         {
            this._bitmapdata = param1;
         }
      }
      
      private function load() : void
      {
         var loadData:LoadData;
         var onComplete:Function = null;
         var bit:BitmapData = null;
         onComplete = function(param1:LoadData, param2:Event):void
         {
            var _loc3_:RESLoader = param2.target as RESLoader;
            if(param1.name != imgName)
            {
               return;
            }
            THIS.bitmapdata = RESLoader.getInstance(imgName,[1,1]) as BitmapData;
            THIS.isLoad = true;
            runCallBack();
         };
         if(ApplicationDomain.currentDomain.hasDefinition(this.imgName))
         {
            bit = RESLoader.getInstance(this.imgName,[1,1]) as BitmapData;
            if(bit)
            {
               this.bitmapdata = bit;
               return;
            }
         }
         loadData = new LoadData(UIConfig.ResRootURL + Name2URL(this.imgName) + RESLoadManager.RES_TYPE,onComplete,null,null,this.imgName,"",int.MAX_VALUE,LoadData.LOADER_CLASS,UIConfig.decode);
         RESLoadManager.load(loadData);
      }
   }
}

