package com.tgame.manager
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.map.MapRes;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.res.map.TransOutRes;
   import com.tgame.common.res.npc.NpcRes;
   import com.tgame.common.res.npc.NpcResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.NewPlayerGuideType;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpeciaAvatarPartID;
   import com.tgame.common.vo.character.BaseCharacter;
   import com.tgame.common.vo.character.Player;
   import com.zcp.common.utils.Fun;
   import com.zcp.common.utils.ZMath;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.tagger.AttackFace;
   import com.zcp.engine.staticdata.RestType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.*;
   import flash.events.TextEvent;
   import flash.geom.Point;
   
   public class MainCharSeachPathManager
   {
      
      private static var _MoveCallBack:MoveCallBack;
      
      private static var _scenePath:Array = [];
      
      public static const AUTO_FIND_PATH_TEXT:String = "AUTO_FIND_PATH_TEXT";
      
      public function MainCharSeachPathManager()
      {
         super();
      }
      
      public static function clear() : void
      {
         _scenePath = [];
         _MoveCallBack = null;
      }
      
      private static function beforeMoveCheck(param1:Function) : void
      {
         var $callBack:Function = param1;
         var checkShuangxiu:Function = function():void
         {
            if(GameInstance.mainChar.restStatus == RestType.DOUBLE_SIT)
            {
               FAlert.show(LanResManager.getLanCommonTextWords("移动操作会打断双修，您确定要结束双修吗？"),"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     checkLiaoshang();
                  }
               },true);
            }
            else
            {
               checkLiaoshang();
            }
         };
         var checkLiaoshang:Function = function():void
         {
            if(GameInstance.mainCharData.attributeInfo.liaoshangStatus != 0)
            {
               FAlert.show(LanResManager.getLanCommonTextWords("移动操作会打断疗伤，您确定要结束疗伤吗？"),"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     $callBack();
                  }
               },true);
            }
            else
            {
               $callBack();
            }
         };
         checkShuangxiu();
      }
      
      private static function beforeMove(param1:Boolean = true, param2:Boolean = true, param3:Boolean = true) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(GameInstance.mainChar.restStatus != RestType.COMMON)
         {
            if(GameInstance.mainCharData.girlInfo.currentFightGirl != null)
            {
               PipeManager.sendMsg(PipeConstants.CHAR_DAZUO_SHUANGXIU_STATUS,[GameInstance.mainChar.id,0,0,0,0,GameInstance.mainCharData.girlInfo.currentFightGirl.id,0,0,0]);
               PipeManager.sendMsg(PipeConstants.CHAR_LIAOSHANG_STATUS,[GameInstance.mainChar.id,0,0,0,0,GameInstance.mainCharData.girlInfo.currentFightGirl.id,0]);
            }
            else
            {
               PipeManager.sendMsg(PipeConstants.CHAR_DAZUO_SHUANGXIU_STATUS,[GameInstance.mainChar.id,0,0,0,0,0,0,0,0]);
               PipeManager.sendMsg(PipeConstants.CHAR_LIAOSHANG_STATUS,[GameInstance.mainChar.id,0,0,0,0,0,0]);
            }
         }
         if(param2 && GameInstance.mainCharData.afkInfo2.isStart)
         {
            PipeManager.sendMsg(PipeConstants.AFK_START,0);
         }
         if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
         }
         if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
         }
         if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
         }
         if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
         {
            PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
         }
         if(Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE);
         }
         if(Fun.isVisible(GameInstance.uiInstance._stonePanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_STONE_PLANE);
         }
         if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
         }
         if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
         }
         if(Fun.isVisible(GameInstance.uiInstance._depot))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
         }
         if(Fun.isVisible(GameInstance.uiInstance._rideDepotPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_RIDE_DEPOT_PANEL);
         }
         if(Fun.isVisible(GameInstance.uiInstance._shoujiPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_SHOUJI_PANEL);
         }
         if(Fun.isVisible(GameInstance.uiInstance._instanceSelectPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_INSTANCE_SELECT_PANEL);
         }
         if(Fun.isVisible(GameInstance.uiInstance._refreshPointPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_REFRESHPOINT_PLANE);
         }
         if(Fun.isVisible(GameInstance.uiInstance._stonePanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MOVING_PANEL);
         }
         if(Fun.isVisible(GameInstance.uiInstance._gongchengGongchengchePanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_GONGCHENG_GONGCHENGCHE_PANEL);
         }
         if(Fun.isVisible(GameInstance.uiInstance._partyEquipChangePanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_PARTYEQUIPCHANGE_PANEL);
         }
         if(GameInstance.lockOnChar != null && GameInstance.lockOnChar.type == SceneCharacterType.NPC)
         {
            if(GameInstance.uiInstance._npcDialogPanel != null)
            {
               PipeManager.sendMsg(PipeConstants.HIDE_NPC_DIALOG_PLANE);
            }
         }
         if(param1)
         {
            FightManager.clearAutoAttack();
         }
         HighEffectManager.liziXuanwo_stop();
         if(param3)
         {
            GameInstance.tabSelectArr.length = 0;
         }
         if(GameInstance.scene.mapConfig.mapID == 20002)
         {
            _loc4_ = GameInstance.mainChar.tile_x;
            _loc5_ = GameInstance.mainChar.tile_y;
            if(_loc4_ < 189 && _loc4_ > 179 && _loc5_ < 46 && _loc5_ > 36)
            {
               PipeManager.sendMsg(PipeConstants.YN_REQUEST_MUYUHU_START,3);
            }
         }
         else if(GameInstance.scene.mapConfig.mapID == 20214)
         {
            _loc4_ = GameInstance.mainChar.tile_x;
            _loc5_ = GameInstance.mainChar.tile_y;
            if(_loc4_ < 119 + 5 && _loc4_ > 119 - 5 && _loc5_ < 25 + 5 && _loc5_ > 25 - 5)
            {
               PipeManager.sendMsg(PipeConstants.YN_REQUEST_MUYUHU_START,4);
            }
         }
      }
      
      public static function charJump(param1:SceneCharacter, param2:Point, param3:Number = -1, param4:Number = -1, param5:MoveCallBack = null, param6:Boolean = false, param7:Boolean = false) : void
      {
         var doCharJump:Function = null;
         var $char:SceneCharacter = param1;
         var $tileP:Point = param2;
         var $speed:Number = param3;
         var $maxDis:Number = param4;
         var $jump_MoveCallBack:MoveCallBack = param5;
         var $is2Jump:Boolean = param6;
         var $is3Jump:Boolean = param7;
         doCharJump = function():void
         {
            var count:int;
            var old_onJumpReady:Function = null;
            var old_onMoveThrough:Function = null;
            var old_onJumpArrived:Function = null;
            var new_onJumpReady:Function = null;
            var new_onMoveThrough:Function = null;
            var new_onJumpArrived:Function = null;
            new_onJumpReady = function(param1:SceneCharacter, param2:MapTile, param3:MapTile):void
            {
               if(old_onJumpReady != null)
               {
                  old_onJumpReady(param1,param2,param3);
               }
               if($char.isOnMount)
               {
                  AvatarManager.updateMainAvatar($char,[SpeciaAvatarPartID.MOUNT_BODY],true);
               }
               else if($char.type == SceneCharacterType.PLAYER && Player($char.data).avatarInfo.isFeixing)
               {
                  AvatarManager.updateMainAvatar($char,[SpeciaAvatarPartID.BODY],true);
               }
               if($char.isMainChar())
               {
                  beforeMove(true,true,true);
               }
            };
            new_onMoveThrough = function(param1:SceneCharacter, param2:MapTile):void
            {
               if(old_onMoveThrough != null)
               {
                  old_onMoveThrough(param1,param2);
               }
               if($is3Jump && count++ % 4 == 0)
               {
                  HighEffectManager.addGhost(param1.getNowAvatarFaceList());
               }
               else if($is2Jump && count++ % 4 == 0)
               {
                  HighEffectManager.addGhost(param1.getNowAvatarFaceList());
               }
               if($char.type == SceneCharacterType.PLAYER && Player($char.data).avatarInfo.isCiKe && count++ % 4 == 0)
               {
                  HighEffectManager.addGhost(param1.getNowAvatarFaceList(),true);
               }
               if(param1.type == SceneCharacterType.PLAYER && param1.moveData.onDigun && count++ % 4 == 0)
               {
                  HighEffectManager.addGhost(param1.getNowAvatarFaceList(),true);
               }
               if($char.type == SceneCharacterType.PLAYER && Player($char.data).avatarInfo.isHuanYingXiaDao && count++ % 4 == 0)
               {
                  HighEffectManager.addGhost(param1.getNowAvatarFaceList(),true);
               }
            };
            new_onJumpArrived = function(param1:SceneCharacter, param2:MapTile):void
            {
               var _loc3_:Point = null;
               var _loc4_:Point = null;
               var _loc5_:Point = null;
               var _loc6_:Point = null;
               var _loc7_:Point = null;
               var _loc8_:Point = null;
               var _loc9_:Point = null;
               var _loc10_:Point = null;
               var _loc11_:Point = null;
               if(old_onJumpArrived != null)
               {
                  old_onJumpArrived(param1,param2);
               }
               if($char.isOnMount)
               {
                  AvatarManager.updateMainAvatar($char,[SpeciaAvatarPartID.MOUNT_BODY]);
               }
               else if($char.type == SceneCharacterType.PLAYER && Player($char.data).avatarInfo.isFeixing)
               {
                  AvatarManager.updateMainAvatar($char,[SpeciaAvatarPartID.BODY]);
               }
               AvatarManager.setHuangzhuangZhuangtai($char);
               if($char.isMainChar() && GameState.xianJingDict[param2.tile_x + "_" + param2.tile_y] != undefined)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_XIANJING,GameState.xianJingDict[param2.tile_x + "_" + param2.tile_y]);
               }
               if(GameInstance.scene.mapConfig.mapID == OtherConst.BAITUOSHANXIA_MAP_ID)
               {
                  _loc3_ = new Point(57,52);
                  _loc4_ = new Point(61,55);
                  _loc5_ = new Point(108,52);
                  _loc6_ = new Point(112,55);
                  _loc7_ = new Point(118,83);
                  _loc8_ = new Point(122,86);
                  _loc9_ = new Point(46,83);
                  _loc10_ = new Point(50,86);
                  _loc11_ = new Point(param2.tile_x,param2.tile_y);
                  if(_loc11_.x >= 57 && _loc11_.x <= 61 && _loc11_.y >= 52 && _loc11_.y <= 55)
                  {
                     GameConfig.wantEnterMapRes.isOne = true;
                  }
                  if(_loc11_.x >= 108 && _loc11_.x <= 112 && _loc11_.y >= 52 && _loc11_.y <= 55)
                  {
                     GameConfig.wantEnterMapRes.isSecond = true;
                  }
                  if(_loc11_.x >= 118 && _loc11_.x <= 122 && _loc11_.y >= 83 && _loc11_.y <= 86)
                  {
                     GameConfig.wantEnterMapRes.isThird = true;
                  }
                  if(_loc11_.x >= 46 && _loc11_.x <= 50 && _loc11_.y >= 83 && _loc11_.y <= 86)
                  {
                     GameConfig.wantEnterMapRes.isFour = true;
                  }
                  if(_loc11_.x >= 57 && _loc11_.x <= 61 && _loc11_.y >= 52 && _loc11_.y <= 55 || _loc11_.x >= 108 && _loc11_.x <= 112 && _loc11_.y >= 52 && _loc11_.y <= 55 || _loc11_.x >= 118 && _loc11_.x <= 122 && _loc11_.y >= 83 && _loc11_.y <= 86 || _loc11_.x >= 46 && _loc11_.x <= 50 && _loc11_.y >= 83 && _loc11_.y <= 86)
                  {
                     if(GameConfig.wantEnterMapRes.isOne && GameConfig.wantEnterMapRes.isSecond && GameConfig.wantEnterMapRes.isThird && GameConfig.wantEnterMapRes.isFour)
                     {
                        PipeManager.sendMsg(PipeConstants.SHOW_BAITUOSHAN_PANEL);
                     }
                  }
               }
               if($char.isMainChar())
               {
                  FightManager.checkAutoAttack();
               }
            };
            if($jump_MoveCallBack != null)
            {
               old_onJumpReady = $jump_MoveCallBack.onMoveReady;
               old_onMoveThrough = $jump_MoveCallBack.onMoveThrough;
               old_onJumpArrived = $jump_MoveCallBack.onMoveArrived;
               $jump_MoveCallBack.onMoveReady = new_onJumpReady;
               $jump_MoveCallBack.onMoveThrough = new_onMoveThrough;
               $jump_MoveCallBack.onMoveArrived = new_onJumpArrived;
            }
            else
            {
               $jump_MoveCallBack = new MoveCallBack();
               $jump_MoveCallBack.onMoveReady = new_onJumpReady;
               $jump_MoveCallBack.onMoveThrough = new_onMoveThrough;
               $jump_MoveCallBack.onMoveArrived = new_onJumpArrived;
            }
            count = 0;
            $char.jump($tileP,$speed,$maxDis,$jump_MoveCallBack,$is2Jump,$is3Jump);
         };
         if($char.isMainChar() && ($char.data as BaseCharacter).isInDrink)
         {
            $tileP = ZMath.getRotPoint($tileP,new Point($char.tile_x,$char.tile_y),180);
            NoticeManager.notify(NoticeManager.FOOT,"移动方向混乱中");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"移动方向混乱中");
         }
         if($char.isMainChar())
         {
            beforeMoveCheck(doCharJump);
         }
         else
         {
            doCharJump();
         }
      }
      
      public static function mainCharWalk(param1:*, param2:Boolean = true, param3:MoveCallBack = null, param4:Boolean = true, param5:Boolean = true, param6:Boolean = true) : void
      {
         var re:RegExp;
         var text:String = null;
         var doCharWalk:Function = null;
         var $e:* = param1;
         var $showAutoFindPathText:Boolean = param2;
         var $callBack:MoveCallBack = param3;
         var $clearAutoAttack:Boolean = param4;
         var $isStopAFK:Boolean = param5;
         var $clearTabSelectArr:Boolean = param6;
         doCharWalk = function():void
         {
            var count:int;
            var arr:Array = null;
            var npcRes:NpcRes = null;
            var old_onWalkReady:Function = null;
            var old_onWalkUnable:Function = null;
            var old_onWalkArrived:Function = null;
            var new_onMoveThrough:Function = null;
            var new_onWalkReady:Function = null;
            var new_onWalkUnable:Function = null;
            var new_onWalkArrived:Function = null;
            var range:int = 0;
            new_onMoveThrough = function(param1:SceneCharacter, param2:MapTile):void
            {
               if(param1.isMainChar() && GameState.xianJingDict[param2.tile_x + "_" + param2.tile_y] != undefined)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_XIANJING,GameState.xianJingDict[param2.tile_x + "_" + param2.tile_y]);
               }
               if(GameInstance.mainChar.isOnMount)
               {
                  if(Player(GameInstance.mainChar.data).avatarInfo.isCiKe && count++ % 4 == 0)
                  {
                     HighEffectManager.addGhost(param1.getNowAvatarFaceList(),true);
                  }
                  if(Player(GameInstance.mainChar.data).avatarInfo.isHuanYingXiaDao && count++ % 4 == 0)
                  {
                     HighEffectManager.addGhost(param1.getNowAvatarFaceList(),true);
                  }
               }
               else
               {
                  if(Player(GameInstance.mainChar.data).avatarInfo.isCiKe && count++ % 2 == 0)
                  {
                     HighEffectManager.addGhost(param1.getNowAvatarFaceList(),true);
                  }
                  if(Player(GameInstance.mainChar.data).avatarInfo.isHuanYingXiaDao && count++ % 2 == 0)
                  {
                     HighEffectManager.addGhost(param1.getNowAvatarFaceList(),true);
                  }
               }
               if(param1.moveData.onDigun && count++ % 4 == 0)
               {
                  HighEffectManager.addGhost(param1.getNowAvatarFaceList(),true);
               }
               AvatarManager.setHuangzhuangZhuangtai(param1);
            };
            new_onWalkReady = function(param1:SceneCharacter, param2:MapTile, param3:MapTile):void
            {
               if(old_onWalkReady != null)
               {
                  old_onWalkReady(param1,param2,param3);
               }
               beforeMove($clearAutoAttack,$isStopAFK,$clearTabSelectArr);
            };
            new_onWalkUnable = function(param1:SceneCharacter, param2:MapTile):void
            {
               if(old_onWalkUnable != null)
               {
                  old_onWalkUnable(param1,param2);
               }
               TopTipManager.getInstance().removeTip(AUTO_FIND_PATH_TEXT);
            };
            new_onWalkArrived = function(param1:SceneCharacter, param2:MapTile):void
            {
               var _loc3_:SceneCharacter = null;
               var _loc4_:int = 0;
               if(old_onWalkArrived != null)
               {
                  old_onWalkArrived(param1,param2);
               }
               if(npcRes != null)
               {
                  _loc3_ = GameInstance.scene.getCharByID(npcRes.id_kind,SceneCharacterType.NPC);
                  if(_loc3_ != null)
                  {
                     if(!npcRes.findNeedJump())
                     {
                        _loc4_ = 75;
                        if(Point.distance(new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y),new Point(_loc3_.piexl_x,_loc3_.piexl_y)) <= _loc4_ + 25)
                        {
                           PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,_loc3_);
                           if((GameInstance.mainChar.data as Player).attributeInfo.isChenmi)
                           {
                              PipeManager.sendMsg(PipeConstants.UPDATE_AND_SHOW_NPC_DIALOG_PLANE,_loc3_);
                           }
                        }
                     }
                     else
                     {
                        NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"请使用轻功继续寻找该NPC");
                        NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide12);
                     }
                  }
               }
               TopTipManager.getInstance().removeTip(AUTO_FIND_PATH_TEXT);
            };
            var textArr:Array = text.split(",").map(function(param1:*, param2:int, param3:Array):int
            {
               return int(Number(param1));
            });
            var npcID:int = -1;
            if(textArr.length == 1)
            {
               npcID = int(text);
            }
            else if(textArr.length == 4)
            {
               arr = [textArr,-1];
            }
            else
            {
               if(textArr.length != 5)
               {
                  return;
               }
               npcID = int(textArr[4]);
               arr = [[textArr[0],textArr[1],textArr[2],textArr[3]],textArr[4]];
            }
            if(npcID != -1 && npcID != 0)
            {
               npcRes = NpcResManager.getNpcRes(npcID);
               if(!npcRes)
               {
                  return;
               }
               if(npcRes.findNeedJump())
               {
                  range = 0;
               }
               else
               {
                  range = 75;
               }
               arr = [[npcRes.sceneid,npcRes.findX,npcRes.findY,range],npcRes.id_kind];
            }
            if($callBack != null)
            {
               old_onWalkReady = $callBack.onMoveReady;
               old_onWalkUnable = $callBack.onMoveUnable;
               old_onWalkArrived = $callBack.onMoveArrived;
               $callBack.onMoveReady = new_onWalkReady;
               $callBack.onMoveThrough = new_onMoveThrough;
               $callBack.onMoveUnable = new_onWalkUnable;
               $callBack.onMoveArrived = new_onWalkArrived;
            }
            else
            {
               $callBack = new MoveCallBack();
               $callBack.onMoveReady = new_onWalkReady;
               $callBack.onMoveThrough = new_onMoveThrough;
               $callBack.onMoveUnable = new_onWalkUnable;
               $callBack.onMoveArrived = new_onWalkArrived;
            }
            count = 0;
            if($showAutoFindPathText)
            {
               TopTipManager.getInstance().removeTip(AUTO_FIND_PATH_TEXT);
               TopTipManager.getInstance().addTip(AUTO_FIND_PATH_TEXT,0.5,0.3,AttackFace.OTHERS_AUTO_SEARCH_PATH,-1,LanResManager.getLanCommonTextWords("自动寻路中..."));
            }
            else
            {
               TopTipManager.getInstance().removeTip(AUTO_FIND_PATH_TEXT);
            }
            f_goto(arr[0][0],new Point(arr[0][1],arr[0][2]),arr[0][3],$callBack);
            if($e is TextEvent)
            {
               NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide4);
               NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide6);
               NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide7);
               NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide8);
               NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide11);
               NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide15);
            }
         };
         if(GameInstance.mainChar.isJumping())
         {
            NoticeManager.notify(NoticeManager.FOOT,"跳跃中不能行走和远距离使用技能");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"跳跃中不能行走和远距离使用技能");
            return;
         }
         text = $e is TextEvent ? $e.text : $e;
         text = text.toLowerCase();
         if(text == "" || text == "0,0,0,0" || text == "0,0,0,0,-1" || text == "findPath#0,0,0,0,-1")
         {
            return;
         }
         re = /^([\d\,\-\s]+)|\s*findPath\s*\#\s*([\d\,\-\s]+)$/i;
         if(!re.test(text))
         {
            return;
         }
         text = text.replace(re,"$1$2");
         beforeMoveCheck(doCharWalk);
      }
      
      private static function f_goto(param1:int, param2:Point, param3:Number = 0, param4:MoveCallBack = null) : void
      {
         var new_onWalkReady:Function;
         var autoRide:Function;
         var new_onWalkReady2:Function;
         var autoRide2:Function;
         var old_onWalkReady:Function = null;
         var sceneArr:Array = null;
         var old_onWalkReady2:Function = null;
         var gotoArr:Array = null;
         var temp_callBack:MoveCallBack = null;
         var gotoP:Point = null;
         var $sceneID:int = param1;
         var $tileP:Point = param2;
         var $standDis:Number = param3;
         var $callBack:MoveCallBack = param4;
         if($sceneID == GameInstance.scene.mapConfig.mapID)
         {
            new_onWalkReady = function(param1:SceneCharacter, param2:MapTile, param3:MapTile):void
            {
               if(old_onWalkReady != null)
               {
                  old_onWalkReady(param1,param2,param3);
               }
               autoRide();
            };
            autoRide = function(param1:SceneCharacter = null, param2:MapTile = null):void
            {
               if(!GameInstance.mainChar.isOnMount && (GameInstance.mainChar.moveData.walk_pathArr != null && GameInstance.mainChar.moveData.walk_pathArr.length > 40) && GameInstance.mainCharData.mountInfo.hasRestMount())
               {
                  PipeManager.sendMsg(PipeConstants.UP_DOWN_HORSE);
               }
            };
            if($callBack != null)
            {
               old_onWalkReady = $callBack.onMoveReady;
               $callBack.onMoveReady = new_onWalkReady;
            }
            else
            {
               $callBack = new MoveCallBack();
               $callBack.onMoveReady = new_onWalkReady;
            }
            clear();
            if(GameInstance.mainCharData.isInDrink)
            {
               $tileP = ZMath.getRotPoint($tileP,new Point(GameInstance.mainChar.tile_x,GameInstance.mainChar.tile_y),180);
               NoticeManager.notify(NoticeManager.FOOT,"移动方向混乱中");
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"移动方向混乱中");
            }
            GameInstance.mainChar.walk($tileP,-1,$standDis,$callBack);
         }
         else
         {
            sceneArr = search(GameInstance.scene.mapConfig.mapID,$sceneID);
            if(Boolean(sceneArr) && sceneArr.length > 0)
            {
               new_onWalkReady2 = function(param1:SceneCharacter, param2:MapTile, param3:MapTile):void
               {
                  if(old_onWalkReady2 != null)
                  {
                     old_onWalkReady2(param1,param2,param3);
                  }
                  autoRide2();
               };
               autoRide2 = function(param1:SceneCharacter = null, param2:MapTile = null):void
               {
                  if(!GameInstance.mainChar.isOnMount && GameInstance.mainCharData.mountInfo.hasRestMount())
                  {
                     PipeManager.sendMsg(PipeConstants.UP_DOWN_HORSE);
                  }
               };
               if($callBack != null)
               {
                  old_onWalkReady2 = $callBack.onMoveReady;
                  $callBack.onMoveReady = null;
               }
               _MoveCallBack = $callBack;
               _scenePath = sceneArr.concat([[$sceneID,$tileP.x,$tileP.y,$standDis]]);
               gotoArr = _scenePath.shift();
               temp_callBack = new MoveCallBack();
               temp_callBack.onMoveReady = new_onWalkReady2;
               temp_callBack.onMoveThrough = $callBack.onMoveThrough;
               gotoP = new Point(gotoArr[1],gotoArr[2]);
               if(GameInstance.mainCharData.isInDrink)
               {
                  gotoP = ZMath.getRotPoint(gotoP,new Point(GameInstance.mainChar.tile_x,GameInstance.mainChar.tile_y),180);
                  NoticeManager.notify(NoticeManager.FOOT,"移动方向混乱中");
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"移动方向混乱中");
               }
               GameInstance.mainChar.walk(gotoP,-1,gotoArr[3],temp_callBack);
            }
            else
            {
               clear();
               TopTipManager.getInstance().removeTip(AUTO_FIND_PATH_TEXT);
            }
         }
      }
      
      public static function goon() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Point = null;
         var _loc3_:MoveCallBack = null;
         if(Boolean(_scenePath) && _scenePath.length > 0)
         {
            _loc1_ = _scenePath.shift();
            if(_loc1_[0] == GameInstance.scene.mapConfig.mapID)
            {
               _loc2_ = new Point(_loc1_[1],_loc1_[2]);
               if(GameInstance.mainCharData.isInDrink)
               {
                  _loc2_ = ZMath.getRotPoint(_loc2_,new Point(GameInstance.mainChar.tile_x,GameInstance.mainChar.tile_y),180);
                  NoticeManager.notify(NoticeManager.FOOT,"移动方向混乱中");
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"移动方向混乱中");
               }
               if(_scenePath.length == 0)
               {
                  GameInstance.mainChar.walk(_loc2_,-1,_loc1_[3],_MoveCallBack);
               }
               else
               {
                  _loc3_ = new MoveCallBack();
                  if(_MoveCallBack != null)
                  {
                     _loc3_.onMoveThrough = _MoveCallBack.onMoveThrough;
                  }
                  GameInstance.mainChar.walk(_loc2_,-1,_loc1_[3],_loc3_);
               }
            }
            else
            {
               clear();
            }
         }
      }
      
      public static function hasPath(param1:int, param2:int) : Boolean
      {
         return search(param1,param2).length > 0;
      }
      
      private static function search(param1:int, param2:int) : Array
      {
         if(param1 == param2)
         {
            return [];
         }
         if(!hasScene(param1))
         {
            return [];
         }
         if(!hasScene(param2))
         {
            return [];
         }
         return doSearch(param1,param2);
      }
      
      private static function doSearch(param1:int, param2:int, param3:Array = null) : Array
      {
         var _loc8_:TransOutRes = null;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc12_:Array = null;
         var _loc13_:Array = null;
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         param3 ||= [];
         param3[param3.length] = param1;
         var _loc6_:MapRes = MapTransManager.getMapRes(param1);
         var _loc7_:Array = _loc6_ ? _loc6_.transOutResArr : [];
         if(!_loc7_ || _loc7_.length == 0)
         {
            return [];
         }
         for each(_loc8_ in _loc7_)
         {
            _loc11_ = _loc8_.mapID;
            if(param3.indexOf(_loc11_) == -1)
            {
               if(_loc8_.mapID == param2)
               {
                  _loc9_ = [param1,_loc8_.x,_loc8_.y,0];
                  return [_loc9_];
               }
            }
         }
         for each(_loc8_ in _loc7_)
         {
            _loc11_ = _loc8_.mapID;
            if(param3.indexOf(_loc11_) == -1)
            {
               _loc10_ = doSearch(_loc11_,param2,param3);
               if(_loc10_.length != 0)
               {
                  _loc9_ = [param1,_loc8_.x,_loc8_.y,0];
                  _loc5_.push([_loc9_].concat(_loc10_));
               }
            }
         }
         _loc12_ = [];
         for each(_loc13_ in _loc5_)
         {
            _loc12_.push({
               "stepNum":_loc13_.length,
               "path":_loc13_
            });
         }
         _loc12_.sortOn("stepNum",Array.NUMERIC);
         return _loc12_.length > 0 ? _loc12_[0].path : [];
      }
      
      private static function hasScene(param1:int) : Boolean
      {
         var _loc2_:MapRes = MapTransManager.getMapRes(param1);
         return _loc2_ ? true : false;
      }
   }
}

