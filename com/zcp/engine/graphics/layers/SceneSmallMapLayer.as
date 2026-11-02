package com.zcp.engine.graphics.layers
{
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.Scene;
   import flash.display.Sprite;
   
   public class SceneSmallMapLayer extends Sprite
   {
      
      private var _scene:Scene;
      
      public function SceneSmallMapLayer(param1:Scene)
      {
         super();
         this._scene = param1;
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      public function dispose() : void
      {
         Fun.clearChildren(this,false,false);
      }
   }
}

