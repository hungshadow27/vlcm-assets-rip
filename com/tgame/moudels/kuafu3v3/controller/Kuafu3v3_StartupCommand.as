package com.tgame.moudels.kuafu3v3.controller
{
   import com.tgame.moudels.kuafu3v3.Kuafu3v3_ApplicationFacade;
   import com.tgame.moudels.kuafu3v3.model.Kuafu3v3_MsgReceivedProxy;
   import com.tgame.moudels.kuafu3v3.model.Kuafu3v3_MsgSenderProxy;
   import com.tgame.moudels.kuafu3v3.view.Kuafu3v3_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Kuafu3v3_StartupCommand extends SimpleCommand
   {
      
      public function Kuafu3v3_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerCommand(Kuafu3v3_ApplicationFacade.BA_QI,Kuafu3v3_BaqiCommand);
         facade.registerCommand(Kuafu3v3_ApplicationFacade.CHI_SHENFU,Kuafu3v3_ChiShenfuCommand);
         facade.registerProxy(new Kuafu3v3_MsgReceivedProxy());
         facade.registerProxy(new Kuafu3v3_MsgSenderProxy());
         facade.registerMediator(new Kuafu3v3_Mediator());
      }
   }
}

