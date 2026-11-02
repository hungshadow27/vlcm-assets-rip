package com.tgame.moudels.loadres.controller
{
   import com.tgame.moudels.loadres.LoadRes_ApplicationFacade;
   import com.tgame.moudels.loadres.model.LoadRes_MsgReceivedProxy;
   import com.tgame.moudels.loadres.model.LoadRes_ReLoadProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LoadRes_StartupCommand extends SimpleCommand
   {
      
      public function LoadRes_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerCommand(LoadRes_ApplicationFacade.LOAD_LAN,LoadRes_LoadLanCommand);
         facade.registerCommand(LoadRes_ApplicationFacade.LOAD_CONFIG,LoadRes_LoadConfigCommand);
         facade.registerCommand(LoadRes_ApplicationFacade.LOAD_SKIN,LoadRes_LoadSkinCommand);
         facade.registerCommand(LoadRes_ApplicationFacade.LOAD_LOGIN,LoadRes_LoadLoginCommand);
         facade.registerCommand(LoadRes_ApplicationFacade.LOAD_RSL,LoadRes_LoadRSLCommand);
         facade.registerCommand(LoadRes_ApplicationFacade.LOAD_XML,LoadRes_LoadXMLCommand);
         facade.registerProxy(new LoadRes_MsgReceivedProxy());
         facade.registerProxy(new LoadRes_ReLoadProxy());
         sendNotification(LoadRes_ApplicationFacade.LOAD_LAN);
      }
   }
}

