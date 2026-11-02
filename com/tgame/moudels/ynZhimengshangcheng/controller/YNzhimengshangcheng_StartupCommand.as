package com.tgame.moudels.ynZhimengshangcheng.controller
{
   import com.tgame.moudels.ynZhimengshangcheng.model.YNzhimengshangcheng_MsgReceivedProxy;
   import com.tgame.moudels.ynZhimengshangcheng.model.YNzhimengshangcheng_MsgSendProxy;
   import com.tgame.moudels.ynZhimengshangcheng.view.YNwangzhezhibang_Mediator;
   import com.tgame.moudels.ynZhimengshangcheng.view.YNzhimengshangcheng_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YNzhimengshangcheng_StartupCommand extends SimpleCommand
   {
      
      public function YNzhimengshangcheng_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YNzhimengshangcheng_MsgReceivedProxy());
         facade.registerProxy(new YNzhimengshangcheng_MsgSendProxy());
         facade.registerMediator(new YNzhimengshangcheng_Mediator());
         facade.registerMediator(new YNwangzhezhibang_Mediator());
      }
   }
}

