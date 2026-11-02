package com.fireice.util
{
   import com.fireice.base.FUIComponent;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class LayoutManager extends FUIComponent
   {
      
      private static var _instance:LayoutManager;
      
      public static const TOP_LEFT:String = "TOP_LEFT";
      
      public static const TOP_CENTER:String = "TOP_CENTER";
      
      public static const TOP_RIGHT:String = "TOP_RIGHT";
      
      public static const LEFT:String = "LEFT";
      
      public static const CENTER:String = "CENTER";
      
      public static const RIGHT:String = "RIGHT";
      
      public static const BOTTOMLEFT:String = "BOTTOMLEFT";
      
      public static const BOTTOMCENTER:String = "BOTTOMCENTER";
      
      public static const BOTTOMRIGHT:String = "BOTTOMRIGHT";
      
      public static const STAGE_RISIZE:String = "STAGE_RISIZE";
      
      private static var _singleton:Boolean = true;
      
      private var theStage:Stage;
      
      private var DisplayObjectArray:Array;
      
      public function LayoutManager()
      {
         super();
         if(_singleton)
         {
            throw new Error("请使用getInstance()来获取实例");
         }
      }
      
      public static function getInstance() : LayoutManager
      {
         if(!_instance)
         {
            _singleton = false;
            _instance = new LayoutManager();
            _singleton = true;
         }
         return _instance;
      }
      
      public function setStage(param1:Stage) : void
      {
         if(this.theStage == null)
         {
            this.theStage = param1;
            this.DisplayObjectArray = new Array();
            this.theStage.align = StageAlign.TOP_LEFT;
            this.theStage.scaleMode = StageScaleMode.NO_SCALE;
            this.theStage.addEventListener(Event.RESIZE,this.onStageResize);
         }
      }
      
      public function addLayoutObject(... rest) : void
      {
         if(rest.length < 2)
         {
            return;
         }
         var _loc2_:DisplayObject = rest[0];
         var _loc3_:String = rest[1];
         var _loc4_:Point = rest[2];
         var _loc5_:DisplayObject = rest[3];
         var _loc6_:Function = rest[4];
         var _loc7_:Object = {
            "t":_loc2_,
            "a":_loc3_
         };
         if(_loc4_)
         {
            _loc7_.o = _loc4_;
         }
         if(_loc5_)
         {
            _loc7_.p = _loc5_;
         }
         if(rest[4] != null)
         {
            _loc7_.r = {"runfunc":_loc6_};
         }
         if(this.checkTheSame(_loc2_) >= 0)
         {
            this.DisplayObjectArray[this.checkTheSame(_loc2_)] = _loc7_;
         }
         else
         {
            this.DisplayObjectArray.push(_loc7_);
         }
         this.onStageResize(new Event("active"));
      }
      
      private function checkTheSame(param1:DisplayObject) : int
      {
         var _loc2_:Number = 0;
         while(_loc2_ < this.DisplayObjectArray.length)
         {
            if(this.DisplayObjectArray[_loc2_].t == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function removeLayoutObject(param1:DisplayObject) : void
      {
         var _loc2_:Number = 0;
         while(_loc2_ < this.DisplayObjectArray.length)
         {
            if(this.DisplayObjectArray[_loc2_].t == param1)
            {
               this.DisplayObjectArray.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
      }
      
      public function onStageResize(param1:Event = null) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Point = null;
         var _loc2_:Number = 0;
         while(_loc2_ < this.DisplayObjectArray.length)
         {
            _loc3_ = 0;
            _loc4_ = 0;
            if(this.DisplayObjectArray[_loc2_].o)
            {
               _loc3_ = Number(this.DisplayObjectArray[_loc2_].o.x);
               _loc4_ = Number(this.DisplayObjectArray[_loc2_].o.y);
            }
            switch(this.DisplayObjectArray[_loc2_].a)
            {
               case TOP_LEFT:
                  _loc5_ = 0;
                  _loc6_ = 0;
                  break;
               case TOP_CENTER:
                  _loc5_ = Math.round(this.theStage.stageWidth / 2);
                  _loc6_ = 0;
                  break;
               case TOP_RIGHT:
                  _loc5_ = this.theStage.stageWidth;
                  _loc6_ = 0;
                  break;
               case LEFT:
                  _loc5_ = 0;
                  _loc6_ = Math.round(this.theStage.stageHeight / 2);
                  break;
               case CENTER:
                  _loc5_ = Math.round(this.theStage.stageWidth / 2);
                  _loc6_ = Math.round(this.theStage.stageHeight / 2);
                  break;
               case RIGHT:
                  _loc5_ = this.theStage.stageWidth;
                  _loc6_ = Math.round(this.theStage.stageHeight / 2);
                  break;
               case BOTTOMLEFT:
                  _loc5_ = 0;
                  _loc6_ = this.theStage.stageHeight;
                  break;
               case BOTTOMCENTER:
                  _loc5_ = Math.round(this.theStage.stageWidth / 2);
                  _loc6_ = this.theStage.stageHeight;
                  break;
               case BOTTOMRIGHT:
                  _loc5_ = this.theStage.stageWidth;
                  _loc6_ = this.theStage.stageHeight;
            }
            if(this.DisplayObjectArray[_loc2_].p)
            {
               _loc7_ = new Point(Math.round(this.DisplayObjectArray[_loc2_].p.x),Math.round(this.DisplayObjectArray[_loc2_].p.y));
               localToGlobal(_loc7_);
               _loc5_ -= _loc7_.x;
               _loc6_ -= _loc7_.y;
            }
            this.DisplayObjectArray[_loc2_].t.x = _loc5_ + _loc3_;
            this.DisplayObjectArray[_loc2_].t.y = _loc6_ + _loc4_;
            if(this.DisplayObjectArray[_loc2_].r)
            {
               this.DisplayObjectArray[_loc2_].r.runfunc();
            }
            _loc2_++;
         }
         getInstance().dispatchEvent(new Event("onStageFited"));
      }
      
      public function getLayoutObjectList() : Array
      {
         return this.DisplayObjectArray;
      }
   }
}

