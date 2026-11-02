package com.zcp.engine
{
   import com.zcp.engine.tools.SceneCache;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class SceneRender
   {
      
      public static var nowTime:int;
      
      private var _scene:Scene;
      
      private var _isRendering:Boolean = false;
      
      public function SceneRender(param1:Scene)
      {
         super();
         this._scene = param1;
      }
      
      public function get isRendering() : Boolean
      {
         return this._isRendering;
      }
      
      public function startRender(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.render();
         }
         if(!this._isRendering)
         {
            this._scene.addEventListener(Event.ENTER_FRAME,this.render);
            this._isRendering = true;
         }
      }
      
      public function stopRender() : void
      {
         if(this._isRendering)
         {
            this._scene.removeEventListener(Event.ENTER_FRAME,this.render);
            this._isRendering = false;
         }
      }
      
      private function render(param1:Event = null) : void
      {
         var _loc3_:SceneCharacter = null;
         nowTime = getTimer();
         var _loc2_:Array = this._scene.sceneCharacters;
         for each(_loc3_ in _loc2_)
         {
            _loc3_.runWalk();
         }
         this._scene.sceneCamera.run();
         this._scene.sceneMapLayer.run();
         this._scene.sceneAvatarLayer.run();
         this._scene.sceneHeadLayer.run();
         SceneCache.checkUninstall();
      }
   }
}

