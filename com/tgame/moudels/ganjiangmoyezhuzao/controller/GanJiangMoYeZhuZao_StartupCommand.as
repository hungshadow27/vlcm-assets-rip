package com.tgame.moudels.ganjiangmoyezhuzao.controller
{
   import com.tgame.moudels.ganjiangmoyezhuzao.model.GanJiangMoYeZhuZao_MsgReceivedProxy;
   import com.tgame.moudels.ganjiangmoyezhuzao.model.GanJiangMoYeZhuZao_MsgSenderProxy;
   import com.tgame.moudels.ganjiangmoyezhuzao.view.GanJiangMoYeZhuZao_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class GanJiangMoYeZhuZao_StartupCommand extends SimpleCommand
   {
      
      public function GanJiangMoYeZhuZao_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerMediator(new GanJiangMoYeZhuZao_Mediator());
         facade.registerProxy(new GanJiangMoYeZhuZao_MsgReceivedProxy());
         facade.registerProxy(new GanJiangMoYeZhuZao_MsgSenderProxy());
      }
   }
}

