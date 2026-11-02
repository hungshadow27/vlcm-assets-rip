package com.tgame.manager
{
   import com.fireice.panel.FPanel;
   import com.fireice.util.LayoutManager;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ResizeManager
   {
      
      private static var obj1:DisplayObject;
      
      private static var obj2:DisplayObject;
      
      private static var tempX:int = -1;
      
      private static var tempY:int = -1;
      
      public function ResizeManager()
      {
         super();
      }
      
      public static function init() : void
      {
         resize();
         GameInstance.stage.addEventListener(Event.RESIZE,resize);
      }
      
      public static function showDoublePanel(param1:DisplayObject, param2:DisplayObject) : void
      {
         obj1 = param1;
         obj2 = param2;
         LayoutManager.getInstance().addLayoutObject(obj1,LayoutManager.CENTER,new Point(-Object(obj1).panelWidth,-Object(obj1).panelHeight / 2));
         LayoutManager.getInstance().addLayoutObject(obj2,LayoutManager.CENTER,new Point(0,-Object(obj1).panelHeight / 2));
         LayoutManager.getInstance().onStageResize();
      }
      
      public static function hideDoublePanel() : void
      {
         if(obj1)
         {
            LayoutManager.getInstance().removeLayoutObject(obj1);
            obj1 = null;
         }
         if(obj2)
         {
            LayoutManager.getInstance().removeLayoutObject(obj2);
            obj2 = null;
         }
      }
      
      public static function resize(param1:Event = null) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:int = 0;
         var _loc7_:FPanel = null;
         var _loc8_:String = null;
         GameConfig.sceneWidth = GameInstance.stage.stageWidth;
         GameConfig.sceneHeight = GameInstance.stage.stageHeight;
         if(GameInstance.scene != null)
         {
            GameInstance.scene.reSize(GameConfig.sceneWidth,GameConfig.sceneHeight);
         }
         if(GameInstance.uiInstance._mainUI != null)
         {
            GameInstance.uiInstance._mainUI.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
         }
         if(GameInstance.uiInstance.loginUI != null)
         {
            GameInstance.uiInstance.loginUI.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
         }
         if(GameInstance.uiInstance._loadingBar != null)
         {
            GameInstance.uiInstance._loadingBar.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
         }
         if(GameInstance.uiInstance._ridePanel != null)
         {
            GameInstance.uiInstance._ridePanel.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
         }
         if(GameInstance.scene != null)
         {
            _loc4_ = GameInstance.scene.customLayer.globalToLocal(new Point(0,0));
            _loc5_ = GameInstance.scene.customLayer.globalToLocal(new Point(GameConfig.sceneWidth,GameConfig.sceneHeight));
            HighEffectManager.setShowArea(new Rectangle(_loc4_.x,_loc4_.y,_loc5_.x - _loc4_.x,_loc5_.y - _loc4_.y));
         }
         TopTipManager.getInstance().resize();
         var _loc3_:int = GameInstance.uiInstance.uiContainer.numChildren;
         if(_loc3_ > 0)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc3_)
            {
               _loc2_ = GameInstance.uiInstance.uiContainer.getChildAt(_loc6_);
               if(_loc2_ != GameInstance.uiInstance._mainUI && _loc2_ != GameInstance.uiInstance.loginUI)
               {
                  if(!(obj1 != null && obj2 != null && (_loc2_ == obj1 || _loc2_ == obj2)))
                  {
                     if(_loc2_ is FPanel)
                     {
                        _loc7_ = _loc2_ as FPanel;
                        _loc2_.x = GameConfig.sceneWidth / 2 - _loc7_.panelWidth / 2;
                        _loc2_.y = GameConfig.sceneHeight / 2 - _loc7_.panelHeight / 2;
                     }
                     else
                     {
                        _loc2_.x = GameConfig.sceneWidth / 2 - _loc2_.width / 2;
                        _loc2_.y = GameConfig.sceneHeight / 2 - _loc2_.height / 2;
                     }
                  }
               }
               _loc6_++;
            }
         }
         _loc3_ = GameInstance.uiInstance.bloodContainer.numChildren;
         if(_loc3_ > 0)
         {
            _loc6_ = 0;
            for(; _loc6_ < _loc3_; _loc6_++)
            {
               _loc2_ = GameInstance.uiInstance.bloodContainer.getChildAt(_loc6_);
               if(_loc2_.hasOwnProperty("type"))
               {
                  _loc8_ = OtherConst.JIUYINSHENZHUA_TYPE;
                  if(_loc2_["type"] == OtherConst.JIUYINSHENZHUA_TYPE)
                  {
                     _loc2_.x = (GameConfig.sceneWidth - 500) * 0.5;
                     _loc2_.y = (GameConfig.sceneHeight - 350) * 0.5;
                     continue;
                  }
                  if(_loc2_["type"] == OtherConst.XUEDAO_MC_TYPE)
                  {
                     _loc2_.x = (GameConfig.sceneWidth - 750) * 0.5;
                     _loc2_.y = (GameConfig.sceneHeight - 750) * 0.5;
                     continue;
                  }
                  if(_loc2_["type"] == OtherConst.HUAKUANG_TYPE)
                  {
                     HighEffectManager.showFlower_kuang();
                     continue;
                  }
                  if(_loc2_["type"] == OtherConst.LIPAO_TYPE)
                  {
                     HighEffectManager.showLiPao_kuang();
                     continue;
                  }
                  if(_loc2_["type"] == OtherConst.DUOMINGSHISANJIAN_MC_TYPE)
                  {
                     _loc2_.x = (GameConfig.sceneWidth - 750) * 0.5;
                     _loc2_.y = (GameConfig.sceneHeight - 750) * 0.5;
                     continue;
                  }
               }
               _loc2_.x = 0;
               _loc2_.y = 0;
               _loc2_.width = GameConfig.sceneWidth;
               _loc2_.height = GameConfig.sceneHeight;
            }
         }
         if(POPWindowManager.popWindow != null)
         {
            POPWindowManager.popWindow.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
         }
         SmallLoadingBar.loading_resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
         if(GameInstance.uiInstance._npcDialogPanel != null)
         {
            GameInstance.uiInstance._npcDialogPanel.y += 150;
         }
         if(GameInstance.uiInstance._kuafu3v3VSResultPanel != null)
         {
            GameInstance.uiInstance.kuafu3v3VSResultPanel.y = GameInstance.stage.stageHeight * 0.12;
         }
         resizeSitPanel();
      }
      
      public static function resizeSitPanel() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Point = null;
         if(Fun.isVisible(GameInstance.uiInstance._buttonContainer))
         {
            _loc1_ = GameInstance.mainChar.piexl_x - 100;
            _loc2_ = GameInstance.mainChar.piexl_y + 45;
            _loc3_ = GameInstance.scene.localToGlobal(new Point(_loc1_,_loc2_));
            _loc3_ = GameInstance.uiInstance.uiContainer.globalToLocal(_loc3_);
            GameInstance.uiInstance._buttonContainer.x = _loc3_.x;
            GameInstance.uiInstance._buttonContainer.y = _loc3_.y;
         }
      }
   }
}

