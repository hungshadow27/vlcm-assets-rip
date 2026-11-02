package com.tgame.common.ui.componets
{
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   import flash.utils.getQualifiedClassName;
   
   public class Menu extends FCanvas
   {
      
      public static const MENUITEM_CLICK:String = "ui.menu.item.click";
      
      private var _target:DisplayObject;
      
      private var menuList:FList;
      
      public function Menu()
      {
         super();
         skin = "menuBg";
         this.menuList = new FList();
         this.menuList.skin = "menuList";
         this.menuList.x = 2;
         this.menuList.y = 12;
         this.menuList.itemRenderer = new MenuListRender();
         this.menuList.listWidth = 85;
         width = 89;
         addChild(this.menuList);
         this.menuList.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public static function addMenuItem(param1:Array, param2:MouseEvent) : Menu
      {
         var _loc3_:Menu = new Menu();
         _loc3_.MenuItems = param1;
         _loc3_.addParent(Tools.currentStage);
         _loc3_._target = param2.target as DisplayObject;
         if(param2.stageX + 5 + _loc3_.width > GameConfig.sceneWidth)
         {
            _loc3_.x = param2.stageX - 5 - _loc3_.width;
         }
         else
         {
            _loc3_.x = param2.stageX + 5;
         }
         if(param2.stageY + 5 + _loc3_.height > GameConfig.sceneHeight)
         {
            _loc3_.y = param2.stageY - 5 - _loc3_.height;
         }
         else
         {
            _loc3_.y = param2.stageY + 5;
         }
         return _loc3_;
      }
      
      private function relayout() : void
      {
         height = this.menuList.height + 14;
      }
      
      private function set MenuItems(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Object = null;
         var _loc3_:int = int(param1.length);
         var _loc5_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(param1[_loc2_] is String)
            {
               _loc4_ = {
                  "label":param1[_loc2_],
                  "state":1
               };
            }
            else
            {
               _loc4_ = {
                  "label":param1[_loc2_].name,
                  "state":param1[_loc2_].state,
                  "color":param1[_loc2_].color
               };
            }
            _loc5_.push(_loc4_);
            _loc2_++;
         }
         this.menuList.dataProvider = _loc5_;
         this.relayout();
      }
      
      private function addParent(param1:DisplayObjectContainer) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = param1.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(getQualifiedClassName(param1.getChildAt(_loc2_)) == "com.tgame.common.ui.componets::Menu")
            {
               (param1.getChildAt(_loc2_) as Menu).destroy();
               break;
            }
            _loc2_++;
         }
         param1.addChild(this);
         stage.addEventListener(MouseEvent.CLICK,this.onStageClick);
         GameInstance.stage.focus = GameInstance.stage;
      }
      
      private function onStageClick(param1:MouseEvent) : void
      {
         if(param1.target == this._target || param1.target.parent == this)
         {
            return;
         }
         this.destroy();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.menuList.selectItem != null)
         {
            dispatchEvent(new BaseEvent(Menu.MENUITEM_CLICK,"",this.menuList.selectItem.label));
         }
         this.destroy();
      }
      
      public function destroy() : void
      {
         if(stage)
         {
            stage.removeEventListener(MouseEvent.CLICK,this.onStageClick);
         }
         if(parent)
         {
            parent.removeChild(this);
         }
      }
   }
}

