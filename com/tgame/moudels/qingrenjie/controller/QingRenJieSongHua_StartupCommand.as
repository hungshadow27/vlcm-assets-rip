package com.tgame.moudels.qingrenjie.controller
{
   import com.tgame.moudels.qingrenjie.model.QingRenJieSongHua_MsgReceivedProxy;
   import com.tgame.moudels.qingrenjie.model.QingRenJieSongHua_MsgSenderProxy;
   import com.tgame.moudels.qingrenjie.view.QingRenJieSongHua_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class QingRenJieSongHua_StartupCommand extends SimpleCommand
   {
      
      public function QingRenJieSongHua_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerMediator(new QingRenJieSongHua_Mediator());
         facade.registerProxy(new QingRenJieSongHua_MsgReceivedProxy());
         facade.registerProxy(new QingRenJieSongHua_MsgSenderProxy());
      }
   }
}

