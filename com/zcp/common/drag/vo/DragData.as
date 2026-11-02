package com.zcp.common.drag.vo
{
   import com.zcp.common.drag.DragShowMode;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class DragData
   {
      
      private var _canMove:Boolean;
      
      private var _dobj:InteractiveObject;
      
      private var _type:int;
      
      private var _showMode:int;
      
      private var _guiderID:Number;
      
      private var _criticalDis:Number;
      
      private var _xyRect:Rectangle;
      
      private var _touchRect:Rectangle;
      
      private var _alpha:Number;
      
      private var _data:Object;
      
      private var _stage:Stage;
      
      private var _face:DisplayObject;
      
      private var _guiderStartPoint:Point;
      
      private var _dobjStartPoint:Point;
      
      private var _dobjStartAlpha:Number;
      
      private var _onComplete:Function;
      
      private var _onCompleteParameters:Array;
      
      public function DragData(param1:InteractiveObject, param2:int = 1, param3:int = 1, param4:int = -1, param5:Number = 2, param6:Rectangle = null, param7:Rectangle = null, param8:Number = 1, param9:Function = null, param10:Array = null, param11:Object = null)
      {
         var _loc12_:Sprite = null;
         var _loc13_:Rectangle = null;
         var _loc14_:BitmapData = null;
         var _loc15_:Bitmap = null;
         var _loc16_:Shape = null;
         super();
         this._canMove = false;
         this._dobj = param1;
         this._type = param2;
         this._showMode = param3;
         this._guiderID = param4;
         this._criticalDis = param5;
         this._xyRect = param6;
         this._touchRect = param7;
         this._alpha = param8;
         this._onComplete = param9;
         this._onCompleteParameters = param10;
         this._data = param11;
         if(this._dobj)
         {
            this._stage = param1.stage;
            this._dobjStartPoint = new Point(this._dobj.x,this._dobj.y);
            this._dobjStartAlpha = this._dobj.alpha;
            if(this._dobj.parent)
            {
               switch(this._showMode)
               {
                  case DragShowMode.SELF:
                     this._face = this._dobj;
                     break;
                  case DragShowMode.BITMAP:
                     _loc14_ = new BitmapData(this._dobj.width,this._dobj.height,true,0);
                     _loc14_.draw(this._dobj,null,null,null,null,true);
                     _loc15_ = new Bitmap(_loc14_,"auto",true);
                     _loc12_ = new Sprite();
                     _loc12_.addChild(_loc15_);
                     _loc12_.mouseEnabled = false;
                     _loc13_ = this.dobj.getBounds(this.dobj.parent);
                     _loc15_.x = _loc13_.x - this._dobjStartPoint.x;
                     _loc15_.y = _loc13_.y - this._dobjStartPoint.y;
                     _loc12_.x = this._dobjStartPoint.x;
                     _loc12_.y = this._dobjStartPoint.y;
                     this._face = _loc12_;
                     break;
                  case DragShowMode.FRAME:
                  default:
                     _loc12_ = new Sprite();
                     _loc16_ = new Shape();
                     _loc16_.graphics.clear();
                     _loc16_.graphics.lineStyle(1,0,1);
                     _loc16_.graphics.beginFill(0,0);
                     _loc16_.graphics.drawRect(0,0,this._dobj.width,this._dobj.height);
                     _loc16_.graphics.endFill();
                     _loc12_.addChild(_loc16_);
                     _loc12_.mouseEnabled = false;
                     _loc13_ = this.dobj.getBounds(this.dobj.parent);
                     _loc16_.x = _loc13_.x - this._dobjStartPoint.x;
                     _loc16_.y = _loc13_.y - this._dobjStartPoint.y;
                     _loc12_.x = this._dobjStartPoint.x;
                     _loc12_.y = this._dobjStartPoint.y;
                     this._face = _loc12_;
               }
            }
            if(this._stage)
            {
               this._guiderStartPoint = this._dobj.parent.globalToLocal(new Point(this._stage.mouseX,this._stage.mouseY));
            }
         }
      }
      
      public function isValid() : Boolean
      {
         return this.dobj != null && this.dobj.parent != null && !isNaN(this._type) && !isNaN(this._showMode) && !isNaN(this._guiderID) && this._guiderStartPoint != null && !isNaN(this._criticalDis) && this._dobjStartPoint != null && !isNaN(this._dobjStartAlpha) && !isNaN(this._alpha) && this._stage != null;
      }
      
      public function equal(param1:DragData) : Boolean
      {
         return this.guiderID == param1.guiderID && this.dobj == param1.dobj;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get dobj() : InteractiveObject
      {
         return this._dobj;
      }
      
      public function get guiderID() : int
      {
         return this._guiderID;
      }
      
      public function get guiderStartPoint() : Point
      {
         return this._guiderStartPoint;
      }
      
      public function get dobjStartPoint() : Point
      {
         return this._dobjStartPoint;
      }
      
      public function get dobjStartAlpha() : Number
      {
         return this._dobjStartAlpha;
      }
      
      public function get criticalDis() : Number
      {
         return this._criticalDis;
      }
      
      public function get xyRect() : Rectangle
      {
         return this._xyRect;
      }
      
      public function get touchRect() : Rectangle
      {
         return this._touchRect;
      }
      
      public function get alpha() : Number
      {
         return this._alpha;
      }
      
      public function get onComplete() : Function
      {
         return this._onComplete;
      }
      
      public function get onCompleteParameters() : Array
      {
         return this._onCompleteParameters;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function get face() : DisplayObject
      {
         return this._face;
      }
      
      public function get canMove() : Boolean
      {
         return this._canMove;
      }
      
      public function get stage() : Stage
      {
         return this._stage;
      }
      
      public function set canMove(param1:Boolean) : void
      {
         this._canMove = param1;
      }
   }
}

