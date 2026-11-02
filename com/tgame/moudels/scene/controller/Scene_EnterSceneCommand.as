package com.tgame.moudels.scene.controller
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.map.MapRes;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialMapID;
   import com.tgame.common.vo.login.DisconnectInfo;
   import com.tgame.manager.AutoFlyManager;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.HighEffectManager;
   import com.tgame.manager.KeyboardManager;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NpcRandomTalkManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.SitManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.TaskTracker;
   import com.tgame.manager.TopTipManager;
   import com.tgame.moudels.login.view.*;
   import com.tgame.moudels.scene.model.Scene_MsgSenderProxy;
   import com.tgame.moudels.scene.model.Scene_SceneProxy;
   import com.zcp.common.handler.HandlerThread;
   import com.zcp.common.log.ZLog;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.avatar.AvatarPart;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.manager.TimerManager;
   import flash.events.ProgressEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Scene_EnterSceneCommand extends SimpleCommand
   {
      
      private static var useFly:Boolean;
      
      private static var preMapID:int = 0;
      
      public function Scene_EnterSceneCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var startSwitchScene:Function;
         var updateInSmallMap:Function;
         var tileP:Point = null;
         var sceneProxy:Scene_SceneProxy = null;
         var len:int = 0;
         var i:int = 0;
         var msgSenderProxy:Scene_MsgSenderProxy = null;
         var sc:SceneCharacter = null;
         var $note:INotification = param1;
         var arr:Array = $note.getBody() as Array;
         tileP = arr[0];
         useFly = arr[1];
         if(preMapID != GameConfig.wantEnterMapRes.id)
         {
            startSwitchScene = function():void
            {
               TPreLoader.showLoadingUI(LanResManager.getLanCommonTextWords("正在加载地图配置文件"),false);
               GameInstance.mainChar.setTileXY(tileP.x,tileP.y);
               TSoundManager.stopAllSound();
               HighEffectManager.stopAndClearAll();
               GameInstance.npcTishiDict = new Dictionary();
               GameInstance.npcTupianTishiDict = new Dictionary();
               NpcRandomTalkManager.removeAll();
               SitManager.removeAllFromSinShuangxiu();
               GameInstance.scene.switchScene(GameConfig.wantEnterMapRes.id,GameConfig.wantEnterMapRes.pathName,onComplete,onUpdate);
            };
            if(GameInstance.scene.mapConfig != null && useFly)
            {
               if(GameInstance.scene.mapConfig.mapID == SpecialMapID.YYSZ_ID && GameConfig.wantEnterMapRes.id == SpecialMapID.XYC_ID)
               {
                  AutoFlyManager.mainCharAutoFly(new Point(GameInstance.mainChar.tile_x,GameInstance.mainChar.tile_y),SpecialMapID.YYSZ_FLY_TO,SpecialMapID.YYSZ_FLY_SPEED,startSwitchScene);
               }
               else if(GameInstance.scene.mapConfig.mapID == SpecialMapID.XYC_ID && GameConfig.wantEnterMapRes.id == SpecialMapID.YYSZ_ID)
               {
                  AutoFlyManager.mainCharAutoFly(new Point(GameInstance.mainChar.tile_x,GameInstance.mainChar.tile_y),SpecialMapID.XYC_FLY_TO,SpecialMapID.XYC_FLY_SPEED,startSwitchScene);
               }
               else
               {
                  startSwitchScene();
               }
            }
            else
            {
               startSwitchScene();
            }
         }
         else
         {
            updateInSmallMap = function():void
            {
               var _loc1_:Point = new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y);
               var _loc2_:int = GameInstance.mainChar.getLogicAngle();
               GameInstance.uiInstance.popMapPanel.setCharXY(_loc1_);
               GameInstance.uiInstance.popMapPanel.setCharDirection(_loc2_);
               GameInstance.uiInstance.mainUI.setCharXY(_loc1_);
               GameInstance.uiInstance.mainUI.setCharDirection(_loc2_);
            };
            sceneProxy = facade.retrieveProxy(Scene_SceneProxy.NAME) as Scene_SceneProxy;
            len = int(GameInstance.scene.sceneCharacters.length);
            i = len - 1;
            while(i >= 0)
            {
               sc = GameInstance.scene.sceneCharacters[i];
               if(!sc.isMainChar() && sc.type != SceneCharacterType.NPC && sc.type != SceneCharacterType.TRANSPORT && sc.type != SceneCharacterType.DUMMY)
               {
                  sceneProxy.receivedCharLeaveScene(sc.type,sc.id);
               }
               i--;
            }
            GameInstance.mainChar.setTileXY(tileP.x,tileP.y);
            updateInSmallMap();
            GameInstance.scene.updateCameraNow();
            msgSenderProxy = facade.retrieveProxy(Scene_MsgSenderProxy.NAME) as Scene_MsgSenderProxy;
            msgSenderProxy.send_10021();
            AvatarManager.setHuangzhuangZhuangtai(GameInstance.mainChar);
         }
      }
      
      private function onUpdate(param1:ProgressEvent) : void
      {
         var _loc2_:Number = NaN;
         _loc2_ = param1.bytesLoaded / param1.bytesTotal;
         TPreLoader.updateLoadingUI(LanResManager.getLanCommonTextWords("正在加载地图配置文件"),_loc2_,false);
      }
      
      private function onComplete() : void
      {
         var mapRes:MapRes;
         var delay:Number;
         var ht:HandlerThread;
         var arr:Array;
         var len:int;
         var i:int;
         var f0:Function = null;
         var f1:Function = null;
         var f2:Function = null;
         var f4:Function = null;
         var mapID:int = 0;
         var f5:Function = null;
         f0 = function(param1:Number):void
         {
            TPreLoader.updateLoadingUI(LanResManager.getLanCommonTextWords("准备进入场景"),param1,false);
            PipeManager.sendMsg(PipeConstants.LOAD_MAP_CONFIG_COMPLETE);
            PipeManager.sendMsg(PipeConstants.SET_SMALL_MAP_BANGQI,[OtherConst.BANGQI_ALL_REMOVE]);
            PipeManager.sendMsg(PipeConstants.SET_SMALL_MAP_STATIC_DATA,[true,true,true]);
         };
         f1 = function(param1:Number):void
         {
            TPreLoader.updateLoadingUI(LanResManager.getLanCommonTextWords("准备进入场景"),param1,false);
            TopTipManager.getInstance().removeEnterSceneTip();
            ResizeManager.resizeSitPanel();
         };
         f2 = function(param1:Number):void
         {
            TPreLoader.updateLoadingUI(LanResManager.getLanCommonTextWords("准备进入场景"),param1,false);
            TaskTracker.updateTaskUI(false,false,false,true);
         };
         f4 = function(param1:Number):void
         {
            var onAdd:Function;
            var onFlyComplete:Function = null;
            var apd:AvatarParamData = null;
            var $per:Number = param1;
            onFlyComplete = function():void
            {
               KeyboardManager.enable = true;
               GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = true;
               var _loc1_:Scene_MsgSenderProxy = facade.retrieveProxy(Scene_MsgSenderProxy.NAME) as Scene_MsgSenderProxy;
               _loc1_.send_10021();
               AvatarManager.setHuangzhuangZhuangtai(GameInstance.mainChar);
               if(GameState.isDoubleFlyStatus)
               {
                  HighEffectManager.doubleFlyStatus(GameState.isDoubleFlyStatus);
               }
            };
            if(useFly)
            {
               if(GameInstance.mainCharData.attributeInfo.lv == 1 && GameInstance.mainCharData.attributeInfo.expNow == 0 && GameInstance.scene.mapConfig.mapID == SpecialMapID.XSC_ID)
               {
                  onAdd = function(param1:SceneCharacter, param2:AvatarPart):void
                  {
                     var $sc:SceneCharacter = param1;
                     var $ap:AvatarPart = param2;
                     TimerManager.addDelayCallBack(100,function():void
                     {
                        TPreLoader.hideLoadingUI();
                        $sc.removeAvatarPartByID(apd.id,false);
                        AutoFlyManager.mainCharAutoFly(SpecialMapID.XSC_FLY_TO,new Point(GameInstance.mainChar.tile_x,GameInstance.mainChar.tile_y),SpecialMapID.XSC_FLY_SPEED,onFlyComplete);
                     });
                  };
                  TPreLoader.updateLoadingUI(LanResManager.getLanCommonTextWords("正在为您第一次进入游戏准备神雕"),0.88,false);
                  apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_AUTO_FLY_MOUNT),AvatarPartType.MOUNT);
                  apd.id = "fly_preLoader_mount";
                  apd.clearSameType = false;
                  apd.extendCallBack(null,null,null,null,onAdd);
                  GameInstance.mainChar.loadAvatarPart(apd);
               }
               else if(preMapID == SpecialMapID.XYC_ID && GameInstance.scene.mapConfig.mapID == SpecialMapID.YYSZ_ID)
               {
                  TPreLoader.hideLoadingUI();
                  AutoFlyManager.mainCharAutoFly(SpecialMapID.YYSZ_FLY_TO,new Point(GameInstance.mainChar.tile_x,GameInstance.mainChar.tile_y),SpecialMapID.YYSZ_FLY_SPEED,onFlyComplete);
               }
               else if(preMapID == SpecialMapID.YYSZ_ID && GameInstance.scene.mapConfig.mapID == SpecialMapID.XYC_ID)
               {
                  TPreLoader.hideLoadingUI();
                  AutoFlyManager.mainCharAutoFly(SpecialMapID.XYC_FLY_TO,new Point(GameInstance.mainChar.tile_x,GameInstance.mainChar.tile_y),SpecialMapID.XYC_FLY_SPEED,onFlyComplete);
               }
               else
               {
                  TPreLoader.hideLoadingUI();
                  MainCharSeachPathManager.goon();
                  onFlyComplete();
               }
            }
            else
            {
               TPreLoader.hideLoadingUI();
               MainCharSeachPathManager.goon();
               onFlyComplete();
            }
            preMapID = GameConfig.wantEnterMapRes.id;
         };
         f5 = function():void
         {
            var _loc1_:DisconnectInfo = null;
            if(GameInstance.scene.mapConfig == null)
            {
               return;
            }
            if(mapID != GameInstance.scene.mapConfig.mapID)
            {
               return;
            }
            TopTipManager.getInstance().addEnterSceneTip("【 " + GameConfig.wantEnterMapRes.name + " 】");
            TSoundManager.playBgSound();
            if(ReloginManager.isDisconnectRelogin())
            {
               _loc1_ = ReloginManager.getInfo_disconnect();
               if(_loc1_ != null)
               {
                  if(_loc1_.inAfk == 1)
                  {
                     PipeManager.sendMsg(PipeConstants.AFK_START,1);
                  }
               }
            }
            ReloginManager.clearInfo_disconnect();
         };
         ZLog.add("加载地图配置文件完毕！！！");
         mapRes = MapTransManager.getMapRes(GameConfig.wantEnterMapRes.id);
         GameInstance.scene.mapConfig.widthScale = mapRes.scaleX;
         GameInstance.scene.mapConfig.heightScale = mapRes.scaleY;
         delay = 50;
         ht = new HandlerThread();
         arr = [f0,f1,f2];
         len = int(arr.length);
         i = 0;
         while(i < len)
         {
            ht.push(arr[i],[i / len],delay);
            i++;
         }
         ht.push(f4,[1],500);
         ht.push(f5,null,2000);
         mapID = GameInstance.scene.mapConfig.mapID;
      }
   }
}

