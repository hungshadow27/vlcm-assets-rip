package com.tgame.shell.view.components.attribute
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FScaleBox;
   import com.fireice.util.JPEGEncoder;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.DataEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.net.FileFilter;
   import flash.net.FileReference;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   
   public class PlayerInfoUploadPhotoPanel extends FPanel
   {
      
      private var pathLabel:FTextArea;
      
      private var lookBtn:SmallButton;
      
      private var upLoadBtn:SmallButton;
      
      private var saveBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var file:FileReference;
      
      private var filePath:String;
      
      private var authKey:String = "MTMwMjIzNDM0MjgyOCwzNzU=";
      
      private var signKey:String = "d071c00004c23046f77e6f18d93fadc6";
      
      private var photoContainer:Sprite;
      
      private var photo:Bitmap;
      
      private var prePhoto:Bitmap;
      
      private var loader:Loader;
      
      private var scaleBox:FScaleBox;
      
      private var loadbuff:LoadBuffer;
      
      public function PlayerInfoUploadPhotoPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var lb:FLabel;
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 425;
         height = 436;
         titleText = LanResManager.getLanTextWords(this,"照片上传");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.marriage.photo.upload.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         DynamicManageImages = v;
         this.photoContainer = new Sprite();
         addChild(this.photoContainer);
         this.photoContainer.x = 13;
         this.photoContainer.y = 28;
         with(this.photoContainer.graphics)
         {
            beginFill(3855,0);
            drawRect(0,0,209,357);
            endFill();
         }
         this.scaleBox = new FScaleBox();
         this.scaleBox.dragEnable = true;
         this.scaleBox.scaleEnable = true;
         this.scaleBox.is8dot = false;
         this.scaleBox.ratio = 184 / 282;
         this.scaleBox.dragRect = new Rectangle(0,0,209,357);
         this.scaleBox.addEventListener(FScaleBox.FSCALEBOX_BOX_MOVE,this.onPreview);
         this.scaleBox.addEventListener(Event.RESIZE,this.onPreview);
         lb = new FLabel();
         with(lb)
         {
            x = 36;
            y = 8;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"您可以拖动以剪裁满意的照片");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 226;
            y = 8;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"请上传照片文件");
         }
         addChild(lb);
         this.pathLabel = new FTextArea();
         with(this.pathLabel)
         {
            x = 229;
            y = 31;
            width = 118;
            height = 20;
            textColor = StaticValue.WHITE;
         }
         addChild(this.pathLabel);
         this.prePhoto = new Bitmap(new BitmapData(184,282,true,0));
         addChild(this.prePhoto);
         this.prePhoto.x = 226;
         this.prePhoto.y = 76;
         this.lookBtn = new SmallButton();
         this.lookBtn.label = LanResManager.getLanTextWords(this,"浏览");
         addChild(this.lookBtn);
         this.lookBtn.x = 351;
         this.lookBtn.y = 29;
         this.lookBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.saveBtn = new SecondButton();
         this.saveBtn.label = LanResManager.getLanTextWords(this,"保存照片");
         addChild(this.saveBtn);
         this.saveBtn.x = 231;
         this.saveBtn.y = 365;
         this.saveBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanTextWords(this,"取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = 345;
         this.cancelBtn.y = 365;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.lookBtn:
               this.SelectPhoto();
               break;
            case this.saveBtn:
               this.onSave();
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function SelectPhoto() : void
      {
         this.file = new FileReference();
         this.file.addEventListener(Event.SELECT,this.onSelect);
         this.file.browse([new FileFilter("Images (*.jpg, *.jpeg, *.gif, *.png)","*.jpg;*.jpeg;*.gif;*.png")]);
      }
      
      private function onSelect(param1:Event) : void
      {
         this.pathLabel.text = this.file.name;
         var _loc2_:String = GameConfig.photoUpServer + "?auth=" + this.authKey + "&sign=" + this.signKey;
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         _loc3_.method = URLRequestMethod.POST;
         this.file.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA,this.onUploadComplete);
         this.file.addEventListener(IOErrorEvent.IO_ERROR,this.onUpLoadIOError);
         this.file.upload(_loc3_);
         this.loadbuff = LoadBuffer.show(this);
      }
      
      private function onUpLoadIOError(param1:IOErrorEvent) : void
      {
      }
      
      private function onUploadComplete(param1:DataEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:URLRequest = null;
         var _loc2_:URLVariables = new URLVariables(param1.data);
         if(_loc2_.status == 1)
         {
            if(Boolean(this.photo) && Boolean(this.photo.parent))
            {
               this.photo.parent.removeChild(this.photo);
            }
            _loc3_ = GameConfig.photoDownServer + _loc2_.message;
            _loc4_ = new URLRequest(_loc3_);
            this.loader = new Loader();
            this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadComplete);
            this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.onUpLoadIOError);
            this.loader.load(_loc4_);
         }
      }
      
      private function onLoadComplete(param1:Event) : void
      {
         this.photo = this.loader.content as Bitmap;
         this.photoContainer.addChild(this.scaleBox);
         this.photoContainer.addChildAt(this.photo,0);
         var _loc2_:Number = 1;
         if(this.photo.height != 357)
         {
            _loc2_ = 357 / this.photo.height;
         }
         var _loc3_:Number = 1;
         if(this.photo.width > 209)
         {
            _loc3_ = 209 / this.photo.width;
         }
         this.photo.scaleX = this.photo.scaleY = _loc2_ > _loc3_ ? _loc3_ : _loc2_;
         this.scaleBox.resize(46,70.5);
         this.scaleBox.x = 50;
         this.scaleBox.y = 80;
         this.saveBtn.enabled = true;
         this.onPreview();
         this.loadbuff.close();
      }
      
      private function onSave() : void
      {
         var _loc1_:JPEGEncoder = new JPEGEncoder(100);
         var _loc2_:ByteArray = _loc1_.encode(this.prePhoto.bitmapData);
         var _loc3_:String = GameConfig.photoUpServer + "2?auth=" + this.authKey + "&sign=" + this.signKey;
         var _loc4_:URLRequest = new URLRequest(_loc3_);
         _loc4_.method = URLRequestMethod.POST;
         _loc4_.data = _loc2_;
         _loc4_.contentType = "application/octet-stream";
         var _loc5_:URLLoader = new URLLoader();
         _loc5_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc5_.addEventListener(Event.COMPLETE,this.completeHandler);
         _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.onUpIOErro);
         _loc5_.load(_loc4_);
         this.loadbuff = LoadBuffer.show(this);
      }
      
      private function completeHandler(param1:Event) : void
      {
         this.loadbuff.close();
         this.onClose();
      }
      
      private function onUpIOErro(param1:IOErrorEvent) : void
      {
      }
      
      private function onPreview(param1:Event = null) : void
      {
         var _loc2_:Matrix = new Matrix();
         _loc2_.scale(184 / this.scaleBox.boxWidth,282 / this.scaleBox.boxHeight);
         _loc2_.tx = -this.scaleBox.x * 184 / this.scaleBox.boxWidth;
         _loc2_.ty = -this.scaleBox.y * 282 / this.scaleBox.boxHeight;
         this.prePhoto.bitmapData.fillRect(new Rectangle(0,0,this.prePhoto.bitmapData.width,this.prePhoto.bitmapData.height),0);
         this.prePhoto.bitmapData.draw(this.photo,_loc2_,null,null,new Rectangle(0,0,184,282));
      }
      
      public function setKey(param1:String) : void
      {
         this.authKey = "";
         this.signKey = param1;
         this.saveBtn.enabled = false;
         if(this.loadbuff)
         {
            this.loadbuff.close();
         }
         this.pathLabel.text = "";
      }
   }
}

