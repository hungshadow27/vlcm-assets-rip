package com.tgame.moudels.loadres.controller
{
   import com.tgame.moudels.loadres.LoadRes_ApplicationFacade;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LoadRes_ShutdownCommand extends SimpleCommand
   {
      
      public function LoadRes_ShutdownCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.removeCommand(LoadRes_ApplicationFacade.LOAD_LAN);
         facade.removeCommand(LoadRes_ApplicationFacade.LOAD_CONFIG);
         facade.removeCommand(LoadRes_ApplicationFacade.LOAD_SKIN);
         facade.removeCommand(LoadRes_ApplicationFacade.LOAD_LOGIN);
         facade.removeCommand(LoadRes_ApplicationFacade.LOAD_RSL);
         facade.removeCommand(LoadRes_ApplicationFacade.LOAD_XML);
      }
   }
}

