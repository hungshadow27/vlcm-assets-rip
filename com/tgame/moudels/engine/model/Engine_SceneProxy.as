package com.tgame.moudels.engine.model
{
   import com.tgame.common.GameInstance;
   import com.zcp.engine.Scene;
   import flash.geom.Point;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Engine_SceneProxy extends Proxy
   {
      
      public static const NAME:String = "Engine_SceneProxy";
      
      public function Engine_SceneProxy(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      protected function get scene() : Scene
      {
         return data as Scene;
      }
      
      public function updateMainCharInSmallMap() : void
      {
         var _loc1_:Point = new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y);
         var _loc2_:int = GameInstance.mainChar.getLogicAngle();
         GameInstance.uiInstance.popMapPanel.setCharXY(_loc1_);
         GameInstance.uiInstance.popMapPanel.setCharDirection(_loc2_);
         GameInstance.uiInstance.mainUI.setCharXY(_loc1_);
         GameInstance.uiInstance.mainUI.setCharDirection(_loc2_);
      }
   }
}

