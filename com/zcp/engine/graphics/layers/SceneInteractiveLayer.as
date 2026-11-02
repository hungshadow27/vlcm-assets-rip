package com.zcp.engine.graphics.layers
{
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.engine.Scene;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.events.SceneEvent;
   import com.zcp.engine.events.SceneEventAction_interactive;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.vo.map.MapTile;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.getTimer;
   
   public class SceneInteractiveLayer
   {
      
      private static const DOUBLE_CLICK_TIME:int = 500;
      
      private static const DOUBLE_CLICK_DIS:Number = 100;
      
      private var _scene:Scene;
      
      private var _fristMouseDownTime:int = -1;
      
      private var _fristMouseDownPos:Point = null;
      
      public function SceneInteractiveLayer(param1:Scene)
      {
         super();
         this._scene = param1;
      }
      
      public function enableInteractiveHandle() : void
      {
         this._scene.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseHandle);
         this._scene.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseHandle);
         this._scene.addEventListener(MouseEvent.MOUSE_OUT,this.mouseHandle);
         this._scene.stage.addEventListener(MouseEvent.MOUSE_UP,this.mouseHandle);
      }
      
      public function disableInteractiveHandle() : void
      {
         this._scene.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseHandle);
         this._scene.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseHandle);
         this._scene.removeEventListener(MouseEvent.MOUSE_OUT,this.mouseHandle);
         this._scene.stage.removeEventListener(MouseEvent.MOUSE_UP,this.mouseHandle);
      }
      
      public function dispatchEvent(param1:Event) : void
      {
         this._scene.dispatchEvent(param1);
      }
      
      private function mouseHandle(param1:MouseEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:SceneEvent = null;
         var _loc5_:SceneCharacter = null;
         var _loc6_:MapTile = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc4_:Point = new Point(this._scene.mouseX,this._scene.mouseY);
         switch(param1.type)
         {
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = this._scene.getSceneObjectsUnderPoint(_loc4_);
               _loc6_ = _loc2_[0];
               _loc7_ = _loc2_[1];
               _loc8_ = _loc2_[2];
               if(_loc6_ != null)
               {
                  if(_loc7_.length > 0)
                  {
                     _loc5_ = _loc7_[0];
                  }
                  else if(_loc8_.length > 0)
                  {
                     _loc5_ = this.getHitSceneCharacter(_loc8_,_loc4_);
                  }
                  _loc3_ = new SceneEvent(SceneEvent.INTERACTIVE,SceneEventAction_interactive.MOUSE_MOVE,[param1,_loc5_,_loc6_]);
                  EventDispatchCenter.getInstance().dispatchEvent(_loc3_);
               }
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc2_ = this._scene.getSceneObjectsUnderPoint(_loc4_,[SceneCharacterType.MOUNT,SceneCharacterType.NPC_FRIEND]);
               _loc6_ = _loc2_[0];
               _loc7_ = _loc2_[1];
               _loc8_ = _loc2_[2];
               if(_loc6_ != null)
               {
                  if(_loc7_.length > 0)
                  {
                     _loc5_ = _loc7_[0];
                  }
                  else if(_loc8_.length > 0)
                  {
                     _loc5_ = this.getHitSceneCharacter(_loc8_,_loc4_);
                  }
                  _loc9_ = getTimer();
                  if(this._fristMouseDownTime == -1 || _loc9_ - this._fristMouseDownTime > DOUBLE_CLICK_TIME || this._fristMouseDownPos == null || (this._fristMouseDownPos.x - _loc4_.x) * (this._fristMouseDownPos.x - _loc4_.x) + (this._fristMouseDownPos.y - _loc4_.y) * (this._fristMouseDownPos.y - _loc4_.y) > DOUBLE_CLICK_DIS * DOUBLE_CLICK_DIS)
                  {
                     this._fristMouseDownTime = _loc9_;
                     this._fristMouseDownPos = _loc4_;
                     _loc3_ = new SceneEvent(SceneEvent.INTERACTIVE,SceneEventAction_interactive.MOUSE_DOWN,[param1,_loc5_,_loc6_]);
                     EventDispatchCenter.getInstance().dispatchEvent(_loc3_);
                  }
                  else
                  {
                     this._fristMouseDownTime = -1;
                     this._fristMouseDownPos = null;
                     _loc3_ = new SceneEvent(SceneEvent.INTERACTIVE,SceneEventAction_interactive.DOUBLE_CLICK,[param1,_loc5_,_loc6_]);
                     EventDispatchCenter.getInstance().dispatchEvent(_loc3_);
                  }
               }
               break;
            case MouseEvent.MOUSE_UP:
               _loc3_ = new SceneEvent(SceneEvent.INTERACTIVE,SceneEventAction_interactive.MOUSE_UP,[param1,null,null]);
               EventDispatchCenter.getInstance().dispatchEvent(_loc3_);
               break;
            case MouseEvent.MOUSE_OUT:
               _loc3_ = new SceneEvent(SceneEvent.INTERACTIVE,SceneEventAction_interactive.MOUSE_OUT,[param1,null,null]);
               EventDispatchCenter.getInstance().dispatchEvent(_loc3_);
         }
      }
      
      private function getHitSceneCharacter(param1:Array, param2:Point) : SceneCharacter
      {
         var _loc3_:SceneCharacter = null;
         for each(_loc3_ in param1)
         {
            if(_loc3_.hitPoint(param2))
            {
               return _loc3_;
            }
         }
         return null;
      }
   }
}

