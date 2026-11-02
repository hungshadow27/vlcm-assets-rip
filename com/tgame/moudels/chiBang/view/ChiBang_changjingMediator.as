package com.tgame.moudels.chiBang.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.BaseCharacter;
   import com.tgame.manager.AvatarManager;
   import com.tgame.moudels.chiBang.ChiBang_ApplicationFacade;
   import com.tgame.moudels.chiBang.model.ChiBang_MsgSenderProxy;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.AvatarPartID;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ChiBang_changjingMediator extends Mediator
   {
      
      public static const NAME:String = "ChiBang_changjingMediator";
      
      private var _msgSenderProxy:ChiBang_MsgSenderProxy;
      
      public function ChiBang_changjingMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : ChiBang_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(ChiBang_MsgSenderProxy.NAME) as ChiBang_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ChiBang_ApplicationFacade.UP_DOWN_FEIXING];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ChiBang_ApplicationFacade.UP_DOWN_FEIXING:
               if((GameInstance.mainChar.data as BaseCharacter).avatarInfo.isFeixing == false)
               {
                  this.msgSenderProxy.send_61781(_loc2_ as int);
               }
               else if((GameInstance.mainChar.data as BaseCharacter).avatarInfo.isFeixing_huanzhuang_Id == 3)
               {
                  this.msgSenderProxy.send_61781(_loc2_ as int);
               }
               else
               {
                  this.msgSenderProxy.send_61787(_loc2_ as int);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
      }
      
      public function feixingHuanzhuang(param1:int, param2:int, param3:int, param4:int = 0) : void
      {
         var _loc5_:SceneCharacter = GameInstance.scene.getCharByID(param1,SceneCharacterType.PLAYER);
         if(!_loc5_)
         {
            return;
         }
         if(param3)
         {
            (_loc5_.data as BaseCharacter).avatarInfo.isFeixing = true;
            (_loc5_.data as BaseCharacter).avatarInfo.isFeixing_huanzhuang_Id = param2;
            (_loc5_.data as BaseCharacter).avatarInfo.isFeixing_wuhun_Id = param4;
            _loc5_.hideAvatarPartByID(AvatarPartID.SHADOW);
            if((_loc5_.data as BaseCharacter).avatarInfo.isFeixing)
            {
               if(_loc5_.getStatus() == CharStatusType.DEATH || _loc5_.getStatus() == CharStatusType.SIT)
               {
                  _loc5_.playTo(CharStatusType.STAND);
               }
            }
            AvatarManager.updateMainAvatar(_loc5_);
         }
         else
         {
            (_loc5_.data as BaseCharacter).avatarInfo.isFeixing = false;
            (_loc5_.data as BaseCharacter).avatarInfo.isFeixing_huanzhuang_Id = param2;
            (_loc5_.data as BaseCharacter).avatarInfo.isFeixing_wuhun_Id = param4;
            _loc5_.showAvatarPartByID(AvatarPartID.SHADOW);
            AvatarManager.updateMainAvatar(_loc5_);
         }
      }
   }
}

