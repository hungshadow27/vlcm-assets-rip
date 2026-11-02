package com.tgame.manager
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.ui.componets.rollText.RollText;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.common.utils.ZMath;
   import com.zcp.engine.graphics.tagger.AttackFace;
   import com.zcp.manager.LoaderManager;
   import com.zcp.manager.TimerManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import gs.TweenLite;
   
   public class TopTipManager
   {
      
      private static var _instance:TopTipManager;
      
      private static var filter_enterScene:Array = [new GlowFilter(3591,1,6,6,2,BitmapFilterQuality.LOW)];
      
      private static const SYSTEM_ROLL_SPEED:Number = 0.55;
      
      private static const SYSTEM_ROLL_WIDTH_SCALE:Number = 0.55;
      
      private static const SYSTEM_ROLL_WIDTH_MIN:Number = 200;
      
      private static const SYSTEM_ROLL_U:Number = 0.5;
      
      private static const SYSTEM_ROLL_V:Number = 0.12;
      
      private static const SYSTEM_SWITCH_NUM:int = 5;
      
      private static const SYSTEM_SWITCH_ONE_HEIGHT:int = 26;
      
      private static const SYSTEM_SWITCH_ONE_TIME:Number = 2.5;
      
      private static const SYSTEM_SWITCH_ONE_SWITCH_TIME1:Number = 0.2;
      
      private static const SYSTEM_SWITCH_ONE_SWITCH_TIME2:Number = 1;
      
      private static const SYSTEM_SWITCH_ONE_SWITCH_DIS:Number = 20;
      
      private static const SYSTEM_SWITCH_U:Number = 0.5;
      
      private static const SYSTEM_SWITCH_V:Number = 0.25;
      
      private static var filter_systemSwitch:Array = [new GlowFilter(3591,1,4,4,4,BitmapFilterQuality.LOW)];
      
      private static const CHAR_FOOT_TIME:Number = 5;
      
      private static const CHAR_FOOT_DIS:Number = 100;
      
      private static const CHAR_FOOT_U:Number = 0.55;
      
      private static const CHAR_FOOT_V:Number = 0.55;
      
      private static var filter_char:Array = [new GlowFilter(3591,1,4,4,4,BitmapFilterQuality.LOW)];
      
      private static const CENTER_TIME:Number = 1.8;
      
      private static const CENTER_TIME1:Number = 0.4;
      
      private static const CENTER_TIME2:Number = 0.8;
      
      private static const CENTER_U:Number = 0.5;
      
      private static const CENTER_V:Number = 0.5;
      
      private static var filter_center:Array = [new GlowFilter(3591,1,4,4,4,BitmapFilterQuality.LOW)];
      
      private var _tipContainer:Object = new Object();
      
      private var _txtTipContainer:Object = new Object();
      
      private var _enterSceneTf:TextField = new TextField();
      
      private var _enterSceneTD:TimerData;
      
      private var system_roll_box:Sprite;
      
      private var system_roll_box_mask:Shape;
      
      private var system_switch_box:Sprite;
      
      private var char_foot_box:Sprite;
      
      private var center_box:Sprite;
      
      private var centerUp_box:Sprite;
      
      private var huanchongArr:Array = [];
      
      private var isRunning:Boolean = false;
      
      private var centerUpTf:TextField = new TextField();
      
      private var centerUpTFormat:TextFormat = new TextFormat();
      
      private const centerUp_Box_Y:Number = 85;
      
      public function TopTipManager()
      {
         super();
         this._enterSceneTf.autoSize = TextFieldAutoSize.LEFT;
         this._enterSceneTf.mouseEnabled = false;
         this._enterSceneTf.filters = filter_enterScene;
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.size = 35;
         _loc1_.bold = true;
         _loc1_.font = LanResManager.getLanFont("com.tgame.manager.TopTipManager#楷体");
         _loc1_.color = 11992832;
         this._enterSceneTf.defaultTextFormat = _loc1_;
         this.system_roll_box = new Sprite();
         this.system_roll_box.mouseEnabled = false;
         this.system_roll_box.mouseChildren = false;
         this.system_roll_box_mask = new Shape();
         this.system_roll_box.mask = this.system_roll_box_mask;
         this.system_switch_box = new Sprite();
         this.system_switch_box.mouseEnabled = false;
         this.system_switch_box.mouseChildren = false;
         this.char_foot_box = new Sprite();
         this.char_foot_box.mouseEnabled = false;
         this.char_foot_box.mouseChildren = false;
         this.center_box = new Sprite();
         this.center_box.mouseEnabled = false;
         this.center_box.mouseChildren = false;
         this.centerUp_box = new Sprite();
         this.centerUp_box.mouseEnabled = false;
         this.centerUp_box.mouseChildren = false;
      }
      
      public static function getInstance() : TopTipManager
      {
         if(!_instance)
         {
            _instance = new TopTipManager();
         }
         return _instance;
      }
      
      public function addEnterSceneTip(param1:String) : void
      {
         var id:String;
         var scaleX:Number;
         var scaleY:Number;
         var duration:Number;
         var from:Number;
         var to:Number;
         var delay:Number = NaN;
         var tt:Number = NaN;
         var onUpdate:Function = null;
         var $value:String = param1;
         onUpdate = function(param1:Number):void
         {
            if(param1 < tt)
            {
               _enterSceneTf.alpha = param1 / tt;
            }
            else if(param1 > delay + tt)
            {
               _enterSceneTf.alpha = (tt - (param1 - delay - tt)) / tt;
            }
            else
            {
               _enterSceneTf.alpha = 1;
            }
         };
         this.removeEnterSceneTip();
         id = "map_name";
         scaleX = 0.5;
         scaleY = 0.1;
         delay = 4;
         tt = 0.7;
         this._enterSceneTf.alpha = 0;
         this._enterSceneTf.text = $value;
         this._enterSceneTf.x = GameInstance.stage.stageWidth * scaleX - this._enterSceneTf.width * 0.5;
         this._enterSceneTf.y = GameInstance.stage.stageHeight * scaleY;
         this._txtTipContainer[id] = [this._enterSceneTf,scaleX,scaleY];
         GameInstance.uiInstance.letterContainer.addChild(this._enterSceneTf);
         duration = delay + tt * 2;
         from = 0;
         to = duration;
         this._enterSceneTD = TimerManager.createExactTimer(duration,from,to,onUpdate,this.removeEnterSceneTip);
      }
      
      public function removeEnterSceneTip() : void
      {
         if(this._enterSceneTD != null)
         {
            TimerManager.deleteTimer(this._enterSceneTD);
            this._enterSceneTD = null;
         }
         if(this._enterSceneTf.parent != null)
         {
            this._enterSceneTf.parent.removeChild(this._enterSceneTf);
         }
         delete this._txtTipContainer["map_name"];
      }
      
      private function setSystemRollAreaBg(param1:Number) : void
      {
         this.system_roll_box.graphics.clear();
         this.system_roll_box.graphics.beginFill(0,0.3);
         this.system_roll_box.graphics.drawRect(0,0,param1,20);
         this.system_roll_box.graphics.endFill();
         this.system_roll_box_mask.graphics.clear();
         this.system_roll_box_mask.graphics.beginFill(0,1);
         this.system_roll_box_mask.graphics.drawRect(0,0,param1,20);
         this.system_roll_box_mask.graphics.endFill();
      }
      
      public function addSystemRollTip(param1:String, param2:int = 1) : void
      {
         var onComplete:Function;
         var rollWidth:Number = NaN;
         var $value:String = param1;
         var $count:int = param2;
         if(!RollText.hasInit())
         {
            onComplete = function():void
            {
               if(system_roll_box.parent != null)
               {
                  system_roll_box.parent.removeChild(system_roll_box);
               }
               if(system_roll_box_mask.parent != null)
               {
                  system_roll_box_mask.parent.removeChild(system_roll_box_mask);
               }
            };
            rollWidth = Math.max(GameInstance.stage.stageWidth * SYSTEM_ROLL_WIDTH_SCALE,SYSTEM_ROLL_WIDTH_MIN);
            this.setSystemRollAreaBg(rollWidth);
            RollText.init(this.system_roll_box,rollWidth,0,5,SYSTEM_ROLL_SPEED,10,onComplete);
            RollText.resetMaxWidth(rollWidth);
         }
         if(this.system_roll_box.parent != GameInstance.uiInstance.letterContainer)
         {
            rollWidth = Math.max(GameInstance.stage.stageWidth * SYSTEM_ROLL_WIDTH_SCALE,SYSTEM_ROLL_WIDTH_MIN);
            this.system_roll_box.x = GameInstance.stage.stageWidth * SYSTEM_ROLL_U - rollWidth / 2;
            this.system_roll_box.y = GameInstance.stage.stageHeight * SYSTEM_ROLL_V;
            this.system_roll_box_mask.x = GameInstance.stage.stageWidth * SYSTEM_ROLL_U - rollWidth / 2;
            this.system_roll_box_mask.y = GameInstance.stage.stageHeight * SYSTEM_ROLL_V;
            GameInstance.uiInstance.letterContainer.addChild(this.system_roll_box);
            GameInstance.uiInstance.letterContainer.addChild(this.system_roll_box_mask);
         }
         RollText.pushText($value,$count);
      }
      
      public function addSystemSwitchTip(param1:String) : void
      {
         var systemSwitchTFormat:TextFormat;
         var duration:Number;
         var from:Number;
         var to:Number;
         var systemSwitchTf:TextField = null;
         var oldNumChildren:int = 0;
         var delay:Number = NaN;
         var tt1:Number = NaN;
         var tt2:Number = NaN;
         var dis:Number = NaN;
         var onUpdate:Function = null;
         var onComplete:Function = null;
         var dobj:DisplayObject = null;
         var $value:String = param1;
         onUpdate = function(param1:Number):void
         {
            if(param1 < tt1)
            {
               if(oldNumChildren == 0)
               {
                  if(system_switch_box.numChildren == 1)
                  {
                     systemSwitchTf.y = -dis * (param1 / tt1);
                  }
                  systemSwitchTf.alpha = param1 / tt1;
               }
            }
            else if(param1 > delay + tt1)
            {
               systemSwitchTf.alpha = (tt2 - (param1 - delay - tt1)) / tt2;
            }
            else
            {
               systemSwitchTf.alpha = 1;
            }
         };
         onComplete = function():void
         {
            if(systemSwitchTf.parent != null)
            {
               systemSwitchTf.parent.removeChild(systemSwitchTf);
            }
            if(system_switch_box.numChildren == 0)
            {
               if(system_switch_box.parent != null)
               {
                  system_switch_box.parent.removeChild(system_switch_box);
               }
            }
            else
            {
               resizeSystemSwitch();
            }
         };
         systemSwitchTf = new TextField();
         systemSwitchTf.autoSize = TextFieldAutoSize.LEFT;
         systemSwitchTf.mouseEnabled = false;
         systemSwitchTf.filters = filter_systemSwitch;
         systemSwitchTFormat = new TextFormat();
         systemSwitchTFormat.size = 20;
         systemSwitchTFormat.font = LanResManager.getLanFont("com.tgame.manager.TopTipManager#楷体");
         systemSwitchTFormat.bold = true;
         systemSwitchTFormat.color = StaticValue.YELLOW;
         systemSwitchTf.defaultTextFormat = systemSwitchTFormat;
         systemSwitchTf.htmlText = $value;
         systemSwitchTf.x = -systemSwitchTf.width / 2;
         oldNumChildren = this.system_switch_box.numChildren;
         if(oldNumChildren == 0)
         {
            systemSwitchTf.y = SYSTEM_SWITCH_ONE_SWITCH_DIS;
            systemSwitchTf.alpha = 0;
            this.system_switch_box.addChild(systemSwitchTf);
            this.system_switch_box.x = GameInstance.stage.stageWidth * SYSTEM_SWITCH_U;
            this.system_switch_box.y = GameInstance.stage.stageHeight * SYSTEM_SWITCH_V;
            GameInstance.uiInstance.letterContainer.addChild(this.system_switch_box);
         }
         else
         {
            if(oldNumChildren >= SYSTEM_SWITCH_NUM)
            {
               dobj = this.system_switch_box.removeChildAt(0);
               TweenLite.killTweensOf(dobj);
            }
            this.system_switch_box.addChild(systemSwitchTf);
            this.resizeSystemSwitch();
         }
         delay = SYSTEM_SWITCH_ONE_TIME;
         tt1 = SYSTEM_SWITCH_ONE_SWITCH_TIME1;
         tt2 = SYSTEM_SWITCH_ONE_SWITCH_TIME2;
         dis = SYSTEM_SWITCH_ONE_SWITCH_DIS;
         duration = delay + tt1 + tt2;
         from = 0;
         to = duration;
         TimerManager.createOneOffExactTimer(duration,from,to,onUpdate,onComplete);
      }
      
      private function resizeSystemSwitch() : void
      {
         var _loc2_:TextField = null;
         var _loc1_:int = this.system_switch_box.numChildren;
         var _loc3_:* = int(_loc1_ - 1);
         while(_loc3_ >= 0)
         {
            _loc2_ = this.system_switch_box.getChildAt(_loc3_) as TextField;
            _loc2_.y = -(_loc1_ - 1 - _loc3_) * SYSTEM_SWITCH_ONE_HEIGHT;
            _loc3_--;
         }
      }
      
      public function addCharFootTip(param1:String) : void
      {
         var charTFormat:TextFormat;
         var oldNumChildren:int;
         var duration:Number;
         var from:Number;
         var charTf:TextField = null;
         var dis:Number = NaN;
         var to:Number = NaN;
         var onUpdate:Function = null;
         var onComplete:Function = null;
         var $value:String = param1;
         onUpdate = function(param1:Number):void
         {
            charTf.y = -dis * (param1 / to);
            charTf.alpha = 1 - param1 / to;
         };
         onComplete = function():void
         {
            if(charTf.parent != null)
            {
               charTf.parent.removeChild(charTf);
            }
            if(char_foot_box.numChildren == 0)
            {
               if(char_foot_box.parent != null)
               {
                  char_foot_box.parent.removeChild(char_foot_box);
               }
            }
         };
         charTf = new TextField();
         charTf.autoSize = TextFieldAutoSize.LEFT;
         charTf.mouseEnabled = false;
         charTf.filters = filter_char;
         charTFormat = new TextFormat();
         charTFormat.size = 14;
         charTFormat.font = LanResManager.getLanFont("com.tgame.manager.TopTipManager#楷体");
         charTFormat.color = StaticValue.YELLOW;
         charTf.defaultTextFormat = charTFormat;
         charTf.text = $value;
         oldNumChildren = this.char_foot_box.numChildren;
         if(oldNumChildren == 0)
         {
            this.char_foot_box.addChild(charTf);
            this.char_foot_box.x = GameInstance.stage.stageWidth * CHAR_FOOT_U;
            this.char_foot_box.y = GameInstance.stage.stageHeight * CHAR_FOOT_V;
            GameInstance.uiInstance.letterContainer.addChild(this.char_foot_box);
         }
         else
         {
            this.char_foot_box.addChild(charTf);
         }
         dis = CHAR_FOOT_DIS;
         duration = CHAR_FOOT_TIME;
         from = 0;
         to = duration;
         TimerManager.createOneOffExactTimer(duration,from,to,onUpdate,onComplete);
      }
      
      public function addTip(param1:String, param2:Number, param3:Number, param4:String, param5:int = -1, param6:String = "") : void
      {
         var _loc7_:AttackFace = AttackFace.createAttackFace(param4,param5,param6);
         _loc7_.mouseEnabled = false;
         _loc7_.x = GameInstance.stage.stageWidth * param2;
         _loc7_.y = GameInstance.stage.stageHeight * param3;
         this._tipContainer[param1] = [_loc7_,param2,param3];
         GameInstance.uiInstance.letterContainer.addChild(_loc7_);
      }
      
      public function removeTip(param1:String) : void
      {
         var _loc2_:AttackFace = null;
         if(this._tipContainer.hasOwnProperty(param1))
         {
            _loc2_ = this._tipContainer[param1][0];
            if(_loc2_ != null && _loc2_.parent != null && _loc2_.parent == GameInstance.uiInstance.letterContainer)
            {
               _loc2_.parent.removeChild(_loc2_);
            }
            AttackFace.recycleAttackFace(_loc2_);
            this._tipContainer[param1] = null;
            delete this._tipContainer[param1];
         }
      }
      
      public function addCenterTip(param1:String, param2:Bitmap = null, param3:int = 0) : void
      {
         var _loc4_:Object = new Object();
         _loc4_.str = param1;
         _loc4_.bit = param2;
         _loc4_.yanhua = param3;
         this.huanchongArr.push(_loc4_);
         if(!this.isRunning)
         {
            this.doAddCenterTip();
         }
      }
      
      public function addCenterUpTip(param1:String) : void
      {
         if(param1 == "" && this.centerUp_box.parent != null)
         {
            this.centerUp_box.parent.removeChild(this.centerUp_box);
            return;
         }
         if(param1 == "")
         {
            return;
         }
         if(!this.centerUpTf)
         {
            this.centerUpTf = new TextField();
         }
         this.centerUpTf.autoSize = TextFieldAutoSize.CENTER;
         this.centerUpTf.mouseEnabled = false;
         this.centerUpTf.filters = filter_center;
         this.centerUpTFormat.size = 24;
         this.centerUpTFormat.font = LanResManager.getLanFont("com.tgame.manager.TopTipManager#楷体");
         this.centerUpTFormat.color = StaticValue.YELLOW;
         this.centerUpTf.defaultTextFormat = this.centerUpTFormat;
         this.centerUpTf.text = param1;
         this.centerUpTf.x = -this.centerUpTf.width / 2;
         this.centerUpTf.y = -this.centerUpTf.height / 2;
         this.centerUp_box.addChild(this.centerUpTf);
         if(this.centerUp_box.parent != GameInstance.uiInstance.letterContainer)
         {
            this.centerUp_box.x = GameInstance.stage.stageWidth * CENTER_U;
            this.centerUp_box.y = this.centerUp_Box_Y;
            GameInstance.uiInstance.letterContainer.addChild(this.centerUp_box);
         }
      }
      
      private function doAddCenterTip() : void
      {
         var $obj:Object;
         var duration:Number;
         var from:Number;
         var to:Number;
         var tfBox:Sprite = null;
         var delay:Number = NaN;
         var tt1:Number = NaN;
         var tt2:Number = NaN;
         var onUpdate:Function = null;
         var onComplete:Function = null;
         var centerTf:TextField = null;
         var centerTFormat:TextFormat = null;
         var bit:Bitmap = null;
         var loadUrl:String = null;
         onUpdate = function(param1:Number):void
         {
            if(param1 < tt1)
            {
               tfBox.alpha = param1 / tt1;
               tfBox.scaleX = tfBox.scaleY = 1 + param1 / tt1 * 0.5;
            }
            else if(param1 > delay + tt1)
            {
               tfBox.alpha = (tt2 - (param1 - delay - tt1)) / tt2;
            }
            else
            {
               tfBox.alpha = 1;
               tfBox.scaleX = 1.5;
            }
         };
         onComplete = function():void
         {
            if(tfBox.parent != null)
            {
               tfBox.parent.removeChild(tfBox);
            }
            if(center_box.numChildren == 0)
            {
               if(center_box.parent != null)
               {
                  center_box.parent.removeChild(center_box);
               }
            }
            doAddCenterTip();
         };
         if(this.huanchongArr.length == 0)
         {
            this.isRunning = false;
            return;
         }
         this.isRunning = true;
         tfBox = new Sprite();
         tfBox.mouseEnabled = false;
         tfBox.mouseChildren = false;
         tfBox.alpha = 0;
         $obj = this.huanchongArr.shift();
         if($obj.str != "-1")
         {
            centerTf = new TextField();
            centerTf.autoSize = TextFieldAutoSize.LEFT;
            centerTf.mouseEnabled = false;
            centerTf.filters = filter_center;
            centerTFormat = new TextFormat();
            centerTFormat.size = 36;
            centerTFormat.font = LanResManager.getLanFont("com.tgame.manager.TopTipManager#楷体");
            centerTFormat.color = StaticValue.RED;
            centerTf.defaultTextFormat = centerTFormat;
            centerTf.text = $obj.str;
            centerTf.x = -centerTf.width / 2;
            centerTf.y = -centerTf.height / 2;
            tfBox.addChild(centerTf);
         }
         else
         {
            bit = $obj.bit;
            bit.x = -bit.width / 2;
            bit.y = -bit.height / 2;
            tfBox.addChild(bit);
         }
         this.center_box.addChild(tfBox);
         if(this.center_box.parent != GameInstance.uiInstance.letterContainer)
         {
            if($obj.yanhua != 0)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/data/mc/diwnagbaokuTishi/tishi.swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  var _loc3_:MovieClip = _loc2_.content as MovieClip;
                  if(_loc3_)
                  {
                     _loc3_.gotoAndPlay(1);
                     _loc3_.x = (GameConfig.sceneWidth - _loc3_.width) / 2;
                     _loc3_.y = (GameConfig.sceneHeight - _loc3_.height) / 2;
                     _loc3_.mouseChildren = false;
                     _loc3_.mouseEnabled = false;
                     GameInstance.uiInstance.letterContainer.addChild(_loc3_);
                  }
               },null,false,loadUrl);
            }
            this.center_box.x = GameInstance.stage.stageWidth * CENTER_U;
            this.center_box.y = GameInstance.stage.stageHeight * CENTER_V;
            GameInstance.uiInstance.letterContainer.addChild(this.center_box);
         }
         delay = CENTER_TIME;
         tt1 = CENTER_TIME1;
         tt2 = CENTER_TIME2;
         duration = delay + tt1 + tt2;
         from = 0;
         to = duration;
         TimerManager.createOneOffExactTimer(duration,from,to,onUpdate,onComplete);
      }
      
      public function resize() : void
      {
         var _loc1_:String = null;
         var _loc2_:Array = null;
         var _loc3_:AttackFace = null;
         var _loc4_:TextField = null;
         var _loc5_:Number = NaN;
         for(_loc1_ in this._tipContainer)
         {
            _loc2_ = this._tipContainer[_loc1_];
            _loc3_ = _loc2_[0];
            _loc3_.x = GameInstance.stage.stageWidth * _loc2_[1];
            _loc3_.y = GameInstance.stage.stageHeight * _loc2_[2];
         }
         for(_loc1_ in this._txtTipContainer)
         {
            _loc2_ = this._txtTipContainer[_loc1_];
            _loc4_ = _loc2_[0];
            _loc4_.x = GameInstance.stage.stageWidth * _loc2_[1] - _loc4_.width * 0.5;
            _loc4_.y = GameInstance.stage.stageHeight * _loc2_[2];
         }
         _loc5_ = Math.max(GameInstance.stage.stageWidth * SYSTEM_ROLL_WIDTH_SCALE,SYSTEM_ROLL_WIDTH_MIN);
         this.setSystemRollAreaBg(_loc5_);
         RollText.resetMaxWidth(_loc5_);
         this.system_roll_box.x = GameInstance.stage.stageWidth * SYSTEM_ROLL_U - _loc5_ / 2;
         this.system_roll_box.y = GameInstance.stage.stageHeight * SYSTEM_ROLL_V;
         this.system_roll_box_mask.x = GameInstance.stage.stageWidth * SYSTEM_ROLL_U - _loc5_ / 2;
         this.system_roll_box_mask.y = GameInstance.stage.stageHeight * SYSTEM_ROLL_V;
         this.system_switch_box.x = GameInstance.stage.stageWidth * SYSTEM_SWITCH_U;
         this.system_switch_box.y = GameInstance.stage.stageHeight * SYSTEM_SWITCH_V;
         this.char_foot_box.x = GameInstance.stage.stageWidth * CHAR_FOOT_U;
         this.char_foot_box.y = GameInstance.stage.stageHeight * CHAR_FOOT_V;
         this.center_box.x = GameInstance.stage.stageWidth * CENTER_U;
         this.center_box.y = GameInstance.stage.stageHeight * CENTER_V;
         this.centerUp_box.x = GameInstance.stage.stageWidth * CENTER_U;
         this.centerUp_box.y = this.centerUp_Box_Y;
      }
      
      public function showSpecialTip(param1:String, param2:int, param3:int) : void
      {
         var _loc7_:String = null;
         var _loc4_:Point = new Point(param2,param3);
         var _loc5_:Point = new Point(GameInstance.mainChar.tile_x,GameInstance.mainChar.tile_y);
         var _loc6_:Number = ZMath.getTowPointsAngle(_loc4_,_loc5_);
         _loc6_ = ZMath.getNearAngel(_loc6_ - 90);
         switch(_loc6_)
         {
            case 0:
               _loc7_ = "↑";
               break;
            case 45:
               _loc7_ = "↗";
               break;
            case 90:
               _loc7_ = "→";
               break;
            case 135:
               _loc7_ = "↘";
               break;
            case 180:
               _loc7_ = "↓";
               break;
            case 225:
               _loc7_ = "↙";
               break;
            case 270:
               _loc7_ = "←";
               break;
            case 315:
               _loc7_ = "↖";
         }
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,param1 + "," + LanResManager.getLanCommonTextWords("位置:") + _loc7_,false);
      }
   }
}

