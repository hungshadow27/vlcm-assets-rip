package com.fireice.tabBar
{
   import com.fireice.base.FUIComponent;
   import com.fireice.button.FButton;
   import com.fireice.util.Tools;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class FTabBar extends FUIComponent
   {
      
      private static var _button:FButton;
      
      public static const VERTICAL:String = "tabBar.vertical";
      
      public static const HORIZONTAL:String = "tabBar.horizontal";
      
      private var _type:String;
      
      private var _clickHander:Function;
      
      private var _btn:FButton;
      
      private var _preLabel:String;
      
      public function FTabBar()
      {
         super();
         this._type = FTabBar.HORIZONTAL;
         addEventListener(MouseEvent.CLICK,this.onClick,true);
         addEventListener(Event.ADDED_TO_STAGE,this.onStage);
      }
      
      public static function set buttonStyle(param1:FButton) : void
      {
         _button = param1;
      }
      
      private function onStage(param1:Event) : void
      {
         if(numChildren == 0)
         {
            return;
         }
         (getChildAt(0) as FButton).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function addButton(param1:String, param2:Function = null) : String
      {
         var _loc3_:FButton = null;
         if(_button == null)
         {
            _loc3_ = new FButton();
         }
         else
         {
            _loc3_ = _button.clone() as FButton;
         }
         _loc3_.swap = _loc3_.up;
         _loc3_.filters = Tools.darkFilter;
         if(this._type == FTabBar.HORIZONTAL)
         {
            _loc3_.label = this.subEnte(param1);
         }
         else
         {
            _loc3_.label = this.addEnter(this.subEnte(param1));
         }
         this._clickHander = param2;
         if(param2 != null)
         {
            _loc3_.addEventListener(MouseEvent.CLICK,param2);
         }
         addChild(_loc3_);
         this.reArrange();
         return _loc3_.pid;
      }
      
      public function subButtonByLabel(param1:String) : Boolean
      {
         if(this.getButtonByLabel(param1) == null)
         {
            return false;
         }
         removeChild(this.getButtonByLabel(param1));
         this.reArrange();
         return true;
      }
      
      public function removeAllButton() : void
      {
         while(numChildren > 0)
         {
            removeChildAt(0);
         }
      }
      
      public function get currentLabel() : String
      {
         return this.subEnte(this._btn.label);
      }
      
      public function getButtonByLabel(param1:String) : FButton
      {
         var _loc2_:int = 0;
         var _loc4_:FButton = null;
         var _loc3_:int = numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = getChildAt(_loc2_) as FButton;
            if(this.subEnte(_loc4_.label) == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function setCurrentButtonByLabel(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            (getChildAt(_loc2_) as FButton).up = (getChildAt(_loc2_) as FButton).swap;
            (getChildAt(_loc2_) as FButton).filters = Tools.darkFilter;
            _loc2_++;
         }
         if(this._btn)
         {
            this._preLabel = this.subEnte(this._btn.label);
         }
         else
         {
            this._preLabel = "";
         }
         this._btn = this.getButtonByLabel(param1);
         if(this._btn)
         {
            this._btn.up = this._btn.over;
            this._btn.filters = [];
         }
      }
      
      public function recoverBtnState() : void
      {
         this.setCurrentButtonByLabel(this._preLabel);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this._btn)
         {
            this._preLabel = this.subEnte(this._btn.label);
         }
         else
         {
            this._preLabel = "";
         }
         var _loc3_:int = numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            (getChildAt(_loc2_) as FButton).up = (getChildAt(_loc2_) as FButton).swap;
            (getChildAt(_loc2_) as FButton).filters = Tools.darkFilter;
            _loc2_++;
         }
         this._btn = param1.target as FButton;
         this._btn.up = this._btn.over;
         this._btn.filters = [];
      }
      
      private function reArrange() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = numChildren;
         if(this._type == FTabBar.HORIZONTAL)
         {
            _loc1_ = 1;
            while(_loc1_ < _loc2_)
            {
               getChildAt(_loc1_).x = getChildAt(_loc1_ - 1).x + getChildAt(_loc1_ - 1).width + 1;
               getChildAt(_loc1_).y = 0;
               _loc1_++;
            }
         }
         else
         {
            _loc1_ = 1;
            while(_loc1_ < _loc2_)
            {
               getChildAt(_loc1_).y = getChildAt(_loc1_ - 1).y + getChildAt(_loc1_ - 1).height + 1;
               getChildAt(_loc1_).x = 0;
               _loc1_++;
            }
         }
         if(_loc2_ == 1)
         {
            this._btn = getChildAt(0) as FButton;
            this._btn.up = this._btn.over;
            this._btn.filters = [];
         }
      }
      
      public function resize() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = numChildren;
         if(this._type == FTabBar.HORIZONTAL)
         {
            _loc1_ = 1;
            while(_loc1_ < _loc2_)
            {
               getChildAt(_loc1_).x = getChildAt(_loc1_ - 1).x + getChildAt(_loc1_ - 1).width + 1;
               getChildAt(_loc1_).y = 0;
               _loc1_++;
            }
         }
         else
         {
            _loc1_ = 1;
            while(_loc1_ < _loc2_)
            {
               getChildAt(_loc1_).y = getChildAt(_loc1_ - 1).y + getChildAt(_loc1_ - 1).height + 1;
               getChildAt(_loc1_).x = 0;
               _loc1_++;
            }
         }
      }
      
      private function addEnter(param1:String) : String
      {
         return param1.replace(/(.)/g,"$1\n");
      }
      
      public function subEnte(param1:String) : String
      {
         return param1.split("\r").join("").split("\n").join("");
      }
   }
}

