package com.tgame.moudels.attribute.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.mount.MountRes;
   import com.tgame.common.res.mount.MountResManager;
   import com.tgame.common.staticdata.ColorConst;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpeciaAvatarPartID;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.character.BaseCharacter;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.common.vo.character.info.JingmaiInfo;
   import com.tgame.common.vo.character.info.MoneyInfo;
   import com.tgame.common.vo.character.info.MountInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.CustomFaceManager;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.HeadFaceManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TaskTracker;
   import com.tgame.moudels.attribute.view.Attribute_MainCharAttributePlaneMediator;
   import com.tgame.moudels.attribute.view.Attribute_TaJingmaiPanelMediator;
   import com.tgame.moudels.attribute.view.Attribute_TargetCharAttributePlaneMediator;
   import com.tgame.moudels.attribute.view.XunzhangMediator;
   import com.tgame.moudels.attribute.view.Xunzhang_TargetMediator;
   import com.tgame.moudels.attribute.view.ZhanQi_Mediator;
   import com.tgame.moudels.attribute.view.ZhanQi_TargetMediator;
   import com.tgame.moudels.login.view.*;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.avatar.AvatarPart;
   import com.zcp.engine.staticdata.AvatarPartID;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Attribute_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Attribute_MsgReceivedProxy";
      
      private var isNo1Received10108:Boolean = true;
      
      private var _mainCharAttributePlaneMediator:Attribute_MainCharAttributePlaneMediator;
      
      private var _targetCharAttributePlaneMediator:Attribute_TargetCharAttributePlaneMediator;
      
      private var _attribute_TaJingmaiPanelMediator:Attribute_TaJingmaiPanelMediator;
      
      private var _zhanQiMediator:ZhanQi_Mediator;
      
      private var _zhanQi_TargetMediator:ZhanQi_TargetMediator;
      
      private var _targetTR:Attribute_TargetCharAttributePlaneMediator;
      
      private var _attribute_xunzhagnPanelMediator:XunzhangMediator;
      
      private var _attribute_TaXunzhagnPanelMediator:Xunzhang_TargetMediator;
      
      public function Attribute_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get mainCharAttributePlaneMediator() : Attribute_MainCharAttributePlaneMediator
      {
         if(!this._mainCharAttributePlaneMediator)
         {
            this._mainCharAttributePlaneMediator = facade.retrieveMediator(Attribute_MainCharAttributePlaneMediator.NAME) as Attribute_MainCharAttributePlaneMediator;
         }
         return this._mainCharAttributePlaneMediator;
      }
      
      private function get targetCharAttributePlaneMediator() : Attribute_TargetCharAttributePlaneMediator
      {
         if(!this._targetCharAttributePlaneMediator)
         {
            this._targetCharAttributePlaneMediator = facade.retrieveMediator(Attribute_TargetCharAttributePlaneMediator.NAME) as Attribute_TargetCharAttributePlaneMediator;
         }
         return this._targetCharAttributePlaneMediator;
      }
      
      private function get attribute_TaJingmaiPanelMediator() : Attribute_TaJingmaiPanelMediator
      {
         if(!this._attribute_TaJingmaiPanelMediator)
         {
            this._attribute_TaJingmaiPanelMediator = facade.retrieveMediator(Attribute_TaJingmaiPanelMediator.NAME) as Attribute_TaJingmaiPanelMediator;
         }
         return this._attribute_TaJingmaiPanelMediator;
      }
      
      private function get zhanQiMediator() : ZhanQi_Mediator
      {
         if(!this._zhanQiMediator)
         {
            this._zhanQiMediator = facade.retrieveMediator(ZhanQi_Mediator.NAME) as ZhanQi_Mediator;
         }
         return this._zhanQiMediator;
      }
      
      private function get zhanQi_TargetMediator() : ZhanQi_TargetMediator
      {
         if(!this._zhanQi_TargetMediator)
         {
            this._zhanQi_TargetMediator = facade.retrieveMediator(ZhanQi_TargetMediator.NAME) as ZhanQi_TargetMediator;
         }
         return this._zhanQi_TargetMediator;
      }
      
      private function get targetTR() : Attribute_TargetCharAttributePlaneMediator
      {
         if(!this._targetTR)
         {
            this._targetTR = facade.retrieveMediator(Attribute_TargetCharAttributePlaneMediator.NAME) as Attribute_TargetCharAttributePlaneMediator;
         }
         return this._targetTR;
      }
      
      private function get attribute_xunzhangMediator() : XunzhangMediator
      {
         if(!this._attribute_xunzhagnPanelMediator)
         {
            this._attribute_xunzhagnPanelMediator = facade.retrieveMediator(XunzhangMediator.NAME) as XunzhangMediator;
         }
         return this._attribute_xunzhagnPanelMediator;
      }
      
      private function get attribute_TaXunzhangMediator() : Xunzhang_TargetMediator
      {
         if(!this._attribute_TaXunzhagnPanelMediator)
         {
            this._attribute_TaXunzhagnPanelMediator = facade.retrieveMediator(Xunzhang_TargetMediator.NAME) as Xunzhang_TargetMediator;
         }
         return this._attribute_TaXunzhagnPanelMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([10022,10108,20108,50602,50216,49992,53702,51968,10128,57500,57456,53814,20022,51970,57502,52352,52354],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([10022,10108,20108,50602,50216,49992,53702,51968,10128,57500,57456,53814,20022,51970,57502,52352,52354],NAME);
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
         }
         else
         {
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_10022(param1:ByteArray) : void
      {
         var _buf:ByteArray;
         var testData:int;
         var roleID:int;
         var isGM:Boolean;
         var roleNickName:String;
         var headImg:String;
         var party:int;
         var banghuiID:int;
         var banghuiName:String;
         var zhiwu:int;
         var bangqiLv:int;
         var bangqiName:String;
         var bangqiImgType:int;
         var achieveID:int;
         var pkMode:int;
         var apd:AvatarParamData;
         var buffIDArr:Array;
         var buffCount_vip:int;
         var player:Player;
         var avatarCount:int;
         var avatarGoodsIDArr:Array;
         var mt:int;
         var isOnMount:Boolean;
         var jingmaiOpenedNum:int;
         var sitStatus:int;
         var sitToPoint:Point;
         var girlId:int;
         var x1:int;
         var y1:int;
         var isGirl:Boolean;
         var liaoshangStatus:int;
         var liaoshangToPoint:Point;
         var phNum:int;
         var phIDArr:Array;
         var xunhuanPaihangbang:String;
         var banghuiInfo:BanghuiInfo;
         var partyTag:int = 0;
         var bangqiImgColor:Array = null;
         var buffCount:int = 0;
         var i:int = 0;
         var avatarInfo:AvatarInfo = null;
         var mountID:int = 0;
         var sitToPlayerID:int = 0;
         var liaoshangToPlayerID:int = 0;
         var len:int = 0;
         var buffID:int = 0;
         var cdNow:int = 0;
         var cdTotal:int = 0;
         var chuliang:int = 0;
         var extraTime:int = 0;
         var buffID_vip:int = 0;
         var jiezhiTime:Number = NaN;
         var avatarGoodsID:int = 0;
         var phId:int = 0;
         var goodsRes:GoodsRes = null;
         var mountRes:MountRes = null;
         var $data:ByteArray = param1;
         ZLog.add("10022：接收主角信息(角色ID，昵称等)");
         _buf = $data;
         testData = _buf.readInt();
         roleID = _buf.readInt();
         isGM = _buf.readByte() == 1;
         roleNickName = _buf.readUTF();
         headImg = HeadResChange.headResChangeToString(_buf.readByte());
         party = _buf.readByte();
         banghuiID = 0;
         banghuiName = "";
         zhiwu = 0;
         bangqiLv = 0;
         bangqiName = "";
         bangqiImgType = 0;
         partyTag = $data.readByte();
         if(partyTag == 1)
         {
            banghuiID = $data.readInt();
            banghuiName = $data.readUTF();
            zhiwu = $data.readByte();
            bangqiLv = $data.readByte();
            bangqiName = $data.readUTF();
            bangqiImgType = $data.readByte();
            bangqiImgColor = String($data.readUTF()).split(",").map(function(param1:*, param2:int, param3:Array):int
            {
               return int(Number(param1));
            });
         }
         achieveID = _buf.readInt();
         pkMode = _buf.readByte();
         GameInstance.mainChar.removeAllAvatarParts();
         GameInstance.mainChar.removeColorFilter("buff");
         apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_SHADOW));
         apd.useSpecilizeXY = false;
         apd.id_noCheckValid = AvatarPartID.SHADOW;
         apd.type = AvatarPartType.MAGIC_RING;
         apd.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.MAGIC_RING);
         apd.depth = -int.MAX_VALUE;
         apd.useType = 0;
         apd.clearSameType = false;
         GameInstance.mainChar.loadAvatarPart(apd);
         GameInstance.uiInstance.mainUI.setAutoValue(_buf.readByte(),_buf.readByte(),_buf.readByte());
         buffCount = $data.readByte();
         buffIDArr = [];
         i = 0;
         while(i < buffCount)
         {
            buffID = $data.readInt();
            cdNow = $data.readInt();
            cdTotal = $data.readInt();
            chuliang = $data.readDouble();
            extraTime = $data.readInt();
            buffIDArr[buffIDArr.length] = [buffID,cdNow,cdTotal,chuliang,extraTime,0];
            i++;
         }
         buffCount_vip = $data.readByte();
         i = 0;
         while(i < buffCount_vip)
         {
            buffID_vip = $data.readInt();
            jiezhiTime = $data.readDouble();
            buffIDArr[buffIDArr.length] = [buffID_vip,0,0,0,0,jiezhiTime];
            i++;
         }
         player = GameInstance.mainCharData as Player;
         avatarInfo = player.avatarInfo;
         avatarCount = $data.readInt();
         avatarGoodsIDArr = [];
         i = 0;
         while(i < avatarCount)
         {
            avatarGoodsID = $data.readInt();
            avatarGoodsIDArr[avatarGoodsIDArr.length] = avatarGoodsID;
            if(SpecialGoodsID.getSpecialAvatarType(avatarGoodsID) >= 1)
            {
               player.avatarInfo.usingFashion = SpecialGoodsID.getSpecialAvatarType(avatarGoodsID);
            }
            i++;
         }
         player.avatarInfo.avatarCount = avatarCount;
         player.avatarInfo.avatarGoodsIDArr = avatarGoodsIDArr;
         mt = $data.readByte();
         isOnMount = mt == 1;
         if(isOnMount)
         {
            mountID = $data.readInt();
         }
         jingmaiOpenedNum = $data.readByte();
         sitStatus = $data.readByte();
         sitToPoint = new Point();
         if(sitStatus == 2)
         {
            sitToPlayerID = $data.readInt();
            sitToPoint.x = $data.readShort();
            sitToPoint.y = $data.readShort();
         }
         girlId = 0;
         x1 = 0;
         y1 = 0;
         isGirl = Boolean($data.readByte() == 1);
         if(isGirl)
         {
            girlId = $data.readInt();
            x1 = $data.readShort();
            y1 = $data.readShort();
         }
         liaoshangStatus = $data.readByte();
         liaoshangToPoint = new Point();
         if(liaoshangStatus == 1 || liaoshangStatus == 2)
         {
            liaoshangToPlayerID = $data.readInt();
            liaoshangToPoint.x = $data.readShort();
            liaoshangToPoint.y = $data.readShort();
         }
         phNum = $data.readByte();
         phIDArr = [];
         i = 0;
         while(i < phNum)
         {
            phId = $data.readInt();
            phIDArr.push(phId);
            i++;
         }
         GameInstance.mainCharData.attributeInfo.paihangbangArr = phIDArr;
         xunhuanPaihangbang = $data.readUTF();
         GameInstance.mainCharData.attributeInfo.paihangbang_xunhuan = xunhuanPaihangbang;
         GameInstance.peioPlayerID = $data.readInt();
         GameInstance.mainCharData.attributeInfo.spouseID = GameInstance.peioPlayerID;
         if(GameInstance.mainCharData.attributeInfo.spouseID)
         {
            GameInstance.mainCharData.attributeInfo.spouseName = $data.readUTF();
            GameInstance.mainCharData.attributeInfo.yupeiID = $data.readInt();
         }
         else
         {
            GameInstance.mainCharData.attributeInfo.spouseName = "";
            GameInstance.mainCharData.attributeInfo.yupeiID = 0;
         }
         GameInstance.mainCharData.anqiInfo.isActiveAnqi = $data.readByte();
         GameInstance.mainCharData.attributeInfo.currentBowLv = $data.readByte();
         len = $data.readByte();
         AvatarManager.updateQixuanNum(GameInstance.mainChar,len,$data);
         GameInstance.mainCharData.attributeInfo.sitAvartID = $data.readInt();
         GameInstance.mainCharData.attributeInfo.silingzhenCount = $data.readByte();
         GameInstance.mainCharData.attributeInfo.shengsifuCount = $data.readByte();
         GameInstance.mainCharData.attributeInfo.zhenlongqiHeiCount = $data.readByte();
         GameInstance.mainCharData.attributeInfo.zhenlongqiBaiCount = $data.readByte();
         GameInstance.mainCharData.attributeInfo.xisuijingCount = $data.readByte();
         GameInstance.mainCharData.attributeInfo.wuCaiXianZhenCount = $data.readByte();
         GameInstance.mainCharData.attributeInfo.isGM = isGM;
         GameInstance.mainCharData.attributeInfo.headImg = headImg;
         GameInstance.mainCharData.attributeInfo.partyID = party;
         GameInstance.mainCharData.attributeInfo.pkMode = pkMode;
         GameInstance.uiInstance.mainUI.setCharMode(GameInstance.mainCharData.attributeInfo.pkMode);
         GameInstance.mainChar.id = roleID;
         GameInstance.mainChar.name = roleNickName;
         banghuiInfo = player.banghuiInfo;
         banghuiInfo.banghuiId = banghuiID;
         banghuiInfo.banghuiName = banghuiName;
         banghuiInfo.zhiwu = zhiwu;
         banghuiInfo.bangqiLv = bangqiLv;
         banghuiInfo.bangqiName = bangqiName;
         banghuiInfo.bangqiImgID = bangqiImgType;
         banghuiInfo.bangqiImgColor = bangqiImgColor;
         player.achieveInfo.setCurrentTitle(achieveID);
         avatarInfo.clear();
         GameInstance.uiInstance.mainUI.delAll();
         CustomFaceManager.removeAllBuffFace(GameInstance.mainChar);
         len = buffCount + buffCount_vip;
         i = 0;
         while(i < len)
         {
            PipeManager.sendMsg(PipeConstants.ADD_BUFF,[buffIDArr[i][0],SceneCharacterType.PLAYER,roleID,buffIDArr[i][1],buffIDArr[i][2],buffIDArr[i][3],buffIDArr[i][4],buffIDArr[i][5]]);
            i++;
         }
         i = 0;
         while(i < avatarCount)
         {
            goodsRes = GoodsResManager.getGoodsRes(avatarGoodsIDArr[i]);
            if(goodsRes != null)
            {
               AvatarManager.dressAvatarData(avatarInfo,goodsRes.position,goodsRes.id_m,GameInstance.mainCharData.attributeInfo.getSex());
            }
            i++;
         }
         if(OtherConst.texiaoBoolean)
         {
            testData = 0;
         }
         avatarInfo.useIng_Weapon_id = testData;
         GameInstance.mainChar.isOnMount = isOnMount;
         if(isOnMount)
         {
            if(player.avatarInfo.usingFashion == 1)
            {
               avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,SpecialGoodsID.HUANGJIN_SHENGLONG_ID),AvatarPartType.MOUNT);
            }
            else
            {
               mountRes = MountResManager.getMountRes(mountID);
               if(mountRes != null)
               {
                  avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,mountRes.id_m),AvatarPartType.MOUNT);
               }
            }
            avatarInfo.lastMountId = mountID;
         }
         AvatarManager.updateJingmaiAvatar(GameInstance.mainChar,jingmaiOpenedNum);
         AvatarManager.updateQixuanAvatar(GameInstance.mainChar,GameInstance.mainCharData.attributeInfo.qixuan1ID,GameInstance.mainCharData.attributeInfo.qixuan2ID,GameInstance.mainCharData.attributeInfo.qixuan3ID,GameInstance.mainCharData.attributeInfo.qixuan4ID,GameInstance.mainCharData.attributeInfo.qixuan5ID);
         if(sitStatus != 0)
         {
            PipeManager.sendMsg(PipeConstants.CHAR_DAZUO_SHUANGXIU_STATUS,[roleID,sitStatus,sitToPlayerID,sitToPoint.x,sitToPoint.y,girlId,x1,y1,0]);
         }
         if(liaoshangStatus != 0)
         {
            PipeManager.sendMsg(PipeConstants.CHAR_LIAOSHANG_STATUS,[roleID,liaoshangStatus,liaoshangToPlayerID,liaoshangToPoint.x,liaoshangToPoint.y,girlId,0]);
         }
         AvatarManager.updateSilingzhenAvatar(GameInstance.mainChar,GameInstance.mainCharData.attributeInfo.silingzhenCount);
         AvatarManager.updateShensifuAvatar(GameInstance.mainChar,GameInstance.mainCharData.attributeInfo.shengsifuCount);
         AvatarManager.updateZhenLongqiHeiAvatar(GameInstance.mainChar,GameInstance.mainCharData.attributeInfo.zhenlongqiHeiCount);
         AvatarManager.updateZhenLongqiBaiAvatar(GameInstance.mainChar,GameInstance.mainCharData.attributeInfo.zhenlongqiBaiCount);
         AvatarManager.updateFenTianNuQiAvatar(GameInstance.mainChar,GameInstance.mainCharData.attributeInfo.xisuijingCount);
         AvatarManager.updateWuCaiXianZhenAvatar(GameInstance.mainChar,GameInstance.mainCharData.attributeInfo.wuCaiXianZhenCount);
         AvatarManager.updateMainAvatar(GameInstance.mainChar);
         PipeManager.sendMsg(PipeConstants.CHANGED_MAINCHAR_BASE_ATTR);
         HeadFaceManager.updatePlayersName([GameInstance.mainChar.id]);
      }
      
      public function received_20022(param1:ByteArray) : void
      {
         var _loc12_:int = 0;
         var _loc13_:GoodsRes = null;
         var _loc14_:MountRes = null;
         var _loc2_:Player = GameInstance.mainCharData as Player;
         GameInstance.mainCharData.attributeInfo.isJiHuoXianTianWuJing = param1.readByte();
         GameInstance.mainCharData.attributeInfo.isJiHuoRoutiJinshen = param1.readByte() == 1;
         GameInstance.mainCharData.attributeInfo.useWuhundanCount = param1.readShort();
         var _loc3_:int = param1.readByte();
         GameInstance.mainCharData.attributeInfo.zhenyingID = _loc3_;
         if(GameConfig.wantEnterMapRes.id == 20304)
         {
            GameInstance.mainCharData.avatarInfo.wangzhezhibang = GameInstance.mainCharData.attributeInfo.zhenyingID;
         }
         else
         {
            GameInstance.mainCharData.avatarInfo.zhenYingHuanZhuang = GameInstance.mainCharData.attributeInfo.zhenyingID;
         }
         var _loc4_:int = param1.readShort();
         GameInstance.mainCharData.attributeInfo.pingtaiID = _loc4_;
         GameInstance.mainCharData.attributeInfo.useTianShengNeiliCount = param1.readShort();
         GameInstance.mainCharData.attributeInfo.isHuXinYaoJiHuo = param1.readShort() == 1;
         GameInstance.mainCharData.attributeInfo.isWuHunShengJiDanJiHuo = param1.readShort() == 1;
         GameInstance.mainCharData.attributeInfo.starSta = param1.readShort();
         GameInstance.mainCharData.attributeInfo.shenNongBaiChaoDanSta = param1.readShort();
         _loc2_.avatarInfo.isCiKe = param1.readByte() == 1 ? true : false;
         GameInstance.mainCharData.attributeInfo.statusString = param1.readUTF();
         GameInstance.mainCharData.attributeInfo.niXiStatus = param1.readShort() == 1;
         GameInstance.mainCharData.attributeInfo.qianNengXinFaSta = param1.readInt();
         _loc2_.avatarInfo.useAvatarType = param1.readInt();
         GameInstance.mainCharData.attributeInfo.isXunzhangDakong = Boolean(param1.readByte() == 1);
         GameInstance.mainCharData.attributeInfo.lmStatus = param1.readByte() == 1;
         GameInstance.mainCharData.attributeInfo.qmStatus = param1.readByte() == 1;
         GameInstance.mainCharData.attributeInfo.taoZhuang = param1.readByte() == 1;
         GameInstance.mainCharData.attributeInfo.zszlStatus = param1.readByte() == 1;
         GameInstance.mainCharData.avatarInfo.isFeixing = param1.readByte() == 1;
         GameInstance.mainCharData.avatarInfo.isFeixing_huanzhuang_Id = param1.readByte();
         GameInstance.mainCharData.avatarInfo.isFeixing_wuhun_Id = param1.readInt();
         GameInstance.mainCharData.attributeInfo.fengHuang = param1.readByte() == 1;
         GameInstance.mainCharData.attributeInfo.prestige_fuQi = param1.readInt();
         GameInstance.mainCharData.avatarInfo.isZunrongWanbaoge = Boolean(param1.readByte() == 1);
         GameInstance.mainCharData.attributeInfo.isHuoHunDanJiHuo = param1.readByte() == 1;
         GameInstance.mainCharData.attributeInfo.wuHunShenDan = param1.readInt();
         GameInstance.mainCharData.attributeInfo.isLongHunWuPoJiHuo = param1.readByte() == 1;
         GameInstance.mainCharData.attributeInfo.longHunShenDan = param1.readInt();
         GameInstance.mainCharData.attributeInfo.isShenFuMiJi = param1.readByte() == 1;
         GameInstance.mainCharData.attributeInfo.isNeitishenqi = param1.readInt() == 1;
         GameInstance.mainCharData.attributeInfo.neitishenqi = param1.readInt();
         GameInstance.mainCharData.attributeInfo.xunZhangJingJie = param1.readInt();
         GameInstance.mainCharData.avatarInfo.isShowLongWenKeHua = Boolean(param1.readByte() == 1);
         if(GameInstance.mainCharData.avatarInfo.isShowLongWenKeHua)
         {
            GameInstance.mainCharData.avatarInfo.longWenKeHuaYanse = param1.readByte();
         }
         GameInstance.mainCharData.attributeInfo.isTianmingXunzhang = Boolean(param1.readByte() == 1);
         GameInstance.mainCharData.attributeInfo.isLongwenFuzhou = Boolean(param1.readByte() == 1);
         GameInstance.mainCharData.attributeInfo.isWuGenXianZhou = Boolean(param1.readByte() == 1);
         GameInstance.mainCharData.attributeInfo.isJiDaoQianKunXunZhang = Boolean(param1.readByte() == 1);
         GameInstance.mainCharData.attributeInfo.isTianDiRenHe = Boolean(param1.readByte() == 1);
         GameInstance.mainCharData.attributeInfo.isDaoGuXianFengXunZhang = Boolean(param1.readByte() == 1);
         GameInstance.mainCharData.attributeInfo.isXuanJianLingPo = Boolean(param1.readByte() == 1);
         GameInstance.mainCharData.attributeInfo.isYuanJianLingPo = Boolean(param1.readByte() == 1);
         GameInstance.mainCharData.isDiZi = param1.readByte() == 1;
         if(GameInstance.mainCharData.isDiZi)
         {
            GameInstance.mainCharData.attributeInfo.zuShiParty = param1.readUTF();
            GameInstance.mainCharData.attributeInfo.zuShiName = param1.readUTF();
            GameInstance.mainCharData.skillInfo.skillLevel = param1.readInt();
         }
         GameInstance.mainCharData.mainId = param1.readInt();
         GameInstance.mainCharData.mainBangHuiId = param1.readInt();
         GameInstance.mainCharData.attributeInfo.chengweiID = param1.readByte();
         GameInstance.mainCharData.attributeInfo.prestige_gongXunZhi = param1.readInt();
         GameInstance.mainCharData.attributeInfo.prestige_WuHunZhi = param1.readInt();
         GameInstance.mainCharData.attributeInfo.skillLvStatus = param1.readByte();
         GameInstance.mainCharData.attributeInfo.wufang = param1.readDouble();
         if(Fun.isVisible(GameInstance.uiInstance._buttonContainer))
         {
            GameInstance.uiInstance._buttonContainer.setType(GameInstance.mainCharData.isDiZi);
            ResizeManager.resizeSitPanel();
         }
         var _loc5_:Array = SpeciaAvatarPartID.AVATAT_ID_LONGWENKEHUA[GameInstance.mainCharData.attributeInfo.partyID];
         if(_loc5_ != null)
         {
            _loc12_ = int(_loc5_[GameInstance.mainCharData.avatarInfo.longWenKeHuaYanse]);
         }
         var _loc6_:* = 0;
         while(_loc6_ < GameInstance.mainCharData.avatarInfo.avatarCount)
         {
            _loc13_ = GoodsResManager.getGoodsRes(GameInstance.mainCharData.avatarInfo.avatarGoodsIDArr[_loc6_]);
            if(_loc13_ != null)
            {
               AvatarManager.dressAvatarData(GameInstance.mainCharData.avatarInfo,_loc13_.position,_loc13_.id_m,GameInstance.mainCharData.attributeInfo.getSex(),_loc12_);
            }
            _loc6_++;
         }
         if(GameInstance.mainChar.isOnMount)
         {
            if(_loc2_.buffInfo.getBuff(80200554))
            {
               _loc2_.avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,SpecialGoodsID.HUANGJIN_SHENGLONG_ID),AvatarPartType.MOUNT);
            }
            else if(_loc2_.avatarInfo.useAvatarType > 0)
            {
               _loc2_.avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,AvatarManager.getAvatarIdByType(_loc2_.avatarInfo.useAvatarType)),AvatarPartType.MOUNT);
            }
            else
            {
               _loc14_ = MountResManager.getMountRes(_loc2_.avatarInfo.lastMountId);
               if(_loc14_ != null)
               {
                  _loc2_.avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,_loc14_.id_m),AvatarPartType.MOUNT);
               }
            }
         }
         var _loc7_:String = "";
         var _loc8_:String = _loc2_.achieveInfo.getCurrentTitle();
         if(_loc8_ != "")
         {
            _loc7_ = "<font color=\'" + ColorConst.tran16ToStr(ColorConst.MAINCHAR_TITLE_COLOR) + "\'>" + _loc8_ + "</font>";
         }
         var _loc9_:String = _loc2_.banghuiInfo.banghuiName;
         if(_loc9_ != "" && _loc9_ != null)
         {
            if(_loc7_ != "")
            {
               _loc7_ += "<br />";
            }
            _loc7_ += "<font color=\'" + ColorConst.tran16ToStr(ColorConst.MAINCHAR_BANGHUI_COLOR) + "\'>[" + LanResManager.getLanCommonTextWords("帮会") + "]" + _loc2_.banghuiInfo.banghuiName.replace(/^\[(\d+)(.*)\](.+)$/,"$3[$1$2]") + "</font>";
         }
         var _loc10_:String = GameInstance.mainCharData.attributeInfo.isGM ? "【GM】" : "";
         var _loc11_:uint = GameInstance.mainCharData.attributeInfo.zhenyingID ? ColorConst.FRIEND_MONSTER_NAME_COLOR : ColorConst.PLAYER_NICK_NAME_COLOR;
         if(GameInstance.scene.mapConfig != null)
         {
            if(GameInstance.scene.mapConfig.mapID == OtherConst.FUQIJINGJICHANG_MAP_ID)
            {
               if(GameInstance.mainCharData.attributeInfo.vs3V3Team == 1)
               {
                  _loc11_ = ColorConst.VS3V3_HUANG_COLOR;
               }
               else
               {
                  _loc11_ = ColorConst.VS3V3_LAN_COLOR;
               }
            }
         }
         if(_loc2_.avatarInfo.isCiKe)
         {
            GameInstance.mainChar.showHeadFace(_loc10_ + LanResManager.getLanCommonTextWords("刺客"),_loc11_,"",null,null);
         }
         else if(AvatarManager.isShowZhenYingAvatar(_loc2_.avatarInfo.zhenYingHuanZhuang))
         {
            GameInstance.mainChar.showHeadFace(_loc10_ + GameInstance.mainChar.name.replace(/^\[(\d+)(.*)\](.+)$/,"$3[$1$2]"),_loc11_,_loc7_,null,null);
            HeadFaceManager.updateCharSkillLevel(GameInstance.mainChar.id,GameInstance.mainCharData.skillInfo.skillLevel);
         }
         else
         {
            GameInstance.mainChar.showHeadFace(_loc10_ + GameInstance.mainChar.name.replace(/^\[(\d+)(.*)\](.+)$/,"$3[$1$2]"),_loc11_,_loc7_,null,null);
            HeadFaceManager.updateCharPaihang(GameInstance.mainChar.id,GameInstance.mainCharData.attributeInfo.paihangbangArr,SceneCharacterType.PLAYER,false,GameInstance.mainCharData.attributeInfo.paihangbang_xunhuan);
            HeadFaceManager.updateCharSkillLevel(GameInstance.mainChar.id,GameInstance.mainCharData.skillInfo.skillLevel);
            HeadFaceManager.updateCharChenwei(GameInstance.mainChar.id,GameInstance.mainCharData.attributeInfo.chengweiID);
            this.mainCharAttributePlaneMediator.update();
         }
         AvatarManager.setHuangzhuangZhuangtai(GameInstance.mainChar,false);
         AvatarManager.updateMainAvatar(GameInstance.mainChar);
      }
      
      public function received_10128(param1:ByteArray) : void
      {
         var _loc2_:String = param1.readUTF();
         var _loc3_:Array = _loc2_.split(",");
         OtherConst.xunzhangJieshu = _loc3_[0];
         OtherConst.zhanqiJieshu = _loc3_[1];
         OtherConst.xunzhang_zhanqi_duanzao = _loc3_[2];
         OtherConst.zhuangbei_dakong = _loc3_[3];
         OtherConst.yichu_kewen = _loc3_[4];
         OtherConst.mount_add_count = _loc3_[5];
      }
      
      public function received_10108(param1:ByteArray) : void
      {
         var _loc11_:Boolean = false;
         var _loc12_:Object = null;
         var _loc13_:SceneCharacter = null;
         var _loc14_:AvatarParamData = null;
         var _loc15_:BitmapData = null;
         ZLog.add("10108：接收主角详细属性");
         var _loc2_:AttributeInfo = new AttributeInfo();
         var _loc3_:MoneyInfo = new MoneyInfo();
         var _loc4_:MountInfo = (GameInstance.mainChar.data as Player).mountInfo;
         var _loc5_:BanghuiInfo = (GameInstance.mainChar.data as Player).banghuiInfo;
         _loc3_.copper = param1.readDouble();
         _loc3_.gold = param1.readDouble();
         _loc3_.gifts = param1.readDouble();
         _loc3_.jinpiao = param1.readDouble();
         _loc2_.lv = param1.readShort();
         _loc2_.hpNow = param1.readDouble();
         _loc2_.hpMax = param1.readDouble();
         _loc2_.mpNow = param1.readDouble();
         _loc2_.mpMax = param1.readDouble();
         _loc2_.ppNow = param1.readDouble();
         _loc2_.ppMax = param1.readDouble();
         _loc2_.expNow = param1.readDouble();
         _loc2_.expMax = param1.readDouble();
         _loc2_.gqNow = param1.readInt();
         _loc2_.points_action = param1.readDouble();
         var _loc6_:int = param1.readInt();
         _loc2_.ev = param1.readDouble();
         _loc2_.cp = param1.readDouble();
         _loc2_.ap = param1.readDouble();
         _loc2_.dp = param1.readDouble();
         _loc2_.adx = param1.readInt();
         _loc2_.mdx = param1.readInt();
         _loc2_.points_attack = param1.readDouble();
         _loc2_.points_defence = param1.readDouble();
         _loc2_.points_fly = param1.readDouble();
         _loc2_.points_stong = param1.readDouble();
         _loc6_ = param1.readInt();
         _loc5_.banghuiId = param1.readInt();
         _loc2_.bagCount = param1.readByte();
         _loc2_.depotCount = param1.readByte();
         _loc3_.depotCopper = param1.readDouble();
         _loc4_.mountDepotSlot = param1.readByte();
         _loc3_.shopName = param1.readUTF();
         _loc2_.prestige_chengzhan = param1.readInt();
         _loc2_.prestige_lunjian = param1.readInt();
         _loc2_.prestige_fuqijingji = param1.readInt();
         _loc2_.prestige_shitu = param1.readInt();
         _loc5_.banggong = param1.readDouble();
         _loc2_.dugu_baoji_jianmian = param1.readDouble();
         _loc2_.dugu_anqi_jianmian = param1.readDouble();
         _loc2_.dugu_anqi_dikang = param1.readDouble();
         _loc2_.dugu_gongjian_dikang = param1.readDouble();
         _loc2_.dugu_dantian_dikang = param1.readDouble();
         _loc2_.cjNow = param1.readInt();
         _loc2_.add2_bj = param1.readInt();
         _loc2_.add2_aq = param1.readInt();
         _loc2_.add2_daq = param1.readInt();
         _loc2_.add2_dgj = param1.readInt();
         _loc2_.add2_ddt = param1.readInt();
         _loc2_.zhanchang_jifen = param1.readInt();
         _loc2_.jinzhongzhaoCount = param1.readByte();
         _loc2_.jinzhongzhaoColor = param1.readByte();
         var _loc7_:Boolean = param1.readByte() == 1 ? true : false;
         _loc2_.moxueNow = param1.readInt();
         _loc2_.moxueMax = param1.readInt();
         _loc2_.prestige_zhizungongxun = param1.readInt();
         _loc2_.prestige_shenshengzhandouli = param1.readInt();
         _loc2_.fabaoNow = param1.readDouble();
         _loc2_.fabaoMax = param1.readDouble();
         _loc2_.lingliNow = param1.readInt();
         _loc2_.lingliMax = param1.readInt();
         _loc2_.wufang = param1.readDouble();
         GameInstance.mainCharData.isZhuanSheng = Boolean(param1.readByte());
         var _loc8_:int = param1.readInt();
         if(_loc8_ > 0 && !_loc2_.isShowNeiGong)
         {
            _loc13_ = GameInstance.scene.getCharByID(GameInstance.mainChar.id,1);
            _loc14_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager["AVATAR_ZHUANSHENG_" + _loc8_]),AvatarPartType.MAGIC_RING);
            _loc14_.id = "zhuansheng_lv";
            _loc14_.depth = OtherConst.SILINGZHEN_DEPTH;
            _loc13_.loadAvatarPart(_loc14_);
         }
         else
         {
            _loc13_ = GameInstance.scene.getCharByID(GameInstance.mainChar.id,1);
            _loc13_.removeAvatarPartByID("zhuansheng_lv");
         }
         var _loc9_:AttributeInfo = (GameInstance.mainChar.data as Player).attributeInfo;
         var _loc10_:MoneyInfo = (GameInstance.mainChar.data as Player).moneyInfo;
         if(_loc9_.lv != _loc2_.lv)
         {
            _loc11_ = true;
         }
         _loc10_.copper = _loc3_.copper;
         _loc10_.gold = _loc3_.gold;
         _loc10_.gifts = _loc3_.gifts;
         _loc10_.jinpiao = _loc3_.jinpiao;
         _loc9_.lv = _loc2_.lv;
         _loc9_.hpNow = _loc2_.hpNow;
         _loc9_.hpMax = _loc2_.hpMax;
         _loc9_.mpNow = _loc2_.mpNow;
         _loc9_.mpMax = _loc2_.mpMax;
         _loc9_.ppNow = _loc2_.ppNow;
         _loc9_.ppMax = _loc2_.ppMax;
         _loc9_.fabaoNow = _loc2_.fabaoNow;
         _loc9_.fabaoMax = _loc2_.fabaoMax;
         _loc9_.lingliNow = _loc2_.lingliNow;
         _loc9_.lingliMax = _loc2_.lingliMax;
         _loc9_.expNow = _loc2_.expNow;
         _loc9_.expMax = _loc2_.expMax;
         _loc9_.gqNow = _loc2_.gqNow;
         _loc9_.moxueNow = _loc2_.moxueNow;
         _loc9_.moxueMax = _loc2_.moxueMax;
         _loc9_.points_action = _loc2_.points_action;
         _loc9_.ev = _loc2_.ev;
         _loc9_.cp = _loc2_.cp;
         _loc9_.ap = _loc2_.ap;
         _loc9_.dp = _loc2_.dp;
         _loc9_.adx = _loc2_.adx;
         _loc9_.mdx = _loc2_.mdx;
         _loc9_.points_attack = _loc2_.points_attack;
         _loc9_.points_defence = _loc2_.points_defence;
         _loc9_.points_fly = _loc2_.points_fly;
         _loc9_.points_stong = _loc2_.points_stong;
         _loc9_.bagCount = _loc2_.bagCount;
         _loc9_.depotCount = _loc2_.depotCount;
         _loc10_.depotCopper = _loc3_.depotCopper;
         _loc10_.shopName = _loc3_.shopName;
         _loc9_.dugu_baoji_jianmian = _loc2_.dugu_baoji_jianmian;
         _loc9_.dugu_anqi_jianmian = _loc2_.dugu_anqi_jianmian;
         _loc9_.dugu_anqi_dikang = _loc2_.dugu_anqi_dikang;
         _loc9_.dugu_gongjian_dikang = _loc2_.dugu_gongjian_dikang;
         _loc9_.dugu_dantian_dikang = _loc2_.dugu_dantian_dikang;
         _loc9_.cjNow = _loc2_.cjNow;
         _loc9_.prestige_chengzhan = _loc2_.prestige_chengzhan;
         _loc9_.prestige_lunjian = _loc2_.prestige_lunjian;
         _loc9_.prestige_fuqijingji = _loc2_.prestige_fuqijingji;
         _loc9_.prestige_zhizungongxun = _loc2_.prestige_zhizungongxun;
         _loc9_.prestige_shenshengzhandouli = _loc2_.prestige_shenshengzhandouli;
         _loc9_.prestige_shitu = _loc2_.prestige_shitu;
         _loc9_.add2_bj = _loc2_.add2_bj;
         _loc9_.add2_aq = _loc2_.add2_aq;
         _loc9_.add2_daq = _loc2_.add2_daq;
         _loc9_.add2_dgj = _loc2_.add2_dgj;
         _loc9_.add2_ddt = _loc2_.add2_ddt;
         _loc9_.zhanchang_jifen = _loc2_.zhanchang_jifen;
         _loc9_.tianFuSta = _loc7_;
         ExchangePositionManager.parseSkillStatus();
         GameInstance.mainCharData.moveSpeed = _loc2_.mdx;
         if(!GameInstance.mainCharData.isInAutoFly)
         {
            if((GameInstance.mainChar.data as BaseCharacter).avatarInfo.isYouyong)
            {
               GameInstance.mainChar.setSpeed(OtherConst.YOUYONG_SUDU);
            }
            else if((GameInstance.mainChar.data as BaseCharacter).avatarInfo.isFuQiJingJiFeiDaDiao)
            {
               GameInstance.mainChar.setSpeed(200);
            }
            else
            {
               GameInstance.mainChar.setSpeed(_loc2_.mdx);
            }
         }
         if(_loc2_.jinzhongzhaoColor == 1)
         {
            _loc15_ = RslLoaderManager.getInstance("ui.char.jinzhongzhao1");
         }
         else
         {
            _loc15_ = RslLoaderManager.getInstance("ui.char.jinzhongzhao");
         }
         if(_loc2_.jinzhongzhaoCount == 0)
         {
            _loc12_ = {
               "color":16711680,
               "bmdNum":_loc2_.jinzhongzhaoCount,
               "bmd":_loc15_
            };
         }
         else
         {
            _loc12_ = {
               "color":16776960,
               "bmdNum":_loc2_.jinzhongzhaoCount,
               "bmd":_loc15_
            };
         }
         GameInstance.mainChar.setHeadFaceBar(_loc2_.hpNow,_loc2_.hpMax,_loc12_);
         if(GameState.isMainCharChanged)
         {
            this.mainCharAttributePlaneMediator.setLayout(GameInstance.mainCharData.isDiZi);
            GameState.isMainCharChanged = false;
         }
         this.mainCharAttributePlaneMediator.update();
         PipeManager.sendMsg(PipeConstants.CHANGED_MAINCHAR_BASE_ATTR);
         if(_loc11_)
         {
            PipeManager.sendMsg(PipeConstants.UPDATE_ITEM_BAG);
            TaskTracker.updateTaskUI();
         }
         if(NewPlayerGuideStaticFun.levelGuideArr[_loc9_.lv] != undefined && !GameState.isFirst10108)
         {
            GameInstance.uiInstance.mainUI.setLevelTip(NewPlayerGuideStaticFun.levelGuideArr[_loc9_.lv]);
         }
         if(_loc9_.points_action != 0)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_POINT);
         }
         if(_loc2_.gqNow >= _loc2_.gqMax)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_ZHENGQI_FULL);
         }
         if(_loc2_.moxueNow >= _loc2_.moxueMax && _loc2_.moxueMax > 0)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_MOXUE_FULL);
         }
         if(GameState.isFirst10108)
         {
            this.mainCharAttributePlaneMediator.setIsShowBiaoqian(_loc2_.lv);
         }
         else if(!GameInstance.mainCharData.isDiZi)
         {
            GameInstance.uiInstance.mainUI.functionContainer.guideBar.addBtn(MainUI.RENWU_XIANSHI_BIAOQIAN,_loc2_.lv);
         }
         GameState.isFirst10108 = false;
      }
      
      public function received_20108(param1:ByteArray) : void
      {
         var curWeaponID:int;
         var targetID:int;
         var pPlayer:PurePlayer;
         var attrInfo:AttributeInfo;
         var avatarInfo:AvatarInfo;
         var banghuiInfo:BanghuiInfo;
         var goodsNum:int;
         var goodsArr:Array;
         var j:int;
         var isOnMount:Boolean;
         var goods:Goods = null;
         var i:int = 0;
         var goodsID:int = 0;
         var goodsP:int = 0;
         var goodsRes:GoodsRes = null;
         var mountID:int = 0;
         var mountRes:MountRes = null;
         var $data:ByteArray = param1;
         ZLog.add("20108：收到目标玩家详细信息 ");
         curWeaponID = $data.readInt();
         targetID = $data.readInt();
         if(GameInstance.lookPlayerID == -1 || GameInstance.lookPlayerID != targetID)
         {
            return;
         }
         pPlayer = GameInstance.lookPlayerData;
         attrInfo = pPlayer.attributeInfo;
         avatarInfo = pPlayer.avatarInfo;
         banghuiInfo = pPlayer.banghuiInfo;
         GameInstance.lookPlayerData.isDiZi = $data.readByte() == 1;
         if(GameInstance.lookPlayerData.isDiZi)
         {
            GameInstance.lookPlayerData.attributeInfo.zuShiParty = $data.readUTF();
            GameInstance.lookPlayerData.attributeInfo.zuShiName = $data.readUTF();
            GameInstance.lookPlayerData.skillInfo.skillLevel = $data.readInt();
         }
         avatarInfo.clear();
         avatarInfo.useIng_Weapon_id = curWeaponID;
         pPlayer.id = targetID;
         pPlayer.name = $data.readUTF();
         attrInfo.lv = $data.readShort();
         attrInfo.partyID = $data.readByte();
         attrInfo.prestige_chengzhan = $data.readInt();
         attrInfo.prestige_lunjian = $data.readInt();
         attrInfo.prestige_fuqijingji = $data.readInt();
         banghuiInfo.banghuiName = $data.readUTF();
         banghuiInfo.bangqiImgID = $data.readByte();
         banghuiInfo.bangqiImgColor = $data.readUTF().split(",").map(function(param1:*, param2:int, param3:Array):int
         {
            return int(Number(param1));
         });
         attrInfo.spouseName = $data.readUTF();
         attrInfo.expNow = $data.readDouble();
         attrInfo.expMax = $data.readDouble();
         attrInfo.gqNow = $data.readInt();
         attrInfo.hpNow = $data.readDouble();
         attrInfo.hpMax = $data.readDouble();
         attrInfo.mpNow = $data.readDouble();
         attrInfo.mpMax = $data.readDouble();
         attrInfo.ppNow = $data.readDouble();
         attrInfo.ppMax = $data.readDouble();
         attrInfo.ap = $data.readDouble();
         attrInfo.dp = $data.readDouble();
         attrInfo.cp = $data.readDouble();
         attrInfo.ev = $data.readDouble();
         attrInfo.adx = $data.readInt();
         attrInfo.mdx = $data.readInt();
         attrInfo.wufang = $data.readDouble();
         attrInfo.kfNow = $data.readDouble();
         attrInfo.kfMax = $data.readDouble();
         attrInfo.jmNow = $data.readShort();
         attrInfo.jmMax = $data.readShort();
         attrInfo.cjNow = $data.readShort();
         attrInfo.cjMax = $data.readShort();
         goodsNum = $data.readInt();
         goodsArr = [];
         i = 0;
         while(i < goodsNum)
         {
            goodsID = $data.readInt();
            goodsP = $data.readShort();
            goods = new Goods(goodsID,goodsP);
            goods.roleID = targetID;
            goods.strengthen_grade = $data.readByte();
            goods.quality = $data.readByte();
            goods.bind = $data.readByte();
            goods.isFullStar = $data.readByte();
            goods.strengthen_total = $data.readByte();
            goods.isTuteng = $data.readByte();
            goods.isBaoshiTOP = $data.readByte();
            goods.isNiuBi = $data.readByte();
            goods.isFullTianshen = $data.readByte();
            goods.isSiShengShou = $data.readByte();
            goods.isFullStone = $data.readByte();
            goodsArr.push(goods);
            if(SpecialGoodsID.getSpecialAvatarType(goodsID) > 0)
            {
               avatarInfo.usingFashion = SpecialGoodsID.getSpecialAvatarType(goodsID);
            }
            i++;
         }
         j = 0;
         while(j < goodsArr.length)
         {
            goodsRes = GoodsResManager.getGoodsRes((goodsArr[j] as Goods).id);
            if(goodsRes != null)
            {
               AvatarManager.dressAvatarData(avatarInfo,goodsRes.position,goodsRes.id_m,attrInfo.getSex());
            }
            j++;
         }
         pPlayer.goodsInfo.goodsBagArr = goodsArr;
         pPlayer.avatarInfo.useAvatarType = $data.readInt();
         isOnMount = $data.readByte() == 1;
         pPlayer.isOnMount = isOnMount;
         if(isOnMount)
         {
            mountID = $data.readInt();
            if(pPlayer.avatarInfo.usingFashion == 1)
            {
               avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,SpecialGoodsID.HUANGJIN_SHENGLONG_ID),AvatarPartType.MOUNT);
            }
            else if(pPlayer.avatarInfo.useAvatarType > 0)
            {
               avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,AvatarManager.getAvatarIdByType(pPlayer.avatarInfo.useAvatarType)),AvatarPartType.MOUNT);
            }
            else
            {
               mountRes = MountResManager.getMountRes(mountID);
               if(mountRes != null)
               {
                  avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,mountRes.id_m),AvatarPartType.MOUNT);
               }
            }
            avatarInfo.lastMountId = mountID;
         }
         pPlayer.spouseData.peiouID = $data.readInt();
         if(pPlayer.spouseData.peiouID)
         {
            pPlayer.spouseData.name = $data.readUTF();
            attrInfo.spouseName = pPlayer.spouseData.name;
            pPlayer.spouseData.yupeiID = $data.readInt();
         }
         else
         {
            pPlayer.spouseData.yupeiID = 0;
            pPlayer.spouseData.name = "";
            attrInfo.spouseName = "";
         }
         pPlayer.liantiLevel = $data.readByte();
         pPlayer.liantiPercent = $data.readByte();
         attrInfo.dugu_baoji_jianmian = $data.readDouble();
         attrInfo.dugu_anqi_jianmian = $data.readDouble();
         attrInfo.dugu_anqi_dikang = $data.readDouble();
         attrInfo.dugu_gongjian_dikang = $data.readDouble();
         attrInfo.dugu_dantian_dikang = $data.readDouble();
         attrInfo.isJiHuoXianTianWuJing = $data.readByte();
         attrInfo.isJiHuoRoutiJinshen = $data.readByte() == 1;
         attrInfo.useWuhundanCount = $data.readShort();
         attrInfo.add2_bj = $data.readInt();
         attrInfo.add2_aq = $data.readInt();
         attrInfo.add2_daq = $data.readInt();
         attrInfo.add2_dgj = $data.readInt();
         attrInfo.add2_ddt = $data.readInt();
         attrInfo.useTianShengNeiliCount = $data.readShort();
         attrInfo.isHuXinYaoJiHuo = $data.readShort() == 1;
         attrInfo.isWuHunShengJiDanJiHuo = $data.readShort() == 1;
         attrInfo.starSta = $data.readShort();
         attrInfo.shenNongBaiChaoDanSta = $data.readShort();
         attrInfo.statusString = $data.readUTF();
         attrInfo.niXiStatus = $data.readShort() == 1;
         attrInfo.qianNengXinFaSta = $data.readInt();
         this.targetCharAttributePlaneMediator.permitFunctions0(pPlayer,$data);
         this.targetCharAttributePlaneMediator.permitFunctions(pPlayer,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1
         ,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,true,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1,$data.readByte() == 1);
         this.targetCharAttributePlaneMediator.permitTianFu($data.readByte() == 1,attrInfo.lv);
         this.targetCharAttributePlaneMediator.permitTengtianyi($data.readByte() == 1,attrInfo.lv);
         attrInfo.isXunzhangDakong = Boolean($data.readByte() == 1);
         attrInfo.lmStatus = $data.readByte() == 1;
         attrInfo.qmStatus = $data.readByte() == 1;
         attrInfo.taoZhuang = $data.readByte() == 1;
         attrInfo.zszlStatus = $data.readByte() == 1;
         avatarInfo.isFeixing = $data.readByte() == 1;
         avatarInfo.isFeixing_huanzhuang_Id = $data.readByte();
         avatarInfo.isFeixing_wuhun_Id = $data.readInt();
         attrInfo.fengHuang = $data.readByte() == 1;
         attrInfo.isHuoHunDanJiHuo = $data.readByte() == 1;
         attrInfo.wuHunShenDan = $data.readInt();
         attrInfo.isLongHunWuPoJiHuo = $data.readByte() == 1;
         attrInfo.longHunShenDan = $data.readInt();
         attrInfo.isShenFuMiJi = $data.readByte() == 1;
         attrInfo.isNeitishenqi = $data.readInt() == 1;
         attrInfo.neitishenqi = $data.readInt();
         attrInfo.prestige_zhizungongxun = $data.readInt();
         attrInfo.prestige_shenshengzhandouli = $data.readInt();
         GameInstance.lookPlayerData.isZhuanSheng = $data.readByte() == 1;
         this.targetCharAttributePlaneMediator.showTargetCharArrtibuteInfo(pPlayer);
      }
      
      public function received_50602(param1:ByteArray) : void
      {
         var reShowShuxing:Function;
         var hasRun:Boolean = false;
         var apd:AvatarParamData = null;
         var failStr:String = null;
         var $data:ByteArray = param1;
         var _buf:ByteArray = $data;
         var tag:int = _buf.readByte();
         if(tag == 1)
         {
            reShowShuxing = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               if(hasRun)
               {
                  return;
               }
               hasRun = true;
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
            };
            ZLog.add("50602： 返回主角加点成功");
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_POINT,"complete");
            hasRun = false;
            PipeManager.sendMsg(PipeConstants.HIDE_ALL_UI_EXCEPT_MAINUI);
            apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_JIADIAN),AvatarPartType.MAGIC);
            apd.extendCallBack(null,null,null,reShowShuxing);
            GameInstance.mainChar.loadAvatarPart(apd);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("恭喜您，潜能点分配成功"));
         }
         else
         {
            failStr = NetWorkManager.readGILMsg(_buf);
            ZLog.add("50602： 返回主角加点失败," + failStr);
            NoticeManager.notify(NoticeManager.ALERT,failStr);
            PipeManager.sendMsg(PipeConstants.CHANGED_MAINCHAR_BASE_ATTR);
         }
      }
      
      public function received_50216(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         ZLog.add("50216： 返回TA的经脉");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ != GameInstance.mainCharData.attributeInfo.spouseID)
         {
            return;
         }
         GameInstance.uiInstance.taJingmaiPanel.setVenationAddValue(_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt());
         GameInstance.uiInstance.taJingmaiPanel.setVenationExpAddValue(_loc2_.readInt(),_loc2_.readDouble());
         var _loc4_:JingmaiInfo = GameInstance.peioPlayerData.jingmaiInfo;
         _loc4_.clear();
         _loc4_.isZhenlong = _loc2_.readByte() == 1;
         var _loc5_:int = _loc2_.readByte();
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = _loc2_.readByte();
            _loc8_ = _loc2_.readShort();
            _loc4_.openXuewei(_loc8_,_loc4_.isZhenlong);
            _loc6_++;
         }
         this.attribute_TaJingmaiPanelMediator.showTaJingmaiInfo(GameInstance.peioPlayerData);
      }
      
      public function received_49992(param1:ByteArray) : void
      {
         ZLog.add("49992： 角色战纹属性更新");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         var _loc12_:int = param1.readInt();
         if(_loc2_ == GameInstance.mainChar.id)
         {
            GameInstance.uiInstance.charAttribute.setZanWenValue(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_);
         }
         else if(_loc2_ == GameInstance.mainCharData.attributeInfo.spouseID)
         {
            GameInstance.uiInstance.teamPanel.setZanWenValue(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_);
            GameInstance.uiInstance.targetAttribute.setZanWenValue(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_);
         }
         else
         {
            GameInstance.uiInstance.targetAttribute.setZanWenValue(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_);
         }
      }
      
      public function received_53702(param1:ByteArray) : void
      {
         ZLog.add("53702：接收激活先天武境成功");
         GameInstance.mainCharData.attributeInfo.isJiHuoXianTianWuJing = 1;
         this.mainCharAttributePlaneMediator.update();
      }
      
      public function received_51968(param1:ByteArray) : void
      {
         ZLog.add("51968：进入或者离开襄阳战场,通知客户端显示或者隐藏按钮");
         var _loc2_:Boolean = param1.readByte() == 1;
         GameInstance.uiInstance.mainUI.showShishizhankuangButton(_loc2_);
         GameInstance.uiInstance.mainUI.showBiGuanButton(!_loc2_);
         if(_loc2_)
         {
            PipeManager.sendMsg(PipeConstants.SHOW_WANFASHIYITU_CLICK);
         }
      }
      
      public function received_51970(param1:ByteArray) : void
      {
         ZLog.add("51970：进入或者离开傲剑争霸战场,通知客户端显示或者隐藏跨服包裹按钮");
         var _loc2_:Boolean = param1.readByte() == 1;
         GameInstance.uiInstance.mainUI.showKuafubaoguoButton(_loc2_);
      }
      
      public function received_57456(param1:ByteArray) : void
      {
         ZLog.add("57456：复仇成功返回消息");
         var _loc2_:int = param1.readInt();
         if(_loc2_ == 1)
         {
            PipeManager.sendMsg(PipeConstants.SHOW_FUCHOU_OK_PANEL);
         }
      }
      
      public function received_57500(param1:ByteArray) : void
      {
         ZLog.add("57500：进入场景是否显示新手玩家向导");
         var _loc2_:Boolean = param1.readByte() == 1;
         var _loc3_:Boolean = param1.readByte() == 1;
         var _loc4_:Boolean = param1.readByte() == 1;
         if(_loc2_)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_CISHA);
         }
         if(_loc3_)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_FUCHOU);
         }
         if(_loc4_)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_GIRL_XINQING_LOW);
         }
      }
      
      public function received_53814(param1:ByteArray) : void
      {
         ZLog.add("53814：总勋章信息返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:Boolean = Boolean(param1.readByte() == 1);
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:Boolean = Boolean(param1.readByte());
         if(_loc2_ == -1)
         {
            this.attribute_xunzhangMediator.setTotalXunzhang(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
            this.attribute_xunzhangMediator.setXunZhangZuoQi(_loc11_);
         }
         else
         {
            this.attribute_TaXunzhangMediator.setTotalXunzhang(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
            this.attribute_TaXunzhangMediator.setXunZhangZuoQi(_loc11_);
         }
      }
      
      public function received_57502(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         ZLog.add("57502\t\t主角激活信息返回");
         var _loc2_:Boolean = Boolean(param1.readByte());
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         if(_loc3_ != -1)
         {
            if(_loc3_ != GameInstance.lookPlayerID)
            {
               return;
            }
            GameState.dictTargetStatus = new Dictionary();
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param1.readInt();
            _loc7_ = param1.readInt();
            if(_loc3_ == -1)
            {
               GameState.dictMainStatus[_loc6_] = _loc7_;
            }
            else
            {
               GameState.dictTargetStatus[_loc6_] = _loc7_;
            }
            switch(_loc6_)
            {
               case 40626:
                  if(_loc3_ == -1)
                  {
                     this.zhanQiMediator.setTotalZhanQi();
                     this.zhanQiMediator.isHuanZ(_loc2_);
                  }
                  else
                  {
                     this.zhanQi_TargetMediator.setTotalZhanQi();
                     this.zhanQi_TargetMediator.isHuanZ(_loc2_);
                  }
                  break;
               case 40757:
                  if(_loc3_ == -1)
                  {
                     GameInstance.mainCharData.attributeInfo.fengHuang = _loc7_;
                  }
                  break;
               case 41983:
                  if(_loc3_ != -1)
                  {
                     if(_loc7_ == 1)
                     {
                     }
                  }
            }
            _loc5_++;
         }
      }
      
      public function received_52352(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Goods = null;
         ZLog.add("52352\t\t设置主角玉佩位置装备");
         GameInstance.mainCharData.attributeInfo.showYuPeiGoodsId = param1.readInt();
         if(GameInstance.mainCharData.attributeInfo.showYuPeiGoodsId <= 0)
         {
            GameInstance.mainCharData.attributeInfo.yupeiID = 0;
            GameInstance.mainCharData.attributeInfo.yuPeiGoodsIDArr = [];
            this.mainCharAttributePlaneMediator.setYuPeiItem();
            return;
         }
         GameInstance.mainCharData.attributeInfo.yuPeiGoodsIDArr = [];
         var _loc2_:int = param1.readInt();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInt();
            _loc5_ = new Goods(_loc4_);
            _loc5_.position = GoodsResManager.getGoodsRes(_loc4_).position;
            _loc5_.roleID = GameInstance.mainChar.id;
            GameInstance.mainCharData.attributeInfo.yuPeiGoodsIDArr.push(_loc5_);
            _loc3_++;
         }
         this.mainCharAttributePlaneMediator.setYuPeiItem();
      }
      
      public function received_52354(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         ZLog.add("52354\t\t返回主角更换对戒等道具面板");
         _loc2_ = param1.readInt();
         _loc2_ = param1.readInt();
         _loc2_ = param1.readInt();
         _loc2_ = param1.readInt();
         var _loc3_:int = param1.readShort();
         this.mainCharAttributePlaneMediator.showTiHuanTips(_loc2_,_loc3_);
      }
   }
}

