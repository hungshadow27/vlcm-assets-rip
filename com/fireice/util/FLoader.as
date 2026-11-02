package com.fireice.util
{
   import flash.display.DisplayObject;
   
   public class FLoader
   {
      
      public function FLoader()
      {
         super();
         throw new Error("不能直接实例化类FLoader");
      }
      
      public static function startLoad(param1:String, param2:int, param3:int, param4:Boolean = true) : DisplayObject
      {
         var _loc5_:FLoaderContent = new FLoaderContent(param2,param3,param4);
         _loc5_.load(param1);
         return _loc5_;
      }
   }
}

import com.fireice.base.FUIComponent;
import flash.display.DisplayObject;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLRequest;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

class FLoaderContent extends FUIComponent
{
   
   private var loader:Loader;
   
   private var tf:TextField;
   
   private var _w:int;
   
   private var _h:int;
   
   private var count:int;
   
   private var $url:String;
   
   public function FLoaderContent(param1:int, param2:int, param3:Boolean)
   {
      var $w:int = param1;
      var $h:int = param2;
      var isShowTip:Boolean = param3;
      super();
      this._w = $w;
      this._h = $h;
      with(graphics)
      {
         beginFill(0,0);
         drawRect(0,0,_w,_h);
         endFill();
      }
      this.tf = new TextField();
      this.tf.visible = isShowTip;
      addChild(this.tf);
      this.tf.text = "开始下载";
      this.tf.selectable = false;
      this.tf.autoSize = TextFieldAutoSize.CENTER;
      this.tf.background = true;
      this.tf.backgroundColor = 16777164;
      this.tf.textColor = 0;
      this.tf.x = (this._w - this.tf.width) / 2;
      this.tf.y = (this._h - this.tf.height) / 2;
      this.loader = new Loader();
      this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onComplete);
      this.loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.onProgress);
      this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
      this.loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
   }
   
   private function onProgress(param1:Event) : void
   {
      var _loc2_:LoaderInfo = param1.target as LoaderInfo;
      var _loc3_:int = _loc2_.bytesLoaded / _loc2_.bytesTotal * 100;
      this.tf.text = _loc3_.toString() + "%";
      this.tf.textColor = 39168;
   }
   
   private function onComplete(param1:Event) : void
   {
      var e:Event = param1;
      var obj:DisplayObject = this.loader.content;
      obj.width = this._w;
      obj.height = this._h;
      addChild(obj);
      removeChild(this.tf);
      with(graphics)
      {
         clear();
         beginFill(0,0);
         drawRect(0,0,_w,_h);
         endFill();
      }
      dispatchEvent(new Event(Event.COMPLETE));
   }
   
   private function onError(param1:*) : void
   {
      if(this.count < 3)
      {
         this.load();
         trace(param1.text);
      }
      else
      {
         trace(param1.text);
         this.tf.text = "加载失败";
         this.tf.textColor = 10027008;
      }
   }
   
   public function load(param1:String = "") : void
   {
      var _loc2_:URLRequest = null;
      if(param1 != "")
      {
         this.$url = param1;
      }
      if(this.$url)
      {
         _loc2_ = new URLRequest(this.$url);
         this.loader.load(_loc2_);
         this.count += 1;
      }
   }
}
