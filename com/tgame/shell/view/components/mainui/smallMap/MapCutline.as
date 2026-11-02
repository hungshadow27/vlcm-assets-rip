package com.tgame.shell.view.components.mainui.smallMap
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.MainCharSeachPathManager;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class MapCutline extends Sprite
   {
      
      public static const TYPE_TASK_ABLE:String = "ui.map.task.1";
      
      public static const TYPE_TASK_ING:String = "ui.map.task.2";
      
      public static const TYPE_TASK_COMPLETE:String = "ui.map.task.3";
      
      public static const TYPE_REFRSE_MONSTER_POINT:int = 5;
      
      private var img:Bitmap;
      
      private var _type:int;
      
      public var _data:Object;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FLabel;
      
      private var tip1:FLabel;
      
      public var id:int;
      
      private var _decTextColor:int = 16777215;
      
      private var _showName:Boolean;
      
      public function MapCutline(param1:int, param2:* = null, param3:Boolean = false, param4:int = 16777215)
      {
         super();
         this._type = param1;
         this._data = param2;
         if(param2 != null)
         {
            this.id = param2.id;
         }
         this._showName = param3;
         this._decTextColor = param4;
         this.init();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      private function init() : void
      {
         var tf:TextFormat = null;
         var ft:FTextArea = null;
         this.img = StaticValue.getBitmapByClassName("ui.map.cutline." + this._type);
         this.img.x = -this.img.width / 2;
         this.img.y = -this.img.height / 2;
         addChild(this.img);
         if(this._showName)
         {
            tf = new TextFormat();
            tf.align = "center";
            ft = new FTextArea();
            with(ft)
            {
               
               defaultTextFormat = tf;
               textColor = StaticValue.WHITE;
               autoSize = TextFieldAutoSize.LEFT;
               filters = StaticValue.filter;
               text = _data.name + "\n" + _data.dec;
            }
            addChild(ft);
            ft.x = -ft.width / 2;
            ft.y = this.img.y - ft.height + 10;
         }
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FLabel();
         with(this.tip)
         {
            x = 2;
            y = 2;
            textColor = _decTextColor;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.tip1 = new FLabel();
         with(this.tip1)
         {
            x = 2;
            y = tip.height + 2;
            textColor = _decTextColor;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip1);
         addEventListener(MouseEvent.CLICK,this.onMouse);
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
      }
      
      public function setType(param1:String = "") : void
      {
         if(param1 == "")
         {
            this.img.bitmapData = StaticValue.getBitmapByClassName("ui.map.cutline." + this._type).bitmapData;
         }
         else
         {
            this.img.bitmapData = StaticValue.getBitmapByClassName(param1).bitmapData;
            this.img.x = -this.img.width / 2;
            this.img.y = -this.img.height / 2;
         }
      }
      
      public function changeType(param1:int) : void
      {
         if(this._type != param1)
         {
            this._type = param1;
            this.img.bitmapData = StaticValue.getBitmapByClassName("ui.map.cutline." + this._type).bitmapData;
            this.img.x = -this.img.width / 2;
            this.img.y = -this.img.height / 2;
         }
      }
      
      public function changeData(param1:Object) : void
      {
         this._data = param1;
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               addEventListener(MouseEvent.MOUSE_MOVE,this.onMouse);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip();
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouse);
               break;
            case MouseEvent.CLICK:
               if(this._data)
               {
                  if(this._type == 1 || this._type == 6 || this._type == 7 || this._type == 8)
                  {
                     MainCharSeachPathManager.mainCharWalk(this._data.id.toString());
                  }
                  else if(this._data.xy != null)
                  {
                     MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + Math.round(this._data.xy.x / 25) + "," + Math.round(this._data.xy.y / 25) + "," + 0);
                  }
                  else
                  {
                     _loc2_ = 1 / GameInstance.scene.mapConfig.widthScale;
                     _loc3_ = 1 / GameInstance.scene.mapConfig.heightScale;
                     MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + Math.round(x * _loc2_ / 25) + "," + Math.round(y * _loc3_ / 25) + "," + 0);
                  }
               }
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouse);
         }
      }
      
      private function showTip() : void
      {
         if(this._data == null)
         {
            return;
         }
         this.tip.text = this._data.name;
         if(Boolean(this._data.dec) && this._data.dec != "")
         {
            this.tip1.text = this._data.dec;
            this.tip1.y = this.tip.height + 2;
            this.tip1.visible = true;
         }
         else
         {
            this.tip1.visible = false;
         }
         stage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width > this.tip1.width ? this.tip.width + 4 : this.tip1.width + 4;
         this.tipCanvas.height = this.tip.height + this.tip1.height + 4;
         if(Tools.currentStage.mouseX + this.tipCanvas.width + 15 > GameConfig.sceneWidth)
         {
            this.tipCanvas.x = Tools.currentStage.mouseX - this.tipCanvas.width;
         }
         else
         {
            this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         }
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      private function destroy() : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
         removeEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
      }
   }
}

