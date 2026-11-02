package com.tgame.moudels.zhenqiDoll.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.attribute.view.Attribute_TargetCharAttributePlaneMediator;
   import com.tgame.moudels.login.view.*;
   import com.tgame.moudels.zhenqiDoll.view.ZhenqiDoll_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.avatar.AvatarPart;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ZhenqiDoll_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Attribute_MsgReceivedProxy";
      
      private var _afkMediator:ZhenqiDoll_Mediator;
      
      private var _targetCharAttributePlaneMediator:Attribute_TargetCharAttributePlaneMediator;
      
      public function ZhenqiDoll_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get zhenqiDollMediator() : ZhenqiDoll_Mediator
      {
         if(!this._afkMediator)
         {
            this._afkMediator = facade.retrieveMediator(ZhenqiDoll_Mediator.NAME) as ZhenqiDoll_Mediator;
         }
         return this._afkMediator;
      }
      
      private function get targetCharAttributePlaneMediator() : Attribute_TargetCharAttributePlaneMediator
      {
         if(!this._targetCharAttributePlaneMediator)
         {
            this._targetCharAttributePlaneMediator = facade.retrieveMediator(Attribute_TargetCharAttributePlaneMediator.NAME) as Attribute_TargetCharAttributePlaneMediator;
         }
         return this._targetCharAttributePlaneMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([50706,50708,50710],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([50706,50708,50710],NAME);
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
      
      public function received_50706(param1:ByteArray) : void
      {
         ZLog.add("50706：接收古树精魄查询消息");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readShort();
         this.zhenqiDollMediator.updateGuShi(_loc2_,_loc3_);
      }
      
      public function received_50710(param1:ByteArray) : void
      {
         var apd:AvatarParamData;
         var hasRun:Boolean = false;
         var reShowShuxing:Function = null;
         var $data:ByteArray = param1;
         reShowShuxing = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
         {
            if(hasRun)
            {
               return;
            }
            hasRun = true;
            PipeManager.sendMsg(PipeConstants.SHOW_ZHENQI_DOLL_PANEL);
         };
         ZLog.add("50710：接收灌注真气成功消息");
         hasRun = false;
         PipeManager.sendMsg(PipeConstants.HIDE_ALL_UI_EXCEPT_MAINUI);
         apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_JIADIAN),AvatarPartType.MAGIC);
         apd.extendCallBack(null,null,null,reShowShuxing);
         GameInstance.mainChar.loadAvatarPart(apd);
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"恭喜您成功灌入真气"),false);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"恭喜您成功灌入真气"),false);
      }
      
      public function received_50708(param1:ByteArray) : void
      {
         ZLog.add("50708：接收提取真气成功消息");
         var _loc2_:AvatarParamData = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_JIADIAN),AvatarPartType.MAGIC);
         GameInstance.mainChar.loadAvatarPart(_loc2_);
      }
   }
}

