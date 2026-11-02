package com.zcp.engine.graphics.layers
{
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.Scene;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.SceneRender;
   import com.zcp.engine.graphics.tagger.HeadFace;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class SceneHeadLayer extends Sprite
   {
      
      private var _scene:Scene;
      
      public var nowTime:int;
      
      public var IsGengxin:Boolean = false;
      
      public var gengxinJiange:int = 100;
      
      public function SceneHeadLayer(param1:Scene)
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
      
      public function run() : void
      {
         var _loc2_:SceneCharacter = null;
         var _loc3_:Rectangle = null;
         var _loc4_:Number = NaN;
         if(SceneRender.nowTime - this.nowTime > this.gengxinJiange)
         {
            this.IsGengxin = true;
         }
         else
         {
            this.IsGengxin = false;
         }
         var _loc1_:Array = this._scene.sceneCharacters;
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_.headFace != null)
            {
               if(this.IsGengxin)
               {
                  _loc2_.headFace.setCentreIcoRen();
               }
               if(_loc2_.headFace.autoUpdateY)
               {
                  _loc3_ = _loc2_.mouseRect;
                  _loc4_ = _loc3_ != null ? _loc3_.y - _loc2_.piexl_y - HeadFace.HEADFACE_SPACE : HeadFace.DEFAULT_HEADFACE_Y;
                  if(_loc2_.headFace.y != _loc4_)
                  {
                     _loc2_.headFace.y = _loc4_;
                  }
               }
               _loc2_.headFace.checkTalkTime();
               if(_loc2_.isSelected)
               {
                  if(!_loc2_.avatar.visible && _loc2_.headFace.parent != null)
                  {
                     _loc2_.headFace.swapShine();
                  }
                  else
                  {
                     _loc2_.headFace.swapShine(true);
                  }
               }
               else
               {
                  _loc2_.headFace.swapShine(true);
               }
            }
         }
         if(this.IsGengxin)
         {
            this.nowTime = SceneRender.nowTime;
         }
      }
   }
}

