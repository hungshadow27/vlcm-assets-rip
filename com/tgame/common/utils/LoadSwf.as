package com.tgame.common.utils
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.base.FUIComponent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class LoadSwf
   {
      
      public function LoadSwf()
      {
         super();
         throw new Error("不能直接实例化类LoadSwf");
      }
      
      public static function AndConvert2Bmp(param1:String, param2:Function = null, param3:int = 0) : DisplayObject
      {
         var loadHuidiao:Function;
         var bg:FUIComponent = null;
         var mc:MovieClip = null;
         var mBit:BitmapData = null;
         var url:String = param1;
         var func:Function = param2;
         var shunxu:int = param3;
         bg = new FUIComponent();
         if(SuperContentCache.getCache().getContent(url) == null && SuperContentCache.getCache().getKey(url) == false)
         {
            SuperContentCache.getCache().setContent(url,null);
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc4_:BitmapData = null;
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               var _loc3_:MovieClip = _loc2_.content as MovieClip;
               if(_loc3_ != null)
               {
                  SuperContentCache.getCache().setContent(_loc2_.url.url,_loc3_);
                  _loc4_ = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
                  _loc4_.draw(_loc3_);
                  while(bg.numChildren)
                  {
                     bg.removeChildAt(0);
                  }
                  bg.addChild(new Bitmap(_loc4_));
                  if(typeof func == "function")
                  {
                     func(bg,shunxu);
                  }
               }
            },null,false,url);
         }
         else if(SuperContentCache.getCache().getContent(url) == null && SuperContentCache.getCache().getKey(url))
         {
            loadHuidiao = function(param1:MovieClip):void
            {
               var _loc2_:BitmapData = new BitmapData(param1.width,param1.height,true,16777215);
               _loc2_.draw(param1);
               while(bg.numChildren)
               {
                  bg.removeChildAt(0);
               }
               bg.addChild(new Bitmap(_loc2_));
               if(typeof func == "function")
               {
                  func(bg,shunxu);
               }
            };
            SuperContentCache.getCache().setContentFun(url,loadHuidiao);
         }
         else
         {
            mc = SuperContentCache.getCache().getContent(url);
            mBit = new BitmapData(mc.width,mc.height,true,16777215);
            mBit.draw(mc);
            while(bg.numChildren)
            {
               bg.removeChildAt(0);
            }
            bg.addChild(new Bitmap(mBit));
            if(typeof func == "function")
            {
               func(bg,shunxu);
            }
         }
         return bg;
      }
      
      public static function getBitmapData(param1:String, param2:int, param3:int, param4:Function = null, param5:int = 0) : BitmapData
      {
         var loadHuidiao:Function;
         var bg:BitmapData = null;
         var mc:MovieClip = null;
         var url:String = param1;
         var width:int = param2;
         var height:int = param3;
         var func:Function = param4;
         var shunxu:int = param5;
         bg = new BitmapData(width,height,true,16777215);
         if(SuperContentCache.getCache().getContent(url) == null && SuperContentCache.getCache().getKey(url) == false)
         {
            SuperContentCache.getCache().setContent(url,null);
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               var _loc3_:MovieClip = _loc2_.content as MovieClip;
               if(_loc3_ != null)
               {
                  SuperContentCache.getCache().setContent(_loc2_.url.url,_loc3_);
                  bg.draw(_loc3_);
                  if(typeof func == "function")
                  {
                     func(bg,shunxu);
                  }
               }
            },null,false,url);
         }
         else if(SuperContentCache.getCache().getContent(url) == null && SuperContentCache.getCache().getKey(url))
         {
            loadHuidiao = function(param1:MovieClip):void
            {
               bg.draw(param1);
               if(typeof func == "function")
               {
                  func(bg,shunxu);
               }
            };
            SuperContentCache.getCache().setContentFun(url,loadHuidiao);
         }
         else
         {
            mc = SuperContentCache.getCache().getContent(url);
            bg.draw(mc);
            if(typeof func == "function")
            {
               func(bg,shunxu);
            }
         }
         return bg;
      }
      
      public static function AndReturnMC(param1:String, param2:Function = null) : void
      {
         var url:String = param1;
         var func:Function = param2;
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            var _loc3_:MovieClip = _loc2_.content as MovieClip;
            if(typeof func == "function")
            {
               func(_loc3_);
            }
         },null,false,url);
      }
      
      public static function AndReturnMC2(param1:String, param2:Function = null, param3:Object = null) : void
      {
         var url:String = param1;
         var func:Function = param2;
         var obj:Object = param3;
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            var _loc3_:MovieClip = _loc2_.content as MovieClip;
            if(typeof func == "function")
            {
               func(_loc3_,obj);
            }
         },null,false,url);
      }
   }
}

