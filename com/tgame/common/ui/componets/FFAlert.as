package com.tgame.common.ui.componets
{
   import com.fireice.base.FUIComponent;
   import com.fireice.button.FButton;
   import com.fireice.event.FAlertEvent;
   import com.fireice.init.SkinInit;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.*;
   
   public class FFAlert extends FUIComponent
   {
      
      private static var okBtn:FButton;
      
      private static var cancelBtn:FButton;
      
      private static var _hander:Function;
      
      private static var _skin:String = "alert";
      
      private static var _okLabel:String = LanResManager.getLanCommonTextWords("兑炼骨丹");
      
      private static var _cancelLabel:String = LanResManager.getLanCommonTextWords("取消");
      
      private static var _textRect:Rectangle = new Rectangle(10,30,100,50);
      
      public static const OK:String = "FFAlert.ok";
      
      public static const CANCEL:String = "FFAlert.cancel";
      
      public static var textColor:int = 0;
      
      private static var _okLabel2:String = LanResManager.getLanCommonTextWords("兑碧灵丹");
      
      public static const OK2:String = "FFAlert.ok2";
      
      private static var _okLabel3:String = LanResManager.getLanCommonTextWords("兑神奇宝箱");
      
      public static const OK3:String = "FFAlert.ok3";
      
      private var container:Sprite;
      
      private var skinXml:XML;
      
      private var bg:F9GridBitmap;
      
      private var title:TextField;
      
      private var text:TextField;
      
      private var _okBtn:FButton;
      
      private var _cancelBtn:FButton;
      
      private var _modal:Boolean;
      
      private var _okBtn2:FButton;
      
      private var _okBtn3:FButton;
      
      public function FFAlert()
      {
         var xml:XML = null;
         super();
         if(okBtn == null)
         {
            okBtn = new MainButton();
         }
         if(cancelBtn == null)
         {
            cancelBtn = new MainButton();
         }
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
            textColor = FFAlert.textColor;
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
            textColor = FFAlert.textColor;
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
         this._okBtn.name = "FFAlert.ok";
         this._okBtn.label = _okLabel;
         this.container.addChild(this._okBtn);
         if(okBtn == null)
         {
            this._okBtn2 = new FButton();
            this._okBtn2.skin = this.skinXml.button[0].@link;
         }
         else
         {
            this._okBtn2 = okBtn.clone() as FButton;
         }
         this._okBtn2.name = "FFAlert.ok2";
         this._okBtn2.label = _okLabel2;
         this.container.addChild(this._okBtn2);
         if(okBtn == null)
         {
            this._okBtn3 = new FButton();
            this._okBtn3.skin = this.skinXml.button[0].@link;
         }
         else
         {
            this._okBtn3 = okBtn.clone() as FButton;
         }
         this._okBtn3.name = "FFAlert.ok3";
         this._okBtn3.label = _okLabel3;
         this.container.addChild(this._okBtn3);
         if(cancelBtn == null)
         {
            this._cancelBtn = new FButton();
            this._cancelBtn.skin = this.skinXml.button[0].@link;
         }
         else
         {
            this._cancelBtn = cancelBtn.clone() as FButton;
         }
         this._cancelBtn.name = "FFAlert.cancel";
         this._cancelBtn.label = _cancelLabel;
         this.container.addChild(this._cancelBtn);
         this._okBtn.y = this._okBtn2.y = this._okBtn3.y = this._cancelBtn.y = this.bg.height - this._okBtn.height - 25;
         this.container.x = (Tools.currentStage.stageWidth - this.container.width) / 2;
         this.container.y = (Tools.currentStage.stageHeight - this.container.height) / 2;
         addEventListener(FocusEvent.FOCUS_IN,this.onFocus);
         addEventListener(FocusEvent.FOCUS_OUT,this.onFocus);
      }
      
      public static function set textRect(param1:Rectangle) : void
      {
         _textRect = param1;
      }
      
      public static function set skin(param1:String) : void
      {
         _skin = param1;
      }
      
      public static function show(param1:String = "", param2:String = "", param3:Function = null, param4:Boolean = true) : FFAlert
      {
         var _loc5_:FFAlert = new FFAlert();
         _loc5_.Text = param1;
         _loc5_.titleText = param2;
         _loc5_.flags();
         if(param3 != null)
         {
            _loc5_.addEventListener(FAlertEvent.CLOSE,param3);
         }
         _loc5_.modal = param4;
         Tools.currentStage.addChild(_loc5_);
         Tools.currentStage.focus = _loc5_;
         return _loc5_;
      }
      
      private static function closeHander(param1:FAlertEvent) : void
      {
         if(param1.eventData == "FFAlert.ok")
         {
            _hander(param1);
         }
      }
      
      private function onReSize(param1:Event) : void
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
         var _loc2_:uint = param1.keyCode;
         switch(0)
         {
         }
      }
      
      private function flags() : void
      {
         var _loc1_:int = this._okBtn.width + this._okBtn2.width + this._okBtn3.width + this._cancelBtn.width + 30;
         this._okBtn.x = this.bg.width / 2 - _loc1_ / 2;
         this._okBtn2.x = this._okBtn.x + this._okBtn.width + 10;
         this._okBtn3.x = this._okBtn2.x + this._okBtn2.width + 10;
         this._cancelBtn.x = this._okBtn3.x + this._okBtn3.width + 10;
         this._okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this._okBtn2.addEventListener(MouseEvent.CLICK,this.onClick);
         this._okBtn3.addEventListener(MouseEvent.CLICK,this.onClick);
         this._cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
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
         this._okBtn2.removeEventListener(MouseEvent.CLICK,this.onClick);
         this._okBtn3.removeEventListener(MouseEvent.CLICK,this.onClick);
         this._cancelBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
         Tools.currentStage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUP);
         Tools.currentStage.removeEventListener(Event.RESIZE,this.onReSize);
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

