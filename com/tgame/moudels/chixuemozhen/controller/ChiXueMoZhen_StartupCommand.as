package com.tgame.moudels.chixuemozhen.controller
{
   import com.tgame.moudels.chixuemozhen.model.ChiXueMoZhen_MsgReceivedProxy;
   import com.tgame.moudels.chixuemozhen.model.ChiXueMoZhen_MsgSenderProxy;
   import com.tgame.moudels.chixuemozhen.view.ChiXueMoZhen_MaincharPlaneMediator;
   import com.tgame.moudels.chixuemozhen.view.ChiXueMoZhen_TargetCharPlaneMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ChiXueMoZhen_StartupCommand extends SimpleCommand
   {
      
      public function ChiXueMoZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ChiXueMoZhen_MsgReceivedProxy());
         facade.registerProxy(new ChiXueMoZhen_MsgSenderProxy());
         facade.registerMediator(new ChiXueMoZhen_MaincharPlaneMediator());
         facade.registerMediator(new ChiXueMoZhen_TargetCharPlaneMediator());
      }
   }
}

