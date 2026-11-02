package com.tgame.moudels.Fashion.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Fashion.model.Fashion_MsgSenderProxy;
   import com.tgame.shell.view.components.FashionPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Fashion_Mediator extends Mediator
   {
      
      public static const NAME:String = "Fashion_Mediator";
      
      private var nowPage:int = 0;
      
      private var char_avatar_zizeng:int = 0;
      
      private var fashionID:int = 0;
      
      private var equipArr:Array = [];
      
      private var _senderProxy:Fashion_MsgSenderProxy;
      
      public function Fashion_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : Fashion_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Fashion_MsgSenderProxy.NAME) as Fashion_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get fashionPanel() : FashionPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.fashionPanel);
         }
         return viewComponent as FashionPanel;
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
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(FashionPanel,function():void
         {
            fashionPanel.addEventListener(Event.ADDED_TO_STAGE,handler);
            fashionPanel.addEventListener(FashionPanel.UI_FASHION_FANYE_CLICK,handler);
            fashionPanel.addEventListener(FashionPanel.UI_SAVEFASHION_CLICK,handler);
            fashionPanel.addEventListener(FashionPanel.UI_SHICHUAN_FASHION_CLICK,handler);
            fashionPanel.addEventListener(FashionPanel.UI_CANCEL_CLICK,handler);
            fashionPanel.addEventListener(FashionPanel.UI_XIEXIA_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(FashionPanel,function():void
         {
            fashionPanel.removeEventListener(Event.ADDED_TO_STAGE,handler);
            fashionPanel.removeEventListener(FashionPanel.UI_FASHION_FANYE_CLICK,handler);
            fashionPanel.removeEventListener(FashionPanel.UI_SAVEFASHION_CLICK,handler);
            fashionPanel.removeEventListener(FashionPanel.UI_SHICHUAN_FASHION_CLICK,handler);
            fashionPanel.removeEventListener(FashionPanel.UI_CANCEL_CLICK,handler);
            fashionPanel.removeEventListener(FashionPanel.UI_XIEXIA_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.senderProxy.send_73321(1);
               break;
            case FashionPanel.UI_FASHION_FANYE_CLICK:
               _loc3_ = 0;
               _loc4_ = int(_loc2_.data);
               if(_loc4_ == 1)
               {
                  _loc3_ = this.nowPage - 1;
               }
               else
               {
                  _loc3_ = this.nowPage + 1;
               }
               this.senderProxy.send_73321(_loc3_);
               break;
            case FashionPanel.UI_SAVEFASHION_CLICK:
               this.senderProxy.send_73325(_loc2_.data);
               break;
            case FashionPanel.UI_SHICHUAN_FASHION_CLICK:
               this.fashionID = int(_loc2_.data);
               this.senderProxy.send_73323(_loc2_.data);
               break;
            case FashionPanel.UI_CANCEL_CLICK:
               this.fashionID = 0;
               this.setValue("");
               this.setAvatar(0);
               break;
            case FashionPanel.UI_XIEXIA_CLICK:
               this.senderProxy.send_83171();
         }
      }
      
      public function setInit(param1:int, param2:int, param3:Array) : void
      {
         var _loc4_:Goods = null;
         this.nowPage = param1;
         this.fashionPanel.setInit(param1,param2,param3);
         if(param3.length > 0)
         {
            _loc4_ = param3[0] as Goods;
            this.fashionID = _loc4_.id;
            this.senderProxy.send_73323(_loc4_.id);
         }
      }
      
      public function setValue(param1:String) : void
      {
         this.fashionPanel.setValue(param1);
         this.setAvatar();
      }
      
      public function setAvatar(param1:int = 1) : void
      {
         var _loc7_:Goods = null;
         var _loc2_:PurePlayer = new PurePlayer();
         _loc2_.isOnMount = false;
         _loc2_.id = GameInstance.mainChar.id;
         _loc2_.avatarInfo.useIng_Weapon_id = GameInstance.mainCharData.avatarInfo.useIng_Weapon_id;
         _loc2_.avatarInfo.isFeixing = false;
         _loc2_.avatarInfo.isFeixing_huanzhuang_Id = 0;
         var _loc3_:int = GameInstance.mainCharData.mountInfo.currentMountID ? GameInstance.mainCharData.mountInfo.currentMountID : -1;
         var _loc4_:int = GameInstance.mainCharData.banghuiInfo.banghuiId;
         this.equipArr = GameInstance.mainCharData.goodsInfo.goodsBodyArr;
         if(param1 == 1)
         {
            _loc7_ = new Goods(this.fashionID);
            _loc7_.roleID = GameInstance.mainChar.id;
            this.equipArr.push(_loc7_);
         }
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(SpecialGoodsID.getSpecialAvatarType(this.fashionID) == 3)
         {
            _loc5_ = 1;
         }
         else if(param1 == 0)
         {
            _loc5_ = GameInstance.mainCharData.avatarInfo.usingFashion;
         }
         _loc6_ = GameInstance.mainCharData.avatarInfo.useAvatarType;
         _loc2_ = this.setPurePlayer(_loc3_,_loc4_,_loc2_,this.equipArr,_loc5_,_loc6_);
         this.setCharAvatar(_loc2_);
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
            fashionPanel.avatar(param2);
            if($pPlayer.avatarInfo.needChangeAvatarXY)
            {
               fashionPanel.setAvaterXY(true);
            }
         };
         this.fashionPanel.avatar(null);
         if(!$pPlayer)
         {
            return;
         }
         apdArr = $pPlayer.avatarInfo.getSimpleAPDList(false);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pPlayer.id + "_" + ++this.char_avatar_zizeng,callBack,apdArr);
      }
      
      private function setPurePlayer(param1:int, param2:int, param3:PurePlayer, param4:Array, param5:int = 0, param6:int = 0) : PurePlayer
      {
         var _loc10_:int = 0;
         var _loc11_:GoodsRes = null;
         var _loc7_:AttributeInfo = param3.attributeInfo;
         var _loc8_:AvatarInfo = param3.avatarInfo;
         _loc7_.partyID = param2;
         _loc8_.usingFashion = param5;
         _loc8_.useAvatarType = param6;
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
         return param3;
      }
   }
}

