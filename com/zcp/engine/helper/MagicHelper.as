package com.zcp.engine.helper
{
   import com.zcp.common.handler.helper.HandlerHelper;
   import com.zcp.common.utils.ZMath;
   import com.zcp.engine.Scene;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.avatar.AvatarPart;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.utils.Transformer;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.engine.vo.avatar.AvatarPlayCondition;
   import com.zcp.manager.TimerManager;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import gs.TweenLite;
   import gs.easing.Linear;
   
   public class MagicHelper
   {
      
      public function MagicHelper()
      {
         super();
      }
      
      public static function showMagic_from1passNtoN(param1:SceneCharacter, param2:Array, param3:AvatarParamData = null, param4:AvatarParamData = null, param5:AvatarParamData = null) : void
      {
         var hasRun:Boolean = false;
         var showAttack:Function = null;
         var toSc:SceneCharacter = null;
         var $from:SceneCharacter = param1;
         var $toArr:Array = param2;
         var $fromApd:AvatarParamData = param3;
         var $toApd:AvatarParamData = param4;
         var $passApd:AvatarParamData = param5;
         showAttack = function():void
         {
            if(hasRun)
            {
               return;
            }
            hasRun = true;
            showMagic($from,$toArr,$fromApd,$toApd,$passApd);
         };
         var isNoAttackNoFaceCharacter:Boolean = false;
         if($from.data != null && $from.data.hasOwnProperty("res") && $from.type == SceneCharacterType.MONSTER)
         {
            isNoAttackNoFaceCharacter = $from.data.res.type == 19;
         }
         if($toArr.length == 1)
         {
            toSc = $toArr[0];
            if(!isNoAttackNoFaceCharacter)
            {
               $from.faceTo(toSc.piexl_x,toSc.piexl_y);
            }
         }
         if($from.type != SceneCharacterType.DUMMY)
         {
            if(!($from.isJumping() || isNoAttackNoFaceCharacter))
            {
               $from.playTo(CharStatusType.ATTACK,-1,-1,new AvatarPlayCondition(true));
               $from.showAttack = showAttack;
            }
            else
            {
               showAttack();
            }
         }
         else
         {
            showAttack();
         }
         hasRun = false;
      }
      
      public static function showMagic_from1pass1toPointArea(param1:SceneCharacter, param2:Point, param3:AvatarParamData = null, param4:AvatarParamData = null, param5:AvatarParamData = null) : void
      {
         var hasRun:Boolean = false;
         var showAttack:Function = null;
         var $from:SceneCharacter = param1;
         var $toP:Point = param2;
         var $fromApd:AvatarParamData = param3;
         var $toApd:AvatarParamData = param4;
         var $passApd:AvatarParamData = param5;
         showAttack = function():void
         {
            var toSc:SceneCharacter;
            var scene:Scene = null;
            var new_onPlayComplete:Function = null;
            new_onPlayComplete = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               scene.removeCharacter(param1);
            };
            if(hasRun)
            {
               return;
            }
            hasRun = true;
            scene = $from.scene;
            toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
            toSc.setXY($toP.x,$toP.y);
            $toApd = $toApd || new AvatarParamData();
            $toApd.extendCallBack(null,null,null,new_onPlayComplete);
            showMagic($from,[toSc],$fromApd,$toApd,$passApd);
         };
         $from.faceTo($toP.x,$toP.y);
         if($from.type != SceneCharacterType.DUMMY)
         {
            if(!$from.isJumping())
            {
               $from.playTo(CharStatusType.ATTACK,-1,-1,new AvatarPlayCondition(true));
               $from.showAttack = showAttack;
            }
            else
            {
               showAttack();
            }
         }
         else
         {
            showAttack();
         }
         hasRun = false;
      }
      
      public static function showMagic_from1pass1toRectArea(param1:SceneCharacter, param2:Point, param3:int, param4:int, param5:int = 25, param6:Boolean = true, param7:AvatarParamData = null, param8:AvatarParamData = null, param9:AvatarParamData = null) : void
      {
         var hasRun:Boolean = false;
         var showAttack:Function = null;
         var $from:SceneCharacter = param1;
         var $toRectCenter:Point = param2;
         var $toRectHalfWidth:int = param3;
         var $toRectHalfHeight:int = param4;
         var $showSpace:int = param5;
         var $includeCenter:Boolean = param6;
         var $fromApd:AvatarParamData = param7;
         var $toApd:AvatarParamData = param8;
         var $passApd:AvatarParamData = param9;
         showAttack = function():void
         {
            var new_onPlayStart_for_to:Function;
            var scene:Scene = null;
            var toArr:Array = null;
            var piexlX:int = 0;
            var piexlY:int = 0;
            var toSc:SceneCharacter = null;
            var centerSc:SceneCharacter = null;
            var i:int = 0;
            var j:int = 0;
            var new_onPlayComplete:Function = null;
            var tempToApd:AvatarParamData = null;
            new_onPlayComplete = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               scene.removeCharacter(param1);
            };
            if(hasRun)
            {
               return;
            }
            hasRun = true;
            scene = $from.scene;
            toArr = [];
            i = 0;
            while(i <= $toRectHalfWidth)
            {
               j = 0;
               while(j <= $toRectHalfHeight)
               {
                  if(i == 0 && j == 0)
                  {
                     piexlX = $toRectCenter.x;
                     piexlY = $toRectCenter.y;
                     centerSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     centerSc.setXY(piexlX,piexlY);
                  }
                  else if(i == 0 && j != 0)
                  {
                     piexlX = $toRectCenter.x;
                     piexlY = $toRectCenter.y + j;
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                     piexlX = $toRectCenter.x;
                     piexlY = $toRectCenter.y - j;
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                  }
                  else if(i != 0 && j == 0)
                  {
                     piexlX = $toRectCenter.x + i;
                     piexlY = $toRectCenter.y;
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                     piexlX = $toRectCenter.x - i;
                     piexlY = $toRectCenter.y;
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                  }
                  else
                  {
                     piexlX = $toRectCenter.x + i;
                     piexlY = $toRectCenter.y + j;
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                     piexlX = $toRectCenter.x + i;
                     piexlY = $toRectCenter.y - j;
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                     piexlX = $toRectCenter.x - i;
                     piexlY = $toRectCenter.y + j;
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                     piexlX = $toRectCenter.x - i;
                     piexlY = $toRectCenter.y - j;
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                  }
                  j += $showSpace;
               }
               i += $showSpace;
            }
            $toApd = $toApd || new AvatarParamData();
            $toApd.extendCallBack(null,null,null,new_onPlayComplete);
            if($passApd != null)
            {
               new_onPlayStart_for_to = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
               {
                  if($includeCenter)
                  {
                     toArr.unshift(centerSc);
                  }
                  else
                  {
                     scene.removeCharacter(centerSc);
                  }
                  showMagic($from,toArr,null,$toApd,null);
               };
               tempToApd = new AvatarParamData();
               tempToApd.extendCallBack(null,new_onPlayStart_for_to);
               showMagic($from,[centerSc],$fromApd,tempToApd,$passApd);
            }
            else
            {
               if($includeCenter)
               {
                  toArr.unshift(centerSc);
               }
               else
               {
                  scene.removeCharacter(centerSc);
               }
               showMagic($from,toArr,$fromApd,$toApd,null);
            }
         };
         $from.faceTo($toRectCenter.x,$toRectCenter.y);
         if($from.type != SceneCharacterType.DUMMY)
         {
            if(!$from.isJumping())
            {
               $from.playTo(CharStatusType.ATTACK,-1,-1,new AvatarPlayCondition(true));
               $from.showAttack = showAttack;
            }
            else
            {
               showAttack();
            }
         }
         else
         {
            showAttack();
         }
         hasRun = false;
      }
      
      public static function showMagic_from1passNtoRectArea(param1:SceneCharacter, param2:Point, param3:int, param4:int, param5:int = 25, param6:Boolean = true, param7:AvatarParamData = null, param8:AvatarParamData = null, param9:AvatarParamData = null) : void
      {
         var hasRun:Boolean = false;
         var showAttack:Function = null;
         var $from:SceneCharacter = param1;
         var $toRectCenter:Point = param2;
         var $toRectHalfWidth:int = param3;
         var $toRectHalfHeight:int = param4;
         var $showSpace:int = param5;
         var $includeCenter:Boolean = param6;
         var $fromApd:AvatarParamData = param7;
         var $toApd:AvatarParamData = param8;
         var $passApd:AvatarParamData = param9;
         showAttack = function():void
         {
            var toArr:Array;
            var scene:Scene = null;
            var piexlX:int = 0;
            var piexlY:int = 0;
            var toSc:SceneCharacter = null;
            var i:int = 0;
            var j:int = 0;
            var new_onPlayComplete:Function = null;
            new_onPlayComplete = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               scene.removeCharacter(param1);
            };
            if(hasRun)
            {
               return;
            }
            hasRun = true;
            scene = $from.scene;
            toArr = [];
            i = 0;
            while(i <= $toRectHalfWidth)
            {
               j = 0;
               while(j <= $toRectHalfHeight)
               {
                  if(i == 0 && j == 0)
                  {
                     piexlX = $toRectCenter.x;
                     piexlY = $toRectCenter.y;
                     if($includeCenter)
                     {
                        toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                        toSc.setXY(piexlX,piexlY);
                        toArr.push(toSc);
                     }
                  }
                  else if(i == 0 && j != 0)
                  {
                     piexlX = $toRectCenter.x;
                     piexlY = $toRectCenter.y + j;
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                     piexlX = $toRectCenter.x;
                     piexlY = $toRectCenter.y - j;
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                  }
                  else if(i != 0 && j == 0)
                  {
                     piexlX = $toRectCenter.x + i;
                     piexlY = $toRectCenter.y;
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                     piexlX = $toRectCenter.x - i;
                     piexlY = $toRectCenter.y;
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                  }
                  else
                  {
                     piexlX = $toRectCenter.x + i;
                     piexlY = $toRectCenter.y + j;
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                     piexlX = $toRectCenter.x + i;
                     piexlY = $toRectCenter.y - j;
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                     piexlX = $toRectCenter.x - i;
                     piexlY = $toRectCenter.y + j;
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                     piexlX = $toRectCenter.x - i;
                     piexlY = $toRectCenter.y - j;
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                  }
                  j += $showSpace;
               }
               i += $showSpace;
            }
            $toApd = $toApd || new AvatarParamData();
            $toApd.extendCallBack(null,null,null,new_onPlayComplete);
            showMagic($from,toArr,$fromApd,$toApd,$passApd);
         };
         $from.faceTo($toRectCenter.x,$toRectCenter.y);
         if($from.type != SceneCharacterType.DUMMY)
         {
            if(!$from.isJumping())
            {
               $from.playTo(CharStatusType.ATTACK,-1,-1,new AvatarPlayCondition(true));
               $from.showAttack = showAttack;
            }
            else
            {
               showAttack();
            }
         }
         else
         {
            showAttack();
         }
         hasRun = false;
      }
      
      public static function showMagic_from1pass1toCircleArea(param1:SceneCharacter, param2:Point, param3:int, param4:int = 10, param5:int = 25, param6:Boolean = true, param7:AvatarParamData = null, param8:AvatarParamData = null, param9:AvatarParamData = null) : void
      {
         var hasRun:Boolean = false;
         var showAttack:Function = null;
         var $from:SceneCharacter = param1;
         var $toCircleCenter:Point = param2;
         var $toCircleR:int = param3;
         var $edgeEffectCount:int = param4;
         var $showSpace:int = param5;
         var $includeCenter:Boolean = param6;
         var $fromApd:AvatarParamData = param7;
         var $toApd:AvatarParamData = param8;
         var $passApd:AvatarParamData = param9;
         showAttack = function():void
         {
            var pi2:Number;
            var stepRad:Number;
            var new_onPlayStart_for_to:Function;
            var scene:Scene = null;
            var toArr:Array = null;
            var piexlX:int = 0;
            var piexlY:int = 0;
            var toSc:SceneCharacter = null;
            var centerSc:SceneCharacter = null;
            var r:int = 0;
            var rad:Number = NaN;
            var new_onPlayComplete:Function = null;
            var tempToApd:AvatarParamData = null;
            new_onPlayComplete = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               scene.removeCharacter(param1);
            };
            if(hasRun)
            {
               return;
            }
            hasRun = true;
            scene = $from.scene;
            toArr = [];
            pi2 = Math.PI * 2;
            stepRad = pi2 / $edgeEffectCount;
            r = 0;
            while(r <= $toCircleR)
            {
               if(r == 0)
               {
                  piexlX = $toCircleCenter.x;
                  piexlY = $toCircleCenter.y;
                  centerSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                  centerSc.setXY(piexlX,piexlY);
               }
               else
               {
                  rad = 0;
                  while(rad < pi2)
                  {
                     piexlX = $toCircleCenter.x + r * Math.cos(rad);
                     piexlY = $toCircleCenter.y + r * Math.sin(rad);
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                     rad += stepRad;
                  }
               }
               r += $showSpace;
            }
            $toApd = $toApd || new AvatarParamData();
            $toApd.extendCallBack(null,null,null,new_onPlayComplete);
            if($passApd != null)
            {
               new_onPlayStart_for_to = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
               {
                  if($includeCenter)
                  {
                     toArr.unshift(centerSc);
                  }
                  else
                  {
                     scene.removeCharacter(centerSc);
                  }
                  showMagic($from,toArr,null,$toApd,null);
               };
               tempToApd = new AvatarParamData();
               tempToApd.extendCallBack(null,new_onPlayStart_for_to);
               showMagic($from,[centerSc],$fromApd,tempToApd,$passApd);
            }
            else
            {
               if($includeCenter)
               {
                  toArr.unshift(centerSc);
               }
               else
               {
                  scene.removeCharacter(centerSc);
               }
               showMagic($from,toArr,$fromApd,$toApd,null);
            }
         };
         $from.faceTo($toCircleCenter.x,$toCircleCenter.y);
         if($from.type != SceneCharacterType.DUMMY)
         {
            if(!$from.isJumping())
            {
               $from.playTo(CharStatusType.ATTACK,-1,-1,new AvatarPlayCondition(true));
               $from.showAttack = showAttack;
            }
            else
            {
               showAttack();
            }
         }
         else
         {
            showAttack();
         }
         hasRun = false;
      }
      
      public static function showMagic_from1passNtoCircleArea(param1:SceneCharacter, param2:Point, param3:int, param4:int = 10, param5:int = 25, param6:Boolean = true, param7:AvatarParamData = null, param8:AvatarParamData = null, param9:AvatarParamData = null) : void
      {
         var hasRun:Boolean = false;
         var showAttack:Function = null;
         var $from:SceneCharacter = param1;
         var $toCircleCenter:Point = param2;
         var $toCircleR:int = param3;
         var $edgeEffectCount:int = param4;
         var $showSpace:int = param5;
         var $includeCenter:Boolean = param6;
         var $fromApd:AvatarParamData = param7;
         var $toApd:AvatarParamData = param8;
         var $passApd:AvatarParamData = param9;
         showAttack = function():void
         {
            var toArr:Array;
            var pi2:Number;
            var stepRad:Number;
            var scene:Scene = null;
            var piexlX:int = 0;
            var piexlY:int = 0;
            var toSc:SceneCharacter = null;
            var r:int = 0;
            var rad:Number = NaN;
            var new_onPlayComplete:Function = null;
            new_onPlayComplete = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               scene.removeCharacter(param1);
            };
            if(hasRun)
            {
               return;
            }
            hasRun = true;
            scene = $from.scene;
            toArr = [];
            pi2 = Math.PI * 2;
            stepRad = pi2 / $edgeEffectCount;
            r = 0;
            while(r <= $toCircleR)
            {
               if(r == 0)
               {
                  piexlX = $toCircleCenter.x;
                  piexlY = $toCircleCenter.y;
                  if($includeCenter)
                  {
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                  }
               }
               else
               {
                  rad = 0;
                  while(rad < pi2)
                  {
                     piexlX = $toCircleCenter.x + r * Math.cos(rad);
                     piexlY = $toCircleCenter.y + r * Math.sin(rad);
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                     rad += stepRad;
                  }
               }
               r += $showSpace;
            }
            $toApd = $toApd || new AvatarParamData();
            $toApd.extendCallBack(null,null,null,new_onPlayComplete);
            showMagic($from,toArr,$fromApd,$toApd,$passApd);
         };
         $from.faceTo($toCircleCenter.x,$toCircleCenter.y);
         if($from.type != SceneCharacterType.DUMMY)
         {
            if(!$from.isJumping())
            {
               $from.playTo(CharStatusType.ATTACK,-1,-1,new AvatarPlayCondition(true));
               $from.showAttack = showAttack;
            }
            else
            {
               showAttack();
            }
         }
         else
         {
            showAttack();
         }
         hasRun = false;
      }
      
      public static function showMagic_from1pass0toCircleArea_byQueue(param1:SceneCharacter, param2:Point, param3:int, param4:int = 10, param5:int = 25, param6:Boolean = true, param7:AvatarParamData = null, param8:AvatarParamData = null, param9:AvatarParamData = null, param10:int = 10) : void
      {
         var hasRun:Boolean = false;
         var showAttack:Function = null;
         var $from:SceneCharacter = param1;
         var $toCircleCenter:Point = param2;
         var $toCircleR:int = param3;
         var $edgeEffectCount:int = param4;
         var $showSpace:int = param5;
         var $includeCenter:Boolean = param6;
         var $fromApd:AvatarParamData = param7;
         var $toApd:AvatarParamData = param8;
         var $passApd:AvatarParamData = param9;
         var $delay:int = param10;
         showAttack = function():void
         {
            var pi2:Number;
            var stepRad:Number;
            var fromRad:Number;
            var scene:Scene = null;
            var toArr:Array = null;
            var piexlX:int = 0;
            var piexlY:int = 0;
            var toSc:SceneCharacter = null;
            var r:int = 0;
            var rad:Number = NaN;
            var new_onPlayComplete:Function = null;
            var tryShowMagic:Function = null;
            new_onPlayComplete = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               scene.removeCharacter(param1);
            };
            tryShowMagic = function():void
            {
               if(toArr.length == 0)
               {
                  return;
               }
               if(!$from.usable)
               {
                  for each(toSc in toArr)
                  {
                     scene.removeCharacter(toSc);
                  }
                  toArr.length = 0;
                  return;
               }
               toSc = toArr.shift();
               if(toSc.usable && toSc.data == "showMagic_from1pass0toCircleArea_byQueue")
               {
                  showMagic($from,[toSc],$fromApd,$toApd,$passApd);
                  $fromApd = null;
                  TimerManager.addDelayCallBack($delay,tryShowMagic);
               }
               else
               {
                  tryShowMagic();
               }
            };
            if(hasRun)
            {
               return;
            }
            hasRun = true;
            scene = $from.scene;
            toArr = [];
            pi2 = Math.PI * 2;
            stepRad = pi2 / $edgeEffectCount;
            fromRad = Transformer.transLogicAngle2Angle($from.getLogicAngle()) / 180 * Math.PI;
            r = 0;
            while(r <= $toCircleR)
            {
               if(r == 0)
               {
                  piexlX = $toCircleCenter.x;
                  piexlY = $toCircleCenter.y;
                  if($includeCenter)
                  {
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.data = "showMagic_from1pass0toCircleArea_byQueue";
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                  }
               }
               else
               {
                  rad = 0;
                  while(rad < pi2)
                  {
                     piexlX = $toCircleCenter.x + r * Math.cos(fromRad + rad);
                     piexlY = $toCircleCenter.y + r * Math.sin(fromRad + rad);
                     toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                     toSc.data = "showMagic_from1pass0toCircleArea_byQueue";
                     toSc.setXY(piexlX,piexlY);
                     toArr.push(toSc);
                     rad += stepRad;
                  }
               }
               r += $showSpace;
            }
            $toApd = $toApd || new AvatarParamData();
            $toApd.extendCallBack(null,null,null,new_onPlayComplete);
            tryShowMagic();
         };
         $from.faceTo($toCircleCenter.x,$toCircleCenter.y);
         if($from.type != SceneCharacterType.DUMMY)
         {
            if(!$from.isJumping())
            {
               $from.playTo(CharStatusType.ATTACK,-1,-1,new AvatarPlayCondition(true));
               $from.showAttack = showAttack;
            }
            else
            {
               showAttack();
            }
         }
         else
         {
            showAttack();
         }
         hasRun = false;
      }
      
      public static function showMagic_from1pass0toRandomArea_byQueue(param1:SceneCharacter, param2:Point, param3:int, param4:int = 10, param5:int = 25, param6:Boolean = true, param7:AvatarParamData = null, param8:AvatarParamData = null, param9:AvatarParamData = null, param10:int = 10) : void
      {
         var hasRun:Boolean = false;
         var showAttack:Function = null;
         var $from:SceneCharacter = param1;
         var $toCircleCenter:Point = param2;
         var $toCircleR:int = param3;
         var $edgeEffectCount:int = param4;
         var $showSpace:int = param5;
         var $includeCenter:Boolean = param6;
         var $fromApd:AvatarParamData = param7;
         var $toApd:AvatarParamData = param8;
         var $passApd:AvatarParamData = param9;
         var $delay:int = param10;
         showAttack = function():void
         {
            var effectXYArr:Array;
            var scene:Scene = null;
            var toArr:Array = null;
            var piexlX:int = 0;
            var piexlY:int = 0;
            var toSc:SceneCharacter = null;
            var p:Point = null;
            var i:int = 0;
            var new_onPlayComplete:Function = null;
            var tryShowMagic:Function = null;
            new_onPlayComplete = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               scene.removeCharacter(param1);
            };
            tryShowMagic = function():void
            {
               if(toArr.length == 0)
               {
                  return;
               }
               if(!$from.usable)
               {
                  for each(toSc in toArr)
                  {
                     scene.removeCharacter(toSc);
                  }
                  toArr.length = 0;
                  return;
               }
               toSc = toArr.shift();
               if(toSc.usable && toSc.data == "showMagic_from1pass0toRandomArea_byQueue")
               {
                  showMagic($from,[toSc],$fromApd,$toApd,$passApd);
                  $fromApd = null;
                  TimerManager.addDelayCallBack($delay,tryShowMagic);
               }
               else
               {
                  tryShowMagic();
               }
            };
            if(hasRun)
            {
               return;
            }
            hasRun = true;
            scene = $from.scene;
            toArr = [];
            effectXYArr = [];
            piexlX = $toCircleCenter.x;
            piexlY = $toCircleCenter.y;
            if($includeCenter)
            {
               toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
               toSc.data = "showMagic_from1pass0toRandomArea_byQueue";
               toSc.setXY(piexlX,piexlY);
               toArr.push(toSc);
            }
            i = 0;
            while(i < $edgeEffectCount)
            {
               p = new Point(ZMath.getRandomNumber(piexlX + $toCircleR,piexlX - $toCircleR),ZMath.getRandomNumber(piexlY + $toCircleR,piexlY - $toCircleR));
               effectXYArr.push(p);
               i++;
            }
            i = 0;
            while(i < effectXYArr.length)
            {
               p = effectXYArr[i];
               toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
               toSc.data = "showMagic_from1pass0toRandomArea_byQueue";
               toSc.setXY(p.x,p.y);
               toArr.push(toSc);
               i++;
            }
            $toApd = $toApd || new AvatarParamData();
            $toApd.extendCallBack(null,null,null,new_onPlayComplete);
            tryShowMagic();
         };
         $from.faceTo($toCircleCenter.x,$toCircleCenter.y);
         if($from.type != SceneCharacterType.DUMMY)
         {
            if(!$from.isJumping())
            {
               $from.playTo(CharStatusType.ATTACK,-1,-1,new AvatarPlayCondition(true));
               $from.showAttack = showAttack;
            }
            else
            {
               showAttack();
            }
         }
         else
         {
            showAttack();
         }
         hasRun = false;
      }
      
      public static function showMagic_from1passNtoSectorEdge(param1:SceneCharacter, param2:Point, param3:Number = 30, param4:int = 10, param5:AvatarParamData = null, param6:AvatarParamData = null, param7:AvatarParamData = null) : void
      {
         var hasRun:Boolean = false;
         var showAttack:Function = null;
         var $from:SceneCharacter = param1;
         var $toSectorOutCenter:Point = param2;
         var $centralAngle:Number = param3;
         var $passCount:int = param4;
         var $fromApd:AvatarParamData = param5;
         var $toApd:AvatarParamData = param6;
         var $passApd:AvatarParamData = param7;
         showAttack = function():void
         {
            var toArr:Array;
            var scene:Scene = null;
            var startSectorPoint:Point = null;
            var stepAngle:Number = NaN;
            var toSc:SceneCharacter = null;
            var i:int = 0;
            var new_onPlayComplete:Function = null;
            var stepSectorPoint:Point = null;
            new_onPlayComplete = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               scene.removeCharacter(param1);
            };
            if(hasRun)
            {
               return;
            }
            hasRun = true;
            scene = $from.scene;
            toArr = [];
            if($passCount == 1)
            {
               startSectorPoint = $toSectorOutCenter.clone();
            }
            else if($centralAngle == 360 && $passCount == 2)
            {
               startSectorPoint = $toSectorOutCenter.clone();
            }
            else
            {
               startSectorPoint = ZMath.getRotPoint($toSectorOutCenter,new Point($from.piexl_x,$from.piexl_y),-$centralAngle / 2);
            }
            if($passCount == 1)
            {
               stepAngle = 0;
            }
            else if($centralAngle == 360 && $passCount == 2)
            {
               stepAngle = $centralAngle / 2;
            }
            else
            {
               stepAngle = $centralAngle / ($passCount - 1);
            }
            i = 0;
            while(i < $passCount)
            {
               if(!($centralAngle == 360 && $passCount > 1 && i == $passCount - 1))
               {
                  stepSectorPoint = ZMath.getRotPoint(startSectorPoint,new Point($from.piexl_x,$from.piexl_y),stepAngle * i);
                  toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                  toSc.setXY(stepSectorPoint.x,stepSectorPoint.y);
                  toSc.data = ($passCount - i) * i;
                  toArr.push(toSc);
               }
               i++;
            }
            toArr.sortOn(["data"],Array.DESCENDING | Array.NUMERIC);
            $toApd = $toApd || new AvatarParamData();
            $toApd.extendCallBack(null,null,null,new_onPlayComplete);
            showMagic($from,toArr,$fromApd,$toApd,$passApd);
         };
         if($centralAngle < 0 || $centralAngle > 360)
         {
            $centralAngle = ($centralAngle % 360 + 360) % 360;
         }
         if($passCount < 1)
         {
            $passCount = 1;
         }
         if($centralAngle == 0)
         {
            $passCount = 1;
         }
         if($centralAngle == 360)
         {
            $passCount += 1;
         }
         $from.faceTo($toSectorOutCenter.x,$toSectorOutCenter.y);
         if($from.type != SceneCharacterType.DUMMY)
         {
            if(!$from.isJumping())
            {
               $from.playTo(CharStatusType.ATTACK,-1,-1,new AvatarPlayCondition(true));
               $from.showAttack = showAttack;
            }
            else
            {
               showAttack();
            }
         }
         else
         {
            showAttack();
         }
         hasRun = false;
      }
      
      public static function showMagic(param1:SceneCharacter, param2:Array, param3:AvatarParamData = null, param4:AvatarParamData = null, param5:AvatarParamData = null) : void
      {
         var passAndHit:Function = null;
         var $from:SceneCharacter = param1;
         var $toArr:Array = param2;
         var $fromApd:AvatarParamData = param3;
         var $toApd:AvatarParamData = param4;
         var $passApd:AvatarParamData = param5;
         passAndHit = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
         {
            var _loc3_:SceneCharacter = null;
            if($passApd == null)
            {
               for each(_loc3_ in $toArr)
               {
                  if(_loc3_.usable)
                  {
                     _loc3_.loadAvatarPart($toApd);
                  }
                  else if($toApd != null)
                  {
                     $toApd.executeCallBack(_loc3_);
                  }
               }
            }
            else
            {
               for each(_loc3_ in $toArr)
               {
                  showTweenAvatarPart($from,_loc3_,$toApd != null ? $toApd.clone() : null,$passApd != null ? $passApd.clone() : null);
               }
            }
         };
         $fromApd = $fromApd ? $fromApd.clone() : new AvatarParamData();
         $fromApd.extendCallBack(null,passAndHit,null,null);
         $from.loadAvatarPart($fromApd);
      }
      
      private static function showTweenAvatarPart(param1:SceneCharacter, param2:SceneCharacter, param3:AvatarParamData, param4:AvatarParamData) : void
      {
         var p0:Point;
         var p1:Point;
         var angel:Number;
         var scene:Scene = null;
         var passSc:SceneCharacter = null;
         var new_onPlayBeforeStart:Function = null;
         var $fromSc:SceneCharacter = param1;
         var $toSc:SceneCharacter = param2;
         var $toApd:AvatarParamData = param3;
         var $passApd:AvatarParamData = param4;
         new_onPlayBeforeStart = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
         {
            passSc.setXY($fromSc.piexl_x + $passApd.offsetDandaoStartX,$fromSc.piexl_y + $passApd.offsetDandaoStartY);
            tweenDandao(passSc,$toSc,hitIt,[scene,passSc,$toSc,$toApd]);
         };
         scene = $fromSc.scene;
         $passApd ||= new AvatarParamData();
         $passApd.extendCallBack(new_onPlayBeforeStart);
         passSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
         passSc.setXY($fromSc.piexl_x + $passApd.offsetDandaoStartX,$fromSc.piexl_y + $passApd.offsetDandaoStartY);
         p0 = new Point(passSc.piexl_x,passSc.piexl_y);
         p1 = new Point($toSc.piexl_x,$toSc.piexl_y);
         angel = ZMath.getTowPointsAngle(p0,p1);
         $passApd.rotation = angel - 90;
         passSc.loadAvatarPart($passApd);
      }
      
      private static function tweenDandao(param1:SceneCharacter, param2:SceneCharacter, param3:Function, param4:Array = null, param5:Point = null) : void
      {
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         if(!param2.usable || !param1.usable)
         {
            HandlerHelper.execute(hitIt,param4);
            return;
         }
         param5 = param5 != null ? param5 : new Point(int.MAX_VALUE,int.MIN_VALUE);
         if(param5.x != param2.piexl_x || param5.y != param2.piexl_y)
         {
            param5.x = param2.piexl_x;
            param5.y = param2.piexl_y;
            TweenLite.killTweensOf(param1);
            _loc6_ = new Point(param1.piexl_x,param1.piexl_y);
            _loc7_ = new Point(param2.piexl_x,param2.piexl_y);
            _loc8_ = Point.distance(_loc6_,_loc7_);
            _loc9_ = _loc8_ * 0.0014;
            _loc10_ = ZMath.getTowPointsAngle(_loc6_,_loc7_);
            param1.playTo(null,-1,_loc10_ - 90);
            TweenLite.to(param1,_loc9_,{
               "piexl_x":param2.piexl_x,
               "piexl_y":param2.piexl_y,
               "ease":Linear.easeNone,
               "onUpdate":tweenDandao,
               "onUpdateParams":[param1,param2,param3,param4,param5],
               "onComplete":param3,
               "onCompleteParams":param4
            });
         }
      }
      
      private static function hitIt(param1:Scene, param2:SceneCharacter, param3:SceneCharacter, param4:AvatarParamData) : void
      {
         TweenLite.killTweensOf(param2);
         param1.removeCharacter(param2);
         if(!param3.usable)
         {
            if(param4 != null)
            {
               param4.executeCallBack(param3);
            }
         }
         else
         {
            param3.loadAvatarPart(param4);
         }
      }
      
      public static function showMagic_from1pass1toStageRandom(param1:SceneCharacter, param2:int, param3:int, param4:int, param5:int, param6:AvatarParamData = null, param7:AvatarParamData = null, param8:AvatarParamData = null) : void
      {
         var hasRun:Boolean = false;
         var showAttack:Function = null;
         var $from:SceneCharacter = param1;
         var $time:int = param2;
         var $num:int = param3;
         var $toRectWidth:int = param4;
         var $toRectHeight:int = param5;
         var $fromApd:AvatarParamData = param6;
         var $toApd:AvatarParamData = param7;
         var $passApd:AvatarParamData = param8;
         showAttack = function():void
         {
            var scene:Scene = null;
            var piexlX:int = 0;
            var piexlY:int = 0;
            var i:int = 0;
            var ran_x:int = 0;
            var ran_y:int = 0;
            var count:int = 0;
            var timer:Timer = null;
            var onTimerFunction:Function = null;
            onTimerFunction = function(param1:TimerEvent):void
            {
               var toArr:Array;
               var pointAry:Array;
               var new_onPlayComplete:Function = null;
               var toSc:SceneCharacter = null;
               var l:int = 0;
               var e:TimerEvent = param1;
               new_onPlayComplete = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
               {
                  scene.removeCharacter(param1);
               };
               --count;
               toArr = [];
               pointAry = [];
               i = 0;
               while(i < $num)
               {
                  ran_x = Math.random() * $toRectWidth;
                  ran_y = Math.random() * $toRectHeight;
                  l = 0;
                  while(l < pointAry.length)
                  {
                     if(!(Math.abs(ran_x - pointAry[l].x) < 100 && Math.abs(ran_y - pointAry[l].y) < 100))
                     {
                        break;
                     }
                     ran_x = Math.random() * $toRectWidth;
                     ran_y = Math.random() * $toRectHeight;
                     l++;
                  }
                  pointAry.push(new Point(ran_x,ran_y));
                  if(i == $num - 1)
                  {
                     pointAry = [];
                  }
                  piexlX = (ran_x >= 0 && ran_x < $toRectWidth / 2 ? -ran_x : ran_x - $toRectWidth / 2) + $from.tile_x * 25;
                  piexlY = (ran_y >= 0 && ran_y < $toRectHeight / 2 ? -ran_y : ran_y - $toRectHeight / 2) + $from.tile_y * 25;
                  toSc = scene.createSceneCharacter(SceneCharacterType.DUMMY);
                  toSc.setXY(piexlX,piexlY);
                  toArr.push(toSc);
                  ++i;
               }
               $toApd = $toApd || new AvatarParamData();
               $toApd.extendCallBack(null,null,null,new_onPlayComplete);
               showMagic($from,toArr,$fromApd,$toApd,$passApd);
               if(count <= 0)
               {
                  timer.stop();
                  timer.removeEventListener(TimerEvent.TIMER,onTimerFunction);
               }
            };
            if(hasRun)
            {
               return;
            }
            hasRun = true;
            scene = $from.scene;
            count = $time;
            timer = new Timer(1000,count);
            timer.addEventListener(TimerEvent.TIMER,onTimerFunction);
            timer.start();
         };
         if($from.type != SceneCharacterType.DUMMY)
         {
            if(!$from.isJumping())
            {
               $from.playTo(CharStatusType.ATTACK,-1,-1,new AvatarPlayCondition(true));
               $from.showAttack = showAttack;
            }
            else
            {
               showAttack();
            }
         }
         else
         {
            showAttack();
         }
         hasRun = false;
      }
   }
}

