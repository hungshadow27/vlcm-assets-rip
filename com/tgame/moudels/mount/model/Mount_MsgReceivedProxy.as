package com.tgame.moudels.mount.model
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.alert.FAlert;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.MountFightStatus;
   import com.tgame.common.staticdata.MountQuality;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.NewPlayerGuideType;
   import com.tgame.common.staticdata.SpeciaAvatarPartID;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.Mount;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.MountSkill;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.FightManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TaskTracker;
   import com.tgame.moudels.login.view.*;
   import com.tgame.moudels.mount.view.Mount_ChangeSuperMount;
   import com.tgame.moudels.mount.view.Mount_ChangeTowSuperMountMediator;
   import com.tgame.moudels.mount.view.Mount_DianFengPlaneMediator;
   import com.tgame.moudels.mount.view.Mount_FengLeiShouPlaneMediator;
   import com.tgame.moudels.mount.view.Mount_JiaohuanMoshouMediator;
   import com.tgame.moudels.mount.view.Mount_MainCharRideFeedPlaneMediator;
   import com.tgame.moudels.mount.view.Mount_MainCharRideMenghuandanMediator;
   import com.tgame.moudels.mount.view.Mount_MainCharRidePlaneMediator;
   import com.tgame.moudels.mount.view.Mount_MainCharRideQiannengdanPanelMediator;
   import com.tgame.moudels.mount.view.Mount_MainCharRideSkillResetPlaneMediator;
   import com.tgame.moudels.mount.view.Mount_MainCharRideYinCangShuXingJihuoPlaneMediator;
   import com.tgame.moudels.mount.view.Mount_MoShouHuHuanMediator;
   import com.tgame.moudels.mount.view.Mount_TargetCharRidePlaneMediator;
   import com.tgame.moudels.mount.view.Mount_XueShouTuiBianPlaneMediator;
   import com.tgame.moudels.mount.view.Mount_YueGuangBaoHePlaneMediator;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.avatar.AvatarPart;
   import com.zcp.engine.graphics.tagger.AttackFace;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.staticdata.RestType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.manager.CDFaceManager;
   import com.zcp.manager.LoaderManager;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Mount_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Mount_MsgReceivedProxy";
      
      private static const GAILV_JISHU:Number = 10000;
      
      private var _isInitMainCharMountList:Boolean = true;
      
      private var _msgSenderProxy:Mount_MsgSenderProxy;
      
      private var _targetCharRidePlaneMediator:Mount_TargetCharRidePlaneMediator;
      
      private var _mainCharRidePlaneMediator:Mount_MainCharRidePlaneMediator;
      
      private var _mainCharRideFeedPlaneMediator:Mount_MainCharRideFeedPlaneMediator;
      
      private var _mainCharRideSkillResetPlaneMediator:Mount_MainCharRideSkillResetPlaneMediator;
      
      private var _mainCharRideYinCangShuXingJihuoPlaneMediator:Mount_MainCharRideYinCangShuXingJihuoPlaneMediator;
      
      private var _mainCharRideMenghuandanPlaneMediator:Mount_MainCharRideMenghuandanMediator;
      
      private var _mainCharRideQiannengdanPanelMediator:Mount_MainCharRideQiannengdanPanelMediator;
      
      private var _superMountMediator:Mount_ChangeSuperMount;
      
      private var _mount_ChangeTowSuperMountMediator:Mount_ChangeTowSuperMountMediator;
      
      private var _mount_moshouHuhuanMediator:Mount_MoShouHuHuanMediator;
      
      private var _mount_jiaohuanMoshouMediator:Mount_JiaohuanMoshouMediator;
      
      private var _yueGuangBaoHePanelMediator:Mount_YueGuangBaoHePlaneMediator;
      
      private var _xueShouTuiBianPanelMediator:Mount_XueShouTuiBianPlaneMediator;
      
      private var _fengLeiShouPlaneMediator:Mount_FengLeiShouPlaneMediator;
      
      private var _dianFengShouPlaneMediator:Mount_DianFengPlaneMediator;
      
      public var spaceMc:MovieClip;
      
      public var timer:Timer;
      
      public function Mount_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get msgSenderProxy() : Mount_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Mount_MsgSenderProxy.NAME) as Mount_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function get targetCharRidePlaneMediator() : Mount_TargetCharRidePlaneMediator
      {
         if(!this._targetCharRidePlaneMediator)
         {
            this._targetCharRidePlaneMediator = facade.retrieveMediator(Mount_TargetCharRidePlaneMediator.NAME) as Mount_TargetCharRidePlaneMediator;
         }
         return this._targetCharRidePlaneMediator;
      }
      
      private function get mainCharRidePlaneMediator() : Mount_MainCharRidePlaneMediator
      {
         if(!this._mainCharRidePlaneMediator)
         {
            this._mainCharRidePlaneMediator = facade.retrieveMediator(Mount_MainCharRidePlaneMediator.NAME) as Mount_MainCharRidePlaneMediator;
         }
         return this._mainCharRidePlaneMediator;
      }
      
      private function get mainCharRideFeedPlaneMediator() : Mount_MainCharRideFeedPlaneMediator
      {
         if(!this._mainCharRideFeedPlaneMediator)
         {
            this._mainCharRideFeedPlaneMediator = facade.retrieveMediator(Mount_MainCharRideFeedPlaneMediator.NAME) as Mount_MainCharRideFeedPlaneMediator;
         }
         return this._mainCharRideFeedPlaneMediator;
      }
      
      private function get mainCharRideSkillResetPlaneMediator() : Mount_MainCharRideSkillResetPlaneMediator
      {
         if(!this._mainCharRideSkillResetPlaneMediator)
         {
            this._mainCharRideSkillResetPlaneMediator = facade.retrieveMediator(Mount_MainCharRideSkillResetPlaneMediator.NAME) as Mount_MainCharRideSkillResetPlaneMediator;
         }
         return this._mainCharRideSkillResetPlaneMediator;
      }
      
      private function get mainCharRideYinCangShuXingJihuoPlaneMediator() : Mount_MainCharRideYinCangShuXingJihuoPlaneMediator
      {
         if(!this._mainCharRideYinCangShuXingJihuoPlaneMediator)
         {
            this._mainCharRideYinCangShuXingJihuoPlaneMediator = facade.retrieveMediator(Mount_MainCharRideYinCangShuXingJihuoPlaneMediator.NAME) as Mount_MainCharRideYinCangShuXingJihuoPlaneMediator;
         }
         return this._mainCharRideYinCangShuXingJihuoPlaneMediator;
      }
      
      private function get mainCharRideMenghuandanPlaneMediator() : Mount_MainCharRideMenghuandanMediator
      {
         if(!this._mainCharRideMenghuandanPlaneMediator)
         {
            this._mainCharRideMenghuandanPlaneMediator = facade.retrieveMediator(Mount_MainCharRideMenghuandanMediator.NAME) as Mount_MainCharRideMenghuandanMediator;
         }
         return this._mainCharRideMenghuandanPlaneMediator;
      }
      
      private function get mainCharRideQiannengdanPanelMediator() : Mount_MainCharRideQiannengdanPanelMediator
      {
         if(!this._mainCharRideQiannengdanPanelMediator)
         {
            this._mainCharRideQiannengdanPanelMediator = facade.retrieveMediator(Mount_MainCharRideQiannengdanPanelMediator.NAME) as Mount_MainCharRideQiannengdanPanelMediator;
         }
         return this._mainCharRideQiannengdanPanelMediator;
      }
      
      private function get superMountMediator() : Mount_ChangeSuperMount
      {
         if(!this._superMountMediator)
         {
            this._superMountMediator = facade.retrieveMediator(Mount_ChangeSuperMount.NAME) as Mount_ChangeSuperMount;
         }
         return this._superMountMediator;
      }
      
      private function get mount_ChangeTowSuperMountMediator() : Mount_ChangeTowSuperMountMediator
      {
         if(!this._mount_ChangeTowSuperMountMediator)
         {
            this._mount_ChangeTowSuperMountMediator = facade.retrieveMediator(Mount_ChangeTowSuperMountMediator.NAME) as Mount_ChangeTowSuperMountMediator;
         }
         return this._mount_ChangeTowSuperMountMediator;
      }
      
      private function get mount_moshouHuhuanMediator() : Mount_MoShouHuHuanMediator
      {
         if(!this._mount_moshouHuhuanMediator)
         {
            this._mount_moshouHuhuanMediator = facade.retrieveMediator(Mount_MoShouHuHuanMediator.NAME) as Mount_MoShouHuHuanMediator;
         }
         return this._mount_moshouHuhuanMediator;
      }
      
      private function get mount_jiaohuanMoshouMediator() : Mount_JiaohuanMoshouMediator
      {
         if(!this._mount_jiaohuanMoshouMediator)
         {
            this._mount_jiaohuanMoshouMediator = facade.retrieveMediator(Mount_JiaohuanMoshouMediator.NAME) as Mount_JiaohuanMoshouMediator;
         }
         return this._mount_jiaohuanMoshouMediator;
      }
      
      private function get yueGuangBaoHePanelMediator() : Mount_YueGuangBaoHePlaneMediator
      {
         if(!this._yueGuangBaoHePanelMediator)
         {
            this._yueGuangBaoHePanelMediator = facade.retrieveMediator(Mount_YueGuangBaoHePlaneMediator.NAME) as Mount_YueGuangBaoHePlaneMediator;
         }
         return this._yueGuangBaoHePanelMediator;
      }
      
      private function get xueShouTuiBianPanelMediator() : Mount_XueShouTuiBianPlaneMediator
      {
         if(!this._xueShouTuiBianPanelMediator)
         {
            this._xueShouTuiBianPanelMediator = facade.retrieveMediator(Mount_XueShouTuiBianPlaneMediator.NAME) as Mount_XueShouTuiBianPlaneMediator;
         }
         return this._xueShouTuiBianPanelMediator;
      }
      
      private function get fengLeiShouPlaneMediator() : Mount_FengLeiShouPlaneMediator
      {
         if(!this._fengLeiShouPlaneMediator)
         {
            this._fengLeiShouPlaneMediator = facade.retrieveMediator(Mount_FengLeiShouPlaneMediator.NAME) as Mount_FengLeiShouPlaneMediator;
         }
         return this._fengLeiShouPlaneMediator;
      }
      
      private function get dianFengPlaneMediator() : Mount_DianFengPlaneMediator
      {
         if(!this._dianFengShouPlaneMediator)
         {
            this._dianFengShouPlaneMediator = facade.retrieveMediator(Mount_DianFengPlaneMediator.NAME) as Mount_DianFengPlaneMediator;
         }
         return this._dianFengShouPlaneMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([50030,50032,50048,50034,50036,50038,50040,50042,50044,50046,50050,50010,50008,50012,50014,50016,50018,50020,50022,50024,50026,50060,50028,52064,52066,52068,52070,52072,52074,52076,52078,52080,52082,52062,52084,52086,52088,52090,52092,52094,52096,52098,52032,52034,52040,60602,60604,60606,60608,60610,60612,60652,60654,60656,50056,60682,60684,60662,60686,60688,74102,74106,74152,74154,74160],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([50030,50032,50048,50034,50036,50038,50040,50042,50044,50046,50050,50010,50008,50012,50014,50016,50018,50020,50022,50024,50026,50060,50028,52064,52066,52068,52070,52072,52074,52076,52078,52080,52082,52062,52084,52086,52088,52090,52092,52094,52096,52098,52032,52034,52040,60602,60604,60606,60608,60610,60612,60652,60654,60656,50056,60682,60684,60662,60686,60688,74102,74106,74152,74154,74160],NAME);
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
      
      public function received_50010(param1:ByteArray) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:SceneCharacter = null;
         ZLog.add("50010：收到坐骑活力值变化");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = param1.readShort();
         var _loc6_:PureMount = GameInstance.mainCharData.mountInfo.getMount(_loc3_);
         if(_loc6_ != null)
         {
            _loc7_ = _loc6_.mountAttributeInfo.energyNow;
            _loc8_ = _loc4_ - _loc7_;
            _loc6_.mountAttributeInfo.energyNow = _loc4_;
            if(_loc3_ == GameInstance.mainCharData.mountInfo.selectedMountID)
            {
               this.mainCharRidePlaneMediator.setRideInfo(_loc6_,_loc5_);
            }
            if(_loc3_ == GameInstance.mainCharData.mountInfo.currentMountID && _loc8_ != 0)
            {
               GameInstance.mainChar.showAttackFace(AttackFace.CHANGE_ENERGY,_loc8_);
            }
            else if(_loc3_ == GameInstance.mainCharData.mountInfo.currentFightMountID)
            {
               _loc9_ = GameInstance.scene.getCharByID(_loc3_,SceneCharacterType.MOUNT);
               if(_loc9_ != null)
               {
                  _loc9_.showAttackFace(AttackFace.CHANGE_ENERGY,_loc8_);
               }
            }
         }
      }
      
      public function received_50008(param1:ByteArray) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Mount = null;
         var _loc11_:AvatarParamData = null;
         ZLog.add("50008： 收到坐骑升级");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:int = param1.readShort();
         if(GameInstance.mainCharData.attributeInfo.lv < 20)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_RIDE_LV);
         }
         var _loc6_:PureMount = GameInstance.mainCharData.mountInfo.getMount(_loc3_);
         if(_loc6_ != null)
         {
            _loc8_ = _loc6_.mountAttributeInfo.lv;
            _loc9_ = _loc8_ - _loc4_;
            _loc6_.mountAttributeInfo.lv = _loc4_;
            if(_loc3_ == GameInstance.mainCharData.mountInfo.selectedMountID)
            {
               this.mainCharRidePlaneMediator.setRideInfo(_loc6_,_loc5_);
               this.mainCharRidePlaneMediator.superMountLvUp();
            }
         }
         var _loc7_:SceneCharacter = GameInstance.scene.getCharByID(_loc3_,SceneCharacterType.MOUNT);
         if(_loc7_ != null)
         {
            _loc10_ = _loc7_.data as Mount;
            if(_loc10_ != null)
            {
               _loc8_ = _loc10_.mountAttributeInfo.lv;
               _loc9_ = _loc8_ - _loc4_;
               _loc10_.mountAttributeInfo.lv = _loc4_;
            }
            _loc11_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_LEVEL_UP),AvatarPartType.MAGIC);
            _loc7_.loadAvatarPart(_loc11_);
            NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide18);
         }
      }
      
      public function received_50030(param1:ByteArray) : void
      {
         var _loc4_:PureMount = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:String = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         ZLog.add("50030：收到坐骑列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:Array = [];
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readByte();
         var _loc7_:int = _loc2_.readByte();
         var _loc8_:int = _loc2_.readByte();
         _loc9_ = 0;
         while(_loc9_ < _loc8_)
         {
            _loc10_ = _loc2_.readInt();
            _loc11_ = _loc2_.readInt();
            _loc12_ = _loc2_.readUTF();
            _loc13_ = _loc2_.readShort();
            _loc14_ = _loc2_.readByte();
            _loc15_ = _loc2_.readByte();
            _loc18_ = _loc2_.readByte();
            if(_loc18_ == 1)
            {
               _loc18_ = _loc2_.readByte();
            }
            if(_loc6_ == 4)
            {
               _loc16_ = _loc2_.readInt();
               _loc17_ = _loc2_.readInt();
            }
            _loc19_ = _loc2_.readByte();
            _loc20_ = _loc2_.readInt();
            _loc21_ = _loc2_.readShort();
            _loc22_ = _loc2_.readInt();
            _loc23_ = _loc2_.readInt();
            _loc24_ = _loc2_.readInt();
            _loc25_ = _loc2_.readInt();
            _loc4_ = new PureMount(_loc11_);
            _loc4_.id = _loc10_;
            _loc4_.name = _loc12_;
            _loc4_.mountAttributeInfo.lv = _loc13_;
            _loc4_.mountAttributeInfo.superMountType = _loc18_;
            _loc4_.fightStatus = _loc14_;
            _loc4_.mountAttributeInfo.quality = _loc15_;
            _loc4_.saleCopper = _loc16_;
            _loc4_.saleGold = _loc17_;
            _loc4_.mountAttributeInfo.bloodS = _loc19_;
            _loc4_.mountAttributeInfo.savvy = _loc20_;
            _loc4_.mountAttributeInfo.ycsx = _loc21_;
            _loc4_.mountAttributeInfo.zw1 = _loc22_;
            _loc4_.mountAttributeInfo.zw2 = _loc23_;
            _loc4_.mountAttributeInfo.zw3 = _loc24_;
            _loc4_.mountAttributeInfo.zw4 = _loc25_;
            _loc3_.push(_loc4_);
            _loc9_++;
         }
         if(_loc5_ == GameInstance.mainChar.id)
         {
            if(_loc6_ == 2)
            {
               GameInstance.mainCharData.mountInfo.init(_loc3_);
               PipeManager.sendMsg(PipeConstants.UPDATE_MOUNT_BAG);
               this.mainCharRidePlaneMediator.setRideList(_loc7_,_loc8_,_loc3_);
               if(this._isInitMainCharMountList)
               {
                  this._isInitMainCharMountList = false;
                  if(GameInstance.mainCharData.mountInfo.currentFightMountID != -1)
                  {
                     this.msgSenderProxy.send_50031([GameInstance.mainChar.id,GameInstance.mainCharData.mountInfo.currentFightMountID]);
                  }
                  if(GameInstance.mainCharData.mountInfo.currentMountID != -1)
                  {
                     this.msgSenderProxy.send_50031([GameInstance.mainChar.id,GameInstance.mainCharData.mountInfo.currentMountID]);
                  }
               }
               TaskTracker.updateTaskUI();
               if(GameInstance.uiInstance._changeSuperMount1)
               {
                  this.mount_ChangeTowSuperMountMediator.setMountList(_loc3_);
               }
            }
            else if(_loc6_ == 3)
            {
               GameInstance.mainCharData.mountInfo.initDepot(_loc3_);
               PipeManager.sendMsg(PipeConstants.UPDATE_MOUNT_DEPOT);
            }
            else if(_loc6_ == 4)
            {
               GameInstance.mainCharData.mountInfo.initShop(_loc3_);
               PipeManager.sendMsg(PipeConstants.UPDATE_MOUNT_SHOP);
            }
            else if(_loc6_ == 5)
            {
               this.superMountMediator.setMountList(_loc3_);
               GameInstance.mainCharData.mountInfo.init(_loc3_);
               PipeManager.sendMsg(PipeConstants.UPDATE_MOUNT_BAG);
               TaskTracker.updateTaskUI();
               if(Fun.isVisible(GameInstance.uiInstance._ridePanel))
               {
                  this.mainCharRidePlaneMediator.setRideList(_loc7_,_loc8_,_loc3_);
               }
            }
            else if(_loc6_ == 6)
            {
               this.mount_ChangeTowSuperMountMediator.setMountList(_loc3_);
               GameInstance.mainCharData.mountInfo.init(_loc3_);
               PipeManager.sendMsg(PipeConstants.UPDATE_MOUNT_BAG);
               TaskTracker.updateTaskUI();
               if(Fun.isVisible(GameInstance.uiInstance._ridePanel))
               {
                  this.mainCharRidePlaneMediator.setRideList(_loc7_,_loc8_,_loc3_);
               }
            }
            else if(_loc6_ == 7)
            {
               this.mount_jiaohuanMoshouMediator.setMountList(_loc3_);
               GameInstance.mainCharData.mountInfo.init(_loc3_);
               PipeManager.sendMsg(PipeConstants.UPDATE_MOUNT_BAG);
               TaskTracker.updateTaskUI();
               if(Fun.isVisible(GameInstance.uiInstance._ridePanel))
               {
                  this.mainCharRidePlaneMediator.setRideList(_loc7_,_loc8_,_loc3_);
               }
            }
            else if(_loc6_ == 8)
            {
               this.mount_moshouHuhuanMediator.setMountList(_loc3_);
               GameInstance.mainCharData.mountInfo.init(_loc3_);
               PipeManager.sendMsg(PipeConstants.UPDATE_MOUNT_BAG);
               TaskTracker.updateTaskUI();
               if(Fun.isVisible(GameInstance.uiInstance._ridePanel))
               {
                  this.mainCharRidePlaneMediator.setRideList(_loc7_,_loc8_,_loc3_);
               }
            }
         }
         if(GameInstance.lookPlayerID != -1 && _loc5_ == GameInstance.lookPlayerID)
         {
            if(_loc6_ == 2)
            {
               GameInstance.lookPlayerData.mountInfo.init(_loc3_);
            }
            GameInstance.lookPlayerData.mountInfo.selectedMountID = -1;
            GameInstance.lookPlayerData.mountInfo.init(_loc3_);
            this.targetCharRidePlaneMediator.setRideList(_loc7_,_loc8_,_loc3_);
         }
      }
      
      public function received_50032(param1:ByteArray) : void
      {
         var _loc4_:PureMount = null;
         var _loc7_:Goods = null;
         var _loc8_:int = 0;
         var _loc11_:MountSkill = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         ZLog.add("50032：收到单个坐骑详细信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         if(_loc2_ == GameInstance.mainChar.id)
         {
            _loc4_ = GameInstance.mainCharData.mountInfo.getMount(_loc3_);
         }
         if(GameInstance.lookPlayerID != -1 && _loc2_ == GameInstance.lookPlayerID)
         {
            if(_loc2_ != GameInstance.mainChar.id)
            {
               if(_loc3_ != GameInstance.lookPlayerData.mountInfo.selectedMountID)
               {
                  return;
               }
            }
            _loc4_ = GameInstance.lookPlayerData.mountInfo.getMount(_loc3_);
         }
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.name = param1.readUTF();
         _loc4_.mountAttributeInfo.menghuan = param1.readInt() / 10000;
         _loc4_.mountAttributeInfo.menghuan_wuxing = param1.readInt() / 10000;
         _loc4_.mountAttributeInfo.menghuan_jineng = param1.readInt() / 10000;
         _loc4_.mountAttributeInfo.menghuan_qianli = param1.readInt() / 10000;
         _loc4_.mountAttributeInfo.menghuan_mhd = param1.readInt();
         _loc4_.mountAttributeInfo.quality = param1.readByte();
         _loc4_.mountAttributeInfo.savvy = param1.readInt();
         _loc4_.mountAttributeInfo.identity = param1.readInt();
         _loc4_.mountAttributeInfo.lv = param1.readShort();
         _loc4_.mountAttributeInfo.expNow = param1.readDouble();
         _loc4_.mountAttributeInfo.expMax = param1.readDouble();
         _loc4_.mountAttributeInfo.energyNow = param1.readInt();
         _loc4_.mountAttributeInfo.energyMax = param1.readInt();
         _loc4_.mountAttributeInfo.fightNow = param1.readInt();
         _loc4_.mountAttributeInfo.fightMax = param1.readInt();
         _loc4_.mountAttributeInfo.points_attackNow = param1.readInt();
         _loc4_.mountAttributeInfo.points_attackMin = param1.readInt();
         _loc4_.mountAttributeInfo.points_attackMax = param1.readInt();
         _loc4_.mountAttributeInfo.points_attackFujia = param1.readInt();
         _loc4_.mountAttributeInfo.points_defenceNow = param1.readInt();
         _loc4_.mountAttributeInfo.points_defenceMin = param1.readInt();
         _loc4_.mountAttributeInfo.points_defenceMax = param1.readInt();
         _loc4_.mountAttributeInfo.points_defenceFujia = param1.readInt();
         _loc4_.mountAttributeInfo.points_stongNow = param1.readInt();
         _loc4_.mountAttributeInfo.points_stongMin = param1.readInt();
         _loc4_.mountAttributeInfo.points_stongMax = param1.readInt();
         _loc4_.mountAttributeInfo.points_stongFujia = param1.readInt();
         _loc4_.mountAttributeInfo.points_flyNow = param1.readInt();
         _loc4_.mountAttributeInfo.points_flyMin = param1.readInt();
         _loc4_.mountAttributeInfo.points_flyMax = param1.readInt();
         _loc4_.mountAttributeInfo.points_flyFujia = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:Array = [];
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            _loc16_ = param1.readInt();
            _loc17_ = param1.readShort();
            _loc7_ = new Goods(_loc16_,_loc17_);
            _loc7_.roleID = _loc2_;
            _loc7_.mountID = _loc3_;
            _loc7_.strengthen_grade = param1.readByte();
            _loc7_.quality = param1.readByte();
            _loc7_.isFullStar = param1.readByte();
            _loc7_.isBaoshiTOP = param1.readByte();
            if(_loc4_.mountAttributeInfo.lv < _loc7_.res.limit_grade)
            {
               _loc7_.enabled = false;
            }
            else
            {
               _loc7_.enabled = true;
            }
            _loc6_.push(_loc7_);
            _loc8_++;
         }
         _loc4_.mountGoodsInfo.goodsBagArr = _loc6_;
         var _loc9_:int = param1.readByte();
         var _loc10_:Object = {};
         var _loc12_:* = int(ItemPositionRange.MOUNT_QUICK_BAR_RANGE.x);
         _loc8_ = 0;
         while(_loc8_ < _loc9_)
         {
            _loc18_ = param1.readInt();
            _loc19_ = param1.readInt();
            _loc20_ = _loc8_ + 1;
            _loc11_ = new MountSkill(_loc18_,_loc20_);
            _loc11_.lv = param1.readShort();
            _loc11_.nowLvJianChengStr = param1.readUTF();
            _loc11_.nextLvUpUseZhenQi = param1.readShort();
            _loc11_.nextLvUpUseCopper = param1.readInt();
            _loc11_.nextLvJianChengStr = param1.readUTF();
            if(_loc11_.res.useway == 1)
            {
               _loc11_.quickbarindex = _loc12_++;
            }
            _loc11_.isLearn = 1;
            _loc10_[_loc11_.id] = _loc11_;
            if(_loc2_ == GameInstance.mainChar.id)
            {
               if(_loc19_ > 0)
               {
                  CDFaceManager.cdPlay(_loc11_.getID1(_loc3_),_loc11_.getCoolingtime1(_loc4_.res.attack_interval),_loc11_.getCoolingtime1(_loc4_.res.attack_interval) - _loc19_,0,0,[]);
               }
            }
            _loc8_++;
         }
         _loc4_.mountSkillInfo.skillObj = _loc10_;
         _loc4_.mountAttributeInfo.append_hp = param1.readDouble();
         _loc4_.mountAttributeInfo.append_mp = param1.readDouble();
         _loc4_.mountAttributeInfo.append_pp = param1.readDouble();
         _loc4_.mountAttributeInfo.append_ap = param1.readDouble();
         _loc4_.mountAttributeInfo.append_dp = param1.readDouble();
         _loc4_.mountAttributeInfo.append_cp = param1.readDouble();
         _loc4_.mountAttributeInfo.append_ev = param1.readDouble();
         _loc4_.mountAttributeInfo.append_adx = param1.readDouble();
         _loc4_.mountAttributeInfo.append_mdx = param1.readDouble();
         _loc4_.mountAttributeInfo.menghuan_append_hp = param1.readDouble();
         _loc4_.mountAttributeInfo.menghuan_append_mp = param1.readDouble();
         _loc4_.mountAttributeInfo.menghuan_append_pp = param1.readDouble();
         _loc4_.mountAttributeInfo.menghuan_append_ap = param1.readDouble();
         _loc4_.mountAttributeInfo.menghuan_append_dp = param1.readDouble();
         _loc4_.mountAttributeInfo.menghuan_append_cp = param1.readDouble();
         _loc4_.mountAttributeInfo.menghuan_append_ev = param1.readDouble();
         _loc4_.mountAttributeInfo.menghuan_append_adx = param1.readDouble();
         _loc4_.mountAttributeInfo.menghuan_append_mdx = param1.readDouble();
         var _loc13_:int = param1.readByte();
         if(_loc13_ == 1)
         {
            _loc4_.mountAttributeInfo.superMountType = param1.readByte();
            _loc4_.mountAttributeInfo.superMpunt_hp = param1.readDouble();
            _loc4_.mountAttributeInfo.superMpunt_mp = param1.readDouble();
            _loc4_.mountAttributeInfo.superMpunt_pp = param1.readDouble();
            _loc4_.mountAttributeInfo.superMpunt_ap = param1.readDouble();
            _loc4_.mountAttributeInfo.superMpunt_dp = param1.readDouble();
            _loc4_.mountAttributeInfo.superMpunt_cp = param1.readDouble();
            _loc4_.mountAttributeInfo.superMpunt_ev = param1.readDouble();
            _loc4_.mountAttributeInfo.superMpunt_adx = param1.readInt();
            _loc4_.mountAttributeInfo.superMpunt_mdx = param1.readInt();
         }
         _loc4_.mountAttributeInfo.mainSkillID = param1.readInt();
         _loc4_.mountAttributeInfo.setMountZuHeSkillArr(param1.readUTF());
         _loc4_.mountAttributeInfo.nextMountName = param1.readUTF();
         _loc4_.mountAttributeInfo.nextMountZuhejiRL = param1.readByte();
         var _loc14_:int = param1.readShort();
         _loc4_.mountAttributeInfo.menghuanShendanJihuo = param1.readByte();
         _loc4_.mountAttributeInfo.isLong = Boolean(param1.readByte() == 1);
         _loc4_.mountAttributeInfo.shouwangzhihunJihuo = Boolean(param1.readByte() == 1);
         _loc4_.mountAttributeInfo.shouYuanCount = param1.readByte();
         _loc4_.mountAttributeInfo.souyuan_hp = param1.readDouble();
         _loc4_.mountAttributeInfo.souyuan_mp = param1.readDouble();
         _loc4_.mountAttributeInfo.souyuan_pp = param1.readDouble();
         _loc4_.mountAttributeInfo.souyuan_ap = param1.readDouble();
         _loc4_.mountAttributeInfo.souyuan_dp = param1.readDouble();
         _loc4_.mountAttributeInfo.souyuan_cp = param1.readDouble();
         _loc4_.mountAttributeInfo.souyuan_ev = param1.readDouble();
         _loc4_.mountAttributeInfo.chaojizuoqiQianNengDan = param1.readInt();
         _loc4_.mountAttributeInfo.zhongjizuoqiQianNengDan = param1.readInt();
         _loc4_.mountAttributeInfo.shoushenDan = param1.readInt();
         _loc4_.mountAttributeInfo.dianfengqiannengDan = param1.readInt();
         var _loc15_:String = param1.readUTF();
         if(_loc2_ == GameInstance.mainChar.id)
         {
            if(_loc3_ == GameInstance.mainCharData.mountInfo.selectedMountID)
            {
               this.mainCharRidePlaneMediator.setRideInfo(_loc4_,_loc14_,_loc15_);
            }
            if(_loc3_ == GameInstance.mainCharData.mountInfo.currentFightMountID)
            {
               PipeManager.sendMsg(PipeConstants.UPDATA_MOUNT_SKILL,_loc4_.mountSkillInfo.getWuGong2());
               ExchangePositionManager.setRideMainSkill(_loc4_.mountAttributeInfo.mainSkillID);
               PipeManager.sendMsg(PipeConstants.UPDATE_AFK_CONFIG,[2,_loc4_]);
            }
         }
         if(GameInstance.lookPlayerID != -1 && _loc2_ == GameInstance.lookPlayerID)
         {
            if(_loc3_ == GameInstance.lookPlayerData.mountInfo.selectedMountID)
            {
               this.targetCharRidePlaneMediator.setRideInfo(_loc4_,_loc14_,_loc15_);
            }
         }
      }
      
      public function received_50050(param1:ByteArray) : void
      {
         var _loc5_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            if(_loc3_ == 1)
            {
               ZLog.add("50050：增加槽位成功");
               this.msgSenderProxy.send_50029([GameInstance.mainChar.id,2]);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"增加槽位成功"),false);
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"增加槽位成功"),false);
            }
            else if(_loc3_ == 2)
            {
               ZLog.add("50050：增加槽位成功");
               PipeManager.sendMsg(PipeConstants.ADD_AND_UPDATE_MOUNT_BAG);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"增加槽位成功"),false);
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"增加槽位成功"),false);
            }
         }
         else
         {
            _loc5_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("50050：增加槽位失败," + _loc5_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc5_);
            NoticeManager.notify(NoticeManager.FOOT,_loc5_);
         }
      }
      
      public function received_50048(param1:ByteArray) : void
      {
         ZLog.add("50048： 收到上马延时");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         SmallLoadingBar.showLoading(LanResManager.getLanTextWords(this,"正在骑乘"),_loc4_ * 1000);
      }
      
      public function received_50034(param1:ByteArray) : void
      {
         var _loc5_:PureMount = null;
         var _loc6_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            ZLog.add("50034：上马成功");
            GameInstance.mainCharData.mountInfo.setMountFightStatus(_loc3_,MountFightStatus.RIDE);
            this.mainCharRidePlaneMediator.refreshRideList();
            if(_loc3_ == GameInstance.mainCharData.mountInfo.selectedMountID)
            {
               this.mainCharRidePlaneMediator.swapBtnLabel(MountFightStatus.RIDE);
            }
            _loc5_ = GameInstance.mainCharData.mountInfo.currentMount;
            if(_loc5_)
            {
               this.msgSenderProxy.send_50031([GameInstance.mainChar.id,_loc3_]);
            }
            NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide17);
            SmallLoadingBar.close();
            if(GameInstance.mainCharData.mountInfo.selectedMountID == _loc3_)
            {
               if(this.mainCharRidePlaneMediator._plane_type != 10)
               {
                  this.mainCharRidePlaneMediator.hideFeedPanel();
               }
               return;
            }
            TaskTracker.updateTaskUI();
         }
         else
         {
            _loc6_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("50034：上马失败," + _loc6_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc6_);
            NoticeManager.notify(NoticeManager.FOOT,_loc6_);
            SmallLoadingBar.close();
         }
      }
      
      public function received_50036(param1:ByteArray) : void
      {
         var _loc5_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            ZLog.add("50036：下马成功");
            GameInstance.mainCharData.mountInfo.setMountFightStatus(_loc3_,MountFightStatus.REST);
            this.mainCharRidePlaneMediator.refreshRideList();
            if(_loc3_ == GameInstance.mainCharData.mountInfo.selectedMountID)
            {
               this.mainCharRidePlaneMediator.swapBtnLabel(MountFightStatus.REST);
            }
            TaskTracker.updateTaskUI();
         }
         else
         {
            _loc5_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("50036：下马失败," + _loc5_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc5_);
            NoticeManager.notify(NoticeManager.FOOT,_loc5_);
         }
      }
      
      public function received_50038(param1:ByteArray) : void
      {
         var _loc5_:PureMount = null;
         var _loc6_:SceneCharacter = null;
         var _loc7_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            ZLog.add("50038：坐骑展示成功");
            GameInstance.mainCharData.mountInfo.setMountFightStatus(_loc3_,MountFightStatus.SHOW);
            this.mainCharRidePlaneMediator.refreshRideList();
            if(_loc3_ == GameInstance.mainCharData.mountInfo.selectedMountID)
            {
               this.mainCharRidePlaneMediator.swapBtnLabel(MountFightStatus.SHOW);
            }
            _loc5_ = GameInstance.mainCharData.mountInfo.currentFightMount;
            if(_loc5_)
            {
               PipeManager.sendMsg(PipeConstants.UPDATA_MOUNT_SKILL,_loc5_.mountSkillInfo.getWuGong2());
               this.msgSenderProxy.send_50031([GameInstance.mainChar.id,_loc3_]);
            }
            _loc6_ = GameInstance.scene.getCharByID(GameInstance.mainCharData.mountInfo.currentFightMountID,SceneCharacterType.MOUNT);
            if(_loc6_ != null)
            {
               _loc6_.avatar.visible = true;
               if(_loc6_.useContainer)
               {
                  _loc6_.showContainer.showAttackFaceContainer();
                  _loc6_.showContainer.showCustomFaceContainer();
               }
            }
            TaskTracker.updateTaskUI();
         }
         else
         {
            _loc7_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("50038：坐骑展示失败," + _loc7_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc7_);
            NoticeManager.notify(NoticeManager.FOOT,_loc7_);
         }
      }
      
      public function received_50040(param1:ByteArray) : void
      {
         var _loc5_:PureMount = null;
         var _loc6_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            ZLog.add("50040：坐骑收起成功");
            _loc5_ = GameInstance.mainCharData.mountInfo.currentFightMount;
            if(_loc5_)
            {
               PipeManager.sendMsg(PipeConstants.UPDATA_MOUNT_SKILL,[]);
               PipeManager.sendMsg(PipeConstants.UPDATE_AFK_CONFIG,[2,[]]);
            }
            GameInstance.mainCharData.mountInfo.setMountFightStatus(_loc3_,MountFightStatus.REST);
            this.mainCharRidePlaneMediator.refreshRideList();
            if(_loc3_ == GameInstance.mainCharData.mountInfo.selectedMountID)
            {
               this.mainCharRidePlaneMediator.swapBtnLabel(MountFightStatus.REST);
            }
            TaskTracker.updateTaskUI();
         }
         else
         {
            _loc6_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("50040：坐骑收起失败," + _loc6_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc6_);
            NoticeManager.notify(NoticeManager.FOOT,_loc6_);
         }
      }
      
      public function received_50042(param1:ByteArray) : void
      {
         var _loc5_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            ZLog.add("50042：坐骑放生成功");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"坐骑放生成功"),false);
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"坐骑放生成功"),false);
            this.msgSenderProxy.send_50029([GameInstance.mainChar.id,2]);
         }
         else
         {
            _loc5_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("50042：坐骑放生失败," + _loc5_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc5_);
            NoticeManager.notify(NoticeManager.FOOT,_loc5_);
         }
      }
      
      public function received_50044(param1:ByteArray) : void
      {
         ZLog.add("50044： 坐骑捕获延时");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         SmallLoadingBar.showLoading(LanResManager.getLanTextWords(this,"正在捕获"),_loc4_ * 1000);
      }
      
      public function received_50046(param1:ByteArray) : void
      {
         var _loc5_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            ZLog.add("50046：坐骑捕获成功");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"坐骑捕获成功"),false);
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"坐骑捕获成功"),false);
            this.msgSenderProxy.send_50029([GameInstance.mainChar.id,2]);
            NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide17);
            SmallLoadingBar.close();
         }
         else
         {
            _loc5_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("50046：坐骑捕获失败," + _loc5_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc5_);
            NoticeManager.notify(NoticeManager.FOOT,_loc5_);
            SmallLoadingBar.close();
         }
      }
      
      public function received_50012(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:String = NetWorkManager.readGILMsg(_loc2_);
         ZLog.add("50012：坐骑驯养面板请求失败,原因：" + _loc5_);
      }
      
      public function received_50014(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:Number = NaN;
         var _loc17_:Goods = null;
         var _loc18_:Boolean = false;
         var _loc19_:Goods = null;
         var _loc20_:PureMount = null;
         var _loc21_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ != GameInstance.mainCharData.mountInfo.selectedMountID)
         {
            return;
         }
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            ZLog.add("50014：返回提升坐骑品质界面数据");
            _loc5_ = _loc2_.readShort();
            _loc6_ = _loc2_.readByte();
            _loc7_ = _loc2_.readInt();
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readInt();
            _loc10_ = _loc2_.readInt();
            _loc11_ = _loc2_.readInt();
            _loc12_ = _loc2_.readInt();
            _loc13_ = _loc2_.readInt();
            _loc14_ = _loc2_.readInt();
            _loc15_ = _loc2_.readInt();
            _loc16_ = _loc2_.readShort() / GAILV_JISHU;
            _loc17_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.ZIZHIDAN_ID,true);
            _loc18_ = _loc17_.count >= _loc5_;
            _loc17_.count = _loc5_;
            _loc19_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
            _loc20_ = GameInstance.mainCharData.mountInfo.selectedMount;
            this.mainCharRidePlaneMediator.showStrengthenEnergyQuality(_loc20_.mountAttributeInfo.getQualityName(),MountQuality.getName(_loc6_),_loc20_.mountAttributeInfo.points_attackNow,_loc7_ + "-" + _loc8_,_loc20_.mountAttributeInfo.points_defenceNow,_loc9_ + "-" + _loc10_,_loc20_.mountAttributeInfo.points_flyNow,_loc11_ + "-" + _loc12_,_loc20_.mountAttributeInfo.points_stongNow,_loc13_ + "-" + _loc14_,_loc15_,_loc16_ * 100,_loc17_,_loc19_,_loc18_);
            this.mainCharRidePlaneMediator.showFeedPanel();
         }
         else
         {
            _loc21_ = NetWorkManager.readGILMsg(_loc2_);
            this.mainCharRidePlaneMediator.showRideStrengthen();
            ZLog.add("50014：返回提升坐骑品质界面数据。失败,原因" + _loc21_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc21_);
            NoticeManager.notify(NoticeManager.FOOT,_loc21_);
         }
      }
      
      public function received_50016(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Goods = null;
         var _loc11_:Boolean = false;
         var _loc12_:Goods = null;
         var _loc13_:PureMount = null;
         var _loc14_:Object = null;
         var _loc15_:Array = null;
         var _loc16_:Array = null;
         var _loc17_:String = null;
         var _loc18_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ != GameInstance.mainCharData.mountInfo.selectedMountID)
         {
            return;
         }
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            ZLog.add("50016：返回提升坐骑悟性界面数据");
            _loc5_ = _loc2_.readShort();
            _loc6_ = _loc2_.readInt();
            _loc7_ = _loc2_.readUTF();
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readShort() / GAILV_JISHU;
            _loc10_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.ZIZHIDAN_ID,true);
            _loc11_ = _loc10_.count >= _loc5_;
            _loc10_.count = _loc5_;
            _loc12_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
            _loc13_ = GameInstance.mainCharData.mountInfo.selectedMount;
            _loc14_ = _loc13_.mountSkillInfo.skillObj;
            _loc15_ = [];
            _loc16_ = _loc7_.split(",");
            for each(_loc17_ in _loc16_)
            {
               if(_loc17_ != "")
               {
                  _loc15_.push(new Skill(parseInt(_loc17_)));
               }
            }
            this.mainCharRidePlaneMediator.showFeedPanel();
            this.mainCharRidePlaneMediator.showStrengthenEnergySavvy(String(_loc13_.mountAttributeInfo.savvy),String(_loc6_),_loc14_,_loc15_,_loc8_,_loc9_ * 100,_loc10_,_loc12_,_loc11_);
         }
         else
         {
            _loc18_ = NetWorkManager.readGILMsg(_loc2_);
            this.mainCharRidePlaneMediator.showRideStrengthen();
            ZLog.add("50016：返回提升坐骑悟性界面数据。失败,原因" + _loc18_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc18_);
            NoticeManager.notify(NoticeManager.FOOT,_loc18_);
         }
      }
      
      public function received_50018(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Goods = null;
         var _loc10_:Boolean = false;
         var _loc11_:Goods = null;
         var _loc12_:PureMount = null;
         var _loc13_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ != GameInstance.mainCharData.mountInfo.selectedMountID)
         {
            return;
         }
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            ZLog.add("50018：返回提升坐骑攻击潜力界面数据");
            _loc5_ = _loc2_.readShort();
            _loc6_ = _loc2_.readDouble();
            _loc7_ = _loc2_.readInt();
            _loc8_ = _loc2_.readShort() / GAILV_JISHU;
            _loc9_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.ZIZHIDAN_ID,true);
            _loc10_ = _loc9_.count >= _loc5_;
            _loc9_.count = _loc5_;
            _loc11_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
            _loc12_ = GameInstance.mainCharData.mountInfo.selectedMount;
            this.mainCharRidePlaneMediator.setMoney(_loc7_,_loc8_ * 100);
            this.mainCharRidePlaneMediator.showStrengthenEnergyAttack(String(_loc12_.mountAttributeInfo.points_attackNow),String(_loc12_.mountAttributeInfo.points_attackMax),String(_loc12_.mountAttributeInfo.append_ap),String(_loc6_),_loc7_,_loc8_ * 100,_loc9_,_loc11_,_loc10_);
            this.mainCharRidePlaneMediator.showFeedPanel();
         }
         else
         {
            _loc13_ = NetWorkManager.readGILMsg(_loc2_);
            this.mainCharRidePlaneMediator.showRideStrengthen();
            ZLog.add("50018：返回提升坐骑攻击潜力界面数据。失败,原因" + _loc13_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc13_);
            NoticeManager.notify(NoticeManager.FOOT,_loc13_);
         }
      }
      
      public function received_50020(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Goods = null;
         var _loc10_:Boolean = false;
         var _loc11_:Goods = null;
         var _loc12_:PureMount = null;
         var _loc13_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ != GameInstance.mainCharData.mountInfo.selectedMountID)
         {
            return;
         }
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            ZLog.add("50020：返回提升坐骑防御潜力界面数据");
            _loc5_ = _loc2_.readShort();
            _loc6_ = _loc2_.readDouble();
            _loc7_ = _loc2_.readInt();
            _loc8_ = _loc2_.readShort() / GAILV_JISHU;
            _loc9_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.ZIZHIDAN_ID,true);
            _loc10_ = _loc9_.count >= _loc5_;
            _loc9_.count = _loc5_;
            _loc11_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
            _loc12_ = GameInstance.mainCharData.mountInfo.selectedMount;
            this.mainCharRidePlaneMediator.setMoney(_loc7_,_loc8_ * 100);
            this.mainCharRidePlaneMediator.showStrengthenEnergyRecovery(String(_loc12_.mountAttributeInfo.points_defenceNow),String(_loc12_.mountAttributeInfo.points_defenceMax),String(_loc12_.mountAttributeInfo.append_dp),String(_loc6_),_loc7_,_loc8_ * 100,_loc9_,_loc11_,_loc10_);
            this.mainCharRidePlaneMediator.showFeedPanel();
         }
         else
         {
            _loc13_ = NetWorkManager.readGILMsg(_loc2_);
            this.mainCharRidePlaneMediator.showRideStrengthen();
            ZLog.add("50020：返回提升坐骑防御潜力界面数据。失败,原因" + _loc13_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc13_);
            NoticeManager.notify(NoticeManager.FOOT,_loc13_);
         }
      }
      
      public function received_50022(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Goods = null;
         var _loc11_:Boolean = false;
         var _loc12_:Goods = null;
         var _loc13_:PureMount = null;
         var _loc14_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ != GameInstance.mainCharData.mountInfo.selectedMountID)
         {
            return;
         }
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            ZLog.add("50022：返回提升坐骑轻身潜力界面数据");
            _loc5_ = _loc2_.readShort();
            _loc6_ = _loc2_.readDouble();
            _loc7_ = _loc2_.readDouble();
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readShort() / GAILV_JISHU;
            _loc10_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.ZIZHIDAN_ID,true);
            _loc11_ = _loc10_.count >= _loc5_;
            _loc10_.count = _loc5_;
            _loc12_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
            _loc13_ = GameInstance.mainCharData.mountInfo.selectedMount;
            this.mainCharRidePlaneMediator.setMoney(_loc8_,_loc9_ * 100);
            this.mainCharRidePlaneMediator.showStrengthenEnergyLight(String(_loc13_.mountAttributeInfo.points_flyNow),String(_loc13_.mountAttributeInfo.points_flyMax),String(_loc13_.mountAttributeInfo.append_cp),String(_loc13_.mountAttributeInfo.append_ev),String(_loc6_),String(_loc7_),_loc8_,_loc9_ * 100,_loc10_,_loc12_,_loc11_);
            this.mainCharRidePlaneMediator.showFeedPanel();
         }
         else
         {
            _loc14_ = NetWorkManager.readGILMsg(_loc2_);
            this.mainCharRidePlaneMediator.showRideStrengthen();
            ZLog.add("50022：返回提升坐骑轻身潜力界面数据。失败,原因" + _loc14_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc14_);
            NoticeManager.notify(NoticeManager.FOOT,_loc14_);
         }
      }
      
      public function received_50024(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Goods = null;
         var _loc12_:Boolean = false;
         var _loc13_:Goods = null;
         var _loc14_:PureMount = null;
         var _loc15_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ != GameInstance.mainCharData.mountInfo.selectedMountID)
         {
            return;
         }
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            ZLog.add("50024：返回提升坐骑健体潜力界面数据");
            _loc5_ = _loc2_.readShort();
            _loc6_ = _loc2_.readDouble();
            _loc7_ = _loc2_.readDouble();
            _loc8_ = _loc2_.readDouble();
            _loc9_ = _loc2_.readInt();
            _loc10_ = _loc2_.readShort() / GAILV_JISHU;
            _loc11_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.ZIZHIDAN_ID,true);
            _loc12_ = _loc11_.count >= _loc5_;
            _loc11_.count = _loc5_;
            _loc13_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
            _loc14_ = GameInstance.mainCharData.mountInfo.selectedMount;
            this.mainCharRidePlaneMediator.setMoney(_loc9_,_loc10_ * 100);
            this.mainCharRidePlaneMediator.showStrengthenEnergyHealth(String(_loc14_.mountAttributeInfo.points_stongNow),String(_loc14_.mountAttributeInfo.points_stongMax),String(_loc14_.mountAttributeInfo.append_hp),String(_loc6_),String(_loc14_.mountAttributeInfo.append_mp),String(_loc7_),String(_loc14_.mountAttributeInfo.append_pp),String(_loc8_),_loc9_,_loc10_ * 100,_loc11_,_loc13_,_loc12_);
            this.mainCharRidePlaneMediator.showFeedPanel();
         }
         else
         {
            _loc15_ = NetWorkManager.readGILMsg(_loc2_);
            this.mainCharRidePlaneMediator.showRideStrengthen();
            ZLog.add("50024：返回提升坐骑健体潜力界面数据。失败,原因" + _loc15_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc15_);
            NoticeManager.notify(NoticeManager.FOOT,_loc15_);
         }
      }
      
      public function received_50026(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:Goods = null;
         var _loc14_:Goods = null;
         var _loc15_:Boolean = false;
         var _loc16_:Goods = null;
         var _loc17_:PureMount = null;
         var _loc18_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ != GameInstance.mainCharData.mountInfo.selectedMountID)
         {
            return;
         }
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            ZLog.add("50026：返回炼骨进阶界面数据");
            _loc5_ = _loc2_.readShort();
            _loc6_ = _loc2_.readInt();
            _loc7_ = _loc2_.readUTF();
            _loc8_ = _loc2_.readShort();
            _loc9_ = _loc2_.readShort();
            _loc10_ = _loc2_.readInt();
            _loc11_ = _loc2_.readShort() / GAILV_JISHU;
            _loc12_ = 0;
            if(_loc2_.bytesAvailable > 0)
            {
               _loc12_ = _loc2_.readInt();
               if(_loc12_ < 60)
               {
                  _loc12_ = 60;
               }
            }
            this.mainCharRideFeedPlaneMediator.setRTime(_loc12_);
            this.mainCharRidePlaneMediator.showGradeUpgrade();
            _loc13_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.LIANGUDAN_ID,true);
            _loc14_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.HUAODONG_LIANGUDAN_ID,true);
            _loc13_.count += _loc14_.count;
            _loc15_ = _loc13_.count >= _loc5_;
            _loc13_.count = _loc5_;
            _loc16_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JINJIEFU_ID,true);
            this.mainCharRidePlaneMediator.setMoney(_loc10_,_loc11_ * 100);
            _loc17_ = GameInstance.mainCharData.mountInfo.selectedMount;
            _loc17_.mountAttributeInfo.zhufuzhi = _loc8_;
            this.mainCharRidePlaneMediator.showFeedPanel();
            this.mainCharRidePlaneMediator.setUpgradeGradeName(String(_loc17_.name),_loc7_,_loc6_);
            this.mainCharRidePlaneMediator.setUpgradeAvatar(new BitmapData(100,100,true,16711680),String(_loc17_.mountAttributeInfo.getQualityName()));
            this.mainCharRidePlaneMediator.setUpgradeProbability(_loc8_,_loc9_);
            this.mainCharRidePlaneMediator.setUpgradeExpendItem(_loc13_,_loc16_,_loc15_);
            this.mainCharRidePlaneMediator.fristSetUpgradeExpendMoneyAndProbability(_loc10_,_loc11_ * 100);
         }
         else
         {
            _loc18_ = NetWorkManager.readGILMsg(_loc2_);
            this.mainCharRidePlaneMediator.hideFeedPanel();
            ZLog.add("50026：返回炼骨进阶界面数据。失败,原因" + _loc18_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc18_);
            NoticeManager.notify(NoticeManager.FOOT,_loc18_);
         }
      }
      
      public function received_50060(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ != GameInstance.mainCharData.mountInfo.selectedMountID)
         {
            return;
         }
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            ZLog.add("50060：返回通灵天赋界面数据");
            _loc5_ = _loc2_.readByte();
            _loc6_ = _loc2_.readInt();
            _loc7_ = _loc2_.readInt() / GAILV_JISHU;
            _loc8_ = _loc2_.readByte();
            _loc9_ = _loc2_.readInt();
            this.mainCharRidePlaneMediator.showFeedPanel();
            this.mainCharRidePlaneMediator.setTonglingtianfu(_loc5_,_loc6_,_loc7_ * 100,_loc8_,_loc9_);
            this.mainCharRidePlaneMediator.showTonglingtianfu();
         }
         else
         {
            _loc10_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("50026：返回通灵天赋界面数据。失败,原因" + _loc10_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc10_);
            NoticeManager.notify(NoticeManager.FOOT,_loc10_);
            this.mainCharRidePlaneMediator.hideFeedPanel();
         }
      }
      
      public function received_50028(param1:ByteArray) : void
      {
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:int = _loc2_.readByte();
         if(_loc5_ == 1)
         {
            _loc6_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("50028：提升成功," + _loc6_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc6_);
            NoticeManager.notify(NoticeManager.FOOT,_loc6_);
            if(_loc4_ == 1 || _loc4_ == 2 || _loc4_ == 3 || _loc4_ == 4 || _loc4_ == 5 || _loc4_ == 6 || _loc4_ == 13)
            {
               this.msgSenderProxy.send_50031([GameInstance.mainChar.id,_loc3_]);
               this.mainCharRidePlaneMediator.suc = false;
               this.mainCharRidePlaneMediator.autoTimerFun();
            }
            if(_loc4_ == 7)
            {
               this.msgSenderProxy.send_50029([GameInstance.mainChar.id,2]);
            }
            this.mainCharRidePlaneMediator.showFeedPanel();
            if(_loc4_ == 9)
            {
               _loc7_ = _loc2_.readByte();
               if(_loc7_ == 100)
               {
                  this.mainCharRidePlaneMediator.setMC();
               }
               this.msgSenderProxy.send_50029([GameInstance.mainChar.id,2]);
            }
         }
         else if(_loc5_ == 2)
         {
            _loc8_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("22222222222222   50028：提升失败," + _loc8_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc8_);
            NoticeManager.notify(NoticeManager.FOOT,_loc8_);
            if(_loc4_ == 7)
            {
               this.msgSenderProxy.send_50029([GameInstance.mainChar.id,2]);
            }
            if(_loc4_ == 1 || _loc4_ == 2 || _loc4_ == 3 || _loc4_ == 4 || _loc4_ == 5 || _loc4_ == 6 || _loc4_ == 13)
            {
               this.mainCharRidePlaneMediator.autoTimerFun();
               this.mainCharRidePlaneMediator.suc = false;
            }
         }
         else
         {
            _loc8_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("0000000000  50028：提升失败," + _loc8_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc8_);
            NoticeManager.notify(NoticeManager.FOOT,_loc8_);
            if(_loc4_ == 1 || _loc4_ == 2 || _loc4_ == 3 || _loc4_ == 4 || _loc4_ == 5 || _loc4_ == 6 || _loc4_ == 13)
            {
               this.mainCharRidePlaneMediator.suc = true;
               this.mainCharRidePlaneMediator.setTuBoBtn(true);
            }
            this.msgSenderProxy.send_50029([GameInstance.mainChar.id,2]);
         }
      }
      
      public function received_52064(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         ZLog.add("52064：收到命令客户端弹出界面面板");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         switch(_loc3_)
         {
            case 1218:
               if(!Fun.isVisible(GameInstance.uiInstance._rideSkillResetPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_RIDE_SKILL_RESET_PLANE);
               }
               break;
            case 9715:
               if(!Fun.isVisible(GameInstance.uiInstance._rideYinCangShuXingJiHuoPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_RIDE_YINCANG_SHUXING_JIHUO_PLANE);
               }
               break;
            case 1221:
               if(!Fun.isVisible(GameInstance.uiInstance._rideSkillResetPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_RONGXUEDAN_PLANE);
               }
               break;
            case 1224:
               this.mainCharRideQiannengdanPanelMediator.setQiannengdanID(_loc3_);
               if(Fun.isVisible(GameInstance.uiInstance._rideQiannengdanPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_RIDE_QIANNENGDAN_PANEL);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_RIDE_QIANNENGDAN_PANEL);
               break;
            case 1228:
               if(!Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
               }
               break;
            case 9119:
               if(!Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
               }
               break;
            case 9120:
               if(!Fun.isVisible(GameInstance.uiInstance._rideMenghuandanPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MENGHUANDAN_PLANE);
               }
               break;
            case 3003:
            case 3004:
            case 3005:
            case 3006:
               if(!Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE,_loc3_);
               }
               break;
            case 3100:
            case 3200:
            case 3300:
               if(!Fun.isVisible(GameInstance.uiInstance._squirrelGiftPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_SQUIRREL_PANEL,_loc3_);
               }
               break;
            case 9127:
               if(!Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL,_loc3_);
               }
               break;
            case 9143:
               PipeManager.sendMsg(PipeConstants.SHOW_WGSJD_PANEL,_loc3_);
               break;
            case 9146:
               PipeManager.sendMsg(PipeConstants.SHOW_PTYHTQK_PANEL,_loc3_);
               break;
            case 9152:
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE,_loc3_);
               break;
            case 9154:
               if(!Fun.isVisible(GameInstance.uiInstance._freeMallCadePanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_FREE_MALL_PLANE,_loc3_);
               }
               break;
            case 9168:
               if(!Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL,_loc3_);
               }
               break;
            case 9174:
               if(!Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL,_loc3_);
               }
               break;
            case 9224:
               if(!Fun.isVisible(GameInstance.uiInstance._wuxieZhijingPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_WUXIEZHIJING_PANEL,_loc3_);
               }
               break;
            case 9231:
            case 9605:
            case 9606:
            case 9604:
            case 9742:
            case 9743:
            case 9781:
            case 9794:
            case 40062:
            case 40074:
            case 40089:
            case 40116:
            case 40187:
            case 40961:
            case 41065:
            case 41065:
            case 41085:
            case 41328:
            case 41332:
            case 41427:
            case 41605:
            case 41606:
            case 41607:
            case 41608:
            case 41631:
            case 41632:
            case 41644:
            case 41686:
            case 41694:
            case 41740:
            case 309918:
            case 309984:
            case 41829:
            case 41834:
            case 370079:
            case 41876:
            case 41893:
            case 41896:
            case 370361:
            case 370743:
            case 370405:
            case 370485:
            case 370467:
            case 370470:
            case 42024:
            case 42025:
            case 370802:
            case 370852:
            case 370856:
            case 370860:
            case 42088:
            case 42143:
            case 371136:
            case 42209:
            case 371309:
            case 371379:
            case 42327:
            case 42368:
            case 371525:
            case 371567:
            case 371655:
            case 371630:
            case 42405:
            case 42418:
            case 42422:
            case 42450:
            case 371848:
            case 371850:
            case 371852:
            case 371854:
            case 371899:
            case 371925:
            case 371943:
            case 371991:
            case 372045:
            case 42554:
            case 372083:
            case 372106:
            case 372162:
            case 372190:
            case 42643:
            case 372317:
            case 372356:
            case 372340:
            case 372361:
            case 372384:
            case 372412:
            case 372441:
            case 372455:
            case 372476:
            case 372487:
            case 372534:
            case 372553:
            case 372563:
            case 372657:
            case 372699:
            case 372674:
            case 372727:
            case 372744:
            case 372770:
            case 42896:
            case 372805:
            case 372814:
            case 372836:
            case 372846:
            case 372871:
            case 372880:
            case 372916:
            case 372933:
            case 372958:
            case 372975:
            case 372997:
            case 373013:
            case 373036:
            case 373056:
            case 722944:
            case 722975:
            case 723444:
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_HU_SHEN_FU_DA_KONG,_loc3_);
               break;
            case 729843:
               PipeManager.sendMsg(PipeConstants.SHOW_BAOSHI_DUANLIAN,_loc3_);
               break;
            case 729167:
               PipeManager.sendMsg(PipeConstants.SHOW_BAJIGUIYUANHUFU_DA_KONG,_loc3_);
               break;
            case 9240:
               if(!Fun.isVisible(GameInstance.uiInstance._changeSuperMount1))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_CHANGE_SUPER_MOUNT_TO_SUPER_MOUNT,_loc3_);
               }
               break;
            case 9483:
               if(!Fun.isVisible(GameInstance.uiInstance._changeSuperMount2))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MO_SHOU_HU_HUAN,_loc3_);
               }
               break;
            case 9331:
               _loc4_ = "";
               _loc4_ = _loc4_ + ("<font color=\'" + StaticValue.RED_HTML + "\'>");
               _loc4_ = _loc4_ + LanResManager.getLanCommonTextWords("红气球：");
               _loc4_ = _loc4_ + "</font>";
               _loc4_ = _loc4_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>");
               _loc4_ = _loc4_ + (LanResManager.getLanCommonTextWords("无") + "\n");
               _loc4_ = _loc4_ + "</font>";
               _loc4_ = _loc4_ + ("<font color=\'" + StaticValue.YELLOW_HTML + "\'>");
               _loc4_ = _loc4_ + LanResManager.getLanCommonTextWords("黄气球：");
               _loc4_ = _loc4_ + "</font>";
               _loc4_ = _loc4_ + ("<font color=\'" + StaticValue.RED_HTML + "\'>");
               _loc4_ = _loc4_ + (LanResManager.getLanCommonTextWords("两张强力道具提取卡") + "\n");
               _loc4_ = _loc4_ + "</font>";
               _loc4_ = _loc4_ + ("<font color=\'" + StaticValue.BLUE_HTML + "\'>");
               _loc4_ = _loc4_ + LanResManager.getLanCommonTextWords("蓝气球：");
               _loc4_ = _loc4_ + "</font>";
               _loc4_ = _loc4_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>");
               _loc4_ = _loc4_ + (LanResManager.getLanCommonTextWords("无") + "\n");
               _loc4_ = _loc4_ + "</font>";
               _loc4_ = _loc4_ + ("<font color=\'" + StaticValue.GREEN_HTML + "\'>");
               _loc4_ = _loc4_ + LanResManager.getLanCommonTextWords("绿气球：");
               _loc4_ = _loc4_ + "</font>";
               _loc4_ = _loc4_ + ("<font color=\'" + StaticValue.RED_HTML + "\'>");
               _loc4_ = _loc4_ + (LanResManager.getLanCommonTextWords("两张强力道具提取卡") + "\n");
               _loc4_ = _loc4_ + "</font>";
               _loc4_ = _loc4_ + ("<font color=\'" + StaticValue.PURPLE_HTML + "\'>");
               _loc4_ = _loc4_ + LanResManager.getLanCommonTextWords("紫气球：");
               _loc4_ = _loc4_ + "</font>";
               _loc4_ = _loc4_ + ("<font color=\'" + StaticValue.RED_HTML + "\'>");
               _loc4_ = _loc4_ + (LanResManager.getLanCommonTextWords("两张强力道具提取卡") + "\n");
               _loc4_ = _loc4_ + "</font>";
               FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
               FAlert.show(_loc4_);
               break;
            case 9335:
               if(!Fun.isVisible(GameInstance.uiInstance._daoJuTiQuKaPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_DAOJUTIQUKA_PANEL,_loc3_);
               }
               break;
            case 9409:
               PipeManager.sendMsg(PipeConstants.USE_ITEM_JIYUAN_UP,_loc3_);
               break;
            case 9650:
               PipeManager.sendMsg(PipeConstants.SHOW_ZHUNAGBEICOPE_PANEL,0);
               break;
            case 9653:
               PipeManager.sendMsg(PipeConstants.SHOW_ZHUNAGBEICOPE_PANEL,1);
               break;
            case 42509:
               PipeManager.sendMsg(PipeConstants.SHOW_ZHUNAGBEICOPE_PANEL,2);
               break;
            case 9716:
               if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE,_loc3_);
               }
               GameInstance.uiInstance.charAttribute.showSmithingBody();
               PipeManager.sendMsg(PipeConstants.SHOW_MO_HUA,_loc3_);
               break;
            case 9723:
               if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE,_loc3_);
               }
               GameInstance.uiInstance.charAttribute.showDugujiujian();
               GameInstance.uiInstance.charAttribute.requestShowDugujiujianPanelAndPlayMC();
               break;
            case 9724:
            case 9725:
            case 9726:
            case 9727:
            case 59010:
               GameInstance.uiInstance.charAttribute.showDugujiujian();
               GameInstance.uiInstance.charAttribute.requestShowDugujiujianPanel();
               break;
            case 9733:
               if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE,_loc3_);
               }
               GameInstance.uiInstance.charAttribute.showQiShangQuan();
               GameInstance.uiInstance.charAttribute.requestShowQiShangQuanPanel();
               break;
            case 9729:
            case 9730:
            case 9731:
            case 9732:
               GameInstance.uiInstance.charAttribute.showQiShangQuan();
               GameInstance.uiInstance.charAttribute.requestShowQiShangQuanPanel();
               break;
            case 9709:
               if(!Fun.isVisible(GameInstance.uiInstance._cishaMilingPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_CISHAMILING_PLANE);
               }
               break;
            case 9748:
               if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE,_loc3_);
               }
               GameInstance.uiInstance.charAttribute.showAnqi();
               break;
            case 9749:
               if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE,_loc3_);
               }
               GameInstance.uiInstance.charAttribute.showDantian();
               break;
            case 9750:
               if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE,_loc3_);
               }
               GameInstance.uiInstance.charAttribute.showDantian();
               break;
            case 9953:
            case SpecialGoodsID.YNHUANGDAOZHUANPAN:
            case SpecialGoodsID.XUANZHUANSHI2:
            case SpecialGoodsID.QUANXIN_XUANZHUANSHI2:
            case SpecialGoodsID.YNWANGZHEZHUANPAN:
               if(!Fun.isVisible(GameInstance.uiInstance._yuanPanGiftPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_YUANPAN_PANEL,_loc3_);
               }
               break;
            case 42155:
               if(!Fun.isVisible(GameInstance.uiInstance._yuanPanGiftPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_YUANPAN_PANEL,_loc3_);
               }
               break;
            case 9799:
               if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE,_loc3_);
               }
               GameInstance.uiInstance.charAttribute.showTianFu();
               break;
            case 9963:
               if(!Fun.isVisible(GameInstance.uiInstance._xunZhangHeChengPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_XUNZHANG_HECHENG_PANEL,_loc3_);
               }
               break;
            case 9740:
               if(!Fun.isVisible(GameInstance.uiInstance._xunZhangDuihuanPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_XUNZHANGDUIHUAN_PANEL);
               }
               break;
            case 40098:
               GameInstance.uiInstance.charAttribute.addSlot(true);
               break;
            case 40428:
               if(!Fun.isVisible(GameInstance.uiInstance._timeBaozangPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TIMEBAOZANG_PANEL);
               }
               break;
            case 41992:
               if(!Fun.isVisible(GameInstance.uiInstance._timeBaozangPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TIMEBAOZANG_PANEL);
               }
               break;
            case 40288:
               if(!Fun.isVisible(GameInstance.uiInstance._yueGuangBaoHePanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_YUEGUANGBAOHE_PANEL);
               }
               break;
            case 40827:
               if(!Fun.isVisible(GameInstance.uiInstance._partyChangePanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MENPAIZHUANHUAN_PANEL);
               }
               break;
            case 41731:
               PipeManager.sendMsg(PipeConstants.SHOW_ZHONGXUYUANSHU_PANEL);
               break;
            case 42238:
               GameInstance.uiInstance.chaojilabaPanel.setCs();
               PipeManager.sendMsg(PipeConstants.SHOW_CHAOJILABA_PANEL);
               break;
            case 42243:
               GameInstance.uiInstance.zhongzhixuanyuanjianPanel.setCs();
               PipeManager.sendMsg(PipeConstants.SHOW_ZHONGZHIXUANYUANJIAN_PANEL);
               break;
            case 42419:
               PipeManager.sendMsg(PipeConstants.SHOW_SHENGXIAO_PANEL);
               break;
            case 724655:
               PipeManager.sendMsg(PipeConstants.SHOW_YNXINNIANZHUFUPANEL);
               break;
            case 724677:
               PipeManager.sendMsg(PipeConstants.SHOW_YN2016TIANDENG);
               break;
            case 724678:
               PipeManager.sendMsg(PipeConstants.SHOW_YNSHANXIAQIJIAN);
               break;
            case 724703:
               PipeManager.sendMsg(PipeConstants.SHOW_YNLUOHANHUTI);
               break;
            case 724704:
               PipeManager.sendMsg(PipeConstants.SHOW_YNSHOUYIN);
               break;
            case 724710:
               PipeManager.sendMsg(PipeConstants.SHOW_QINGRENJIESONGHUA_PLANE,5);
               break;
            case 724711:
               PipeManager.sendMsg(PipeConstants.SHOW_QINGRENJIESONGHUA_PLANE,6);
               break;
            case 724712:
               PipeManager.sendMsg(PipeConstants.SHOW_YNWULINSHENQIPANEL);
               break;
            case 724720:
               PipeManager.sendMsg(PipeConstants.SHOW_YNJUEDINGSHENBINGPANEL);
               break;
            case 724721:
               PipeManager.sendMsg(PipeConstants.SHOW_YNHUTISHANGYIPANEL);
               break;
            case 724754:
               PipeManager.sendMsg(PipeConstants.SHOW_YNWUSHUANGPUPANEL);
               break;
            case 724755:
               PipeManager.sendMsg(PipeConstants.SHOW_YNSHISANJIANHUN);
               break;
            case 725565:
               PipeManager.sendMsg(PipeConstants.SHOW_YN2016QIZIQUANZHENJIAO);
               break;
            case 726086:
               PipeManager.sendMsg(PipeConstants.SHOW_YN2016XIUWEIWUXUE);
               break;
            case 726105:
               PipeManager.sendMsg(PipeConstants.SHOW_YN2016WANGZHEZHANQI);
               break;
            case 726569:
               PipeManager.sendMsg(PipeConstants.SHOW_YN2016LIUMAIJIANPLANE);
               break;
            case 727338:
               PipeManager.sendMsg(PipeConstants.SHOW_WANGZHEZHUANGBEI,1);
               break;
            case 727821:
               PipeManager.sendMsg(PipeConstants.SHOW_WANGZHEZHUANGBEI,2);
               break;
            case 727822:
               PipeManager.sendMsg(PipeConstants.SHOW_WANGZHEZHUANGBEI,3);
               break;
            case 727823:
               PipeManager.sendMsg(PipeConstants.SHOW_WANGZHEZHUANGBEI,4);
               break;
            case 727824:
               PipeManager.sendMsg(PipeConstants.SHOW_WANGZHEZHUANGBEI,5);
               break;
            case 727825:
               PipeManager.sendMsg(PipeConstants.SHOW_WANGZHEZHUANGBEI,6);
               break;
            case 728105:
               PipeManager.sendMsg(PipeConstants.SHOW_HUAZHUANGLIBAO_PANEL);
               break;
            case 728106:
               PipeManager.sendMsg(PipeConstants.SHOW_CHIBANGLIBAO_PANEL);
               break;
            case 735491:
            case 735492:
            case 735493:
            case 735494:
            case 735495:
            case 735496:
            case 735497:
            case 735498:
            case 735499:
            case 735500:
               PipeManager.sendMsg(PipeConstants.GET_CAIPIAO_PANEL,_loc3_);
               break;
            default:
               if(_loc3_ >= 710000)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_ZHENTIANSHENQIPLANE,_loc3_);
               }
         }
      }
      
      public function received_52066(param1:ByteArray) : void
      {
         var _loc4_:PureMount = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         ZLog.add("52066：收到坐骑技能重置面板--坐骑列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:Array = [];
         var _loc5_:int = _loc2_.readByte();
         var _loc6_:int = _loc2_.readByte();
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readInt();
            _loc10_ = _loc2_.readUTF();
            _loc11_ = _loc2_.readShort();
            _loc12_ = _loc2_.readByte();
            _loc13_ = _loc2_.readByte();
            _loc4_ = new PureMount(_loc9_);
            _loc4_.id = _loc8_;
            _loc4_.name = _loc10_;
            _loc4_.mountAttributeInfo.lv = _loc11_;
            _loc4_.fightStatus = _loc12_;
            _loc4_.mountAttributeInfo.quality = _loc13_;
            _loc3_.push(_loc4_);
            _loc7_++;
         }
         this.mainCharRideSkillResetPlaneMediator.setRideList(_loc5_,_loc6_,_loc3_);
         this.mainCharRideYinCangShuXingJihuoPlaneMediator.setRideList(_loc5_,_loc6_,_loc3_);
      }
      
      public function received_52068(param1:ByteArray) : void
      {
         var _loc6_:Goods = null;
         var _loc7_:int = 0;
         var _loc10_:MountSkill = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         ZLog.add("52068：收到坐骑技能重置面板--单个坐骑详细信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:PureMount = new PureMount(_loc2_);
         _loc3_.id = param1.readInt();
         _loc3_.name = param1.readUTF();
         _loc3_.mountAttributeInfo.menghuan = param1.readInt() / 10000;
         _loc3_.mountAttributeInfo.menghuan_wuxing = param1.readInt() / 10000;
         _loc3_.mountAttributeInfo.menghuan_jineng = param1.readInt() / 10000;
         _loc3_.mountAttributeInfo.menghuan_qianli = param1.readInt() / 10000;
         _loc3_.mountAttributeInfo.menghuan_mhd = param1.readInt();
         _loc3_.mountAttributeInfo.quality = param1.readByte();
         _loc3_.mountAttributeInfo.lv = param1.readShort();
         var _loc4_:int = param1.readInt();
         var _loc5_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < _loc4_)
         {
            _loc13_ = param1.readInt();
            _loc14_ = param1.readShort();
            _loc6_ = new Goods(_loc13_,_loc14_);
            _loc6_.roleID = GameInstance.mainChar.id;
            _loc6_.mountID = _loc3_.id;
            _loc6_.strengthen_grade = param1.readByte();
            _loc6_.quality = param1.readByte();
            _loc6_.isFullStar = param1.readByte();
            if(_loc3_.mountAttributeInfo.lv < _loc6_.res.limit_grade)
            {
               _loc6_.enabled = false;
            }
            else
            {
               _loc6_.enabled = true;
            }
            _loc5_.push(_loc6_);
            _loc7_++;
         }
         _loc3_.mountGoodsInfo.goodsBagArr = _loc5_;
         var _loc8_:int = param1.readByte();
         var _loc9_:Object = {};
         var _loc11_:* = int(ItemPositionRange.MOUNT_QUICK_BAR_RANGE.x);
         _loc7_ = 0;
         while(_loc7_ < _loc8_)
         {
            _loc15_ = param1.readInt();
            _loc16_ = param1.readInt();
            _loc17_ = _loc7_ + 1;
            _loc10_ = new MountSkill(_loc15_,_loc17_);
            _loc10_.lv = param1.readShort();
            _loc10_.nowLvJianChengStr = param1.readUTF();
            _loc10_.nextLvUpUseZhenQi = param1.readShort();
            _loc10_.nextLvUpUseCopper = param1.readInt();
            _loc10_.nextLvJianChengStr = param1.readUTF();
            if(_loc10_.res.useway == 1)
            {
               _loc10_.quickbarindex = _loc11_++;
            }
            _loc10_.isLearn = 1;
            _loc9_[_loc10_.id] = _loc10_;
            _loc7_++;
         }
         var _loc12_:int = param1.readShort();
         _loc3_.mountAttributeInfo.menghuanShendanJihuo = param1.readByte();
         _loc3_.mountAttributeInfo.chaojizuoqiQianNengDan = param1.readInt();
         _loc3_.mountAttributeInfo.zhongjizuoqiQianNengDan = param1.readInt();
         _loc3_.mountAttributeInfo.shoushenDan = param1.readInt();
         _loc3_.mountAttributeInfo.dianfengqiannengDan = param1.readInt();
         _loc3_.mountSkillInfo.skillObj = _loc9_;
         this.mainCharRideSkillResetPlaneMediator.setRideInfo(_loc3_);
         this.mainCharRideYinCangShuXingJihuoPlaneMediator.setRideInfo(_loc3_,_loc12_);
      }
      
      public function received_52070(param1:ByteArray) : void
      {
         ZLog.add("50070：返回重置坐骑技能成功");
         var _loc2_:int = param1.readInt();
         if(Fun.isVisible(GameInstance.uiInstance._rideSkillResetPanel))
         {
            this.mainCharRideSkillResetPlaneMediator.reRequestSelectMountInfo();
         }
         if(Fun.isVisible(GameInstance.uiInstance._rideYinCangShuXingJiHuoPanel))
         {
            this.mainCharRideYinCangShuXingJihuoPlaneMediator.reRequestSelectMountInfo();
         }
         this.msgSenderProxy.send_50031([GameInstance.mainChar.id,_loc2_]);
      }
      
      public function received_52072(param1:ByteArray) : void
      {
         var _loc4_:PureMount = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         ZLog.add("52072：收到坐骑潜能丹面板--坐骑列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:Array = [];
         var _loc5_:int = _loc2_.readByte();
         var _loc6_:int = _loc2_.readByte();
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readInt();
            _loc10_ = _loc2_.readUTF();
            _loc11_ = _loc2_.readShort();
            _loc12_ = _loc2_.readByte();
            _loc13_ = _loc2_.readByte();
            _loc4_ = new PureMount(_loc9_);
            _loc4_.id = _loc8_;
            _loc4_.name = _loc10_;
            _loc4_.mountAttributeInfo.lv = _loc11_;
            _loc4_.fightStatus = _loc12_;
            _loc4_.mountAttributeInfo.quality = _loc13_;
            _loc3_.push(_loc4_);
            _loc7_++;
         }
         this.mainCharRideQiannengdanPanelMediator.setRideList(_loc5_,_loc6_,_loc3_);
      }
      
      public function received_52074(param1:ByteArray) : void
      {
         var _loc9_:Goods = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         ZLog.add("52074：收到坐骑潜能丹面板--单个坐骑详细信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:PureMount = new PureMount(_loc3_);
         var _loc5_:Array = [0,0,0,0];
         _loc4_.id = param1.readInt();
         _loc4_.name = param1.readUTF();
         _loc4_.mountAttributeInfo.menghuan = param1.readInt() / 10000;
         _loc4_.mountAttributeInfo.menghuan_wuxing = param1.readInt() / 10000;
         _loc4_.mountAttributeInfo.menghuan_jineng = param1.readInt() / 10000;
         _loc4_.mountAttributeInfo.menghuan_qianli = param1.readInt() / 10000;
         _loc4_.mountAttributeInfo.menghuan_mhd = param1.readInt();
         _loc4_.mountAttributeInfo.quality = param1.readByte();
         _loc4_.mountAttributeInfo.lv = param1.readShort();
         _loc4_.mountAttributeInfo.points_attackNow = param1.readInt();
         _loc4_.mountAttributeInfo.points_attackMin = param1.readInt();
         _loc4_.mountAttributeInfo.points_attackMax = param1.readInt();
         _loc4_.mountAttributeInfo.points_attackFujia = param1.readInt();
         _loc5_[0] = param1.readInt();
         _loc4_.mountAttributeInfo.points_defenceNow = param1.readInt();
         _loc4_.mountAttributeInfo.points_defenceMin = param1.readInt();
         _loc4_.mountAttributeInfo.points_defenceMax = param1.readInt();
         _loc4_.mountAttributeInfo.points_defenceFujia = param1.readInt();
         _loc5_[1] = param1.readInt();
         _loc4_.mountAttributeInfo.points_stongNow = param1.readInt();
         _loc4_.mountAttributeInfo.points_stongMin = param1.readInt();
         _loc4_.mountAttributeInfo.points_stongMax = param1.readInt();
         _loc4_.mountAttributeInfo.points_stongFujia = param1.readInt();
         _loc5_[2] = param1.readInt();
         _loc4_.mountAttributeInfo.points_flyNow = param1.readInt();
         _loc4_.mountAttributeInfo.points_flyMin = param1.readInt();
         _loc4_.mountAttributeInfo.points_flyMax = param1.readInt();
         _loc4_.mountAttributeInfo.points_flyFujia = param1.readInt();
         _loc5_[3] = param1.readInt();
         var _loc6_:int = param1.readByte();
         if(_loc6_ == 1)
         {
            _loc4_.mountAttributeInfo.superMountType = param1.readByte();
            _loc4_.mountAttributeInfo.superMpunt_hp = param1.readDouble();
            _loc4_.mountAttributeInfo.superMpunt_mp = param1.readDouble();
            _loc4_.mountAttributeInfo.superMpunt_pp = param1.readDouble();
            _loc4_.mountAttributeInfo.superMpunt_ap = param1.readDouble();
            _loc4_.mountAttributeInfo.superMpunt_dp = param1.readDouble();
            _loc4_.mountAttributeInfo.superMpunt_cp = param1.readDouble();
            _loc4_.mountAttributeInfo.superMpunt_ev = param1.readDouble();
            _loc4_.mountAttributeInfo.superMpunt_adx = param1.readInt();
            _loc4_.mountAttributeInfo.superMpunt_mdx = param1.readInt();
         }
         var _loc7_:int = param1.readInt();
         var _loc8_:Array = [];
         _loc10_ = 0;
         while(_loc10_ < _loc7_)
         {
            _loc11_ = param1.readInt();
            _loc12_ = param1.readShort();
            _loc9_ = new Goods(_loc11_,_loc12_);
            _loc9_.roleID = GameInstance.mainChar.id;
            _loc9_.mountID = _loc4_.id;
            _loc9_.strengthen_grade = param1.readByte();
            _loc9_.quality = param1.readByte();
            _loc9_.isFullStar = param1.readByte();
            if(_loc4_.mountAttributeInfo.lv < _loc9_.res.limit_grade)
            {
               _loc9_.enabled = false;
            }
            else
            {
               _loc9_.enabled = true;
            }
            _loc8_.push(_loc9_);
            _loc10_++;
         }
         _loc4_.mountGoodsInfo.goodsBagArr = _loc8_;
         _loc4_.mountAttributeInfo.menghuanShendanJihuo = param1.readByte();
         _loc4_.mountAttributeInfo.souyuan_hp = param1.readDouble();
         _loc4_.mountAttributeInfo.souyuan_mp = param1.readDouble();
         _loc4_.mountAttributeInfo.souyuan_pp = param1.readDouble();
         _loc4_.mountAttributeInfo.souyuan_ap = param1.readDouble();
         _loc4_.mountAttributeInfo.souyuan_dp = param1.readDouble();
         _loc4_.mountAttributeInfo.souyuan_cp = param1.readDouble();
         _loc4_.mountAttributeInfo.souyuan_ev = param1.readDouble();
         _loc4_.mountAttributeInfo.chaojizuoqiQianNengDan = param1.readInt();
         _loc4_.mountAttributeInfo.zhongjizuoqiQianNengDan = param1.readInt();
         _loc4_.mountAttributeInfo.shoushenDan = param1.readInt();
         _loc4_.mountAttributeInfo.dianfengqiannengDan = param1.readInt();
         this.mainCharRideQiannengdanPanelMediator.setRideInfo(_loc4_,_loc2_,_loc5_);
      }
      
      public function received_52076(param1:ByteArray) : void
      {
         ZLog.add("52076：返回坐骑潜能丹成功");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         if(Fun.isVisible(GameInstance.uiInstance._rideQiannengdanPanel))
         {
            this.mainCharRideQiannengdanPanelMediator.reRequestSelectMountInfo(_loc3_);
         }
         this.msgSenderProxy.send_50031([GameInstance.mainChar.id,_loc2_]);
      }
      
      public function received_52078(param1:ByteArray) : void
      {
         var _loc4_:PureMount = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         ZLog.add("52078：收到坐骑梦幻丹面板--坐骑列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:Array = [];
         var _loc5_:int = _loc2_.readByte();
         var _loc6_:int = _loc2_.readByte();
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readInt();
            _loc10_ = _loc2_.readUTF();
            _loc11_ = _loc2_.readShort();
            _loc12_ = _loc2_.readByte();
            _loc13_ = _loc2_.readByte();
            _loc4_ = new PureMount(_loc9_);
            _loc4_.id = _loc8_;
            _loc4_.name = _loc10_;
            _loc4_.mountAttributeInfo.lv = _loc11_;
            _loc4_.fightStatus = _loc12_;
            _loc4_.mountAttributeInfo.quality = _loc13_;
            _loc3_.push(_loc4_);
            _loc7_++;
         }
         this.mainCharRideMenghuandanPlaneMediator.setRideList(_loc5_,_loc6_,_loc3_);
      }
      
      public function received_52080(param1:ByteArray) : void
      {
         var _loc6_:Goods = null;
         var _loc7_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Array = null;
         ZLog.add("52080：收到坐骑梦幻丹面板--单个坐骑详细信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:PureMount = new PureMount(_loc2_);
         _loc3_.id = param1.readInt();
         _loc3_.name = param1.readUTF();
         _loc3_.mountAttributeInfo.menghuan = param1.readInt() / 10000;
         _loc3_.mountAttributeInfo.menghuan_wuxing = param1.readInt() / 10000;
         _loc3_.mountAttributeInfo.menghuan_jineng = param1.readInt() / 10000;
         _loc3_.mountAttributeInfo.menghuan_qianli = param1.readInt() / 10000;
         _loc3_.mountAttributeInfo.menghuan_mhd = param1.readInt();
         _loc3_.mountAttributeInfo.quality = param1.readByte();
         _loc3_.mountAttributeInfo.lv = param1.readShort();
         var _loc4_:int = param1.readInt();
         var _loc5_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < _loc4_)
         {
            _loc11_ = param1.readInt();
            _loc12_ = param1.readShort();
            _loc6_ = new Goods(_loc11_,_loc12_);
            _loc6_.roleID = GameInstance.mainChar.id;
            _loc6_.mountID = _loc3_.id;
            _loc6_.strengthen_grade = param1.readByte();
            _loc6_.quality = param1.readByte();
            _loc6_.isFullStar = param1.readByte();
            if(_loc3_.mountAttributeInfo.lv < _loc6_.res.limit_grade)
            {
               _loc6_.enabled = false;
            }
            else
            {
               _loc6_.enabled = true;
            }
            _loc5_.push(_loc6_);
            _loc7_++;
         }
         _loc3_.mountGoodsInfo.goodsBagArr = _loc5_;
         var _loc8_:Array = [param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt()];
         var _loc9_:int = param1.readByte();
         if(_loc9_ == 1)
         {
            _loc3_.mountAttributeInfo.superMountType = param1.readByte();
            _loc3_.mountAttributeInfo.superMpunt_hp = param1.readDouble();
            _loc3_.mountAttributeInfo.superMpunt_mp = param1.readDouble();
            _loc3_.mountAttributeInfo.superMpunt_pp = param1.readDouble();
            _loc3_.mountAttributeInfo.superMpunt_ap = param1.readDouble();
            _loc3_.mountAttributeInfo.superMpunt_dp = param1.readDouble();
            _loc3_.mountAttributeInfo.superMpunt_cp = param1.readDouble();
            _loc3_.mountAttributeInfo.superMpunt_ev = param1.readDouble();
            _loc3_.mountAttributeInfo.superMpunt_adx = param1.readInt();
            _loc3_.mountAttributeInfo.superMpunt_mdx = param1.readInt();
         }
         _loc3_.mountAttributeInfo.souyuan_hp = param1.readDouble();
         _loc3_.mountAttributeInfo.souyuan_mp = param1.readDouble();
         _loc3_.mountAttributeInfo.souyuan_pp = param1.readDouble();
         _loc3_.mountAttributeInfo.souyuan_ap = param1.readDouble();
         _loc3_.mountAttributeInfo.souyuan_dp = param1.readDouble();
         _loc3_.mountAttributeInfo.souyuan_cp = param1.readDouble();
         _loc3_.mountAttributeInfo.souyuan_ev = param1.readDouble();
         _loc3_.mountAttributeInfo.menghuanShendanJihuo = param1.readByte();
         var _loc10_:int = param1.readInt();
         if(_loc10_ > 0)
         {
            _loc13_ = [param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt()];
         }
         _loc3_.mountAttributeInfo.chaojizuoqiQianNengDan = param1.readInt();
         _loc3_.mountAttributeInfo.zhongjizuoqiQianNengDan = param1.readInt();
         _loc3_.mountAttributeInfo.shoushenDan = param1.readInt();
         _loc3_.mountAttributeInfo.dianfengqiannengDan = param1.readInt();
         this.mainCharRideMenghuandanPlaneMediator.setRideInfo(_loc3_,_loc8_,_loc10_,_loc13_);
      }
      
      public function received_52082(param1:ByteArray) : void
      {
         ZLog.add("52082：返回坐骑梦幻丹成功");
         var _loc2_:int = param1.readInt();
         if(Fun.isVisible(GameInstance.uiInstance._rideMenghuandanPanel))
         {
            this.mainCharRideMenghuandanPlaneMediator.reRequestSelectMountInfo();
         }
         this.msgSenderProxy.send_50031([GameInstance.mainChar.id,_loc2_]);
      }
      
      public function received_52062(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:PureMount = null;
         var _loc11_:String = null;
         ZLog.add("52062：显示坐骑面板");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ != GameInstance.mainCharData.mountInfo.selectedMountID)
         {
            return;
         }
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            _loc5_ = _loc2_.readInt();
            _loc6_ = _loc2_.readInt();
            _loc7_ = _loc2_.readInt();
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readInt();
            _loc10_ = GameInstance.mainCharData.mountInfo.getMount(_loc3_);
            this.mainCharRidePlaneMediator.showFeedPanel();
            this.mainCharRidePlaneMediator.showSuperMountPanel(_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
         }
         else
         {
            _loc11_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("50062：返回显示坐骑面板。失败,原因" + _loc11_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc11_);
            NoticeManager.notify(NoticeManager.FOOT,_loc11_);
            this.mainCharRidePlaneMediator.hideFeedPanel();
         }
      }
      
      public function received_52084(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         ZLog.add("52084：圣兽升级加点返回");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ != GameInstance.mainCharData.mountInfo.selectedMountID)
         {
            return;
         }
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            _loc5_ = _loc2_.readInt();
            _loc6_ = _loc2_.readInt();
            _loc7_ = _loc2_.readInt();
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readInt();
            this.mainCharRidePlaneMediator.superMountAddPoint(_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
            this.msgSenderProxy.send_50029([GameInstance.mainChar.id,2]);
         }
      }
      
      public function received_52086(param1:ByteArray) : void
      {
         ZLog.add("52086：圣兽喂食返回");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ != GameInstance.mainCharData.mountInfo.selectedMountID)
         {
            return;
         }
         var _loc4_:int = _loc2_.readByte();
         this.mainCharRidePlaneMediator.superMountEatFeed(_loc4_);
      }
      
      public function received_52088(param1:ByteArray) : void
      {
         ZLog.add("52088：圣兽技能升级查询返回");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ != GameInstance.mainCharData.mountInfo.selectedMountID)
         {
            return;
         }
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readShort();
         var _loc6_:int = _loc2_.readInt();
         var _loc7_:int = _loc2_.readShort();
         this.mainCharRidePlaneMediator.superMountSkillIndex(_loc4_,_loc5_,_loc6_,_loc7_);
      }
      
      public function received_52090(param1:ByteArray) : void
      {
         var _loc6_:PureMount = null;
         var _loc7_:Skill = null;
         var _loc8_:MountSkill = null;
         ZLog.add("52090：圣兽技能升级");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ != GameInstance.mainCharData.mountInfo.selectedMountID)
         {
            return;
         }
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readByte();
         if(_loc5_ == 1)
         {
            _loc6_ = GameInstance.mainCharData.mountInfo.getMount(_loc3_);
            _loc7_ = _loc6_.mountSkillInfo.getSkillByID(_loc4_);
            if(_loc7_ is MountSkill)
            {
               _loc8_ = _loc7_ as MountSkill;
               _loc8_.lv = _loc2_.readShort();
               _loc8_.nowLvJianChengStr = _loc2_.readUTF();
               _loc8_.nextLvUpUseZhenQi = param1.readShort();
               _loc8_.nextLvUpUseCopper = param1.readInt();
               _loc8_.nextLvJianChengStr = param1.readUTF();
            }
         }
         this.mainCharRidePlaneMediator.superMountSkillUpData(_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      public function received_52092(param1:ByteArray) : void
      {
         ZLog.add("52092：圣兽兑换成功/失败");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         this.superMountMediator.changeSuperMountComplete(_loc3_);
      }
      
      public function received_52094(param1:ByteArray) : void
      {
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         ZLog.add("52094：圣兽兑换查询返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:PureMount = GameInstance.mainCharData.mountInfo.getMount(_loc2_);
         var _loc4_:int = param1.readByte();
         if(_loc4_ == 0)
         {
            _loc5_ = [];
            _loc6_ = [];
            _loc7_ = 0;
            while(_loc7_ < 4)
            {
               _loc5_.push(param1.readInt());
               _loc6_.push(param1.readInt());
               _loc7_++;
            }
            this.superMountMediator.setItem(_loc5_,_loc6_);
         }
         else
         {
            _loc8_ = param1.readInt();
            _loc9_ = param1.readInt();
            _loc10_ = param1.readByte();
            _loc11_ = param1.readUTF();
            this.superMountMediator.setUpdataItem(_loc8_,_loc9_,_loc3_,_loc10_,_loc11_);
         }
      }
      
      public function received_52096(param1:ByteArray) : void
      {
         ZLog.add("52096：圣兽兑换成功/失败");
         var _loc2_:int = param1.readByte();
         this.superMountMediator.superMountZhuanZhiComplete(_loc2_);
      }
      
      public function received_52098(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         ZLog.add("52098：圣兽互换成功/失败。。。。。" + _loc3_);
         switch(_loc4_)
         {
            case 1:
               this.mount_ChangeTowSuperMountMediator.changeSuperMountComplete(_loc3_);
               break;
            case 2:
               this.mount_moshouHuhuanMediator.changeSuperMountComplete(_loc3_);
         }
      }
      
      public function received_52032(param1:ByteArray) : void
      {
         ZLog.add("52032：返回 使用活动碎片 兑换魔兽 的具体信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readByte();
         this.mount_jiaohuanMoshouMediator.refreshPanel(Boolean(_loc2_),_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      public function received_52034(param1:ByteArray) : void
      {
         ZLog.add("52034：碎片兑换魔兽 成功/失败");
         var _loc2_:int = param1.readByte();
         this.mount_jiaohuanMoshouMediator.changeMoshouComplete(_loc2_);
      }
      
      public function received_52040(param1:ByteArray) : void
      {
         var isShow:Boolean = false;
         var loadUrl:String = null;
         var $data:ByteArray = param1;
         var type:int = $data.readInt();
         if(type == 1)
         {
            isShow = $data.readByte() == 1;
            if(isShow)
            {
               if(this.spaceMc == null)
               {
                  loadUrl = GameConfig.fileBaseFolder + "res/data/mc/texiaoMc/space.swf";
                  LoaderManager.lazyLoad(function(param1:Event):void
                  {
                     var $e:Event = param1;
                     var loadingItem:LoadingItem = $e.target as LoadingItem;
                     spaceMc = loadingItem.content as MovieClip;
                     if(spaceMc)
                     {
                        spaceMc.play();
                        spaceMc.x = (GameConfig.sceneWidth - spaceMc.width) / 2;
                        spaceMc.y = GameConfig.sceneHeight - 250;
                        spaceMc.mouseChildren = false;
                        spaceMc.mouseEnabled = false;
                        GameInstance.uiInstance.letterContainer.addChild(spaceMc);
                        if(timer == null)
                        {
                           timer = new Timer(5000);
                           timer.addEventListener(TimerEvent.TIMER,function(param1:Event = null):void
                           {
                              GameState.SPACE_TO_SKILL = false;
                              if(spaceMc != null && spaceMc.parent != null)
                              {
                                 spaceMc.parent.removeChild(spaceMc);
                              }
                              if(timer != null)
                              {
                                 timer.stop();
                              }
                           });
                        }
                        timer.reset();
                        timer.start();
                        GameState.SPACE_TO_SKILL = true;
                     }
                  },null,false,loadUrl);
               }
               else
               {
                  if(this.spaceMc.parent != null)
                  {
                     this.spaceMc.parent.removeChild(this.spaceMc);
                  }
                  this.spaceMc.x = (GameConfig.sceneWidth - this.spaceMc.width) / 2;
                  this.spaceMc.y = GameConfig.sceneHeight - 250;
                  this.spaceMc.mouseChildren = false;
                  this.spaceMc.mouseEnabled = false;
                  this.spaceMc.play();
                  GameInstance.uiInstance.letterContainer.addChild(this.spaceMc);
                  if(this.timer == null)
                  {
                     this.timer = new Timer(5000);
                     this.timer.addEventListener(TimerEvent.TIMER,function(param1:Event = null):void
                     {
                        GameState.SPACE_TO_SKILL = false;
                        if(spaceMc != null && spaceMc.parent != null)
                        {
                           spaceMc.parent.removeChild(spaceMc);
                        }
                        if(timer != null)
                        {
                           timer.stop();
                        }
                     });
                  }
                  this.timer.reset();
                  this.timer.start();
                  GameState.SPACE_TO_SKILL = true;
               }
            }
            else
            {
               GameState.SPACE_TO_SKILL = false;
               if(this.spaceMc != null && this.spaceMc.parent != null)
               {
                  this.spaceMc.parent.removeChild(this.spaceMc);
               }
               if(this.timer != null)
               {
                  this.timer.stop();
               }
            }
         }
         else
         {
            loadUrl = GameConfig.fileBaseFolder + "res/data/mc/texiaoMc/" + type + ".swf";
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var mc:MovieClip = null;
               var $e:Event = param1;
               var loadingItem:LoadingItem = $e.target as LoadingItem;
               mc = loadingItem.content as MovieClip;
               if(mc)
               {
                  mc.gotoAndPlay(1);
                  mc.addEventListener(Event.ENTER_FRAME,function(param1:Event = null):void
                  {
                     if(param1.target.currentFrame == param1.target.totalFrames)
                     {
                        if(mc != null)
                        {
                           if(mc.parent != null)
                           {
                              mc.parent.removeChild(mc);
                           }
                        }
                     }
                  });
                  mc.x = (GameConfig.sceneWidth - mc.width) / 2;
                  mc.y = (GameConfig.sceneHeight - mc.height) / 2;
                  mc.mouseChildren = false;
                  mc.mouseEnabled = false;
                  GameInstance.uiInstance.letterContainer.addChild(mc);
               }
            },null,false,loadUrl);
         }
      }
      
      public function received_60602(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:PureMount = null;
         var _loc12_:String = null;
         var _loc2_:int = param1.readInt();
         if(_loc2_ != GameInstance.mainCharData.mountInfo.selectedMountID)
         {
            return;
         }
         var _loc3_:int = param1.readByte();
         if(_loc3_ == 1)
         {
            ZLog.add("60602\t返回请求坐骑涅槃面板");
            _loc4_ = param1.readInt();
            _loc5_ = param1.readInt();
            _loc6_ = param1.readInt();
            _loc7_ = param1.readInt();
            _loc8_ = param1.readInt();
            _loc9_ = param1.readByte() == 1;
            _loc10_ = param1.readByte() == 1;
            this.mainCharRidePlaneMediator.showFeedPanel();
            _loc11_ = GameInstance.mainCharData.mountInfo.selectedMount;
            this.mainCharRideFeedPlaneMediator.showNiePanPanel();
            this.mainCharRideFeedPlaneMediator.setNiePan(_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
         }
         else
         {
            _loc12_ = NetWorkManager.readGILMsg(param1);
            this.mainCharRidePlaneMediator.hideFeedPanel();
            ZLog.add("60602\t返回请求坐骑涅槃面板. 失败,原因" + _loc12_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc12_);
            NoticeManager.notify(NoticeManager.FOOT,_loc12_);
         }
      }
      
      public function received_60604(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         ZLog.add("60604\t消除记忆结果");
         var _loc2_:Boolean = param1.readByte() == 1;
         if(_loc2_)
         {
            _loc3_ = param1.readByte();
            this.mainCharRideFeedPlaneMediator.showNiePanZhuanYi(_loc3_);
         }
      }
      
      public function received_60606(param1:ByteArray) : void
      {
         ZLog.add("60606\t返回兑换信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_.push(param1.readInt());
            _loc4_++;
         }
      }
      
      public function received_60608(param1:ByteArray) : void
      {
         var result:Boolean;
         var huiFuStatus:Function;
         var shake1:Function;
         var charID:int = 0;
         var id:int = 0;
         var char:SceneCharacter = null;
         var hasRun:Boolean = false;
         var fromApd:AvatarParamData = null;
         var $data:ByteArray = param1;
         ZLog.add("60608\t兑换坐骑结果");
         result = $data.readByte() == 1;
         if(result)
         {
            charID = $data.readInt();
            id = $data.readInt();
            char = GameInstance.scene.getCharByID(charID);
            if(char != null)
            {
               huiFuStatus = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
               {
                  if(hasRun)
                  {
                     return;
                  }
                  hasRun = true;
                  if((char.restStatus == RestType.SIT || char.restStatus == RestType.DOUBLE_SIT) && char.isOnMount != true && char.getStatus() != CharStatusType.SIT)
                  {
                     char.playTo(CharStatusType.SIT);
                  }
                  FightManager.be_blackWhite(GameInstance.mainChar,true,"ui.darken");
               };
               shake1 = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
               {
                  FightManager.screen_shake(0.5,70);
               };
               hasRun = false;
               if(char == GameInstance.mainChar)
               {
                  this.mainCharRideFeedPlaneMediator.setNiePanDuiHuanResult(result,id);
                  this.msgSenderProxy.send_50029([GameInstance.mainChar.id,2]);
               }
               FightManager.be_blackWhite(GameInstance.mainChar,false,"ui.darken");
               fromApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,10470),AvatarPartType.MAGIC);
               fromApd.extendCallBack(null,shake1,null,huiFuStatus);
               char.showMagic_from1pass1toPointArea(new Point(-1 * 25,-1 * 25),fromApd);
            }
         }
      }
      
      public function received_60610(param1:ByteArray) : void
      {
         ZLog.add("60610\t返回请求涅槃突破数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         this.mainCharRideFeedPlaneMediator.setNiePanGoods(_loc2_,_loc3_);
      }
      
      public function received_60612(param1:ByteArray) : void
      {
         ZLog.add("60612\t返回请求涅槃");
         var _loc2_:int = param1.readByte();
         this.mainCharRideFeedPlaneMediator.setNiePanResult(_loc2_);
      }
      
      public function received_60652(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:Object = null;
         ZLog.add("60652\t返回兽元信息");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            _loc3_ = param1.readInt();
            if(_loc3_ != GameInstance.mainCharData.mountInfo.selectedMountID)
            {
               return;
            }
            _loc4_ = param1.readByte();
            _loc5_ = param1.readByte();
            _loc6_ = param1.readInt();
            _loc7_ = param1.readByte();
            _loc8_ = [];
            _loc9_ = 0;
            while(_loc9_ < _loc7_)
            {
               _loc10_ = new Object();
               _loc10_.name = param1.readUTF();
               _loc10_.id = param1.readInt();
               _loc10_.type = param1.readByte();
               _loc10_.gongji = param1.readInt();
               _loc10_.fangyu = param1.readInt();
               _loc10_.baoji = param1.readInt();
               _loc10_.shanbi = param1.readInt();
               _loc10_.shengming = param1.readInt();
               _loc10_.neili = param1.readInt();
               _loc10_.tili = param1.readInt();
               _loc10_.skill = param1.readInt();
               _loc10_.x = param1.readInt();
               _loc10_.y = param1.readInt();
               _loc10_.zhenqi = param1.readInt();
               _loc10_.lv = param1.readInt();
               _loc8_.push(_loc10_);
               _loc9_++;
            }
            this.mainCharRidePlaneMediator.setTabBarName(12);
            this.mainCharRidePlaneMediator.showFeedPanel();
            this.mainCharRideFeedPlaneMediator.showShouYuanPanel();
            this.mainCharRideFeedPlaneMediator.setShouYuanData(_loc4_,_loc5_,_loc6_,_loc8_);
         }
         else
         {
            this.mainCharRidePlaneMediator.hideFeedPanel();
            ZLog.add("60652\t返回兽元信息失败");
         }
      }
      
      public function received_60656(param1:ByteArray) : void
      {
         var _loc5_:AvatarParamData = null;
         ZLog.add("60656  返回兽元冲穴延时");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(_loc3_);
         if(_loc4_ != null)
         {
            if(_loc4_ == GameInstance.mainChar)
            {
               this.mainCharRideFeedPlaneMediator.showShouYuanTuPo(false);
               PipeManager.sendMsg(PipeConstants.HIDE_ALL_UI_TENS,false);
            }
            _loc5_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_XUEWEI_DELAY),AvatarPartType.MAGIC);
            _loc5_.id = SpeciaAvatarPartID.XUEWEI_DELAY;
            _loc4_.loadAvatarPart(_loc5_);
         }
      }
      
      public function received_60654(param1:ByteArray) : void
      {
         var _buf:ByteArray;
         var charID:int;
         var tag:int;
         var type:int;
         var shake:Function;
         var shake1:Function;
         var hasRun:Boolean = false;
         var huiFuStatus:Function = null;
         var char:SceneCharacter = null;
         var fromApd:AvatarParamData = null;
         var fromApd2:AvatarParamData = null;
         var $data:ByteArray = param1;
         huiFuStatus = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
         {
            if(hasRun)
            {
               return;
            }
            hasRun = true;
            if((char.restStatus == RestType.SIT || char.restStatus == RestType.DOUBLE_SIT) && char.isOnMount != true && char.getStatus() != CharStatusType.SIT)
            {
               char.playTo(CharStatusType.SIT);
            }
            PipeManager.sendMsg(PipeConstants.HIDE_ALL_UI_TENS,true);
         };
         ZLog.add(" 60654\t返回突破兽元结果");
         _buf = $data;
         charID = _buf.readInt();
         tag = _buf.readByte();
         type = _buf.readByte();
         hasRun = false;
         char = GameInstance.scene.getCharByID(charID);
         if(tag == 1 && char != null)
         {
            shake = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               FightManager.screen_shake(0.4,50);
            };
            shake1 = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               FightManager.screen_shake(0.5,70);
            };
            if(char == GameInstance.mainChar)
            {
               PipeManager.sendMsg(PipeConstants.HIDE_ALL_UI_TENS,false);
            }
            char.removeAvatarPartByID(SpeciaAvatarPartID.XUEWEI_DELAY);
            if(type == 0)
            {
               fromApd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,10464),AvatarPartType.MAGIC);
               fromApd.extendCallBack(null,shake,null,huiFuStatus);
               char.showMagic_from1pass1toPointArea(new Point(-1 * 25,-1 * 25),fromApd);
            }
            else
            {
               fromApd2 = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,10465),AvatarPartType.MAGIC);
               fromApd2.extendCallBack(null,shake1,null,huiFuStatus);
               char.showMagic_from1pass1toPointArea(new Point(-1 * 25,-1 * 25),fromApd2);
            }
         }
      }
      
      public function received_50056(param1:ByteArray) : void
      {
         ZLog.add("50056 \t返回提升出战潜力面板");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = "";
         if(_loc3_ == 1)
         {
            _loc4_ = param1.readInt();
            _loc5_ = param1.readInt();
         }
         else
         {
            _loc6_ = param1.readUTF();
         }
         this.mainCharRidePlaneMediator.showFeedPanel();
         this.mainCharRidePlaneMediator.setPotential(_loc4_,_loc5_);
      }
      
      public function received_60682(param1:ByteArray) : void
      {
         var _loc4_:PureMount = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         ZLog.add("60682 返回月光宝盒使用面板坐骑列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:Array = [];
         var _loc5_:int = _loc2_.readByte();
         var _loc6_:int = _loc2_.readByte();
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readInt();
            _loc10_ = _loc2_.readUTF();
            _loc11_ = _loc2_.readShort();
            _loc12_ = _loc2_.readByte();
            _loc13_ = _loc2_.readByte();
            _loc4_ = new PureMount(_loc9_);
            _loc4_.id = _loc8_;
            _loc4_.name = _loc10_;
            _loc4_.mountAttributeInfo.lv = _loc11_;
            _loc4_.fightStatus = _loc12_;
            _loc4_.mountAttributeInfo.quality = _loc13_;
            _loc3_.push(_loc4_);
            _loc7_++;
         }
         this.yueGuangBaoHePanelMediator.setRideList(_loc5_,_loc6_,_loc3_);
      }
      
      public function received_60684(param1:ByteArray) : void
      {
         ZLog.add("60684 返回重新涅槃结果");
         var _loc2_:Boolean = param1.readByte() == 1;
         var _loc3_:int = param1.readInt();
         this.yueGuangBaoHePanelMediator.setResult(_loc2_,_loc3_);
      }
      
      public function received_60662(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         ZLog.add("60662 返回查看玩家兽元加成信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = new Array();
         if(_loc2_ == 1)
         {
            _loc4_ = 0;
            while(_loc4_ < 7)
            {
               _loc3_[_loc4_] = param1.readInt();
               _loc4_++;
            }
            _loc5_ = param1.readInt();
            _loc4_ = 7;
            while(_loc4_ < _loc5_ + 7)
            {
               _loc3_[_loc4_] = param1.readInt();
               _loc4_++;
            }
         }
         else
         {
            _loc3_[0] = "-1";
         }
         this.targetCharRidePlaneMediator.setShouYuanTips(_loc3_);
      }
      
      public function received_60686(param1:ByteArray) : void
      {
         var _loc4_:PureMount = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         ZLog.add("60686 返回血兽蜕变丹使用面板坐骑列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:Array = [];
         var _loc5_:int = _loc2_.readByte();
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = _loc2_.readInt();
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readUTF();
            _loc10_ = _loc2_.readShort();
            _loc11_ = _loc2_.readByte();
            _loc12_ = _loc2_.readByte();
            _loc13_ = _loc2_.readInt();
            _loc4_ = new PureMount(_loc8_);
            _loc4_.id = _loc7_;
            _loc4_.name = _loc9_;
            _loc4_.mountAttributeInfo.lv = _loc10_;
            _loc4_.fightStatus = _loc11_;
            _loc4_.mountAttributeInfo.quality = _loc12_;
            _loc4_.mountAttributeInfo.identity = _loc13_;
            _loc3_.push(_loc4_);
            _loc6_++;
         }
         this.xueShouTuiBianPanelMediator.setRideList(_loc5_,_loc3_);
      }
      
      public function received_60688(param1:ByteArray) : void
      {
         ZLog.add("60688 返回血兽蜕变结果");
         var _loc2_:Boolean = param1.readByte() == 1;
         var _loc3_:String = param1.readUTF();
         var _loc4_:String = HeadResChange.headResChangeToString(param1.readByte());
         this.xueShouTuiBianPanelMediator.setResult(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_74102(param1:ByteArray) : void
      {
         var _loc4_:PureMount = null;
         var _loc6_:int = 0;
         var _loc9_:Object = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:String = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:Object = null;
         ZLog.add("74102\t\t 返回可幻化坐骑列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:Array = [];
         var _loc5_:int = _loc2_.readByte();
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc9_ = new Object();
            _loc10_ = _loc2_.readInt();
            _loc11_ = _loc2_.readInt();
            _loc12_ = _loc2_.readUTF();
            _loc13_ = _loc2_.readShort();
            _loc14_ = _loc2_.readByte();
            _loc15_ = _loc2_.readInt();
            _loc9_.id = _loc10_;
            _loc9_.name = _loc12_;
            _loc9_.lv = _loc13_;
            _loc9_.nextId = _loc15_;
            _loc3_.push(_loc9_);
            _loc6_++;
         }
         var _loc7_:int = _loc2_.readByte();
         var _loc8_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            _loc16_ = new Object();
            _loc16_.id = _loc2_.readInt();
            _loc16_.gongJi = _loc2_.readDouble();
            _loc16_.fangYu = _loc2_.readDouble();
            _loc16_.shengMing = _loc2_.readDouble();
            _loc16_.baoJi = _loc2_.readDouble();
            _loc16_.shanBi = _loc2_.readDouble();
            _loc16_.goodsId = _loc2_.readInt();
            _loc16_.needNum = _loc2_.readInt();
            _loc8_.push(_loc16_);
            _loc6_++;
         }
         this.fengLeiShouPlaneMediator.setRideList(_loc5_,_loc3_,_loc8_);
      }
      
      public function received_74106(param1:ByteArray) : void
      {
         ZLog.add("74106 \t激活风雷兽结果");
         var _loc2_:Boolean = param1.readByte() == 1;
         this.fengLeiShouPlaneMediator.setResult(_loc2_);
      }
      
      public function received_74152(param1:ByteArray) : void
      {
         ZLog.add("74152 \t\t返回玩家巅峰兽信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_.push(_loc2_.readInt());
            _loc6_++;
         }
         var _loc7_:int = _loc2_.readByte();
         var _loc8_:int = _loc2_.readInt();
         var _loc9_:PureMount = new PureMount(_loc8_);
         _loc9_.id = _loc2_.readInt();
         _loc9_.name = _loc2_.readUTF();
         _loc9_.mountAttributeInfo.lv = _loc2_.readByte();
         _loc9_.nowHate = _loc2_.readInt();
         _loc9_.maxHate = _loc2_.readInt();
         _loc9_.skillID = _loc2_.readInt();
         _loc9_.skillContent = _loc2_.readUTF();
         _loc9_.mountAttributeInfo.append_hp = param1.readDouble();
         _loc9_.mountAttributeInfo.append_mp = param1.readDouble();
         _loc9_.mountAttributeInfo.append_pp = param1.readDouble();
         _loc9_.mountAttributeInfo.append_ap = param1.readDouble();
         _loc9_.mountAttributeInfo.append_dp = param1.readDouble();
         _loc9_.mountAttributeInfo.append_cp = param1.readDouble();
         _loc9_.mountAttributeInfo.append_ev = param1.readDouble();
         _loc9_.fightStatus = _loc2_.readByte();
         _loc9_.isHave = _loc2_.readByte() == 1;
         _loc9_.isDefaultShow = _loc2_.readByte() == 1;
         _loc9_.needGongXun = _loc2_.readInt();
         var _loc10_:int = _loc2_.readInt();
         _loc9_.ynGoodID = _loc2_.readInt();
         _loc9_.ynState = _loc2_.readByte();
         if(_loc3_ == -1 || _loc3_ == GameInstance.mainChar.id)
         {
            this.dianFengPlaneMediator.setData(_loc7_,_loc5_,_loc9_,_loc10_);
         }
         else if(GameInstance.lookPlayerID != -1 && _loc3_ == GameInstance.lookPlayerID)
         {
            this.targetCharRidePlaneMediator.showTargetDianFengShou(true);
            this.targetCharRidePlaneMediator.setDianFengShouData(_loc7_,_loc5_,_loc9_,_loc10_);
         }
      }
      
      public function received_74154(param1:ByteArray) : void
      {
         ZLog.add("74154 \t玩家激活巅峰兽结果");
         var _loc2_:Boolean = param1.readByte() == 1;
         this.dianFengPlaneMediator.setResult(_loc2_);
      }
      
      public function received_74160(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:PureMount = null;
         ZLog.add("74160 \t\t返回玩家所有巅峰兽信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_.readInt();
            _loc6_ = new PureMount(_loc5_);
            _loc6_.id = _loc2_.readInt();
            _loc6_.name = _loc2_.readUTF();
            _loc6_.mountAttributeInfo.lv = _loc2_.readByte();
            _loc6_.nowHate = _loc2_.readInt();
            _loc6_.maxHate = _loc2_.readInt();
            _loc6_.skillID = _loc2_.readInt();
            _loc6_.skillContent = _loc2_.readUTF();
            _loc6_.mountAttributeInfo.append_hp = param1.readDouble();
            _loc6_.mountAttributeInfo.append_mp = param1.readDouble();
            _loc6_.mountAttributeInfo.append_pp = param1.readDouble();
            _loc6_.mountAttributeInfo.append_ap = param1.readDouble();
            _loc6_.mountAttributeInfo.append_dp = param1.readDouble();
            _loc6_.mountAttributeInfo.append_cp = param1.readDouble();
            _loc6_.mountAttributeInfo.append_ev = param1.readDouble();
            _loc6_.fightStatus = _loc2_.readByte();
            _loc6_.isHave = _loc2_.readByte() == 1;
            _loc6_.isDefaultShow = _loc2_.readByte() == 1;
            _loc6_.needGongXun = _loc2_.readInt();
            GameInstance.mainCharData.mountInfo.dianFengMountArr.push(_loc6_);
            _loc4_++;
         }
      }
   }
}

