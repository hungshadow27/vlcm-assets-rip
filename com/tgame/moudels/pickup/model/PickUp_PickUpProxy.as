package com.tgame.moudels.pickup.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.TopTipManager;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.utils.SceneUtil;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveCallBack;
   import flash.geom.Point;
   import gs.TweenMax;
   import gs.easing.Linear;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class PickUp_PickUpProxy extends Proxy
   {
      
      public static const NAME:String = "PickUp_PickUpProxy";
      
      private var _msgSenderProxy:PickUp_MsgSenderProxy;
      
      public function PickUp_PickUpProxy()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : PickUp_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(PickUp_MsgSenderProxy.NAME) as PickUp_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      public function addPickUpBag(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:SceneCharacter = null;
         var _loc9_:GoodsRes = null;
         var _loc12_:int = 0;
         var _loc13_:SceneCharacter = null;
         var _loc14_:uint = 0;
         var _loc15_:String = null;
         if(param1 != -1)
         {
            _loc8_ = GameInstance.scene.getCharByID(param1,SceneCharacterType.MONSTER);
         }
         var _loc10_:String = "";
         var _loc11_:int = 0;
         if(param5 == -1)
         {
            _loc10_ = param6 + LanResManager.getLanCommonTextWords("铜币");
            _loc11_ = -1;
         }
         else
         {
            _loc9_ = GoodsResManager.getGoodsRes(param5);
            if(_loc9_ != null)
            {
               _loc10_ = _loc9_.name;
               _loc11_ = _loc9_.kind;
               if(_loc9_.sendAnnouncement == 1 || param7 >= 3)
               {
                  TopTipManager.getInstance().showSpecialTip(LanResManager.getLanTextWords(this,"视野内发现极品道具",[_loc9_.name]),param3,param4);
               }
            }
         }
         if(_loc10_ != "")
         {
            _loc12_ = SceneCharacterType.getDefaultDepth(SceneCharacterType.BAG);
            _loc13_ = GameInstance.scene.createSceneCharacter(SceneCharacterType.BAG,0,0,_loc12_);
            _loc13_.id = param2;
            _loc14_ = uint(StaticValue.WHITE);
            if(param7 == 1)
            {
               _loc14_ = uint(StaticValue.WHITE);
            }
            else if(param7 == 2)
            {
               _loc14_ = uint(StaticValue.BLUE);
            }
            else if(param7 == 3)
            {
               _loc14_ = uint(StaticValue.GREEN);
            }
            else if(param7 == 4)
            {
               _loc14_ = uint(StaticValue.PURPLE50);
            }
            _loc13_.setHeadFaceNickName(_loc10_,_loc14_);
            if(param5 == -1)
            {
               if(param6 < 100)
               {
                  _loc15_ = ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BAG_COPPER_1);
               }
               else if(param6 >= 500)
               {
                  _loc15_ = ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BAG_COPPER_3);
               }
               else
               {
                  _loc15_ = ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BAG_COPPER_2);
               }
            }
            else
            {
               _loc15_ = ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,GoodsResManager.getGoodsRes(param5).id_bag);
            }
            _loc13_.loadAvatarPart(new AvatarParamData(_loc15_));
            if(_loc8_ == null || _loc8_.avatar.status != CharStatusType.DEATH)
            {
               _loc13_.tile_x = param3;
               _loc13_.tile_y = param4;
            }
            else
            {
               _loc13_.piexl_x = _loc8_.piexl_x;
               _loc13_.piexl_y = _loc8_.piexl_y;
               this.upDown(_loc13_,new Point(param3,param4),_loc9_);
            }
         }
      }
      
      public function removePickUpBag(param1:int) : void
      {
         GameInstance.scene.removeCharacterByIDAndType(param1,SceneCharacterType.BAG);
      }
      
      public function autoPickUpBag(param1:int) : void
      {
         var callBack:MoveCallBack;
         var targetSc:SceneCharacter = null;
         var bagID:int = 0;
         var pickUp:Function = null;
         var $pickUpBagID:int = param1;
         pickUp = function(param1:SceneCharacter, param2:MapTile):void
         {
            if(targetSc.usable && targetSc.type == SceneCharacterType.BAG && targetSc.id == bagID)
            {
               msgSenderProxy.send_11163(bagID);
            }
         };
         targetSc = GameInstance.scene.getCharByID($pickUpBagID,SceneCharacterType.BAG);
         if(!targetSc)
         {
            return;
         }
         bagID = targetSc.id;
         callBack = new MoveCallBack();
         callBack.onMoveUnable = pickUp;
         callBack.onMoveArrived = pickUp;
         MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + targetSc.tile_x + "," + targetSc.tile_y + ",0",false,callBack,true,false);
      }
      
      private function upDown(param1:SceneCharacter, param2:Point, param3:GoodsRes) : void
      {
         var p0:Point;
         var p1:Point;
         var distance:Number;
         var middleX:Number;
         var middleY:Number;
         var time:Number;
         var tm:TweenMax = null;
         var $sc:SceneCharacter = param1;
         var $tileP:Point = param2;
         var $goodsRes:GoodsRes = param3;
         var mapTile:MapTile = SceneUtil.getMapTile($tileP.x,$tileP.y);
         if(mapTile == null)
         {
            return;
         }
         if($sc.piexl_x == mapTile.piexl_x && $sc.piexl_y == mapTile.piexl_y)
         {
            return;
         }
         p0 = new Point($sc.piexl_x,$sc.piexl_y);
         p1 = new Point(mapTile.piexl_x,mapTile.piexl_y);
         distance = Point.distance(p0,p1);
         middleX = (p0.x + p1.x) * 0.5;
         middleY = (p0.y + p1.y) * 0.5 - 200;
         time = distance / 300;
         tm = TweenMax.to($sc,time,{
            "bezier":[{
               "piexl_x":middleX,
               "piexl_y":middleY
            },{
               "piexl_x":p1.x,
               "piexl_y":p1.y
            }],
            "ease":Linear.easeIn,
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
               $sc.setTileXY($tileP.x,$tileP.y);
               playDownSound($goodsRes);
            }
         });
      }
      
      private function playDownSound(param1:GoodsRes) : void
      {
         var _loc2_:String = null;
         if(param1 == null)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_PICKUP_MONEY);
         }
         else if(param1.id_sound_goods_down != 0)
         {
            TSoundManager.playShortSound(param1.id_sound_goods_down);
         }
      }
   }
}

