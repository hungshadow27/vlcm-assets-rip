package com.tgame.common.utils
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.*;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ToolTips
   {
      
      private static var tip:FTextArea;
      
      private static var tipCanvas:FCanvas = null;
      
      public function ToolTips()
      {
         super();
         throw new Error("不能直接实例化类ToolTips");
      }
      
      public static function createToolTips(param1:DisplayObject, param2:*, param3:Function) : void
      {
         var o:DisplayObject = param1;
         var that:* = param2;
         var func:Function = param3;
         if(tipCanvas == null)
         {
            tipCanvas = new FCanvas();
            tipCanvas.skin = "backGroud";
            tip = new FTextArea();
            with(tip)
            {
               
               x = 2;
               y = 2;
               autoSize = TextFieldAutoSize.LEFT;
               textColor = StaticValue.WHITE;
               filters = StaticValue.filter;
            }
            tipCanvas.addChild(tip);
         }
         if(!o.hasEventListener(MouseEvent.MOUSE_OVER))
         {
            o.addEventListener(MouseEvent.MOUSE_OVER,function(param1:MouseEvent):void
            {
               tip.htmlText = func(that,param1);
               o.addEventListener(MouseEvent.MOUSE_MOVE,onMouseTip);
            });
         }
         if(!o.hasEventListener(MouseEvent.MOUSE_OUT))
         {
            o.addEventListener(MouseEvent.MOUSE_OUT,onMouseTip);
         }
      }
      
      private static function onMouseTip(param1:MouseEvent) : void
      {
         if(!Tools.currentStage.contains(tipCanvas))
         {
            Tools.currentStage.addChild(tipCanvas);
         }
         tipCanvas.visible = false;
         if(tipCanvas.parent != null)
         {
            if(tipCanvas.parent.numChildren > 1)
            {
               tipCanvas.parent.setChildIndex(tipCanvas,tipCanvas.parent.numChildren - 1);
            }
         }
         var _loc2_:* = param1.target;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_MOVE:
               showTip();
               break;
            case MouseEvent.MOUSE_OUT:
               tipCanvas.visible = false;
               _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseTip);
         }
      }
      
      private static function showTip() : void
      {
         tipCanvas.width = tip.width + 4;
         tipCanvas.height = tip.height + 4;
         if(tipCanvas.width > GameConfig.sceneWidth - Tools.currentStage.mouseX - 35)
         {
            tipCanvas.x = Tools.currentStage.mouseX - tipCanvas.width - 10;
         }
         else
         {
            tipCanvas.x = Tools.currentStage.mouseX + 35;
         }
         if(tipCanvas.height > GameConfig.sceneHeight - Tools.currentStage.mouseY - 35)
         {
            tipCanvas.y = Tools.currentStage.mouseY - tipCanvas.height;
         }
         else
         {
            tipCanvas.y = Tools.currentStage.mouseY + 5;
         }
         if(tipCanvas.y < 0)
         {
            tipCanvas.y = 20;
         }
         tipCanvas.visible = true;
      }
   }
}

