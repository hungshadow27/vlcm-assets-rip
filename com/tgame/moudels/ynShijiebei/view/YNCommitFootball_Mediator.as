package com.tgame.moudels.ynShijiebei.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ynShijiebei.model.YNshijiebei_MsgSendProxy;
   import com.tgame.shell.view.components.ynShijiebei.CommitFootball;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNCommitFootball_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNCommitFootball_Mediator";
      
      private var _senderProxy:YNshijiebei_MsgSendProxy;
      
      public function YNCommitFootball_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      private function get senderProxy() : YNshijiebei_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YNshijiebei_MsgSendProxy.NAME) as YNshijiebei_MsgSendProxy;
         }
         return this._senderProxy;
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
      
      public function get panel() : CommitFootball
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.yncommitfootballPanel);
         }
         return viewComponent as CommitFootball;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CommitFootball,function():void
         {
            panel.addEventListener(CommitFootball.UI_WORLDCUP_COMMITFOOTBALL_OK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CommitFootball,function():void
         {
            panel.removeEventListener(CommitFootball.UI_WORLDCUP_COMMITFOOTBALL_OK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         switch(param1.type)
         {
            case CommitFootball.UI_WORLDCUP_COMMITFOOTBALL_OK:
               _loc2_ = param1.data as Array;
               if(_loc2_[1] == 1 || _loc2_[1] == 5)
               {
                  this.senderProxy.send_73795(_loc2_[0]);
               }
               else if(_loc2_[1] == 7 || _loc2_[1] == 8)
               {
                  if(_loc2_[1] == 7)
                  {
                     _loc2_[1] = 1;
                  }
                  if(_loc2_[1] == 8)
                  {
                     _loc2_[1] = 2;
                  }
                  this.senderProxy.send_79441(_loc2_);
               }
               else if(_loc2_[1] == 9)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_YN_BOOK,_loc2_[0]);
               }
               else if(_loc2_[1] == 10)
               {
                  _loc3_ = int(_loc2_[0]);
                  PipeManager.sendMsg(PipeConstants.SEND_53095,[44,_loc3_]);
               }
               else if(_loc2_[1] == 11)
               {
                  _loc3_ = int(_loc2_[0]);
                  PipeManager.sendMsg(PipeConstants.SEND_YN_BOOK,_loc2_[0]);
               }
               else if(_loc2_[1] == 6)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_53095,[27,_loc2_[0]]);
               }
               else
               {
                  PipeManager.sendMsg(PipeConstants.SEND_53095,[12,_loc2_[0]]);
               }
         }
      }
   }
}

