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
   import com.tgame.moudels.WoHuCangLong.model.WoHuCangLong_MsgSenderProxy;
   import com.tgame.shell.view.components.woHuCangLong.WoHuCangLongResultPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WoHuCangLongResult_Mediator extends Mediator
   {
      
      public static const NAME:String = "WoHuCangLongResult_Mediator";
      
      private var char_avatar_zizeng:int = 0;
      
      public function WoHuCangLongResult_Mediator(param1:String = null, param2:Object = null)
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
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      public function get panel() : WoHuCangLongResultPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.woHuCangLongResultPanel);
         }
         return viewComponent as WoHuCangLongResultPanel;
      }
      
      public function get senderProxy() : WoHuCangLong_MsgSenderProxy
      {
         return facade.retrieveProxy(WoHuCangLong_MsgSenderProxy.NAME) as WoHuCangLong_MsgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(WoHuCangLongResultPanel,function():void
         {
            panel.addEventListener(WoHuCangLongResultPanel.BACK_TO_OWN_SERVER,panelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(WoHuCangLongResultPanel,function():void
         {
            panel.removeEventListener(WoHuCangLongResultPanel.BACK_TO_OWN_SERVER,panelHandle);
         });
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case WoHuCangLongResultPanel.BACK_TO_OWN_SERVER:
               PipeManager.sendMsg(PipeConstants.LIKAI_KUAFU_LEITAI);
               this.hidePanel();
         }
      }
      
      public function showResultPanel(param1:String, param2:int, param3:int, param4:Array) : void
      {
         GameInstance.uiInstance.uiContainer.addChild(this.panel);
         this.panel.x = (GameConfig.sceneWidth - this.panel.width) / 2;
         this.panel.y = (GameConfig.sceneHeight - this.panel.height) / 2;
         var _loc5_:int = 0;
         while(_loc5_ < param4.length)
         {
            this.setPlayerAvatar(_loc5_,param4[_loc5_].menPai,param4[_loc5_].goodsArr);
            _loc5_++;
         }
         this.panel.setPanel(param1,param2,param3,param4);
      }
      
      public function hidePanel() : void
      {
         if(Boolean(this.panel) && this.panel.parent != null)
         {
            this.panel.parent.removeChild(this.panel);
         }
         this.panel.clearData();
      }
      
      public function setPlayerAvatar(param1:int, param2:int, param3:Array) : void
      {
         var _loc4_:PurePlayer = new PurePlayer();
         _loc4_.isOnMount = false;
         _loc4_.id = param1;
         _loc4_ = this.setPurePlayer(param2,_loc4_,param3);
         this.setAvatar(_loc4_);
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

