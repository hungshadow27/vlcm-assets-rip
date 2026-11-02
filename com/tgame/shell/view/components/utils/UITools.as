package com.tgame.shell.view.components.utils
{
   import com.fireice.base.FUITextField;
   import com.fireice.button.FButton;
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.task.TaskRes;
   import com.tgame.common.res.task.TaskResManager;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import game.display.Button;
   import game.display.SimpleButton;
   import gs.TweenLite;
   
   public class UITools
   {
      
      public function UITools()
      {
         super();
      }
      
      public static function creatTextField(param1:DisplayObjectContainer, param2:String = "", param3:Number = 0, param4:Number = 0, param5:int = 12, param6:uint = 0, param7:String = "", param8:Boolean = false, param9:Number = 0, param10:String = "left", param11:String = "left", param12:Boolean = true) : TextField
      {
         var _loc13_:TextField = null;
         _loc13_ = new TextField();
         if(param9 > 0)
         {
            _loc13_.width = param9;
         }
         var _loc14_:TextFormat = new TextFormat(null,param5,param6);
         _loc14_.font = param7 ? param7 : Tools.font;
         _loc14_.bold = param8;
         _loc14_.align = param11;
         _loc13_.defaultTextFormat = _loc14_;
         _loc13_.height = 1;
         if(param10 == TextFieldAutoSize.LEFT)
         {
            _loc13_.autoSize = param10;
         }
         else
         {
            _loc13_.height = param5 + 6;
         }
         _loc13_.selectable = false;
         _loc13_.mouseEnabled = false;
         _loc13_.blendMode = BlendMode.LAYER;
         _loc13_.text = param2;
         _loc13_.x = param3;
         _loc13_.y = param4;
         param1.addChild(_loc13_);
         if(param12)
         {
            _loc13_.filters = StaticValue.filter;
         }
         return _loc13_;
      }
      
      public static function creatFTextArea(param1:DisplayObjectContainer, param2:Number = 0, param3:Number = 0, param4:Number = 100, param5:Number = 100, param6:uint = 0, param7:String = "", param8:String = "", param9:String = "left", param10:Boolean = true) : FTextArea
      {
         var _loc11_:FTextArea = null;
         var _loc12_:TextFormat = null;
         _loc11_ = new FTextArea();
         _loc11_.x = param2;
         _loc11_.y = param3;
         _loc11_.width = param4;
         _loc11_.height = param5;
         _loc11_.textColor = param6;
         if(param9 == TextFormatAlign.LEFT)
         {
            _loc11_.autoSize = param9;
         }
         else
         {
            _loc12_ = _loc11_.defaultTextFormat;
            _loc12_.align = param9;
            _loc11_.defaultTextFormat = _loc12_;
         }
         _loc11_.wordWrap = true;
         if(param8)
         {
            _loc11_.htmlText = param8;
         }
         else
         {
            _loc11_.text = param7;
         }
         param1.addChild(_loc11_);
         _loc11_.mouseEnabled = false;
         if(param10)
         {
            _loc11_.filters = StaticValue.filter;
         }
         return _loc11_;
      }
      
      public static function creatLabel(param1:DisplayObjectContainer, param2:Number, param3:Number, param4:String = "", param5:String = "", param6:int = -1, param7:int = 12, param8:Number = -1, param9:String = "left", param10:Boolean = true) : FUITextField
      {
         var _loc11_:FUITextField = new FUITextField();
         _loc11_.selectable = _loc11_.mouseEnabled = false;
         if(param6 != -1)
         {
            _loc11_.textColor = param6;
         }
         var _loc12_:TextFormat = _loc11_.defaultTextFormat;
         _loc12_.size = param7;
         if(param8 > 0)
         {
            _loc12_.color = param6;
            _loc12_.align = param9;
            _loc11_.width = param8;
         }
         else
         {
            _loc11_.autoSize = TextFieldAutoSize.LEFT;
         }
         _loc11_.defaultTextFormat = _loc12_;
         if(param5)
         {
            _loc11_.htmlText = param5;
         }
         else
         {
            _loc11_.text = param4;
         }
         _loc11_.x = param2;
         _loc11_.y = param3;
         if(Boolean(param4) || Boolean(param5))
         {
            _loc11_.height = _loc11_.textHeight + 4;
         }
         param1.addChild(_loc11_);
         if(param10)
         {
            _loc11_.filters = StaticValue.filter;
         }
         return _loc11_;
      }
      
      public static function creatInput(param1:DisplayObjectContainer, param2:Number, param3:Number, param4:int = -1, param5:int = 12, param6:Number = -1, param7:String = "left", param8:String = "", param9:Boolean = true) : FTextInput
      {
         var _loc10_:FTextInput = new FTextInput();
         if(param4 != -1)
         {
            _loc10_.textColor = param4;
         }
         var _loc11_:TextFormat = _loc10_.defaultTextFormat;
         _loc11_.size = param5;
         if(param6 > 0)
         {
            _loc11_.color = param4;
            _loc11_.align = param7;
            _loc10_.width = param6;
         }
         else
         {
            _loc10_.autoSize = TextFieldAutoSize.LEFT;
         }
         _loc10_.defaultTextFormat = _loc11_;
         _loc10_.text = param8;
         _loc10_.x = param2;
         _loc10_.y = param3;
         param1.addChild(_loc10_);
         if(param9)
         {
            _loc10_.filters = StaticValue.filter;
         }
         return _loc10_;
      }
      
      public static function setTextFormat(param1:TextField, param2:int, param3:int, param4:Boolean) : TextFormat
      {
         var _loc5_:TextFormat = new TextFormat("Arial",param2,param3,param4);
         param1.defaultTextFormat = _loc5_;
         param1.text = param1.text;
         return _loc5_;
      }
      
      public static function creatBtn(param1:DisplayObjectContainer, param2:String, param3:Number = 0, param4:Number = 0, param5:Class = null, param6:String = "", param7:Function = null) : *
      {
         if(!param5)
         {
            param5 = FButton;
         }
         var _loc8_:* = new param5();
         if(_loc8_.hasOwnProperty("label"))
         {
            _loc8_["label"] = param2;
         }
         if(_loc8_ is FSimpleButton)
         {
            (_loc8_ as FSimpleButton).skin = param6;
         }
         _loc8_.x = param3;
         _loc8_.y = param4;
         param1.addChild(_loc8_);
         if(param7 != null)
         {
            (_loc8_ as DisplayObject).addEventListener(MouseEvent.CLICK,param7);
         }
         return _loc8_;
      }
      
      public static function creatMask(param1:DisplayObject, param2:DisplayObjectContainer, param3:Number = 0, param4:Number = 0, param5:Number = 100, param6:Number = 100) : Shape
      {
         var _loc7_:Shape = new Shape();
         var _loc8_:Graphics = _loc7_.graphics;
         _loc8_.beginFill(0);
         _loc8_.drawRect(0,0,param5,param6);
         _loc8_.endFill();
         _loc7_.x = param3;
         _loc7_.y = param4;
         param2.addChild(_loc7_);
         param1.mask = _loc7_;
         return _loc7_;
      }
      
      public static function creatBitmap(param1:DisplayObjectContainer, param2:String, param3:Number = 0, param4:Number = 0) : Bitmap
      {
         var _loc5_:Bitmap = StaticValue.getBitmapByClassName(param2);
         addChildAtPos(_loc5_,param1,param3,param4);
         return _loc5_;
      }
      
      public static function creatF9GrideBitmap(param1:DisplayObjectContainer, param2:String, param3:Number = 0, param4:Number = 0, param5:Number = 0, param6:Number = 0) : F9GridBitmap
      {
         var _loc7_:F9GridBitmap = Tools.get9GridBitmpByName(param2);
         if(param5)
         {
            _loc7_.width = param5;
         }
         if(param6 != -1)
         {
            _loc7_.height = param6;
         }
         addChildAtPos(_loc7_,param1,param3,param4);
         return _loc7_;
      }
      
      public static function dressSprite(param1:DisplayObject) : Sprite
      {
         var _loc2_:DisplayObjectContainer = param1.parent;
         var _loc3_:Sprite = new Sprite();
         _loc3_.x = param1.x;
         _loc3_.y = param1.y;
         param1.x = param1.y = 0;
         _loc3_.addChild(param1);
         if(_loc2_)
         {
            _loc2_.addChild(_loc3_);
         }
         return _loc3_;
      }
      
      public static function removeAll(param1:DisplayObjectContainer) : void
      {
         while(param1.numChildren)
         {
            param1.removeChildAt(0);
         }
      }
      
      public static function removeChild(param1:DisplayObject) : void
      {
         if(Boolean(param1) && Boolean(param1.parent))
         {
            param1.parent.removeChild(param1);
         }
      }
      
      public static function addChildAtPos(param1:DisplayObject, param2:DisplayObjectContainer, param3:Number = 0, param4:Number = 0) : void
      {
         param1.x = param3;
         param1.y = param4;
         param2.addChild(param1);
      }
      
      public static function drawRect(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number, param6:int = 0, param7:Number = 1) : void
      {
         param1.beginFill(param6,param7);
         param1.drawRect(param2,param3,param4,param5);
         param1.endFill();
      }
      
      public static function str2html(param1:*, param2:String, param3:int = -1, param4:Boolean = false) : String
      {
         var _loc5_:String = "<font color=\'" + param2 + "\'";
         if(param3 != -1)
         {
            _loc5_ += " size=\'" + param3 + "\'";
         }
         _loc5_ += ">" + String(param1) + "</font>";
         if(param4)
         {
            _loc5_ = "<u>" + _loc5_ + "</u>";
         }
         return _loc5_;
      }
      
      public static function strAddHtmlLeading(param1:String, param2:int) : String
      {
         param1 = "<textformat leading=\'" + param2 + "\'>" + param1;
         return param1 + "</textformat>";
      }
      
      public static function showPanel(param1:DisplayObject, param2:Boolean = true) : void
      {
         var _loc4_:FPanel = null;
         var _loc5_:BasePanel = null;
         var _loc3_:Sprite = GameInstance.uiInstance.uiContainer;
         if(param1.parent == _loc3_)
         {
            _loc3_.setChildIndex(param1,_loc3_.numChildren - 1);
         }
         else
         {
            if(param2)
            {
               if(param1 is FPanel)
               {
                  _loc4_ = param1 as FPanel;
                  param1.x = GameConfig.sceneWidth / 2 - _loc4_.panelWidth / 2;
                  param1.y = GameConfig.sceneHeight / 2 - _loc4_.panelHeight / 2;
               }
               else if(param1 is BasePanel)
               {
                  _loc5_ = param1 as BasePanel;
                  param1.x = GameConfig.sceneWidth / 2 - _loc5_.panelWidth / 2;
                  param1.y = GameConfig.sceneHeight / 2 - _loc5_.panelHeight / 2;
               }
               else
               {
                  param1.x = GameConfig.sceneWidth / 2 - param1.width / 2;
                  param1.y = GameConfig.sceneHeight / 2 - param1.height / 2;
               }
            }
            _loc3_.addChild(param1);
         }
      }
      
      public static function sideBySide(param1:DisplayObject, param2:DisplayObject) : void
      {
         var _loc3_:Stage = GameInstance.stage;
         var _loc4_:Number = param1.width + param2.width;
         var _loc5_:Number = Math.max(param1.height,param2.height);
         param1.x = (_loc3_.stageWidth - _loc4_) / 2;
         param2.x = param1.x + param1.width;
         param1.y = param2.y = (_loc3_.stageHeight - _loc5_) / 2;
      }
      
      public static function showHidePanel(param1:DisplayObject, param2:Boolean = true, param3:Boolean = false) : void
      {
         var _loc5_:FPanel = null;
         var _loc6_:BasePanel = null;
         var _loc4_:Sprite = GameInstance.uiInstance.uiContainer;
         if(param1.parent == _loc4_)
         {
            _loc4_.removeChild(param1);
         }
         else
         {
            if(param2)
            {
               if(param1 is FPanel)
               {
                  _loc5_ = param1 as FPanel;
                  param1.x = GameConfig.sceneWidth / 2 - _loc5_.panelWidth / 2;
                  param1.y = GameConfig.sceneHeight / 2 - _loc5_.panelHeight / 2;
               }
               else if(param1 is BasePanel)
               {
                  _loc6_ = param1 as BasePanel;
                  param1.x = GameConfig.sceneWidth / 2 - _loc6_.panelWidth / 2;
                  param1.y = GameConfig.sceneHeight / 2 - _loc6_.panelHeight / 2;
               }
               else
               {
                  param1.x = GameConfig.sceneWidth / 2 - param1.width / 2;
                  param1.y = GameConfig.sceneHeight / 2 - param1.height / 2;
               }
            }
            _loc4_.addChild(param1);
         }
      }
      
      public static function getTaskCloud(param1:Boolean, param2:*, param3:int) : String
      {
         var _loc4_:TaskRes = TaskResManager.getTaskRes(param3);
         if(!param1)
         {
            return "";
         }
         return "<![CDATA[ ]]><a href=\'" + param3 + "&" + param2 + "\'><mc src=\'com.tgame.shell.view.components.mainui.smallMap.CloudBtn\'/></a>";
      }
      
      public static function cut2There(param1:DisplayObject, param2:DisplayObjectContainer) : void
      {
         if(!param2.stage || !param1.stage)
         {
            return;
         }
         var _loc3_:Point = param1.localToGlobal(new Point());
         _loc3_ = param2.globalToLocal(_loc3_);
         param1.x = _loc3_.x;
         param1.y = _loc3_.y;
         param2.addChild(param1);
      }
      
      public static function setBtnEnable(param1:*, param2:Boolean) : void
      {
         var _loc3_:FSimpleButton = null;
         var _loc4_:FButton = null;
         var _loc5_:Button = null;
         var _loc6_:SimpleButton = null;
         if(param1 is FSimpleButton)
         {
            _loc3_ = param1 as FSimpleButton;
            _loc3_.enabled = _loc3_.mouseEnabled = _loc3_.mouseChildren = param2;
         }
         else if(param1 is FButton)
         {
            _loc4_ = param1 as FButton;
            _loc4_.enabled = _loc4_.mouseEnabled = _loc4_.mouseChildren = param2;
         }
         else if(param1 is Button)
         {
            _loc5_ = param1 as Button;
            _loc5_.enabled = _loc5_.mouseEnabled = _loc5_.mouseChildren = param2;
         }
         if(param1 is SimpleButton)
         {
            _loc6_ = param1 as SimpleButton;
            _loc6_.enabled = _loc6_.mouseEnabled = _loc6_.mouseChildren = param2;
         }
      }
      
      public static function setBtnMouseEnable(param1:*, param2:Boolean) : void
      {
         var _loc3_:FSimpleButton = null;
         var _loc4_:FButton = null;
         if(param1 is FSimpleButton)
         {
            _loc3_ = param1 as FSimpleButton;
            _loc3_.mouseEnabled = _loc3_.mouseChildren = param2;
         }
         else if(param1 is FButton)
         {
            _loc4_ = param1 as FButton;
            _loc4_.mouseEnabled = _loc4_.mouseChildren = param2;
         }
      }
      
      public static function disposeTween(param1:TweenLite) : void
      {
         TweenLite.removeTween(param1);
         TweenLite.killTweensOf([param1]);
      }
      
      public static function moveDisplayObject(param1:DisplayObject, param2:Number, param3:Number) : void
      {
         if(param1)
         {
            param1.x = param2;
            param1.y = param3;
         }
      }
   }
}

