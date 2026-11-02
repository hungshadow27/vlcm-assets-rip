package com.tgame.moudels.qimenzhen.controller
{
   import com.tgame.moudels.qimenzhen.model.QiMenZhen_MsgReceivedProxy;
   import com.tgame.moudels.qimenzhen.model.QiMenZhen_MsgSenderProxy;
   import com.tgame.moudels.qimenzhen.view.QiMenZhen_PanelMediator;
   import com.tgame.moudels.qimenzhen.view.QiMenZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class QiMenZhen_StartupCommand extends SimpleCommand
   {
      
      public function QiMenZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new QiMenZhen_MsgReceivedProxy());
         facade.registerProxy(new QiMenZhen_MsgSenderProxy());
         facade.registerMediator(new QiMenZhen_PanelMediator());
         facade.registerMediator(new QiMenZhen_TargetPanelMediator());
      }
   }
}

