package com.tgame.moudels.biwudahui.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.mount.MountRes;
   import com.tgame.common.res.mount.MountResManager;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.biwudahui.Biwudahui_ApplicationFacade;
   import com.tgame.moudels.biwudahui.model.Biwudahui_MsgSenderProxy;
   import com.tgame.shell.view.components.BiwuDuijue_Panel;
   import com.tgame.shell.view.components.biwudahui.BiWuDaHui_ResultPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.manager.TimerManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Biwudahui_Mediator extends Mediator
   {
      
      public static const NAME:String = "Biwudahui_Mediator";
      
      private var loaderBuff:LoadBuffer;
      
      private var _timerData:TimerData;
      
      private var _curMsgType:int;
      
      private var _biwuResultPanel:BiWuDaHui_ResultPanel;
      
      private var _msgSenderProxy:Biwudahui_MsgSenderProxy;
      
      private var char_avatar_zizeng:int = 0;
      
      public function Biwudahui_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get biwuDuijuePanel() : BiwuDuijue_Panel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.biwuDuijuePanel);
         }
         return viewComponent as BiwuDuijue_Panel;
      }
      
      protected function get biwuResultPanel() : BiWuDaHui_ResultPanel
      {
         if(this._biwuResultPanel == null)
         {
            this._biwuResultPanel = new BiWuDaHui_ResultPanel();
            this._biwuResultPanel.addEventListener(BiWuDaHui_ResultPanel.BACK_TO_OWN_SERVER,this.onBackClick);
         }
         return this._biwuResultPanel;
      }
      
      private function onBackClick(param1:BaseEvent) : void
      {
         GameInstance.uiInstance.mainUI.showBiwuDaHuiFenshu(false);
         PipeManager.sendMsg(PipeConstants.LIKAI_KUAFU_LEITAI);
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Biwudahui_ApplicationFacade.SHOW_BIWUDUIJUE_PANEL,Biwudahui_ApplicationFacade.SHOW_BIWU_VS_BIFEN];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Biwudahui_ApplicationFacade.SHOW_BIWUDUIJUE_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance._biwuDuijuePanel))
               {
                  this.msgSenderProxy.send_53861();
               }
               break;
            case Biwudahui_ApplicationFacade.SHOW_BIWU_VS_BIFEN:
               this.showAutoBtn(!(_loc2_ as Boolean));
         }
      }
      
      private function get msgSenderProxy() : Biwudahui_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(Biwudahui_MsgSenderProxy.NAME) as Biwudahui_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      public function showAutoBtn(param1:Boolean) : void
      {
         GameInstance.uiInstance.mainUI.showAutoButton(param1);
         GameInstance.uiInstance.mainUI.showBiGuanButton(param1);
         if(param1)
         {
            GameInstance.uiInstance.mainUI.showBiwuDaHuiFenshu(false);
            this.hidebiwuResultPanel();
         }
      }
      
      public function downTimeFun(param1:int, param2:int) : void
      {
         this.timerComplete();
         this._curMsgType = param1;
         if(param2 <= 0)
         {
            NoticeManager.notify(NoticeManager.CENTER_UP,"",false);
            return;
         }
         this._timerData = TimerManager.createExactTimer(param2,param2,0,this.timerUpdate,this.timerComplete,1);
      }
      
      private function timerComplete() : void
      {
         if(this._timerData)
         {
            TimerManager.deleteTimer(this._timerData);
            this._timerData = null;
         }
      }
      
      private function timerUpdate(param1:Number) : void
      {
         if(param1 < 0)
         {
            NoticeManager.notify(NoticeManager.CENTER_UP,LanResManager.getLanCommonTextWords("处理中请稍后"),false);
            return;
         }
         var _loc2_:String = "";
         var _loc3_:String = Math.floor(param1 / 60) + LanResManager.getLanCommonTextWords("分");
         var _loc4_:String = Math.floor(param1) % 60 + LanResManager.getLanCommonTextWords("秒");
         if(this._curMsgType == 1)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("距离战斗开始还有：") + _loc3_ + _loc4_;
         }
         else if(this._curMsgType == 2)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("距离战斗结束还有：") + _loc3_ + _loc4_;
         }
         else if(this._curMsgType == 3)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("传回原服倒计时：") + _loc3_ + _loc4_;
         }
         NoticeManager.notify(NoticeManager.CENTER_UP,_loc2_,false);
      }
      
      public function setDatas(param1:Object) : void
      {
         this.biwuDuijuePanel.setInitialize(param1);
         this.biwuDuijuePanel.visible = true;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(BiwuDuijue_Panel,function():void
         {
         });
         UIEventsRegisterManager.addUIRemovedEvent(BiwuDuijue_Panel,function():void
         {
         });
      }
      
      private function biwuDuijueHandle(param1:Event = null) : void
      {
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
         }
      }
      
      private function panelClose(param1:FCloseEvent = null) : void
      {
      }
      
      public function showResultPanel(param1:Object, param2:Object, param3:String, param4:int) : void
      {
         this.biwuResultPanel.visible = true;
         this.biwuResultPanel.clearData();
         GameInstance.uiInstance.uiContainer.addChild(this.biwuResultPanel);
         this.biwuResultPanel.x = (GameConfig.sceneWidth - this.biwuResultPanel.width) / 2;
         this.biwuResultPanel.y = (GameConfig.sceneHeight - this.biwuResultPanel.height) / 2;
         this.biwuResultPanel.setData(param1,param2,param3,param4);
         var _loc5_:PurePlayer = new PurePlayer();
         _loc5_.isOnMount = param1.isOnMount;
         _loc5_.id = param1.id;
         _loc5_.avatarInfo.usingFashion = param1.usingFashion;
         _loc5_.avatarInfo.useAvatarType = param1.useAvatarType;
         param1.mountID = param1.mountID ? param1.mountID : -1;
         _loc5_.avatarInfo.isFeixing = param1.isFeixing;
         _loc5_.avatarInfo.isFeixing_huanzhuang_Id = param1.isFeixing_huanzhuang_Id;
         _loc5_.avatarInfo.isFeixing_wuhun_Id = param1.isFeixing_wuhun_Id;
         _loc5_ = this.setPurePlayer(param1.mountID,param1.partyID,_loc5_,param1.equipArr);
         this.setCharAvatar(_loc5_);
         if(param2.id == null)
         {
            this.biwuResultPanel.setOnLineState(param1.isonline,1);
            return;
         }
         var _loc6_:PurePlayer = new PurePlayer();
         _loc6_.isOnMount = param2.isOnMount;
         _loc6_.id = param2.id;
         _loc6_.avatarInfo.usingFashion = param2.usingFashion;
         _loc6_.avatarInfo.useAvatarType = param2.useAvatarType;
         param2.mountID = param2.mountID ? param2.mountID : -1;
         _loc6_.avatarInfo.isFeixing = param2.isFeixing;
         _loc6_.avatarInfo.isFeixing_huanzhuang_Id = param2.isFeixing_huanzhuang_Id;
         _loc6_.avatarInfo.isFeixing_wuhun_Id = param2.isFeixing_wuhun_Id;
         _loc6_ = this.setPurePlayer(param2.mountID,param2.partyID,_loc6_,param2.equipArr);
         this.setCharAvatar(_loc6_);
         this.biwuResultPanel.setOnLineState(param1.isonline,param2.isonline);
      }
      
      public function hidebiwuResultPanel() : void
      {
         if(this.biwuResultPanel.parent != null)
         {
            this.biwuResultPanel.parent.removeChild(this.biwuResultPanel);
         }
      }
      
      private function setCharAvatar(param1:PurePlayer) : void
      {
         var apdArr:Array;
         var callBack:Function = null;
         var $pPlayer:PurePlayer = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $pPlayer.id + "_" + char_avatar_zizeng)
            {
               return;
            }
            biwuResultPanel.setAvatar($pPlayer.id,param2,$pPlayer.avatarInfo.needChangeAvatarXY);
         };
         if(!$pPlayer)
         {
            return;
         }
         this.biwuResultPanel.setAvatar($pPlayer.id,null);
         apdArr = $pPlayer.avatarInfo.getSimpleAPDList($pPlayer.isOnMount);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pPlayer.id + "_" + ++this.char_avatar_zizeng,callBack,apdArr);
      }
      
      private function setPurePlayer(param1:int, param2:int, param3:PurePlayer, param4:Array) : PurePlayer
      {
         var _loc8_:MountRes = null;
         var _loc9_:GoodsRes = null;
         var _loc5_:AttributeInfo = param3.attributeInfo;
         var _loc6_:AvatarInfo = param3.avatarInfo;
         _loc5_.partyID = param2;
         if(param1 > 0)
         {
            _loc8_ = MountResManager.getMountRes(param1);
            if(_loc8_ != null)
            {
               param3.avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,_loc8_.id_m),AvatarPartType.MOUNT);
            }
         }
         var _loc7_:int = 0;
         while(_loc7_ < param4.length)
         {
            _loc9_ = GoodsResManager.getGoodsRes(param4[_loc7_]);
            if(_loc9_ != null)
            {
               AvatarManager.dressAvatarData(_loc6_,_loc9_.position,_loc9_.id_m,_loc5_.getSex());
            }
            _loc7_++;
         }
         return param3;
      }
      
      public function setScore(param1:String, param2:int, param3:String, param4:int) : void
      {
         GameInstance.uiInstance.mainUI.setBiwuDahuiFenshu(param1,param2,param3,param4);
      }
   }
}

