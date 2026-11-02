package com.zcp.engine.move
{
   import com.zcp.common.handler.helper.HandlerHelper;
   import com.zcp.common.utils.ZMath;
   import com.zcp.engine.Engine;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.CharAngleType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.utils.SceneUtil;
   import com.zcp.engine.vo.avatar.AvatarPlayCondition;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveCallBack;
   import flash.geom.Point;
   import gs.TweenLite;
   import gs.TweenMax;
   import gs.easing.Circ;
   import gs.easing.Expo;
   import gs.easing.Linear;
   
   public class Teleport
   {
      
      public function Teleport()
      {
         super();
      }
      
      public static function lineTo(param1:SceneCharacter, param2:Point, param3:Number, param4:Boolean = false, param5:MoveCallBack = null) : void
      {
         var fromTile:MapTile;
         var p0:Point;
         var angle:Number;
         var distance:Number;
         var time:Number;
         var mapTile:MapTile = null;
         var p1:Point = null;
         var easeFun:Function = null;
         var hasSolid:Boolean = false;
         var tm:TweenMax = null;
         var $sc:SceneCharacter = param1;
         var $tileP:Point = param2;
         var $speed:Number = param3;
         var $isPetJump:Boolean = param4;
         var $callBack:MoveCallBack = param5;
         TweenMax.killTweensOf($sc);
         $sc.moveData.clear();
         if($speed == 0)
         {
            return;
         }
         fromTile = SceneUtil.getMapTile($sc.tile_x,$sc.tile_y);
         mapTile = SceneUtil.getMapTile($tileP.x,$tileP.y);
         if(fromTile == null || mapTile == null)
         {
            return;
         }
         p0 = new Point($sc.piexl_x,$sc.piexl_y);
         p1 = new Point(mapTile.piexl_x,mapTile.piexl_y);
         angle = ZMath.getTowPointsAngle(p0,p1);
         distance = Point.distance(p0,p1);
         if($isPetJump)
         {
            hasSolid = SceneUtil.hasSolidBetween2MapTile(fromTile,mapTile);
            if(hasSolid)
            {
               $sc.visible = false;
            }
            else if($sc.scene.isAlwaysShowChar($sc) || $sc.scene.getCharVisible($sc.type))
            {
               $sc.visible = true;
            }
            angle = ZMath.getNearAngel(angle - 90);
            $sc.playTo(CharStatusType.WALK,CharAngleType["ANGEL_" + angle],-1,new AvatarPlayCondition(true));
            easeFun = Linear.easeNone;
         }
         else
         {
            easeFun = Expo.easeOut;
         }
         $sc.specilize_x = $sc.piexl_x;
         $sc.specilize_y = $sc.piexl_y;
         if($callBack != null && $callBack.onMoveReady != null)
         {
            $callBack.onMoveReady($sc,fromTile,mapTile);
         }
         time = $isPetJump ? Math.max(distance / $speed,0.7) : distance / $speed;
         tm = TweenMax.to($sc,time,{
            "piexl_x":p1.x,
            "piexl_y":p1.y,
            "specilize_x":p1.x,
            "specilize_y":p1.y,
            "ease":easeFun,
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
                     $sc.moveData.clear();
                     if($isPetJump)
                     {
                        if($sc.scene.isAlwaysShowChar($sc) || $sc.scene.getCharVisible($sc.type))
                        {
                           $sc.visible = true;
                        }
                     }
                     mapTile = SceneUtil.getMapTile($sc.tile_x,$sc.tile_y);
                     if($callBack != null && $callBack.onMoveArrived != null)
                     {
                        $callBack.onMoveArrived($sc,mapTile);
                     }
                     TweenMax.removeTween(tm);
                     return;
                  }
               }
            },
            "onComplete":function():void
            {
               if(!$sc.usable)
               {
                  return;
               }
               $sc.moveData.clear();
               if($isPetJump)
               {
                  if($sc.scene.isAlwaysShowChar($sc) || $sc.scene.getCharVisible($sc.type))
                  {
                     $sc.visible = true;
                  }
                  if($sc.getStatus() != CharStatusType.DEATH)
                  {
                     $sc.playTo(CharStatusType.STAND);
                  }
               }
               $sc.setXY(p1.x,p1.y);
               if($callBack != null && $callBack.onMoveArrived != null)
               {
                  $callBack.onMoveArrived($sc,mapTile);
               }
            }
         });
      }
      
      public static function lineToPiexl(param1:SceneCharacter, param2:Point, param3:Number, param4:Function = null) : void
      {
         var p0:Point;
         var distance:Number;
         var time:Number;
         var p1:Point = null;
         var tm:TweenMax = null;
         var $sc:SceneCharacter = param1;
         var $piexlP:Point = param2;
         var $speed:Number = param3;
         var $onComplete:Function = param4;
         TweenMax.killTweensOf($sc);
         $sc.moveData.clear();
         if($speed == 0)
         {
            return;
         }
         p0 = new Point($sc.piexl_x,$sc.piexl_y);
         p1 = new Point($piexlP.x,$piexlP.y);
         distance = Point.distance(p0,p1);
         $sc.specilize_x = $sc.piexl_x;
         $sc.specilize_y = $sc.piexl_y;
         time = distance / $speed;
         tm = TweenMax.to($sc,time,{
            "piexl_x":p1.x,
            "piexl_y":p1.y,
            "specilize_x":p1.x,
            "specilize_y":p1.y,
            "ease":Expo.easeOut,
            "onUpdate":function():void
            {
               if($sc.usable == false)
               {
                  TweenMax.removeTween(tm);
                  return;
               }
            },
            "onComplete":function():void
            {
               if(!$sc.usable)
               {
                  return;
               }
               $sc.moveData.clear();
               $sc.setXY(p1.x,p1.y);
               if($onComplete != null)
               {
                  HandlerHelper.execute($onComplete);
               }
            }
         });
      }
      
      public static function curveToPiexl(param1:SceneCharacter, param2:Point, param3:int, param4:int, param5:Function = null) : void
      {
         var r:int;
         var hScale:Number;
         var shadowH:Number;
         var angle:Number;
         var h:int = 0;
         var offsetR:Number = NaN;
         var fromXY:Point = null;
         var toXY:Point = null;
         var oldS_Y:Number = NaN;
         var onT1Complete:Function = null;
         var onComplete:Function = null;
         var onT1Update:Function = null;
         var $sc:SceneCharacter = param1;
         var $piexlP:Point = param2;
         var $jichuW:int = param3;
         var $jichuH:int = param4;
         var $onComplete:Function = param5;
         onT1Complete = function():void
         {
            TweenLite.to($sc,0.28,{
               "piexl_x":toXY.x,
               "piexl_y":toXY.y,
               "specilize_x":toXY.x,
               "specilize_y":toXY.y,
               "onComplete":onComplete,
               "ease":Circ.easeIn
            });
         };
         onComplete = function():void
         {
            $sc.strongUseSpecilizeXY = false;
            if($onComplete != null)
            {
               HandlerHelper.execute($onComplete);
            }
         };
         TweenMax.killTweensOf($sc);
         if(!$sc.isJumping())
         {
            $sc.specilize_x = $sc.piexl_x;
            $sc.specilize_y = $sc.piexl_y;
         }
         r = $jichuW;
         h = $jichuH;
         offsetR = r / 10;
         hScale = Math.cos(45 * Math.PI / 180);
         shadowH = h / 10;
         fromXY = new Point($sc.piexl_x,$sc.piexl_y);
         toXY = new Point();
         angle = ZMath.getTowPointsAngle(new Point($piexlP.x,$piexlP.y),fromXY);
         angle = angle * Math.PI / 180;
         toXY.x = fromXY.x + r * Math.cos(angle);
         toXY.y = fromXY.y + r * Math.sin(angle) * hScale;
         offsetR *= Math.cos(angle);
         $sc.strongUseSpecilizeXY = true;
         $sc.specilize_x = fromXY.x;
         $sc.specilize_y = fromXY.y;
         oldS_Y = $sc.specilize_y;
         if(toXY.x + offsetR - fromXY.x == 0)
         {
            TweenLite.to($sc,0.35,{
               "piexl_x":toXY.x + offsetR,
               "piexl_y":toXY.y - shadowH,
               "specilize_x":toXY.x + offsetR,
               "specilize_y":toXY.y - h,
               "onUpdate":onT1Update,
               "onComplete":onT1Complete,
               "ease":Circ.easeOut
            });
         }
         else
         {
            onT1Update = function():void
            {
               var _loc1_:Number = ($sc.specilize_x - fromXY.x) / (toXY.x + offsetR - fromXY.x);
               $sc.specilize_y = oldS_Y + (toXY.y - h - oldS_Y) * _loc1_ * _loc1_;
            };
            TweenLite.to($sc,0.35,{
               "piexl_x":toXY.x + offsetR,
               "piexl_y":toXY.y - shadowH,
               "specilize_x":toXY.x + offsetR,
               "onUpdate":onT1Update,
               "onComplete":onT1Complete,
               "ease":Circ.easeOut
            });
         }
      }
   }
}

