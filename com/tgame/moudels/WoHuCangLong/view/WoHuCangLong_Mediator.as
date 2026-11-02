package com.tgame.moudels.WoHuCangLong.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.WoHuCangLong.WoHuCangLong_ApplicationFacade;
   import com.tgame.moudels.WoHuCangLong.model.WoHuCangLong_MsgSenderProxy;
   import com.tgame.moudels.WoHuCangLong.view.info.WoHuCangLongVo;
   import com.tgame.shell.view.components.woHuCangLong.WoHuCangLong;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WoHuCangLong_Mediator extends Mediator
   {
      
      public static const NAME:String = "WoHuCangLong_Mediator";
      
      private var char_avatar_zizeng:int = 0;
      
      public function WoHuCangLong_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function onRemove() : void
      {
      }
      
      override public function listNotificationInterests() : Array
      {
         return [WoHuCangLong_ApplicationFacade.SHOW_WOHUCANGLONG_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case WoHuCangLong_ApplicationFacade.SHOW_WOHUCANGLONG_PANEL:
               this.senderProxy.send_72751();
         }
      }
      
      public function get panel() : WoHuCangLong
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.woHuCangLongPanel);
         }
         return viewComponent as WoHuCangLong;
      }
      
      public function get senderProxy() : WoHuCangLong_MsgSenderProxy
      {
         return facade.retrieveProxy(WoHuCangLong_MsgSenderProxy.NAME) as WoHuCangLong_MsgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(WoHuCangLong,function():void
         {
            panel.addEventListener(WoHuCangLong.WOHUCANGLONG_TOUXIAN_CLICK,panelHandle);
            panel.addEventListener(WoHuCangLong.WOHUCANGLONG_PAIHANG_CLICK,panelHandle);
            panel.addEventListener(WoHuCangLong.WOHUCANGLONG_PIPEI_CLICK,panelHandle);
            panel.addEventListener(WoHuCangLong.WOHUCANGLONG_QUXIAO_CLICK,panelHandle);
            panel.addEventListener(WoHuCangLong.WOHUCANGLONG_SHENGJIJINENG_CLICK,panelHandle);
            panel.addEventListener(WoHuCangLong.WOHUCANGLONG_PAIHANGBANG_FANYE_CLICK,panelHandle);
            panel.addEventListener(WoHuCangLong.WOHUCANGLONG_BAOGUO_CLICK,panelHandle);
            panel.addEventListener(WoHuCangLong.WOHUCANGLONG_SHOP_CLICK,panelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(WoHuCangLong,function():void
         {
            panel.removeEventListener(WoHuCangLong.WOHUCANGLONG_TOUXIAN_CLICK,panelHandle);
            panel.removeEventListener(WoHuCangLong.WOHUCANGLONG_PAIHANG_CLICK,panelHandle);
            panel.removeEventListener(WoHuCangLong.WOHUCANGLONG_PIPEI_CLICK,panelHandle);
            panel.removeEventListener(WoHuCangLong.WOHUCANGLONG_QUXIAO_CLICK,panelHandle);
            panel.removeEventListener(WoHuCangLong.WOHUCANGLONG_SHENGJIJINENG_CLICK,panelHandle);
            panel.removeEventListener(WoHuCangLong.WOHUCANGLONG_PAIHANGBANG_FANYE_CLICK,panelHandle);
            panel.removeEventListener(WoHuCangLong.WOHUCANGLONG_BAOGUO_CLICK,panelHandle);
            panel.removeEventListener(WoHuCangLong.WOHUCANGLONG_SHOP_CLICK,panelHandle);
         });
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case WoHuCangLong.WOHUCANGLONG_TOUXIAN_CLICK:
               this.senderProxy.send_72761();
               break;
            case WoHuCangLong.WOHUCANGLONG_PAIHANG_CLICK:
               this.senderProxy.send_72771(1);
               break;
            case WoHuCangLong.WOHUCANGLONG_PAIHANGBANG_FANYE_CLICK:
               this.senderProxy.send_72771(_loc2_.data);
               break;
            case WoHuCangLong.WOHUCANGLONG_PIPEI_CLICK:
               this.senderProxy.send_72755(1);
               break;
            case WoHuCangLong.WOHUCANGLONG_QUXIAO_CLICK:
               this.senderProxy.send_72755(0);
               break;
            case WoHuCangLong.WOHUCANGLONG_SHENGJIJINENG_CLICK:
               this.senderProxy.send_72753(_loc2_.data);
               break;
            case WoHuCangLong.WOHUCANGLONG_BAOGUO_CLICK:
               PipeManager.sendMsg(PipeConstants.MAINUI_KUAFU_GUIZHE_QUERY,3);
               break;
            case WoHuCangLong.WOHUCANGLONG_SHOP_CLICK:
               PipeManager.sendMsg(PipeConstants.SET_MAINCHAR_MALL,6);
         }
      }
      
      public function setWoHuCangLongPanel(param1:WoHuCangLongVo) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
            this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
         this.panel.setinitilizeUI(param1);
         this.setPlayerAvatar(param1.playerArr);
      }
      
      public function setTouXianPanel(param1:Array, param2:String, param3:String, param4:int, param5:int) : void
      {
         this.panel.setTouxianList(param1,param2,param3,param4,param5);
      }
      
      public function setPaiHangBangPanel(param1:int, param2:int, param3:Array, param4:int) : void
      {
         this.panel.setPaihangbangList(param1,param2,param3,param4);
      }
      
      public function setPlayerAvatar(param1:Array) : void
      {
         var _loc3_:Object = null;
         var _loc4_:PurePlayer = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_];
            _loc4_ = new PurePlayer();
            _loc4_.isOnMount = false;
            _loc4_.id = _loc2_;
            _loc4_ = this.setPurePlayer(_loc3_.partyID,_loc4_,_loc3_.equipArr);
            this.setAvatar(_loc4_);
            _loc2_++;
         }
      }
      
      private function setPurePlayer(param1:int, param2:PurePlayer, param3:Array) : PurePlayer
      {
         var _loc7_:GoodsRes = null;
         var _loc4_:AttributeInfo = param2.attributeInfo;
         var _loc5_:AvatarInfo = param2.avatarInfo;
         _loc4_.partyID = param1;
         var _loc6_:int = 0;
         while(_loc6_ < param3.length)
         {
            _loc7_ = GoodsResManager.getGoodsRes(param3[_loc6_]);
            if(_loc7_ != null)
            {
               AvatarManager.dressAvatarData(_loc5_,_loc7_.position,_loc7_.id_m,_loc4_.getSex());
            }
            _loc6_++;
         }
         return param2;
      }
      
      private function setAvatar(param1:PurePlayer) : void
      {
         var apdArr:Array;
         var callBack:Function = null;
         var $pPlayer:PurePlayer = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            panel.setAvatar($pPlayer.id,param2,$pPlayer.avatarInfo.needChangeAvatarXY);
         };
         if(!$pPlayer)
         {
            return;
         }
         this.panel.setAvatar($pPlayer.id,null);
         apdArr = $pPlayer.avatarInfo.getSimpleAPDList($pPlayer.isOnMount,$pPlayer.attributeInfo.getSex());
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pPlayer.id + "_" + ++this.char_avatar_zizeng,callBack,apdArr);
      }
   }
}

