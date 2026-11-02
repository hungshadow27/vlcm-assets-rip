package com.tgame.moudels.qingrenjiesonghuabang.controller
{
   import com.tgame.moudels.qingrenjiesonghuabang.model.QingRenJieSongHuaBang_MsgReceivedProxy;
   import com.tgame.moudels.qingrenjiesonghuabang.model.QingRenJieSongHuaBang_MsgSenderProxy;
   import com.tgame.moudels.qingrenjiesonghuabang.view.QingRenJieSongHuaBang_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class QingRenJieSongHuaBang_StartupCommand extends SimpleCommand
   {
      
      public function QingRenJieSongHuaBang_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerMediator(new QingRenJieSongHuaBang_Mediator());
         facade.registerProxy(new QingRenJieSongHuaBang_MsgReceivedProxy());
         facade.registerProxy(new QingRenJieSongHuaBang_MsgSenderProxy());
      }
   }
}

