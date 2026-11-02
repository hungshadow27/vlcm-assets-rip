package com.tgame.moudels.scene.model
{
   import com.fireice.alert.FAlert;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.map.MapRes;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.res.mount.MountRes;
   import com.tgame.common.res.mount.MountResManager;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.SpeciaAvatarPartID;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.FightManager;
   import com.tgame.manager.HeadFaceManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ProcessManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.TaskTracker;
   import com.tgame.moudels.login.view.*;
   import com.tgame.shell.controller.Shell_StartupCommand;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.tools.SceneCache;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Scene_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Scene_MsgReceivedProxy";
      
      private var isFristChangeLine:Boolean = true;
      
      private var _msgSenderProxy:Scene_MsgSenderProxy;
      
      private var _sceneProxy:Scene_SceneProxy;
      
      public function Scene_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get msgSenderProxy() : Scene_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(Scene_MsgSenderProxy.NAME) as Scene_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function get sceneProxy() : Scene_SceneProxy
      {
         if(!this._sceneProxy)
         {
            this._sceneProxy = facade.retrieveProxy(Scene_SceneProxy.NAME) as Scene_SceneProxy;
         }
         return this._sceneProxy;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([30102,10020,40300,10106,10032,10034,10036,10038,10046,50820,50830,50832,10096,10028,10080,10082,50822,60000,60002,10502,10504,10506,10508,81126,10510,10512,10300,10340,10048,10030,10070,10054,10056,10058,10174,10138,10066,10072,10060,10068,10172,72458,73046,71050,71052,73784],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([30102,10020,40300,10106,10032,10034,10036,10038,10046,50820,50830,50832,10096,10028,10080,10082,50822,60000,60002,10502,10504,10506,10508,81126,10510,10512,10300,10340,10048,10030,10070,10054,10056,10058,10138,10066,10072,10060,10068,10174,10172,72458,73046,71050,71052,73784],NAME);
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
      
      public function received_30102(param1:ByteArray) : void
      {
         ZLog.add("30102：进入聊天服务器响应");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 0)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_CHAT,LanResManager.getLanTextWords(this,"请刷新网页重新连接"));
         }
      }
      
      public function received_40300(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Object = null;
         ZLog.add("40300：得到分线服务器列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = _loc2_.readByte();
            _loc7_ = _loc2_.readUTF();
            _loc8_ = _loc2_.readUTF();
            _loc9_ = _loc2_.readUTF();
            _loc7_ = Shell_StartupCommand._noteBody.parameters.loginServer;
            _loc8_ = Shell_StartupCommand._noteBody.parameters.loginPort;
            _loc10_ = _loc2_.readInt();
            if(_loc10_ < 100)
            {
               _loc11_ = 1;
            }
            else if(_loc10_ >= 100 && _loc10_ <= 400)
            {
               _loc11_ = 2;
            }
            else
            {
               _loc11_ = 3;
            }
            _loc12_ = {
               "id":_loc6_,
               "charCount":_loc10_,
               "hostPort":_loc8_,
               "hostName":_loc7_,
               "serverName":_loc9_,
               "status":_loc11_
            };
            _loc4_.push(_loc12_);
            _loc5_++;
         }
         if(this.isFristChangeLine)
         {
            this.isFristChangeLine = false;
            TPreLoader.hideLoadingUI(false);
            PipeManager.sendMsg(PipeConstants.SHOW_LINE,_loc4_);
         }
         else
         {
            PipeManager.sendMsg(PipeConstants.CHANGE_LINE,_loc4_);
         }
      }
      
      public function received_10106(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            ZLog.add("10106：进入分线服务器成功");
            GameState.enterLineSucess = true;
            GameConfig.sever_time_with_10106 = _loc2_.readUTF();
            ProcessManager.clientReady();
         }
         else
         {
            _loc4_ = NetWorkManager.readGILMsg(_loc2_);
            NoticeManager.notify(NoticeManager.ALERT,_loc4_);
            ZLog.add("10106：进入分线服务器失败");
         }
      }
      
      public function received_10020(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:MapRes = null;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:Boolean = false;
         if(_loc3_ == 1 || _loc3_ == 2)
         {
            _loc5_ = _loc2_.readInt();
            _loc6_ = _loc2_.readUTF();
            _loc7_ = _loc2_.readShort();
            _loc8_ = _loc2_.readShort();
            _loc9_ = MapTransManager.getMapRes(_loc5_);
            if(_loc9_ != null)
            {
               ZLog.add(["10020：服务器返回地图（此消息携带地图ID、地图地址和主角坐标）",_loc9_.id,_loc9_.name]);
               GameState.enterSceneSucess = true;
               GameConfig.wantEnterMapRes = _loc9_;
               ProcessManager.enterScene([new Point(_loc7_,_loc8_),_loc3_ == 1]);
               PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,null);
               if(_loc5_ == 20251 || _loc5_ == 20252 || _loc5_ == 20253 || _loc5_ == 20268)
               {
                  _loc4_ = true;
               }
               if(_loc5_ == 20280)
               {
                  GameConfig.wantEnterMapRes.isOne = false;
                  GameConfig.wantEnterMapRes.isSecond = false;
                  GameConfig.wantEnterMapRes.isThird = false;
                  GameConfig.wantEnterMapRes.isFour = false;
               }
               for(_loc10_ in GameState.xianJingDict)
               {
                  delete GameState.xianJingDict[_loc10_];
               }
            }
            else
            {
               FAlert.show(LanResManager.getLanTextWords(this,"请刷新网页重新连接1"));
            }
         }
         else
         {
            _loc11_ = NetWorkManager.readGILMsg(_loc2_);
            NoticeManager.notify(NoticeManager.ALERT,_loc11_);
            ZLog.add("10020：进入场景消息失败:" + _loc11_);
         }
         FightManager.be_darken(GameInstance.mainChar,!_loc4_,"ui.darken");
      }
      
      public function received_10054(param1:ByteArray) : void
      {
         var _loc6_:String = null;
         var _loc20_:int = 0;
         var _loc22_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:int = 0;
         var _loc37_:int = 0;
         ZLog.add("10054：接收 自定义换装的怪物 进入主角视野区");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readShort();
         var _loc5_:int = param1.readByte();
         if(_loc5_)
         {
            _loc6_ = param1.readUTF();
         }
         var _loc7_:Number = param1.readShort();
         var _loc8_:Number = param1.readDouble();
         var _loc9_:Number = param1.readDouble();
         var _loc10_:int = param1.readShort();
         var _loc11_:int = param1.readShort();
         var _loc12_:int = param1.readByte();
         var _loc13_:Boolean = param1.readByte() == 1;
         var _loc14_:Boolean = param1.readByte() == 1;
         var _loc15_:Boolean = param1.readByte() == 1;
         var _loc16_:Boolean = param1.readByte() == 1;
         var _loc17_:Boolean = param1.readByte() == 1;
         var _loc18_:Boolean = param1.readByte() == 1;
         var _loc19_:int = param1.readInt();
         _loc20_ = param1.readByte();
         var _loc21_:int = param1.readByte();
         var _loc23_:Array = [];
         _loc22_ = 0;
         while(_loc22_ < _loc21_)
         {
            _loc35_ = param1.readInt();
            _loc23_[_loc23_.length] = [_loc35_,0,0,0,0,0];
            _loc22_++;
         }
         var _loc24_:int = param1.readByte();
         var _loc25_:int = param1.readByte();
         var _loc26_:int = param1.readByte();
         var _loc27_:int = param1.readByte();
         var _loc28_:int = param1.readByte();
         var _loc29_:Array = [];
         _loc22_ = 0;
         while(_loc22_ < _loc28_)
         {
            _loc36_ = param1.readInt();
            _loc29_[_loc29_.length] = _loc36_;
            _loc22_++;
         }
         var _loc30_:Array = [];
         var _loc31_:int = param1.readShort();
         var _loc32_:int = 0;
         while(_loc32_ < _loc31_)
         {
            _loc37_ = param1.readInt();
            _loc30_.push(_loc37_);
            _loc32_++;
         }
         var _loc33_:String = HeadResChange.headResChangeToString(param1.readByte());
         _loc20_ = param1.readByte();
         var _loc34_:Object = {
            "headImg":_loc33_,
            "infoArr":_loc29_,
            "menpai":_loc25_,
            "jingmai":_loc26_,
            "silingzhen":_loc27_,
            "chenghao":_loc30_
         };
         this.sceneProxy.receivedMonsterEnterScene(_loc2_,_loc3_,_loc4_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc23_,_loc24_,_loc6_,_loc34_);
      }
      
      public function received_10032(param1:ByteArray) : void
      {
         var isReName:int;
         var buffCount:int;
         var time:int;
         var roleID:int = 0;
         var modelID:int = 0;
         var level:int = 0;
         var reName:String = null;
         var speed:Number = NaN;
         var hpNow:Number = NaN;
         var hpMax:Number = NaN;
         var x:int = 0;
         var y:int = 0;
         var status:int = 0;
         var seguai_1:Boolean = false;
         var seguai_2:Boolean = false;
         var seguai_3:Boolean = false;
         var seguai_4:Boolean = false;
         var seguai_5:Boolean = false;
         var seguai_6:Boolean = false;
         var seguai_7:int = 0;
         var seguai_8:int = 0;
         var i:int = 0;
         var buffIDArr:Array = null;
         var btCount:int = 0;
         var specialChenghaoID:int = 0;
         var $zhenyingID:int = 0;
         var compl:Function = null;
         var len:int = 0;
         var newBytes:ByteArray = null;
         var load:Loader = null;
         var buffID:int = 0;
         var $data:ByteArray = param1;
         compl = function(param1:Event):void
         {
            var _loc2_:Bitmap = param1.target.content as Bitmap;
            var _loc3_:Sprite = new Sprite();
            _loc3_.addChild(_loc2_);
            sceneProxy.receivedMonsterEnterScene(roleID,modelID,level,speed,hpNow,hpMax,x,y,status,seguai_1,seguai_2,seguai_3,seguai_4,seguai_5,seguai_6,seguai_7,seguai_8,buffIDArr,btCount,reName,null,specialChenghaoID,$zhenyingID,_loc3_);
         };
         ZLog.add("10032：接收怪物进入主角视野区");
         roleID = $data.readInt();
         modelID = $data.readInt();
         level = $data.readShort();
         isReName = $data.readByte();
         if(isReName == 1)
         {
            reName = $data.readUTF();
         }
         else if(isReName == 2)
         {
            len = $data.readInt();
            newBytes = new ByteArray();
            $data.readBytes(newBytes,0,len);
            load = new Loader();
            load.loadBytes(newBytes);
            load.contentLoaderInfo.addEventListener(Event.COMPLETE,compl);
         }
         speed = $data.readShort();
         hpNow = $data.readDouble();
         hpMax = $data.readDouble();
         x = $data.readShort();
         y = $data.readShort();
         status = $data.readByte();
         seguai_1 = $data.readByte() == 1;
         seguai_2 = $data.readByte() == 1;
         seguai_3 = $data.readByte() == 1;
         seguai_4 = $data.readByte() == 1;
         seguai_5 = $data.readByte() == 1;
         seguai_6 = $data.readByte() == 1;
         seguai_7 = $data.readInt();
         seguai_8 = $data.readByte();
         buffCount = $data.readByte();
         buffIDArr = [];
         i = 0;
         while(i < buffCount)
         {
            buffID = $data.readInt();
            buffIDArr[buffIDArr.length] = [buffID,0,0,0,0,0];
            i++;
         }
         btCount = $data.readByte();
         specialChenghaoID = $data.readInt();
         $zhenyingID = $data.readByte();
         time = $data.readInt();
         if(isReName != 2)
         {
            this.sceneProxy.receivedMonsterEnterScene(roleID,modelID,level,speed,hpNow,hpMax,x,y,status,seguai_1,seguai_2,seguai_3,seguai_4,seguai_5,seguai_6,seguai_7,seguai_8,buffIDArr,btCount,reName,null,specialChenghaoID,$zhenyingID,null,time);
         }
      }
      
      public function received_10056(param1:ByteArray) : void
      {
         ZLog.add("10056 ：箭塔（属于怪物）进入视野");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readShort();
         var _loc5_:String = param1.readUTF();
         var _loc6_:Number = param1.readDouble();
         var _loc7_:Number = param1.readDouble();
         var _loc8_:int = param1.readShort();
         var _loc9_:int = param1.readShort();
         var _loc10_:int = param1.readByte();
         var _loc11_:int = param1.readByte();
         this.sceneProxy.receivedJiantaEnterScene(_loc2_,_loc3_,_loc4_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc5_,_loc11_);
      }
      
      public function received_10034(param1:ByteArray) : void
      {
         ZLog.add("10034：接收坐骑进入主角视野区");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:String = param1.readUTF();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readShort();
         var _loc7_:int = param1.readShort();
         var _loc8_:Number = param1.readShort();
         var _loc9_:Boolean = param1.readByte() == 1 ? true : false;
         if(_loc9_)
         {
            _loc4_ = LanResManager.getLanCommonTextWords("刺客");
         }
         this.sceneProxy.receivedMountEnterScene(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_10172(param1:ByteArray) : void
      {
         ZLog.add("10172：接收美人进入主角视野区");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:String = param1.readUTF();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readShort();
         var _loc7_:int = param1.readShort();
         var _loc8_:Number = param1.readShort();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         var _loc12_:int = param1.readInt();
         this.sceneProxy.receivedGirlEnterScene(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_);
      }
      
      public function received_10036(param1:ByteArray) : void
      {
         ZLog.add("10036：帮旗（属于怪物）进入视野");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readShort();
         var _loc5_:Number = param1.readDouble();
         var _loc6_:Number = param1.readDouble();
         var _loc7_:int = param1.readShort();
         var _loc8_:int = param1.readShort();
         var _loc9_:int = param1.readInt();
         var _loc10_:String = param1.readUTF();
         var _loc11_:String = param1.readUTF();
         var _loc12_:int = param1.readByte();
         var _loc13_:int = param1.readInt();
         var _loc14_:int = param1.readInt();
         var _loc15_:int = param1.readInt();
         this.sceneProxy.receivedBangqiEnterScene(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_);
      }
      
      public function received_10038(param1:ByteArray) : void
      {
         ZLog.add("10038：游龙之刃（属于怪物）进入视野");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readShort();
         var _loc5_:int = param1.readShort();
         this.sceneProxy.receivedYoulongzhirenEnterScene(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_10046(param1:ByteArray) : void
      {
         ZLog.add("10046：炮弹（属于怪物）进入视野");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readShort();
         var _loc4_:int = param1.readShort();
         var _loc5_:int = param1.readShort();
         this.sceneProxy.receivedPaodanEnterScene(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_50820(param1:ByteArray) : void
      {
         ZLog.add("50820：接收NPC好友进入主角视野区");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:String = param1.readUTF();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readShort();
         var _loc7_:int = param1.readShort();
         var _loc8_:Number = param1.readShort();
         this.sceneProxy.receivedNpcFriendEnterScene(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_50830(param1:ByteArray) : void
      {
         ZLog.add("50830：3V3竞技场旗子（属于怪物）进入视野");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readShort();
         var _loc5_:int = param1.readShort();
         var _loc6_:int = param1.readByte();
         this.sceneProxy.received3v3QiziEnterScene(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      public function received_50832(param1:ByteArray) : void
      {
         ZLog.add("50832：神符（属于怪物）进入视野");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readShort();
         var _loc5_:int = param1.readShort();
         this.sceneProxy.receivedShenfuEnterScene(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_10028(param1:ByteArray) : void
      {
         var _loc21_:int = 0;
         var _loc22_:String = null;
         var _loc26_:int = 0;
         var _loc33_:int = 0;
         var _loc36_:int = 0;
         var _loc43_:int = 0;
         var _loc79_:int = 0;
         var _loc95_:int = 0;
         var _loc96_:int = 0;
         var _loc97_:int = 0;
         var _loc98_:int = 0;
         var _loc99_:int = 0;
         var _loc100_:int = 0;
         var _loc101_:Number = NaN;
         var _loc102_:int = 0;
         var _loc103_:int = 0;
         ZLog.add("10028：其他玩家进入主角视野区 ");
         var _loc2_:int = param1.readByte();
         var _loc3_:Number = param1.readDouble();
         var _loc4_:int = param1.readInt();
         if(_loc4_ == 0)
         {
            return;
         }
         var _loc5_:Boolean = param1.readByte() == 1;
         var _loc6_:Number = param1.readShort();
         var _loc7_:String = param1.readUTF();
         var _loc8_:int = int(param1.readUnsignedByte());
         var _loc9_:String = HeadResChange.headResChangeToString(param1.readByte());
         var _loc10_:int = param1.readByte();
         var _loc11_:int = param1.readShort();
         var _loc12_:int = param1.readShort();
         var _loc13_:Number = param1.readDouble();
         var _loc14_:Number = param1.readDouble();
         var _loc15_:Number = param1.readDouble();
         var _loc16_:Number = param1.readDouble();
         var _loc17_:Number = param1.readDouble();
         var _loc18_:Number = param1.readDouble();
         var _loc19_:Number = param1.readDouble();
         var _loc20_:int = param1.readByte();
         if(_loc20_ == 1)
         {
            _loc21_ = param1.readInt();
            _loc22_ = param1.readUTF();
         }
         var _loc23_:int = param1.readInt();
         var _loc24_:int = param1.readByte();
         var _loc25_:int = param1.readByte();
         var _loc27_:Array = [];
         _loc26_ = 0;
         while(_loc26_ < _loc25_)
         {
            _loc95_ = param1.readInt();
            _loc96_ = param1.readInt();
            _loc97_ = param1.readInt();
            _loc98_ = param1.readDouble();
            _loc99_ = param1.readInt();
            _loc27_[_loc27_.length] = [_loc95_,_loc96_,_loc97_,_loc98_,_loc99_,0];
            _loc26_++;
         }
         var _loc28_:int = param1.readByte();
         _loc26_ = 0;
         while(_loc26_ < _loc28_)
         {
            _loc100_ = param1.readInt();
            _loc101_ = param1.readDouble();
            _loc27_[_loc27_.length] = [_loc100_,0,0,0,0,_loc101_];
            _loc26_++;
         }
         var _loc29_:int = param1.readInt();
         var _loc30_:Array = [];
         var _loc31_:int = 0;
         _loc26_ = 0;
         while(_loc26_ < _loc29_)
         {
            _loc102_ = param1.readInt();
            _loc30_[_loc30_.length] = _loc102_;
            if(SpecialGoodsID.getSpecialAvatarType(_loc102_) > 0)
            {
               _loc31_ = SpecialGoodsID.getSpecialAvatarType(_loc102_);
            }
            _loc26_++;
         }
         var _loc32_:Boolean = param1.readByte() == 1;
         if(_loc32_)
         {
            _loc33_ = param1.readInt();
         }
         var _loc34_:int = param1.readByte();
         var _loc35_:int = param1.readByte();
         var _loc37_:Point = new Point();
         if(_loc35_ == 2)
         {
            _loc36_ = param1.readInt();
            _loc37_.x = param1.readShort();
            _loc37_.y = param1.readShort();
         }
         var _loc38_:int = 0;
         var _loc39_:int = 0;
         var _loc40_:int = 0;
         var _loc41_:Boolean = Boolean(param1.readByte() == 1);
         if(_loc41_)
         {
            _loc38_ = param1.readInt();
            _loc39_ = param1.readShort();
            _loc40_ = param1.readShort();
         }
         var _loc42_:int = param1.readByte();
         var _loc44_:Point = new Point();
         if(_loc42_ == 1 || _loc42_ == 2)
         {
            _loc43_ = param1.readInt();
            _loc44_.x = param1.readShort();
            _loc44_.y = param1.readShort();
         }
         var _loc45_:Number = param1.readDouble();
         var _loc46_:int = param1.readByte();
         var _loc47_:Array = [];
         _loc26_ = 0;
         while(_loc26_ < _loc46_)
         {
            _loc103_ = param1.readInt();
            _loc47_.push(_loc103_);
            _loc26_++;
         }
         var _loc48_:String = param1.readUTF();
         var _loc49_:int = 0;
         var _loc50_:int = 0;
         var _loc51_:int = 0;
         var _loc52_:int = 0;
         var _loc53_:int = 0;
         var _loc54_:int = param1.readByte();
         _loc26_ = 1;
         while(_loc26_ <= _loc54_)
         {
            switch(_loc26_)
            {
               case 1:
                  _loc49_ = param1.readInt();
                  break;
               case 2:
                  _loc50_ = param1.readInt();
                  break;
               case 3:
                  _loc51_ = param1.readInt();
                  break;
               case 4:
                  _loc52_ = param1.readInt();
                  break;
               case 5:
                  _loc53_ = param1.readInt();
            }
            _loc26_++;
         }
         var _loc55_:int = param1.readInt();
         var _loc56_:int = param1.readByte();
         var _loc57_:int = param1.readInt();
         var _loc58_:int = param1.readByte();
         var _loc59_:int = param1.readByte();
         if(_loc59_ >= 3)
         {
            _loc59_ = 3;
         }
         var _loc60_:int = param1.readByte();
         var _loc61_:int = param1.readShort();
         var _loc62_:Boolean = param1.readByte() == 1 ? true : false;
         var _loc63_:int = param1.readByte();
         var _loc64_:int = param1.readInt();
         var _loc65_:int = param1.readInt();
         var _loc66_:int = param1.readInt();
         var _loc67_:int = param1.readByte();
         var _loc68_:int = param1.readByte();
         var _loc69_:int = param1.readInt();
         var _loc70_:Boolean = Boolean(param1.readByte() == 1);
         var _loc71_:Boolean = Boolean(param1.readByte() == 1);
         var _loc72_:int = param1.readInt();
         var _loc73_:int = param1.readByte();
         var _loc74_:int = param1.readByte();
         var _loc75_:int = param1.readByte();
         var _loc76_:int = param1.readByte();
         var _loc77_:int = param1.readByte();
         var _loc78_:Boolean = Boolean(param1.readByte() == 1);
         if(_loc78_)
         {
            _loc79_ = param1.readByte();
         }
         var _loc80_:Boolean = Boolean(param1.readByte() == 1);
         var _loc81_:Boolean = Boolean(param1.readByte() == 1);
         var _loc82_:Boolean = Boolean(param1.readByte() == 1);
         var _loc83_:Boolean = Boolean(param1.readByte() == 1);
         var _loc84_:Boolean = Boolean(param1.readByte() == 1);
         var _loc85_:Boolean = Boolean(param1.readByte() == 1);
         var _loc86_:Boolean = Boolean(param1.readByte() == 1);
         var _loc87_:Boolean = Boolean(param1.readByte() == 1);
         var _loc88_:Boolean = Boolean(param1.readByte() == 1);
         var _loc89_:int = param1.readInt();
         var _loc90_:int = param1.readInt();
         var _loc91_:int = param1.readByte();
         var _loc92_:int = param1.readByte();
         var _loc93_:int = param1.readByte();
         var _loc94_:int = param1.readInt();
         this.sceneProxy.receivedPlayerEnterScene(_loc2_,_loc3_,_loc4_,_loc5_,_loc24_,_loc7_,_loc10_,_loc11_,_loc12_,_loc9_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,_loc21_,_loc22_,_loc23_,_loc6_,_loc27_,_loc30_,_loc32_,_loc33_,_loc34_,_loc35_,_loc36_,_loc37_,_loc42_,_loc43_,_loc44_,_loc45_,_loc47_,_loc48_,_loc8_,_loc49_,_loc50_,_loc51_,_loc52_,_loc53_,_loc55_,_loc56_,_loc57_,_loc59_,_loc60_,_loc63_,_loc58_,_loc31_,_loc61_,_loc62_,_loc64_,_loc38_,_loc39_,_loc40_,_loc65_,_loc67_,_loc68_,_loc69_,_loc66_,_loc70_,_loc71_,_loc72_,_loc73_,_loc78_,_loc79_,_loc77_,_loc80_,_loc81_,_loc88_,_loc89_,_loc90_,_loc91_,_loc74_,_loc75_,_loc82_,_loc83_,_loc76_,_loc84_,_loc85_,_loc86_,_loc87_,_loc92_,_loc93_,_loc19_,_loc94_);
      }
      
      public function received_72458(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc6_:GoodsRes = null;
         var _loc7_:int = 0;
         var _loc12_:int = 0;
         ZLog.add("72458：视野内玩家龙纹刻画信息发生变化");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         if(_loc3_)
         {
            _loc4_ = param1.readByte();
         }
         var _loc5_:int = param1.readInt();
         if(_loc5_ != 0)
         {
            _loc6_ = GoodsResManager.getGoodsRes(_loc5_);
            _loc7_ = _loc6_.id_m;
         }
         var _loc8_:SceneCharacter = GameInstance.scene.getCharByID(_loc2_,SceneCharacterType.PLAYER);
         if(_loc8_ == null)
         {
            return;
         }
         var _loc9_:Player = _loc8_.data as Player;
         var _loc10_:AvatarInfo = _loc9_.avatarInfo;
         _loc10_.isShowLongWenKeHua = _loc3_;
         _loc10_.longWenKeHuaYanse = _loc4_;
         var _loc11_:Array = SpeciaAvatarPartID.AVATAT_ID_LONGWENKEHUA[_loc9_.attributeInfo.partyID];
         if(_loc11_ != null)
         {
            _loc12_ = int(_loc11_[_loc9_.avatarInfo.longWenKeHuaYanse]);
         }
         if(_loc5_ == 0)
         {
            AvatarManager.taskOffAvatarData(_loc10_,ItemPositionRange.POSTION_YIFU,_loc10_.longwenid,_loc9_.attributeInfo.getSex());
         }
         else
         {
            AvatarManager.dressAvatarData(_loc10_,ItemPositionRange.POSTION_YIFU,_loc7_,_loc9_.attributeInfo.getSex(),_loc12_);
         }
         AvatarManager.updateMainAvatar(_loc8_);
      }
      
      public function received_10096(param1:ByteArray) : void
      {
         ZLog.add("10096：怪物离开主角视野区");
         var _loc2_:int = param1.readInt();
         this.sceneProxy.receivedCharLeaveScene(SceneCharacterType.MONSTER,_loc2_);
      }
      
      public function received_10082(param1:ByteArray) : void
      {
         ZLog.add("10082：坐骑离开主角视野区 ");
         var _loc2_:int = param1.readInt();
         this.sceneProxy.receivedCharLeaveScene(SceneCharacterType.MOUNT,_loc2_);
      }
      
      public function received_10174(param1:ByteArray) : void
      {
         ZLog.add("10174：美人离开主角视野区 ");
         var _loc2_:int = param1.readInt();
         this.sceneProxy.receivedCharLeaveScene(SceneCharacterType.GIRL,_loc2_);
      }
      
      public function received_50822(param1:ByteArray) : void
      {
         ZLog.add("50822：NPC好友离开主角视野区 ");
         var _loc2_:int = param1.readInt();
         this.sceneProxy.receivedCharLeaveScene(SceneCharacterType.NPC_FRIEND,_loc2_);
      }
      
      public function received_10080(param1:ByteArray) : void
      {
         ZLog.add("10080：玩家离开主角视野区 ");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         this.sceneProxy.receivedCharLeaveScene(_loc2_,_loc3_);
      }
      
      public function received_60000(param1:ByteArray) : void
      {
         var _loc10_:int = 0;
         var _loc11_:MountRes = null;
         var _loc12_:Array = null;
         var _loc13_:int = 0;
         var _loc14_:* = 0;
         var _loc15_:Goods = null;
         var _loc16_:Goods = null;
         ZLog.add("60000：角色换装(穿衣 与 解带)（包括主角） ");
         var _loc2_:int = param1.readInt();
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(_loc2_,SceneCharacterType.PLAYER);
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:Player = _loc3_.data as Player;
         var _loc5_:AvatarInfo = _loc4_.avatarInfo;
         var _loc6_:AttributeInfo = _loc4_.attributeInfo;
         var _loc7_:int = param1.readByte();
         var _loc8_:int = param1.readInt();
         if(_loc8_ == 310001 || _loc8_ == 310002)
         {
            return;
         }
         if(_loc8_ == 300001)
         {
            if(GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_DONGHUANGZHONG_ID])
            {
               _loc8_ = 371404;
            }
         }
         else if(_loc8_ == 300002)
         {
            if(GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_LIANYAOHU_ID])
            {
               _loc8_ = 371404;
            }
         }
         else if(_loc8_ == 300003)
         {
            if(GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_HAOTIANCHUI_ID])
            {
               _loc8_ = 371404;
            }
         }
         else if(_loc8_ == 300004)
         {
            if(GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_LINGLONGTA_ID])
            {
               _loc8_ = 371404;
            }
         }
         else if(_loc8_ == 300005)
         {
            if(GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_SHERIGONG_ID])
            {
               _loc8_ = 371404;
            }
         }
         if(SpecialGoodsID.getSpecialAvatarType(_loc8_) > 0)
         {
            _loc5_.usingFashion = _loc7_ == 1 ? SpecialGoodsID.getSpecialAvatarType(_loc8_) : 0;
         }
         if(_loc3_.isOnMount && _loc7_ == 1)
         {
            if(_loc5_.usingFashion == 1)
            {
               _loc5_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,SpecialGoodsID.HUANGJIN_SHENGLONG_ID),AvatarPartType.MOUNT);
               AvatarManager.updateMainAvatar(_loc3_,[SpeciaAvatarPartID.MOUNT]);
            }
            else if(_loc5_.useAvatarType > 0)
            {
               _loc5_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,AvatarManager.getAvatarIdByType(_loc5_.useAvatarType)),AvatarPartType.MOUNT);
               AvatarManager.updateMainAvatar(_loc3_,[SpeciaAvatarPartID.MOUNT]);
            }
            else
            {
               _loc10_ = _loc5_.lastMountId;
               _loc11_ = MountResManager.getMountRes(_loc10_);
               if(_loc11_ != null)
               {
                  _loc5_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,_loc11_.id_m),AvatarPartType.MOUNT);
               }
               AvatarManager.updateMainAvatar(_loc3_,[SpeciaAvatarPartID.MOUNT]);
            }
         }
         var _loc9_:GoodsRes = GoodsResManager.getGoodsRes(_loc8_);
         if(_loc9_.position == ItemPositionRange.POSTION_AOJIAN || _loc9_.position == ItemPositionRange.POSTION_STDRJ || _loc9_.position == ItemPositionRange.POSTION_YLZR || _loc9_.position == ItemPositionRange.POSTION_SHENQI || _loc9_.position == ItemPositionRange.POSTION_GJMY || _loc9_.position == ItemPositionRange.POSITION_LONGYA || _loc9_.position == ItemPositionRange.POSITION_YAYUEDAO || _loc9_.position == ItemPositionRange.POSITION_XUANTIEZHONGJIAN || _loc9_.position == ItemPositionRange.POSITION_GUANGMINGZHANG || _loc9_.position == ItemPositionRange.POSITION_HUIMIE || _loc9_.position == ItemPositionRange.POSITION_ZHUMOZHANG || _loc9_.position == ItemPositionRange.POSITION_CHIYAN || _loc9_.position == ItemPositionRange.POSITION_FENGTIANJI || _loc9_.position == ItemPositionRange.POSITION_TIANJING || _loc9_.position == ItemPositionRange.POSITION_HUOLONGDAO || _loc9_.position == ItemPositionRange.POSITION_TIANZHU || _loc9_.position == ItemPositionRange.POSITION_PANGUKAITIANFU || _loc9_.position == ItemPositionRange
         .POSITION_TIANDI || _loc9_.position == ItemPositionRange.POSITION_HANQIBINGPO || _loc9_.position == ItemPositionRange.POSITION_JIANZUNLONGQUANJIAN || _loc9_.position == ItemPositionRange.POSITION_CHUANGSHI || _loc9_.position == ItemPositionRange.POSITION_SUILIESHIFU || _loc9_.position == ItemPositionRange.POSITION_MOYUAN || _loc9_.position == ItemPositionRange.POSITION_FENGBAODAO || _loc9_.position == ItemPositionRange.POSITION_CHENGJIECHANGJI || _loc9_.position == ItemPositionRange.POSITION_TIANXIEJIAN || _loc9_.position == ItemPositionRange.POSITION_JUNZIJIAN || _loc9_.position == ItemPositionRange.POSITION_WANGZHEJIAN || _loc9_.position == ItemPositionRange.POSITION_FENGYUN || _loc9_.position == ItemPositionRange.POSITION_SHENGDAN2015 || _loc9_.position == ItemPositionRange.POSITION_FENGSHA || _loc9_.position == ItemPositionRange.POSITION_FENGYIJIAN || _loc9_.position == ItemPositionRange.POSITION_LEXINJI || _loc9_.position == ItemPositionRange.POSITION_FENGYINGJIAN || _loc9_.position == ItemPositionRange
         .POSITION_ZHENFENGJIAN || _loc9_.position == ItemPositionRange.POSITION_FENGYUNJIAN || _loc9_.position == ItemPositionRange.POSITION_BINGFENGJIAN || _loc9_.position == ItemPositionRange.POSITION_HONGLEIZHANGU || _loc9_.position == ItemPositionRange.POSITION_SANDENGGUFO || _loc9_.position == ItemPositionRange.POSITION_FONUJI || _loc9_.position == ItemPositionRange.POSITION_FENGYINJIAN || _loc9_.position == ItemPositionRange.POSITION_TIANMAJIAN || _loc9_.position == ItemPositionRange.POSITION_WUHUNJIAN || _loc9_.position == ItemPositionRange.POSITION_ZHENTIANJIAN || _loc9_.position == ItemPositionRange.POSITION_TIANXUE || _loc9_.position == ItemPositionRange.POSITION_XIONGJIJIAN || _loc9_.position == ItemPositionRange.POSITION_WUJINJIAN || _loc9_.position == ItemPositionRange.POSITION_SHUNTIANJIAN || _loc9_.position == ItemPositionRange.POSITION_WANGZHEQICANG || _loc9_.position == ItemPositionRange.POSITION_BIXUEJIAN || _loc9_.position == ItemPositionRange.POSITION_QINGFENGJIAN || _loc9_.position == ItemPositionRange
         .POSITION_WUYIJIAN || _loc9_.position == ItemPositionRange.POSITION_SHIJIANSHENQI || _loc9_.position == ItemPositionRange.POSITION_HUOLINJIAN || _loc9_.position == ItemPositionRange.POSITION_ZHUIHUNJI || _loc9_.position == ItemPositionRange.POSITION_BIYUDAO || _loc9_.position == ItemPositionRange.POSITION_WUWOZHANG || _loc9_.position == ItemPositionRange.POSITION_YEHUOHONGLIAN || _loc9_.position == ItemPositionRange.POSITION_MINGYUEDAO || _loc9_.position == ItemPositionRange.POSITION_QINGFENGJIAN2 || _loc9_.position == ItemPositionRange.POSITION_ZHIZUNJIAN || _loc9_.position == ItemPositionRange.POSITION_BAOLEIJI || _loc9_.position == ItemPositionRange.POSITION_MINGSHENGZHANG || _loc9_.position == ItemPositionRange.POSITION_ZUNSHIJIAN || _loc9_.position == ItemPositionRange.POSITION_RENZHEZHANG || _loc9_.position == ItemPositionRange.POSITION_ZHIZHEJIAN || _loc9_.position == ItemPositionRange.POSITION_YANGMINGJIAN || _loc9_.position == ItemPositionRange.POSITION_XIWANGJIAN || _loc9_.position == ItemPositionRange
         .POSITION_XUEJINGJIAN || _loc9_.position == ItemPositionRange.POSITION_XUANBINGJIAN || _loc9_.position == ItemPositionRange.POSITION_PINGANJIAN || _loc9_.position == ItemPositionRange.POSITION_QINGHUAJIAN || _loc9_.position == ItemPositionRange.POSITION_YUXUJIAN || _loc9_.position == ItemPositionRange.POSITION_YUQINGSHAN || _loc9_.position == ItemPositionRange.POSITION_HUOMODAO || _loc9_.position == ItemPositionRange.POSITION_YIHEJI || _loc9_.position == ItemPositionRange.POSITION_ERHEJIAN || _loc9_.position == ItemPositionRange.POSITION_SANHEDAO || _loc9_.position == ItemPositionRange.POSITION_MIEHUSHAN || _loc9_.position == ItemPositionRange.POSITION_QINGMINGDAO || _loc9_.position == ItemPositionRange.POSITION_HUOXINGFU || _loc9_.position == ItemPositionRange.POSITION_SHENZAO || _loc9_.position == ItemPositionRange.POSITION_KAITIANGONG || _loc9_.position == ItemPositionRange.POSITION_YANWENFENGMO || _loc9_.position == ItemPositionRange.POSITION_LINGLONGZI || _loc9_.position == ItemPositionRange
         .POSITION_SHASHENJIAN || _loc9_.position == ItemPositionRange.POSITION_DUANQINGJI || _loc9_.position == ItemPositionRange.POSITION_NULONG || _loc9_.position == ItemPositionRange.POSITION_QINIAN || _loc9_.position == ItemPositionRange.POSITION_ZHUXIAN || _loc9_.position == ItemPositionRange.POSITION_HANBING || _loc9_.position == ItemPositionRange.POSITION_POSHAN || _loc9_.position == ItemPositionRange.POSITION_HAIYU || _loc9_.position == ItemPositionRange.POSITION_TIANMINGDAO || _loc9_.position == ItemPositionRange.POSITION_JINGTIANYIJI || _loc9_.position == ItemPositionRange.POSITION_JINGLEIJUEDAO || _loc9_.position == ItemPositionRange.POSITION_YINGXIONGJIAN || _loc9_.position == ItemPositionRange.POSITION_CHANGSHENGJIAN || _loc9_.position == ItemPositionRange.POSITION_GUIYINGGONG || _loc9_.position == ItemPositionRange.POSITION_JINGLEIZHANG || _loc9_.position == ItemPositionRange.POSITION_HUNDUN || _loc9_.position == ItemPositionRange.POSITION_DINGHUN || _loc9_.position == ItemPositionRange
         .POSITION_WUJI || _loc9_.position == ItemPositionRange.POSITION_HUOXINGJIAN || _loc9_.position == ItemPositionRange.POSITION_WANGZHEFU || _loc9_.position == ItemPositionRange.POSITION_DUOMINGDAO || _loc9_.position == ItemPositionRange.POSITION_XIAOSHEN || _loc9_.position == ItemPositionRange.POSITION_WANSHI || _loc9_.position == ItemPositionRange.POSITION_ZHONGQIU || _loc9_.position == ItemPositionRange.POSITION_SHENJIAN || _loc9_.position == ItemPositionRange.POSITION_YUHUAZHANG || _loc9_.position == ItemPositionRange.POSITION_BANIANGONG || _loc9_.position == ItemPositionRange.POSITION_BANIANJIAN || _loc9_.position == ItemPositionRange.POSITION_BANIANJI || _loc9_.position == ItemPositionRange.POSITION_2019SHENDAN || _loc9_.position == ItemPositionRange.POSITION_2019GENGZI || _loc9_.position == ItemPositionRange.POSITION_2019FEIHUA || _loc9_.position == ItemPositionRange.POSITION_2019XIONGWANG || _loc9_.position == ItemPositionRange.POSITION_2020XUEHUAN || _loc9_.position == ItemPositionRange
         .POSITION_2020BADAO || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN01 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN02 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN03 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN04 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN05 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN06 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN07 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN08 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN09 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN10 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN11 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN12 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN13 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN14 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN15 || _loc9_.position == ItemPositionRange
         .POSITION_2020BAOJIAN16 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN17 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN18 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN19 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN20 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN21 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN22 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN23 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN24 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN25 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN26 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN27 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN28 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN29 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN30 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN31 || _loc9_.position == ItemPositionRange
         .POSITION_2020BAOJIAN32 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN33 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN34 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN35 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN36 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN37 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN38 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN39 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN40 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN41 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN42 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN43 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN44 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN45 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN46 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN47 || _loc9_.position == ItemPositionRange
         .POSITION_2020BAOJIAN48 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN49 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN50 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN51 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN52 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN53 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN54 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN55 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN56 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN57 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN58 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN59 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN60 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN61 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN62 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN63 || _loc9_.position == ItemPositionRange
         .POSITION_2020BAOJIAN64 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN65 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN66 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN67 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN68 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN69 || _loc9_.position >= ItemPositionRange.POSITION_NB_WEAPON_ARR[0] && _loc9_.position <= ItemPositionRange.POSITION_NB_WEAPON_ARR[ItemPositionRange.POSITION_NB_WEAPON_ARR.length - 1])
         {
            _loc5_.useIng_Weapon_id = _loc8_;
         }
         if(ReloginManager.isInGongcheng || ReloginManager.isInKuafu || ReloginManager.isInKuafu_To_biWuDaHui > 0)
         {
         }
         if(_loc7_ == 1 && _loc3_.isMainChar() && Boolean(_loc5_.useIng_Weapon_id))
         {
            PipeManager.sendMsg(PipeConstants.SAVE_SHOW_JIAN,{"id":_loc5_.useIng_Weapon_id});
         }
         if(_loc9_ != null)
         {
            if(_loc7_ == 1)
            {
               _loc12_ = AvatarManager.dressAvatarData(_loc5_,_loc9_.position,_loc9_.id_m,_loc6_.getSex());
               if(_loc9_.position == ItemPositionRange.POSTION_AOJIAN || _loc9_.position == ItemPositionRange.POSTION_STDRJ || _loc9_.position == ItemPositionRange.POSTION_YLZR || _loc9_.position == ItemPositionRange.POSTION_SHENQI || _loc9_.position == ItemPositionRange.POSTION_GJMY || _loc9_.position == ItemPositionRange.POSITION_LONGYA || _loc9_.position == ItemPositionRange.POSITION_YAYUEDAO || _loc9_.position == ItemPositionRange.POSITION_GUANGMINGZHANG || _loc9_.position == ItemPositionRange.POSITION_XUANTIEZHONGJIAN || _loc9_.position == ItemPositionRange.POSITION_HUIMIE || _loc9_.position == ItemPositionRange.POSITION_CHIYAN || _loc9_.position == ItemPositionRange.POSITION_TIANJING || _loc9_.position == ItemPositionRange.POSITION_HUOLONGDAO || _loc9_.position == ItemPositionRange.POSITION_FENGTIANJI || _loc9_.position == ItemPositionRange.POSITION_ZHUMOZHANG || _loc9_.position == ItemPositionRange.POSITION_TIANZHU || _loc9_.position == ItemPositionRange.POSITION_PANGUKAITIANFU || _loc9_.position == ItemPositionRange
               .POSITION_TIANDI || _loc9_.position == ItemPositionRange.POSITION_HANQIBINGPO || _loc9_.position == ItemPositionRange.POSITION_JIANZUNLONGQUANJIAN || _loc9_.position == ItemPositionRange.POSITION_CHUANGSHI || _loc9_.position == ItemPositionRange.POSITION_SUILIESHIFU || _loc9_.position == ItemPositionRange.POSITION_MOYUAN || _loc9_.position == ItemPositionRange.POSITION_FENGBAODAO || _loc9_.position == ItemPositionRange.POSITION_CHENGJIECHANGJI || _loc9_.position == ItemPositionRange.POSITION_TIANXIEJIAN || _loc9_.position == ItemPositionRange.POSITION_JUNZIJIAN || _loc9_.position == ItemPositionRange.POSITION_WANGZHEJIAN || _loc9_.position == ItemPositionRange.POSITION_FENGYUN || _loc9_.position == ItemPositionRange.POSITION_SHENGDAN2015 || _loc9_.position == ItemPositionRange.POSITION_FENGSHA || _loc9_.position == ItemPositionRange.POSITION_FENGYIJIAN || _loc9_.position == ItemPositionRange.POSITION_LEXINJI || _loc9_.position == ItemPositionRange.POSITION_FENGYINGJIAN || _loc9_.position == ItemPositionRange
               .POSITION_ZHENFENGJIAN || _loc9_.position == ItemPositionRange.POSITION_FENGYUNJIAN || _loc9_.position == ItemPositionRange.POSITION_BINGFENGJIAN || _loc9_.position == ItemPositionRange.POSITION_HONGLEIZHANGU || _loc9_.position == ItemPositionRange.POSITION_SANDENGGUFO || _loc9_.position == ItemPositionRange.POSITION_FONUJI || _loc9_.position == ItemPositionRange.POSITION_FENGYINJIAN || _loc9_.position == ItemPositionRange.POSITION_TIANMAJIAN || _loc9_.position == ItemPositionRange.POSITION_WUHUNJIAN || _loc9_.position == ItemPositionRange.POSITION_ZHENTIANJIAN || _loc9_.position == ItemPositionRange.POSITION_TIANXUE || _loc9_.position == ItemPositionRange.POSITION_XIONGJIJIAN || _loc9_.position == ItemPositionRange.POSITION_WUJINJIAN || _loc9_.position == ItemPositionRange.POSITION_SHUNTIANJIAN || _loc9_.position == ItemPositionRange.POSITION_WANGZHEQICANG || _loc9_.position == ItemPositionRange.POSITION_BIXUEJIAN || _loc9_.position == ItemPositionRange.POSITION_QINGFENGJIAN || _loc9_.position == ItemPositionRange
               .POSITION_WUYIJIAN || _loc9_.position == ItemPositionRange.POSITION_SHIJIANSHENQI || _loc9_.position == ItemPositionRange.POSITION_HUOLINJIAN || _loc9_.position == ItemPositionRange.POSITION_ZHUIHUNJI || _loc9_.position == ItemPositionRange.POSITION_BIYUDAO || _loc9_.position == ItemPositionRange.POSITION_WUWOZHANG || _loc9_.position == ItemPositionRange.POSITION_YEHUOHONGLIAN || _loc9_.position == ItemPositionRange.POSITION_MINGYUEDAO || _loc9_.position == ItemPositionRange.POSITION_QINGFENGJIAN2 || _loc9_.position == ItemPositionRange.POSITION_ZHIZUNJIAN || _loc9_.position == ItemPositionRange.POSITION_BAOLEIJI || _loc9_.position == ItemPositionRange.POSITION_MINGSHENGZHANG || _loc9_.position == ItemPositionRange.POSITION_ZUNSHIJIAN || _loc9_.position == ItemPositionRange.POSITION_RENZHEZHANG || _loc9_.position == ItemPositionRange.POSITION_ZHIZHEJIAN || _loc9_.position == ItemPositionRange.POSITION_YANGMINGJIAN || _loc9_.position == ItemPositionRange.POSITION_XIWANGJIAN || _loc9_.position == ItemPositionRange
               .POSITION_XUEJINGJIAN || _loc9_.position == ItemPositionRange.POSITION_XUANBINGJIAN || _loc9_.position == ItemPositionRange.POSITION_PINGANJIAN || _loc9_.position == ItemPositionRange.POSITION_QINGHUAJIAN || _loc9_.position == ItemPositionRange.POSITION_YUXUJIAN || _loc9_.position == ItemPositionRange.POSITION_YUQINGSHAN || _loc9_.position == ItemPositionRange.POSITION_HUOMODAO || _loc9_.position == ItemPositionRange.POSITION_YIHEJI || _loc9_.position == ItemPositionRange.POSITION_ERHEJIAN || _loc9_.position == ItemPositionRange.POSITION_SANHEDAO || _loc9_.position == ItemPositionRange.POSITION_MIEHUSHAN || _loc9_.position == ItemPositionRange.POSITION_QINGMINGDAO || _loc9_.position == ItemPositionRange.POSITION_HUOXINGFU || _loc9_.position == ItemPositionRange.POSITION_SHENZAO || _loc9_.position == ItemPositionRange.POSITION_KAITIANGONG || _loc9_.position == ItemPositionRange.POSITION_YANWENFENGMO || _loc9_.position == ItemPositionRange.POSITION_LINGLONGZI || _loc9_.position == ItemPositionRange
               .POSITION_SHASHENJIAN || _loc9_.position == ItemPositionRange.POSITION_DUANQINGJI || _loc9_.position == ItemPositionRange.POSITION_NULONG || _loc9_.position == ItemPositionRange.POSITION_QINIAN || _loc9_.position == ItemPositionRange.POSITION_ZHUXIAN || _loc9_.position == ItemPositionRange.POSITION_HANBING || _loc9_.position == ItemPositionRange.POSITION_POSHAN || _loc9_.position == ItemPositionRange.POSITION_HAIYU || _loc9_.position == ItemPositionRange.POSITION_TIANMINGDAO || _loc9_.position == ItemPositionRange.POSITION_JINGTIANYIJI || _loc9_.position == ItemPositionRange.POSITION_JINGLEIJUEDAO || _loc9_.position == ItemPositionRange.POSITION_YINGXIONGJIAN || _loc9_.position == ItemPositionRange.POSITION_CHANGSHENGJIAN || _loc9_.position == ItemPositionRange.POSITION_GUIYINGGONG || _loc9_.position == ItemPositionRange.POSITION_JINGLEIZHANG || _loc9_.position == ItemPositionRange.POSITION_HUNDUN || _loc9_.position == ItemPositionRange.POSITION_DINGHUN || _loc9_.position == ItemPositionRange
               .POSITION_WUJI || _loc9_.position == ItemPositionRange.POSITION_HUOXINGJIAN || _loc9_.position == ItemPositionRange.POSITION_WANGZHEFU || _loc9_.position == ItemPositionRange.POSITION_DUOMINGDAO || _loc9_.position == ItemPositionRange.POSITION_XIAOSHEN || _loc9_.position == ItemPositionRange.POSITION_WANSHI || _loc9_.position == ItemPositionRange.POSITION_ZHONGQIU || _loc9_.position == ItemPositionRange.POSITION_SHENJIAN || _loc9_.position == ItemPositionRange.POSITION_YUHUAZHANG || _loc9_.position == ItemPositionRange.POSITION_BANIANGONG || _loc9_.position == ItemPositionRange.POSITION_BANIANJIAN || _loc9_.position == ItemPositionRange.POSITION_BANIANJI || _loc9_.position == ItemPositionRange.POSITION_2019SHENDAN || _loc9_.position == ItemPositionRange.POSITION_2019GENGZI || _loc9_.position == ItemPositionRange.POSITION_2019FEIHUA || _loc9_.position == ItemPositionRange.POSITION_2019XIONGWANG || _loc9_.position == ItemPositionRange.POSITION_2020XUEHUAN || _loc9_.position == ItemPositionRange
               .POSITION_2020BADAO || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN01 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN02 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN03 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN04 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN05 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN06 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN07 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN08 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN09 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN10 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN11 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN12 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN13 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN14 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN15 || _loc9_.position == ItemPositionRange
               .POSITION_2020BAOJIAN16 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN17 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN18 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN19 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN20 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN21 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN22 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN23 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN24 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN25 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN26 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN27 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN28 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN29 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN30 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN31 || _loc9_.position == ItemPositionRange
               .POSITION_2020BAOJIAN32 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN33 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN34 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN35 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN36 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN37 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN38 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN39 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN40 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN41 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN42 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN43 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN44 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN45 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN46 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN47 || _loc9_.position == ItemPositionRange
               .POSITION_2020BAOJIAN48 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN49 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN50 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN51 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN52 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN53 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN54 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN55 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN56 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN57 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN58 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN59 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN60 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN61 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN62 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN63 || _loc9_.position == ItemPositionRange
               .POSITION_2020BAOJIAN64 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN65 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN66 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN67 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN68 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN69 || _loc9_.position >= ItemPositionRange.POSITION_NB_WEAPON_ARR[0] && _loc9_.position <= ItemPositionRange.POSITION_NB_WEAPON_ARR[ItemPositionRange.POSITION_NB_WEAPON_ARR.length - 1])
               {
                  if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
                  {
                     GameInstance.uiInstance._charAttribute.closeJianSelectSpr();
                  }
               }
               if(ReloginManager.isInGongcheng)
               {
                  if(_loc9_.position == ItemPositionRange.POSTION_YLZR)
                  {
                     if(!_loc3_.isMainChar())
                     {
                        GameInstance.scene.addAlwaysShowChar(_loc3_);
                     }
                  }
               }
               else if(ReloginManager.isInKuafu)
               {
                  if(_loc9_.position == ItemPositionRange.POSTION_STDRJ)
                  {
                     if(!_loc3_.isMainChar())
                     {
                        GameInstance.scene.addAlwaysShowChar(_loc3_);
                     }
                  }
               }
            }
            else
            {
               _loc12_ = AvatarManager.taskOffAvatarData(_loc5_,_loc9_.position,_loc9_.id_m,_loc6_.getSex());
               if(ReloginManager.isInGongcheng)
               {
                  if(_loc9_.position == ItemPositionRange.POSTION_YLZR)
                  {
                     if(!_loc3_.isMainChar())
                     {
                        GameInstance.scene.removeAlwaysShowChar(_loc3_);
                     }
                  }
               }
               else if(ReloginManager.isInKuafu)
               {
                  if(_loc9_.position == ItemPositionRange.POSTION_STDRJ)
                  {
                     if(!_loc3_.isMainChar())
                     {
                        GameInstance.scene.removeAlwaysShowChar(_loc3_);
                     }
                  }
               }
               if(GameInstance.mainCharData.goodsInfo.isBagFull())
               {
                  NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_BACKPACK_FULL);
               }
            }
            if(_loc5_.isFeixing && _loc3_.isOnMount && _loc12_.indexOf(SpeciaAvatarPartID.WEAPON) != -1)
            {
               _loc12_.push(SpeciaAvatarPartID.MOUNT_WEAPON);
            }
            if(SpecialGoodsID.getSpecialAvatarType(_loc8_) == 2)
            {
               if(_loc12_.indexOf(SpeciaAvatarPartID.WEAPON) == -1)
               {
                  _loc12_.push(SpeciaAvatarPartID.WEAPON);
               }
               if(_loc12_.indexOf(SpeciaAvatarPartID.MOUNT_WEAPON) == -1)
               {
                  _loc12_.push(SpeciaAvatarPartID.MOUNT_WEAPON);
               }
            }
            AvatarManager.updateMainAvatar(_loc3_,_loc12_);
            if(_loc3_.isMainChar())
            {
               if(_loc9_.position == ItemPositionRange.POSTION_STDRJ)
               {
                  _loc13_ = int(GameInstance.mainCharData.goodsInfo.goodsBodyArr.length);
                  _loc14_ = int(_loc13_ - 1);
                  while(_loc14_ >= 0)
                  {
                     _loc15_ = GameInstance.mainCharData.goodsInfo.goodsBodyArr[_loc14_] as Goods;
                     if(_loc15_.res.position == ItemPositionRange.POSTION_STDRJ)
                     {
                        GameInstance.mainCharData.goodsInfo.goodsBodyArr.splice(_loc14_,1);
                        delete GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc15_.res.position];
                     }
                     _loc14_--;
                  }
                  if(_loc7_ == 1)
                  {
                     _loc16_ = new Goods(_loc8_);
                     GameInstance.mainCharData.goodsInfo.goodsBodyArr.push(_loc16_);
                     GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc16_.res.position] = _loc16_;
                  }
                  if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
                  {
                     GameInstance.uiInstance._charAttribute.setShowItem(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
                  }
               }
               else if(_loc9_.position == ItemPositionRange.POSTION_YLZR)
               {
                  _loc13_ = int(GameInstance.mainCharData.goodsInfo.goodsBodyArr.length);
                  _loc14_ = int(_loc13_ - 1);
                  while(_loc14_ >= 0)
                  {
                     _loc15_ = GameInstance.mainCharData.goodsInfo.goodsBodyArr[_loc14_] as Goods;
                     if(_loc15_.res.position == ItemPositionRange.POSTION_YLZR)
                     {
                        GameInstance.mainCharData.goodsInfo.goodsBodyArr.splice(_loc14_,1);
                        delete GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc15_.res.position];
                     }
                     _loc14_--;
                  }
                  if(_loc7_ == 1)
                  {
                     _loc16_ = new Goods(_loc8_);
                     GameInstance.mainCharData.goodsInfo.goodsBodyArr.push(_loc16_);
                     GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc16_.res.position] = _loc16_;
                  }
                  if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
                  {
                     GameInstance.uiInstance._charAttribute.setShowItem(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
                  }
               }
               else if(_loc9_.position == ItemPositionRange.POSTION_SHENQI || _loc9_.position == ItemPositionRange.POSTION_AOJIAN || _loc9_.position == ItemPositionRange.POSTION_GJMY || _loc9_.position == ItemPositionRange.POSITION_LONGYA || _loc9_.position == ItemPositionRange.POSITION_YAYUEDAO || _loc9_.position == ItemPositionRange.POSITION_XUANTIEZHONGJIAN || _loc9_.position == ItemPositionRange.POSITION_GUANGMINGZHANG || _loc9_.position == ItemPositionRange.POSITION_HUIMIE || _loc9_.position == ItemPositionRange.POSITION_ZHUMOZHANG || _loc9_.position == ItemPositionRange.POSITION_CHIYAN || _loc9_.position == ItemPositionRange.POSITION_TIANJING || _loc9_.position == ItemPositionRange.POSITION_FENGTIANJI || _loc9_.position == ItemPositionRange.POSITION_HUOLONGDAO || _loc9_.position == ItemPositionRange.POSITION_TIANZHU || _loc9_.position == ItemPositionRange.POSITION_PANGUKAITIANFU || _loc9_.position == ItemPositionRange.POSITION_TIANDI || _loc9_.position == ItemPositionRange.POSITION_HANQIBINGPO || _loc9_
               .position == ItemPositionRange.POSITION_JIANZUNLONGQUANJIAN || _loc9_.position == ItemPositionRange.POSITION_CHUANGSHI || _loc9_.position == ItemPositionRange.POSITION_SUILIESHIFU || _loc9_.position == ItemPositionRange.POSITION_MOYUAN || _loc9_.position == ItemPositionRange.POSITION_FENGBAODAO || _loc9_.position == ItemPositionRange.POSITION_CHENGJIECHANGJI || _loc9_.position == ItemPositionRange.POSITION_TIANXIEJIAN || _loc9_.position == ItemPositionRange.POSITION_JUNZIJIAN || _loc9_.position == ItemPositionRange.POSITION_WANGZHEJIAN || _loc9_.position == ItemPositionRange.POSITION_FENGYUN || _loc9_.position == ItemPositionRange.POSITION_SHENGDAN2015 || _loc9_.position == ItemPositionRange.POSITION_FENGSHA || _loc9_.position == ItemPositionRange.POSITION_FENGYIJIAN || _loc9_.position == ItemPositionRange.POSITION_LEXINJI || _loc9_.position == ItemPositionRange.POSITION_FENGYINGJIAN || _loc9_.position == ItemPositionRange.POSITION_ZHENFENGJIAN || _loc9_.position == ItemPositionRange.POSITION_FENGYUNJIAN || _loc9_
               .position == ItemPositionRange.POSITION_BINGFENGJIAN || _loc9_.position == ItemPositionRange.POSITION_HONGLEIZHANGU || _loc9_.position == ItemPositionRange.POSITION_SANDENGGUFO || _loc9_.position == ItemPositionRange.POSITION_FONUJI || _loc9_.position == ItemPositionRange.POSITION_FENGYINJIAN || _loc9_.position == ItemPositionRange.POSITION_TIANMAJIAN || _loc9_.position == ItemPositionRange.POSITION_WUHUNJIAN || _loc9_.position == ItemPositionRange.POSITION_ZHENTIANJIAN || _loc9_.position == ItemPositionRange.POSITION_TIANXUE || _loc9_.position == ItemPositionRange.POSITION_XIONGJIJIAN || _loc9_.position == ItemPositionRange.POSITION_WUJINJIAN || _loc9_.position == ItemPositionRange.POSITION_SHUNTIANJIAN || _loc9_.position == ItemPositionRange.POSITION_WANGZHEQICANG || _loc9_.position == ItemPositionRange.POSITION_BIXUEJIAN || _loc9_.position == ItemPositionRange.POSITION_QINGFENGJIAN || _loc9_.position == ItemPositionRange.POSITION_WUYIJIAN || _loc9_.position == ItemPositionRange.POSITION_SHIJIANSHENQI || _loc9_
               .position == ItemPositionRange.POSITION_HUOLINJIAN || _loc9_.position == ItemPositionRange.POSITION_ZHUIHUNJI || _loc9_.position == ItemPositionRange.POSITION_BIYUDAO || _loc9_.position == ItemPositionRange.POSITION_WUWOZHANG || _loc9_.position == ItemPositionRange.POSITION_YEHUOHONGLIAN || _loc9_.position == ItemPositionRange.POSITION_MINGYUEDAO || _loc9_.position == ItemPositionRange.POSITION_QINGFENGJIAN2 || _loc9_.position == ItemPositionRange.POSITION_ZHIZUNJIAN || _loc9_.position == ItemPositionRange.POSITION_BAOLEIJI || _loc9_.position == ItemPositionRange.POSITION_MINGSHENGZHANG || _loc9_.position == ItemPositionRange.POSITION_ZUNSHIJIAN || _loc9_.position == ItemPositionRange.POSITION_RENZHEZHANG || _loc9_.position == ItemPositionRange.POSITION_ZHIZHEJIAN || _loc9_.position == ItemPositionRange.POSITION_YANGMINGJIAN || _loc9_.position == ItemPositionRange.POSITION_XIWANGJIAN || _loc9_.position == ItemPositionRange.POSITION_XUEJINGJIAN || _loc9_.position == ItemPositionRange.POSITION_XUANBINGJIAN || _loc9_
               .position == ItemPositionRange.POSITION_PINGANJIAN || _loc9_.position == ItemPositionRange.POSITION_QINGHUAJIAN || _loc9_.position == ItemPositionRange.POSITION_YUXUJIAN || _loc9_.position == ItemPositionRange.POSITION_YUQINGSHAN || _loc9_.position == ItemPositionRange.POSITION_HUOMODAO || _loc9_.position == ItemPositionRange.POSITION_YIHEJI || _loc9_.position == ItemPositionRange.POSITION_ERHEJIAN || _loc9_.position == ItemPositionRange.POSITION_SANHEDAO || _loc9_.position == ItemPositionRange.POSITION_MIEHUSHAN || _loc9_.position == ItemPositionRange.POSITION_QINGMINGDAO || _loc9_.position == ItemPositionRange.POSITION_HUOXINGFU || _loc9_.position == ItemPositionRange.POSITION_SHENZAO || _loc9_.position == ItemPositionRange.POSITION_KAITIANGONG || _loc9_.position == ItemPositionRange.POSITION_YANWENFENGMO || _loc9_.position == ItemPositionRange.POSITION_LINGLONGZI || _loc9_.position == ItemPositionRange.POSITION_SHASHENJIAN || _loc9_.position == ItemPositionRange.POSITION_DUANQINGJI || _loc9_
               .position == ItemPositionRange.POSITION_NULONG || _loc9_.position == ItemPositionRange.POSITION_QINIAN || _loc9_.position == ItemPositionRange.POSITION_ZHUXIAN || _loc9_.position == ItemPositionRange.POSITION_HANBING || _loc9_.position == ItemPositionRange.POSITION_POSHAN || _loc9_.position == ItemPositionRange.POSITION_HAIYU || _loc9_.position == ItemPositionRange.POSITION_TIANMINGDAO || _loc9_.position == ItemPositionRange.POSITION_JINGTIANYIJI || _loc9_.position == ItemPositionRange.POSITION_JINGLEIJUEDAO || _loc9_.position == ItemPositionRange.POSITION_YINGXIONGJIAN || _loc9_.position == ItemPositionRange.POSITION_CHANGSHENGJIAN || _loc9_.position == ItemPositionRange.POSITION_GUIYINGGONG || _loc9_.position == ItemPositionRange.POSITION_JINGLEIZHANG || _loc9_.position == ItemPositionRange.POSITION_HUNDUN || _loc9_.position == ItemPositionRange.POSITION_DINGHUN || _loc9_.position == ItemPositionRange.POSITION_WUJI || _loc9_.position == ItemPositionRange.POSITION_HUOXINGJIAN || _loc9_
               .position == ItemPositionRange.POSITION_WANGZHEFU || _loc9_.position == ItemPositionRange.POSITION_DUOMINGDAO || _loc9_.position == ItemPositionRange.POSITION_XIAOSHEN || _loc9_.position == ItemPositionRange.POSITION_WANSHI || _loc9_.position == ItemPositionRange.POSITION_ZHONGQIU || _loc9_.position == ItemPositionRange.POSITION_SHENJIAN || _loc9_.position == ItemPositionRange.POSITION_YUHUAZHANG || _loc9_.position == ItemPositionRange.POSITION_BANIANGONG || _loc9_.position == ItemPositionRange.POSITION_BANIANJIAN || _loc9_.position == ItemPositionRange.POSITION_BANIANJI || _loc9_.position == ItemPositionRange.POSITION_2019SHENDAN || _loc9_.position == ItemPositionRange.POSITION_2019GENGZI || _loc9_.position == ItemPositionRange.POSITION_2019FEIHUA || _loc9_.position == ItemPositionRange.POSITION_2019XIONGWANG || _loc9_.position == ItemPositionRange.POSITION_2020XUEHUAN || _loc9_.position == ItemPositionRange.POSITION_2020BADAO || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN01 || _loc9_
               .position == ItemPositionRange.POSITION_2020BAOJIAN02 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN03 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN04 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN05 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN06 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN07 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN08 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN09 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN10 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN11 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN12 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN13 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN14 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN15 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN16 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN17 || _loc9_
               .position == ItemPositionRange.POSITION_2020BAOJIAN18 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN19 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN20 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN21 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN22 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN23 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN24 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN25 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN26 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN27 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN28 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN29 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN30 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN31 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN32 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN33 || _loc9_
               .position == ItemPositionRange.POSITION_2020BAOJIAN34 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN35 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN36 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN37 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN38 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN39 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN40 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN41 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN42 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN43 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN44 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN45 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN46 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN47 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN48 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN49 || _loc9_
               .position == ItemPositionRange.POSITION_2020BAOJIAN50 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN51 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN52 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN53 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN54 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN55 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN56 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN57 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN58 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN59 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN60 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN61 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN62 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN63 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN64 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN65 || _loc9_
               .position == ItemPositionRange.POSITION_2020BAOJIAN66 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN67 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN68 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN69 || _loc9_.position >= ItemPositionRange.POSITION_NB_WEAPON_ARR[0] && _loc9_.position <= ItemPositionRange.POSITION_NB_WEAPON_ARR[ItemPositionRange.POSITION_NB_WEAPON_ARR.length - 1])
               {
                  if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
                  {
                     GameInstance.uiInstance._charAttribute.setShowItem(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
                  }
               }
            }
         }
         if(_loc2_ == GameInstance.lookPlayerID && Boolean(GameInstance.lookPlayerID))
         {
            GameInstance.lookPlayerData.avatarInfo = _loc5_;
         }
      }
      
      public function received_60002(param1:ByteArray) : void
      {
         ZLog.add("60002：角色换装(上马 与 下马)（包括主角） ");
         var _loc2_:int = param1.readInt();
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(_loc2_,SceneCharacterType.PLAYER);
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:Player = _loc3_.data as Player;
         var _loc5_:AvatarInfo = _loc4_.avatarInfo;
         var _loc6_:AttributeInfo = _loc4_.attributeInfo;
         var _loc7_:int = param1.readByte();
         var _loc8_:int = param1.readInt();
         var _loc9_:MountRes = MountResManager.getMountRes(_loc8_);
         if(_loc9_ != null)
         {
            if(_loc7_ == 1)
            {
               if(_loc4_.buffInfo.getBuff(80200554))
               {
                  _loc5_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,SpecialGoodsID.HUANGJIN_SHENGLONG_ID),AvatarPartType.MOUNT);
               }
               else if(_loc4_.avatarInfo.useAvatarType > 0)
               {
                  _loc5_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,AvatarManager.getAvatarIdByType(_loc4_.avatarInfo.useAvatarType)),AvatarPartType.MOUNT);
               }
               else
               {
                  _loc5_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,_loc9_.id_m),AvatarPartType.MOUNT);
               }
               _loc5_.lastMountId = _loc8_;
            }
            else if(_loc5_.apd_mount != null && _loc5_.apd_mount.sourcePath == ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,_loc9_.id_m))
            {
               _loc5_.apd_mount = null;
            }
         }
         _loc3_.isOnMount = _loc7_ == 1;
         if(_loc3_.isOnMount)
         {
            if(_loc3_.getStatus() == CharStatusType.DEATH || _loc3_.getStatus() == CharStatusType.SIT)
            {
               _loc3_.playTo(CharStatusType.STAND);
            }
         }
         AvatarManager.updateMainAvatar(_loc3_);
         if(_loc3_.isMainChar())
         {
            if(_loc3_.getStatus() == CharStatusType.WALK)
            {
               TSoundManager.playWalkSound(GameInstance.mainChar.isOnMount);
            }
         }
      }
      
      public function received_10502(param1:ByteArray) : void
      {
         var _loc5_:Array = null;
         ZLog.add("10502：角色换装 升级 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(_loc2_,SceneCharacterType.PLAYER);
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:AvatarParamData = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_LEVEL_UP),AvatarPartType.MAGIC);
         _loc3_.loadAvatarPart(_loc4_);
         if(_loc3_.isMainChar())
         {
            FightManager.screen_shake(0.5,70);
            _loc5_ = GameInstance.scene.getCharsByType(SceneCharacterType.MONSTER);
            HeadFaceManager.updateMonstersNameColor(_loc5_);
            TaskTracker.updateTaskUI(true,true,true,true,true);
         }
      }
      
      public function received_10504(param1:ByteArray) : void
      {
         ZLog.add("10504：角色武功层次变化 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:Number = param1.readDouble();
         HeadFaceManager.updateCharSkillLevel(_loc2_,_loc3_);
      }
      
      public function received_10506(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         ZLog.add("10506：角色排行标识改变");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc7_ = param1.readInt();
            _loc4_.push(_loc7_);
            _loc5_++;
         }
         var _loc6_:String = param1.readUTF();
         HeadFaceManager.updateCharPaihang(_loc2_,_loc4_,SceneCharacterType.PLAYER,false,_loc6_);
      }
      
      public function received_10508(param1:ByteArray) : void
      {
         ZLog.add("10508：角色气旋改变");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(_loc2_,SceneCharacterType.PLAYER);
         if(!_loc4_)
         {
            return;
         }
         AvatarManager.updateQixuanNum(_loc4_,_loc3_,param1);
         AvatarManager.updateQixuanAvatar(_loc4_,(_loc4_.data as Player).attributeInfo.qixuan1ID,(_loc4_.data as Player).attributeInfo.qixuan2ID,(_loc4_.data as Player).attributeInfo.qixuan3ID,(_loc4_.data as Player).attributeInfo.qixuan4ID,(_loc4_.data as Player).attributeInfo.qixuan5ID);
      }
      
      public function received_81126(param1:ByteArray) : void
      {
         ZLog.add("81126：角色气旋改变 越南屠龙刀");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(_loc2_,SceneCharacterType.PLAYER);
         if(!_loc4_)
         {
            return;
         }
         AvatarManager.updateQixuanNum(_loc4_,_loc3_,param1);
         AvatarManager.updateQixuanAvatar(_loc4_,(_loc4_.data as Player).attributeInfo.qixuan1ID,(_loc4_.data as Player).attributeInfo.qixuan2ID,(_loc4_.data as Player).attributeInfo.qixuan3ID,(_loc4_.data as Player).attributeInfo.qixuan4ID,(_loc4_.data as Player).attributeInfo.qixuan5ID);
      }
      
      public function received_10510(param1:ByteArray) : void
      {
         ZLog.add("10510：角色打坐光环改变");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(_loc2_,SceneCharacterType.PLAYER);
         if(!_loc4_)
         {
            return;
         }
         (_loc4_.data as Player).attributeInfo.sitAvartID = _loc3_;
         if(_loc4_.getStatus() == CharStatusType.SIT)
         {
            AvatarManager.updateSitAvatar(_loc4_,_loc3_);
         }
      }
      
      public function received_10512(param1:ByteArray) : void
      {
         ZLog.add("10512：角色四灵阵光环改变");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(_loc2_,SceneCharacterType.PLAYER);
         if(!_loc4_)
         {
            return;
         }
         (_loc4_.data as Player).attributeInfo.silingzhenCount = _loc3_;
         AvatarManager.updateSilingzhenAvatar(_loc4_,_loc3_);
      }
      
      public function received_10300(param1:ByteArray) : void
      {
         ZLog.add("10300：传送点开启与关闭");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readByte();
         this.sceneProxy.receivedTransIsOpened(_loc2_,_loc3_,_loc4_ == 1);
      }
      
      public function received_10340(param1:ByteArray) : void
      {
         ZLog.add("10340：传送点改名");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:String = param1.readUTF();
         this.sceneProxy.receivedTransChangeName(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_10048(param1:ByteArray) : void
      {
         ZLog.add("10048：婚宴怪物(类型为7的不可攻击，可食用怪物,8走普通怪物进入视野消息)进入视野进入视野");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readShort();
         var _loc5_:int = param1.readShort();
         var _loc6_:String = param1.readUTF();
         var _loc7_:int = param1.readInt();
         this.sceneProxy.receivedHunyan7EnterScene(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
      }
      
      public function received_10030(param1:ByteArray) : void
      {
         ZLog.add("10030：您的角色已经被顶掉");
         ReloginManager.isDing = true;
         ReloginManager.clearInfo_disconnect();
      }
      
      public function received_10070(param1:ByteArray) : void
      {
         ZLog.add("10070：收到防沉迷提示");
         var _loc2_:String = NetWorkManager.readGILMsg(param1);
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_FANG_CHEN_MI,_loc2_);
      }
      
      public function received_10058(param1:ByteArray) : void
      {
         ZLog.add("10058：庆功宴餐桌 进入视野进入视野");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readShort();
         var _loc4_:int = param1.readShort();
         var _loc5_:String = param1.readUTF();
         this.sceneProxy.receivedQinggongyanEnterScene(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_10066(param1:ByteArray) : void
      {
         ZLog.add("10066：城里卫兵npc怪物");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readShort();
         var _loc5_:int = param1.readShort();
         var _loc6_:int = param1.readByte();
         var _loc7_:String = param1.readUTF();
         var _loc8_:int = param1.readByte();
         this.sceneProxy.receivedNpcGuaiwuEnterScene(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_10072(param1:ByteArray) : void
      {
         ZLog.add("10072：卫兵npc怪物下跪");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         this.sceneProxy.receivedNpcGuaiwuXiagui(_loc2_,_loc3_);
      }
      
      public function received_10138(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         ZLog.add("10138：动态设置地图状态");
         var _loc2_:int = param1.readInt();
         if(GameInstance.scene.mapConfig.mapID != _loc2_)
         {
            return;
         }
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param1.readInt();
            _loc7_ = param1.readInt();
            SceneCache.setSolids(_loc6_,_loc7_,_loc3_);
            _loc5_++;
         }
      }
      
      public function received_71050(param1:ByteArray) : void
      {
         ZLog.add("71050 \t\t陷阱进入视野\t");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readShort();
         var _loc5_:int = param1.readShort();
         var _loc6_:Boolean = param1.readByte() == 1;
         if(!_loc6_)
         {
            if(GameState.xianJingDict[_loc4_ + "_" + _loc5_] == undefined)
            {
               GameState.xianJingDict[_loc4_ + "_" + _loc5_] = "" + _loc2_;
            }
            else
            {
               GameState.xianJingDict[_loc4_ + "_" + _loc5_] = GameState.xianJingDict[_loc4_ + "_" + _loc5_] + "," + _loc2_;
            }
         }
         else
         {
            this.sceneProxy.receivedXianJingEnterScene(_loc2_,_loc3_,_loc4_,_loc5_);
         }
      }
      
      public function received_71052(param1:ByteArray) : void
      {
         var _loc3_:String = null;
         ZLog.add("71052 \t\t陷阱离开视野");
         var _loc2_:int = param1.readInt();
         for(_loc3_ in GameState.xianJingDict)
         {
            if(GameState.xianJingDict[_loc3_].indexOf(_loc2_) != -1)
            {
               delete GameState.xianJingDict[_loc3_];
               break;
            }
         }
         this.sceneProxy.receivedCharLeaveScene(SceneCharacterType.DUMMY,_loc2_);
      }
      
      public function received_10060(param1:ByteArray) : void
      {
         var _loc12_:int = 0;
         ZLog.add("10060：接收 玩家换装的怪物 进入主角视野区");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readShort();
         var _loc5_:int = param1.readShort();
         var _loc6_:int = param1.readByte();
         var _loc7_:int = param1.readByte();
         var _loc8_:int = param1.readInt();
         var _loc9_:Array = [];
         var _loc10_:int = 0;
         while(_loc10_ < _loc8_)
         {
            _loc12_ = param1.readInt();
            _loc9_[_loc9_.length] = _loc12_;
            _loc10_++;
         }
         var _loc11_:Object = {
            "infoArr":_loc9_,
            "menpai":_loc7_
         };
      }
      
      public function received_10068(param1:ByteArray) : void
      {
         ZLog.add("10068：虚拟换装角色离开主角视野区");
         var _loc2_:int = param1.readInt();
      }
      
      public function received_73046(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         ZLog.add("73046:许愿树进入视野");
         var _loc2_:int = param1.readInt();
         if(_loc2_ != 0)
         {
            _loc3_ = param1.readInt();
            _loc4_ = param1.readInt();
            _loc5_ = param1.readInt();
            _loc6_ = param1.readInt();
            _loc7_ = param1.readUTF();
            this.sceneProxy.receivedXuYuanShuEnterScene(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc2_);
         }
      }
      
      public function received_73784(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         ZLog.add("73784:种植剑进入视野");
         var _loc2_:int = param1.readInt();
         if(_loc2_ != 0)
         {
            _loc3_ = param1.readInt();
            _loc4_ = param1.readInt();
            _loc5_ = param1.readInt();
            _loc6_ = param1.readUTF();
            this.sceneProxy.receivedZhongZhiJianEnterScene(_loc3_,_loc4_,_loc5_,_loc6_,_loc2_);
         }
      }
   }
}

