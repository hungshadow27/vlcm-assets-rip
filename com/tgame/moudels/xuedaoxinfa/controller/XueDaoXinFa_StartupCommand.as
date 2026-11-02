package com.tgame.moudels.xuedaoxinfa.controller
{
   import com.tgame.moudels.xuedaoxinfa.model.XueDaoXinFa_MsgReceivedProxy;
   import com.tgame.moudels.xuedaoxinfa.model.XueDaoXinFa_MsgSenderProxy;
   import com.tgame.moudels.xuedaoxinfa.view.XueDaoXinFa_Mediator;
   import com.tgame.moudels.xuedaoxinfa.view.XueDaoXinFa_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XueDaoXinFa_StartupCommand extends SimpleCommand
   {
      
      public function XueDaoXinFa_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XueDaoXinFa_MsgSenderProxy());
         facade.registerProxy(new XueDaoXinFa_MsgReceivedProxy());
         facade.registerMediator(new XueDaoXinFa_Mediator());
         facade.registerMediator(new XueDaoXinFa_TargetMediator());
      }
   }
}

