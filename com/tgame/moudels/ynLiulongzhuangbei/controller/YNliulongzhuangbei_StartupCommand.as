package com.tgame.moudels.ynLiulongzhuangbei.controller
{
   import com.tgame.moudels.ynLiulongzhuangbei.model.YNliulongzhuangbei_MsgReceivedProxy;
   import com.tgame.moudels.ynLiulongzhuangbei.model.YNliulongzhuangbei_MsgSendProxy;
   import com.tgame.moudels.ynLiulongzhuangbei.view.YNliulongzhuangbeiTarget_Mediator;
   import com.tgame.moudels.ynLiulongzhuangbei.view.YNliulongzhuangbei_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YNliulongzhuangbei_StartupCommand extends SimpleCommand
   {
      
      public function YNliulongzhuangbei_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YNliulongzhuangbei_MsgReceivedProxy());
         facade.registerProxy(new YNliulongzhuangbei_MsgSendProxy());
         facade.registerMediator(new YNliulongzhuangbei_Mediator());
         facade.registerMediator(new YNliulongzhuangbeiTarget_Mediator());
      }
   }
}

