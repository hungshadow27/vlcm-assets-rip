package com.tgame.common.ui.componets
{
   import flash.display.DisplayObject;
   
   public class HelpManager
   {
      
      private static var vector:Vector.<HelpCanvas>;
      
      public static const UI_HELP_TYPE_EQUIP_QIANGHUA:int = 1;
      
      public static const UI_HELP_TYPE_EQUIP_QIANGHUA_RESET:int = 2;
      
      public static const UI_HELP_TYPE_EQUIP_ATTRIBUTE_RESET:int = 3;
      
      public static const UI_HELP_TYPE_EQUIP_ATTRIBUTE_QIQNGHUA:int = 4;
      
      public static const UI_HELP_TYPE_EQUIP_ATTRIBUTE_MODIFY_COUNT:int = 5;
      
      public static const UI_HELP_TYPE_EQUIP_ATTRIBUTE_MODIFY_VALUE:int = 6;
      
      public static const UI_HELP_TYPE_EQUIP_ZANWEN:int = 7;
      
      public static const UI_HELP_TYPE_EQUIP_HECHENG:int = 8;
      
      public static const UI_HELP_TYPE_HUSHENFU_HECHENG:int = 9;
      
      public static const UI_HELP_TYPE_SELIZI_HECHENG:int = 10;
      
      public static const UI_HELP_TYPE_KUNGFU_RESET:int = 11;
      
      public static const UI_HELP_TYPE_TRADING:int = 12;
      
      public function HelpManager()
      {
         super();
      }
      
      public static function showHelp(param1:DisplayObject, param2:int) : void
      {
         var _loc3_:int = 0;
         if(!vector)
         {
            vector = new Vector.<HelpCanvas>();
         }
         var _loc4_:int = int(vector.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(vector[_loc3_].type == param2)
            {
               param1.parent.addChild(vector[_loc3_]);
               vector[_loc3_].x = param1.x;
               vector[_loc3_].y = param1.y;
               vector[_loc3_].show();
               return;
            }
            _loc3_++;
         }
         var _loc5_:HelpCanvas = new HelpCanvas(param2);
         vector.push(_loc5_);
         param1.parent.addChild(_loc5_);
         _loc5_.x = param1.x;
         _loc5_.y = param1.y;
         _loc5_.show();
      }
      
      public static function getVisable(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         if(!vector)
         {
            return false;
         }
         var _loc3_:int = int(vector.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(vector[_loc2_].type == param1 && Boolean(vector[_loc2_].parent))
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public static function hideHelp(param1:int) : void
      {
         var _loc2_:int = 0;
         if(!vector)
         {
            return;
         }
         var _loc3_:int = int(vector.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(vector[_loc2_].type == param1)
            {
               vector[_loc2_].hide();
               break;
            }
            _loc2_++;
         }
      }
   }
}

import com.fireice.button.FSimpleButton;
import com.fireice.util.FLoader;
import com.tgame.common.GameConfig;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;
import gs.TweenMax;

class HelpCanvas extends Sprite
{
   
   private var _mask:Sprite;
   
   private var container:Sprite;
   
   private var _type:int;
   
   private var closeBtn:FSimpleButton;
   
   private var obj:DisplayObject;
   
   private var _w:int;
   
   private var _h:int;
   
   public function HelpCanvas(param1:int)
   {
      var $type:int = param1;
      super();
      this._mask = new Sprite();
      addChild(this._mask);
      this.container = new Sprite();
      addChild(this.container);
      this.container.mask = this._mask;
      this._type = $type;
      switch($type)
      {
         case 1:
         case 2:
         case 3:
         case 4:
         case 5:
         case 6:
         case 7:
         case 8:
         case 9:
         case 10:
         case 11:
            this._w = 251;
            this._h = 398;
            break;
         case 12:
            this._w = 249;
            this._h = 324;
      }
      with(this._mask)
      {
         graphics.beginFill(0);
         graphics.drawRect(-_w,0,_w,398);
         graphics.endFill();
      }
      this.obj = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/help/" + $type + ".png",this._w,this._h);
      this.container.addChild(this.obj);
      this.closeBtn = new FSimpleButton();
      this.closeBtn.skin = "closeButton";
      this.container.addChild(this.closeBtn);
      this.closeBtn.x = 251 - this.closeBtn.width - 2;
      this.closeBtn.y = 2;
      this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
   }
   
   private function onClose(param1:MouseEvent) : void
   {
      this.hide();
   }
   
   public function get type() : int
   {
      return this._type;
   }
   
   public function set type(param1:int) : void
   {
      this._type = param1;
   }
   
   public function show() : void
   {
      TweenMax.to(this.container,0.5,{"x":-this._w});
   }
   
   public function hide() : void
   {
      TweenMax.to(this.container,0.1,{
         "x":0,
         "onComplete":this.onCom
      });
   }
   
   private function onCom() : void
   {
      if(parent)
      {
         parent.removeChild(this);
      }
   }
}
