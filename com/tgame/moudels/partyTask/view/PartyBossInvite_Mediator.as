package com.tgame.moudels.partyTask.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.monster.MonsterRes;
   import com.tgame.common.res.monster.MonsterResManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.partyTask.model.PartyTask_MsgSenderProxy;
   import com.tgame.shell.view.components.PartyBoss_InvitePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class PartyBossInvite_Mediator extends Mediator
   {
      
      public static const NAME:String = "PartyBossInvite_Mediator";
      
      private var avatar_zizeng:int = 0;
      
      private var _senderProxy:PartyTask_MsgSenderProxy;
      
      public function PartyBossInvite_Mediator()
      {
         super(NAME);
      }
      
      public function get uiPanel() : PartyBoss_InvitePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.partyBossInvitePanel);
         }
         return viewComponent as PartyBoss_InvitePanel;
      }
      
      private function get senderProxy() : PartyTask_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(PartyTask_MsgSenderProxy.NAME) as PartyTask_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:int = int(param1.getBody());
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
         UIEventsRegisterManager.addUIRegisterEvent(PartyBoss_InvitePanel,function():void
         {
            uiPanel.addEventListener(PartyBoss_InvitePanel.UI_PARTYBOSS_INVITE_CLICK,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(PartyBoss_InvitePanel,function():void
         {
            uiPanel.removeEventListener(PartyBoss_InvitePanel.UI_PARTYBOSS_INVITE_CLICK,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc2_:String = param1.type;
         var _loc3_:Object = (param1 as BaseEvent).data;
         switch(_loc2_)
         {
            case PartyBoss_InvitePanel.UI_PARTYBOSS_INVITE_CLICK:
               this.senderProxy.send_51207();
         }
      }
      
      public function initReBoss(param1:Array) : void
      {
         this.uiPanel.initPanel(param1[3],param1[2],param1[4]);
         var _loc2_:int = param1[0] as int;
         var _loc3_:MonsterRes = MonsterResManager.getMonsterRes(_loc2_);
         if(_loc3_ != null)
         {
            this.setAvatar(_loc3_);
         }
      }
      
      private function setAvatar(param1:MonsterRes) : void
      {
         var apdArr:Array;
         var apd:AvatarParamData;
         var callBack:Function = null;
         var $mr:MonsterRes = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $mr.id_kind + "_" + avatar_zizeng)
            {
               return;
            }
            uiPanel.avatar = param2;
         };
         this.uiPanel.avatar = null;
         apdArr = [];
         apd = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,$mr.id_m));
         apdArr.push(apd);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($mr.id_kind + "_" + ++this.avatar_zizeng,callBack,apdArr,1,CharStatusType.STAND,0);
      }
   }
}

