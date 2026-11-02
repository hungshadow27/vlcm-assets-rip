package com.tgame.moudels.qixi.controller
{
   import com.tgame.moudels.qixi.model.QiXiJie_MsgReceivedProxy;
   import com.tgame.moudels.qixi.model.QiXiJie_MsgSendProxy;
   import com.tgame.moudels.qixi.view.QiXiJie_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class QiXiJie_StartupCommand extends SimpleCommand
   {
      
      public function QiXiJie_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new QiXiJie_MsgReceivedProxy());
         facade.registerProxy(new QiXiJie_MsgSendProxy());
         facade.registerMediator(new QiXiJie_Mediator());
      }
   }
}

