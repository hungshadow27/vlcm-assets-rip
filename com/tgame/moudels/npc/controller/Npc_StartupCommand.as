package com.tgame.moudels.npc.controller
{
   import com.tgame.moudels.npc.model.Npc_MsgReceivedProxy;
   import com.tgame.moudels.npc.model.Npc_MsgSenderProxy;
   import com.tgame.moudels.npc.view.Npc_ChuansongMediator;
   import com.tgame.moudels.npc.view.Npc_JiHuoXianTianWuJing;
   import com.tgame.moudels.npc.view.Npc_NpcDialogPlaneMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Npc_StartupCommand extends SimpleCommand
   {
      
      public function Npc_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Npc_MsgReceivedProxy());
         facade.registerProxy(new Npc_MsgSenderProxy());
         facade.registerMediator(new Npc_NpcDialogPlaneMediator());
         facade.registerMediator(new Npc_JiHuoXianTianWuJing());
         facade.registerMediator(new Npc_ChuansongMediator());
      }
   }
}

