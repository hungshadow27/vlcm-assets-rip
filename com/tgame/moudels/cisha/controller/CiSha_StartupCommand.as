package com.tgame.moudels.cisha.controller
{
   import com.tgame.moudels.cisha.model.CiSha_MsgReceivedProxy;
   import com.tgame.moudels.cisha.model.CiSha_MsgSenderProxy;
   import com.tgame.moudels.cisha.view.CishaJiangMiLingDan_Mediator;
   import com.tgame.moudels.cisha.view.CishaJiangliLingqu_Mediator;
   import com.tgame.moudels.cisha.view.DiXiaQianZhuang_Mediator;
   import com.tgame.moudels.cisha.view.FuChouOKPanel_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class CiSha_StartupCommand extends SimpleCommand
   {
      
      public function CiSha_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new CiSha_MsgReceivedProxy());
         facade.registerProxy(new CiSha_MsgSenderProxy());
         facade.registerMediator(new FuChouOKPanel_Mediator());
         facade.registerMediator(new CishaJiangliLingqu_Mediator());
         facade.registerMediator(new CishaJiangMiLingDan_Mediator());
         facade.registerMediator(new DiXiaQianZhuang_Mediator());
      }
   }
}

