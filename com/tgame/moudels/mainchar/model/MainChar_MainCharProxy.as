package com.tgame.moudels.mainchar.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.MonsterType;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.vo.character.BaseCharacter;
   import com.tgame.common.vo.character.Monster;
   import com.tgame.common.vo.character.Player;
   import com.tgame.manager.FightManager;
   import com.tgame.manager.KeyboardManager;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveCallBack;
   import flash.geom.Point;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MainChar_MainCharProxy extends Proxy
   {
      
      public static const NAME:String = "MainChar_MainCharProxy";
      
      private var _senderProxy:MainChar_MsgSenderProxy;
      
      public function MainChar_MainCharProxy()
      {
         super(NAME);
      }
      
      protected function get mainChar() : SceneCharacter
      {
         if(data == null)
         {
            setData(GameInstance.mainCharData);
         }
         return data as SceneCharacter;
      }
      
      protected function get mainCharData() : Player
      {
         return this.mainChar.data as Player;
      }
      
      private function get senderProxy() : MainChar_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(MainChar_MsgSenderProxy.NAME) as MainChar_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      public function singleClick(param1:Array, param2:Boolean = false) : void
      {
         var onWalkArrived:Function;
         var pickUp:Function;
         var targetSc:SceneCharacter = null;
         var range:int = 0;
         var callBack:MoveCallBack = null;
         var bagID:int = 0;
         var $dataArr:Array = param1;
         var $isTab:Boolean = param2;
         targetSc = $dataArr[1];
         if(!targetSc)
         {
            return;
         }
         if(!(GameInstance.mainChar.data as Player).attributeInfo.isChenmi)
         {
            return;
         }
         PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,null);
         if(targetSc.type == SceneCharacterType.PLAYER)
         {
            if((targetSc.data as BaseCharacter).buffInfo.hasBuffOfType(172))
            {
               return;
            }
         }
         if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
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
         if(Fun.isVisible(GameInstance.uiInstance._partyEquipChangePanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_PARTYEQUIPCHANGE_PANEL);
         }
         if(targetSc.type == SceneCharacterType.PLAYER || targetSc.type == SceneCharacterType.FENSHEN)
         {
            PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,targetSc);
            if(FightManager.isMainCharCanMove())
            {
               if($isTab || KeyboardManager.shift_down || KeyboardManager.ctrl_down)
               {
                  PipeManager.sendMsg(PipeConstants.HIT_CHAR,[targetSc,true,true]);
               }
            }
         }
         else if(targetSc.type == SceneCharacterType.MONSTER)
         {
            PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,targetSc);
            if(FightManager.isMainCharCanMove())
            {
               if((targetSc.data as Monster).res.type == MonsterType.MOUNT)
               {
                  PipeManager.sendMsg(PipeConstants.CATCH_HORSE,targetSc);
               }
               else if((targetSc.data as Monster).res.type == MonsterType.YOULONGZHIREN)
               {
                  PipeManager.sendMsg(PipeConstants.BA_JIAN,targetSc);
               }
               else if((targetSc.data as Monster).res.type == MonsterType.HUIYAN_JINGYANSHU)
               {
                  PipeManager.sendMsg(PipeConstants.HUN_YAN_CHI,targetSc);
               }
               else if((targetSc.data as Monster).res.type == MonsterType.QI3V3)
               {
                  PipeManager.sendMsg(PipeConstants.BA_QI,targetSc);
               }
               else if((targetSc.data as Monster).res.type == MonsterType.SHENFU || (targetSc.data as Monster).res.type == MonsterType.TUNSHITIANDI_MONSTER)
               {
                  PipeManager.sendMsg(PipeConstants.CHI_SHENFU,targetSc);
               }
               else if((targetSc.data as Monster).res.type == MonsterType.QINGGONGYAN)
               {
                  PipeManager.sendMsg(PipeConstants.QINGGONGYAN_CHI,targetSc);
               }
               else if((targetSc.data as Monster).res.type == MonsterType.BIWUZHAOQIN_XIUQIU_MONSTER)
               {
                  PipeManager.sendMsg(PipeConstants.QIANG_XIUQIU,targetSc);
               }
               else if((targetSc.data as Monster).res.type == MonsterType.XUYUANSHU_MONSTER)
               {
                  PipeManager.sendMsg(PipeConstants.XUYUANSHU_WATER,targetSc);
               }
               else if((targetSc.data as Monster).res.type == 50)
               {
                  PipeManager.sendMsg(PipeConstants.HUANGJINSHU_WATER,targetSc);
               }
               else if((targetSc.data as Monster).res.type == MonsterType.ZHONGQIUJIE_ZHUOZI_MONSTER)
               {
                  PipeManager.sendMsg(PipeConstants.CLICK_ZHONGQIUJIE_ZHUOZI,targetSc);
               }
               else if((targetSc.data as Monster).res.type == MonsterType.MONSTER_TYPE_DENGMI)
               {
                  PipeManager.sendMsg(PipeConstants.CLICK_DENGMI,targetSc.id);
               }
               else if((targetSc.data as Monster).res.type == 107)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_NPCDUIHUAXUNHUA_PANEL,targetSc);
               }
               else if((targetSc.data as Monster).res.type == 105)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_NPCDUIHUAXUNHUA_PANEL,targetSc);
               }
               else if((targetSc.data as Monster).res.type == 106)
               {
                  PipeManager.sendMsg(PipeConstants.DUIXUEREN_GET,targetSc);
               }
               else if((targetSc.data as Monster).res.type == MonsterType.MONSTER_TYPE_BAOSHU)
               {
                  PipeManager.sendMsg(PipeConstants.YN_REQUEST_BAOSHU_START,targetSc);
               }
               else
               {
                  PipeManager.sendMsg(PipeConstants.HIT_CHAR,[targetSc,true,true]);
               }
            }
         }
         else if(targetSc.type == SceneCharacterType.GIRL)
         {
            PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,targetSc);
            if(FightManager.isMainCharCanMove())
            {
               if($isTab || KeyboardManager.shift_down || KeyboardManager.ctrl_down)
               {
               }
            }
         }
         else if(targetSc.type == SceneCharacterType.TRANSPORT)
         {
            PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,null);
            if(FightManager.isMainCharCanMove())
            {
               range = 0;
               MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + targetSc.tile_x + "," + targetSc.tile_y + "," + range,false);
            }
         }
         else if(targetSc.type == SceneCharacterType.NPC)
         {
            PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,targetSc);
            this.senderProxy.send_10129(targetSc.id);
            if(FightManager.isMainCharCanMove())
            {
               onWalkArrived = function(param1:SceneCharacter, param2:MapTile):void
               {
                  if(param2 != null)
                  {
                     if(Point.distance(new Point(param2.piexl_x,param2.piexl_y),new Point(targetSc.piexl_x,targetSc.piexl_y)) <= range + 25)
                     {
                        PipeManager.sendMsg(PipeConstants.UPDATE_AND_SHOW_NPC_DIALOG_PLANE,targetSc);
                     }
                  }
               };
               range = 75;
               callBack = new MoveCallBack();
               callBack.onMoveUnable = onWalkArrived;
               callBack.onMoveArrived = onWalkArrived;
               MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + targetSc.tile_x + "," + targetSc.tile_y + "," + range,false,callBack,true,true,!$isTab);
            }
         }
         else if(targetSc.type == SceneCharacterType.BAG)
         {
            if(FightManager.isMainCharCanMove())
            {
               pickUp = function(param1:SceneCharacter, param2:MapTile):void
               {
                  if(targetSc.usable && targetSc.type == SceneCharacterType.BAG && targetSc.id == bagID)
                  {
                     PipeManager.sendMsg(PipeConstants.PICK_UP,targetSc.id);
                  }
               };
               range = 0;
               bagID = targetSc.id;
               callBack = new MoveCallBack();
               callBack.onMoveUnable = pickUp;
               callBack.onMoveArrived = pickUp;
               MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + targetSc.tile_x + "," + targetSc.tile_y + "," + range,false,callBack);
            }
         }
         else
         {
            PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,null);
            range = 0;
         }
      }
      
      public function TabSelect() : void
      {
         var _loc1_:SceneCharacter = null;
         var _loc3_:Array = null;
         var _loc9_:int = 0;
         var _loc11_:Object = null;
         if(GameInstance.mainCharData.isBind || GameInstance.mainCharData.isWeiZhenShanHe || GameInstance.mainCharData.isShuFuJuZhen || GameInstance.mainCharData.isQiongLongShenYu || GameInstance.mainCharData.isBuNengXuanRen)
         {
            return;
         }
         var _loc2_:Array = GameInstance.tabSelectArr;
         while(_loc2_.length > 0)
         {
            _loc1_ = _loc2_.shift();
            if(_loc1_.usable && _loc1_.getStatus() != CharStatusType.DEATH)
            {
               if(_loc1_.inViewDistance())
               {
                  this.singleClick([null,_loc1_,null],true);
               }
               return;
            }
         }
         var _loc4_:Array = [];
         var _loc5_:int = GameInstance.mainCharData.attributeInfo.pkMode;
         var _loc6_:int = GameInstance.mainCharData.attributeInfo.zhenyingID;
         var _loc7_:Boolean = _loc6_ != 0;
         var _loc8_:Array = [SceneCharacterType.FENSHEN,SceneCharacterType.PLAYER,SceneCharacterType.MONSTER,SceneCharacterType.NPC];
         var _loc10_:int = 0;
         while(_loc4_.length == 0 && _loc10_ < _loc8_.length)
         {
            _loc9_ = int(_loc8_[_loc10_]);
            _loc3_ = GameInstance.scene.getCharsByType(_loc9_);
            for each(_loc1_ in _loc3_)
            {
               if(!_loc1_.isMainChar() && _loc1_.getStatus() != CharStatusType.DEATH)
               {
                  if(!(_loc1_.type == SceneCharacterType.PLAYER && (_loc1_.data as Player).mainId == GameInstance.mainChar.id && _loc5_ != OtherConst.pkModeArr[0]))
                  {
                     if(_loc7_)
                     {
                        if(_loc1_.type == SceneCharacterType.PLAYER && (_loc1_.data as Player).attributeInfo.zhenyingID == _loc6_)
                        {
                           continue;
                        }
                        if(_loc1_.type == SceneCharacterType.MONSTER && (_loc1_.data as Monster).attributeInfo.zhenyingID == _loc6_)
                        {
                           continue;
                        }
                     }
                     else if(_loc1_.type == SceneCharacterType.PLAYER)
                     {
                        if(_loc5_ == OtherConst.pkModeArr[1])
                        {
                           if(GameInstance.mainCharData.teamInfo.getPlayerByID(Player(_loc1_.data).mainId))
                           {
                              continue;
                           }
                           if(GameInstance.mainCharData.teamInfo.getPlayerByID(_loc1_.id))
                           {
                              continue;
                           }
                        }
                        else if(_loc5_ == OtherConst.pkModeArr[2])
                        {
                           if(GameInstance.mainCharData.mainBangHuiId != 0 && GameInstance.mainCharData.mainBangHuiId == (_loc1_.data as Player).mainBangHuiId)
                           {
                              continue;
                           }
                           if(GameInstance.mainCharData.banghuiInfo.isTongbang((_loc1_.data as Player).banghuiInfo.banghuiId))
                           {
                              continue;
                           }
                        }
                     }
                     if(_loc1_.type == SceneCharacterType.MONSTER)
                     {
                        if(Monster(_loc1_.data).res.type == MonsterType.JIGUANGUAI)
                        {
                           continue;
                        }
                     }
                     if(_loc1_.inViewDistance())
                     {
                        _loc4_.push({
                           "sc":_loc1_,
                           "distance":Point.distance(new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y),new Point(_loc1_.piexl_x,_loc1_.piexl_y))
                        });
                     }
                  }
               }
            }
            _loc10_++;
         }
         if(!_loc4_.length)
         {
            return;
         }
         _loc4_.sortOn("distance",Array.NUMERIC);
         _loc2_.length = 0;
         for each(_loc11_ in _loc4_)
         {
            _loc2_.push(_loc11_.sc);
         }
         if(_loc2_.length > 0)
         {
            _loc1_ = _loc2_.shift();
            this.singleClick([null,_loc1_,null],true);
         }
      }
   }
}

