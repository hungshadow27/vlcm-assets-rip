package com.tgame.moudels.engine.controller
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.TopTipManager;
   import com.tgame.moudels.engine.model.Engine_MsgSenderProxy;
   import com.zcp.engine.events.SceneEvent;
   import com.zcp.engine.events.SceneEventAction_status;
   import com.zcp.engine.staticdata.CharStatusType;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Engine_SceneStatusCommand extends SimpleCommand
   {
      
      public function Engine_SceneStatusCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Engine_MsgSenderProxy = null;
         var _loc6_:String = null;
         var _loc2_:SceneEvent = param1.getBody() as SceneEvent;
         var _loc3_:String = _loc2_.action;
         _loc4_ = _loc2_.data;
         switch(_loc3_)
         {
            case SceneEventAction_status.CHANGED:
               _loc6_ = _loc4_[1];
               this.doWithStatus(_loc6_);
         }
      }
      
      private function doWithStatus(param1:String) : void
      {
         if(param1 == CharStatusType.DEATH || param1 == CharStatusType.SIT || param1 == CharStatusType.JUMP)
         {
            TopTipManager.getInstance().removeTip(MainCharSeachPathManager.AUTO_FIND_PATH_TEXT);
         }
         if(param1 == CharStatusType.WALK)
         {
            TSoundManager.playWalkSound(GameInstance.mainChar.isOnMount);
         }
         else
         {
            TSoundManager.stopWalkSound();
         }
      }
   }
}

