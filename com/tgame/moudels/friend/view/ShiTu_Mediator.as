package com.tgame.moudels.friend.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.mount.MountRes;
   import com.tgame.common.res.mount.MountResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.friend.model.Friend_MsgSenderProxy;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.ShiTuSystemPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ShiTu_Mediator extends Mediator
   {
      
      public static const NAME:String = "ShiTu_Mediator";
      
      private var menuUI:Menu;
      
      private var load:LoadBuffer;
      
      private var nowPageNum:int = 1;
      
      private var maxPageNum:int = 1;
      
      private var loaderBuff:LoadBuffer;
      
      private var char_avatar_zizeng:int = 0;
      
      private var _msgSenderProxy:Friend_MsgSenderProxy;
      
      public function ShiTu_Mediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Friend_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Friend_MsgSenderProxy.NAME) as Friend_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get shiTuSystemPanel() : ShiTuSystemPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.shiTuSystemPanel);
         }
         return viewComponent as ShiTuSystemPanel;
      }
      
      private function get mainUI() : MainUI
      {
         return GameInstance.uiInstance.mainUI;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ShiTuSystemPanel,function():void
         {
            shiTuSystemPanel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            shiTuSystemPanel.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveToStage);
            shiTuSystemPanel.addEventListener(ShiTuSystemPanel.UI_SHITUPANEL_LIST_GET_PAGE,shiTuSystemPanelHandel);
            shiTuSystemPanel.addEventListener(ShiTuSystemPanel.UI_SHITUPANEL_PARTICULAR_INFO_SHOW,shiTuSystemPanelHandel);
            shiTuSystemPanel.addEventListener(ShiTuSystemPanel.UI_SHITUPANEL_ZIDONGTONGYIBAISHIORSHOUTU,shiTuSystemPanelHandel);
            shiTuSystemPanel.addEventListener(ShiTuSystemPanel.UI_SHITUPANEL_GETEXP_BTN_CLICK,shiTuSystemPanelHandel);
            shiTuSystemPanel.addEventListener(ShiTuSystemPanel.UI_SHITUPANEL_GETSHENGWANG_BTN_CLICK,shiTuSystemPanelHandel);
            shiTuSystemPanel.addEventListener(ShiTuSystemPanel.UI_SHITUPANEL_SHENGWANGSHANGDIANGOUWU_BTN_CLICK,shiTuSystemPanelHandel);
            shiTuSystemPanel.addEventListener(ShiTuSystemPanel.UI_SHITUPANEL_BAISHIORSHOUTU_BTN_CLICK,shiTuSystemPanelHandel);
            shiTuSystemPanel.addEventListener(ShiTuSystemPanel.UI_XIANGXIZILIAO_CLICK,shiTuSystemPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ShiTuSystemPanel,function():void
         {
            shiTuSystemPanel.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveToStage);
            shiTuSystemPanel.removeEventListener(ShiTuSystemPanel.UI_SHITUPANEL_LIST_GET_PAGE,shiTuSystemPanelHandel);
            shiTuSystemPanel.removeEventListener(ShiTuSystemPanel.UI_SHITUPANEL_PARTICULAR_INFO_SHOW,shiTuSystemPanelHandel);
            shiTuSystemPanel.removeEventListener(ShiTuSystemPanel.UI_SHITUPANEL_ZIDONGTONGYIBAISHIORSHOUTU,shiTuSystemPanelHandel);
            shiTuSystemPanel.removeEventListener(ShiTuSystemPanel.UI_SHITUPANEL_GETEXP_BTN_CLICK,shiTuSystemPanelHandel);
            shiTuSystemPanel.removeEventListener(ShiTuSystemPanel.UI_SHITUPANEL_GETSHENGWANG_BTN_CLICK,shiTuSystemPanelHandel);
            shiTuSystemPanel.removeEventListener(ShiTuSystemPanel.UI_SHITUPANEL_SHENGWANGSHANGDIANGOUWU_BTN_CLICK,shiTuSystemPanelHandel);
            shiTuSystemPanel.removeEventListener(ShiTuSystemPanel.UI_SHITUPANEL_BAISHIORSHOUTU_BTN_CLICK,shiTuSystemPanelHandel);
            shiTuSystemPanel.removeEventListener(ShiTuSystemPanel.UI_XIANGXIZILIAO_CLICK,shiTuSystemPanelHandel);
         });
      }
      
      private function onRemoveToStage(param1:Event) : void
      {
         TCursorManager.resumFullMouse();
      }
      
      private function onAddToStage(param1:Event) : void
      {
      }
      
      private function shiTuSystemPanelHandel(param1:Event) : void
      {
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:SceneCharacter = GameInstance.mainChar;
         var _loc4_:String = param1.type;
         var _loc5_:BaseEvent = param1 as BaseEvent;
         var _loc6_:int = 0;
         var _loc7_:Object = _loc5_.data as Object;
         switch(_loc4_)
         {
            case ShiTuSystemPanel.UI_SHITUPANEL_LIST_GET_PAGE:
               if(_loc7_.type as int == 1)
               {
                  this.nowPageNum = 1;
               }
               if(_loc7_.type as int == 2)
               {
                  --this.nowPageNum;
               }
               if(_loc7_.type as int == 3)
               {
                  ++this.nowPageNum;
               }
               if(_loc7_.type as int == 4)
               {
                  this.nowPageNum = this.maxPageNum;
               }
               if(this.nowPageNum < 1)
               {
                  this.nowPageNum = 1;
               }
               if(this.nowPageNum > this.maxPageNum)
               {
                  this.nowPageNum = this.maxPageNum;
               }
               this.refreshList(_loc7_.panelType - 1);
               this.addLoadBuffer();
               break;
            case ShiTuSystemPanel.UI_SHITUPANEL_PARTICULAR_INFO_SHOW:
               this.msgSenderProxy.send_11001(_loc7_.playerID);
               break;
            case ShiTuSystemPanel.UI_SHITUPANEL_ZIDONGTONGYIBAISHIORSHOUTU:
               this.msgSenderProxy.send_10399([_loc7_.panelType - 1,_loc7_.b]);
               break;
            case ShiTuSystemPanel.UI_SHITUPANEL_GETEXP_BTN_CLICK:
               if(_loc7_.PanelType - 1 == 0)
               {
                  this.msgSenderProxy.send_11019(0);
                  this.shiTuSystemPanel.setGetExp(0);
               }
               else
               {
                  this.msgSenderProxy.send_11019(1);
               }
               break;
            case ShiTuSystemPanel.UI_SHITUPANEL_GETSHENGWANG_BTN_CLICK:
               if(_loc7_.PanelType - 1 == 0)
               {
                  this.msgSenderProxy.send_11025(0);
                  this.shiTuSystemPanel.setGetShengWang(0);
               }
               else
               {
                  this.msgSenderProxy.send_11025(1);
               }
               break;
            case ShiTuSystemPanel.UI_SHITUPANEL_SHENGWANGSHANGDIANGOUWU_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SET_MAINCHAR_MALL,4);
               break;
            case ShiTuSystemPanel.UI_SHITUPANEL_BAISHIORSHOUTU_BTN_CLICK:
               this.msgSenderProxy.send_11021([_loc7_.panelType - 1,_loc7_.playerID]);
               break;
            case ShiTuSystemPanel.UI_XIANGXIZILIAO_CLICK:
               GameInstance.lookPlayerID = _loc7_.playerID;
               if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
         }
      }
      
      public function showShiTuPanel(param1:int, param2:int, param3:int, param4:Array, param5:Number, param6:int) : void
      {
         var _loc7_:XML = null;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:int = 0;
         this.nowPageNum = param3;
         this.maxPageNum = param2;
         if(!Fun.isVisible(GameInstance.uiInstance._shiTuSystemPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_SHITU_PANEL);
         }
         this.shiTuSystemPanel.setTitle(param1 + 1);
         if(Fun.isVisible(GameInstance.uiInstance._friendPanel))
         {
            ResizeManager.showDoublePanel(GameInstance.uiInstance._friendPanel,this.shiTuSystemPanel);
            _loc7_ = <list></list>;
            _loc8_ = param3 == 1 ? true : false;
            _loc9_ = param3 == param2 ? true : false;
            _loc10_ = 0;
            while(_loc10_ < param4.length)
            {
               _loc7_.appendChild(<node id={param4[_loc10_].id} name={param4[_loc10_].name} level={param4[_loc10_].lv} huoyue={param4[_loc10_].huoyue} discipleTotal={param4[_loc10_].tuDiShu} discipleMax={param4[_loc10_].shanXian} setup={param4[_loc10_].partyName} setupID={param4[_loc10_].partyId}/>);
               _loc10_++;
            }
            this.shiTuSystemPanel.setList(_loc7_,param3,param2,_loc8_,_loc9_);
            this.shiTuSystemPanel.setGetExp(param5);
            this.shiTuSystemPanel.setGetShengWang(param6);
         }
      }
      
      public function setInfo(param1:int, param2:Object, param3:int, param4:Number, param5:int, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:int, param13:int, param14:int, param15:int, param16:int, param17:int, param18:Number, param19:Number) : void
      {
         var _loc22_:Array = null;
         var _loc23_:Goods = null;
         var _loc20_:PurePlayer = new PurePlayer();
         _loc20_.isOnMount = param2.isOnMount;
         _loc20_.id = param2.id;
         param2.mountID = param2.mountID ? param2.mountID : -1;
         _loc20_ = this.setPurePlayer(param2.mountID,param2.partyID,_loc20_,param2.equipArr,param2.usingFashion,param2.useAvatarType);
         _loc20_.avatarInfo.useIng_Weapon_id = param2.useIng_Weapon_id;
         _loc20_.avatarInfo.isFeixing = param2.isFeixing;
         _loc20_.avatarInfo.isFeixing_huanzhuang_Id = param2.isFeixing_huanzhuang_Id;
         _loc20_.avatarInfo.isFeixing_wuhun_Id = param2.isFeixing_wuhun_Id;
         var _loc21_:Array = ExchangePositionManager.getEquipStatus(param2.equipArr);
         if(_loc21_.length > 0)
         {
            this.shiTuSystemPanel.setICOState(_loc21_[0][0],_loc21_[0][1],_loc21_[1][0],_loc21_[1][1],_loc21_[2][0],_loc21_[2][1],_loc21_[3][0],_loc21_[3][1],_loc21_[4][0],_loc21_[4][1],_loc21_[5][0],_loc21_[5][1],_loc21_[6][0],_loc21_[6][1],_loc21_[7][0],_loc21_[7][1]);
         }
         else
         {
            this.shiTuSystemPanel.setICOState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
         }
         if(param2.taoZhuang)
         {
            this.shiTuSystemPanel.setSiShengShouState(12,12,12,12);
         }
         else
         {
            _loc22_ = ExchangePositionManager.getSiShengShouStatus(param2.equipArr);
            if(_loc22_.length > 0)
            {
               this.shiTuSystemPanel.setSiShengShouState(_loc22_[0],_loc22_[1],_loc22_[2],_loc22_[3]);
            }
            else
            {
               this.shiTuSystemPanel.setSiShengShouState(0,0,0,0);
            }
         }
         if(param2.yupeiID)
         {
            _loc23_ = new Goods(param2.yupeiID);
            _loc23_.position = _loc23_.res.position;
            _loc23_.roleID = param2.id;
            this.shiTuSystemPanel.setYupei(_loc23_);
         }
         this.shiTuSystemPanel.setICOXiantian(param2.isXTWJ,param2.TSNL,param2.ShenNongBaiChaoDanSta,param2.qianNengXinFaSta);
         this.shiTuSystemPanel.setICORouti(param2.isRTJS);
         this.shiTuSystemPanel.setICOWuhun(param2.wuhun,param2.wuHunShengJiDan,param2.huohundan,param2.wuhunshendan,param2.longhunwupo,param2.longhunshendan,param2.shenfumiji,param2.isNeitishenqi,param2.neitishenqi);
         this.shiTuSystemPanel.setICOHuXinYao(param2.HuXinYao);
         this.shiTuSystemPanel.setICONiXi(param2.niXiStatus);
         this.shiTuSystemPanel.setICOFengHuang(param2.fengHuang);
         this.setCharAvatar(_loc20_);
         this.shiTuSystemPanel.setItem(param2.equipArr,param3,param1 + 1,param5,param4,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16,param17,param2.useIng_Weapon_id);
         this.shiTuSystemPanel.setZhandouliNum(param18);
         this.shiTuSystemPanel.setWugongJinjie(param19);
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
            shiTuSystemPanel.setAavatar(param2);
            if($pPlayer.avatarInfo.needChangeAvatarXY)
            {
               shiTuSystemPanel.setAvaterXY(true);
            }
         };
         this.shiTuSystemPanel.setAavatar(null);
         if(!$pPlayer)
         {
            return;
         }
         apdArr = $pPlayer.avatarInfo.getSimpleAPDList($pPlayer.isOnMount);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pPlayer.id + "_" + ++this.char_avatar_zizeng,callBack,apdArr);
      }
      
      private function setPurePlayer(param1:int, param2:int, param3:PurePlayer, param4:Array, param5:int = 0, param6:int = 0) : PurePlayer
      {
         var _loc10_:int = 0;
         var _loc11_:GoodsRes = null;
         var _loc12_:MountRes = null;
         var _loc7_:AttributeInfo = param3.attributeInfo;
         var _loc8_:AvatarInfo = param3.avatarInfo;
         _loc7_.partyID = param2;
         _loc8_.useAvatarType = param6;
         _loc8_.usingFashion = param5;
         var _loc9_:int = 0;
         while(_loc9_ < param4.length)
         {
            _loc10_ = (param4[_loc9_] as Goods).id;
            _loc11_ = GoodsResManager.getGoodsRes(_loc10_);
            if(_loc11_ != null)
            {
               AvatarManager.dressAvatarData(_loc8_,_loc11_.position,_loc11_.id_m,_loc7_.getSex());
            }
            _loc9_++;
         }
         if(param1 > 0)
         {
            if(_loc8_.usingFashion == 1)
            {
               _loc8_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,SpecialGoodsID.HUANGJIN_SHENGLONG_ID),AvatarPartType.MOUNT);
            }
            else if(_loc8_.useAvatarType > 0)
            {
               _loc8_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,AvatarManager.getAvatarIdByType(param6)),AvatarPartType.MOUNT);
            }
            else
            {
               _loc12_ = MountResManager.getMountRes(param1);
               if(_loc12_ != null)
               {
                  param3.avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,_loc12_.id_m),AvatarPartType.MOUNT);
               }
            }
         }
         return param3;
      }
      
      public function refreshList(param1:int) : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._friendPanel))
         {
            this.msgSenderProxy.send_10397([param1,this.nowPageNum,10]);
         }
      }
      
      public function showConfirmShouTu(param1:int, param2:int, param3:int, param4:String) : void
      {
         var type:int = param1;
         var id1:int = param2;
         var id2:int = param3;
         var name2:String = param4;
         if(OtherConst.baishiNum > 9)
         {
            return;
         }
         ++OtherConst.baishiNum;
         this.mainUI.showICOTip(MainUI.TYPE_SHITU_TIP,function():void
         {
            var next:Function = null;
            next = function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  msgSenderProxy.send_11023([type,id1,id2,1]);
               }
               else
               {
                  msgSenderProxy.send_11023([type,id1,id2,0]);
               }
            };
            if(type == 0)
            {
               FAlert.show(name2 + LanResManager.getLanCommonTextWords("想收您为徒，是否同意？"),LanResManager.getLanCommonTextWords("收徒请求"),2,next);
            }
            else if(type == 1)
            {
               FAlert.show(name2 + LanResManager.getLanCommonTextWords("想拜您为师，是否同意？"),LanResManager.getLanCommonTextWords("拜师请求"),2,next);
            }
         });
      }
      
      private function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         this.loaderBuff = LoadBuffer.show(this.shiTuSystemPanel);
      }
      
      public function removeLoaderBuff() : void
      {
         if(this.loaderBuff)
         {
            this.loaderBuff.close();
         }
         this.loaderBuff = null;
      }
   }
}

