package com.tgame.moudels.pickup.controller
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.pickup.model.PickUp_MsgSenderProxy;
   import com.zcp.engine.SceneRender;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class PickUp_AutoPickUpCommand extends SimpleCommand
   {
      
      private static var lastTime:int = 0;
      
      private static const PICK_UP_DELAY:int = 400;
      
      public function PickUp_AutoPickUpCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         if(GameState.SPACE_TO_SKILL)
         {
            PipeManager.sendMsg(PipeConstants.USE_SKILL,GameInstance.mainCharData.skillInfo.getSkillByID(OtherConst.JINCHANTUOQIAO_SKILL_ID));
            return;
         }
         if(GameInstance.mainCharData.afkInfo2.isStart)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"挂机中不支持空格拾取"));
            return;
         }
         if(SceneRender.nowTime - lastTime < PICK_UP_DELAY)
         {
            return;
         }
         lastTime = SceneRender.nowTime;
         var _loc2_:PickUp_MsgSenderProxy = facade.retrieveProxy(PickUp_MsgSenderProxy.NAME) as PickUp_MsgSenderProxy;
         _loc2_.send_11163(-1);
      }
   }
}

