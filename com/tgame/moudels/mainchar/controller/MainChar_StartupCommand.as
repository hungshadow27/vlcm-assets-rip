package com.tgame.moudels.mainchar.controller
{
   import com.tgame.moudels.mainchar.MainChar_ApplicationFacade;
   import com.tgame.moudels.mainchar.model.MainChar_MainCharProxy;
   import com.tgame.moudels.mainchar.model.MainChar_MsgReceivedProxy;
   import com.tgame.moudels.mainchar.model.MainChar_MsgSenderProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class MainChar_StartupCommand extends SimpleCommand
   {
      
      public function MainChar_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new MainChar_MainCharProxy());
         facade.registerProxy(new MainChar_MsgReceivedProxy());
         facade.registerProxy(new MainChar_MsgSenderProxy());
         facade.registerCommand(MainChar_ApplicationFacade.SINGLE_CLICK,MainChar_SingleClickCommand);
         facade.registerCommand(MainChar_ApplicationFacade.TAB_SELECT,MainChar_TabSelectCommand);
      }
   }
}

