package com.tgame.moudels.fight.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.skill.SkillRes;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.staticdata.MonsterType;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.NewPlayerGuideType;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpeciaAvatarPartID;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.Monster;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.MoneyInfo;
   import com.tgame.common.vo.item.GirlSkill;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.MountSkill;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.FightManager;
   import com.tgame.manager.HighEffectManager;
   import com.tgame.manager.KeyboardManager;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.shell.view.components.ReLivePanel;
   import com.zcp.common.handler.HandlerThread;
   import com.zcp.common.utils.ZMath;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.avatar.AvatarPart;
   import com.zcp.engine.graphics.tagger.AttackFace;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.utils.Transformer;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.engine.vo.avatar.AvatarPlayCondition;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveCallBack;
   import com.zcp.manager.CDFaceManager;
   import com.zcp.manager.RslLoaderManager;
   import com.zcp.manager.TimerManager;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Fight_proxy extends Proxy
   {
      
      public static var temp_skillID:int;
      
      public static var temp_skillDistance:int;
      
      public static const NAME:String = "Fight_proxy";
      
      public static var mainChar_skillID:int = OtherConst.DEFAULT_SKILL_ID;
      
      public static var mainChar_skillDistance:int = OtherConst.DEFAULT_SKILL_DISTANCE;
      
      private var _senderProxy:Fight_MsgSenderProxy;
      
      private var _lianzhanProxy:Fight_LianZhanProxy;
      
      private var _fightFHT:FightHeadThread = new FightHeadThread();
      
      public var thread:HandlerThread = new HandlerThread();
      
      private var autoKnowTimer:Timer;
      
      public function Fight_proxy(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      public function get fightFHT() : FightHeadThread
      {
         return this._fightFHT;
      }
      
      public function get senderProxy() : Fight_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Fight_MsgSenderProxy.NAME) as Fight_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      public function get lianzhanProxy() : Fight_LianZhanProxy
      {
         if(this._lianzhanProxy == null)
         {
            this._lianzhanProxy = facade.retrieveProxy(Fight_LianZhanProxy.NAME) as Fight_LianZhanProxy;
         }
         return this._lianzhanProxy;
      }
      
      override public function onRegister() : void
      {
      }
      
      public function attackChar(param1:SceneCharacter, param2:int, param3:int, param4:Boolean = true) : void
      {
         var skill:Skill = null;
         var catchTarget:Function = null;
         var send_attack:Function = null;
         var targetPoint:Point = null;
         var callBack:MoveCallBack = null;
         var $targetSc:SceneCharacter = param1;
         var $skillID:int = param2;
         var $skillDistance:int = param3;
         var $catch:Boolean = param4;
         catchTarget = function(param1:SceneCharacter, param2:MapTile):void
         {
            if(!$targetSc.usable)
            {
               return;
            }
            if(targetPoint.x != $targetSc.tile_x || targetPoint.y != $targetSc.tile_y)
            {
               attackChar($targetSc,$skillID,$skillDistance,$catch);
            }
         };
         send_attack = function(param1:SceneCharacter = null, param2:MapTile = null):void
         {
            if(!$targetSc.usable)
            {
               return;
            }
            if(($targetSc.type == SceneCharacterType.PLAYER || $targetSc.type == SceneCharacterType.FENSHEN) && GameInstance.mainCharData.attributeInfo.pkMode != OtherConst.pkModeArr[0])
            {
               attack(skill,$targetSc.type,$targetSc.id);
               return;
            }
            if($targetSc.type != SceneCharacterType.PLAYER && $targetSc.type != SceneCharacterType.FENSHEN || (KeyboardManager.shift_down || KeyboardManager.ctrl_down) || KeyboardManager.tiaoyue_down)
            {
               attack(skill,$targetSc.type,$targetSc.id);
            }
         };
         if($targetSc == null)
         {
            return;
         }
         skill = GameInstance.mainCharData.skillInfo.getSkillByID($skillID);
         if(!skill)
         {
            return;
         }
         if(Point.distance(new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y),new Point($targetSc.piexl_x,$targetSc.piexl_y)) <= $skillDistance)
         {
            send_attack();
         }
         else if($catch && !GameInstance.mainCharData.isStop && !GameInstance.mainCharData.isWeiZhenShanHe && !GameInstance.mainCharData.isShuFuJuZhen && !GameInstance.mainCharData.isBuNengXuanRen)
         {
            targetPoint = new Point($targetSc.tile_x,$targetSc.tile_y);
            callBack = new MoveCallBack();
            callBack.onMoveThrough = catchTarget;
            callBack.onMoveArrived = send_attack;
            MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + $targetSc.tile_x + "," + $targetSc.tile_y + "," + $skillDistance,false,callBack,true,true,false);
         }
      }
      
      private function attack(param1:Skill, param2:int, param3:int) : void
      {
         if(CDFaceManager.isCooling(param1.getID()))
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该技能处于冷却时间内"),false);
            return;
         }
         if(!GameInstance.mainChar.isJumping())
         {
            GameInstance.mainChar.stopMove(true);
         }
         this.senderProxy.send_10083([param1.id,param2,param3]);
      }
      
      public function receivedCharAttackChars(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int = -1, param7:int = -1, param8:int = 0, param9:int = 0, param10:int = 0, param11:Boolean = false) : void
      {
         var len:int;
         var targetChars:Array;
         var skill:Skill = null;
         var skillRes:SkillRes = null;
         var i:int = 0;
         var fromApd:AvatarParamData = null;
         var toApd:AvatarParamData = null;
         var passApd:AvatarParamData = null;
         var soundDis:Number = NaN;
         var soundClassName:String = null;
         var mountSkill:MountSkill = null;
         var girlSkill:GirlSkill = null;
         var targetType:int = 0;
         var targetID:int = 0;
         var targetChar:SceneCharacter = null;
         var xueQiuSkillRes:SkillRes = null;
         var wulongSkillRes:SkillRes = null;
         var data:Object = null;
         var lianhuaApd:AvatarParamData = null;
         var selfSkillID:int = param1;
         var selfSkillLevel:int = param2;
         var selfType:int = param3;
         var selfID:int = param4;
         var targets:Array = param5;
         var x:int = param6;
         var y:int = param7;
         var anqiAttack:int = param8;
         var feilongtanyueshou:int = param9;
         var useTeXiao:int = param10;
         var isCD:Boolean = param11;
         var selfChar:SceneCharacter = GameInstance.scene.getCharByID(selfID,selfType);
         if(!selfChar)
         {
            return;
         }
         if(!selfChar.isJumping())
         {
            selfChar.stopMove(true);
         }
         if(selfChar == GameInstance.mainChar)
         {
            skill = new Skill(selfSkillID);
            if(skill != null)
            {
               if(isCD)
               {
                  CDFaceManager.cdPlay(skill.getID(),skill.getCoolingtime(),0,skill.getPublicCoolingtime(),0,[skill.getPublicCoolingtimeClass()]);
               }
            }
         }
         else if(selfType == SceneCharacterType.MOUNT)
         {
            if(selfID == GameInstance.mainCharData.mountInfo.currentFightMountID)
            {
               if(GameInstance.mainCharData.mountInfo.currentFightMount != null)
               {
                  mountSkill = new Skill(selfSkillID) as MountSkill;
               }
               if(mountSkill != null)
               {
                  if(isCD)
                  {
                     CDFaceManager.cdPlay(mountSkill.getID(),mountSkill.getCoolingtime(),0,mountSkill.getPublicCoolingtime(),0,[mountSkill.getPublicCoolingtimeClass()]);
                  }
               }
            }
            skillRes = SkillResManager.getSkillRes(selfSkillID);
            if(skillRes.is_zuhe == 1)
            {
               this._fightFHT.push(selfChar,AttackFace.ZUHEJI,0,false,false,LanResManager.getLanTextWords(this,"合击"));
            }
         }
         else if(selfType == SceneCharacterType.GIRL)
         {
            if(GameInstance.mainCharData.girlInfo.currentFightGirl != null)
            {
               if(selfID == GameInstance.mainCharData.girlInfo.currentFightGirl.id)
               {
                  if(GameInstance.mainCharData.girlInfo.currentFightGirl != null)
                  {
                     girlSkill = new Skill(selfSkillID) as GirlSkill;
                  }
                  if(girlSkill != null)
                  {
                     if(isCD)
                     {
                        CDFaceManager.cdPlay(girlSkill.getID(),girlSkill.getCoolingtime(),0,girlSkill.getPublicCoolingtime(),0,[girlSkill.getPublicCoolingtimeClass()]);
                     }
                  }
               }
            }
         }
         if(selfChar == GameInstance.mainChar)
         {
            NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide14);
         }
         len = int(targets.length);
         targetChars = [];
         i = 0;
         while(i < len)
         {
            targetType = int(targets[i][0]);
            targetID = int(targets[i][1]);
            targetChar = GameInstance.scene.getCharByID(targetID,targetType);
            if(targetChar)
            {
               targetChars[targetChars.length] = targetChar;
            }
            i++;
         }
         skillRes = SkillResManager.getSkillRes(selfSkillID);
         if(skillRes)
         {
            if(useTeXiao == 1)
            {
               xueQiuSkillRes = SkillResManager.getSkillRes(OtherConst.XUEQIU_SKILL_ID);
               if(skillRes.id_e0 != 0)
               {
                  fromApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,xueQiuSkillRes.id_e0),AvatarPartType.MAGIC);
               }
               if(skillRes.id_e2 != 0)
               {
                  toApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,xueQiuSkillRes.id_e2),AvatarPartType.MAGIC);
               }
               if(skillRes.id_e1 != 0)
               {
                  passApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,xueQiuSkillRes.id_e1),AvatarPartType.MAGIC_PASS);
               }
            }
            else if(useTeXiao == 2)
            {
               wulongSkillRes = SkillResManager.getSkillRes(OtherConst.HUANHUAWULONG_SKILL_ID);
               if(skillRes.id_e0 != 0)
               {
                  fromApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,wulongSkillRes.id_e0),AvatarPartType.MAGIC);
               }
               if(skillRes.id_e2 != 0)
               {
                  toApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,wulongSkillRes.id_e2),AvatarPartType.MAGIC);
               }
               if(skillRes.id_e1 != 0)
               {
                  passApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,wulongSkillRes.id_e1),AvatarPartType.MAGIC_PASS);
               }
            }
            else
            {
               if(skillRes.id_e0 != 0)
               {
                  fromApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e0),AvatarPartType.MAGIC);
               }
               if(skillRes.id_e2 != 0)
               {
                  toApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e2),AvatarPartType.MAGIC);
               }
               if(skillRes.id_e1 != 0)
               {
                  passApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e1),AvatarPartType.MAGIC_PASS);
               }
            }
         }
         if(selfSkillID == OtherConst.SKILL_ID_MOZHUXUEDAO)
         {
            this._fightFHT.push(selfChar,AttackFace.LOOK_ME_BOW,0,false,true,skillRes.name,0,StaticValue.PURPLE);
         }
         if(anqiAttack)
         {
            this._fightFHT.push(selfChar,AttackFace.LOOK_ME_ANQI,0,false,true,LanResManager.getLanTextWords(this,"看我暗器"));
         }
         if(feilongtanyueshou == 91001)
         {
            this._fightFHT.push(selfChar,AttackFace.LOOK_ME_TANYUNSHOU,0,false,true,LanResManager.getLanCommonTextWords("飞龙探云手！"));
         }
         else if(feilongtanyueshou == 95001)
         {
            this._fightFHT.push(selfChar,AttackFace.LOOK_ME_TANYUNSHOU,0,false,true,LanResManager.getLanCommonTextWords("五形拳！"));
         }
         else if(feilongtanyueshou == 200163)
         {
            this._fightFHT.push(selfChar,AttackFace.LOOK_ME_YUXIAOJIANFA,0,false,true,LanResManager.getLanCommonTextWords("箫剑合一"));
         }
         soundDis = 0;
         if(selfChar != null)
         {
            soundDis = Point.distance(new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y),new Point(selfChar.piexl_x,selfChar.piexl_y));
         }
         if(selfChar.type != SceneCharacterType.PLAYER)
         {
            data = selfChar.data;
            if(data.res.id_sound_char_attack != 0)
            {
               TSoundManager.playShortSound_useDis(data.res.id_sound_char_attack,soundDis);
            }
         }
         if(skillRes.id_sound_skill != 0)
         {
            if(fromApd == null)
            {
               fromApd = new AvatarParamData();
            }
            fromApd.extendCallBack(null,function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               TSoundManager.playShortSound_useDis(skillRes.id_sound_skill,soundDis);
            });
         }
         if(x == -1 && y == -1)
         {
            if(selfSkillID == OtherConst.SKILL_ID_PUDUCIHANG)
            {
               if(fromApd != null)
               {
                  fromApd.sourcePath = "";
               }
               selfChar.showMagic_from1passNtoN(targetChars,fromApd,toApd,passApd);
               if(Boolean(skillRes) && skillRes.id_e0 != 0)
               {
                  lianhuaApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e0),AvatarPartType.MAGIC);
               }
               selfChar.showMagic_from1pass0toCircleArea_byQueue(new Point(selfChar.piexl_x,selfChar.piexl_y),5 * 25,8,5 * 25,true,null,lianhuaApd,null,50);
            }
            else if(selfSkillID == OtherConst.SKILL_ID_RULAISHENZHANG)
            {
               if(toApd != null)
               {
                  toApd.sourcePath = "";
               }
               selfChar.showMagic_from1passNtoN(targetChars,fromApd,toApd,passApd);
            }
            else
            {
               if(selfChar.data.hasOwnProperty("res") && selfChar.type == SceneCharacterType.MONSTER)
               {
                  if((selfChar.data as Monster).res.type == MonsterType.JIANTA)
                  {
                     passApd ||= new AvatarParamData();
                     passApd.offsetDandaoStartX = -19;
                     passApd.offsetDandaoStartY = -111;
                  }
               }
               if(Boolean(fromApd) || Boolean(toApd) || Boolean(passApd))
               {
                  selfChar.showMagic_from1passNtoN(targetChars,fromApd,toApd,passApd);
               }
            }
         }
         else
         {
            selfChar.showMagic_from1pass1toPointArea(new Point(x * 25,y * 25),fromApd,toApd,passApd);
         }
      }
      
      public function received_bowAttack_lianzhujian(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var selfChar:SceneCharacter = null;
         var fromApd:AvatarParamData = null;
         var toApd:AvatarParamData = null;
         var passApd:AvatarParamData = null;
         var skillRes:SkillRes = null;
         var soundDis:Number = NaN;
         var soundClassName:String = null;
         var bowApd:AvatarParamData = null;
         var playComplete:Function = null;
         var hasPlay:Boolean = false;
         var playUpdate:Function = null;
         var bowAttackID:int = param1;
         var selfSkillID:int = param2;
         var selfID:int = param3;
         var x:int = param4;
         var y:int = param5;
         var angle:int = param6;
         var arrowCount:int = param7;
         playComplete = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
         {
            if(!selfChar.usable)
            {
               return;
            }
            selfChar.showAvatarPartsByType(AvatarPartType.BOW);
         };
         playUpdate = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
         {
            if(!selfChar.usable)
            {
               return;
            }
            if(hasPlay)
            {
               return;
            }
            hasPlay = true;
            fromApd = fromApd || new AvatarParamData();
            fromApd.offsetX = -19;
            fromApd.offsetY = -111;
            fromApd.offsetOnMountX = bowApd.offsetOnMountX;
            fromApd.offsetOnMountY = bowApd.offsetOnMountY;
            toApd = toApd || new AvatarParamData();
            passApd = passApd || new AvatarParamData();
            passApd.offsetDandaoStartX = fromApd.offsetX + fromApd.offsetOnMountX;
            passApd.offsetDandaoStartY = fromApd.offsetY + fromApd.offsetOnMountY;
            selfChar.showMagic_from1passNtoSectorEdge(new Point(x * 25,y * 25),angle,arrowCount,fromApd,toApd,passApd);
         };
         selfChar = GameInstance.scene.getCharByID(selfID);
         if(!selfChar)
         {
            return;
         }
         if(!selfChar.isJumping())
         {
            selfChar.stopMove(true);
         }
         skillRes = SkillResManager.getSkillRes(selfSkillID);
         if(skillRes)
         {
            if(skillRes.id_e0 != 0)
            {
               fromApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e0),AvatarPartType.MAGIC);
            }
            if(skillRes.id_e2 != 0)
            {
               toApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e2),AvatarPartType.MAGIC);
            }
            if(skillRes.id_e1 != 0)
            {
               passApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e1),AvatarPartType.MAGIC_PASS);
            }
         }
         this._fightFHT.push(selfChar,AttackFace.LOOK_ME_BOW,0,false,true,skillRes.name,0,StaticValue.PURPLE);
         soundDis = 0;
         if(selfChar != null)
         {
            soundDis = Point.distance(new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y),new Point(selfChar.piexl_x,selfChar.piexl_y));
         }
         if(skillRes.id_sound_skill != 0)
         {
            if(fromApd == null)
            {
               fromApd = new AvatarParamData();
            }
            fromApd.extendCallBack(null,function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               TSoundManager.playShortSound_useDis(skillRes.id_sound_skill,soundDis);
            });
         }
         selfChar.hideAvatarPartsByType(AvatarPartType.BOW);
         bowApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,bowAttackID),AvatarPartType.MAGIC);
         bowApd.offsetOnMountY = OtherConst.RING_ONMOUNT_OFFSET_Y;
         bowApd.extendCallBack(null,null,playUpdate,playComplete);
         selfChar.loadAvatarPart(bowApd);
         hasPlay = false;
      }
      
      public function received_bowAttack_chuanzijian(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var selfChar:SceneCharacter = null;
         var fromApd:AvatarParamData = null;
         var toApd:AvatarParamData = null;
         var passApd:AvatarParamData = null;
         var skillRes:SkillRes = null;
         var soundDis:Number = NaN;
         var soundClassName:String = null;
         var bowApd:AvatarParamData = null;
         var playComplete:Function = null;
         var hasPlay:Boolean = false;
         var playUpdate:Function = null;
         var bowAttackID:int = param1;
         var selfSkillID:int = param2;
         var selfID:int = param3;
         var x:int = param4;
         var y:int = param5;
         playComplete = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
         {
            if(!selfChar.usable)
            {
               return;
            }
            selfChar.showAvatarPartsByType(AvatarPartType.BOW);
         };
         playUpdate = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
         {
            if(!selfChar.usable)
            {
               return;
            }
            if(hasPlay)
            {
               return;
            }
            hasPlay = true;
            fromApd = fromApd || new AvatarParamData();
            fromApd.offsetX = -19;
            fromApd.offsetY = -111;
            fromApd.offsetOnMountX = bowApd.offsetOnMountX;
            fromApd.offsetOnMountY = bowApd.offsetOnMountY;
            toApd = toApd || new AvatarParamData();
            passApd = passApd || new AvatarParamData();
            passApd.offsetDandaoStartX = fromApd.offsetX + fromApd.offsetOnMountX;
            passApd.offsetDandaoStartY = fromApd.offsetY + fromApd.offsetOnMountY;
            selfChar.showMagic_from1pass1toPointArea(new Point(x * 25,y * 25),fromApd,toApd,passApd);
         };
         selfChar = GameInstance.scene.getCharByID(selfID);
         if(!selfChar)
         {
            return;
         }
         if(!selfChar.isJumping())
         {
            selfChar.stopMove(true);
         }
         skillRes = SkillResManager.getSkillRes(selfSkillID);
         if(skillRes)
         {
            if(skillRes.id_e0 != 0)
            {
               fromApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e0),AvatarPartType.MAGIC);
            }
            if(skillRes.id_e2 != 0)
            {
               toApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e2),AvatarPartType.MAGIC);
            }
            if(skillRes.id_e1 != 0)
            {
               passApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e1),AvatarPartType.MAGIC_PASS);
            }
         }
         this._fightFHT.push(selfChar,AttackFace.LOOK_ME_BOW,0,false,true,skillRes.name,0,StaticValue.PURPLE);
         soundDis = 0;
         if(selfChar != null)
         {
            soundDis = Point.distance(new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y),new Point(selfChar.piexl_x,selfChar.piexl_y));
         }
         if(skillRes.id_sound_skill != 0)
         {
            if(fromApd == null)
            {
               fromApd = new AvatarParamData();
            }
            fromApd.extendCallBack(null,function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               TSoundManager.playShortSound_useDis(skillRes.id_sound_skill,soundDis);
            });
         }
         selfChar.hideAvatarPartsByType(AvatarPartType.BOW);
         bowApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,bowAttackID),AvatarPartType.MAGIC);
         bowApd.offsetOnMountY = OtherConst.RING_ONMOUNT_OFFSET_Y;
         bowApd.extendCallBack(null,null,playUpdate,playComplete);
         selfChar.loadAvatarPart(bowApd);
         hasPlay = false;
      }
      
      public function received_bowAttack_others(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var selfChar:SceneCharacter = null;
         var targetChar:SceneCharacter = null;
         var fromApd:AvatarParamData = null;
         var toApd:AvatarParamData = null;
         var passApd:AvatarParamData = null;
         var skillRes:SkillRes = null;
         var soundDis:Number = NaN;
         var soundClassName:String = null;
         var bowApd:AvatarParamData = null;
         var playComplete:Function = null;
         var hasPlay:Boolean = false;
         var playUpdate:Function = null;
         var bowAttackID:int = param1;
         var selfSkillID:int = param2;
         var selfID:int = param3;
         var targetType:int = param4;
         var targetID:int = param5;
         playComplete = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
         {
            if(!selfChar.usable)
            {
               return;
            }
            selfChar.showAvatarPartsByType(AvatarPartType.BOW);
         };
         playUpdate = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
         {
            if(!selfChar.usable)
            {
               return;
            }
            if(!targetChar.usable)
            {
               return;
            }
            if(hasPlay)
            {
               return;
            }
            hasPlay = true;
            fromApd = fromApd || new AvatarParamData();
            fromApd.offsetX = -19;
            fromApd.offsetY = -111;
            fromApd.offsetOnMountX = bowApd.offsetOnMountX;
            fromApd.offsetOnMountY = bowApd.offsetOnMountY;
            toApd = toApd || new AvatarParamData();
            passApd = passApd || new AvatarParamData();
            passApd.offsetDandaoStartX = fromApd.offsetX + fromApd.offsetOnMountX;
            passApd.offsetDandaoStartY = fromApd.offsetY + fromApd.offsetOnMountY;
            selfChar.showMagic_from1passNtoN([targetChar],fromApd,toApd,passApd);
         };
         selfChar = GameInstance.scene.getCharByID(selfID);
         if(!selfChar)
         {
            return;
         }
         targetChar = GameInstance.scene.getCharByID(targetID,targetType);
         if(!targetChar)
         {
            return;
         }
         if(!selfChar.isJumping())
         {
            selfChar.stopMove(true);
         }
         skillRes = SkillResManager.getSkillRes(selfSkillID);
         if(skillRes)
         {
            if(skillRes.id_e0 != 0)
            {
               fromApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e0),AvatarPartType.MAGIC);
            }
            if(skillRes.id_e2 != 0)
            {
               toApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e2),AvatarPartType.MAGIC);
            }
            if(skillRes.id_e1 != 0)
            {
               passApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e1),AvatarPartType.MAGIC_PASS);
            }
         }
         this._fightFHT.push(selfChar,AttackFace.LOOK_ME_BOW,0,false,true,skillRes.name,0,StaticValue.PURPLE);
         soundDis = 0;
         if(selfChar != null)
         {
            soundDis = Point.distance(new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y),new Point(selfChar.piexl_x,selfChar.piexl_y));
         }
         if(skillRes.id_sound_skill != 0)
         {
            if(fromApd == null)
            {
               fromApd = new AvatarParamData();
            }
            fromApd.extendCallBack(null,function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               TSoundManager.playShortSound_useDis(skillRes.id_sound_skill,soundDis);
            });
         }
         selfChar.hideAvatarPartsByType(AvatarPartType.BOW);
         bowApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,bowAttackID),AvatarPartType.MAGIC);
         bowApd.offsetOnMountY = OtherConst.RING_ONMOUNT_OFFSET_Y;
         bowApd.extendCallBack(null,null,playUpdate,playComplete);
         selfChar.loadAvatarPart(bowApd);
         hasPlay = false;
      }
      
      public function received_dantian_FROM(param1:int, param2:int) : void
      {
         var qixuanAP1:AvatarPart;
         var qixuanAP2:AvatarPart;
         var skill:Skill = null;
         var fromApd:AvatarParamData = null;
         var skillRes:SkillRes = null;
         var soundDis:Number = NaN;
         var soundClassName:String = null;
         var qixuan1P:Point = null;
         var qixuan2P:Point = null;
         var p:Point = null;
         var selfSkillID:int = param1;
         var selfID:int = param2;
         var selfChar:SceneCharacter = GameInstance.scene.getCharByID(selfID);
         if(!selfChar)
         {
            return;
         }
         if(!selfChar.isJumping())
         {
            selfChar.stopMove(true);
         }
         if(selfChar == GameInstance.mainChar)
         {
            skill = GameInstance.mainCharData.skillInfo.getSkillByID(selfSkillID);
            if(skill != null)
            {
               CDFaceManager.cdPlay(skill.getID(),skill.getCoolingtime(),0,skill.getPublicCoolingtime(),0,[skill.getPublicCoolingtimeClass()]);
            }
         }
         skillRes = SkillResManager.getSkillRes(selfSkillID);
         if(skillRes)
         {
            if(skillRes.id_e0 != 0)
            {
               fromApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e0),AvatarPartType.MAGIC);
            }
         }
         this._fightFHT.push(selfChar,AttackFace.LOOK_ME_BOW,0,false,true,skillRes.name,0,StaticValue.PURPLE);
         soundDis = 0;
         if(selfChar != null)
         {
            soundDis = Point.distance(new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y),new Point(selfChar.piexl_x,selfChar.piexl_y));
         }
         if(skillRes.id_sound_skill != 0)
         {
            if(fromApd == null)
            {
               fromApd = new AvatarParamData();
            }
            fromApd.extendCallBack(null,function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               TSoundManager.playShortSound_useDis(skillRes.id_sound_skill,soundDis);
            });
         }
         qixuanAP1 = selfChar.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_1);
         qixuanAP2 = selfChar.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_2);
         if(qixuanAP1 != null)
         {
            qixuan1P = new Point((qixuanAP1.cutRect.x + qixuanAP1.cutRect.right) / 2,(qixuanAP1.cutRect.y + qixuanAP1.cutRect.bottom) / 2);
         }
         if(qixuanAP2 != null)
         {
            qixuan2P = new Point((qixuanAP2.cutRect.x + qixuanAP2.cutRect.right) / 2,(qixuanAP2.cutRect.y + qixuanAP2.cutRect.bottom) / 2);
         }
         if(qixuan1P != null && qixuan2P != null)
         {
            p = new Point((qixuan1P.x + qixuan2P.x) / 2,(qixuan1P.y + qixuan2P.y) / 2);
         }
         else if(qixuan1P != null)
         {
            p = qixuan1P;
         }
         else
         {
            if(qixuan2P == null)
            {
               return;
            }
            p = qixuan2P;
         }
         fromApd ||= new AvatarParamData();
         fromApd.offsetX = p.x - selfChar.piexl_x;
         fromApd.offsetY = p.y - selfChar.piexl_y;
         selfChar.loadAvatarPart(fromApd);
      }
      
      public function received_dantian_FROM_PASS_TO(param1:int, param2:int, param3:Array) : void
      {
         var len:int;
         var targetChars:Array;
         var qixuanAP1:AvatarPart;
         var qixuanAP2:AvatarPart;
         var skill:Skill = null;
         var i:int = 0;
         var fromApd:AvatarParamData = null;
         var toApd:AvatarParamData = null;
         var passApd:AvatarParamData = null;
         var skillRes:SkillRes = null;
         var soundDis:Number = NaN;
         var soundClassName:String = null;
         var qixuan1P:Point = null;
         var qixuan2P:Point = null;
         var p:Point = null;
         var targetType:int = 0;
         var targetID:int = 0;
         var targetChar:SceneCharacter = null;
         var data:Object = null;
         var selfSkillID:int = param1;
         var selfID:int = param2;
         var targets:Array = param3;
         var selfChar:SceneCharacter = GameInstance.scene.getCharByID(selfID);
         if(!selfChar)
         {
            return;
         }
         if(!selfChar.isJumping())
         {
            selfChar.stopMove(true);
         }
         if(selfChar == GameInstance.mainChar)
         {
            skill = GameInstance.mainCharData.skillInfo.getSkillByID(selfSkillID);
            if(skill != null)
            {
               CDFaceManager.cdPlay(skill.getID(),skill.getCoolingtime(),0,skill.getPublicCoolingtime(),0,[skill.getPublicCoolingtimeClass()]);
            }
         }
         len = int(targets.length);
         targetChars = [];
         i = 0;
         while(i < len)
         {
            targetType = int(targets[i][0]);
            targetID = int(targets[i][1]);
            targetChar = GameInstance.scene.getCharByID(targetID,targetType);
            if(targetChar)
            {
               targetChars[targetChars.length] = targetChar;
            }
            i++;
         }
         skillRes = SkillResManager.getSkillRes(selfSkillID);
         if(skillRes)
         {
            if(skillRes.id_e0 != 0)
            {
               fromApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e0),AvatarPartType.MAGIC);
            }
            if(skillRes.id_e2 != 0)
            {
               toApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e2),AvatarPartType.MAGIC);
            }
            if(skillRes.id_e1 != 0)
            {
               passApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,skillRes.id_e1),AvatarPartType.MAGIC_PASS);
            }
         }
         this._fightFHT.push(selfChar,AttackFace.LOOK_ME_BOW,0,false,true,skillRes.name,0,StaticValue.PURPLE);
         soundDis = 0;
         if(selfChar != null)
         {
            soundDis = Point.distance(new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y),new Point(selfChar.piexl_x,selfChar.piexl_y));
         }
         if(selfChar.type != SceneCharacterType.PLAYER)
         {
            data = selfChar.data;
            if(data.res.id_sound_char_attack != 0)
            {
               TSoundManager.playShortSound_useDis(data.res.id_sound_char_attack,soundDis);
            }
         }
         if(skillRes.id_sound_skill != 0)
         {
            if(fromApd == null)
            {
               fromApd = new AvatarParamData();
            }
            fromApd.extendCallBack(null,function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               TSoundManager.playShortSound_useDis(skillRes.id_sound_skill,soundDis);
            });
         }
         qixuanAP1 = selfChar.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_1);
         qixuanAP2 = selfChar.getAvatarPartByID(SpeciaAvatarPartID.QIXUAN_2);
         if(qixuanAP1 != null)
         {
            qixuan1P = new Point((qixuanAP1.cutRect.x + qixuanAP1.cutRect.right) / 2,(qixuanAP1.cutRect.y + qixuanAP1.cutRect.bottom) / 2);
         }
         if(qixuanAP2 != null)
         {
            qixuan2P = new Point((qixuanAP2.cutRect.x + qixuanAP2.cutRect.right) / 2,(qixuanAP2.cutRect.y + qixuanAP2.cutRect.bottom) / 2);
         }
         if(qixuan1P != null && qixuan2P != null)
         {
            p = new Point((qixuan1P.x + qixuan2P.x) / 2,(qixuan1P.y + qixuan2P.y) / 2);
         }
         else if(qixuan1P != null)
         {
            p = qixuan1P;
         }
         else
         {
            if(qixuan2P == null)
            {
               return;
            }
            p = qixuan2P;
         }
         if(fromApd != null)
         {
            fromApd.offsetX = p.x - selfChar.piexl_x;
            fromApd.offsetY = p.y - selfChar.piexl_y;
         }
         if(passApd != null)
         {
            passApd.offsetDandaoStartX = p.x - selfChar.piexl_x;
            passApd.offsetDandaoStartY = p.y - selfChar.piexl_y;
         }
         selfChar.showMagic_from1passNtoN(targetChars,fromApd,toApd,passApd);
      }
      
      public function received_jiguanguai_gongji(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc6_:Skill = null;
         var _loc7_:AvatarParamData = null;
         var _loc8_:AvatarParamData = null;
         var _loc9_:AvatarParamData = null;
         var _loc5_:SceneCharacter = GameInstance.scene.getCharByID(param3,param2);
         if(!_loc5_)
         {
            return;
         }
         _loc6_ = GameInstance.mainCharData.skillInfo.getSkillByID(param1);
         var _loc10_:SkillRes = SkillResManager.getSkillRes(param1);
         if(_loc10_)
         {
            if(_loc10_.id_e0 != 0)
            {
               _loc7_ = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,_loc10_.id_e0),AvatarPartType.MAGIC);
               _loc7_.useMagicAngle = true;
            }
            if(_loc10_.id_e2 != 0)
            {
               _loc8_ = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,_loc10_.id_e2),AvatarPartType.MAGIC);
            }
            if(_loc10_.id_e1 != 0)
            {
               _loc9_ = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,_loc10_.id_e1),AvatarPartType.MAGIC_PASS);
            }
         }
         _loc5_.setLogicAngle(param4);
         _loc5_.showMagic_from1passNtoN([],_loc7_,_loc8_,_loc9_);
      }
      
      public function received_self_skill(param1:int, param2:int, param3:int) : void
      {
         var _loc5_:AvatarParamData = null;
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(param2,param1);
         if(!_loc4_)
         {
            return;
         }
         var _loc6_:SkillRes = SkillResManager.getSkillRes(param3);
         if(_loc6_)
         {
            if(_loc6_.id_e0 != 0)
            {
               _loc5_ = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,_loc6_.id_e0),AvatarPartType.MAGIC);
               _loc4_.loadAvatarPart(_loc5_);
            }
         }
      }
      
      public function receivedRideMountZuheji(param1:int, param2:int) : void
      {
         var _loc4_:SkillRes = null;
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(param2);
         if(!_loc3_)
         {
            return;
         }
         _loc4_ = SkillResManager.getSkillRes(param1);
         if(_loc4_.is_zuhe == 1)
         {
            this._fightFHT.push(_loc3_,AttackFace.ZUHEJI,0,false,false,LanResManager.getLanTextWords(this,"合击"));
         }
      }
      
      public function receivedAttackFailure(param1:int) : void
      {
         if(param1 == 0)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"目标不存在"),false);
         }
         else if(param1 == 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"攻击无效"),false);
         }
         else if(param1 == 2)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"技能冷却中"),false);
         }
         else if(param1 == 3)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"内力值不足"),false);
         }
         else if(param1 == 5)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"生命值不足"),false);
         }
         else if(param1 == 6)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"体力值不足"),false);
         }
         else if(param1 == 7)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"公共冷却中"),false);
         }
      }
      
      public function receivedSkillShowEffectHP(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:Number, param8:Number, param9:int, param10:int, param11:int, param12:int = 0, param13:int = 0) : void
      {
         var _loc17_:Object = null;
         var _loc18_:SkillRes = null;
         var _loc19_:AvatarParamData = null;
         var _loc20_:BitmapData = null;
         var _loc21_:Number = NaN;
         var _loc22_:SceneCharacter = null;
         var _loc23_:String = null;
         var _loc24_:Player = null;
         var _loc25_:AvatarParamData = null;
         var _loc14_:SceneCharacter = GameInstance.scene.getCharByID(param5,param4);
         if(!_loc14_)
         {
            return;
         }
         if(param1 != 0)
         {
            _loc18_ = SkillResManager.getSkillRes(param1);
            if(_loc18_ != null && _loc18_.id_e2 != 0)
            {
               _loc19_ = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,_loc18_.id_e2),AvatarPartType.MAGIC);
               _loc14_.loadAvatarPart(_loc19_);
            }
         }
         if(param6 == 1)
         {
            if(param4 == SceneCharacterType.PLAYER && param5 == GameInstance.mainChar.id)
            {
               this._fightFHT.push(_loc14_,AttackFace.ATTACK_MISS,0,false,true,LanResManager.getLanTextWords(this,"躲闪"));
            }
            else if(param2 == SceneCharacterType.MOUNT || param2 == SceneCharacterType.NPC_FRIEND || param2 == SceneCharacterType.GIRL)
            {
               this._fightFHT.push(_loc14_,AttackFace.ATTACK_LOSE,0,false,true,LanResManager.getLanTextWords(this,"丢失"));
            }
            else
            {
               this._fightFHT.push(_loc14_,AttackFace.ATTACK_LOSE,0,false,true,LanResManager.getLanTextWords(this,"丢失"));
            }
            return;
         }
         if(param6 == 2)
         {
            this._fightFHT.push(_loc14_,AttackFace.ATTACK_JUMPMISS,0,false,true,LanResManager.getLanTextWords(this,"跳闪"));
            return;
         }
         if(param6 == 3)
         {
            this._fightFHT.push(_loc14_,AttackFace.ATTACK_ANQI_JUMPMISS,0,false,true,LanResManager.getLanTextWords(this,"暗器跳闪"));
            return;
         }
         if(param6 == 4)
         {
            this._fightFHT.push(_loc14_,AttackFace.ATTACK_MISS,0,false,true,LanResManager.getLanCommonTextWords("【金钟罩】生效"),0,StaticValue.GOLD);
         }
         var _loc15_:AttributeInfo = _loc14_.data.attributeInfo;
         var _loc16_:Number = param7 - _loc15_.hpNow;
         _loc15_.hpNow = isNaN(param7) ? _loc15_.hpNow : param7;
         _loc15_.hpMax = isNaN(param8) ? _loc15_.hpMax : param8;
         _loc15_.jinzhongzhaoCount = param10;
         _loc15_.jinzhongzhaoColor = param11;
         if(_loc15_.jinzhongzhaoColor == 1)
         {
            _loc20_ = RslLoaderManager.getInstance("ui.char.jinzhongzhao1");
         }
         else
         {
            _loc20_ = RslLoaderManager.getInstance("ui.char.jinzhongzhao");
         }
         if(_loc15_.jinzhongzhaoCount == 0)
         {
            _loc17_ = {
               "color":16711680,
               "bmdNum":_loc15_.jinzhongzhaoCount,
               "bmd":_loc20_
            };
         }
         else
         {
            _loc17_ = {
               "color":16776960,
               "bmdNum":_loc15_.jinzhongzhaoCount,
               "bmd":_loc20_
            };
         }
         _loc14_.setHeadFaceBar(_loc15_.hpNow,_loc15_.hpMax,_loc17_);
         if(_loc16_ == 0)
         {
            return;
         }
         if(_loc16_ > 0)
         {
            this._fightFHT.push(_loc14_,AttackFace.CHANGE_HP,Math.floor(_loc16_),false,true);
         }
         else
         {
            if(param2 == SceneCharacterType.PLAYER && param3 == GameInstance.mainChar.id)
            {
               if(param9 == 1)
               {
                  this._fightFHT.push(_loc14_,AttackFace.ATTACK_CRITICALHIT,Math.floor(_loc16_),true,true,LanResManager.getLanTextWords(this,"暴击"));
                  FightManager.screen_shake(0.2,30);
               }
               else
               {
                  if(param12)
                  {
                     this._fightFHT.push(_loc14_,AttackFace.CHANGE_HP_ANQI,Math.floor(_loc16_),true,true,LanResManager.getLanTextWords(this,"暗器"));
                  }
                  if(param13)
                  {
                     this._fightFHT.push(_loc14_,AttackFace.ATTACK_CRITICALHIT,Math.floor(_loc16_),true,true,LanResManager.getLanCommonTextWords("纯粹伤害"),0,StaticValue.PURPLE);
                  }
                  else
                  {
                     this._fightFHT.push(_loc14_,AttackFace.CHANGE_HP_OTHER,Math.floor(_loc16_),true,true);
                  }
               }
            }
            else if(param2 == SceneCharacterType.MOUNT || param2 == SceneCharacterType.NPC_FRIEND || param2 == SceneCharacterType.GIRL)
            {
               if(param9 == 1)
               {
                  this._fightFHT.push(_loc14_,AttackFace.ATTACK_CRITICALHIT_FROM_MOUNT,Math.floor(_loc16_),true,true,LanResManager.getLanTextWords(this,"暴击"));
               }
               if(param13)
               {
                  this._fightFHT.push(_loc14_,AttackFace.ATTACK_CRITICALHIT,Math.floor(_loc16_),true,true,LanResManager.getLanCommonTextWords("纯粹伤害"),0,StaticValue.PURPLE);
               }
               else
               {
                  this._fightFHT.push(_loc14_,AttackFace.CHANGE_HP_OTHER_FROM_MOUNT,Math.floor(_loc16_),true,true);
               }
            }
            else if(param4 == SceneCharacterType.PLAYER && param5 == GameInstance.mainChar.id)
            {
               if(param9 == 1)
               {
                  this._fightFHT.push(_loc14_,AttackFace.ATTACK_ZHIMING,Math.floor(_loc16_),true,true,LanResManager.getLanTextWords(this,"致命"));
               }
               if(param13)
               {
                  this._fightFHT.push(_loc14_,AttackFace.ATTACK_CRITICALHIT,Math.floor(_loc16_),true,true,LanResManager.getLanCommonTextWords("纯粹伤害"),0,StaticValue.PURPLE);
               }
               else
               {
                  this._fightFHT.push(_loc14_,AttackFace.CHANGE_HP,Math.floor(_loc16_),true,true);
               }
            }
            else
            {
               if(param9 == 1)
               {
                  this._fightFHT.push(_loc14_,AttackFace.ATTACK_CRITICALHIT,Math.floor(_loc16_),true,true,LanResManager.getLanTextWords(this,"暴击"));
               }
               if(param13)
               {
                  this._fightFHT.push(_loc14_,AttackFace.ATTACK_CRITICALHIT,Math.floor(_loc16_),true,true,LanResManager.getLanCommonTextWords("纯粹伤害"),0,StaticValue.PURPLE);
               }
               else
               {
                  this._fightFHT.push(_loc14_,AttackFace.CHANGE_HP_OTHER,Math.floor(_loc16_),true,true);
               }
            }
            _loc21_ = 0;
            if(_loc22_ != null)
            {
               _loc21_ = Point.distance(new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y),new Point(_loc22_.piexl_x,_loc22_.piexl_y));
            }
            if(param9 == 1 && param2 == SceneCharacterType.PLAYER)
            {
               _loc22_ = GameInstance.scene.getCharByID(param3);
               if(_loc22_ != null)
               {
                  _loc24_ = _loc22_.data as Player;
                  if(_loc24_.attributeInfo.getSex() == 1)
                  {
                     TSoundManager.playShortSound_useDis(ResPathManager.SOUND_MAINCHAR_ATTACK_STRONG_1,_loc21_);
                  }
                  else
                  {
                     TSoundManager.playShortSound_useDis(ResPathManager.SOUND_MAINCHAR_ATTACK_STRONG_0,_loc21_);
                  }
               }
            }
            if(param7 <= 0 && param4 == SceneCharacterType.MONSTER)
            {
               if((_loc14_.data as Monster).res.type == MonsterType.BOSS || (_loc14_.data as Monster).res.type == MonsterType.FB_BOSS || (_loc14_.data as Monster).res.type == MonsterType.CUSTOM_FB_BOSS)
               {
                  _loc25_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BOSS_DEATH_DELAY),AvatarPartType.MAGIC);
                  _loc14_.loadAvatarPart(_loc25_);
               }
               else if((_loc14_.data as Monster).res.type == MonsterType.AOJIANZHENGBA)
               {
                  _loc25_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BOSS_DEATH_LIUSHI_DELAY),AvatarPartType.MAGIC);
                  _loc14_.loadAvatarPart(_loc25_);
               }
               else if((_loc14_.data as Monster).res.type == MonsterType.CAISHEN_MONSTER)
               {
                  _loc25_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BOSS_DEATH_CAISHEN_DELAY),AvatarPartType.MAGIC);
                  _loc14_.loadAvatarPart(_loc25_);
               }
               else if((_loc14_.data as Monster).res.type == 29)
               {
                  _loc14_.removeAvatarPartByID(SpeciaAvatarPartID.XINMO_HEIYAN,false);
               }
            }
         }
         if(_loc14_ == GameInstance.mainChar)
         {
            PipeManager.sendMsg(PipeConstants.CHANGED_MAINCHAR_BASE_ATTR);
         }
         else if(_loc14_ == GameInstance.lockOnChar)
         {
            PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,GameInstance.lockOnChar);
         }
      }
      
      public function receivedCharAttackBack(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var targetChar:SceneCharacter = null;
         var char:SceneCharacter = null;
         var fun:Function = null;
         var $type:int = param1;
         var $roleID:int = param2;
         var $x:int = param3;
         var $y:int = param4;
         var skillType:int = param5;
         if($type == 1)
         {
            targetChar = GameInstance.scene.getCharByID($roleID,SceneCharacterType.PLAYER);
         }
         else if($type == 2)
         {
            targetChar = GameInstance.scene.getCharByID($roleID,SceneCharacterType.MONSTER);
         }
         if(!targetChar)
         {
            return;
         }
         char = GameInstance.scene.getCharByID($roleID,SceneCharacterType.PLAYER);
         if(skillType == 1)
         {
            fun = function(param1:TimerEvent):void
            {
               var _loc2_:SceneCharacter = null;
               if(char.tile_x == $x && char.tile_y == $y)
               {
                  autoKnowTimer.stop();
                  autoKnowTimer.removeEventListener(TimerEvent.TIMER,fun);
                  FightManager.screen_shake(0.5,80);
                  _loc2_ = GameInstance.scene.getCharByID($roleID,SceneCharacterType.PLAYER);
                  if(_loc2_)
                  {
                     _loc2_.playTo(CharStatusType.STAND);
                  }
               }
               else
               {
                  _loc2_ = GameInstance.scene.getCharByID($roleID,SceneCharacterType.PLAYER);
                  if(_loc2_)
                  {
                     HighEffectManager.addGhost(_loc2_.getNowAvatarFaceList(),true);
                  }
               }
            };
            FightManager.be_beatBack(char,new Point($x,$y),800);
            this.autoKnowTimer = new Timer(20,40);
            this.autoKnowTimer.reset();
            this.autoKnowTimer.start();
            this.autoKnowTimer.addEventListener(TimerEvent.TIMER,fun);
         }
         else
         {
            FightManager.be_beatBack(targetChar,new Point($x,$y),OtherConst.SKILL_HITBACK_SPEED);
         }
      }
      
      public function receivedCharDelayRelive(param1:int, param2:int, param3:int) : void
      {
         var targetChar:SceneCharacter = null;
         var timerHandler:Function = null;
         var roleID:int = param1;
         var roleType:int = param2;
         var delayReliveTime:int = param3;
         timerHandler = function(param1:Number):void
         {
            var _loc2_:int = Math.round(param1) + 1;
            targetChar.showAttackFace("",0,LanResManager.getLanTextWords(Fight_proxy,"复活倒计时") + _loc2_,AttackFace.DEFAULT_FOUNT_SIZE_14,AttackFace.DEFAULT_FOUNT_COLOR_GREEN);
         };
         targetChar = GameInstance.scene.getCharByID(roleID,roleType);
         if(targetChar == null)
         {
            return;
         }
         if(targetChar == GameInstance.mainChar)
         {
            POPWindowManager.closeWindow();
         }
         if(delayReliveTime < 0)
         {
            return;
         }
         TimerManager.createOneOffExactTimer(delayReliveTime,delayReliveTime,0,timerHandler,null,1);
      }
      
      public function receivedCharRelive(param1:int, param2:int) : void
      {
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(param1,param2);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.playTo(CharStatusType.STAND,-1,-1,new AvatarPlayCondition(false,false,false));
         if(_loc3_ == GameInstance.mainChar)
         {
            POPWindowManager.closeWindow();
         }
         var _loc4_:AvatarParamData = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_RELIVE),AvatarPartType.MAGIC);
         _loc3_.loadAvatarPart(_loc4_);
         AvatarManager.setHuangzhuangZhuangtai(_loc3_,false);
         AvatarManager.updateMainAvatar(_loc3_);
      }
      
      public function receivedCharDeath(param1:int, param2:int, param3:int = -1, param4:int = -1, param5:Boolean = false) : void
      {
         var soundDis:Number;
         var targetChar:SceneCharacter = null;
         var soundClassName:String = null;
         var mapId:int = 0;
         var go:Goods = null;
         var reLivePanel:ReLivePanel = null;
         var meigui:Goods = null;
         var meigui2:Goods = null;
         var meigui3:Goods = null;
         var meigui4:Goods = null;
         var meigui5:Goods = null;
         var meigui6:Goods = null;
         var isNewPlayer:Boolean = false;
         var apd:AvatarParamData = null;
         var killer:SceneCharacter = null;
         var killerP:Point = null;
         var beatBackPoint:Point = null;
         var r:int = 0;
         var h:int = 0;
         var player:Player = null;
         var data:Object = null;
         var roleID:int = param1;
         var roleType:int = param2;
         var killerType:int = param3;
         var killerID:int = param4;
         var isCikeKO:Boolean = param5;
         var playToDeath:Function = function():void
         {
            targetChar.playTo(CharStatusType.DEATH,Transformer.transAngle2LogicAngle(90),-1,new AvatarPlayCondition(false,true,false));
            AvatarManager.updateMainAvatar(targetChar);
         };
         targetChar = GameInstance.scene.getCharByID(roleID,roleType);
         if(targetChar == null)
         {
            return;
         }
         if(targetChar == GameInstance.mainChar)
         {
            MainCharSeachPathManager.clear();
            mapId = GameInstance.scene.mapConfig.mapID;
            if(ReloginManager.isInKuafu && mapId == 20242)
            {
               go = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.FUHUOSHENGSHUI,true);
               reLivePanel = ReLivePanel.showLeitaiPanel(go.count,go.getBigICOPath());
               reLivePanel.addEventListener(ReLivePanel.UI_RELIVEPANEL_LOCALE_RELIVE_BTN_CLICK,function(param1:* = null):void
               {
                  senderProxy.send_20075(0);
               });
               reLivePanel.addEventListener(ReLivePanel.UI_RELIVEPANEL_RETURN_RELIVE_BTN_CLICK,function(param1:* = null):void
               {
                  senderProxy.send_20075(1);
               });
            }
            else if(isCikeKO)
            {
               go = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.CISHAFUHUO,true);
               reLivePanel = ReLivePanel.showCishaPanel(go.count,go.getBigICOPath());
               reLivePanel.addEventListener(ReLivePanel.UI_RELIVEPANEL_LOCALE_RELIVE_BTN_CLICK,function(param1:* = null):void
               {
                  senderProxy.send_20075(0);
               });
               reLivePanel.addEventListener(ReLivePanel.UI_RELIVEPANEL_RETURN_RELIVE_BTN_CLICK,function(param1:* = null):void
               {
                  senderProxy.send_20075(1);
               });
            }
            else if(!(mapId == 20324 || mapId == 20197))
            {
               meigui = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.FLOWER_1,true);
               meigui2 = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.FLOWER_2,true);
               meigui3 = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.FLOWER_3,true);
               meigui4 = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.FLOWER_4,true);
               meigui5 = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.FLOWER_5,true);
               meigui6 = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.FLOWER_6,true);
               meigui.count += meigui2.count + meigui3.count + meigui4.count + meigui5.count + meigui6.count;
               isNewPlayer = GameInstance.mainCharData.attributeInfo.lv < 15;
               reLivePanel = ReLivePanel.showRelivePanel(meigui.count,meigui.getBigICOPath(),isNewPlayer);
               reLivePanel.addEventListener(ReLivePanel.UI_RELIVEPANEL_LOCALE_RELIVE_BTN_CLICK,function(param1:* = null):void
               {
                  senderProxy.send_20075(0);
               });
               reLivePanel.addEventListener(ReLivePanel.UI_RELIVEPANEL_RETURN_RELIVE_BTN_CLICK,function(param1:* = null):void
               {
                  senderProxy.send_20075(1);
               });
            }
         }
         if(roleType == SceneCharacterType.MONSTER && Monster(targetChar.data).res.type == MonsterType.BAOSHI)
         {
            apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BAOSHI_OPEN),AvatarPartType.MAGIC);
            targetChar.loadAvatarPart(apd);
         }
         if(killerType != -1 && killerID != -1)
         {
            killer = GameInstance.scene.getCharByID(killerID,killerType);
            if(killer != null)
            {
               killerP = new Point(killer.piexl_x,killer.piexl_y);
               if(targetChar.tile_x != killerP.x || targetChar.tile_y != killerP.y)
               {
                  if(targetChar.type == SceneCharacterType.MONSTER && killerType == SceneCharacterType.PLAYER && killerID == GameInstance.mainChar.id)
                  {
                     if((targetChar.data as Monster).res.type == MonsterType.BOSS || (targetChar.data as Monster).res.type == MonsterType.FB_BOSS || (targetChar.data as Monster).res.type == MonsterType.JINGYING || (targetChar.data as Monster).res.type == MonsterType.CUSTOM_FB_BOSS)
                     {
                        FightManager.screen_shake(0.6,80);
                     }
                     else
                     {
                        FightManager.screen_shake(0.3,40);
                     }
                  }
                  if(GameInstance.scene.mapConfig != null)
                  {
                     if(GameInstance.scene.mapConfig.mapID == OtherConst.ZUNRONGWANBAOGE_MAP_ID)
                     {
                        if(targetChar.type == SceneCharacterType.PLAYER && targetChar.id == GameInstance.mainChar.id)
                        {
                           FightManager.screen_shake(0.6,80);
                        }
                        if(targetChar.type == SceneCharacterType.PLAYER && killerType == SceneCharacterType.PLAYER && killerID == GameInstance.mainChar.id)
                        {
                           FightManager.screen_shake(0.6,80);
                           GameInstance.uiInstance.mainUI.setKulou();
                        }
                     }
                  }
                  beatBackPoint = new Point();
                  beatBackPoint.x = killer.piexl_x;
                  beatBackPoint.y = killer.piexl_y;
                  playToDeath();
                  r = ZMath.getRandomNumber(100,300);
                  h = ZMath.getRandomNumber(100,300);
                  if(targetChar.type == SceneCharacterType.MONSTER)
                  {
                     if((targetChar.data as Monster).res.type != MonsterType.SHENDIAODAN_MONSTER)
                     {
                        FightManager.be_beatBack_curve_toPiexl(targetChar,beatBackPoint,r,h);
                     }
                  }
                  else if(targetChar.type == SceneCharacterType.PLAYER)
                  {
                     FightManager.be_beatBack_curve_toPiexl(targetChar,beatBackPoint,r,h);
                  }
               }
               else
               {
                  playToDeath();
               }
            }
            else
            {
               playToDeath();
            }
         }
         else
         {
            playToDeath();
         }
         soundDis = 0;
         if(targetChar != null)
         {
            soundDis = Point.distance(new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y),new Point(targetChar.piexl_x,targetChar.piexl_y));
         }
         if(targetChar.type == SceneCharacterType.PLAYER || targetChar.type == SceneCharacterType.FENSHEN)
         {
            player = targetChar.data as Player;
            if(player.attributeInfo.getSex() == 1)
            {
               TSoundManager.playShortSound_useDis(ResPathManager.SOUND_MAINCHAR_DEATH_1,soundDis);
            }
            else
            {
               TSoundManager.playShortSound_useDis(ResPathManager.SOUND_MAINCHAR_DEATH_0,soundDis);
            }
         }
         else
         {
            data = targetChar.data;
            if(data.res.id_sound_char_death != 0)
            {
               TSoundManager.playShortSound_useDis(data.res.id_sound_char_death,soundDis);
            }
         }
      }
      
      public function useLianZhan(param1:int, param2:int) : void
      {
         var _loc5_:AvatarParamData = null;
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(param2,SceneCharacterType.PLAYER);
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(param1,SceneCharacterType.MONSTER);
         if(_loc4_ == null || GameInstance.mainCharData.attributeInfo.lv - Monster(_loc4_.data).attributeInfo.lv > 10)
         {
            return;
         }
         if(_loc3_ == GameInstance.mainChar)
         {
            if(GameInstance.mainCharData.lianzhanInfo.count != 0 && GameInstance.mainCharData.lianzhanInfo.count % 10 == 0)
            {
               this._fightFHT.push(GameInstance.mainChar,"",0,false,false,LanResManager.getLanTextWords(this,"斩击"),AttackFace.DEFAULT_FOUNT_SIZE_24,AttackFace.DEFAULT_FOUNT_COLOR_ORANGE);
               FightManager.screen_shake(0.4,70);
               _loc5_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_LIANZHAN_SELF),AvatarPartType.MAGIC);
               GameInstance.mainChar.loadAvatarPart(_loc5_);
               _loc5_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_LIANZHAN_MONSTER),AvatarPartType.MAGIC);
               _loc4_.loadAvatarPart(_loc5_);
            }
            else if(GameInstance.mainCharData.lianzhanInfo.count != 0)
            {
               this._fightFHT.push(_loc4_,"",0,false,false,LanResManager.getLanTextWords(this,"连斩1"),AttackFace.DEFAULT_FOUNT_SIZE_22,AttackFace.DEFAULT_FOUNT_COLOR_ORANGE);
               if(GameInstance.mainCharData.lianzhanInfo.count == 1)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"进入连斩每十连将秒杀一次怪物"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"进入连斩每十连将秒杀一次怪物"),false);
               }
            }
         }
      }
      
      public function useSkill(param1:Skill) : void
      {
         var _loc2_:Skill = param1;
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide14);
         if(_loc2_.res.target == 1 || _loc2_.res.target == 2)
         {
            this.attackByNow(_loc2_);
         }
         else if(_loc2_.res.target == 3 || _loc2_.res.target == 4)
         {
            if(_loc2_.buffres.user_scope == 1)
            {
               this.attackByTarget(_loc2_);
            }
            else if(_loc2_.buffres.user_scope == 2)
            {
               if(_loc2_.buffres.aoe_type == 1)
               {
                  this.attackByNow(_loc2_);
               }
               else if(_loc2_.buffres.aoe_type == 2)
               {
                  this.attackByTarget(_loc2_);
               }
            }
         }
         else if(_loc2_.res.target == 6)
         {
            this.attackByTarget(_loc2_);
         }
         else if(_loc2_.res.target == 7)
         {
            this.attackByPoint(_loc2_);
         }
         else if(_loc2_.res.target == 8)
         {
            this.attackByMouse(_loc2_);
         }
         else if(_loc2_.res.target == 9 || _loc2_.res.target == 10)
         {
            this.attackByTarget(_loc2_);
         }
         else if(_loc2_.res.target == 11)
         {
            this.attackByNow(_loc2_);
         }
      }
      
      private function attackByNow(param1:Skill) : void
      {
         if(GameInstance.mainChar.getStatus() != CharStatusType.DEATH)
         {
            this.attack(param1,GameInstance.mainChar.type,GameInstance.mainChar.id);
         }
      }
      
      public function attackByPointOK(param1:MapTile) : void
      {
         var skill:Skill = null;
         var send_attack:Function = null;
         var callBack:MoveCallBack = null;
         var $mt:MapTile = param1;
         send_attack = function(param1:SceneCharacter = null, param2:MapTile = null):void
         {
            if(CDFaceManager.isCooling(skill.getID()))
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该技能处于冷却时间内"),false);
               return;
            }
            if(!GameInstance.mainChar.isJumping())
            {
               GameInstance.mainChar.stopMove(true);
            }
            senderProxy.send_10283([skill.id,$mt.tile_x,$mt.tile_y]);
            TCursorManager.resumFullMouse();
         };
         skill = TCursorManager.currentBaseItem as Skill;
         if(Point.distance(new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y),new Point($mt.piexl_x,$mt.piexl_y)) <= skill.res.distance * 25)
         {
            send_attack();
         }
         else
         {
            callBack = new MoveCallBack();
            callBack.onMoveArrived = send_attack;
            MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + $mt.tile_x + "," + $mt.tile_y + "," + skill.res.distance * 25,false,callBack,true,true,false);
         }
      }
      
      private function attackByPoint(param1:Skill) : void
      {
         TCursorManager.resumFullMouse();
         TCursorManager.currentBaseItem = param1;
         TCursorManager.showCursor(TCursorManager.CURSOR_FLOOR_ATTACK);
         TCursorManager.lockOnMouseStatus();
      }
      
      private function attackByMouse(param1:Skill) : void
      {
         TCursorManager.currentBaseItem = param1;
         PipeManager.sendMsg(PipeConstants.FLOOR_ATTACK,TCursorManager.mapTile);
      }
      
      private function attackByTarget(param1:Skill) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:SceneCharacter = null;
         if(param1.res.skilltype == 2 && param1.res.shortType == 2)
         {
            mainChar_skillID = param1.id;
            mainChar_skillDistance = param1.res.distance * 25;
            _loc2_ = true;
         }
         else
         {
            temp_skillID = param1.id;
            temp_skillDistance = param1.res.distance * 25;
            _loc2_ = false;
         }
         if(GameInstance.mainCharData.isBind)
         {
            _loc3_ = GameInstance.mainChar;
         }
         else
         {
            _loc3_ = GameInstance.lockOnChar;
         }
         if(GameInstance.lockOnChar != null)
         {
            if(_loc3_.type == SceneCharacterType.PLAYER || _loc3_.type == SceneCharacterType.FENSHEN)
            {
               if(FightManager.isMainCharCanMove())
               {
                  PipeManager.sendMsg(PipeConstants.HIT_CHAR,[_loc3_,_loc2_,true]);
               }
            }
            else if(_loc3_.type == SceneCharacterType.MONSTER)
            {
               if(FightManager.isMainCharCanMove())
               {
                  if((_loc3_.data as Monster).res.type == MonsterType.MOUNT)
                  {
                     PipeManager.sendMsg(PipeConstants.CATCH_HORSE,_loc3_);
                  }
                  else if((_loc3_.data as Monster).res.type == MonsterType.YOULONGZHIREN)
                  {
                     PipeManager.sendMsg(PipeConstants.BA_JIAN,_loc3_);
                  }
                  else if((_loc3_.data as Monster).res.type == MonsterType.HUIYAN_JINGYANSHU)
                  {
                     PipeManager.sendMsg(PipeConstants.HUN_YAN_CHI,_loc3_);
                  }
                  else if((_loc3_.data as Monster).res.type == MonsterType.QI3V3)
                  {
                     PipeManager.sendMsg(PipeConstants.BA_QI,_loc3_);
                  }
                  else if((_loc3_.data as Monster).res.type == MonsterType.SHENFU || (_loc3_.data as Monster).res.type == MonsterType.TUNSHITIANDI_MONSTER)
                  {
                     PipeManager.sendMsg(PipeConstants.CHI_SHENFU,_loc3_);
                  }
                  else if((_loc3_.data as Monster).res.type == MonsterType.QINGGONGYAN)
                  {
                     PipeManager.sendMsg(PipeConstants.QINGGONGYAN_CHI,_loc3_);
                  }
                  else if((_loc3_.data as Monster).res.type == MonsterType.BIWUZHAOQIN_XIUQIU_MONSTER)
                  {
                     PipeManager.sendMsg(PipeConstants.QIANG_XIUQIU,_loc3_);
                  }
                  else if((_loc3_.data as Monster).res.type == MonsterType.XUYUANSHU_MONSTER)
                  {
                     PipeManager.sendMsg(PipeConstants.XUYUANSHU_WATER,_loc3_);
                  }
                  else if((_loc3_.data as Monster).res.type == 50)
                  {
                     PipeManager.sendMsg(PipeConstants.HUANGJINSHU_WATER,_loc3_);
                  }
                  else if((_loc3_.data as Monster).res.type == MonsterType.MONSTER_TYPE_DENGMI)
                  {
                     PipeManager.sendMsg(PipeConstants.CLICK_DENGMI,_loc3_.id);
                  }
                  else
                  {
                     PipeManager.sendMsg(PipeConstants.HIT_CHAR,[_loc3_,_loc2_,true]);
                  }
               }
            }
            else if(_loc3_.type == SceneCharacterType.GIRL)
            {
               if(FightManager.isMainCharCanMove())
               {
               }
            }
         }
         else if(GameInstance.mainCharData.isBind)
         {
            PipeManager.sendMsg(PipeConstants.HIT_CHAR,[GameInstance.mainChar,_loc2_,true]);
         }
         else
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("该技能需要目标才能释放"));
         }
      }
      
      public function attrSingleTip(param1:int, param2:Number) : void
      {
         var _loc6_:Number = NaN;
         var _loc3_:int = 300;
         var _loc4_:AttributeInfo = GameInstance.mainCharData.attributeInfo;
         var _loc5_:MoneyInfo = GameInstance.mainCharData.moneyInfo;
         switch(param1)
         {
            case 1:
               _loc6_ = param2 - _loc4_.ap;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.MAX_AP,_loc6_,LanResManager.getLanCommonTextWords("攻击")],_loc3_);
               }
               break;
            case 2:
               _loc6_ = param2 - _loc4_.dp;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.MAX_DP,_loc6_,LanResManager.getLanCommonTextWords("防御")],_loc3_);
               }
               break;
            case 3:
               _loc6_ = param2 - _loc4_.cp;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.MAX_CP,_loc6_,LanResManager.getLanCommonTextWords("暴击")],_loc3_);
               }
               break;
            case 4:
               _loc6_ = param2 - _loc4_.ev;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.MAX_EV,_loc6_,LanResManager.getLanCommonTextWords("闪避")],_loc3_);
               }
               break;
            case 5:
               _loc6_ = param2 - _loc4_.adx;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.MAX_ADX,_loc6_,LanResManager.getLanCommonTextWords("攻速")],_loc3_);
               }
               break;
            case 6:
               _loc6_ = param2 - _loc4_.mdx;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.MAX_MDX,_loc6_,LanResManager.getLanCommonTextWords("移速")],_loc3_);
               }
               break;
            case 7:
               _loc6_ = param2 - _loc4_.hpMax;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.MAX_HP,_loc6_,LanResManager.getLanCommonTextWords("生命")],_loc3_);
               }
               break;
            case 8:
               _loc6_ = param2 - _loc4_.mpMax;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.MAX_MP,_loc6_,LanResManager.getLanCommonTextWords("内力")],_loc3_);
               }
               break;
            case 9:
               _loc6_ = param2 - _loc4_.ppMax;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.MAX_PP,_loc6_,LanResManager.getLanCommonTextWords("体力")],_loc3_);
               }
               break;
            case 10:
            case 11:
               break;
            case 12:
               _loc6_ = param2 - _loc4_.expNow;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.CHANGE_EXP,_loc6_,LanResManager.getLanCommonTextWords("经验")],_loc3_);
               }
               if(_loc6_ > 0)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"经验") + _loc6_,false);
               }
               break;
            case 14:
               _loc6_ = param2 - _loc4_.gqNow;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.CHANGE_GP,_loc6_,LanResManager.getLanCommonTextWords("真气")],_loc3_);
               }
               if(_loc6_ > 0)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"真气") + _loc6_,false);
               }
               break;
            case 15:
               _loc6_ = param2 - _loc4_.prestige_chengzhan;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.CHANGE_PRESTIGE,_loc6_,LanResManager.getLanCommonTextWords("城战声望") + "+"],_loc3_);
               }
               if(_loc6_ > 0)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("城战声望") + "+" + _loc6_,false);
               }
               break;
            case 16:
               break;
            case 17:
               _loc6_ = param2 - _loc4_.mpNow;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.CHANGE_MP,_loc6_],_loc3_);
               }
               break;
            case 18:
               _loc6_ = param2 - _loc4_.ppNow;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.CHANGE_PP,_loc6_],_loc3_);
               }
               break;
            case 20:
            case 42:
            case 43:
               break;
            case 71:
               _loc6_ = param2 - _loc4_.prestige_lunjian;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.CHANGE_PRESTIGE,_loc6_,LanResManager.getLanCommonTextWords("论剑声望") + "+"],_loc3_);
               }
               if(_loc6_ > 0)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("论剑声望") + "+" + _loc6_,false);
               }
               break;
            case 68:
               _loc6_ = param2 - _loc4_.prestige_fuqijingji;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.CHANGE_PRESTIGE,_loc6_,LanResManager.getLanCommonTextWords("夫妻竞技声望") + "+"],_loc3_);
               }
               if(_loc6_ > 0)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("夫妻竞技声望") + "+" + _loc6_,false);
               }
               break;
            case 80:
               _loc6_ = param2 - _loc4_.prestige_zhizungongxun;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.CHANGE_PRESTIGE,_loc6_,LanResManager.getLanCommonTextWords("至尊王者功勋") + "+"],_loc3_);
               }
               if(_loc6_ > 0)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("至尊王者功勋") + "+" + _loc6_,false);
               }
               break;
            case 81:
               _loc6_ = param2 - _loc4_.prestige_shenshengzhandouli;
               if(_loc6_ != 0)
               {
                  this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.CHANGE_PRESTIGE,_loc6_,LanResManager.getLanCommonTextWords("神圣战斗力") + "+"],_loc3_);
               }
               if(_loc6_ > 0)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("神圣战斗力") + "+" + _loc6_,false);
               }
         }
      }
      
      public function attrTip(param1:Object) : void
      {
         var _loc5_:Number = NaN;
         var _loc2_:AttributeInfo = param1[1];
         var _loc3_:AttributeInfo = GameInstance.mainCharData.attributeInfo;
         var _loc4_:int = 300;
         _loc5_ = _loc2_.ap - _loc3_.ap;
         if(_loc5_ != 0)
         {
            this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.MAX_AP,_loc5_,LanResManager.getLanCommonTextWords("攻击")],_loc4_);
         }
         _loc5_ = _loc2_.dp - _loc3_.dp;
         if(_loc5_ != 0)
         {
            this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.MAX_DP,_loc5_,LanResManager.getLanCommonTextWords("防御")],_loc4_);
         }
         _loc5_ = _loc2_.cp - _loc3_.cp;
         if(_loc5_ != 0)
         {
            this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.MAX_CP,_loc5_,LanResManager.getLanCommonTextWords("暴击")],_loc4_);
         }
         _loc5_ = _loc2_.ev - _loc3_.ev;
         if(_loc5_ != 0)
         {
            this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.MAX_EV,_loc5_,LanResManager.getLanCommonTextWords("闪避")],_loc4_);
         }
         _loc5_ = _loc2_.adx - _loc3_.adx;
         if(_loc5_ != 0)
         {
            this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.MAX_ADX,_loc5_,LanResManager.getLanCommonTextWords("攻速")],_loc4_);
         }
         _loc5_ = _loc2_.mdx - _loc3_.mdx;
         if(_loc5_ != 0)
         {
            this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.MAX_MDX,_loc5_,LanResManager.getLanCommonTextWords("移速")],_loc4_);
         }
         _loc5_ = _loc2_.expNow - _loc3_.expNow;
         if(_loc5_ != 0)
         {
            this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.CHANGE_EXP,_loc5_,LanResManager.getLanCommonTextWords("经验")],_loc4_);
            if(_loc5_ > 0)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"经验") + _loc5_,false);
            }
         }
         _loc5_ = _loc2_.gqNow - _loc3_.gqNow;
         if(_loc5_ != 0)
         {
            this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.CHANGE_GP,_loc5_,LanResManager.getLanCommonTextWords("真气")],_loc4_);
            if(_loc5_ > 0)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"真气") + _loc5_,false);
            }
         }
         _loc5_ = _loc2_.prestige_chengzhan - _loc3_.prestige_chengzhan;
         if(_loc5_ != 0)
         {
            this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.CHANGE_PRESTIGE,_loc5_,LanResManager.getLanCommonTextWords("城战声望") + "+"],_loc4_);
            if(_loc5_ > 0)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("城战声望") + "+" + _loc5_,false);
            }
         }
         _loc5_ = _loc2_.prestige_lunjian - _loc3_.prestige_lunjian;
         if(_loc5_ != 0)
         {
            this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.CHANGE_PRESTIGE,_loc5_,LanResManager.getLanCommonTextWords("论剑声望") + "+"],_loc4_);
            if(_loc5_ > 0)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("论剑声望") + "+" + _loc5_,false);
            }
         }
         _loc5_ = _loc2_.prestige_fuqijingji - _loc3_.prestige_fuqijingji;
         if(_loc5_ != 0)
         {
            this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.CHANGE_PRESTIGE,_loc5_,LanResManager.getLanCommonTextWords("夫妻竞技声望") + "+"],_loc4_);
            if(_loc5_ > 0)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("夫妻竞技声望") + "+" + _loc5_,false);
            }
         }
         _loc5_ = _loc2_.prestige_zhizungongxun - _loc3_.prestige_zhizungongxun;
         if(_loc5_ != 0)
         {
            this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.CHANGE_PRESTIGE,_loc5_,LanResManager.getLanCommonTextWords("至尊王者功勋") + "+"],_loc4_);
            if(_loc5_ > 0)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("至尊王者功勋") + "+" + _loc5_,false);
            }
         }
         _loc5_ = _loc2_.prestige_shenshengzhandouli - _loc3_.prestige_shenshengzhandouli;
         if(_loc5_ != 0)
         {
            this.thread.push(this.addTip,[GameInstance.mainChar,AttackFace.CHANGE_PRESTIGE,_loc5_,LanResManager.getLanCommonTextWords("神圣战斗力") + "+"],_loc4_);
            if(_loc5_ > 0)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("神圣战斗力") + "+" + _loc5_,false);
            }
         }
         this.thread.start();
      }
      
      private function addTip(param1:SceneCharacter, param2:String, param3:Number, param4:String = "") : void
      {
         this._fightFHT.push(param1,param2,Math.floor(param3),false,true,param4);
      }
      
      public function showXinFaSKillName(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:SceneCharacter = null;
         if(param1 == SceneCharacterType.PLAYER || param1 == SceneCharacterType.FENSHEN)
         {
            _loc4_ = GameInstance.scene.getCharByID(param2,SceneCharacterType.PLAYER);
         }
         else if(param1 == SceneCharacterType.MONSTER)
         {
            _loc4_ = GameInstance.scene.getCharByID(param2,SceneCharacterType.MONSTER);
         }
         else if(param1 == SceneCharacterType.MOUNT)
         {
            _loc4_ = GameInstance.scene.getCharByID(param2,SceneCharacterType.MOUNT);
         }
         else if(param1 == SceneCharacterType.NPC_FRIEND)
         {
            _loc4_ = GameInstance.scene.getCharByID(param2,SceneCharacterType.NPC_FRIEND);
         }
         else if(param1 == SceneCharacterType.GIRL)
         {
            _loc4_ = GameInstance.scene.getCharByID(param2,SceneCharacterType.GIRL);
         }
         var _loc5_:SkillRes = SkillResManager.getSkillRes(param3);
         this._fightFHT.push(_loc4_,"",0,false,false,_loc5_.name,AttackFace.DEFAULT_FOUNT_SIZE_16,AttackFace.DEFAULT_FOUNT_COLOR_BLUE);
      }
   }
}

