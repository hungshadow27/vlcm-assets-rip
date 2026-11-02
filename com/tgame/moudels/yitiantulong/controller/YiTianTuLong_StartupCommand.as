package com.tgame.moudels.yitiantulong.controller
{
   import com.tgame.moudels.yitiantulong.model.YiTianTuLong_MsgReceivedProxy;
   import com.tgame.moudels.yitiantulong.model.YiTianTuLong_MsgSenderProxy;
   import com.tgame.moudels.yitiantulong.view.YiTianTuLong_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YiTianTuLong_StartupCommand extends SimpleCommand
   {
      
      public function YiTianTuLong_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YiTianTuLong_MsgReceivedProxy());
         facade.registerProxy(new YiTianTuLong_MsgSenderProxy());
         facade.registerMediator(new YiTianTuLong_Mediator());
      }
   }
}

