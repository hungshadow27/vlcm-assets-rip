package com.zcp.engine.move
{
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.common.utils.ZMath;
   import com.zcp.engine.Engine;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.events.SceneEvent;
   import com.zcp.engine.events.SceneEventAction_walk;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharAngleType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.utils.SceneUtil;
   import com.zcp.engine.vo.avatar.AvatarPlayCondition;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveCallBack;
   import flash.geom.Point;
   import gs.TweenLite;
   import gs.TweenMax;
   import gs.easing.Linear;
   
   public class Jump
   {
      
      public function Jump()
      {
         super();
      }
      
      public static function jump(param1:SceneCharacter, param2:Point, param3:Number = -1, param4:Number = -1, param5:MoveCallBack = null, param6:Boolean = false, param7:Boolean = false) : void
      {
         var fromTile:MapTile;
         var p0:Point;
         var angle:Number;
         var distance:Number;
         var middleX:Number;
         var time:Number;
         var mapTile:MapTile = null;
         var evt:SceneEvent = null;
         var p1:Point = null;
         var jumpHight:Number = NaN;
         var jumpSpeed:Number = NaN;
         var middleY:Number = NaN;
         var tm:TweenMax = null;
         var hasSolid:Boolean = false;
         var $sc:SceneCharacter = param1;
         var $tileP:Point = param2;
         var $speed:Number = param3;
         var $maxDis:Number = param4;
         var $jump_MoveCallBack:MoveCallBack = param5;
         var $is2Jump:Boolean = param6;
         var $is3Jump:Boolean = param7;
         if($sc.isMainChar())
         {
            if(Engine.enable3Jump && $is3Jump)
            {
               if($sc.on3Jumping())
               {
                  return;
               }
            }
            else if(Engine.enable2Jump)
            {
               if($sc.on2Jumping())
               {
                  return;
               }
            }
            else if($sc.isJumping())
            {
               return;
            }
         }
         fromTile = SceneUtil.getMapTile($sc.tile_x,$sc.tile_y);
         mapTile = SceneUtil.getMapTile($tileP.x,$tileP.y);
         if(fromTile == null)
         {
            return;
         }
         if(mapTile == null)
         {
            return;
         }
         p0 = new Point($sc.piexl_x,$sc.piexl_y);
         p1 = new Point(mapTile.piexl_x,mapTile.piexl_y);
         angle = ZMath.getTowPointsAngle(p0,p1);
         distance = Point.distance(p0,p1);
         if($sc.isMainChar())
         {
            mapTile = SceneUtil.getLineMapTile(fromTile,mapTile,$maxDis);
            if(fromTile.tile_x == mapTile.tile_x && fromTile.tile_y == mapTile.tile_y)
            {
               if($sc.isJumping())
               {
                  return;
               }
            }
            p1 = new Point(mapTile.piexl_x,mapTile.piexl_y);
            angle = ZMath.getTowPointsAngle(p0,p1);
            distance = Point.distance(p0,p1);
            $sc.scene.showMouseChar($tileP.x,$tileP.y);
            evt = new SceneEvent(SceneEvent.WALK,SceneEventAction_walk.SEND_JUMP_PATH,[$sc,fromTile,mapTile]);
            EventDispatchCenter.getInstance().dispatchEvent(evt);
         }
         $sc.moveData.clear();
         if($is3Jump)
         {
            $sc.moveData.isJumping = true;
            $sc.moveData.on2Jumping = true;
            $sc.moveData.on3Jumping = false;
         }
         else if($is2Jump)
         {
            $sc.moveData.isJumping = true;
            $sc.moveData.on2Jumping = false;
            $sc.moveData.on3Jumping = false;
         }
         if($speed == -1)
         {
            $speed = $sc.moveData.jump_speed;
         }
         if($maxDis == -1)
         {
            $maxDis = $sc.moveData.jump_maxDis;
         }
         $sc.moveData.jump_targetP = $tileP;
         $sc.moveData.jump_MoveCallBack = $jump_MoveCallBack;
         if($speed == 0)
         {
            return;
         }
         if($sc.isMainChar())
         {
            evt = new SceneEvent(SceneEvent.WALK,SceneEventAction_walk.JUMP_READY,[$sc,fromTile,mapTile]);
            EventDispatchCenter.getInstance().dispatchEvent(evt);
         }
         if($jump_MoveCallBack != null && $jump_MoveCallBack.onMoveReady != null)
         {
            $jump_MoveCallBack.onMoveReady($sc,fromTile,mapTile);
         }
         if(!$is2Jump)
         {
            if($sc.isOnMount)
            {
               hasSolid = SceneUtil.hasSolidBetween2MapTile(fromTile,mapTile);
               if(hasSolid)
               {
                  $sc.hideAvatarPartsByType(AvatarPartType.MOUNT);
               }
               else if($sc.scene.isAlwaysShowChar($sc) || $sc.scene.getCharAvatarVisible($sc.type))
               {
                  $sc.showAvatarPartsByType(AvatarPartType.MOUNT);
               }
            }
         }
         $sc.hideAvatarPartsByType(AvatarPartType.WEAPON);
         $sc.hideAvatarPartsByType(AvatarPartType.BOW);
         if($is3Jump)
         {
            if(!$sc.isJumping())
            {
               $sc.specilize_x = $sc.piexl_x;
               $sc.specilize_y = $sc.piexl_y;
            }
            $sc.moveData.isJumping = true;
            $sc.moveData.on2Jumping = true;
            $sc.moveData.on3Jumping = true;
            p0 = new Point($sc.specilize_x,$sc.specilize_y);
            angle = ZMath.getTowPointsAngle(p0,p1);
            jumpSpeed = $speed * 1.5;
            jumpHight = 300;
         }
         else if($is2Jump)
         {
            if(!$sc.isJumping())
            {
               $sc.specilize_x = $sc.piexl_x;
               $sc.specilize_y = $sc.piexl_y;
            }
            $sc.moveData.isJumping = true;
            $sc.moveData.on2Jumping = true;
            $sc.moveData.on3Jumping = false;
            p0 = new Point($sc.specilize_x,$sc.specilize_y);
            angle = ZMath.getTowPointsAngle(p0,p1);
            jumpSpeed = $speed * 1.5;
            jumpHight = 300;
         }
         else
         {
            if(!$sc.isJumping())
            {
               $sc.specilize_x = $sc.piexl_x;
               $sc.specilize_y = $sc.piexl_y;
            }
            $sc.moveData.isJumping = true;
            $sc.moveData.on2Jumping = false;
            $sc.moveData.on3Jumping = false;
            jumpSpeed = $speed;
            jumpHight = 200;
         }
         angle = ZMath.getNearAngel(angle - 90);
         if($sc.moveData.onDigun)
         {
            $sc.playTo(CharStatusType.JUMP,CharAngleType["ANGEL_" + angle],-1,new AvatarPlayCondition(true,true,false,true));
         }
         else
         {
            $sc.playTo(CharStatusType.JUMP,CharAngleType["ANGEL_" + angle],-1,new AvatarPlayCondition(true,true));
         }
         middleX = (p0.x + p1.x) * 0.5;
         if($sc.moveData.onDigun)
         {
            middleY = (p0.y + p1.y) * 0.5;
         }
         else
         {
            middleY = (p0.y + p1.y) * 0.5 - jumpHight;
         }
         time = Math.max(distance / jumpSpeed,0.5);
         if($sc.isJumping())
         {
            TweenMax.killTweensOf($sc);
         }
         tm = TweenMax.to($sc,time,{
            "piexl_x":p1.x,
            "piexl_y":p1.y,
            "bezier":[{
               "specilize_x":middleX,
               "specilize_y":middleY
            },{
               "specilize_x":p1.x,
               "specilize_y":p1.y
            }],
            "ease":Linear.easeIn,
            "onUpdate":function():void
            {
               if($sc.usable == false)
               {
                  TweenMax.removeTween(tm);
                  return;
               }
               if(Engine.enableJumpStop)
               {
                  if($sc.getStatus() == CharStatusType.DEATH)
                  {
                     if($sc == $sc.scene.mainChar)
                     {
                        $sc.scene.hideMouseChar();
                     }
                     if($sc.scene.isAlwaysShowChar($sc) || $sc.scene.getCharAvatarVisible($sc.type))
                     {
                        $sc.showAvatarPartsByType(AvatarPartType.MOUNT);
                     }
                     $sc.showAvatarPartsByType(AvatarPartType.WEAPON);
                     $sc.showAvatarPartsByType(AvatarPartType.BOW);
                     $sc.moveData.clear();
                     $sc.setXY($sc.piexl_x,$sc.piexl_y);
                     mapTile = SceneUtil.getMapTile($sc.tile_x,$sc.tile_y);
                     if($sc == $sc.scene.mainChar)
                     {
                        evt = new SceneEvent(SceneEvent.WALK,SceneEventAction_walk.JUMP_ARRIVED,[$sc,mapTile]);
                        EventDispatchCenter.getInstance().dispatchEvent(evt);
                     }
                     if($jump_MoveCallBack != null && $jump_MoveCallBack.onMoveArrived != null)
                     {
                        $jump_MoveCallBack.onMoveArrived($sc,mapTile);
                     }
                     TweenMax.removeTween(tm);
                     return;
                  }
               }
               mapTile = SceneUtil.getMapTile($sc.tile_x,$sc.tile_y);
               if($sc.isMainChar())
               {
                  evt = new SceneEvent(SceneEvent.WALK,SceneEventAction_walk.JUMP_THROUGH,[$sc,mapTile]);
                  EventDispatchCenter.getInstance().dispatchEvent(evt);
               }
               if($jump_MoveCallBack != null && $jump_MoveCallBack.onMoveThrough != null)
               {
                  $jump_MoveCallBack.onMoveThrough($sc,mapTile);
               }
            },
            "onComplete":function():void
            {
               if(!$sc.usable)
               {
                  return;
               }
               if($sc == $sc.scene.mainChar)
               {
                  $sc.scene.hideMouseChar();
               }
               if($sc.scene.isAlwaysShowChar($sc) || $sc.scene.getCharAvatarVisible($sc.type))
               {
                  $sc.showAvatarPartsByType(AvatarPartType.MOUNT);
               }
               $sc.showAvatarPartsByType(AvatarPartType.WEAPON);
               $sc.showAvatarPartsByType(AvatarPartType.BOW);
               $sc.moveData.clear();
               if($sc.getStatus() != CharStatusType.DEATH)
               {
                  $sc.playTo(CharStatusType.STAND,-1,-1);
               }
               $sc.setXY(p1.x,p1.y);
               if($sc == $sc.scene.mainChar)
               {
                  evt = new SceneEvent(SceneEvent.WALK,SceneEventAction_walk.JUMP_ARRIVED,[$sc,mapTile]);
                  EventDispatchCenter.getInstance().dispatchEvent(evt);
               }
               if($jump_MoveCallBack != null && $jump_MoveCallBack.onMoveArrived != null)
               {
                  $jump_MoveCallBack.onMoveArrived($sc,mapTile);
               }
            }
         });
      }
      
      public static function breakJump(param1:SceneCharacter, param2:Boolean = false, param3:Boolean = false) : void
      {
         if(!param3 && !Engine.enableJumpStop)
         {
            return;
         }
         if(!param1.usable)
         {
            return;
         }
         if(!param1.isJumping())
         {
            return;
         }
         TweenLite.killTweensOf(param1,param2);
         if(!param2)
         {
            if(param1 == param1.scene.mainChar)
            {
               param1.scene.hideMouseChar();
            }
            if(param1.scene.isAlwaysShowChar(param1) || param1.scene.getCharAvatarVisible(param1.type))
            {
               param1.showAvatarPartsByType(AvatarPartType.MOUNT);
            }
            param1.showAvatarPartsByType(AvatarPartType.WEAPON);
            param1.showAvatarPartsByType(AvatarPartType.BOW);
            param1.moveData.clear();
            if(param1.getStatus() != CharStatusType.DEATH)
            {
               param1.playTo(CharStatusType.STAND,-1,-1);
            }
         }
      }
   }
}

