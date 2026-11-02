package com.tgame.moudels.scene.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.map.MapRes;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.res.map.TransOutRes;
   import com.tgame.common.res.monster.MonsterRes;
   import com.tgame.common.res.mount.MountRes;
   import com.tgame.common.res.mount.MountResManager;
   import com.tgame.common.res.npc.NpcRes;
   import com.tgame.common.res.npc.NpcResManager;
   import com.tgame.common.staticdata.ColorConst;
   import com.tgame.common.staticdata.MonsterType;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpeciaAvatarPartID;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.BaseCharacter;
   import com.tgame.common.vo.character.Girl;
   import com.tgame.common.vo.character.Monster;
   import com.tgame.common.vo.character.Mount;
   import com.tgame.common.vo.character.NPC;
   import com.tgame.common.vo.character.NpcFriend;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.Telport;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.FightManager;
   import com.tgame.manager.HeadFaceManager;
   import com.tgame.manager.NpcRandomTalkManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.SitManager;
   import com.tgame.manager.TopTipManager;
   import com.zcp.common.utils.ZMath;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.config.SceneConfig;
   import com.zcp.engine.graphics.avatar.AvatarPart;
   import com.zcp.engine.staticdata.AvatarPartID;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.utils.Transformer;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.engine.vo.avatar.AvatarPlayCondition;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Point;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Scene_SceneProxy extends Proxy
   {
      
      public static const NAME:String = "Scene_SceneProxy";
      
      public function Scene_SceneProxy()
      {
         super(NAME);
      }
      
      public function receivedMonsterEnterScene(param1:int, param2:int, param3:int, param4:Number, param5:Number, param6:Number, param7:int, param8:int, param9:int, param10:Boolean, param11:Boolean, param12:Boolean, param13:Boolean, param14:Boolean, param15:Boolean, param16:int, param17:int, param18:Array, param19:int, param20:String, param21:Object, param22:int = 0, param23:int = 0, param24:DisplayObject = null, param25:int = 0) : void
      {
         var monster:Monster;
         var btStr:String;
         var attrInfo:AttributeInfo;
         var showName:String;
         var monsterRes:MonsterRes;
         var bc:BaseCharacter;
         var buffCount:int;
         var playComplete:Function;
         var playComplete2:Function;
         var monsterChar:SceneCharacter = null;
         var leftIco:Sprite = null;
         var nameColor:uint = 0;
         var langle:Number = NaN;
         var apd:AvatarParamData = null;
         var i:int = 0;
         var space:Number = NaN;
         var ico:Bitmap = null;
         var icoBD:BitmapData = null;
         var arr:Array = null;
         var j:int = 0;
         var m:int = 0;
         var btArr:Array = null;
         var str:String = null;
         var apd60:AvatarParamData = null;
         var apd100:AvatarParamData = null;
         var avatarInfo:AvatarInfo = null;
         var goodsRes:GoodsRes = null;
         var $roleID:int = param1;
         var $modelID:int = param2;
         var $level:int = param3;
         var $speed:Number = param4;
         var $hpNow:Number = param5;
         var $hpMax:Number = param6;
         var $x:int = param7;
         var $y:int = param8;
         var $status:int = param9;
         var $seguai_1:Boolean = param10;
         var $seguai_2:Boolean = param11;
         var $seguai_3:Boolean = param12;
         var $seguai_4:Boolean = param13;
         var $seguai_5:Boolean = param14;
         var $seguai_6:Boolean = param15;
         var $seguai_7:int = param16;
         var $seguai_8:int = param17;
         var $buffIDArr:Array = param18;
         var $btCount:int = param19;
         var $reName:String = param20;
         var $avatarDict:Object = param21;
         var $specialChenghaoID:int = param22;
         var $zhenyingID:int = param23;
         var $nameDisObj:DisplayObject = param24;
         var $tiem:int = param25;
         this.receivedCharLeaveScene(SceneCharacterType.MONSTER,$roleID);
         monsterChar = GameInstance.scene.createSceneCharacter(SceneCharacterType.MONSTER);
         monster = new Monster(monsterChar,$modelID);
         monsterChar.data = monster;
         btStr = "";
         if($seguai_1 || $seguai_2 || $seguai_3 || $seguai_4 || $seguai_5 || $seguai_6 || Boolean($seguai_8))
         {
            space = 2;
            leftIco = new Sprite();
            arr = [$seguai_1,$seguai_2,$seguai_3,$seguai_4,$seguai_5,$seguai_6];
            j = 0;
            while(j < 6)
            {
               if(arr[j])
               {
                  icoBD = RslLoaderManager.getInstance("ui.seguai.se" + (j + 1),26,26);
                  if(icoBD != null)
                  {
                     ico = new Bitmap(icoBD);
                     ico.x = leftIco.width > 0 ? leftIco.width + space : 0;
                     leftIco.addChild(ico);
                  }
                  btArr = this.getBtConfig(j);
                  if(m == 2)
                  {
                     btStr += "<font color=\'" + btArr[1] + "\'>" + "[" + $btCount + LanResManager.getLanCommonTextWords("倍") + btArr[0] + "]" + "</font></br>";
                  }
                  else
                  {
                     btStr += "<font color=\'" + btArr[1] + "\'>" + "[" + $btCount + LanResManager.getLanCommonTextWords("倍") + btArr[0] + "]" + "</font>";
                  }
                  m++;
               }
               j++;
            }
            if($seguai_8 > 0)
            {
               icoBD = RslLoaderManager.getInstance("ui.seguai.yuansu." + $seguai_8,26,26);
               if(icoBD != null)
               {
                  ico = new Bitmap(icoBD);
                  ico.x = leftIco.width > 0 ? leftIco.width + space : 0;
                  leftIco.addChild(ico);
               }
               str = "";
               switch($seguai_8)
               {
                  case 1:
                     str = LanResManager.getLanCommonTextWords("金");
                     break;
                  case 2:
                     str = LanResManager.getLanCommonTextWords("木");
                     break;
                  case 3:
                     str = LanResManager.getLanCommonTextWords("水");
                     break;
                  case 4:
                     str = LanResManager.getLanCommonTextWords("火");
                     break;
                  case 5:
                     str = LanResManager.getLanCommonTextWords("土");
               }
               btStr += "<font color=\'" + StaticValue.RED_HTML + "\'>" + "[" + str + "]" + "</font>";
            }
         }
         if($seguai_7 > 1)
         {
            btStr += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "[" + $seguai_7 + LanResManager.getLanCommonTextWords("倍") + LanResManager.getLanCommonTextWords("经验") + "]" + "</font>";
         }
         attrInfo = monster.attributeInfo;
         attrInfo.btStr = btStr;
         attrInfo.lv = $level;
         attrInfo.hpNow = $hpNow;
         attrInfo.hpMax = $hpMax;
         attrInfo.zhenyingID = $zhenyingID;
         monsterChar.id = $roleID;
         if($reName == null || $reName == "")
         {
            monsterChar.name = monster.res.name;
         }
         else
         {
            monsterChar.name = $reName;
         }
         if($status == 0)
         {
            if((monsterChar.data as Monster).res.type == MonsterType.AOJIANZHENGBA)
            {
               playComplete = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
               {
                  monsterChar.runAvatar(60 - $tiem);
               };
               monsterChar.playTo(CharStatusType.STAND,-1,-1,new AvatarPlayCondition(false,false,true));
               apd60 = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BOSS_DEATH_LIUSHI_DELAY),AvatarPartType.MAGIC);
               apd60.id = "daojishi";
               apd60.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.MAGIC);
               apd60.useType = 0;
               apd60.clearSameType = true;
               apd60.extendCallBack(null,playComplete,null,null);
               monsterChar.loadAvatarPart(apd60);
            }
            else if((monsterChar.data as Monster).res.type == MonsterType.CAISHEN_MONSTER)
            {
               playComplete2 = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
               {
                  monsterChar.runAvatar(100 - $tiem);
               };
               monsterChar.playTo(CharStatusType.STAND,-1,-1,new AvatarPlayCondition(false,false,true));
               apd100 = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BOSS_DEATH_CAISHEN_DELAY),AvatarPartType.MAGIC);
               apd100.id = "daojishi";
               apd100.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.MAGIC);
               apd100.useType = 0;
               apd100.clearSameType = true;
               apd100.extendCallBack(null,playComplete2,null,null);
               monsterChar.loadAvatarPart(apd100);
            }
            else
            {
               monsterChar.playTo(CharStatusType.DEATH,-1,-1,new AvatarPlayCondition(false,false,true));
            }
         }
         showName = monsterChar.name + "[LV" + attrInfo.lv + "]";
         monsterRes = monster.res;
         if(monsterRes.type == MonsterType.JINGYING)
         {
            showName = "【" + LanResManager.getLanCommonTextWords("精英") + "】" + showName;
            TopTipManager.getInstance().showSpecialTip(LanResManager.getLanTextWords(this,"视野内发现精英",[monsterChar.name]),$x,$y);
         }
         else if(monsterRes.type == MonsterType.XUNCHENG_NPC_MONSTER)
         {
            showName = monsterChar.name;
         }
         else if(monsterRes.type == MonsterType.BOSS || monsterRes.type == MonsterType.FB_BOSS || monsterRes.type == MonsterType.CUSTOM_FB_BOSS)
         {
            showName = "【BOSS】" + showName;
            TopTipManager.getInstance().showSpecialTip(LanResManager.getLanTextWords(this,"视野内发现BOSS",[monsterChar.name]),$x,$y);
         }
         else if(monsterRes.type == MonsterType.MOUNT)
         {
            showName = "【" + LanResManager.getLanCommonTextWords("可捕捉") + "】" + showName;
         }
         if(OtherConst.isMouseMoney($modelID))
         {
            TopTipManager.getInstance().showSpecialTip(LanResManager.getLanTextWords(this,"视野内发现",[monsterChar.name]),$x,$y);
         }
         if($zhenyingID)
         {
            nameColor = $zhenyingID == GameInstance.mainCharData.attributeInfo.zhenyingID ? ColorConst.FRIEND_MONSTER_NAME_COLOR : ColorConst.ENEMY_MONSTER_NAME_COLOR;
            if($zhenyingID == 3)
            {
               nameColor = ColorConst.PLAYER_SELECT_NICK_NAME_COLOR;
            }
            else if($zhenyingID == 4)
            {
               nameColor = ColorConst.PLAYER_TEAM_NICK_NAME_COLOR;
            }
         }
         else if(monsterRes.type != MonsterType.BANGQI)
         {
            nameColor = HeadFaceManager.getMonsterNameColor(attrInfo.lv);
         }
         else
         {
            nameColor = ColorConst.BANGQI_NAME_COLOR;
         }
         if(monsterRes.type == MonsterType.JIGUANGUAI)
         {
            monsterChar.removeAvatarPartByID(AvatarPartID.SHADOW);
         }
         else if(monsterRes.type != MonsterType.XUNCHENG_NPC_MONSTER)
         {
            if(monsterRes.type == MonsterType.XUNCHENG_YOUYONG_MONSTER_27)
            {
               monsterChar.hideAvatarPartByID(AvatarPartID.SHADOW);
            }
            else
            {
               if($nameDisObj != null)
               {
                  monsterChar.showHeadFace("",nameColor,"",leftIco,null,false,$nameDisObj);
               }
               else
               {
                  monsterChar.showHeadFace(showName,nameColor,"",leftIco);
               }
               monsterChar.setHeadFaceBar($hpNow,$hpMax);
            }
         }
         monsterChar.setTileXY($x,$y);
         monsterChar.setSpeed($speed);
         if(monsterRes.type == MonsterType.BAOSHI || monsterRes.type == MonsterType.DIAOXIANG || monsterRes.type == MonsterType.SHENDIAODAN_MONSTER || monsterRes.type == MonsterType.CHENGMEN_MONSTER || monsterRes.type == MonsterType.TUNSHITIANDI_MONSTER || monsterRes.type == MonsterType.LONGMAI_MONSTER || monsterRes.type == MonsterType.KOGM_MONSTER)
         {
            langle = 0;
         }
         else if(monsterRes.type == MonsterType.BANGPAI_BOSS_MONSTER)
         {
            langle = 1;
         }
         else
         {
            langle = ZMath.getRandomNumber(0,7);
         }
         monsterChar.setLogicAngle(langle);
         bc = monsterChar.data as BaseCharacter;
         if(bc != null)
         {
            avatarInfo = bc.avatarInfo;
            if($avatarDict != null)
            {
               monster.res.headFaceStr = $avatarDict.headImg;
               if($avatarDict.menpai == 1)
               {
                  avatarInfo.apd_body = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BORN_1));
               }
               else
               {
                  avatarInfo.apd_body = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BORN_0));
               }
               i = 0;
               while(i < $avatarDict.infoArr.length)
               {
                  goodsRes = GoodsResManager.getGoodsRes($avatarDict.infoArr[i]);
                  if(goodsRes != null)
                  {
                     AvatarManager.dressAvatarData(avatarInfo,goodsRes.position,goodsRes.id_m,attrInfo.getSex());
                  }
                  i++;
               }
               HeadFaceManager.updateCharPaihang($roleID,$avatarDict.chenghao,SceneCharacterType.MONSTER);
               AvatarManager.updateJingmaiAvatar(monsterChar,$avatarDict.jingmai);
               AvatarManager.updateSilingzhenAvatar(monsterChar,$avatarDict.silingzhen);
            }
            else
            {
               avatarInfo.apd_body = new AvatarParamData(Monster(monsterChar.data).getAvatarPath_Clothes());
               monsterChar.isOnMount = false;
            }
            AvatarManager.setHuangzhuangZhuangtai(monsterChar,false);
            AvatarManager.updateMainAvatar(monsterChar);
         }
         if($specialChenghaoID)
         {
            HeadFaceManager.updateCharPaihang($roleID,[$specialChenghaoID],SceneCharacterType.MONSTER,true);
         }
         if(monster.res.type == MonsterType.BOSS || monster.res.type == MonsterType.FB_BOSS || monster.res.type == MonsterType.CUSTOM_FB_BOSS)
         {
            apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_MONSTER_BOSS),AvatarPartType.MAGIC_RING);
            apd.depth = -int.MAX_VALUE + 2;
            monsterChar.loadAvatarPart(apd);
         }
         else if(monster.res.type == MonsterType.JINGYING || leftIco != null)
         {
            apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_MONSTER_JINGYING),AvatarPartType.MAGIC_RING);
            apd.depth = -int.MAX_VALUE + 2;
            monsterChar.loadAvatarPart(apd);
         }
         if(monster.res.type == 29)
         {
            if($status == 0)
            {
               monsterChar.removeAvatarPartByID(SpeciaAvatarPartID.XINMO_HEIYAN,false);
            }
            else
            {
               apd = new AvatarParamData(ResPathManager.getAvatarPath_Others("res/data/avatar/effect/eid10505."),AvatarPartType.MAGIC_RING);
               apd.id = SpeciaAvatarPartID.XINMO_HEIYAN;
               monsterChar.loadAvatarPart(apd);
            }
         }
         buffCount = int($buffIDArr.length);
         i = 0;
         while(i < buffCount)
         {
            PipeManager.sendMsg(PipeConstants.ADD_BUFF,[$buffIDArr[i][0],SceneCharacterType.MONSTER,$roleID,$buffIDArr[i][1],$buffIDArr[i][2],$buffIDArr[i][3],$buffIDArr[i][4],$buffIDArr[i][5]]);
            i++;
         }
      }
      
      public function receivedJiantaEnterScene(param1:int, param2:int, param3:int, param4:Number, param5:Number, param6:int, param7:int, param8:int, param9:String, param10:int = 0) : void
      {
         var _loc18_:AvatarInfo = null;
         this.receivedCharLeaveScene(SceneCharacterType.MONSTER,param1);
         var _loc11_:SceneCharacter = GameInstance.scene.createSceneCharacter(SceneCharacterType.MONSTER);
         var _loc12_:Monster = new Monster(_loc11_,param2);
         _loc11_.data = _loc12_;
         var _loc13_:AttributeInfo = _loc12_.attributeInfo;
         _loc13_.lv = param3;
         _loc13_.hpNow = param4;
         _loc13_.hpMax = param5;
         _loc13_.zhenyingID = param10;
         _loc11_.id = param1;
         if(param9 == null || param9 == "")
         {
            _loc11_.name = _loc12_.res.name;
         }
         else
         {
            _loc11_.name = param9;
         }
         if(param8 == 0)
         {
            _loc11_.playTo(CharStatusType.DEATH,-1,-1,new AvatarPlayCondition(false,false,true));
         }
         var _loc14_:String = _loc11_.name + "[LV" + _loc13_.lv + "]";
         var _loc15_:MonsterRes = _loc12_.res;
         var _loc16_:uint = 16777215;
         if(param10)
         {
            _loc16_ = param10 == GameInstance.mainCharData.attributeInfo.zhenyingID ? ColorConst.FRIEND_MONSTER_NAME_COLOR : ColorConst.ENEMY_MONSTER_NAME_COLOR;
            if(param10 == 3)
            {
               _loc16_ = ColorConst.PLAYER_SELECT_NICK_NAME_COLOR;
            }
            else if(param10 == 4)
            {
               _loc16_ = ColorConst.PLAYER_TEAM_NICK_NAME_COLOR;
            }
         }
         _loc11_.showHeadFace(_loc14_,_loc16_);
         _loc11_.setHeadFaceBar(param4,param5);
         _loc11_.setTileXY(param6,param7);
         _loc11_.setLogicAngle(0);
         var _loc17_:BaseCharacter = _loc11_.data as BaseCharacter;
         if(_loc17_ != null)
         {
            _loc18_ = _loc17_.avatarInfo;
            _loc18_.apd_body = new AvatarParamData(Monster(_loc11_.data).getAvatarPath_Clothes());
            _loc11_.isOnMount = false;
            AvatarManager.updateMainAvatar(_loc11_);
         }
      }
      
      private function getBtConfig(param1:int) : Array
      {
         var _loc2_:Array = [];
         switch(param1)
         {
            case 0:
               _loc2_.push(LanResManager.getLanCommonTextWords("攻击"),StaticValue.RED_HTML);
               break;
            case 1:
               _loc2_.push(LanResManager.getLanCommonTextWords("防御"),StaticValue.GREEN_HTML);
               break;
            case 2:
               _loc2_.push(LanResManager.getLanCommonTextWords("暴击"),StaticValue.PURPLE50_HTML);
               break;
            case 3:
               _loc2_.push(LanResManager.getLanCommonTextWords("闪避"),StaticValue.BlUE50_HTML);
               break;
            case 4:
               _loc2_.push(LanResManager.getLanCommonTextWords("血量"),StaticValue.ORANGE_HTML);
               break;
            case 5:
               _loc2_.push(LanResManager.getLanCommonTextWords("金钱"),StaticValue.YELLOW_HTML);
         }
         return _loc2_;
      }
      
      public function receivedMountEnterScene(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:Number) : void
      {
         var _loc8_:SceneCharacter = null;
         var _loc10_:AvatarInfo = null;
         this.receivedCharLeaveScene(SceneCharacterType.MOUNT,param1);
         _loc8_ = GameInstance.scene.createSceneCharacter(SceneCharacterType.MOUNT);
         _loc8_.data = new Mount(_loc8_,param4,param2,param3);
         if(param2 == GameInstance.mainChar.id)
         {
            GameInstance.scene.addAlwaysShowChar(_loc8_);
         }
         _loc8_.id = param1;
         _loc8_.name = Mount(_loc8_.data).res.name;
         _loc8_.showHeadFace(_loc8_.name,ColorConst.MOUNT_NICK_NAME_COLOR);
         _loc8_.setTileXY(param5,param6);
         _loc8_.setSpeed(param7);
         _loc8_.setAngle(ZMath.getRandomNumber(0,359));
         var _loc9_:BaseCharacter = _loc8_.data as BaseCharacter;
         if(_loc9_ != null)
         {
            _loc10_ = _loc9_.avatarInfo;
            _loc10_.apd_body = new AvatarParamData(Mount(_loc8_.data).getAvatarPath_Clothes());
            _loc8_.isOnMount = false;
            AvatarManager.updateMainAvatar(_loc8_);
         }
         if(param1 == GameInstance.mainCharData.mountInfo.currentFightMountID)
         {
            _loc8_ = GameInstance.scene.getCharByID(GameInstance.mainCharData.mountInfo.currentFightMountID,SceneCharacterType.MOUNT);
            if(_loc8_ != null)
            {
               _loc8_.avatar.visible = true;
               if(_loc8_.useContainer)
               {
                  _loc8_.showContainer.showAttackFaceContainer();
                  _loc8_.showContainer.showCustomFaceContainer();
               }
            }
         }
      }
      
      public function receivedGirlEnterScene(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:Number, param8:int, param9:int, param10:int, param11:int) : void
      {
         var _loc12_:SceneCharacter = null;
         var _loc14_:AvatarInfo = null;
         this.receivedCharLeaveScene(SceneCharacterType.GIRL,param1);
         _loc12_ = GameInstance.scene.createSceneCharacter(SceneCharacterType.GIRL);
         _loc12_.data = new Girl(_loc12_,param4,param2,param3);
         if(param2 == GameInstance.mainChar.id)
         {
            GameInstance.scene.addAlwaysShowChar(_loc12_);
         }
         Girl(_loc12_.data).attributeInfo.lv = param8;
         Girl(_loc12_.data).attributeInfo.hpNow = param9;
         Girl(_loc12_.data).attributeInfo.hpMax = param10;
         _loc12_.id = param1;
         _loc12_.name = Girl(_loc12_.data).res.name;
         _loc12_.showHeadFace(_loc12_.name,ColorConst.GIRL_NICK_NAME_COLOR);
         _loc12_.setTileXY(param5,param6);
         _loc12_.setSpeed(param7);
         _loc12_.setAngle(ZMath.getRandomNumber(0,359));
         if(param11 != -1)
         {
            if(SpecialGoodsID.YNCHANGEID.indexOf(param11) != -1)
            {
               Girl(_loc12_.data).res.id_m = SpecialGoodsID.YNMeiren_AvatarID_ChangeE;
            }
            if(param11 == SpecialGoodsID.YNCHANGEIDNEW)
            {
               Girl(_loc12_.data).res.id_m = SpecialGoodsID.YNMeiren_AvatarID_ChangE1;
            }
         }
         var _loc13_:BaseCharacter = _loc12_.data as BaseCharacter;
         if(_loc13_ != null)
         {
            _loc14_ = _loc13_.avatarInfo;
            _loc14_.apd_body = new AvatarParamData(Girl(_loc12_.data).getAvatarPath_Clothes());
            _loc12_.isOnMount = false;
            AvatarManager.updateMainAvatar(_loc12_);
         }
         if(param1 == GameInstance.mainCharData.girlInfo.currentFightGirlID)
         {
            _loc12_ = GameInstance.scene.getCharByID(GameInstance.mainCharData.girlInfo.currentFightGirlID,SceneCharacterType.GIRL);
            if(_loc12_ != null)
            {
               _loc12_.avatar.visible = true;
               if(_loc12_.useContainer)
               {
                  _loc12_.showContainer.showAttackFaceContainer();
                  _loc12_.showContainer.showCustomFaceContainer();
               }
            }
         }
      }
      
      public function receivedBangqiEnterScene(param1:int, param2:int, param3:int, param4:Number, param5:Number, param6:int, param7:int, param8:int, param9:String, param10:String, param11:int, param12:int, param13:int, param14:int) : void
      {
         var _loc30_:AvatarInfo = null;
         this.receivedCharLeaveScene(SceneCharacterType.MONSTER,param1);
         var _loc15_:SceneCharacter = GameInstance.scene.createSceneCharacter(SceneCharacterType.MONSTER);
         var _loc16_:Monster = new Monster(_loc15_,param2);
         _loc15_.data = _loc16_;
         var _loc17_:AttributeInfo = _loc16_.attributeInfo;
         _loc17_.lv = param11;
         _loc17_.hpNow = param4;
         _loc17_.hpMax = param5;
         _loc15_.id = param1;
         _loc15_.name = param10;
         var _loc18_:String = "<font color=\'" + ColorConst.tran16ToStr(ColorConst.BANGQI_SUOSHU_COLOR) + "\'>" + LanResManager.getLanTextWords(this,"所属",[param9]);
         var _loc19_:String = _loc15_.name + "[LV" + _loc17_.lv + "]";
         var _loc20_:uint = ColorConst.BANGQI_NAME_COLOR;
         _loc15_.showHeadFace(_loc19_,_loc20_,_loc18_);
         _loc15_.setHeadFaceBar(param4,param5);
         _loc15_.setTileXY(param6,param7);
         _loc15_.setAngle(90);
         var _loc21_:BaseCharacter = _loc15_.data as BaseCharacter;
         if(_loc21_ != null)
         {
            _loc30_ = _loc21_.avatarInfo;
            _loc30_.apd_body = new AvatarParamData(Monster(_loc15_.data).getAvatarPath_Clothes());
            _loc15_.isOnMount = false;
            AvatarManager.updateMainAvatar(_loc15_);
         }
         var _loc22_:Boolean = GameInstance.mainCharData.banghuiInfo.isTongbang(param8);
         var _loc23_:Buff = new Buff(param12);
         var _loc24_:String = LanResManager.getLanTextWords(this,"您附近存在本帮帮旗");
         var _loc25_:String = LanResManager.getLanTextWords(this,"帮旗笼罩范围内") + param13 / 100 + "%";
         var _loc26_:String = LanResManager.getLanTextWords(this,"打坐经验与打坐真气获得速度加快") + param14 / 100 + "%";
         var _loc27_:String = LanResManager.getLanTextWords(this,"您附近存在其他帮会的帮旗");
         var _loc28_:String = LanResManager.getLanTextWords(this,"该帮会成员在附近打怪经验加成") + param13 / 100 + "%";
         var _loc29_:String = LanResManager.getLanTextWords(this,"打坐经验与打坐真气获得速度加快") + param14 / 100 + "%";
         _loc17_.bangqi_suoshuBanghuiID = param8;
         _loc17_.bangqi_tipsArr = [LanResManager.getLanTextWords(this,"旗帜名称",[_loc15_.name]),LanResManager.getLanTextWords(this,"所属帮会",[param9]),LanResManager.getLanTextWords(this,"帮旗等级",[param3]),_loc24_,_loc25_,_loc26_];
         _loc17_.bangqi_tipsArr2 = [LanResManager.getLanTextWords(this,"旗帜名称",[_loc15_.name]),LanResManager.getLanTextWords(this,"所属帮会",[param9]),LanResManager.getLanTextWords(this,"帮旗等级",[param3]),_loc27_,_loc28_,_loc29_];
         PipeManager.sendMsg(PipeConstants.SET_SMALL_MAP_BANGQI,[OtherConst.BANGQI_ADD,param1,new Point(param6 * SceneConfig.TILE_WIDTH,param7 * SceneConfig.TILE_HEIGHT),_loc22_ ? _loc17_.bangqi_tipsArr : _loc17_.bangqi_tipsArr2,_loc22_]);
      }
      
      public function receivedYoulongzhirenEnterScene(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc11_:AvatarInfo = null;
         this.receivedCharLeaveScene(SceneCharacterType.MONSTER,param1);
         var _loc5_:SceneCharacter = GameInstance.scene.createSceneCharacter(SceneCharacterType.MONSTER);
         var _loc6_:Monster = new Monster(_loc5_,param2);
         _loc5_.data = _loc6_;
         var _loc7_:AttributeInfo = _loc6_.attributeInfo;
         _loc7_.hpNow = _loc7_.hpMax = -100;
         _loc5_.id = param1;
         _loc5_.name = Monster(_loc5_.data).res.name;
         var _loc8_:String = _loc5_.name;
         var _loc9_:uint = ColorConst.YOULONGZHIREN_NAME_COLOR;
         _loc5_.showHeadFace(_loc8_,_loc9_);
         _loc5_.setTileXY(param3,param4);
         _loc5_.setAngle(90);
         var _loc10_:BaseCharacter = _loc5_.data as BaseCharacter;
         if(_loc10_ != null)
         {
            _loc11_ = _loc10_.avatarInfo;
            _loc11_.apd_body = new AvatarParamData(Monster(_loc5_.data).getAvatarPath_Clothes());
            _loc5_.isOnMount = false;
            AvatarManager.updateMainAvatar(_loc5_);
         }
      }
      
      public function received3v3QiziEnterScene(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc10_:uint = 0;
         var _loc12_:AvatarInfo = null;
         this.receivedCharLeaveScene(SceneCharacterType.MONSTER,param1);
         var _loc6_:SceneCharacter = GameInstance.scene.createSceneCharacter(SceneCharacterType.MONSTER);
         var _loc7_:Monster = new Monster(_loc6_,param2);
         _loc6_.data = _loc7_;
         var _loc8_:AttributeInfo = _loc7_.attributeInfo;
         _loc8_.hpNow = _loc8_.hpMax = -100;
         _loc6_.id = param1;
         _loc6_.name = Monster(_loc6_.data).res.name;
         var _loc9_:String = _loc6_.name;
         if(param5 == 0)
         {
            _loc10_ = uint(StaticValue.RED);
         }
         else if(param5 == 1)
         {
            _loc10_ = uint(StaticValue.YELLOW);
         }
         else
         {
            _loc10_ = uint(StaticValue.BLUE);
         }
         _loc6_.showHeadFace(_loc9_,_loc10_);
         _loc6_.setTileXY(param3,param4);
         _loc6_.setAngle(90);
         var _loc11_:BaseCharacter = _loc6_.data as BaseCharacter;
         if(_loc11_ != null)
         {
            _loc12_ = _loc11_.avatarInfo;
            _loc12_.apd_body = new AvatarParamData(Monster(_loc6_.data).getAvatarPath_Clothes());
            _loc6_.isOnMount = false;
            AvatarManager.updateMainAvatar(_loc6_);
         }
      }
      
      public function receivedShenfuEnterScene(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc11_:AvatarInfo = null;
         this.receivedCharLeaveScene(SceneCharacterType.MONSTER,param1);
         var _loc5_:SceneCharacter = GameInstance.scene.createSceneCharacter(SceneCharacterType.MONSTER);
         var _loc6_:Monster = new Monster(_loc5_,param2);
         _loc5_.data = _loc6_;
         var _loc7_:AttributeInfo = _loc6_.attributeInfo;
         _loc7_.hpNow = _loc7_.hpMax = -100;
         _loc5_.id = param1;
         _loc5_.name = Monster(_loc5_.data).res.name;
         var _loc8_:String = _loc5_.name;
         var _loc9_:uint = ColorConst.SHENFU_NAME_COLOR;
         _loc5_.showHeadFace(_loc8_,_loc9_);
         _loc5_.setTileXY(param3,param4);
         _loc5_.setAngle(90);
         var _loc10_:BaseCharacter = _loc5_.data as BaseCharacter;
         if(_loc10_ != null)
         {
            _loc11_ = _loc10_.avatarInfo;
            _loc11_.apd_body = new AvatarParamData(Monster(_loc5_.data).getAvatarPath_Clothes());
            _loc5_.isOnMount = false;
            AvatarManager.updateMainAvatar(_loc5_);
         }
      }
      
      public function receivedPaodanEnterScene(param1:int, param2:int, param3:int, param4:int) : void
      {
         var fromP:Point;
         var passApd:AvatarParamData;
         var toApd:AvatarParamData;
         var fromSc:SceneCharacter = null;
         var hasRun:Boolean = false;
         var playComplete:Function = null;
         var shake:Function = null;
         var paodanDandao:String = null;
         var paodanJizhong:String = null;
         var $modelID:int = param1;
         var $tile_x:int = param2;
         var $tile_y:int = param3;
         var $fanwei:int = param4;
         playComplete = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
         {
            if(hasRun)
            {
               return;
            }
            hasRun = true;
            GameInstance.scene.removeCharacter(fromSc);
         };
         shake = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
         {
            FightManager.screen_shake(0.4,60);
         };
         var toP:Point = Transformer.transTilePoint2PixelPoint(new Point($tile_x,$tile_y));
         var dis:Number = 1000;
         var zhengfu1:int = ZMath.getRandomNumber(1,2);
         if(zhengfu1 == 1)
         {
            zhengfu1 = -1;
         }
         if(zhengfu1 == 2)
         {
            zhengfu1 = 1;
         }
         fromP = new Point();
         fromP.x = toP.x + ZMath.getRandomNumber(-dis,dis);
         fromP.y = zhengfu1 * Math.sqrt(dis * dis - (fromP.x - toP.x) * (fromP.x - toP.y)) + toP.y;
         fromSc = GameInstance.scene.createSceneCharacter(SceneCharacterType.DUMMY);
         fromSc.setXY(fromP.x,fromP.y);
         hasRun = false;
         if($modelID == OtherConst.PAODAN_NUPAO)
         {
            paodanDandao = ResPathManager.AVATAR_PAODAN_NUPAO_DANDAO;
            paodanJizhong = ResPathManager.AVATAR_PAODAN_NUPAO_JIZHONG;
         }
         else
         {
            paodanDandao = ResPathManager.AVATAR_PAODAN_HUOPAO_DANDAO;
            paodanJizhong = ResPathManager.AVATAR_PAODAN_HUOPAO_JIZHONG;
         }
         passApd = new AvatarParamData(ResPathManager.getAvatarPath_Others(paodanDandao),AvatarPartType.MAGIC_PASS);
         toApd = new AvatarParamData(ResPathManager.getAvatarPath_Others(paodanJizhong),AvatarPartType.MAGIC);
         toApd.extendCallBack(null,shake,null,playComplete);
         fromSc.showMagic_from1pass1toRectArea(toP,$fanwei * 25,$fanwei * 25,3 * 25,true,null,toApd,passApd);
      }
      
      public function receivedHunyan7EnterScene(param1:int, param2:int, param3:int, param4:int, param5:String, param6:int) : void
      {
         var _loc13_:AvatarInfo = null;
         this.receivedCharLeaveScene(SceneCharacterType.MONSTER,param1);
         var _loc7_:SceneCharacter = GameInstance.scene.createSceneCharacter(SceneCharacterType.MONSTER);
         var _loc8_:Monster = new Monster(_loc7_,param2);
         _loc7_.data = _loc8_;
         var _loc9_:AttributeInfo = _loc8_.attributeInfo;
         _loc9_.hpNow = _loc9_.hpMax = -100;
         _loc7_.id = param1;
         _loc7_.name = param5;
         _loc8_.attributeInfo.hunyan7_ID = param6;
         var _loc10_:String = _loc7_.name;
         var _loc11_:uint = ColorConst.HUNYAN7_NAME_COLOR;
         _loc7_.showHeadFace(_loc10_,_loc11_);
         _loc7_.setTileXY(param3,param4);
         _loc7_.setAngle(90);
         var _loc12_:BaseCharacter = _loc7_.data as BaseCharacter;
         if(_loc12_ != null)
         {
            _loc13_ = _loc12_.avatarInfo;
            _loc13_.apd_body = new AvatarParamData(Monster(_loc7_.data).getAvatarPath_Clothes());
            _loc7_.isOnMount = false;
            AvatarManager.updateMainAvatar(_loc7_);
         }
      }
      
      public function receivedNpcFriendEnterScene(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:Number) : void
      {
         var _loc8_:SceneCharacter = null;
         var _loc10_:AvatarInfo = null;
         this.receivedCharLeaveScene(SceneCharacterType.NPC_FRIEND,param1);
         _loc8_ = GameInstance.scene.createSceneCharacter(SceneCharacterType.NPC_FRIEND);
         _loc8_.data = new NpcFriend(_loc8_,param4,param2,param3);
         _loc8_.id = param1;
         _loc8_.name = NpcFriend(_loc8_.data).res.name;
         _loc8_.showHeadFace(_loc8_.name,ColorConst.MOUNT_NICK_NAME_COLOR);
         _loc8_.setTileXY(param5,param6);
         _loc8_.setSpeed(param7);
         _loc8_.setAngle(ZMath.getRandomNumber(0,359));
         var _loc9_:BaseCharacter = _loc8_.data as BaseCharacter;
         if(_loc9_ != null)
         {
            _loc10_ = _loc9_.avatarInfo;
            _loc10_.apd_body = new AvatarParamData(NpcFriend(_loc8_.data).getAvatarPath_Clothes());
            _loc8_.isOnMount = false;
            AvatarManager.updateMainAvatar(_loc8_);
         }
         if(param1 == GameInstance.mainCharData.npcFriendInfo.currentFightNpcFriendID)
         {
            _loc8_ = GameInstance.scene.getCharByID(GameInstance.mainCharData.npcFriendInfo.currentFightNpcFriendID,SceneCharacterType.NPC_FRIEND);
            if(_loc8_ != null)
            {
               _loc8_.avatar.visible = true;
               if(_loc8_.useContainer)
               {
                  _loc8_.showContainer.showAttackFaceContainer();
                  _loc8_.showContainer.showCustomFaceContainer();
               }
            }
         }
      }
      
      public function receivedPlayerEnterScene(param1:int, param2:Number, param3:int, param4:Boolean, param5:int, param6:String, param7:int, param8:int, param9:int, param10:String, param11:Number, param12:Number, param13:Number, param14:Number, param15:Number, param16:Number, param17:int, param18:String, param19:int, param20:Number, param21:Array, param22:Array, param23:Boolean, param24:int, param25:int, param26:int, param27:int, param28:Point, param29:int, param30:int, param31:Point, param32:Number, param33:Array, param34:String, param35:int, param36:int, param37:int, param38:int, param39:int, param40:int, param41:int, param42:int, param43:int, param44:int, param45:int, param46:int, param47:int = 0, param48:int = 0, param49:int = -1, param50:Boolean = false, param51:int = 0, param52:int = 0, param53:int = 0, param54:int = 0, param55:* = 0, param56:* = 0, param57:* = 0, param58:* = 0, param59:* = 0, param60:Boolean = false, param61:Boolean = false, param62:int = -1, param63:int = 0, param64:* = false, param65:* = 0, param66:int = 0, param67:Boolean = false, param68:Boolean = false, param69:Boolean = false, param70:int = 0, param71:int = 0, param72:* = 0, param73:int = 0, param74:int = 0, param75:Boolean = false, param76:Boolean = false, param77:int = 0, param78:Boolean = false, param79:Boolean = false, param80:Boolean = false, param81:Boolean = false, param82:int = -1, param83:int = 0, param84:int = 0, param85:int = 0) : void
      {
         var _loc95_:Object = null;
         var _loc96_:Object = null;
         var _loc97_:int = 0;
         var _loc101_:AvatarParamData = null;
         var _loc102_:BitmapData = null;
         var _loc103_:BitmapData = null;
         var _loc104_:int = 0;
         var _loc105_:GoodsRes = null;
         var _loc106_:MountRes = null;
         this.receivedCharLeaveScene(param1,param3);
         var _loc86_:SceneCharacter = GameInstance.scene.createSceneCharacter(param1);
         var _loc87_:Player = new Player(_loc86_);
         _loc86_.data = _loc87_;
         if(param85 > 0)
         {
            _loc101_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager["AVATAR_ZHUANSHENG_" + param85]),AvatarPartType.MAGIC_RING);
            _loc101_.id = "zhuansheng_lv";
            _loc101_.depth = OtherConst.SILINGZHEN_DEPTH;
            _loc86_.loadAvatarPart(_loc101_);
         }
         else if(_loc86_)
         {
            _loc86_.removeAvatarPartByID("zhuansheng_lv");
         }
         _loc87_.isDiZi = param69;
         _loc87_.mainId = param70;
         _loc87_.mainBangHuiId = param71;
         if(param70 == GameInstance.mainChar.id)
         {
            GameInstance.scene.addAlwaysShowChar(_loc86_);
            if(_loc86_ != null)
            {
               _loc86_.avatar.visible = true;
               if(_loc86_.useContainer)
               {
                  _loc86_.showContainer.showAttackFaceContainer();
                  _loc86_.showContainer.showCustomFaceContainer();
               }
            }
         }
         var _loc88_:AvatarInfo = _loc87_.avatarInfo;
         var _loc89_:AttributeInfo = _loc87_.attributeInfo;
         _loc89_.isGM = param4;
         _loc89_.lv = param35;
         _loc89_.partyID = param7;
         _loc89_.headImg = param10;
         _loc89_.hpNow = param11;
         _loc89_.hpMax = param12;
         _loc89_.mpNow = param13;
         _loc89_.mpMax = param14;
         _loc89_.ppNow = param15;
         _loc89_.ppMax = param16;
         _loc89_.mdx = param20;
         _loc89_.jinzhongzhaoCount = param44;
         _loc89_.jinzhongzhaoColor = param45;
         _loc89_.wuxingZhanyiKaijia = param46;
         _loc89_.wufang = param84;
         _loc89_.pingtaiID = param49;
         _loc89_.zhenyingID = param47;
         _loc87_.banghuiInfo.banghuiId = param17;
         _loc87_.banghuiInfo.banghuiName = param18;
         _loc89_.xunZhangJingJie = param62;
         _loc89_.isTianmingXunzhang = param67;
         _loc89_.isLongwenFuzhou = param68;
         _loc89_.isWuGenXianZhou = param75;
         _loc89_.isJiDaoQianKunXunZhang = param76;
         _loc89_.skillLvStatus = param82;
         _loc89_.isTianDiRenHe = param78;
         _loc89_.isDaoGuXianFengXunZhang = param79;
         _loc89_.isXuanJianLingPo = param80;
         _loc89_.isYuanJianLingPo = param81;
         _loc87_.achieveInfo.setCurrentTitle(param19);
         var _loc90_:String = "";
         var _loc91_:String = _loc87_.achieveInfo.getCurrentTitle();
         if(_loc91_ != "")
         {
            _loc90_ = "<font color=\'" + ColorConst.tran16ToStr(ColorConst.PLAYER_TITLE_COLOR) + "\'>" + _loc91_ + "</font>";
         }
         var _loc92_:String = _loc87_.banghuiInfo.banghuiName;
         if(_loc92_ != "" && _loc92_ != null)
         {
            if(_loc90_ != "")
            {
               _loc90_ += "<br />";
            }
            _loc90_ += "<font color=\'" + ColorConst.tran16ToStr(ColorConst.PLAYER_BANGHUI_COLOR) + "\'>[" + LanResManager.getLanCommonTextWords("帮会") + "]" + _loc92_.replace(/^\[(\d+)(.*)\](.+)$/,"$3[$1$2]") + "</font>";
         }
         var _loc93_:String = param4 ? "【GM】" : "";
         _loc86_.id = param3;
         _loc86_.name = param6;
         var _loc94_:uint = ColorConst.PLAYER_NICK_NAME_COLOR;
         if(param47)
         {
            _loc94_ = param47 == GameInstance.mainCharData.attributeInfo.zhenyingID ? ColorConst.FRIEND_MONSTER_NAME_COLOR : ColorConst.ENEMY_MONSTER_NAME_COLOR;
         }
         if(param50)
         {
            _loc86_.showHeadFace(_loc93_ + LanResManager.getLanCommonTextWords("刺客"),_loc94_,"");
         }
         else if(GameInstance.scene.mapConfig.mapID == OtherConst.FUQIJINGJICHANG_MAP_ID)
         {
            if(GameInstance.mainCharData.teamInfo.getPlayerByID(param3) != null)
            {
               if(GameInstance.mainCharData.attributeInfo.vs3V3Team == 1)
               {
                  _loc94_ = ColorConst.VS3V3_HUANG_COLOR;
               }
               else
               {
                  _loc94_ = ColorConst.VS3V3_LAN_COLOR;
               }
               _loc86_.showHeadFace(_loc93_ + param6.replace(/^\[(\d+)(.*)\](.+)$/,"$3[$1$2]"),_loc94_,_loc90_);
            }
            else
            {
               if(GameInstance.mainCharData.attributeInfo.vs3V3Team == 1)
               {
                  _loc94_ = ColorConst.VS3V3_LAN_COLOR;
               }
               else
               {
                  _loc94_ = ColorConst.VS3V3_HUANG_COLOR;
               }
               _loc86_.showHeadFace(_loc93_ + LanResManager.getLanCommonTextWords("敌方"),_loc94_,"");
            }
         }
         else
         {
            _loc86_.showHeadFace(_loc93_ + param6.replace(/^\[(\d+)(.*)\](.+)$/,"$3[$1$2]"),_loc94_,_loc90_);
         }
         if(_loc89_.jinzhongzhaoColor == 1)
         {
            _loc102_ = RslLoaderManager.getInstance("ui.char.jinzhongzhao1");
         }
         else
         {
            _loc102_ = RslLoaderManager.getInstance("ui.char.jinzhongzhao");
         }
         if(_loc89_.jinzhongzhaoCount == 0)
         {
            _loc95_ = {
               "color":16711680,
               "bmdNum":_loc89_.jinzhongzhaoCount,
               "bmd":_loc102_
            };
         }
         else
         {
            _loc95_ = {
               "color":16776960,
               "bmdNum":_loc89_.jinzhongzhaoCount,
               "bmd":_loc102_
            };
         }
         if(_loc89_.wuxingZhanyiKaijia > 0)
         {
            _loc103_ = RslLoaderManager.getInstance("ui.char.wuxingzhanyikaijia." + _loc89_.wuxingZhanyiKaijia);
            _loc96_ = {
               "isShowBmd":true,
               "bmd":_loc103_
            };
         }
         else
         {
            _loc103_ = RslLoaderManager.getInstance("ui.char.wuxingzhanyikaijia.1");
            _loc96_ = {
               "isShowBmd":false,
               "bmd":_loc103_
            };
         }
         _loc86_.setHeadFaceBar(param11,_loc89_.hpMax,_loc95_,_loc96_);
         _loc86_.setTileXY(param8,param9);
         _loc86_.setSpeed(param20);
         _loc86_.setAngle(ZMath.getRandomNumber(0,359));
         if(param5 == 0)
         {
            _loc86_.playTo(CharStatusType.DEATH,-1,-1,new AvatarPlayCondition(false,false,true));
         }
         var _loc98_:int = int(param21.length);
         var _loc99_:int = int(param22.length);
         _loc88_.clear();
         _loc97_ = 0;
         while(_loc97_ < _loc98_)
         {
            if(param1 != 9)
            {
               PipeManager.sendMsg(PipeConstants.ADD_BUFF,[param21[_loc97_][0],param1,param3,param21[_loc97_][1],param21[_loc97_][2],param21[_loc97_][3],param21[_loc97_][4],param21[_loc97_][5]]);
            }
            _loc97_++;
         }
         var _loc100_:Array = SpeciaAvatarPartID.AVATAT_ID_LONGWENKEHUA[_loc89_.partyID];
         if(_loc100_ != null)
         {
            _loc104_ = int(_loc100_[param65]);
         }
         _loc88_.usingFashion = param48;
         _loc88_.isCiKe = param50;
         _loc88_.useAvatarType = param51;
         _loc88_.isZunrongWanbaoge = param60;
         _loc88_.isShowLongWenKeHua = param64;
         _loc88_.avatarCount = _loc99_;
         _loc88_.avatarGoodsIDArr = param22;
         if(GameInstance.scene.mapConfig.mapID == 20304)
         {
            _loc88_.wangzhezhibang = param47;
         }
         else
         {
            _loc88_.zhenYingHuanZhuang = param47;
         }
         _loc86_.moveData.onDigun = param61;
         _loc97_ = 0;
         while(_loc97_ < _loc99_)
         {
            _loc105_ = GoodsResManager.getGoodsRes(param22[_loc97_]);
            if(_loc105_ != null)
            {
               AvatarManager.dressAvatarData(_loc88_,_loc105_.position,_loc105_.id_m,_loc89_.getSex(),_loc104_);
            }
            _loc97_++;
         }
         _loc88_.useIng_Weapon_id = param43;
         if(ReloginManager.isInGongcheng)
         {
            if(_loc88_.apd_ylzr != null)
            {
               GameInstance.scene.addAlwaysShowChar(_loc86_);
            }
         }
         else if(ReloginManager.isInKuafu)
         {
            if(_loc88_.apd_xyj != null)
            {
               GameInstance.scene.addAlwaysShowChar(_loc86_);
            }
         }
         _loc86_.isOnMount = param23;
         if(param23)
         {
            if(_loc87_.buffInfo.getBuff(80200554))
            {
               _loc88_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,SpecialGoodsID.HUANGJIN_SHENGLONG_ID),AvatarPartType.MOUNT);
            }
            else if(_loc88_.useAvatarType > 0)
            {
               _loc88_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,AvatarManager.getAvatarIdByType(param51)),AvatarPartType.MOUNT);
            }
            else
            {
               _loc106_ = MountResManager.getMountRes(param24);
               if(_loc106_ != null)
               {
                  _loc88_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,_loc106_.id_m),AvatarPartType.MOUNT);
               }
            }
            _loc88_.lastMountId = param24;
         }
         if(param55 != 0)
         {
            _loc88_.isBiWuZhaoQinFeiDaDiao = true;
            _loc88_.biWuZhaoQinFeiDaDiao_id = param55;
            _loc88_.biWuZhaoQinFeiDaDiao_qicheng_zhuangtai = _loc86_.isOnMount;
            _loc88_.biWuZhaoQinFeiDaDiao_zuoqi = (_loc86_.data as BaseCharacter).avatarInfo.apd_mount;
            _loc86_.isOnMount = true;
            (_loc86_.data as BaseCharacter).avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Others("res/data/avatar/clothes/mid" + param55 + "."),AvatarPartType.MOUNT);
            _loc86_.setSpeed(200);
         }
         else
         {
            _loc88_.isBiWuZhaoQinFeiDaDiao = false;
            _loc88_.biWuZhaoQinFeiDaDiao_id = -1;
         }
         if(param59 != 0)
         {
            _loc88_.isFuQiJingJiFeiDaDiao = true;
            _loc88_.FuQiJingJiFeiDaDiao_id = param59;
            _loc88_.FuQiJingJiFeiDaDiao_qicheng_zhuangtai = _loc86_.isOnMount;
            _loc88_.FuQiJingJiFeiDaDiao_zuoqi = (_loc86_.data as BaseCharacter).avatarInfo.apd_body;
            _loc86_.isOnMount = false;
            _loc86_.hideAvatarPartByID(SpeciaAvatarPartID.WEAPON);
            _loc86_.hideAvatarPartByID(SpeciaAvatarPartID.BOW);
            (_loc86_.data as BaseCharacter).avatarInfo.apd_body = new AvatarParamData(ResPathManager.getAvatarPath_Others("res/data/avatar/clothes/mid" + param59 + "."),AvatarPartType.BODY);
            _loc86_.setSpeed(200);
         }
         else
         {
            _loc88_.isFuQiJingJiFeiDaDiao = false;
            _loc88_.FuQiJingJiFeiDaDiao_id = -1;
         }
         if(param2 != 0)
         {
            _loc88_.isFenshenHuanzhuang = true;
            _loc86_.isOnMount = false;
            (_loc86_.data as BaseCharacter).avatarInfo.apd_body = new AvatarParamData(ResPathManager.getAvatarPath_Others("res/data/avatar/clothes/mid" + param2 + "."),AvatarPartType.BODY);
         }
         else
         {
            _loc88_.isFenshenHuanzhuang = false;
         }
         _loc88_.isFeixing = param56;
         _loc88_.isFeixing_huanzhuang_Id = param57;
         _loc88_.isFeixing_wuhun_Id = param58;
         AvatarManager.updateJingmaiAvatar(_loc86_,param25);
         _loc87_.attributeInfo.qixuan1ID = 0;
         _loc87_.attributeInfo.qixuan2ID = 0;
         _loc87_.attributeInfo.qixuan3ID = 0;
         _loc87_.attributeInfo.qixuan4ID = 0;
         _loc87_.attributeInfo.qixuan5ID = 0;
         _loc87_.attributeInfo.qixuan1ID = param36;
         _loc87_.attributeInfo.qixuan2ID = param37;
         _loc87_.attributeInfo.qixuan3ID = param38;
         _loc87_.attributeInfo.qixuan4ID = param39;
         _loc87_.attributeInfo.qixuan5ID = param40;
         AvatarManager.updateQixuanAvatar(_loc86_,param36,param37,param38,param39,param40);
         _loc87_.attributeInfo.sitAvartID = param41;
         if(param26 != 0)
         {
            PipeManager.sendMsg(PipeConstants.CHAR_DAZUO_SHUANGXIU_STATUS,[param3,param26,param27,param28.x,param28.y,param52,param53,param54,0]);
         }
         if(param29 != 0)
         {
            PipeManager.sendMsg(PipeConstants.CHAR_LIAOSHANG_STATUS,[param3,param29,param30,param31.x,param31.y,param52,0]);
         }
         _loc87_.attributeInfo.silingzhenCount = param42;
         _loc87_.attributeInfo.shengsifuCount = param63;
         _loc87_.attributeInfo.zhenlongqiHeiCount = param73;
         _loc87_.attributeInfo.zhenlongqiBaiCount = param74;
         _loc87_.attributeInfo.xisuijingCount = param77;
         _loc87_.attributeInfo.wuCaiXianZhenCount = param66;
         AvatarManager.updateSilingzhenAvatar(_loc86_,param42);
         AvatarManager.updateShensifuAvatar(_loc86_,param63);
         AvatarManager.updateZhenLongqiHeiAvatar(_loc86_,param73);
         AvatarManager.updateZhenLongqiBaiAvatar(_loc86_,param74);
         AvatarManager.updateFenTianNuQiAvatar(_loc86_,param77);
         AvatarManager.updateWuCaiXianZhenAvatar(_loc86_,param66);
         AvatarManager.AddEar_By_200Zhuangbei(_loc86_,11114,param83);
         AvatarManager.setHuangzhuangZhuangtai(_loc86_,false);
         AvatarManager.updateMainAvatar(_loc86_);
         if(param59 != 0)
         {
            _loc86_.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
            _loc86_.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
            _loc88_.gengXin = false;
         }
         if(param50)
         {
            return;
         }
         if(param47 == 5 || param47 == 6)
         {
            HeadFaceManager.updateCharSkillLevel(param3,param32,param1);
            return;
         }
         if(GameInstance.scene.mapConfig.mapID == OtherConst.FUQIJINGJICHANG_MAP_ID)
         {
            if(GameInstance.mainCharData.teamInfo.getPlayerByID(param3) == null)
            {
               return;
            }
         }
         HeadFaceManager.updateCharSkillLevel(param3,param32,param1);
         HeadFaceManager.updatePlayersName([param3]);
         HeadFaceManager.updateCharPaihang(param3,param33,param1,false,param34);
         HeadFaceManager.updateCharChenwei(param3,param72,param1);
      }
      
      public function receivedCharLeaveScene(param1:int, param2:int) : void
      {
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(param2,param1);
         if(!_loc3_)
         {
            return;
         }
         if(GameInstance.lockOnChar == _loc3_)
         {
            PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,null);
            if(_loc3_.type == SceneCharacterType.PLAYER)
            {
               GameInstance.lastLockPlayerID = _loc3_.id;
            }
         }
         SitManager.removeFromSinShuangxiu(_loc3_);
         if(_loc3_.data is Monster && (_loc3_.data as Monster).res.type == MonsterType.BANGQI)
         {
            PipeManager.sendMsg(PipeConstants.SET_SMALL_MAP_BANGQI,[OtherConst.BANGQI_REMOVE,param2]);
         }
         GameInstance.scene.removeCharacter(_loc3_);
      }
      
      public function loadNPC() : void
      {
         var _loc3_:int = 0;
         var _loc5_:NpcRes = null;
         var _loc6_:SceneCharacter = null;
         var _loc7_:String = null;
         var _loc8_:BaseCharacter = null;
         var _loc9_:AvatarInfo = null;
         var _loc1_:int = GameInstance.scene.mapConfig.mapID;
         var _loc2_:Array = NpcResManager.getNpcResListBySceneID(_loc1_);
         var _loc4_:int = int(_loc2_.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc2_[_loc3_];
            _loc6_ = GameInstance.scene.createSceneCharacter(SceneCharacterType.NPC);
            _loc6_.data = new NPC(_loc6_,_loc5_.id_kind);
            _loc6_.id = _loc5_.id_kind;
            _loc6_.name = _loc5_.name;
            _loc7_ = "<font color=\'" + ColorConst.tran16ToStr(ColorConst.NPC_INFO_COLOR) + "\'>" + _loc5_.nickname + "</font>";
            _loc6_.showHeadFace(_loc5_.name,ColorConst.NPC_NICK_NAME_COLOR,_loc7_);
            _loc6_.setTileXY(_loc5_.x,_loc5_.y);
            _loc6_.setLogicAngle(_loc5_.direction);
            _loc8_ = _loc6_.data as BaseCharacter;
            if(_loc8_ != null)
            {
               _loc9_ = _loc8_.avatarInfo;
               _loc9_.apd_body = new AvatarParamData(NPC(_loc6_.data).getAvatarPath_Clothes());
               _loc6_.isOnMount = false;
               AvatarManager.updateMainAvatar(_loc6_);
            }
            if(_loc5_.randomTalk.length > 0)
            {
               NpcRandomTalkManager.add(_loc5_);
            }
            _loc3_++;
         }
      }
      
      public function loadTelePort() : void
      {
         var _loc2_:int = 0;
         var _loc5_:TransOutRes = null;
         var _loc6_:SceneCharacter = null;
         var _loc7_:Telport = null;
         var _loc8_:String = null;
         var _loc9_:BaseCharacter = null;
         var _loc10_:int = 0;
         var _loc11_:AvatarInfo = null;
         var _loc1_:MapRes = MapTransManager.getMapRes(GameInstance.scene.mapConfig.mapID);
         var _loc3_:int = int(_loc1_.transOutResArr.length);
         var _loc4_:int = SceneCharacterType.getDefaultDepth(SceneCharacterType.TRANSPORT);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc5_ = _loc1_.transOutResArr[_loc2_];
            _loc5_.opened = _loc5_.enable;
            _loc6_ = GameInstance.scene.createSceneCharacter(SceneCharacterType.TRANSPORT,0,0,_loc4_);
            _loc6_.data = new Telport(_loc6_,_loc5_);
            _loc7_ = _loc6_.data as Telport;
            _loc6_.id = _loc7_.res.id;
            _loc6_.name = _loc7_.targetMapRes.name;
            if(_loc7_.targetMapRes.exercise_desc != "")
            {
               _loc8_ = "<font color=\'" + ColorConst.tran16ToStr(ColorConst.TRANSPORT_LEVEL_COLOR) + "\'>" + _loc7_.targetMapRes.exercise_desc + "</font>";
            }
            else
            {
               _loc8_ = "";
            }
            _loc6_.showHeadFace(_loc6_.name,ColorConst.TRANSPORT_NICK_NAME_COLOR,_loc8_);
            _loc6_.setTileXY(_loc7_.res.x,_loc7_.res.y);
            _loc9_ = _loc6_.data as BaseCharacter;
            if(_loc9_ != null)
            {
               if(_loc5_.opened)
               {
                  _loc10_ = _loc5_.openId;
               }
               else
               {
                  _loc10_ = _loc5_.closeId;
               }
               _loc11_ = _loc9_.avatarInfo;
               _loc11_.apd_body = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_TELPORT,_loc10_));
               _loc6_.isOnMount = false;
               AvatarManager.updateMainAvatar(_loc6_);
            }
            _loc2_++;
         }
      }
      
      public function updateNpcTaskState(param1:Array, param2:Array, param3:Array, param4:Array) : void
      {
         var allScArr:Array;
         var sc:SceneCharacter = null;
         var npcID:int = 0;
         var $npcArr1:Array = param1;
         var $npcArr2:Array = param2;
         var $npcArr3:Array = param3;
         var $npcArr4:Array = param4;
         var setNpcTaskStatus:Function = function(param1:int, param2:int):void
         {
            var _loc4_:String = null;
            var _loc5_:AvatarParamData = null;
            var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(param2,SceneCharacterType.NPC);
            if(_loc3_)
            {
               if(param1 == 1)
               {
                  _loc4_ = ResPathManager.AVATAR_NPC_TASK_STATUS_1;
               }
               else if(param1 == 2)
               {
                  _loc4_ = ResPathManager.AVATAR_NPC_TASK_STATUS_2;
               }
               else if(param1 == 3)
               {
                  _loc4_ = ResPathManager.AVATAR_NPC_TASK_STATUS_3;
               }
               else
               {
                  _loc4_ = ResPathManager.AVATAR_NPC_TASK_STATUS_4;
               }
               _loc5_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(_loc4_),AvatarPartType.MAGIC_RING);
               _loc5_.id = SpeciaAvatarPartID.NPC_TASK_STATUS;
               _loc3_.loadAvatarPart(_loc5_);
            }
         };
         if(!$npcArr1 || !$npcArr2 || !$npcArr3 || !$npcArr4)
         {
            return;
         }
         allScArr = GameInstance.scene.sceneCharacters;
         for each(sc in allScArr)
         {
            if(sc.type == SceneCharacterType.NPC)
            {
               sc.removeAvatarPartByID(SpeciaAvatarPartID.NPC_TASK_STATUS);
            }
         }
         for each(npcID in $npcArr2)
         {
            setNpcTaskStatus(2,npcID);
         }
         for each(npcID in $npcArr1)
         {
            setNpcTaskStatus(1,npcID);
         }
         for each(npcID in $npcArr4)
         {
            setNpcTaskStatus(4,npcID);
         }
         for each(npcID in $npcArr3)
         {
            setNpcTaskStatus(3,npcID);
         }
      }
      
      public function receivedTransIsOpened(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc5_:SceneCharacter = null;
         var _loc6_:BaseCharacter = null;
         var _loc7_:int = 0;
         var _loc8_:AvatarInfo = null;
         if(param1 != GameInstance.scene.mapConfig.mapID)
         {
            return;
         }
         var _loc4_:TransOutRes = MapTransManager.getTransOutResByID(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.opened = param3;
            _loc5_ = GameInstance.scene.getCharByID(_loc4_.id,SceneCharacterType.TRANSPORT);
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.data as BaseCharacter;
               if(_loc6_ != null)
               {
                  if(_loc4_.opened)
                  {
                     _loc7_ = _loc4_.openId;
                  }
                  else
                  {
                     _loc7_ = _loc4_.closeId;
                  }
                  _loc8_ = _loc6_.avatarInfo;
                  _loc8_.apd_body = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_TELPORT,_loc7_));
                  _loc5_.isOnMount = false;
                  AvatarManager.updateMainAvatar(_loc5_);
               }
            }
         }
      }
      
      public function receivedTransChangeName(param1:int, param2:int, param3:String) : void
      {
         var _loc5_:SceneCharacter = null;
         if(param1 != GameInstance.scene.mapConfig.mapID)
         {
            return;
         }
         var _loc4_:TransOutRes = MapTransManager.getTransOutResByID(param1,param2);
         if(_loc4_ != null)
         {
            _loc5_ = GameInstance.scene.getCharByID(_loc4_.id,SceneCharacterType.TRANSPORT);
            if(_loc5_ != null)
            {
               _loc5_.setHeadFaceNickName(param3,_loc5_.getHeadFaceNickNameColor());
            }
         }
         PipeManager.sendMsg(PipeConstants.SET_SMALL_MAP_STATIC_DATA,[true,false,false]);
      }
      
      public function receivedQinggongyanEnterScene(param1:int, param2:int, param3:int, param4:String) : void
      {
         var _loc11_:AvatarInfo = null;
         this.receivedCharLeaveScene(SceneCharacterType.MONSTER,param1);
         var _loc5_:SceneCharacter = GameInstance.scene.createSceneCharacter(SceneCharacterType.MONSTER);
         var _loc6_:Monster = new Monster(_loc5_,21004);
         _loc5_.data = _loc6_;
         var _loc7_:AttributeInfo = _loc6_.attributeInfo;
         _loc7_.hpNow = _loc7_.hpMax = -100;
         _loc5_.id = param1;
         _loc5_.name = param4;
         var _loc8_:String = _loc5_.name;
         var _loc9_:uint = ColorConst.HUNYAN7_NAME_COLOR;
         _loc5_.showHeadFace(_loc8_,_loc9_);
         _loc5_.setTileXY(param2,param3);
         _loc5_.setAngle(90);
         var _loc10_:BaseCharacter = _loc5_.data as BaseCharacter;
         if(_loc10_ != null)
         {
            _loc11_ = _loc10_.avatarInfo;
            _loc11_.apd_body = new AvatarParamData(Monster(_loc5_.data).getAvatarPath_Clothes());
            _loc5_.isOnMount = false;
            AvatarManager.updateMainAvatar(_loc5_);
         }
      }
      
      public function receivedXuYuanShuEnterScene(param1:int, param2:int, param3:int, param4:int, param5:String, param6:int) : void
      {
         var _loc13_:AvatarInfo = null;
         var _loc7_:SceneCharacter = GameInstance.scene.createSceneCharacter(SceneCharacterType.MONSTER);
         var _loc8_:Monster = new Monster(_loc7_,param1);
         _loc7_.data = _loc8_;
         var _loc9_:AttributeInfo = _loc8_.attributeInfo;
         _loc9_.hpNow = _loc9_.hpMax = -100;
         _loc7_.id = param6;
         _loc7_.name = param5 + LanResManager.getLanCommonTextWords("的树");
         var _loc10_:String = _loc7_.name;
         var _loc11_:uint = ColorConst.HUNYAN7_NAME_COLOR;
         _loc7_.showHeadFace(_loc10_,_loc11_);
         _loc7_.setTileXY(param2,param3);
         _loc7_.setAngle(90);
         var _loc12_:BaseCharacter = _loc7_.data as BaseCharacter;
         if(_loc12_ != null)
         {
            _loc13_ = _loc12_.avatarInfo;
            _loc13_.apd_body = new AvatarParamData(Monster(_loc7_.data).getAvatarPath_Clothes());
            _loc7_.isOnMount = false;
            AvatarManager.updateMainAvatar(_loc7_);
         }
      }
      
      public function receivedZhongZhiJianEnterScene(param1:int, param2:int, param3:int, param4:String, param5:int) : void
      {
         var _loc12_:AvatarInfo = null;
         var _loc6_:SceneCharacter = GameInstance.scene.createSceneCharacter(SceneCharacterType.MONSTER);
         var _loc7_:Monster = new Monster(_loc6_,param1);
         _loc6_.data = _loc7_;
         var _loc8_:AttributeInfo = _loc7_.attributeInfo;
         _loc8_.hpNow = _loc8_.hpMax = -100;
         _loc6_.id = param5;
         if(_loc7_.res.type == MonsterType.ZHONGQIUJIE_ZHUOZI_MONSTER)
         {
            _loc6_.name = param4 + LanResManager.getLanCommonTextWords("的团圆饭桌");
         }
         else
         {
            _loc6_.name = param4 + LanResManager.getLanCommonTextWords("的轩辕剑");
         }
         var _loc9_:String = _loc6_.name;
         var _loc10_:uint = ColorConst.HUNYAN7_NAME_COLOR;
         _loc6_.showHeadFace(_loc9_,_loc10_);
         _loc6_.setTileXY(param2,param3);
         _loc6_.setAngle(90);
         var _loc11_:BaseCharacter = _loc6_.data as BaseCharacter;
         if(_loc11_ != null)
         {
            _loc12_ = _loc11_.avatarInfo;
            _loc12_.apd_body = new AvatarParamData(Monster(_loc6_.data).getAvatarPath_Clothes());
            _loc6_.isOnMount = false;
            AvatarManager.updateMainAvatar(_loc6_);
         }
      }
      
      public function receivedNpcGuaiwuEnterScene(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String, param7:int) : void
      {
         var _loc14_:AvatarInfo = null;
         this.receivedCharLeaveScene(SceneCharacterType.MONSTER,param1);
         var _loc8_:SceneCharacter = GameInstance.scene.createSceneCharacter(SceneCharacterType.MONSTER);
         var _loc9_:Monster = new Monster(_loc8_,param2);
         _loc8_.data = _loc9_;
         var _loc10_:AttributeInfo = _loc9_.attributeInfo;
         _loc10_.hpNow = _loc10_.hpMax = -100;
         _loc8_.id = param1;
         _loc8_.name = param6;
         var _loc11_:String = _loc8_.name;
         var _loc12_:uint = ColorConst.HUNYAN7_NAME_COLOR;
         _loc8_.showHeadFace(_loc11_,_loc12_);
         _loc8_.setTileXY(param3,param4);
         _loc8_.setLogicAngle(param5);
         var _loc13_:BaseCharacter = _loc8_.data as BaseCharacter;
         if(_loc13_ != null)
         {
            _loc14_ = _loc13_.avatarInfo;
            _loc14_.apd_body = new AvatarParamData(Monster(_loc8_.data).getAvatarPath_Clothes());
            _loc8_.isOnMount = false;
            AvatarManager.updateMainAvatar(_loc8_);
         }
         if(param7 == 1)
         {
            _loc8_.playTo(CharStatusType.SIT,-1,-1,new AvatarPlayCondition(false,false,true));
         }
         else
         {
            _loc8_.playTo(CharStatusType.STAND);
         }
      }
      
      public function receivedNpcGuaiwuXiagui(param1:int, param2:int) : void
      {
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(param1,SceneCharacterType.MONSTER);
         if(_loc3_ == null)
         {
            return;
         }
         if(param2 == 1)
         {
            _loc3_.playTo(CharStatusType.SIT,-1,-1,new AvatarPlayCondition(false,false,true));
         }
         else
         {
            _loc3_.playTo(CharStatusType.STAND);
         }
      }
      
      public function receivedXianJingEnterScene(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc11_:AvatarInfo = null;
         this.receivedCharLeaveScene(SceneCharacterType.DUMMY,param1);
         var _loc5_:SceneCharacter = GameInstance.scene.createSceneCharacter(SceneCharacterType.DUMMY);
         var _loc6_:Monster = new Monster(_loc5_,param2);
         _loc5_.data = _loc6_;
         var _loc7_:AttributeInfo = _loc6_.attributeInfo;
         _loc7_.hpNow = _loc7_.hpMax = -100;
         _loc5_.id = param1;
         _loc5_.name = Monster(_loc5_.data).res.name;
         var _loc8_:String = _loc5_.name;
         var _loc9_:uint = ColorConst.SHENFU_NAME_COLOR;
         _loc5_.showHeadFace(_loc8_,_loc9_);
         _loc5_.setTileXY(param3,param4);
         _loc5_.setAngle(90);
         var _loc10_:BaseCharacter = _loc5_.data as BaseCharacter;
         if(_loc10_ != null)
         {
            _loc11_ = _loc10_.avatarInfo;
            _loc11_.apd_body = new AvatarParamData(Monster(_loc5_.data).getAvatarPath_Clothes());
            _loc5_.isOnMount = false;
            AvatarManager.updateMainAvatar(_loc5_);
         }
      }
      
      public function receivedSpecialEnterScene(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Object) : void
      {
         var _loc11_:Number = NaN;
         var _loc13_:AvatarInfo = null;
         var _loc14_:int = 0;
         var _loc15_:GoodsRes = null;
         this.receivedCharLeaveScene(SceneCharacterType.DUMMY,param1);
         var _loc7_:SceneCharacter = GameInstance.scene.createSceneCharacter(SceneCharacterType.DUMMY);
         var _loc8_:Monster = new Monster(_loc7_,param2);
         _loc7_.data = _loc8_;
         var _loc9_:AttributeInfo = _loc8_.attributeInfo;
         _loc7_.id = param1;
         if(param5 == 0)
         {
            _loc7_.playTo(CharStatusType.DEATH,-1,-1,new AvatarPlayCondition(false,false,true));
         }
         var _loc10_:MonsterRes = _loc8_.res;
         _loc7_.setTileXY(param3,param4);
         if(_loc10_.type == MonsterType.BAOSHI || _loc10_.type == MonsterType.DIAOXIANG)
         {
            _loc11_ = 0;
         }
         else
         {
            _loc11_ = ZMath.getRandomNumber(0,7);
         }
         _loc7_.setLogicAngle(_loc11_);
         var _loc12_:BaseCharacter = _loc7_.data as BaseCharacter;
         if(_loc12_ != null)
         {
            _loc13_ = _loc12_.avatarInfo;
            if(param6 != null)
            {
               if(param6.menpai == 1)
               {
                  _loc13_.apd_body = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BORN_1));
               }
               else
               {
                  _loc13_.apd_body = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BORN_0));
               }
               _loc14_ = 0;
               while(_loc14_ < param6.infoArr.length)
               {
                  _loc15_ = GoodsResManager.getGoodsRes(param6.infoArr[_loc14_]);
                  if(_loc15_ != null)
                  {
                     AvatarManager.dressAvatarData(_loc13_,_loc15_.position,_loc15_.id_m,_loc9_.getSex());
                  }
                  _loc14_++;
               }
            }
            else
            {
               _loc13_.apd_body = new AvatarParamData(Monster(_loc7_.data).getAvatarPath_Clothes());
               _loc7_.isOnMount = false;
            }
            AvatarManager.updateMainAvatar(_loc7_);
         }
      }
   }
}

