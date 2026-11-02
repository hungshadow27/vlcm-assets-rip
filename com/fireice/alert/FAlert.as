package com.fireice.alert
{
   import com.fireice.base.FUIComponent;
   import com.fireice.button.FButton;
   import com.fireice.event.FAlertEvent;
   import com.fireice.init.SkinInit;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.*;
   
   public class FAlert extends FUIComponent
   {
      
      private static var okBtn:FButton;
      
      private static var cancelBtn:FButton;
      
      private static var _hander:Function;
      
      private static var _skin:String = "alert";
      
      private static var _okLabel:String = "确定";
      
      private static var _cancelLabel:String = "取消";
      
      private static var _textRect:Rectangle = new Rectangle(10,30,100,50);
      
      public static const OK:String = "FAlert.ok";
      
      public static const CANCEL:String = "FAlert.cancel";
      
      public static var textColor:int = 0;
      
      private var container:Sprite;
      
      private var skinXml:XML;
      
      private var bg:F9GridBitmap;
      
      private var title:TextField;
      
      private var text:TextField;
      
      private var _okBtn:FButton;
      
      private var _cancelBtn:FButton;
      
      private var _modal:Boolean;
      
      public function FAlert()
      {
         var xml:XML = null;
         super();
         Tools.currentStage.addEventListener(Event.RESIZE,this.onReSize);
         this.container = new Sprite();
         addChild(this.container);
         try
         {
            this.skinXml = SkinInit.getSkinConfigByName(_skin);
            xml = this.skinXml.backgroundImage[0];
            this.bg = Tools.get9GridBitmpByName(xml);
            this.container.addChild(this.bg);
         }
         catch(e:Error)
         {
            trace("加载alert皮肤出错！");
            throw new Error("加载alert皮肤出错！");
         }
         this.title = new TextField();
         with(this.title)
         {
            y = 4;
            mouseEnabled = false;
            selectable = false;
            width = bg.width;
            height = 20;
            textColor = FAlert.textColor;
            defaultTextFormat = new TextFormat(null,null,null,true,null,null,null,null,"center");
            multiline = false;
            wordWrap = false;
         }
         this.container.addChild(this.title);
         this.text = new TextField();
         with(this.text)
         {
            x = _textRect.x;
            y = _textRect.y;
            textColor = FAlert.textColor;
            autoSize = TextFieldAutoSize.LEFT;
            selectable = false;
            wordWrap = false;
            multiline = true;
         }
         this.container.addChild(this.text);
         if(okBtn == null)
         {
            this._okBtn = new FButton();
            this._okBtn.skin = this.skinXml.button[0].@link;
         }
         else
         {
            this._okBtn = okBtn.clone() as FButton;
         }
         this._okBtn.name = "FAlert.ok";
         this._okBtn.label = _okLabel;
         this.container.addChild(this._okBtn);
         if(cancelBtn == null)
         {
            this._cancelBtn = new FButton();
            this._cancelBtn.skin = this.skinXml.button[0].@link;
         }
         else
         {
            this._cancelBtn = cancelBtn.clone() as FButton;
         }
         this._cancelBtn.name = "FAlert.cancel";
         this._cancelBtn.label = _cancelLabel;
         this.container.addChild(this._cancelBtn);
         this._okBtn.y = this._cancelBtn.y = this.bg.height - this._okBtn.height - 5;
         this.container.x = (Tools.currentStage.stageWidth - this.container.width) / 2;
         this.container.y = (Tools.currentStage.stageHeight - this.container.height) / 2;
         addEventListener(FocusEvent.FOCUS_IN,this.onFocus);
         addEventListener(FocusEvent.FOCUS_OUT,this.onFocus);
      }
      
      public static function set okLabel(param1:String) : void
      {
         _okLabel = param1;
      }
      
      public static function set cancelLabel(param1:String) : void
      {
         _cancelLabel = param1;
      }
      
      public static function set textRect(param1:Rectangle) : void
      {
         _textRect = param1;
      }
      
      public static function set okButton(param1:FButton) : void
      {
         okBtn = param1;
      }
      
      public static function set cancelButton(param1:FButton) : void
      {
         cancelBtn = param1;
      }
      
      public static function set skin(param1:String) : void
      {
         _skin = param1;
      }
      
      public static function show(param1:String = "", param2:String = "", param3:int = 1, param4:Function = null, param5:Boolean = true) : FAlert
      {
         if(param3 == 1)
         {
            FAlert.okLabel = "确定";
            FAlert.cancelLabel = "取消";
         }
         var _loc6_:FAlert = new FAlert();
         _loc6_.Text = param1;
         _loc6_.titleText = param2;
         _loc6_.flags = param3;
         _loc6_.onReSize(null);
         if(param4 != null)
         {
            _loc6_.addEventListener(FAlertEvent.CLOSE,param4);
         }
         _loc6_.modal = param5;
         Tools.currentStage.addChild(_loc6_);
         Tools.currentStage.focus = _loc6_;
         return _loc6_;
      }
      
      public static function resetButtonLabel() : void
      {
         FAlert.okLabel = "确定";
         FAlert.cancelLabel = "取消";
      }
      
      private static function closeHander(param1:FAlertEvent) : void
      {
         if(param1.eventData == "FAlert.ok")
         {
            _hander(param1);
         }
      }
      
      public function onReSize(param1:Event = null) : void
      {
         this.container.x = (Tools.currentStage.stageWidth - this.container.width) / 2;
         this.container.y = (Tools.currentStage.stageHeight - this.container.height) / 2;
         if(this._modal)
         {
            graphics.clear();
            graphics.beginFill(0,0.5);
            graphics.drawRect(0,0,Tools.currentStage.stageWidth,Tools.currentStage.stageHeight);
            graphics.endFill();
         }
         else
         {
            graphics.clear();
         }
      }
      
      private function onFocus(param1:FocusEvent) : void
      {
         switch(param1.type)
         {
            case FocusEvent.FOCUS_IN:
               Tools.currentStage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUP);
               break;
            case FocusEvent.FOCUS_OUT:
               Tools.currentStage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUP);
         }
      }
      
      private function onKeyUP(param1:KeyboardEvent) : void
      {
         var evt:FAlertEvent = null;
         var ev:FAlertEvent = null;
         var e:KeyboardEvent = param1;
         switch(e.keyCode)
         {
            case 13:
               e.stopPropagation();
               evt = new FAlertEvent(FAlertEvent.CLOSE,"FAlert.ok");
               this.dispatchEvent(evt);
               Tools.currentStage.removeChild(this);
               Tools.currentStage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUP);
               this._okBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
               this._cancelBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
               try
               {
                  Tools.currentStage.focus = Tools.currentStage.getChildAt(Tools.currentStage.numChildren - 1) as InteractiveObject;
               }
               catch(e:Error)
               {
                  Tools.currentStage.focus = null;
               }
               break;
            case 27:
               e.stopPropagation();
               ev = new FAlertEvent(FAlertEvent.CLOSE,"FAlert.cancel");
               this.dispatchEvent(ev);
               Tools.currentStage.removeChild(this);
               Tools.currentStage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUP);
               this._okBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
               this._cancelBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
               try
               {
                  Tools.currentStage.focus = Tools.currentStage.getChildAt(Tools.currentStage.numChildren - 1) as InteractiveObject;
               }
               catch(e:Error)
               {
                  Tools.currentStage.focus = null;
               }
         }
      }
      
      internal function set flags(param1:int) : void
      {
         if(param1 == 1)
         {
            this._cancelBtn.visible = false;
            this._okBtn.x = (this.bg.width - this._okBtn.width) / 2;
            this._okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         }
         else
         {
            cancelBtn.visible = true;
            this._okBtn.x = (this.bg.width - this._okBtn.width - this._cancelBtn.width) / 3;
            this._cancelBtn.x = (this.bg.width - this._okBtn.width - this._cancelBtn.width) / 3 * 2 + this._okBtn.width;
            this._okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            this._cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         }
         this._okBtn.y = this._cancelBtn.y = this.bg.height - this._okBtn.height - 5;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         var evt:FAlertEvent = new FAlertEvent(FAlertEvent.CLOSE,e.target.name);
         this.dispatchEvent(evt);
         Tools.currentStage.removeChild(this);
         try
         {
            Tools.currentStage.focus = Tools.currentStage.getChildAt(Tools.currentStage.numChildren - 1) as InteractiveObject;
         }
         catch(e:Error)
         {
            Tools.currentStage.focus = null;
         }
         this._okBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
         this._cancelBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
         Tools.currentStage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUP);
         Tools.currentStage.removeEventListener(Event.RESIZE,this.onReSize);
         FAlert.okLabel = "确定";
         FAlert.cancelLabel = "取消";
      }
      
      public function set Text(param1:String) : void
      {
         this.text.htmlText = param1;
         this.bg.width = this.text.width + _textRect.x * 2;
         this.bg.height = this.text.height + 10 + _textRect.y * 2;
      }
      
      internal function set titleText(param1:String) : void
      {
         this.title.htmlText = param1;
         this.title.width = this.bg.width;
      }
      
      internal function set modal(param1:Boolean) : void
      {
         this._modal = param1;
         if(param1)
         {
            graphics.beginFill(0,0.5);
            graphics.drawRect(0,0,Tools.currentStage.stageWidth,Tools.currentStage.stageHeight);
            graphics.endFill();
         }
         else
         {
            graphics.clear();
         }
      }
      
      public function set imgTitle(param1:DisplayObject) : void
      {
         this.container.addChild(param1);
         param1.x = (this.bg.width - param1.width) / 2;
      }
   }
}

