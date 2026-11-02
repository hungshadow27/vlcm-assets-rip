package com.tgame.moudels.xiantiangong.controller
{
   import com.tgame.moudels.xiantiangong.model.XianTianGong_MsgReceivedProxy;
   import com.tgame.moudels.xiantiangong.model.XianTianGong_MsgSenderProxy;
   import com.tgame.moudels.xiantiangong.view.XianTianGong_Mediator;
   import com.tgame.moudels.xiantiangong.view.XianTianGong_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XianTianGong_StartupCommand extends SimpleCommand
   {
      
      public function XianTianGong_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XianTianGong_MsgSenderProxy());
         facade.registerProxy(new XianTianGong_MsgReceivedProxy());
         facade.registerMediator(new XianTianGong_Mediator());
         facade.registerMediator(new XianTianGong_TargetMediator());
      }
   }
}

