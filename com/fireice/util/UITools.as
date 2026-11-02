package com.fireice.util
{
   import com.fireice.button.FButton;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.tree.FTree;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import flash.utils.getQualifiedClassName;
   
   public class UITools
   {
      
      private static var container:Sprite;
      
      private static var tree:FTree;
      
      private static var scroll:FVScorllBar;
      
      private static var target:DisplayObjectContainer;
      
      private static var currObj:DisplayObject;
      
      private static var arr:Array;
      
      private static var _currKey:*;
      
      private static var text:FLabel;
      
      private static var btn:FButton;
      
      private static var isInit:Boolean;
      
      private static var filters:Array = [new GlowFilter(16711680)];
      
      private static var oldFilters:Array = [];
      
      private static var _onCtrl:Boolean = false;
      
      public function UITools()
      {
         super();
      }
      
      public static function init(param1:DisplayObjectContainer) : void
      {
         if(isInit)
         {
            return;
         }
         target = param1;
         container = new Sprite();
         tree = new FTree();
         tree.treeWidth = 500;
         tree.treeHeight = 200;
         tree.addEventListener(MouseEvent.CLICK,onClick);
         container.addChild(tree);
         scroll = new FVScorllBar(tree,200);
         scroll.x = 500;
         container.addChild(scroll);
         Tools.currentStage.addChild(container);
         scroll.update();
         arr = [];
         tree.dataProvider = getUIItem(target);
         container.graphics.beginFill(0);
         container.graphics.drawRect(0,0,500,250);
         container.graphics.endFill();
         text = new FLabel();
         container.addChild(text);
         text.textColor = 16777215;
         text.y = 205;
         btn = new FButton();
         btn.label = "刷新";
         container.addChild(btn);
         btn.x = 200;
         btn.y = 205;
         btn.addEventListener(MouseEvent.CLICK,refresh);
         Tools.currentStage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
         Tools.currentStage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
         container.addEventListener(MouseEvent.MOUSE_DOWN,onMouse);
         container.addEventListener(MouseEvent.MOUSE_UP,onMouse);
         isInit = true;
      }
      
      protected static function onMouse(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_DOWN:
               container.startDrag(false,new Rectangle(0,0,Tools.currentStage.stageWidth - 200,Tools.currentStage.stageHeight - 250));
               break;
            case MouseEvent.MOUSE_UP:
               container.stopDrag();
         }
      }
      
      protected static function onKeyDown(param1:KeyboardEvent) : void
      {
         _currKey = param1.keyCode;
         _onCtrl = param1.ctrlKey;
         target.addEventListener(Event.ENTER_FRAME,onenter);
      }
      
      protected static function onKeyUp(param1:KeyboardEvent) : void
      {
         _currKey = 0;
         target.removeEventListener(Event.ENTER_FRAME,onenter);
      }
      
      private static function refresh(param1:Event) : void
      {
         arr = [];
         tree.dataProvider = getUIItem(target);
      }
      
      private static function onClick(param1:MouseEvent) : void
      {
         scroll.update(true);
         if(!tree.selectItem || !tree.selectItem.data)
         {
            return;
         }
         if(Boolean(currObj) && Boolean(oldFilters))
         {
            currObj.filters = oldFilters;
         }
         currObj = arr[parseInt(tree.selectItem.data)];
         oldFilters = currObj.filters;
         currObj.filters = filters;
         text.text = "X:" + currObj.x + "  Y:" + currObj.y;
      }
      
      private static function getUIItem(param1:DisplayObjectContainer) : XML
      {
         var _loc2_:int = 0;
         var _loc4_:DisplayObject = null;
         var _loc5_:XML = null;
         var _loc6_:XML = null;
         var _loc3_:int = param1.numChildren;
         if(param1 == target)
         {
            _loc5_ = <node label="root"/>;
         }
         else
         {
            _loc5_ = <node label={getQualifiedClassName(param1)} data={arr.push(param1) - 1}/>;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1.getChildAt(_loc2_);
            if(_loc4_ is DisplayObjectContainer && (_loc4_ as DisplayObjectContainer).numChildren > 0)
            {
               _loc5_.appendChild(getUIItem(_loc4_ as DisplayObjectContainer));
            }
            else
            {
               _loc6_ = <node label={getQualifiedClassName(_loc4_)} data={arr.push(_loc4_) - 1}/>;
               _loc5_.appendChild(_loc6_);
            }
            _loc2_++;
         }
         return _loc5_;
      }
      
      private static function onenter(param1:Event) : void
      {
         var _loc2_:int = _onCtrl ? 5 : 1;
         if(Boolean(currObj) && Boolean(_currKey))
         {
            switch(_currKey)
            {
               case Keyboard.LEFT:
                  currObj.x -= _loc2_;
                  break;
               case Keyboard.RIGHT:
                  currObj.x += _loc2_;
                  break;
               case Keyboard.UP:
                  currObj.y -= _loc2_;
                  break;
               case Keyboard.DOWN:
                  currObj.y += _loc2_;
            }
            text.text = "X:" + currObj.x + "  Y:" + currObj.y;
         }
      }
   }
}

