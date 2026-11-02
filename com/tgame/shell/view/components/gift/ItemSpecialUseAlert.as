package com.tgame.shell.view.components.gift
{
   import com.fireice.base.FUIComponent;
   import com.fireice.event.FAlertEvent;
   import com.fireice.init.SkinInit;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.MainButton;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextFieldAutoSize;
   
   public class ItemSpecialUseAlert extends FUIComponent
   {
      
      private static var _skin:String = "alert";
      
      private static var _textRect:Rectangle = new Rectangle(10,50,300,10);
      
      public static var textColor:int = 0;
      
      private var textArea:FTextArea;
      
      private var cancelBtn:MainButton;
      
      private var oldUrl:String;
      
      private var _curHtmlStr:String;
      
      private var _lockScreen:Boolean;
      
      private var skinXml:XML;
      
      private var bg:F9GridBitmap;
      
      private const GOOD_KEY:String = "goodsID";
      
      private const FUNC_KEY:String = "func";
      
      public function ItemSpecialUseAlert()
      {
         var xml:XML = null;
         super();
         Tools.currentStage.addEventListener(Event.RESIZE,this.onScreenReSize);
         try
         {
            this.skinXml = SkinInit.getSkinConfigByName(_skin);
            xml = this.skinXml.backgroundImage[0];
            this.bg = Tools.get9GridBitmpByName(xml);
            addChild(this.bg);
            this.bg.width = 420;
            this.bg.height = 300;
         }
         catch(e:Error)
         {
            throw new Error("加载ItemSpecialUseAlert皮肤出错！");
         }
         this.cancelBtn = new MainButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.closeUI);
         addChild(this.cancelBtn);
         this.cancelBtn.x = this.bg.width - this.cancelBtn.width >> 1;
         this.cancelBtn.y = this.bg.height - this.cancelBtn.height - 5;
         this.textArea = new FTextArea();
         this.textArea.border = true;
         this.textArea.width = _textRect.width;
         this.textArea.wordWrap = true;
         this.textArea.x = _textRect.x;
         this.textArea.y = _textRect.y;
         this.textArea.autoSize = TextFieldAutoSize.LEFT;
         this.textArea.textColor = textColor;
         this.textArea.htmlText = "";
         addChild(this.textArea);
         this.textArea.addEventListener(TextEvent.LINK,this.onLink);
         this.textArea.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTipft);
         this.textArea.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTipft);
      }
      
      public static function show(param1:String = "", param2:String = "", param3:Function = null, param4:Boolean = true) : void
      {
         var _loc5_:ItemSpecialUseAlert = new ItemSpecialUseAlert();
         if(param3 != null)
         {
            _loc5_.addEventListener(FAlertEvent.CLOSE,param3);
         }
         _loc5_.htmlText = param1;
         _loc5_.autoSize();
         _loc5_.lockScreen = param4;
         _loc5_.onScreenReSize(null);
         GameInstance.uiInstance.uiContainer.addChild(_loc5_);
         Tools.currentStage.focus = _loc5_;
         _loc5_.visible = true;
      }
      
      private function onLink(param1:TextEvent) : void
      {
         var _loc3_:FAlertEvent = null;
         var _loc2_:Array = new Array();
         _loc2_ = param1.text.split("#");
         if(_loc2_[0] == this.FUNC_KEY)
         {
            if(_loc2_[1])
            {
               _loc3_ = new FAlertEvent(FAlertEvent.CLOSE,_loc2_[1]);
               this.dispatchEvent(_loc3_);
            }
            this.closeUI(null);
         }
      }
      
      private function onMouseTipft(param1:MouseEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:Goods = null;
         var _loc7_:ItemFace = null;
         var _loc2_:int = this.textArea.getCharIndexAtPoint(this.textArea.mouseX,this.textArea.mouseY);
         switch(param1.type)
         {
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = this.textArea.getCharIndexAtPoint(this.textArea.mouseX,this.textArea.mouseY);
               if(_loc2_ != -1 && _loc2_ < this.textArea.length)
               {
                  _loc3_ = this.textArea.getTextFormat(_loc2_,_loc2_ + 1).url;
                  if(_loc3_ == this.oldUrl || _loc3_ == null)
                  {
                     return;
                  }
                  if(_loc3_ != this.oldUrl)
                  {
                     GameInstance.stage.dispatchEvent(new BaseEvent(ItemFace.MOUSE_OUT,"",[]));
                     _loc4_ = new Array();
                     _loc4_ = _loc3_.split("#");
                     if(_loc4_.length == 2 && _loc4_[0].replace(/event:/g,"") == this.GOOD_KEY)
                     {
                        _loc5_ = int(_loc4_[1]);
                        _loc6_ = new Goods(_loc5_);
                        _loc7_ = new ItemFace(_loc6_);
                        GameInstance.stage.dispatchEvent(new BaseEvent(ItemFace.MOUSE_OVER,"",[_loc7_,null]));
                        this.oldUrl = _loc3_;
                     }
                     else
                     {
                        this.oldUrl = "";
                     }
                  }
               }
               break;
            case MouseEvent.MOUSE_OUT:
               GameInstance.stage.dispatchEvent(new BaseEvent(ItemFace.MOUSE_OUT,"",[]));
               this.oldUrl = "";
         }
      }
      
      public function autoSize() : void
      {
         this.bg.width = this.textArea.width + _textRect.x * 2;
         this.bg.height = this.textArea.height + _textRect.y * 2;
         this.cancelBtn.x = this.bg.width - this.cancelBtn.width >> 1;
         this.cancelBtn.y = this.bg.height - this.cancelBtn.height - 5;
      }
      
      public function onScreenReSize(param1:Event) : void
      {
         var _loc2_:Point = null;
         this.x = (Tools.currentStage.stageWidth - this.bg.width) / 2;
         this.y = (Tools.currentStage.stageHeight - this.bg.height) / 2;
         if(this._lockScreen)
         {
            graphics.clear();
            graphics.beginFill(0,0.5);
            _loc2_ = new Point(0,0);
            _loc2_ = globalToLocal(_loc2_);
            graphics.drawRect(_loc2_.x,_loc2_.y,Tools.currentStage.stageWidth,Tools.currentStage.stageHeight);
            graphics.endFill();
         }
         else
         {
            graphics.clear();
         }
      }
      
      public function set lockScreen(param1:Boolean) : void
      {
         this._lockScreen = param1;
      }
      
      public function get lockScreen() : Boolean
      {
         return this._lockScreen;
      }
      
      public function set htmlText(param1:String) : void
      {
         this._curHtmlStr = param1;
         this.textArea.htmlText = this._curHtmlStr;
      }
      
      public function get htmlText() : String
      {
         return this._curHtmlStr;
      }
      
      private function closeUI(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         if(parent)
         {
            parent.removeChild(this);
         }
         try
         {
            Tools.currentStage.focus = Tools.currentStage.getChildAt(Tools.currentStage.numChildren - 1) as InteractiveObject;
         }
         catch(e:Error)
         {
            Tools.currentStage.focus = null;
         }
         this.cancelBtn.removeEventListener(MouseEvent.CLICK,this.closeUI);
         Tools.currentStage.removeEventListener(Event.RESIZE,this.onScreenReSize);
      }
   }
}

