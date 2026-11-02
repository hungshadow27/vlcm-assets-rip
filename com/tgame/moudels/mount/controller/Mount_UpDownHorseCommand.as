package com.tgame.moudels.mount.controller
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.NewPlayerGuideType;
   import com.tgame.moudels.mount.model.Mount_MsgSenderProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Mount_UpDownHorseCommand extends SimpleCommand
   {
      
      public function Mount_UpDownHorseCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         if(GameInstance.mainCharData.isDiZi)
         {
            return;
         }
         var _loc2_:Mount_MsgSenderProxy = facade.retrieveProxy(Mount_MsgSenderProxy.NAME) as Mount_MsgSenderProxy;
         if(GameInstance.mainCharData.mountInfo.currentMountID != -1)
         {
            _loc2_.send_50035(GameInstance.mainCharData.mountInfo.currentMountID);
         }
         else
         {
            _loc2_.send_50033(-1);
            NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide17);
         }
      }
   }
}

