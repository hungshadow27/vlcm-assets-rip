package com.tgame.shell.view.components.mainui
{
   import flash.display.Sprite;
   import gs.TweenMax;
   
   public class IcoTipCanvas extends Sprite
   {
      
      public static const TYPE_LEFT:String = "LEFT";
      
      public static const TYPE_CENTER:String = "CENTER";
      
      public static const TYPE_RIGHT:String = "RIGHT";
      
      public var stratX:int = 100;
      
      public var snapType:String = "TYPE_LIGHT";
      
      public function IcoTipCanvas()
      {
         super();
      }
      
      public function showICO(param1:String, param2:Function, param3:Object = null) : void
      {
         var _loc5_:int = 0;
         var _loc4_:IcoTip = new IcoTip(this.onCom);
         _loc4_.type = param1;
         _loc4_.fun = param2;
         _loc4_.data = param3;
         _loc4_.x = this.stratX;
         addChild(_loc4_);
         _loc4_.alpha = 0;
         switch(this.snapType)
         {
            case TYPE_LEFT:
               _loc5_ = numChildren * 35;
               break;
            case TYPE_CENTER:
               _loc5_ = -numChildren * 35 / 2;
               break;
            case TYPE_RIGHT:
               _loc5_ = -numChildren * 35;
         }
         TweenMax.to(_loc4_,5,{
            "x":_loc5_,
            "alpha":1,
            "onComplete":this.onCom
         });
      }
      
      private function onCom() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = numChildren;
         _loc1_ = int(_loc2_ - 1);
         while(_loc1_ >= 0)
         {
            switch(this.snapType)
            {
               case TYPE_LEFT:
                  getChildAt(_loc1_).x = _loc1_ * 35;
                  break;
               case TYPE_CENTER:
                  getChildAt(_loc1_).x = -_loc2_ * 35 / 2 + _loc1_ * 35;
                  break;
               case TYPE_RIGHT:
                  getChildAt(_loc1_).x = -(_loc1_ + 1) * 35;
            }
            _loc1_--;
         }
      }
   }
}

import com.tgame.common.staticdata.OtherConst;
import com.tgame.common.ui.componets.StaticValue;
import com.tgame.shell.view.components.MainUI;
import flash.display.Bitmap;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.MouseEvent;

class IcoTip extends Sprite
{
   
   private var ico:Bitmap;
   
   private var _fun:Function;
   
   private var onCom:Function;
   
   private var _type:String;
   
   private var _data:Object = null;
   
   public function IcoTip(param1:Function)
   {
      super();
      this.onCom = param1;
      this.ico = StaticValue.getBitmapByClassName(MainUI.TYPE_DEFAULT_TIP);
      addChild(this.ico);
      addChild(StaticValue.getMCByClassName("ui.skill.default") as MovieClip);
   }
   
   public function set type(param1:String) : void
   {
      this._type = param1;
      this.ico.bitmapData = StaticValue.getBitmapByClassName(param1).bitmapData;
      addEventListener(MouseEvent.CLICK,this.onClick);
   }
   
   public function set fun(param1:Function) : void
   {
      this._fun = param1;
   }
   
   public function set data(param1:Object) : void
   {
      this._data = param1;
   }
   
   private function onClick(param1:MouseEvent) : void
   {
      --OtherConst.baishiNum;
      if(parent != null)
      {
         parent.removeChild(this);
      }
      this.onCom();
      if(this._fun != null)
      {
         if(this._data == null)
         {
            this._fun();
         }
         else if(this._data is Function)
         {
            this._data(this._type);
         }
         else
         {
            this._fun(this._data);
         }
      }
   }
}
